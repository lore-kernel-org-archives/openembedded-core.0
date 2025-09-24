Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0C3CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:07:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10832.1758715670454630692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5C2B497
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7AD553F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] lame: don't use -march=native when building with clang
Date: Wed, 24 Sep 2025 13:07:35 +0100
Message-ID: <20250924120745.2883969-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223962

Because of a logic error, lame's configure always passes -march=3Dnative
when building with clang.

This is a terrible idea in general as it's not often your build machine
and target hardware aligns, and leads to some amusing errors:

  unknown target CPU 'neoverse-n1'
  note: valid target CPU values are: i386, i486, ...

Move the HAVE_CLANG block up into the FULL_OPTIMIZATION case, alongside
HAVE_GCC.  This option is never enabled (as it's basically "use native")
so resolves the build failure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/lame/lame/clang.patch | 99 +++++++++++++++++++
 meta/recipes-multimedia/lame/lame_3.100.bb    |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/lame/lame/clang.patch

diff --git a/meta/recipes-multimedia/lame/lame/clang.patch b/meta/recipes=
-multimedia/lame/lame/clang.patch
new file mode 100644
index 00000000000..116000c577b
--- /dev/null
+++ b/meta/recipes-multimedia/lame/lame/clang.patch
@@ -0,0 +1,99 @@
+Don't use -march=3Dnative when building with clang
+
+Because of a logic error, lame's configure always passes -march=3Dnative
+when building with clang.
+
+This is a terrible idea in general as it's not often your build machine
+and target hardware aligns, and leads to some amusing errors:
+
+	unknown target CPU 'neoverse-n1'
+	note: valid target CPU values are: i386, i486, ...
+
+Move the HAVE_CLANG block up into the FULL_OPTIMIZATION case, alongside
+HAVE_GCC.  This option is never enabled (as it's basically "use native")
+so resolves the build failure.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/configure.in w/configure.in
+index 5e43179..d51b017 100644
+--- i/configure.in
++++ w/configure.in
+@@ -960,45 +960,43 @@ if test "x$HAVE_GCC" =3D "xyes" -o "x$HAVE_CLANG" =
=3D "xyes"; then
+ 				;;
+ 			esac
+ 		fi
++
++		if test "x${HAVE_CLANG}" =3D "xyes"; then
++			case "${CLANG_VERSION}" in
++			3.[89]*|[45].*)
++				OPTIMIZATION=3D"-Ofast"
++				;;
++			*)
++				OPTIMIZATION=3D"-O3"
++				;;
++			esac
++
++			# generic CPU specific options
++			case ${host_cpu} in
++			*486)
++				OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di486"
++				;;
++			*586)
++				OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di586 \
++					-mtune=3Dnative"
++				;;
++			*686)
++				OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di686 \
++					-mtune=3Dnative"
++				;;
++			*86)
++				OPTIMIZATION=3D"${OPTIMIZATION} -march=3Dnative \
++					-mtune=3Dnative"
++				;;
++			esac
++
++		fi
+ 		;;
+ 	*)
+ 		AC_MSG_ERROR(bad value =EF=BF=BD${CONFIG_EXPOPT}=EF=BF=BD for expopt =
option)
+ 		;;
+ 	esac
+=20
+-
+-	if test "x${HAVE_CLANG}" =3D "xyes"; then
+-		case "${CLANG_VERSION}" in
+-		3.[89]*|[45].*)
+-			OPTIMIZATION=3D"-Ofast"
+-			;;
+-		*)
+-			OPTIMIZATION=3D"-O3"
+-			;;
+-		esac
+-
+-		# generic CPU specific options
+-		case ${host_cpu} in
+-		*486)
+-			OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di486"
+-			;;
+-		*586)
+-			OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di586 \
+-				-mtune=3Dnative"
+-			;;
+-		*686)
+-			OPTIMIZATION=3D"${OPTIMIZATION} -march=3Di686 \
+-				-mtune=3Dnative"
+-			;;
+-		*86)
+-			OPTIMIZATION=3D"${OPTIMIZATION} -march=3Dnative \
+-				-mtune=3Dnative"
+-			;;
+-		esac
+-
+-	fi
+-
+-
+ 	if test "${expopt_msg_result_printed}" =3D "no" ; then
+ 		AC_MSG_RESULT(${CONFIG_EXPOPT})
+ 	fi
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-mu=
ltimedia/lame/lame_3.100.bb
index efaf3b9817a..42689df3511 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -12,6 +12,7 @@ DEPENDS =3D "ncurses gettext-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
+           file://clang.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ddfe36cab873794038ae2c1210557ad34857a4b6bdc51578=
5d1da9e175b1da1e"
--=20
2.43.0


