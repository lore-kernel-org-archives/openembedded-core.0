Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 04D2473BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 13:46:32 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so250749327wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CuQDszzzsaQ5Nt78D84yAz45nhldBLfuXNqUZxSgh4g=;
	b=W13aCUok5td3cX2Mos/ph8bVHPxS6mAvLj8/dOBGS5MvT3LHiAORsSBvd8kJZxC4Pj
	9HcXZMr/3qwz1GlUgq8viNOI/0gEDoLb7jfsz3yAoO+pcTq+rPDZM8Aff1QK9uUaSbEn
	oFZV2dWWyIB0pc8ej+r91xS4aHkEKrWd5YzazfujXK3tweRAf5I9/hXcJENhvKTueOV9
	I+eFp5/h87KWUAhAYNW/YbVJL0fK9PQ6hz6QjwEYQNV5A7ShQJAHw3MbTrR1u6bOhoCe
	UM0uoQ1bKSmZ3Q05w99xwAsmRLmNcp+UahefwaiAovUbuWKSTfM4+wUy3n8TF48I7Qsl
	MI5A==
X-Received: by 10.180.108.112 with SMTP id hj16mr9970876wib.41.1443102391986; 
	Thu, 24 Sep 2015 06:46:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id pl7sm5575645wic.4.2015.09.24.06.46.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 06:46:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Sep 2015 15:46:50 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150924134650.GA2397@jama>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
	<1443024836-20974-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1443024836-20974-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] sanity.bbclass: show warning when chmod fails
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
X-List-Received-Date: Thu, 24 Sep 2015 13:46:34 -0000
X-Groupsio-MsgNum: 71557
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 06:13:56PM +0200, Martin Jansa wrote:
> From: Alex Franco <alejandro.franco@linux.intel.com>
>=20
> * for some reason this part of:
>   http://patchwork.openembedded.org/patch/102561/
>   wasn't ever merged.

I've changed the configuration on my jenkins servers, so that now it
doesn't fail.

In case someone needs that as well then you need to use mode, uid and
git parameters for mounting tmpfs, e.g.

none /home/jenkins/oe/world/shr-core/tmp-glibc/ tmpfs noatime,nodev,nosuid,=
size=3D74G,mode=3D777,users,exec,uid=3D3004,gid=3D3004 0 0

where 3004 is uid and gid of jenkins user which is running the bitbake.



This change is still needed, because following exception shows so much about
bbclass sanity, that average user will get confused and eventually insane.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "check_sanity_eventhandler(e)", line 6, in check_sanity_eventhandler=
(e=3D<bb.event.SanityCheck object at 0x57ec3d0>)
  File "sanity.bbclass", line 34, in check_sanity(sanity_data=3D<bb.data_sm=
art.DataSmart object at 0x57d5e10>)
  File "sanity.bbclass", line 155, in check_sanity_everybuild(status=3D<San=
ityStatus object at 0x57d5490>, d=3D<bb.data_smart.DataSmart object at 0x57=
d5e10>)
OSError: [Errno 1] Operation not permitted: '/home/jenkins/workspace/luneos=
-unstable/webos-ports/tmp-glibc'

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/jenkins/workspace/luneos-unstable/webos-ports/bitbake/lib/bb/=
command.py", line 101, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/jenkins/workspace/luneos-unstable/webos-ports/bitbake/lib/bb/=
cooker.py", line 1503, in updateCache
    bb.event.fire(bb.event.SanityCheck(False), self.data)
  File "/home/jenkins/workspace/luneos-unstable/webos-ports/bitbake/lib/bb/=
event.py", line 170, in fire
    fire_class_handlers(event, d)
  File "/home/jenkins/workspace/luneos-unstable/webos-ports/bitbake/lib/bb/=
event.py", line 109, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/jenkins/workspace/luneos-unstable/webos-ports/bitbake/lib/bb/=
event.py", line 81, in execute_handler
    ret =3D handler(event)
  File "check_sanity_eventhandler(e)", line 6, in check_sanity_eventhandler
  File "sanity.bbclass", line 34, in check_sanity
  File "sanity.bbclass", line 155, in check_sanity_everybuild
OSError: [Errno 1] Operation not permitted: '/home/jenkins/workspace/luneos=
-unstable/webos-ports/tmp-glibc'


Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
Command exited with non-zero status 1


>=20
> [YOCTO #7669]
>=20
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 2eb744f..34f8618 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -839,9 +839,12 @@ def check_sanity_everybuild(status, d):
>      else:
>          bb.utils.mkdirhier(tmpdir)
>          # Remove setuid, setgid and sticky bits from TMPDIR
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
> +        try:
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
> +        except OSError:
> +            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
>          with open(checkfile, "w") as f:
>              f.write(tmpdir)
> =20
> --=20
> 2.5.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYD/sgACgkQN1Ujt2V2gBy7NACgqX43onoCK2mZNOjxlQsXPjmj
g8EAoIdiTbGEPaX/QNswmCzrDgFl0O8R
=3akC
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
