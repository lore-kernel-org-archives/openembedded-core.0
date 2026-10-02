Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BB6CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:45:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9832.1790941496559620298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AlIp4P0e;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83AA1497
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 04:44:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85EE53F85F
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790941495; bh=B/Xe9Xp1rlm1lkkcSyGXXTFtxMmpcSvg7nlCStstnpQ=;
	h=From:To:Subject:Date:From;
	b=AlIp4P0e7al+SXwPUFZ7IiBAByiqDMoAlwD3H3haiuDIKvD0mW7HRLcVIlaqGrzlh
	 c/vhZb4j0xRWi3kwd0K56IjUuc+6GA0hK8G2cxIufSp9uWpFB9Ft5GdPXHvwsNpfo/
	 i8ikJzTnLa/SKxIHSoQCRrZwcNao/tBZtPa3Lcdw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: skip timing-sensitive clock tests
Date: Fri,  2 Oct 2026 12:44:54 +0100
Message-ID: <20261002114454.2227789-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247110

The clock-33.* tests check with millisecond-accuracy and as such are
unstable under load, so skip them all.

[ YOCTO #16324 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index c01a7a1da28..18e03716e30 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -14,6 +14,8 @@ SKIP=3D"$SKIP async-\* event-\*"
 # This test behaves differently when using a system tzdata, skip until f=
ixed upstream
 # https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b=
094ffa1a
 SKIP=3D"$SKIP clock-59.2\*"
+# These tests check millisecond timing and are unreliable under load
+SKIP=3D"$SKIP clock-33.\*"
 # 14882
 SKIP=3D"$SKIP cmdMZ-6.6"
 # 15081
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index f4d0e90c0f0..40666ef851a 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -14,6 +14,8 @@ SKIP=3D"$SKIP async-\* event-\*"
 # This test behaves differently when using a system tzdata, skip until f=
ixed upstream
 # https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b=
094ffa1a
 SKIP=3D"$SKIP clock-59.2\*"
+# These tests check millisecond timing and are unreliable under load
+SKIP=3D"$SKIP clock-33.\*"
 # 14882
 SKIP=3D"$SKIP cmdMZ-6.6"
 # 15081
--=20
2.43.0


