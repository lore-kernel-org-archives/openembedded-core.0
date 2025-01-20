Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA7C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 11:45:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.35048.1737373526449012743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 03:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87D221063
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 03:45:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B18373F740
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 03:45:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fmt: fix build with GCC 9.4
Date: Mon, 20 Jan 2025 11:45:20 +0000
Message-ID: <20250120114520.2836036-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 11:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210026

fmt-native is needed to build ccache-native, and the compile fails on
hosts with GCC 9.4 (such as Ubuntu 20.04).  Backport a patch to fix this
issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/fmt/files/fix-gcc9.patch | 26 +++++++++++++++++++
 meta/recipes-devtools/fmt/fmt_11.1.1.bb       |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/files/fix-gcc9.patch

diff --git a/meta/recipes-devtools/fmt/files/fix-gcc9.patch b/meta/recipe=
s-devtools/fmt/files/fix-gcc9.patch
new file mode 100644
index 00000000000..1d67f7094de
--- /dev/null
+++ b/meta/recipes-devtools/fmt/files/fix-gcc9.patch
@@ -0,0 +1,26 @@
+From 5f0572acdca120e11f6d810765d7a6a3c593fcbb Mon Sep 17 00:00:00 2001
+From: Victor Zverovich <viz@meta.com>
+Date: Sat, 18 Jan 2025 09:00:22 -0800
+Subject: [PATCH] Workaround a compilation error on gcc 9.4
+
+Upstream-Status: Backport [5f0572acdca120e11f6d810765d7a6a3c593fcbb]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ include/fmt/format.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index 9cd523a9e6a5..4466b4f4d24b 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -227,7 +227,9 @@ FMT_CONSTEXPR inline void abort_fuzzing_if(bool cond=
ition) {
+ #if defined(FMT_USE_STRING_VIEW)
+ template <typename Char> using std_string_view =3D std::basic_string_vi=
ew<Char>;
+ #else
+-template <typename T> struct std_string_view {};
++template <typename Char> struct std_string_view {
++  operator basic_string_view<Char>() const;
++};
+ #endif
+=20
+ template <typename Char, Char... C> struct string_literal {
diff --git a/meta/recipes-devtools/fmt/fmt_11.1.1.bb b/meta/recipes-devto=
ols/fmt/fmt_11.1.1.bb
index a99a377ad4a..cfacd81a11a 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.1.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
@@ -4,7 +4,8 @@ HOMEPAGE =3D "https://fmt.dev"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c1412=
729"
=20
-SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s"
+SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s \
+           file://fix-gcc9.patch"
 SRCREV =3D "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
=20
 S =3D "${WORKDIR}/git"
--=20
2.43.0


