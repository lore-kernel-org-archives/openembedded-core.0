Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIFgD-0006gX-EW
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 11:19:17 +0200
Received: by wibhj13 with SMTP id hj13so1131297wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2012 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UzJJSL92pVooJRlexXFIeLodbzHD7jPHMgIFbZ5h6DE=;
	b=jTuoOjLo3Buq/LUDKu6eJ7TTqIr7AR0piCUHihD+zgbfn9EbCnv/V37KdvxiRebU1D
	jKtV4eFoIyrFAL4GJWAD10NdOySx4xKqJYSAWt58O7dsWuHGMoQhZ1yQvbRedabOhAMf
	BXzGnRLMfVfit1+xSjepoFtbUtzOCP5sZB5spf3QNLtgkcacRl0kaLXNc1KixwmOUjA0
	opZfHwddoiIaBotRuuRlTcKCSA7VZPJN0DBAc8YgOUkYMH+wz/m2AjCywjHhaYKH/dK5
	xA9Yoyt28KI8klqrDi2c6aRnwWzYx6FvH73fQEGUlJ6klJsVZRLFS44Iq4IDJ9tjjrM0
	yO/w==
Received: by 10.216.70.13 with SMTP id o13mr6425745wed.184.1348995981927;
	Sun, 30 Sep 2012 02:06:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm9653675wix.9.2012.09.30.02.06.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Sep 2012 02:06:21 -0700 (PDT)
Date: Sun, 30 Sep 2012 11:06:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120930090635.GB3299@jama.jama.net>
References: <1348938552-10963-1-git-send-email-Martin.Jansa@gmail.com>
	<1348939156-12048-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1348939156-12048-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] opkg: fix version constraints in conflicts, depends, replaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2012 09:19:17 -0000
X-Groupsio-MsgNum: 30156
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2012 at 07:19:16PM +0200, Martin Jansa wrote:
> * http://code.google.com/p/opkg/issues/detail?id=3D94

It needs a bit more testing, because for some reason I got

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-shr-minimal-x:
|  * 	xserver-xorg (=3D =3D 2:1.11.2-r11) *

armv4t/Package looks ok
Package: xserver-xorg-module-exa
Version: 2:1.11.2-r11
Depends: xserver-xorg (=3D 2:1.11.2-r11), libc6 (>=3D 2.16)

and it works on target..

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0009-pkg_depends-fix-version-constraints.patch | 188 +++++++++++++++=
++++++
>  ...depends-fix-version_constraints_satisfied.patch |  37 ++++
>  meta/recipes-devtools/opkg/opkg_svn.bb             |   4 +-
>  3 files changed, 228 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-=
version-constraints.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-=
version_constraints_satisfied.patch
>=20
> diff --git a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version=
-constraints.patch b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-v=
ersion-constraints.patch
> new file mode 100644
> index 0000000..27df307
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constr=
aints.patch
> @@ -0,0 +1,188 @@
> +From b6a4d289499ac4c4def48401edadd775eccc387c Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 29 Sep 2012 11:38:03 +0200
> +Subject: [PATCH 9/9] pkg_depends: fix version constraints
> +
> +* factor parsing version constraint to str_to_constraint and use that
> +  from pkg (pkg_version_satisfied) and also pkg_depends (parseDepends)
> +* fix constraint_to_str(), for EARLIER and LATER it was using '<' and
> +  '>' which is parsed later as EARLIER_EQUAL and LATER_EQUAL
> +* show notice when deprecated '<' or '>' is used
> +
> +Upstream-Status: Submitted
> +http://code.google.com/p/opkg/issues/detail?id=3D94
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libopkg/pkg.c         | 36 +++++++++++--------------
> + libopkg/pkg_depends.c | 73 +++++++++++++++++++++++++++++---------------=
-------
> + libopkg/pkg_depends.h |  1 +
> + 3 files changed, 59 insertions(+), 51 deletions(-)
> +
> +diff --git a/libopkg/pkg.c b/libopkg/pkg.c
> +index 255c673..1e98b9c 100644
> +--- a/libopkg/pkg.c
> ++++ b/libopkg/pkg.c
> +@@ -968,28 +968,24 @@ pkg_version_satisfied(pkg_t *it, pkg_t *ref, const=
 char *op)
