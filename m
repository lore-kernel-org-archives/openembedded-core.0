Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F025C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:33:34 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9071.1789029204451881625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 01:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JFQ2bXtP;
 spf=pass (domain: mvista.com, ip: 74.125.228.12, mailfrom: sdoshi@mvista.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so771735a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789029203; x=1789634003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dh1aOikHIlkeJFgbK4ZBfykUZL6eyJQE80hagBqLxno=;
        b=JFQ2bXtPcHyUTur42EUUY/DAsEV8xiEFrab8cxpB8nlDGhIwRqIoKU+GAAdbORNoOy
         6yNClMI9vjVgJKGU3dRtsDf/O1btUlRAoYmdc3Y03iaqY46rI5eWJZ27nOUJnwaM5A7q
         afb/CD48+Y5feeGoV3OQxRW9OR7h5jr4thMBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029203; x=1789634003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dh1aOikHIlkeJFgbK4ZBfykUZL6eyJQE80hagBqLxno=;
        b=CdzIu+IMQero9/gzB3NXAf+p/OkAe/LbGhNu/aBcwIYR4XTEQLG5pwDvo4SHb8BZw4
         pBPE5tlKJeU+/5p+qPZps2Rklaobf/LJud1bQpW7A8u2if8C3XS+iH+rUewK3Alqdj5W
         04+G0icZ2mKr6iydN87Bsb92dDOB+ybaN8LSB68mgQMLABhxfeonNgD2/OTFHr12glT7
         C1++8cby0rXI53FucyYhKjyziZkWMfL+Fk+bMww9fCleC6XuYm4IKmAqKtwnh/xTma9F
         C4m1WhHVtUtXN6B9EEsF7b/S1aBFgBqVIiKdnAe0Oo3WKV/hb+tHlRmA4t3rHH9+c3np
         wkCQ==
X-Gm-Message-State: AFuF++mW3UP/5H9SN2woXsvK4htKWfHjP6oBau34JH92uTIyEkIxC9/N
	nPMZ2NEWK5Ozp2w8T+PU0610bwguIPBy6z2Z8jRmfRY0ce11CIPgIXdzgy3wKhE56uA4WbyqJW2
	CNurTLsc=
X-Gm-Gg: AYBFou3XnmouyIsgjBsLKvAByAlkCAlKDlXZhXeSY7Uqe60iaTfT7FyJluADUOyvtsX
	fo5TZz5iHZ8xc4iB7TVxHC2qGSKdwRrpM60XY/zoqWAFnB8h+/H1pWxVHpxXfk4HrePBDBbUZVP
	oBPhlenfgHjrTBJlNmhLWg1PzqGRciwwCTQPTXU12xl0FAojce5RBy6C4YkBNXDSTkVLcuSSbBv
	S6SqgBWCH8p7ZMVq80dj3mGJrYHLWEmQ8KHokFwVv1SBFObICGPpNfbriMHCNmX+GUzUeg6kx1y
	czarmi+z2cOJy7DmI/6//oc8PKMpLnF6ZWSKlyJglNrpmWidHxZeWNTmk/xFVRh2vr4FW6VrXz1
	hAFM7ucDBrR2twp79hdTusw8cgw1EDWMHTDnlR6DaB0ZlMkXvSnHjxOJWQXvb+zZ7zeewEaseLb
	U+Aqb79Aflg0s/jG5ZARg4MSjpBD5OJc5jvB8fBXMdXBvhUzszTeogWkyGOQwGNE4lb64a/1wAd
	CnyvCrXiH9USB99WE2t
X-Received: by 2002:a05:6300:4093:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3dacbf4494dmr10992620637.25.1789029203467;
        Thu, 10 Sep 2026 01:33:23 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm28004672c88.9.2026.09.10.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:33:22 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/3] curl: Security Fix for CVE-2026-13608
Date: Thu, 10 Sep 2026 14:00:53 +0530
Message-Id: <20260910083055.208955-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245541

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-13608.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-13608

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-13608.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-13608.patch b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
new file mode 100644
index 0000000000..bb1662fa4c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
@@ -0,0 +1,48 @@
+From 25df759f0f0c1aeaee066a4502bb36a8a86fb22e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Jun 2026 10:44:47 +0200
+Subject: [PATCH 1/5] openldap: handle Curl_sasl_continue() returns better
+
+Similar to how it gets treated already in other protocol handlers.
+
+Follow-up to eeca818b1e8d1e61c2d4
+
+Reported-by: Eunsoo Kim
+Closes #22213
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ea71c3b6b60e563651ea8596a975aef0c8199519]
+CVE: CVE-2026-13608
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/openldap.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/openldap.c b/lib/openldap.c
+index 47266f6..b566d1a 100644
+--- a/lib/openldap.c
++++ b/lib/openldap.c
+@@ -682,8 +682,19 @@ static CURLcode oldap_state_sasl_resp(struct Curl_easy *data,
+   }
+   else {
+     result = Curl_sasl_continue(&li->sasl, data, code, &progress);
+-    if(!result && progress != SASL_INPROGRESS)
+-      oldap_state(data, OLDAP_STOP);
++    if(!result) {
++      switch(progress) {
++      case SASL_DONE:
++        oldap_state(data, li, OLDAP_STOP);   /* Authenticated */
++        break;
++      case SASL_IDLE:            /* No mechanism left after cancellation */
++        failf(data, "Authentication cancelled");
++        result = CURLE_LOGIN_DENIED;
++        break;
++      default:
++        break;
++      }
++    }
+   }
+ 
+   if(li->servercred)
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 365f02ad59..e75c938938 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-13608.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


