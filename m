Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE76FC433FE
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7804.1639146168559860796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC22612FC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5677E3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 02/10] binutils: don't expect libtool to be host-prefixed
Date: Fri, 10 Dec 2021 14:22:34 +0000
Message-Id: <20211210142242.2698587-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159529

We update the libtool m4 files in binutils with the latest files from
our patched libtool so that we can use the --with-libtool-sysroot option.

Remove the chunks that are specific to the libtool renaming, which now
doesn't happen.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../binutils/0013-Use-libtool-2.4.patch       | 171 ------------------
 1 file changed, 171 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4=
.patch b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.pat=
ch
index a75e72105f2..8f87cfdb777 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
@@ -796,25 +796,6 @@ index daa51244369..79d0c4b4623 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7706,7 +8201,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7795,7 +8291,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -8093,8 +8589,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -2757,25 +2738,6 @@ index bf6461dab1e..8e6f6d30b4d 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7593,7 +8088,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7682,7 +8178,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -7980,8 +8476,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -4696,25 +4658,6 @@ index 789d1b38b33..7ac563a13ad 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7318,7 +7813,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7407,7 +7903,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -7705,8 +8201,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -6638,25 +6581,6 @@ index 5703bba4462..e1ac86ec797 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7220,7 +7715,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7309,7 +7805,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -7607,8 +8103,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -8597,25 +8521,6 @@ index 2aeb3317b65..5ef46d31558 100755
 =20
 =20
  # Set options
-@@ -8077,7 +8582,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -8166,7 +8672,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -8464,8 +8970,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -11220,25 +11125,6 @@ index 82bcf13a606..a7fb723a145 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8248,7 +8742,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -8337,7 +8832,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -8635,8 +9130,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -12422,16 +12308,6 @@ index 9a13f3b117a..5be47564443 100644
 =20
 =20
  # LT_PREREQ(VERSION)
-@@ -92,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
- AC_SUBST(LIBTOOL)dnl
-=20
- _LT_SETUP
 @@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffi=
x (normally "")])dnl
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -12446,15 +12322,6 @@ index 9a13f3b117a..5be47564443 100644
 =20
  _LT_CONFIG_LIBTOOL_INIT([
  # See if we are running on zsh, and set the options which allow our
-@@ -199,7 +205,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])confi=
g.lt[]dnl
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
@@ -20267,25 +20134,6 @@ index 3513e408ce1..133948631e9 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7470,7 +7965,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7559,7 +8055,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -7857,8 +8353,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
@@ -22209,25 +22057,6 @@ index 695819cd54b..14b5f28013a 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7300,7 +7795,8 @@ fi
- LIBTOOL_DEPS=3D"$ltmain"
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(SHELL) $(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
-=20
-=20
-=20
-@@ -7389,7 +7885,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a `.a' archive for static linking (except M=
SVC,
 @@ -7687,8 +8183,6 @@ fi
  lt_prog_compiler_pic=3D
  lt_prog_compiler_static=3D
--=20
2.25.1


