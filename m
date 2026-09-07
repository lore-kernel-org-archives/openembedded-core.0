Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FCDC79FB8
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34935.1788788164729217858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QGrEy8Su;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso33834505e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788163; x=1789392963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ggvz4lOSk8CReJPBkHQ62QocwWdiMoR0R3a1ZPXh//o=;
        b=QGrEy8SuFO8dSjOljqKXP3a7fZiCXGOqJumaqxGrNvUiIny/Ww79IZsRQNNnPAXnNv
         RinDeOXTaPWET9QFzW7Nmtmm/UqHg3B+6xGOP3ggqQRFHr+S45GQZAC3wnsoy575jPfu
         4Zqt8BC3N9tLyF9lVUD1+y42Pb880syk28iFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788163; x=1789392963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ggvz4lOSk8CReJPBkHQ62QocwWdiMoR0R3a1ZPXh//o=;
        b=CK0/s2sJdBqYk77r4tnAxmGaoEC11+oJiWc7TChEK6ULDKAQbRTgjqeKwHVp5ZMMHq
         zh/KXOLhH/1NzOb5mmlsDRfX5vUq7Wc/POZb8PAh6Rfr8uennd7gAiC4rmUAdtrpkVdc
         Gq9ocYj+yPeXDCKfjRDye7kcwymGvZP1T8CNx1GhGwO9ONj7slwBxllzRc12LU7qGYGt
         vFxaMyhQATaoAoAKmGeN5Y9t9F74Q6Oxx5YrWa1WkuMJB27wMqcBZFki5pcMoZObacWB
         kfGQAGiDZhfa+FNI4lRII9NWSoM0M70NNkSiDHTOburl6J1zO8oIGPr8uamf9eDubHNn
         2KRQ==
X-Gm-Message-State: AFuF++lhE1Io0vmaOu/9kyN9AyBfLWuFC1GN0YKBvcDnk3ARYJ9nqI9B
	VHBUPcr2RL2evOAcwhOX5ph6Kod0kD4xcgJzz8+h3+0ZGlscUCcHF9gLgk0FDCf7J867TG3ZmEl
	XXJOWkrA=
X-Gm-Gg: AYBFou32VK1XJJ8hOdE2Tiy3dMBFhG/riZXAR/fHIsCT5BfNEoTkWyv+jujtd4g//aS
	MZTCLXAuIFJrjQ8nnBu1EOiCFZ7xqsDsECLzx6pgky4Hl9n4Z/iUDIrAAD/O9CNIKpUMC3d4LcS
	ZralGUABXVHiI7yS3y/LQDouLOCygCLNBoN+CD7qjllQ/lTIglDTSjtw467KS2zpoGH6yR6k6tQ
	hJPUz7OrwrpKOdIMBmjL5I9rY/DxBc2n+f7vrKDOeacKuugg6jqtNbzmPkybwc0DTvco7e1aFYj
	x0OoeOOYJFzn3bfrl+SPugr8gtpkBBPM6WvAx+ijfKuT7rzVBjXt1O/xMaP8yUXSm2E8jxgolks
	feBrtuK7h+gSQlsw5IHrEy1A88IDra5ppnVr5SUp1bVHW4S+pwVAveejxQMVGoeHxhULmVHDaYi
	ZNK33Jyx6GrkaU+qkhpmbqFiy5dHMtpo2TspAZEwRZvSdfT4Dw40i0iR3euqpIQvywvDlZLe7y+
	lZCARdpMPqRuEr86/znlmoQQ7cY/ten8VWu6Qpi3fxMItbSI3ooYedbo16kq6ghCCliBYeSpiI=
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr214829255e9.18.1788788162981;
        Mon, 07 Sep 2026 06:36:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/35] python3-pycryptodomex: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:18 +0200
Message-ID: <c130a84998e9d22a5a228acc677676620853bb57.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245280

From: Tim Orling <tim.orling@konsulko.com>

With this change, 1 Patched CVE is properly reported:
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2a2ae48add874f41c5b60ca90ba3a26ebb0fe38)
The current pypi default "python:pycryptodomex" has no matching NVD CPE
or configuration identity. Use "pycryptodome:pycryptodomex", the active
NVD dictionary CPE and configuration identity for the packaged
distribution, so CVE-2023-52323 is properly reported as patched.

Note: The original commit targeted python3-pycryptodomex_3.23.0.bb. This
is adjusted for Scarthgap, where the recipe version is 3.20.0.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index 54578d28509..44f8d98d6a0 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -3,6 +3,8 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
 
+CVE_PRODUCT = "pycryptodome:pycryptodomex"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \

