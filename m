Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891EFC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15946.1787576441583175784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w47yGrdJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso19626155e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576440; x=1788181240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cSN6PIj4MghZZpurqTWU93YGYgIx6i9wc9iCra0BGC8=;
        b=w47yGrdJI4vkbxq0p8rbEu0xmsoy34Go4Tz4zOBHVKy0yTfDCJkLMqJvsM5mRzyrWS
         dPpVS+hn9zSza8LHAdZA7nVSFpJ2mg6m09N1vvjyjMN5a3XH4PJ31UwfrMtR5ZBdRDqc
         IVKD4PRYiioLjUrU2Bal0KQEyll+IrrDyVOZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576440; x=1788181240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cSN6PIj4MghZZpurqTWU93YGYgIx6i9wc9iCra0BGC8=;
        b=kNS1qIwvYQoFCH0G890LyiIcyltfGQm59Qs3hNfie54dmq/m99vfjPceycTqEm46Oz
         9u2Ms5QBqvfG3Nca37YDKD2jFTRTjfRStGkfjiCuZw5G/PB82rgYJ107jw0j+rLmJ1ms
         LZloOP918t4na8UKqr5d6qZGRmtHTNld9nXhvuiRhIijq/NTTXKmyom5wcupCeyfSJuS
         djje0Kl9XBKhTep1wWtTSzzRatTJfMIrlShFG+Trk3kvMu55wC9n8FWehUM8mHd2SXiX
         z85B5Mo8Xu5D4hhY1L7NqQ99KeTi/GJavwRvqOqbMj7M+2/TtDyrzYlds+T9edr4SsXp
         nwtw==
X-Gm-Message-State: AFuF++m2dTlHjDl6w0OShUKUQB3MEw3ejPz0qzCnsEuyGsCS3kMvtGgo
	slfl7gM5QuCQp4kpPKvW+Ier8OSe5FUxef+/FP90mbCPTPwGSlTLc9uWPsE3x3wIg69T0U//gcX
	f4+tJ3D0=
X-Gm-Gg: AR+sD12PuwHBm6uBFd2UMRUTpNSKZZyXI0kffFeTfgdfEc0TfObDxd9FpfW5ehHbw4i
	z7jW4M8rD08ogc/ve/+yzwDR6lOMyky1rnBnKUTVbNnts1io6iHefHrEvOndDGRK/O1KrFM1aVg
	3RB2pZ8i9mN5jW6AMKmNLBMfY56K/yuR0FOFGgg9041Gt+1VvOxltkldrdo2owEw1SJJQjaWOsf
	IXp8+1QGGbisfxRHWkfYcZstG5f8ZxW9mLZPSLzW7M0L1RKpjTITVA4FFy2fkVK1HZu3hJM4Nv9
	OcoCr2qOoil1yTN3u7jzgwy/a1BVQsLLxstJBj+rFjOUa5OFQ1y4+/DaeFkFhpiuPBe83hH4NAr
	PCgmEeLjeJUc3r5FktJMkiWq6NVln6AlqnmCWn88cThZdQ4M75+q9z+MpZNlSsQaeSFFvB44n4O
	cva3wgquJT2HR0YstwbsxP45mMYp+GX4tZc3bZMPw2TCVhZq0KrjnwySnoBdyJnxTWS/3XJwNkG
	EnU9czdLNvWJR1BUJ71rExxT1Z2VwSqEySEktJqd30AGmCh3DkC7DL5PjXpLsVuw2E4kIE=
X-Received: by 2002:a05:600c:5309:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-499c19d020cmr203893185e9.7.1787576439609;
        Mon, 24 Aug 2026 06:00:39 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/19] libssh2: fix CVE-2026-66032
Date: Mon, 24 Aug 2026 14:59:45 +0200
Message-ID: <4eee848e3817b6f3ffd11bf5758087643c89128f.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244101

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66032
https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66032.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
new file mode 100644
index 00000000000..15a52664853
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
@@ -0,0 +1,36 @@
+From 352341aaebcf91ab16e7fcff158fef4a3b8c32f6 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 4 Aug 2026 12:32:31 +0000
+Subject: [PATCH] Prevent dangling pointer by nullifying data (#2180)
+
+Set data to NULL after freeing it to avoid dangling pointer. fixes
+GHSA-px3w-7g75-hg7w.
+
+Credit: VladimirEliTokarev
+
+CVE: CVE-2026-66032
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0]
+
+Backport adaptations:
+- The upstream fix uses SSH2_FREE() which was renamed from
+  LIBSSH2_FREE() in newer libssh2. Context adjusted to match
+  the 1.11.1 codebase (different line numbers and surrounding
+  function/macro names).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/sftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 6ede3111..793f267c 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1279,6 +1279,7 @@ sftp_open(LIBSSH2_SFTP *sftp, const char *filename,
+                                "got HANDLE FXOK"));
+ 
+                 LIBSSH2_FREE(session, data);
++                data = NULL;
+ 
+                 /* silly situation, but check for a HANDLE */
+                 rc = sftp_packet_require(sftp, SSH_FXP_HANDLE,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 32e1ad6c16c..bd7d1f7b1d1 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-66032.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