> +      int r;
> +=20
> +      r =3D pkg_compare_versions(it, ref);
> ++     char *op2 =3D op;
> ++     enum version_constraint constraint =3D str_to_constraint(&op2);
> +=20
> +-     if (strcmp(op, "<=3D") =3D=3D 0 || strcmp(op, "<") =3D=3D 0) {
> +-	  return r <=3D 0;
> +-     }
> +-
> +-     if (strcmp(op, ">=3D") =3D=3D 0 || strcmp(op, ">") =3D=3D 0) {
> +-	  return r >=3D 0;
> +-     }
> +-
> +-     if (strcmp(op, "<<") =3D=3D 0) {
> +-	  return r < 0;
> +-     }
> +-
> +-     if (strcmp(op, ">>") =3D=3D 0) {
> +-	  return r > 0;
> +-     }
> +-
> +-     if (strcmp(op, "=3D") =3D=3D 0) {
> +-	  return r =3D=3D 0;
> ++     switch (constraint)=20
> ++     {
> ++     case EARLIER_EQUAL:
> ++          return r <=3D 0;
> ++     case LATER_EQUAL:
> ++          return r >=3D 0;
> ++     case EARLIER:
> ++          return r < 0;
> ++     case LATER:
> ++          return r > 0;
> ++     case EQUAL:
> ++          return r =3D=3D 0;
> ++     case NONE:
> ++          opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> +      }
> +-
> +-     opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> +      return 0;
> + }
> +=20
> +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> +index a72eed7..4b7a2a5 100644
> +--- a/libopkg/pkg_depends.c
> ++++ b/libopkg/pkg_depends.c
> +@@ -781,7 +781,7 @@ constraint_to_str(enum version_constraint c)
> + 	case NONE:
> + 		return "";
> + 	case EARLIER:
> +-		return "< ";
> ++		return "<< ";
> + 	case EARLIER_EQUAL:
> + 	       return "<=3D ";
> + 	case EQUAL:
> +@@ -789,12 +789,51 @@ constraint_to_str(enum version_constraint c)
> + 	case LATER_EQUAL:
> + 	      return ">=3D ";
> + 	case LATER:
> +-	     return "> ";
> ++	     return ">> ";
> + 	}
> +=20
> + 	return "";
> + }
> +=20
> ++enum version_constraint
> ++str_to_constraint(char **str)
> ++{
> ++	if(!strncmp(*str, "<<", 2)){
> ++		*str +=3D 2;
> ++		return EARLIER;
> ++	}
> ++	else if(!strncmp(*str, "<=3D", 2)){
> ++		*str +=3D 2;
> ++		return EARLIER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">=3D", 2)){
> ++		*str +=3D 2;
> ++		return LATER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">>", 2)){
> ++		*str +=3D 2;
> ++		return LATER;
> ++	}
> ++	else if(!strncmp(*str, "=3D", 1)){
> ++		*str++;
> ++		return EQUAL;
> ++	}
> ++	/* should these be here to support deprecated designations; dpkg does =
*/
> ++	else if(!strncmp(*str, "<", 1)){
> ++		*str++;
> ++		opkg_msg(NOTICE, "Deprecated version constraint '<' was used with the=
 same meaning as '<=3D'. Use '<<' for EARLIER constraint.\n");
> ++		return EARLIER_EQUAL;
> ++	}
> ++	else if(!strncmp(*str, ">", 1)){
> ++		*str++;
> ++		opkg_msg(NOTICE, "Deprecated version constraint '>' was used with the=
 same meaning as '>=3D'. Use '>>' for LATER constraint.\n");
> ++		return LATER_EQUAL;
> ++	}
> ++	else {
> ++		return NONE;
> ++	}
> ++}
> ++
> + /*
> +  * Returns a printable string for pkg's dependency at the specified idx=
=2E The
> +  * resultant string must be passed to free() by the caller.
> +@@ -949,35 +988,7 @@ static int parseDepends(compound_depend_t *compound=
_depend,
> + 	  /* extract constraint and version */
> + 	  if(*src =3D=3D '('){
> + 	       src++;
> +-	       if(!strncmp(src, "<<", 2)){
> +-		    possibilities[i]->constraint =3D EARLIER;
> +-		    src +=3D 2;
> +-	       }
> +-	       else if(!strncmp(src, "<=3D", 2)){
> +-		    possibilities[i]->constraint =3D EARLIER_EQUAL;
> +-		    src +=3D 2;
> +-	       }
> +-	       else if(!strncmp(src, ">=3D", 2)){
> +-		    possibilities[i]->constraint =3D LATER_EQUAL;
> +-		    src +=3D 2;
> +-	       }
> +-	       else if(!strncmp(src, ">>", 2)){
> +-		    possibilities[i]->constraint =3D LATER;
> +-		    src +=3D 2;
> +-	       }
> +-	       else if(!strncmp(src, "=3D", 1)){
> +-		    possibilities[i]->constraint =3D EQUAL;
> +-		    src++;
> +-	       }
> +-	       /* should these be here to support deprecated designations; dpk=
g does */
> +-	       else if(!strncmp(src, "<", 1)){
> +-		    possibilities[i]->constraint =3D EARLIER_EQUAL;
> +-		    src++;
> +-	       }
> +-	       else if(!strncmp(src, ">", 1)){
> +-		    possibilities[i]->constraint =3D LATER_EQUAL;
> +-		    src++;
> +-	       }
> ++	       possibilities[i]->constraint =3D str_to_constraint(&src);
> +=20
> + 	       /* now we have any constraint, pass space to version string */
> + 	       while(isspace(*src)) src++;
> +diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
> +index ca0801f..685a722 100644
> +--- a/libopkg/pkg_depends.h
> ++++ b/libopkg/pkg_depends.h
> +@@ -87,6 +87,7 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
> + int pkg_dependence_satisfiable(depend_t *depend);
> + int pkg_dependence_satisfied(depend_t *depend);
> + const char* constraint_to_str(enum version_constraint c);
> ++enum version_constraint str_to_constraint(char **str);
> + int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
> +=20
> + #endif
> +--=20
> +1.7.12
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version=
_constraints_satisfied.patch b/meta/recipes-devtools/opkg/opkg/0010-pkg_dep=
ends-fix-version_constraints_satisfied.patch
> new file mode 100644
> index 0000000..841b508
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constr=
aints_satisfied.patch
> @@ -0,0 +1,37 @@
> +From 51a45a02a32064c14e0d4d6ef41c1a6276432b29 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 29 Sep 2012 18:56:01 +0200
> +Subject: [PATCH 10/10] pkg_depends: fix version_constraints_satisfied
> +
> +* with
> +  Package: a
> +  Version: 1
> +  and
> +  Conflicts: a (<< 1)
> +  we have comparison =3D=3D 0, but constraint EARLIER is not satisfied!
> +
> +Upstream-Status: Submitted
> +http://code.google.com/p/opkg/issues/detail?id=3D94
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libopkg/pkg_depends.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> +index 4b7a2a5..a67579a 100644
> +--- a/libopkg/pkg_depends.c
> ++++ b/libopkg/pkg_depends.c
> +@@ -464,7 +464,8 @@ int version_constraints_satisfied(depend_t * depends=
, pkg_t * pkg)
> +     else if((depends->constraint =3D=3D LATER) &&
> + 	    (comparison > 0))
> + 	return 1;
> +-    else if(comparison =3D=3D 0)
> ++    else if((depends->constraint =3D=3D EQUAL) &&=20
> ++	    (comparison =3D=3D 0))
> + 	return 1;
> +     else if((depends->constraint =3D=3D LATER_EQUAL) &&
> + 	    (comparison >=3D 0))
> +--=20
> +1.7.12
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index 820a224..d89a3f6 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -9,6 +9,8 @@ SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk=
;protocol=3Dhttp \
>    file://0006-detect-circular-dependencies.patch \
>    file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch=
 \
>    file://0008-select_higher_version.patch \
> +  file://0009-pkg_depends-fix-version-constraints.patch \
> +  file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
>  "
> =20
>  S =3D "${WORKDIR}/trunk"
> @@ -16,4 +18,4 @@ S =3D "${WORKDIR}/trunk"
>  SRCREV =3D "633"
>  PV =3D "0.1.8+svnr${SRCPV}"
> =20
> -PR =3D "${INC_PR}.4"
> +PR =3D "${INC_PR}.5"
> --=20
> 1.7.12
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBoC5sACgkQN1Ujt2V2gBwe5gCgiAv9Wp65OBi5MMpZmunt6fmF
FQgAnj7qnKN1MlWvmCa1ZKOGpANsoede
=19JS
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
