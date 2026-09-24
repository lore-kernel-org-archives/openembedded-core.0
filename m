Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1E2C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:04:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5040.1790247871879412758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 04:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PKqAGx2D;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FB45143D
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 04:04:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C20243F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790247871; bh=G0Vrw+ZYyEPD8ORJ47HSF3nxxuM/qIuMZ3z4CI7mlrQ=;
	h=From:To:Subject:Date:From;
	b=PKqAGx2DDoN7oBdCfDJCwO65rZGCxwduHM9l4PwNYvUqSjVm4jPM9FY3CxfeWmPMy
	 JzNIByff4rto22JdLgiLBTTKguzO24tjZQ6xuu3je88bGMSfeMS+hOygtzpap/D6C6
	 8LJtVR0Sn1+syxB1uCfTsTAwID0G80gZ5p0+9Gtk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] systemd: fix musl build by fixing limits.h override
Date: Thu, 24 Sep 2026 12:04:24 +0100
Message-ID: <20260924110424.674180-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 11:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246580

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport the upstream fix for the limits.h override, which breaks GCC's
<limits.h> include cycle (notably GCC 16.x) and fails musl builds.

Upstream fix: https://github.com/systemd/systemd/pull/43831
(cherry picked from commit 4e08fdf59ffcafef6ca2df6342101e7e82b6183b)

[ changed SRC_URI addition to not use overrides - RB ]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-include-fix-limits.h-override.patch  | 47 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-li=
mits.h-override.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limit=
s.h-override.patch
new file mode 100644
index 00000000000..6316b3ddf61
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-overrid=
e.patch
@@ -0,0 +1,47 @@
+From 4e08fdf59ffcafef6ca2df6342101e7e82b6183b Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 22 Sep 2026 01:55:01 +0900
+Subject: [PATCH] include: fix limits.h override
+
+This is especially necessary since GCC 16.x.
+
+Replaces #43824.
+
+(cherry picked from commit 4e08fdf59ffcafef6ca2df6342101e7e82b6183b)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831=
]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/include/musl/limits.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
+index 9620a3b0acc..cffb8ddd274 100644
+--- a/src/include/musl/limits.h
++++ b/src/include/musl/limits.h
+@@ -1,6 +1,25 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+=20
++/* GCC introduces a spurious, tricky inclusion cycle:
++ *    GCC's limits.h
++ *      -> GCC's syslimits.h
++ *         -> GCC's limits.h (again!!!)
++ *            -> glibc/musl's limits.h
++ *               -> define POSIX defines
++ *      -> define ISO C defines
++ * This works only when GCC's limits.h is included first, but a user ov=
erride breaks the cycle. Hence, we
++ * need to manually achieve the cycle here. If GCC is not used (e.g., C=
lang), then including the compiler's
++ * limits.h twice should be redundant but harmless. */
++
++/* First, get the POSIX defines from glibc/musl's limits.h. When the tw=
o macros below are defined, GCC's
++ * limits.h includes the next limits.h, that is, one from glibc/musl. *=
/
++#define _GCC_LIMITS_H_
++#define _GCC_NEXT_LIMITS_H
++#include_next <limits.h>        /* IWYU pragma: export */
++
++/* Next, get the ISO C defines from GCC's limits.h. */
++#undef _GCC_LIMITS_H_
+ #include_next <limits.h>        /* IWYU pragma: export */
+=20
+ #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-co=
re/systemd/systemd_261.3.bb
index 1a256a598a8..0901736e7c9 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -36,6 +36,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0001-include-fix-limits.h-override.patch \
            "
=20
 PAM_PLUGINS =3D " \
--=20
2.43.0


