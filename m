Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17E2CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10385.1781682328462036013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z9rvIIxG;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4629051c946so220554f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682327; x=1782287127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JzwM/wrdYhYuzJr0neAZQa0nCbcnuxYnQZ/7wC72O8=;
        b=Z9rvIIxG8fCIdg1TCpPwk1ISw94GuF4q3lhk9FTa/k9f1xPqw4jIJu5zppwYVjfl6R
         azPv3GZScKSyPPeMtsSb5xAprjka334qUoafPtPoYcQizRVEx2W6U2lB0Mes9j1ptt1Q
         +WSyTKGjJcT48uX6ro+dJDrQ31tZXOUord+bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682327; x=1782287127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JzwM/wrdYhYuzJr0neAZQa0nCbcnuxYnQZ/7wC72O8=;
        b=SaW97T6JCfytRcxrFpvY0kiZ0RS11w+nNIfHIDoeuxMY/ZkCSSV4/vOus8JzuHl0oO
         328gr7I4BysHYmya7yIYHJIXbbEjQYNBW3owFjXh8HypG/adp/mbwlVCVdE98Ekawjhj
         xpuiSOkVxfAd7DGh6Vy9Rzk3lEY+TS3kxAS1ogiIHjvScsTltf6HTY6/ADDxdDfEwiXo
         mjeVzJ+Il+lwEoe8G/i4VFk54JMIroJK1xGiU7JyUMB5w8NEAomHxEkiz36bmntycsQX
         xeW8UCQB6iLRE78+VcAOsw6aReMMHKsgw1/ifHvI7iv5TDiwfM+26MxJDCJLQIYp1WB+
         BXLA==
X-Gm-Message-State: AOJu0YwDXBADp3qbLoVE4nhwdts/dstrog56W27bzjWLXRxhhsGQu3is
	60sH7DU/NKnqUju1hqWkgZ68g53rRHZT+aQIt1f186WiNYazIDfk/2gQUVFR8ORUqMM5OMnH3Gh
	oRMm/
X-Gm-Gg: AfdE7clvAVeg7vJXwCKMy0OxZFz1j5lHMyOaQxW49bxJSf0hXXVrDBHO3t1egDUFVh/
	YJpyU/UBde+n30JVuwqlIShkY2lid9e7aECnLrCjxKna+9pjshe6qvD0WFRjYPnRdfg5CED2Jqk
	tW7j/wYldAgQdbNvnv+1fAG2mbpdM4KyBV/iPi9gqY3ZgB+4r4qDYbvG8ECIpW7puoUnykjrwqK
	Ps/tmYCkAqhbnSVlaUVTeB3HhCEEJsxWIg+PwoMzyVVX+UUBV/0LUY0m/fGUvPOIlnGHTJuXYhx
	LOQr/v9ncUti5VZPx16QV0VksfB2EGvAIWkKQMI6SYO7FvCUR8tFmhyj55tVlYpttZZRNXDOPcy
	wnhFJuTuNylOtwCTHu7Yt4+9cRCGF657ZvQAhwK37W2NHdJMq8OQHBWC/szSBVsxf+WUsvFvRTH
	AR1fz/vglxUK88TTiXf4PBiT/oizhE4fWyioN4wrheldKcorpH84pCSjfNrKGl/m5Gq3UW45jK6
	wGS+An/nRXhSuoBtpj1fk27D2QM
X-Received: by 2002:a5d:64e4:0:b0:44f:69f4:39b5 with SMTP id ffacd0b85a97d-4626c13a684mr2799401f8f.29.1781682326631;
        Wed, 17 Jun 2026 00:45:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/30] conf/machine: fix typos in ARM and x86 README files
Date: Wed, 17 Jun 2026 09:44:36 +0200
Message-ID: <4f5c4af9fa044a3e744f0c2d44aa101adcded0ff.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238983

From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>

Correct spelling errors in the machine include README documentation
for both ARM and x86 architectures to improve clarity.

ARM changes:
- Fix TUNE_PKGACH -> TUNE_PKGARCH.
- Fix "definiton" -> "definition".
- Fix "Curently" -> "Currently".
- Fix "specificed" -> "specified".

x86 changes:
- Fix "define" -> "defined".
- Fix "to to" duplication.

Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
(cherry picked from commit a77dd221c31e44a17784c15f5402ef785fb9c1b7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/machine/include/arm/README | 6 +++---
 meta/conf/machine/include/x86/README | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index c5637798e6f..bccbb1bdee9 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given tune.
 
 A small set of ARM specific variables have been defined to allow 
 TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
-change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be 
+change the definition of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be 
 ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
 default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
@@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch component specified by each
 tuning.  This is the primary identifier of a tuning.  Usual values are:
 arm, armv4, armv5, armv6, armv7a, etc.
 
-ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is 
+ARMPKGSFX_THUMB - This is the thumb specific suffix.  Currently it is 
 defined in feature-arm-thumb.inc.
 
 ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is set 
 to 'e' when on armv5 and the dsp feature is enabled.
 
 ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currently 
-two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.  
+two defined ABIs specified, standard EABI and Hard Float (VFP) EABI.  
 When the callconvention-hard is enabled, "hf" is specified, otherwise it 
 is blank.
 
diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/include/x86/README
index 05aee533a71..f0a1882d818 100644
--- a/meta/conf/machine/include/x86/README
+++ b/meta/conf/machine/include/x86/README
@@ -4,7 +4,7 @@
 Most of the items for the X86 architectures are defined in the single
 arch-x86 file.
 
-Three ABIs are define, m32, mx32 and m64.
+Three ABIs are defined, m32, mx32 and m64.
 
 The following is the list of X86 specific variables:
 
@@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
 TUNE_PKGARCH = ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
 
 The package architecture for 32-bit targets is historical and generally
-set to to match the core compatible processor type, i.e. i386.
+set to match the core compatible processor type, i.e. i386.
 
 For 64-bit architectures, the architecture is expected to end in '_64'.
 

