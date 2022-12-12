Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABC0C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:25:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45992.1670858748106699743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754551FB;
	Mon, 12 Dec 2022 07:26:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BBC03F71E;
	Mon, 12 Dec 2022 07:25:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] meson: drop redundant is_debianlike() patch
Date: Mon, 12 Dec 2022 15:25:41 +0000
Message-Id: <20221212152542.3762880-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 15:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174494

This patch disables is_debianlike() so that it always returns False in th=
e
name of deterministic builds.  However, the caller default_libdir() then
looks at the host filesystem to decide if /usr/lib64 exists and will
return either lib or lib64, so it still isn't deterministic.

This is only used for the default libdir value and meson.bbclass
always passes an explicit --libdir, so this is moot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-is_debianlike-always-return-False.patch | 27 -------------------
 meta/recipes-devtools/meson/meson_0.64.0.bb   |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-=
always-return-False.patch

diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-=
return-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike=
-always-return-False.patch
deleted file mode 100644
index a9a32e2b7a1..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-=
False.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 361f51c2c7685491186703e8f26be991ab698edc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 18 Oct 2021 15:55:59 +0200
-Subject: [PATCH] is_debianlike(): always return False
-
-Otherwise, host contamination happens.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- mesonbuild/utils/universal.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/utils/universal.py b/mesonbuild/utils/universal.=
py
-index 570edd6..4119aa5 100644
---- a/mesonbuild/utils/universal.py
-+++ b/mesonbuild/utils/universal.py
-@@ -634,7 +634,7 @@ def is_cygwin() -> bool:
-=20
-=20
- def is_debianlike() -> bool:
--    return os.path.isfile('/etc/debian_version')
-+    return False
-=20
-=20
- def is_dragonflybsd() -> bool:
diff --git a/meta/recipes-devtools/meson/meson_0.64.0.bb b/meta/recipes-d=
evtools/meson/meson_0.64.0.bb
index 84c3c84515f..34a04d52ab6 100644
--- a/meta/recipes-devtools/meson/meson_0.64.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.64.0.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch =
\
            "
 SRC_URI[sha256sum] =3D "c5e27e091c2a35b9049e152a6535045ebbd057253aeb6785=
6de6ecbb7b917bab"
--=20
2.34.1


