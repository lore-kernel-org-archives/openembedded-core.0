Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB15C6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.8313.1662560480542369219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V9OADsv4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id t65so2790656pgt.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=jPWTSis9XRvhbQi46NfqjdA0WRA+3NWizthB9iyUxCc=;
        b=V9OADsv4ym7vq0y8yVJrLLMxpcAMyhgGwKgp22nPQmuy5XbFJmb3CsBNDsHbxgyHx3
         O07J8QEIXc05LQUlbeWn4QDvrO7TddgF7IG1juhSlBxpQ6pI2RYINeAvql9IpRBRFwJZ
         PRmHEUOotcV0C+4DeJvXvxT+XxAcPGvn9vxAgKeNxxE5Pxrl8DWH9faLBKnQzLrrEhsU
         1CvdsQdOjUXV7BCxzmEbDUrCPuSWuTd7ImDciBk2m8pJVRsP41r7NI04CulK+kLZmzfS
         u5KJbVE7quEBd5R5l1Hzfy9ICea5Llp3K+05DjO7QhtQ3SaUCXSjGV1+jgH6QYfVbw72
         AsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jPWTSis9XRvhbQi46NfqjdA0WRA+3NWizthB9iyUxCc=;
        b=NuERRsS+x6CXALNuNekFY9l25w3l++PmAmLZpr+jEhquzeqDB5vExcnR8WBwFWTMFe
         Idtqd+Z+XfmGoPajZRyZmisNS8lyjme79SIXvWTtSiMnn7D5xRGHDhKTyBSxd7vX7+TN
         l7sitKPcfmCRScyk+7p67CL4pxF7ie6PlGwHXt/c2w1qZ4jfgucogR7uBCKzkaseTLYv
         Ivgv8Mh96NAA4/yhw3EM+aE47sXY4s4P1DDcZ1zRd0C2uktSlJRwEGyF5OfrUeewMs0c
         n2EzB7NJ8Vz09JatbjwPGN5c8zDlB72dpWcTEKZRMVOUWvkvKH9L23DnL/rDw4bF6LRk
         K+HA==
X-Gm-Message-State: ACgBeo3URRTPa8M6S1+IVXKCcQrU+jRoZi7T0qlm52JvrRRcrNiJUsIw
	0ikeXOw34PzZ8WBY0Qdu0cOKXpIm05T85SQp
X-Google-Smtp-Source: 
 AA6agR7MqKc0SVDdDK3eFvvmFPyTy8kEITVNIZNW8Luie3Yn99qZp+uc2whaV3JV00sUYaJVfWhBXg==
X-Received: by 2002:a05:6a00:1c69:b0:53e:a212:2b0b with SMTP id
 s41-20020a056a001c6900b0053ea2122b0bmr321509pfw.30.1662560479582;
        Wed, 07 Sep 2022 07:21:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/24] kernel-fitimage.bbclass: add padding
 algorithm property in config nodes
Date: Wed,  7 Sep 2022 04:20:20 -1000
Message-Id: 
 <149f61eef11b2e1e20aabed7054df237272ad7f4.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170414

From: LUIS ENRIQUEZ <luis.enriquez@se.com>

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 29d5336c728b28890bbaadebf0ccff00ad90a64d)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 meta/classes/uboot-sign.bbclass      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7b16633f6f..983392c23a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -346,6 +346,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
+	conf_padding_algo="${FIT_PAD_ALG}"
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -465,6 +466,7 @@ EOF
                         signature-1 {
                                 algo = "$conf_csum,$conf_sign_algo";
                                 key-name-hint = "$conf_sign_keyname";
+                                padding = "$conf_padding_algo";
                                 $sign_line
                         };
 EOF
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 31ffe1f472..eecdec9160 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -73,6 +73,9 @@ UBOOT_FIT_HASH_ALG ?= "sha256"
 FIT_SIGN_ALG ?= "rsa2048"
 UBOOT_FIT_SIGN_ALG ?= "rsa2048"
 
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?= "pkcs-1.5"
+
 # Generate keys for signing Kernel / U-Boot fitImage
 FIT_GENERATE_KEYS ?= "0"
 UBOOT_FIT_GENERATE_KEYS ?= "0"
-- 
2.25.1


