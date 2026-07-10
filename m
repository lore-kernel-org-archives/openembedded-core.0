Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA49AC4450C
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1850.1783701424131227370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SBwM6z/T;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so8800755e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701422; x=1784306222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4wLyGaheEV6iDycwgEzyG91CFAQotZNSEAse3OwCQlE=;
        b=SBwM6z/TZGJ9EiW1GvFvfDLOZhEDx/ZlILHSgqbooWk7PIHGyw+xKOIQ/Zbjz1AidW
         9qOw+D7+rnmifafm1nKU6VuvWryQAupaKD9KnuRv20/jhaXpm8IqyqYVMGT1loLV5Pb4
         SBjvQtwSYUU5Lx4iiGx7FwN7P0DF50GO2Xdf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701422; x=1784306222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4wLyGaheEV6iDycwgEzyG91CFAQotZNSEAse3OwCQlE=;
        b=QrjZ/keZpNFSQ4jzw/74PEIau9xg1AH8XzRzophSPT6SPygaoZ5pqkqckT6ys14OzQ
         sJ9psJBPQWS0nwB3wf4CiWlhrRKnLMh3NcGnAHVbqd5Lwm+YHc6SIY1ooUhE9gcdZLMo
         gKDbzmXVOiJarQHS968W+0zm1BaDKQHHHllsSELfTwhS1vYHrpcQ9aNRP3M2GonMii7F
         7mw8u0sYTfvt4eOxsY8hZFndYdEwP5KBOdiL3rL4t1+z71LbRPMCUYyullieNPIQOc9h
         GKm3mDPdJ9pNPbNaNy8lqmQJQRMIsM6g7EYRIqRlJGKGcHVMBkWn9hogV8BaVtqesBe9
         WvUQ==
X-Gm-Message-State: AOJu0YwPt32eEwg+KuGb+YHgXW9vehZKNCbZeYVkSdBNuStFFNPo6W75
	tJeNpS4dj7bUWMVXrJ9iGyugwKMMtsWf729H43TkH7iznmTvI26u2++fJyfmhPlCRMqBKwXVKkk
	tIGVNBP8=
X-Gm-Gg: AfdE7clArQYX0qvYeQ2ka1B0b/ak1VUQMNVjtY/O3j938uA0P9GHijNwj3ddemv/2Uf
	0X/x7yMi0GNhzAxqlv/csxVSfAVegjkuNI5E3XW+x3SUB2hTyq5Tr6vnY6f3yaftdfAl1XTjnPX
	ALhEf8Sutp0A3EPETQ0w9uNwhgXGvuxDK0j1nr4axKFv/jpY0egaBrqrcnGu0Eq/z9WiXq3EF9q
	VhiZMU1VZaodrj1/mZ/zzR2GKuhgBX8kpyqv4vNdQL55BS3FG+SF3qgI6deLz9ycHUoxV4fECb4
	rHe968Us/JbFyNezdd0caRaOsZe2PhQ0DoYUizLoyxGv3EVR8mVM5up3FlRHzBxtPIGm3oehnVt
	VXZCdhgegHgTWZ5OiZaAyEaqanhT3LnJfwM5tIO00NWHBV+N3BHZ5MuH7KIguYZo2jr4F1JX/qo
	XWb4pJt1mSUyNyXzRF0nBoROTrCRXg84iJbE9SFkab9nbxGDIsKRbRclyizEUb/RAsgWhaJm/pb
	0qXd2nId8Dg+iLIHwM=
X-Received: by 2002:a05:600c:e547:20b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493e68d2040mr85582015e9.31.1783701422278;
        Fri, 10 Jul 2026 09:37:02 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/18] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Fri, 10 Jul 2026 18:36:17 +0200
Message-ID: <7d0cefac29aa7b4af645ed08d6f0dd18f6149a77.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240663

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
connection pooling. Without this, a second SMB request to the same
host reuses a connection authenticated for a different share.

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-5773.patch             | 47 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 00000000000..a9973712426
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,47 @@
+From e5c7f93734345260820ca46b29db85f75d277399 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
+so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
+identical: SMB connections are no longer pooled for reuse.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 00297ad..c15fdce 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@ const struct Curl_scheme Curl_scheme_smb = {
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+ 
+@@ -1259,6 +1259,6 @@ const struct Curl_scheme Curl_scheme_smbs = {
+ #endif
+   CURLPROTO_SMBS,                       /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
++  PROTOPT_SSL,                          /* flags */
+   PORT_SMBS,                            /* defport */
+ };
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index d58b7740112..3326f478b5c 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5773.patch \
     file://mbedtls.patch \
 "
 

