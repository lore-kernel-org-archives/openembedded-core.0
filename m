Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2999F8DFF2
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28575.1776378797816872237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KY1ZqYen;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so731155e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378796; x=1776983596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcZ/HfQtRKtWZJsk4vppdO7Mc19rvtmmKW48HwDGObU=;
        b=KY1ZqYeneYxy77SbdPmlV9FndeMWEaGHLrzpnGT0X/g33CmNx+3pe2hROK1upTeCXR
         /x7yuEQUQFOu8coUmFx75QQAv1bVeP/v+HNxEE3t0+rxXs3w4nYqsH1s96Bu0Rfu0XO6
         ixTS8NcHvpTbh01EMZZKfvRhB9X+k8DvdrDM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378796; x=1776983596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcZ/HfQtRKtWZJsk4vppdO7Mc19rvtmmKW48HwDGObU=;
        b=ZJNiMuE0Kd4zo3Ch7b63I27W2R9yhx9cpKk+7A3nv456dM8Z+FJS822nC0GPgRUPZa
         bmS5XlKwxNetfIs+jEeaCPg/UpTSrv8OXDbTx1hcV6+W0r1h3vM2s5CvMDuj4G+nQxPM
         LZS6nlQORyh+9ImYGXGcF3bDuQse/Gf6tW4ugvtpzk8QK/rcaEAyJNH7JCbM2WiXbkyx
         +/PKN12GjcPU6JfvTkB+DuP2q1k9RXAOmV/7y9W2gYJ1nvThXTDkVDGCfjWOF4b8ZORX
         /bf6faOnPEjdZy+F1XU1drvq0FWxv06z1FEe765mesP9vLfqTB1z2LCeMYWOyQmGtW62
         XC2w==
X-Gm-Message-State: AOJu0YxtHq0YThjgOmYJnZm7bpWGNrUGeEYSXSpPl5kPgVxQ9UsordBW
	UgUWTyd6cDmgnbjicllgeSYc9ZIvjqsywwM8v8CfLJz2WiG2rxdGVptpqkc+SwJDzsvRATC3z3q
	OjITupjH4wg==
X-Gm-Gg: AeBDietkN0FevMuJGOC3v2ShwsmVwWd2nqlGSokHeWpTJ0aYsauhvNff3V26cODMXEE
	hZhBWM18AScExmo2CdxmI+E+U/uMearQStTo177+MoDaE9aEiXbyDiHL+cVqf17/x33qymiMfI1
	bSjeGENDqN1giURC99Q2I37G9u9pMz03GdhLPBEOdvNUkwHJqSuX429sNCqAQv2AXTZZnhWzxL3
	DRyPHBOJ4Ka/cjqGpTXtsVnhNdOWSQdrvEcXBx0Knw9xhC8rPHfuOM9cDC9f9ZnpmYO3YePnOb7
	fqS9q71PckgRMx2j3b4VmfSn8PaXAPXajWe6hbYz0m93GL2TDVQWs/ZC6DSmOeD33cEieYAe3sM
	vGLGWRMUd9NTQtqu9w5j7p5faVoh5tJH4KEiJ1HwHnUwS/DP0yLCr7NUKfpolIpVe01BaGVEBv1
	5Ivg6JVSIwAdVsjtQdaqWNuKQTK5K0mboTBMT/TZzWb0pk1lz1SSGmNP8h0e2CAfcO5P71Z0qmr
	vgtV0B5bKhXB5KGkjBbGTRggtISsh+4EpQ9tQ==
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr5007995e9.2.1776378795830;
        Thu, 16 Apr 2026 15:33:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 26/51] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Fri, 17 Apr 2026 00:30:09 +0200
Message-ID: <84c2eb57c30101cc5f6acd0bd62b6af5d7e22e0f.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235455

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8340d4be03646f0b4b599f768ddc88f502f93615)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da515d19270..1292f4288bc 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -19,6 +19,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

