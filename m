Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95FFC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:32:44 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.45729.1753115553703217633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 09:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jNWerXEY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202507211632274871c706d5b93b0d71-wz_hle@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202507211632274871c706d5b93b0d71
        for <openembedded-core@lists.openembedded.org>;
        Mon, 21 Jul 2025 18:32:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5kZhdsyAbjsZSU///0n/pG64R1H0WQEKz0TliXw7PLw=;
 b=jNWerXEYaIDsIAuU4i8gQPlVw41H1ek1tDApNJvV8Pkv3ChnlDanmupLjSc5jR2AcFsyEK
 yA1Sv8NnbeTi2xlfrUpPKuM5GpswzZMYMFX6UhRToaAUafdAwPS/tdGFyMBA+j+ao5vdsZ2/
 uSaM90xFjiu3Fvh0zA3sRcw+C4oh5qFUJdTrfA13JMyaHvhrgDrrono29oqMBAtokcJgzSOF
 bDDJ8FcqfUWjjkhUuGb+ALqYpW7hcrUICx1RKyEuOuUY+2evb+zKTJi5WRjZnwDWfUbN5Epe
 umj4j2QWY8FXgqfcuDSK0ECu6jgQ8g89ADet0wVFvC3qNcvpe5X2sA/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Archana Polampalli <archana.polampalli@windriver.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] openssl: CVE-2024-41996
Date: Mon, 21 Jul 2025 18:31:40 +0200
Message-Id: <20250721163141.1246135-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 16:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220703

From: Archana Polampalli <archana.polampalli@windriver.com>

From: Peter Marko <peter.marko@siemens.com>

As discussed in [1], this commit fixes CVE-2024-41996.
Although openssl project does not consider this a vulnerability, it got
CVE number assigned so it deserves attention.

[1] https://github.com/openssl/openssl/pull/25088

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/openssl/CVE-2024-41996.patch      | 44 +++++++++++++++++++
 .../openssl/openssl_3.2.4.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
new file mode 100644
index 0000000000..dc18e0bef1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
@@ -0,0 +1,44 @@
+From e70e34d857d4003199bcb5d3b52ca8102ccc1b98 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Mon, 5 Aug 2024 17:54:14 +0200
+Subject: [PATCH] dh_kmgmt.c: Avoid expensive public key validation for known
+ safe-prime groups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The partial validation is fully sufficient to check the key validity.
+
+Thanks to Szilárd Pfeiffer for reporting the issue.
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/25088)
+
+CVE: CVE-2024-41996
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70e34d857d4003199bcb5d3b52ca8102ccc1b98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/implementations/keymgmt/dh_kmgmt.c
+index 82c3093b12..ebdce76710 100644
+--- a/providers/implementations/keymgmt/dh_kmgmt.c
++++ b/providers/implementations/keymgmt/dh_kmgmt.c
+@@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int checktype)
+     if (pub_key == NULL)
+         return 0;
+ 
+-    /* The partial test is only valid for named group's with q = (p - 1) / 2 */
+-    if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
+-        && ossl_dh_is_named_safe_prime_group(dh))
++    /*
++     * The partial test is only valid for named group's with q = (p - 1) / 2
++     * but for that case it is also fully sufficient to check the key validity.
++     */
++    if (ossl_dh_is_named_safe_prime_group(dh))
+         return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
+ 
+     return DH_check_pub_key_ex(dh, pub_key);
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
index c4ad80e734..d6bf32d989 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://CVE-2024-41996.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

