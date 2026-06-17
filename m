Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109FFCD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10439.1781682488333451997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uQKvKGEU;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4619990ca5fso1952281f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682486; x=1782287286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syP5TuopevqJ8BRYp06FKgLnD30WQWd0veHkA6coQrk=;
        b=uQKvKGEU8R3NFPLfofFxfzcDarzHJGb68PAib5irEJWAdcQsOXVTfv8D4R3eLIIU8H
         /v8zXVSxFJrhKyNfj+tawPwfzLGXcStuFeD8cDBJiQJTLklh+4RiBxejy2gzY8AcnWLf
         lWjqZwvucYS8AM+WseAMpSJz1ZSQLkNKb8xR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682486; x=1782287286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=syP5TuopevqJ8BRYp06FKgLnD30WQWd0veHkA6coQrk=;
        b=Fu7BxuUn1QcDO/HnIVE7OU1Abc7FWUV7yzNB/aqvfUV6MkiyEjfJLMk3bqIoFD2Jlc
         JqfzF82jDxyjs/l5Phml5VS8Lt4iumhg0h1rRHxPQMI2fdWg+zeQqY8C6Dwu00E1xL8x
         +NgPwz+1Fwz65DU/JvTJM4dX5AG0+zKjU9NVtBbFJj35bU9hpraWRgG97UToGxexM/kf
         9lFN2LJuGzzZLXQ+9hpILFyuE0VXSogf91K3Trf8bpZj/oVIdH75/0Dyzqdx04QtYOHh
         95Sqf3h8TW2wNJiXJxGpN5hItFD2aFClDvmMyMf6baAgovo2VCI2/uFp61hZaJQFuXYA
         F4yw==
X-Gm-Message-State: AOJu0YwYwKgPN2O4OSiZ6Jmd/UTl820ZRVPdZ9wi2HczSij7MUEnjH52
	HWxl00SzZ4j7MGcNpgWapEU+dyxYEwntGk8fToYYo4STBVLhLB2ElBNMPE67bsHZaKAnVkcTd70
	xAoqa
X-Gm-Gg: Acq92OFrq1SOLhAy+res5TTIqVgpZXr6t5FWvW9p611MGJ01vss0t4sAPisUgcTYnSV
	RuLMH+3GEzWaMV2iDK4lblhyhuMYcfDGZXWlzaqko3vrdzm1+NuCB1VDW+HOudnkYP/3GTJlw37
	K9vifX2YtSGTSgrq/GkBtRXqTeqeGzpbBHi00M7/vVJ/KqarrAJAw2TDK6LN/444dtB1mA0AGfS
	lej2JX2yjAeKOln2UhPI2UePWSGSJcsfzPMKhQ3J1ENN6rVXZWue/1o9/c+saKTV+sIg2Y9td+4
	uwVVQJMaxDZ1OvvswSO9NMlTospVOgBcgfcIBCFJvnpekW4qLMzzwH0yXJknT6SAVJQKxJZZPwh
	ysDtwcxSH0v5ZDx3S1ZEa6HfvSyQME5n/XEIieZbOAodgftKL2XeFP6ymmzBCLs0ferHYdoRFJw
	oA4L9BasoO37cwIwIo0H9pLOQdwvx1Z6YiSwbLZl16FwGRZBNM0sw7n10MIIqULvIztLdQbV+IM
	ARKnCepsrGaYg3oAw==
X-Received: by 2002:a05:600d:84ca:20b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492333f7f68mr32446025e9.35.1781682486475;
        Wed, 17 Jun 2026 00:48:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 2/8] conf/machine: fix typos in ARM and x86 README files
Date: Wed, 17 Jun 2026 09:47:53 +0200
Message-ID: <9ec47b2706c28fe9a92303ddd150c5dadb38f713.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239017

From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>

Correct spelling errors in the machine include README documentation
for both ARM and x86 architectures to improve clarity.

ARM changes:
- Fix TUNE_PKGACH -> TUNE_PKGARCH.
- Fix "definiton" -> "definition".
- Fix "curently" -> "Currently".
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
 

