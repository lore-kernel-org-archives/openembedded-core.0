Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6ECC4450B
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5882.1783591621950841476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jebyfySS;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b1710405so9952805e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591620; x=1784196420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2QCFozG/Tceugm4ykmuPZuEoWjurn/3cErAXNO06G0I=;
        b=jebyfySSXBjArFBkciLQJhFPJT+f9YFK/JgK04il+0gLbiWliPiDiJvxm318yWLLBD
         czE9MmTBikPdy/FVzmFl6rYQlJmPIk5YgA0qTz24lFs+tUC2ExO1m//QRH0Bc8MSlEG4
         YgoVliIyV5gDYU6kVCbeeLPTGHWAun2YiB3Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591620; x=1784196420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2QCFozG/Tceugm4ykmuPZuEoWjurn/3cErAXNO06G0I=;
        b=PARhuxUhcqOZNlQmclQEowMUOsSK9yoXgSA20e/V9giIhzI5oIpLA4zgyclKApyodY
         DsWV3hCAl0wIZTslA602Ud4harMV3ABy+ZTmR90RzAPdjStkGn3XD/dQr9FlUIgXa+A2
         DRCjzhA+WWA1JhRoApWt0HN8QcaUqMQhUnhqOWjuCYEE+3wJiKGFBauoxfnyXmSg7Jga
         47D1oicqyDPGbQ/lZERhGmiisAMCMEn9TSspRG/670K3nwc3BpTiDtNfN/nXOMqmE2Ay
         NVovbVsFEa+B9lXSxfzwfqZ6pKTeSBUpPryfZNfNEDMjuEnFZF3fNd5lSOytvypltXaO
         X0kw==
X-Gm-Message-State: AOJu0YxjPHApNxR4k4FWYUd5BHygTS4bEqVWFVBInbYcRIyzcIi/lX/Z
	Pa1MEzrOh8DYuHqsEBWcIrRfJfSym2lOGoxNO2ilqyPGUWKijjanzG2OaaPHUyEUFmYfQ5zMEi9
	5H0r030Y=
X-Gm-Gg: AfdE7ck+ObvcDDXYye9zfvfQE/VTf4g2gr9XfiELWE3SYmKnYJR5ADgwSkjGUxzIV7t
	JdM245ySzuma+C9pVgwSuJ4fQu6Iz+J3LXmTx9A80zb+BRyvGv/LD001a2N+RTOyjCkKqVZPa03
	jjq+LLd6Ate/EifoPJfjoaBegFa5NWwt2daV429qHcgxCRjaIFVbl+IYi52rm2bs2o2dMaJ0lFa
	KggdJSyXqKdUFpkwi9v/i8ot2QL2yi3qrAhB2qnmd4Gy0JQmVyb2qwsF1hrSw8hEZ0aLwL/PYZZ
	WunrtUyX2bxPHFVvHMEblw9lMOZr8HyZRTUdmGTL2C7gpwjYSc0X26saXG9KRE+QURaiu/JLmk+
	gGD8SpZhJnb/jVZxMLENSo6IbVdm/OaRVNTr965zPD2+X9TDvsLJLPSIv0ph3T3DLCO6MNErp6c
	eEYXMo5cxwCZkOY/VjlAIXjvL94AZtRsjSs88mFMYxw8nI5FaP9zwtc1tSFpbMpo+5+pm6XetbX
	jvhnLcK2NbYC8DHPg==
X-Received: by 2002:a05:600c:4fd4:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493e6878b65mr60740895e9.32.1783591620060;
        Thu, 09 Jul 2026 03:07:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.06.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:06:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/25] libssh2: fix CVE-2026-55200
Date: Thu,  9 Jul 2026 12:06:17 +0200
Message-ID: <a610461f9040644bec9f1b9be23dcfff121df888.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240548

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55200.
https://nvd.nist.gov/vuln/detail/CVE-2026-55200

Upstream fix:
  https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 42c8c6ec3066dc47b9eeeba0247ffa927193abff)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-55200.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
new file mode 100644
index 00000000000..9a71277cce4
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
@@ -0,0 +1,36 @@
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
+
+CVE: CVE-2026-55200
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index e1120656..d147505b 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session)
+                 total_num = 4;
+ 
+                 p->packet_length = _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+ 
+                 /* total_num may include size field, however due to existing
+                  * logic it needs to be removed after the entire packet is read
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 2284d054b10..d6ee97f7ed0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            file://CVE-2026-7598.patch \
+           file://CVE-2026-55200.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

