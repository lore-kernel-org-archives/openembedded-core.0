Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9583CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:58:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7661.1755777513351679883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0AA3152B
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:58:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 901E13F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:58:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] babeltrace2: don't install static modules
Date: Thu, 21 Aug 2025 12:58:29 +0100
Message-ID: <20250821115829.2243247-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222232

There's no point building or installing static plugins, so apply a patch
to only build shared plugins.

Poky passes --disable-static via no-static-libs.inc, but anyone building
babeltrace2 with nodistro or another distro that doesn't use
no-static-libs.inc will fail to build babeltrace2 because of packaging
errors around the static version of the python plugin.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...explicitly-only-build-shared-plugins.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.1.bb |  2 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-src-explic=
itly-only-build-shared-plugins.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-on=
ly-build-shared-plugins.patch b/meta/recipes-kernel/lttng/babeltrace2/000=
1-src-explicitly-only-build-shared-plugins.patch
new file mode 100644
index 00000000000..7f8d5c7df33
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-buil=
d-shared-plugins.patch
@@ -0,0 +1,70 @@
+From 3f43a0554c73287973047b44ae5e196b7c995c60 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 21 Aug 2025 12:42:20 +0100
+Subject: [PATCH] src: explicitly only build shared plugins
+
+For some reason, libtool builds static libraries for libs which have
+been marked as modules. These are pointless: you can't dlopen() a static
+library.
+
+Avoid wasting compile time and disk space by passing -shared to libtool
+so that the static libraries are not built.
+
+Upstream-Status: Submitted [https://github.com/efficios/babeltrace/pull/=
121]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/Makefile.am | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 0567131b..7aa46b20 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -619,7 +619,7 @@ nodist_EXTRA_python_plugin_provider_babeltrace2_pyth=
on_plugin_provider_la_SOURCE
+ python_plugin_provider_babeltrace2_python_plugin_provider_la_LDFLAGS =3D=
 \
+ 	$(AM_LDFLAGS) \
+ 	$(LT_NO_UNDEFINED) \
+-	-avoid-version -module \
++	-avoid-version -module -shared \
+ 	$(PYTHON_LDFLAGS)
+=20
+ python_plugin_provider_babeltrace2_python_plugin_provider_la_CPPFLAGS =3D=
 \
+@@ -669,7 +669,7 @@ plugins_utils_babeltrace_plugin_utils_la_SOURCES =3D=
 \
+ plugins_utils_babeltrace_plugin_utils_la_LDFLAGS =3D \
+ 	$(AM_LDFLAGS) \
+ 	$(LT_NO_UNDEFINED) \
+-	-avoid-version -module $(LD_NOTEXT)
++	-avoid-version -module -shared $(LD_NOTEXT)
+=20
+ plugins_utils_babeltrace_plugin_utils_la_LIBADD =3D \
+ 	plugins/common/muxing/libmuxing.la
+@@ -775,7 +775,7 @@ plugins_ctf_babeltrace_plugin_ctf_la_SOURCES =3D \
+ plugins_ctf_babeltrace_plugin_ctf_la_LDFLAGS =3D \
+ 	$(AM_LDFLAGS) \
+ 	$(LT_NO_UNDEFINED) \
+-	-avoid-version -module $(LD_NOTEXT)
++	-avoid-version -module -shared $(LD_NOTEXT)
+=20
+ plugins_ctf_babeltrace_plugin_ctf_la_LIBADD =3D \
+ 	plugins/ctf/common/metadata/libctf-parser.la \
+@@ -816,7 +816,7 @@ plugins_text_babeltrace_plugin_text_la_SOURCES =3D \
+ plugins_text_babeltrace_plugin_text_la_LDFLAGS =3D \
+ 	$(AM_LDFLAGS) \
+ 	$(LT_NO_UNDEFINED) \
+-	-avoid-version -module $(LD_NOTEXT)
++	-avoid-version -module -shared $(LD_NOTEXT)
+=20
+ plugins_text_babeltrace_plugin_text_la_LIBADD =3D
+=20
+@@ -840,7 +840,7 @@ plugins_lttng_utils_babeltrace_plugin_lttng_utils_la=
_SOURCES =3D \
+ plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_LDFLAGS =3D \
+ 	$(AM_LDFLAGS) \
+ 	$(LT_NO_UNDEFINED) \
+-	-avoid-version -module $(LD_NOTEXT) \
++	-avoid-version -module -shared $(LD_NOTEXT) \
+ 	$(ELFUTILS_LIBS)
+=20
+ plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_LIBADD =3D \
+--=20
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipe=
s-kernel/lttng/babeltrace2_2.1.1.bb
index 52768f6ce3c..1dc8cd8a498 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "git://git.efficios.com/babeltrace.git;bran=
ch=3Dstable-2.1;protocol=3Dhttp
            file://0001-tests-set-the-correct-plugin-directory.patch \
            file://0001-Make-bt_field_blob_get_length-return-size_t-inste=
ad-.patch \
            file://external-python-tests.patch \
+           file://0001-src-explicitly-only-build-shared-plugins.patch \
            "
 SRCREV =3D "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
@@ -27,7 +28,6 @@ export DISTSETUPOPTS =3D " --install-lib=3D${PYTHON_SIT=
EPACKAGES_DIR}"
 PACKAGECONFIG ??=3D "manpages"
 PACKAGECONFIG[manpages] =3D ", --disable-man-pages, asciidoc-native xmlt=
o-native"
=20
-FILES:${PN}-staticdev +=3D "${libdir}/babeltrace2/plugins/*.a"
 FILES:${PN} +=3D "${libdir}/babeltrace2/plugins/*.so ${PYTHON_SITEPACKAG=
ES_DIR}/*"
=20
 ASNEEDED =3D ""
--=20
2.43.0


