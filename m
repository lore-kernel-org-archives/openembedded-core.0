Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIJDz-0002HL-GJ
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 15:06:23 +0200
Received: by weyt44 with SMTP id t44so2367972wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2012 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y4fDwYNyfT847M/JVR+o97pcy1jDaW4yqEKSn9laiII=;
	b=0SZDcS1NUaV420Pk/HkUqJ2HZRQbA8iZg5lqPq2+QYF28xLBxZdtF3I3ZFca2y1HpD
	JgzRMwb3F64V6l1UynMG37UtC9ec5YmcSR6O13LaJDDNe59TwViB00BknIXQheTfMeZ+
	p8b6asyTwkX6BAImxNMvhyEqNcEloPHk6M5tx9iq0qegjvksCDSfN8DC3+U3lXRS/gX7
	Lw9hvhl3rHfdxK+BrsgXHk3sz9DCx+EJThnOggAkOvdZinW3G0HSHK4Nh6eFTBlz+kFk
	C+bjtMJqdh50JNAaGiJB4uH4S3jeIp4jD+zcc+FN/WW09ha9mDqsoI7VVjDXkJM6kcOb
	RPtA==
Received: by 10.180.74.33 with SMTP id q1mr8318765wiv.4.1349009607758;
	Sun, 30 Sep 2012 05:53:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm12148952wid.1.2012.09.30.05.53.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Sep 2012 05:53:26 -0700 (PDT)
Date: Sun, 30 Sep 2012 14:53:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120930125320.GA3419@jama.jama.net>
References: <1348938552-10963-1-git-send-email-Martin.Jansa@gmail.com>
	<1348939156-12048-1-git-send-email-Martin.Jansa@gmail.com>
	<20120930090635.GB3299@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120930090635.GB3299@jama.jama.net>
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
X-List-Received-Date: Sun, 30 Sep 2012 13:06:23 -0000
X-Groupsio-MsgNum: 30158
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 30, 2012 at 11:06:35AM +0200, Martin Jansa wrote:
> On Sat, Sep 29, 2012 at 07:19:16PM +0200, Martin Jansa wrote:
> > * http://code.google.com/p/opkg/issues/detail?id=3D94
>=20
> It needs a bit more testing, because for some reason I got
>=20
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for packagegroup-shr-minimal-x:
> |  * 	xserver-xorg (=3D =3D 2:1.11.2-r11) *
>=20
> armv4t/Package looks ok
> Package: xserver-xorg-module-exa
> Version: 2:1.11.2-r11
> Depends: xserver-xorg (=3D 2:1.11.2-r11), libc6 (>=3D 2.16)
>=20
> and it works on target..

Found it and updated patch in upstream bug tracker, will send v3 after
rebuilding from scratch..

