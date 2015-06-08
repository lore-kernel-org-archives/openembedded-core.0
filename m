Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 307B86AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 12:43:08 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so84961970wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Hey6lasDSflJ4JI75MqhBja4fraCERRLhtfGgwgNjw4=;
	b=LRWo5NldL/KARdgH45vFmX3hhA8etSxmkPu1cKZ8CN33VwKbDsWbVahL/NWQISxXoF
	iLYfky1pyscCuctcwZnyXiYcej635w8kMjmReoiiyEyIJk82FIx9CPtyjs+AFkvSmm5C
	06ex57T3cgaxncO9eiFRByzKK7t921ozt/6C0MBNqk5FPAlN9IYa0ksgcykj/54t98n9
	FbR7jo5BqUSfda4Hh6X36WfTddhdjUHNrfvjsIfnZHorl84GLmbfB0Q+PRyNXR+qHMpg
	D6Y4mC4Zsuvw6wUh03X6IW1PBfgrx1/DyJvfEW8/f4wmVTov0L7dYAWqreVh/xaD39rS
	EoJg==
X-Received: by 10.180.83.135 with SMTP id q7mr21477577wiy.17.1433767389290;
	Mon, 08 Jun 2015 05:43:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fb3sm834060wib.21.2015.06.08.05.43.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 05:43:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Jun 2015 14:43:13 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150608124313.GB2384@jama>
References: <1433661612.28975.63.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1433661612.28975.63.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Add eventhandler which cleans up stale recipe data
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jun 2015 12:43:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2015 at 08:20:12AM +0100, Richard Purdie wrote:
> "Incremental builds do not work well when renaming recipes or changing
> architecture" is a long standing issue which causes people considerable
> pain. We've struggled for a long time to come up with a way to
> generically address the problem.
>=20
> There are additional issues where removal of a layer caused data to
> continue to exist and additionally, changing DISTRO_FEATURES also caused
> problems in an existing TMPDIR.
>=20
> This patch attempts to address this by adding a mapping between stamp
> files and manifests. After parsing we can easily tell which stamp files
> are still reachable, if any manifest has a stamp that can no longer be
> reached, we can remove it. Since this code ties this to the sstate
> architecture list, it will not remove data from other than the current
> MACHINE (and its active architectures). It does not clean the sstate
> cache so if another build activates something which was cleaned, it
> should reinstall from sstate.
>=20
> We can also go one step further, depending on the setting of
> SSTATE_PRUNE_OBSOLETEWORKDIR, workdirs which are no longer active can
> also be removed. This avoids the buildup of many old copies of data in
> WORKDIR for example when versions are upgraded.
>=20
> The one thing which may surprise people with this change is if you
> remove a layer, data added by that layer will be "uninstalled" before
> the next build continues. I believe this is a feature and a good thing
> to do though.
>=20
> This code is safe with existing builds. If something isn't in the new
> index it simply isn't removed. Since changes to the sstate code trigger
> a rebuild, after this merges, we can assume the code will start to
> detect changes from that point onwards.
>=20
> [Right now this is an RFC, it appeared to do the right things in some
> brief local tests and I am pretty excited that this could solve a long
> standing usability issue in a clean and effective way. There is a bug
> related to DISTRO_FEATURES changes right now since even skipped recipes
> will still show active stamps meaning systemd isn't removed from a
> sysvinit build and vice versa. I should be able to fix that next week
> before merging. This patch depends on the patch on the bitbake list for
> the event it needs. Before merging I will bump version number
> requirements to ensure people have it. I also want to improve the log
> output so it tells users what its doing rather than the obtuse
> bb.error().]
>=20
> [YOCTO #4102]

Thanks RP, good work, I'm cherry-picking both changes for my next world
build.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 949ba4a..c5a974a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -33,6 +33,15 @@ SSTATE_SCAN_CMD ?=3D 'find ${SSTATE_BUILDDIR} \( -name=
 "${@"\" -o -name \"".join(d
> =20
>  BB_HASHFILENAME =3D "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSP=
EC}"
> =20
> +SSTATE_ARCHS =3D " \
> +    ${BUILD_ARCH} \
> +    ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
> +    ${BUILD_ARCH}_${TARGET_ARCH} \
> +    ${SDK_ARCH}_${SDK_OS} \
> +    ${SDK_ARCH}_${PACKAGE_ARCH} \
> +    allarch \
> +    ${PACKAGE_ARCH}"
> +
>  SSTATE_MANMACH ?=3D "${SSTATE_PKGARCH}"
> =20
>  SSTATECREATEFUNCS =3D "sstate_hardcode_path"
> @@ -233,6 +242,20 @@ def sstate_install(ss, d):
>          f.write(di + "\n")
>      f.close()
> =20
> +    # Append to the list of manifests for this PACKAGE_ARCH
> +
> +    i =3D d.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
> +    l =3D bb.utils.lockfile(i + ".lock")
> +    filedata =3D d.getVar("STAMP", True) + " " + d.getVar("SSTATE_MANFIL=
EPREFIX", True) + " " + d.getVar("WORKDIR", True) + "\n"
> +    manifests =3D []
> +    if os.path.exists(i):
> +        with open(i, "r") as f:
> +            manifests =3D f.readlines()
> +    if filedata not in manifests:
> +        with open(i, "a+") as f:
> +            f.write(filedata)
> +    bb.utils.unlockfile(l)
> +
>      # Run the actual file install
>      for state in ss['dirs']:
>          if os.path.exists(state[1]):
> @@ -858,3 +881,41 @@ python sstate_eventhandler() {
>          bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".s=
iginfo", d)
>  }
> =20
> +SSTATE_PRUNE_OBSOLETEWORKDIR =3D "1"
> +
> +# Event handler which removes manifests and stamps file for
> +# recipes which are no longer reachable in a build where they
> +# once were.
> +# Also optionally removes the workdir of those tasks/recipes
> +#
> +addhandler sstate_eventhandler2
> +sstate_eventhandler2[eventmask] =3D "bb.event.ReachableStamps"
> +python sstate_eventhandler2() {
> +    import glob
> +    d =3D e.data
> +    stamps =3D e.stamps.values()
> +    toremove =3D []
> +    removeworkdir =3D (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR") =3D=3D "=
1")
> +    for a in d.getVar("SSTATE_ARCHS", True).split():
> +        i =3D d.expand("${SSTATE_MANIFESTS}/index-" + a)
> +        if not os.path.exists(i):
> +            continue
> +        with open(i, "r") as f:
> +            lines =3D f.readlines()
> +            for l in lines:
> +                (stamp, manifest, workdir) =3D l.split()
> +                if stamp not in stamps:
> +                    toremove.append(l)
> +                    bb.error("Stamp %s is not reachable" % stamp)
> +        for r in toremove:
> +            (stamp, manifest, workdir) =3D r.split()
> +            for m in glob.glob(manifest + ".*"):
> +                sstate_clean_manifest(m, d)
> +            bb.utils.remove(stamp + "*")
> +            if removeworkdir:
> +                bb.utils.remove(workdir, recurse =3D True)
> +            lines.remove(r)
> +        with open(i, "w") as f:
> +            for l in lines:
> +                f.write(l)
> +}
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

