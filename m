Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E463CC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:55:04 +0000 (UTC)
Received: from deneb.mcrowe.com (deneb.mcrowe.com [88.97.37.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8624.1783673699346119063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20260328 header.b=i9FLz589;
 spf=pass (domain: mcrowe.com, ip: 88.97.37.36, mailfrom: mac@mcrowe.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20260328; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=33y5AOcR404eEipMoWkGPbRxVbF1FdYBiMZgTQQZ8C0=; b=i9FLz589bVrPSUx0YFF8h6iMIN
	tbWoBRXwqjfCup76gpA8K7X1yJRhgiGiegjtcrB56vuONsueGHYXiwUhD3zkdnUmbN8HmqSfqaPgy
	8vOjnBUdAqKLZosLk96d8n+wRdaTZNcdi3244yQWNsEpQxqkLLHMvaga6hVr9X0ibP0cUWVSpo832
	/CjqoOCiy4TINdGtl2a4mad3me1Vn0t8V/aVQkY31T2KN6hHC8BFHdXgFhtwOlwrHRPP2e1DCCEfc
	7/qoFxeAWlXdOY4EgfeVRnX3QNLIPk2+5cyjF81aodfhci6GOaaLM64IYOPOUrOLeX0aBkNEcvjCC
	h6HAnsGQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1wi70Z-00000002WJN-1vgR;
	Fri, 10 Jul 2026 09:54:55 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [scarthgap][PATCHv2] dropbear: Disable DSS correctly
Date: Fri, 10 Jul 2026 09:54:50 +0100
Message-ID: <20260710085450.2656702-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240621

From: Mike Crowe <mac@mcrowe.com>

Take upstream patch that stops sysoptions.h unconditionally turning
DROPBEAR_DSS back on even when it has been disabled (which is the
default).

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---

 ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 30 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch

Since v1 at https://lists.openembedded.org/g/openembedded-core/topic/120033783 :
  Add Signed-off-by to patch file

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
new file mode 100644
index 0000000000..250cbb7a6f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
@@ -0,0 +1,30 @@
+From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 6 Dec 2022 22:34:11 +0800
+Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
+
+Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
+was missing fuzzing conditional
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c043efb47c3173072fa636ca0da0d19875d4511f]
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ sysoptions.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysoptions.h b/sysoptions.h
+index fb6adc7..12db59c 100644
+--- a/sysoptions.h
++++ b/sysoptions.h
+@@ -383,9 +383,11 @@
+ #endif
+ 
+ /* Fuzzing expects all key types to be enabled */
++#if DROPBEAR_FUZZ
+ #if defined(DROPBEAR_DSS)
+ #undef DROPBEAR_DSS
+ #endif
+ #define DROPBEAR_DSS 1
++#endif
+ 
+ /* no include guard for this file */
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 93563aa3b4..d203fee34b 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch \
            file://0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch \
            file://0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch \
+           file://0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch \
            file://CVE-2025-47203.patch \
            file://CVE-2019-6111.patch \
            "
-- 
2.47.3


