Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QhRcb-0003rN-Jt
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 21:30:54 +0200
Received: by wyg30 with SMTP id 30so428846wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 12:26:54 -0700 (PDT)
Received: by 10.216.220.212 with SMTP id o62mr15626wep.75.1310671613832;
	Thu, 14 Jul 2011 12:26:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gd1sm466419wbb.44.2011.07.14.12.26.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jul 2011 12:26:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310634132.2378.36.camel@phil-desktop>
Date: Thu, 14 Jul 2011 21:26:46 +0200
Message-Id: <6D6FE0B9-0A59-4376-972B-2262C766FDEF@dominion.thruhere.net>
References: <1310634132.2378.36.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH v2] insane: make GNU_HASH check slightly more robust (avoids false negatives with gold); add check for useless rpaths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2011 19:30:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jul 2011, om 11:02 heeft Phil Blundell het volgende geschreven:

> It isn't safe to make assumptions about the order of the entries in =
the dynamic section.  Fix the ldflags test to cope with the case where =
GNU_HASH comes before NEEDED and/or INIT.
>=20
> Also, add a new warning for binaries which contain useless (but =
benign) rpath entries pointing to the default search locations.

The new rpath warning is nice, but a bit too terse:

NOTE: package tinylogin-1.4-r7: task do_rm_work: Succeeded
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
WARNING: QA Issue: dynamic section contains probably-redundant RPATH =
/lib
NOTE: package shadow-4.1.4.3-r2: task do_package: Succeeded

I suspect it's shadow that has the rpaths, but I'm not sure. It think =
changing

> messages.append("dynamic section contains probably-redundant RPATH %s" =
% rpath)

to something like

> messages.append("dynamic section contains probably-redundant RPATH %s =
in %s" % (rpath, path))

Would improve things.

regards,

Koen

>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
> v2: fix typo in first version
>=20
> meta/classes/insane.bbclass |   44 =
++++++++++++++++++++++++++++++++----------
> 1 files changed, 33 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 8d5da00..c45f2cb 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -92,7 +92,7 @@ def package_qa_get_machine_dict():
>        }
>=20
>=20
> -WARN_QA ?=3D "dev-so rpaths debug-deps dev-deps debug-files arch la2 =
pkgconfig desktop la ldflags perms"
> +WARN_QA ?=3D "dev-so rpaths debug-deps dev-deps debug-files arch la2 =
pkgconfig desktop la ldflags perms useless-rpaths"
> ERROR_QA ?=3D ""
> #ERROR_QA ?=3D "rpaths debug-deps dev-deps debug-files arch pkgconfig =
perms"
>=20
> @@ -141,6 +141,31 @@ def package_qa_check_rpath(file,name, d, elf, =
messages):
>             if dir in line:
>                 messages.append("package %s contains bad RPATH %s in =
file %s" % (name, line, file))
>=20
> +QAPATHTEST[useless-rpaths] =3D "package_qa_check_useless_rpaths"
> +def package_qa_check_useless_rpaths(file,name, d, elf, messages):
> +    """
> +    Check for RPATHs that are useless but not dangerous
> +    """
> +    if not elf:
> +        return
> +
> +    objdump =3D bb.data.getVar('OBJDUMP', d, True)
> +    env_path =3D bb.data.getVar('PATH', d, True)
> +
> +    libdir =3D bb.data.getVar("libdir", d, True)
> +    base_libdir =3D bb.data.getVar("base_libdir", d, True)
> +
> +    import re
> +    rpath_re =3D re.compile("\s+RPATH\s+(.*)")
> +    for line in os.popen("LC_ALL=3DC PATH=3D%s %s -p '%s' 2> =
/dev/null" % (env_path, objdump, file), "r"):
> +    	m =3D rpath_re.match(line)
> +	if m:
> +	   rpath =3D m.group(1)
> +	   if rpath =3D=3D libdir or rpath =3D=3D base_libdir:
> +	      # The dynamic linker searches both these places anyway.  =
There is no point in
> +	      # looking there again.
> +	      messages.append("dynamic section contains =
probably-redundant RPATH %s" % rpath)
> +
> QAPATHTEST[dev-so] =3D "package_qa_check_dev"
> def package_qa_check_dev(path, name, d, elf, messages):
>     """
> @@ -238,22 +263,19 @@ def package_qa_hash_style(path, name, d, elf, =
messages):
>     objdump =3D bb.data.getVar('OBJDUMP', d, True)
>     env_path =3D bb.data.getVar('PATH', d, True)
>=20
> -    sane =3D True
> -    elf =3D False
> -    # A bit hacky. We do not know if path is an elf binary or not
> -    # we will search for 'NEEDED' or 'INIT' as this should be =
printed...
> -    # and come before the HASH section (guess!!!) and works on split =
out
> -    # debug symbols too
> +    sane =3D False
> +    has_syms =3D False
> +
> +    # If this binary has symbols, we expect it to have GNU_HASH too.
>     for line in os.popen("LC_ALL=3DC PATH=3D%s %s -p '%s' 2> =
/dev/null" % (env_path, objdump, path), "r"):
> -        if "NEEDED" in line or "INIT" in line:
> -            sane =3D False
> -            elf =3D True
> +        if "SYMTAB" in line:
> +            has_syms =3D True
>         if "GNU_HASH" in line:
>             sane =3D True
>         if "[mips32]" in line or "[mips64]" in line:
> 	    sane =3D True
>=20
> -    if elf and not sane:
> +    if has_syms and not sane:
>         messages.append("No GNU_HASH in the elf binary: '%s'" % path)
>=20
>=20
> --=20
> 1.7.4.1
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