Cheers,

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../0009-pkg_depends-fix-version-constraints.patch | 188 +++++++++++++=
++++++++
> >  ...depends-fix-version_constraints_satisfied.patch |  37 ++++
> >  meta/recipes-devtools/opkg/opkg_svn.bb             |   4 +-
> >  3 files changed, 228 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fi=
x-version-constraints.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fi=
x-version_constraints_satisfied.patch
> >=20
> > diff --git a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-versi=
on-constraints.patch b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix=
-version-constraints.patch
> > new file mode 100644
> > index 0000000..27df307
> > --- /dev/null
> > +++ b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-cons=
traints.patch
> > @@ -0,0 +1,188 @@
> > +From b6a4d289499ac4c4def48401edadd775eccc387c Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sat, 29 Sep 2012 11:38:03 +0200
> > +Subject: [PATCH 9/9] pkg_depends: fix version constraints
> > +
> > +* factor parsing version constraint to str_to_constraint and use that
> > +  from pkg (pkg_version_satisfied) and also pkg_depends (parseDepends)
> > +* fix constraint_to_str(), for EARLIER and LATER it was using '<' and
> > +  '>' which is parsed later as EARLIER_EQUAL and LATER_EQUAL
> > +* show notice when deprecated '<' or '>' is used
> > +
> > +Upstream-Status: Submitted
> > +http://code.google.com/p/opkg/issues/detail?id=3D94
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + libopkg/pkg.c         | 36 +++++++++++--------------
> > + libopkg/pkg_depends.c | 73 +++++++++++++++++++++++++++++-------------=
---------
> > + libopkg/pkg_depends.h |  1 +
> > + 3 files changed, 59 insertions(+), 51 deletions(-)
> > +
> > +diff --git a/libopkg/pkg.c b/libopkg/pkg.c
> > +index 255c673..1e98b9c 100644
> > +--- a/libopkg/pkg.c
> > ++++ b/libopkg/pkg.c
> > +@@ -968,28 +968,24 @@ pkg_version_satisfied(pkg_t *it, pkg_t *ref, con=
st char *op)
> > +      int r;
> > +=20
> > +      r =3D pkg_compare_versions(it, ref);
> > ++     char *op2 =3D op;
> > ++     enum version_constraint constraint =3D str_to_constraint(&op2);
> > +=20
> > +-     if (strcmp(op, "<=3D") =3D=3D 0 || strcmp(op, "<") =3D=3D 0) {
> > +-	  return r <=3D 0;
> > +-     }
> > +-
> > +-     if (strcmp(op, ">=3D") =3D=3D 0 || strcmp(op, ">") =3D=3D 0) {
> > +-	  return r >=3D 0;
> > +-     }
> > +-
> > +-     if (strcmp(op, "<<") =3D=3D 0) {
> > +-	  return r < 0;
> > +-     }
> > +-
> > +-     if (strcmp(op, ">>") =3D=3D 0) {
> > +-	  return r > 0;
> > +-     }
> > +-
> > +-     if (strcmp(op, "=3D") =3D=3D 0) {
> > +-	  return r =3D=3D 0;
> > ++     switch (constraint)=20
> > ++     {
> > ++     case EARLIER_EQUAL:
> > ++          return r <=3D 0;
> > ++     case LATER_EQUAL:
> > ++          return r >=3D 0;
> > ++     case EARLIER:
> > ++          return r < 0;
> > ++     case LATER:
> > ++          return r > 0;
> > ++     case EQUAL:
> > ++          return r =3D=3D 0;
> > ++     case NONE:
> > ++          opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> > +      }
> > +-
> > +-     opkg_msg(ERROR, "Unknown operator: %s.\n", op);
> > +      return 0;
> > + }
> > +=20
> > +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> > +index a72eed7..4b7a2a5 100644
> > +--- a/libopkg/pkg_depends.c
> > ++++ b/libopkg/pkg_depends.c
> > +@@ -781,7 +781,7 @@ constraint_to_str(enum version_constraint c)
> > + 	case NONE:
> > + 		return "";
> > + 	case EARLIER:
> > +-		return "< ";
> > ++		return "<< ";
> > + 	case EARLIER_EQUAL:
> > + 	       return "<=3D ";
> > + 	case EQUAL:
> > +@@ -789,12 +789,51 @@ constraint_to_str(enum version_constraint c)
> > + 	case LATER_EQUAL:
> > + 	      return ">=3D ";
> > + 	case LATER:
> > +-	     return "> ";
> > ++	     return ">> ";
> > + 	}
> > +=20
> > + 	return "";
> > + }
> > +=20
> > ++enum version_constraint
> > ++str_to_constraint(char **str)
> > ++{
> > ++	if(!strncmp(*str, "<<", 2)){
> > ++		*str +=3D 2;
> > ++		return EARLIER;
> > ++	}
> > ++	else if(!strncmp(*str, "<=3D", 2)){
> > ++		*str +=3D 2;
> > ++		return EARLIER_EQUAL;
> > ++	}
> > ++	else if(!strncmp(*str, ">=3D", 2)){
> > ++		*str +=3D 2;
> > ++		return LATER_EQUAL;
> > ++	}
> > ++	else if(!strncmp(*str, ">>", 2)){
> > ++		*str +=3D 2;
> > ++		return LATER;
> > ++	}
> > ++	else if(!strncmp(*str, "=3D", 1)){
> > ++		*str++;
> > ++		return EQUAL;
> > ++	}
> > ++	/* should these be here to support deprecated designations; dpkg doe=
s */
> > ++	else if(!strncmp(*str, "<", 1)){
> > ++		*str++;
> > ++		opkg_msg(NOTICE, "Deprecated version constraint '<' was used with t=
he same meaning as '<=3D'. Use '<<' for EARLIER constraint.\n");
> > ++		return EARLIER_EQUAL;
> > ++	}
> > ++	else if(!strncmp(*str, ">", 1)){
> > ++		*str++;
> > ++		opkg_msg(NOTICE, "Deprecated version constraint '>' was used with t=
he same meaning as '>=3D'. Use '>>' for LATER constraint.\n");
> > ++		return LATER_EQUAL;
> > ++	}
> > ++	else {
> > ++		return NONE;
> > ++	}
> > ++}
> > ++
> > + /*
> > +  * Returns a printable string for pkg's dependency at the specified i=
dx. The
> > +  * resultant string must be passed to free() by the caller.
> > +@@ -949,35 +988,7 @@ static int parseDepends(compound_depend_t *compou=
nd_depend,
> > + 	  /* extract constraint and version */
> > + 	  if(*src =3D=3D '('){
> > + 	       src++;
> > +-	       if(!strncmp(src, "<<", 2)){
> > +-		    possibilities[i]->constraint =3D EARLIER;
> > +-		    src +=3D 2;
> > +-	       }
> > +-	       else if(!strncmp(src, "<=3D", 2)){
> > +-		    possibilities[i]->constraint =3D EARLIER_EQUAL;
> > +-		    src +=3D 2;
> > +-	       }
> > +-	       else if(!strncmp(src, ">=3D", 2)){
> > +-		    possibilities[i]->constraint =3D LATER_EQUAL;
> > +-		    src +=3D 2;
> > +-	       }
> > +-	       else if(!strncmp(src, ">>", 2)){
> > +-		    possibilities[i]->constraint =3D LATER;
> > +-		    src +=3D 2;
> > +-	       }
> > +-	       else if(!strncmp(src, "=3D", 1)){
> > +-		    possibilities[i]->constraint =3D EQUAL;
> > +-		    src++;
> > +-	       }
> > +-	       /* should these be here to support deprecated designations; d=
pkg does */
> > +-	       else if(!strncmp(src, "<", 1)){
> > +-		    possibilities[i]->constraint =3D EARLIER_EQUAL;
> > +-		    src++;
> > +-	       }
> > +-	       else if(!strncmp(src, ">", 1)){
> > +-		    possibilities[i]->constraint =3D LATER_EQUAL;
> > +-		    src++;
> > +-	       }
> > ++	       possibilities[i]->constraint =3D str_to_constraint(&src);
> > +=20
> > + 	       /* now we have any constraint, pass space to version string */
> > + 	       while(isspace(*src)) src++;
> > +diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
> > +index ca0801f..685a722 100644
> > +--- a/libopkg/pkg_depends.h
> > ++++ b/libopkg/pkg_depends.h
> > +@@ -87,6 +87,7 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
> > + int pkg_dependence_satisfiable(depend_t *depend);
> > + int pkg_dependence_satisfied(depend_t *depend);
> > + const char* constraint_to_str(enum version_constraint c);
> > ++enum version_constraint str_to_constraint(char **str);
> > + int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
> > +=20
> > + #endif
> > +--=20
> > +1.7.12
> > +
> > diff --git a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-versi=
on_constraints_satisfied.patch b/meta/recipes-devtools/opkg/opkg/0010-pkg_d=
epends-fix-version_constraints_satisfied.patch
> > new file mode 100644
> > index 0000000..841b508
> > --- /dev/null
> > +++ b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_cons=
traints_satisfied.patch
> > @@ -0,0 +1,37 @@
> > +From 51a45a02a32064c14e0d4d6ef41c1a6276432b29 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sat, 29 Sep 2012 18:56:01 +0200
> > +Subject: [PATCH 10/10] pkg_depends: fix version_constraints_satisfied
> > +
> > +* with
> > +  Package: a
> > +  Version: 1
> > +  and
> > +  Conflicts: a (<< 1)
> > +  we have comparison =3D=3D 0, but constraint EARLIER is not satisfied!
> > +
> > +Upstream-Status: Submitted
> > +http://code.google.com/p/opkg/issues/detail?id=3D94
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + libopkg/pkg_depends.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
> > +index 4b7a2a5..a67579a 100644
> > +--- a/libopkg/pkg_depends.c
> > ++++ b/libopkg/pkg_depends.c
> > +@@ -464,7 +464,8 @@ int version_constraints_satisfied(depend_t * depen=
ds, pkg_t * pkg)
> > +     else if((depends->constraint =3D=3D LATER) &&
> > + 	    (comparison > 0))
> > + 	return 1;
> > +-    else if(comparison =3D=3D 0)
> > ++    else if((depends->constraint =3D=3D EQUAL) &&=20
> > ++	    (comparison =3D=3D 0))
> > + 	return 1;
> > +     else if((depends->constraint =3D=3D LATER_EQUAL) &&
> > + 	    (comparison >=3D 0))
> > +--=20
> > +1.7.12
> > +
> > diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devt=
ools/opkg/opkg_svn.bb
> > index 820a224..d89a3f6 100644
> > --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> > +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> > @@ -9,6 +9,8 @@ SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtru=
nk;protocol=3Dhttp \
> >    file://0006-detect-circular-dependencies.patch \
> >    file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.pat=
ch \
> >    file://0008-select_higher_version.patch \
> > +  file://0009-pkg_depends-fix-version-constraints.patch \
> > +  file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
> >  "
> > =20
> >  S =3D "${WORKDIR}/trunk"
> > @@ -16,4 +18,4 @@ S =3D "${WORKDIR}/trunk"
> >  SRCREV =3D "633"
> >  PV =3D "0.1.8+svnr${SRCPV}"
> > =20
> > -PR =3D "${INC_PR}.4"
> > +PR =3D "${INC_PR}.5"
> > --=20
> > 1.7.12
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBoQMAACgkQN1Ujt2V2gBzlUwCbBBZVjuV5RAppu04lDHhza6Fl
RNkAoIyp8EkyyL5S/zzcv7kDc1XpJfaZ
=xzwr
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
