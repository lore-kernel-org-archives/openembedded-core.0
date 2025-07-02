Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA42CC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 10:44:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.20644.1751453060922861235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 03:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hs8t4Sbd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3572443f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751453059; x=1752057859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/xdUk6pk2v5A0bKDxSFHqTX+xenZ6ycxI/WZ7m7yjU=;
        b=Hs8t4SbdwxfFdGgoM0ZEnz/+gfVQoXMCOUNRFCgexZXGJBkahKSPL7AtYJoAYMAQ2r
         Me+LrfzpPgEGWKx9heRSk0D5YRutbYlFT2vyr1BCZULx0fxE5yukT0KL7kNKRQe5+5LO
         Xhb/GB9A+q1u0qJt2ir+VHqno/W/3mCOTd8po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453059; x=1752057859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/xdUk6pk2v5A0bKDxSFHqTX+xenZ6ycxI/WZ7m7yjU=;
        b=P72QbE+LBI4V9Ja2fWa4nsXOh41mYEbmz2i8bfN9brPzHF3uUPJU3hRjTTSxoj5ej5
         1EycxKEKnbc6FKNA1fB/ltwVgWYDPOKziIbeN1O5uqrpTDciVAWSOGZNMmWz8w/qT7cX
         1yFdujkLSH7vLbyByzD4sQp8lkHYzPRVTzHc9E4PNr2xo4gUNVpxLBjHmDTT17KeDBQE
         rBtzqrfBCeJ11k9ziVU+kOzXlR/Dqe0np9CyFn4mvet8suIn5MySoXjvonwG88FpNKVx
         JV+x68DxHUmfZwaoUTLypk6o811n6v8u46k92yEkeISfbE+bhq93QPHSjKK3TUz6+xlb
         bckA==
X-Gm-Message-State: AOJu0YwTPNRpUCB0Bope8yd+SHGp2rnOm1lJwGtvmkiVdbKkAheSAZ+o
	KKm3xOrd6k8NbRt4APRQLymxLpROW3n7xHKiIY/GOHPUi2PX37aCJUnakgyQOX+ojDm4IgQHea5
	Y4K8o
X-Gm-Gg: ASbGncs6XkbOVnacByO6Rj9ttHhDIzvrRLMutkVPrOYelEmIrfcQJtHnnjQjehANth2
	HqkoCMZh/k/YFwSSor76zkZpOXGmkVls7Eudzn7lck3KG9E9IHTeu63P5Kkgr5We9c/Tzt0unSF
	gC9VppPGBeOM3M1Pvm6TCT/2XyPbubjysWstzYIYdru9wqt6yt+jTZCMw8qkWVPBSBM0+PqxZzH
	rbEOmvlA2Dx+hiqXMdVOivVSiqfQETWG/ELsYptXTFCkcTmAkvBhSxl7H3kHG+rPOCakJqfwmYG
	Y6E8S3hhkcdDTyqbYYew3VstLoxUY+3zBep/grWqZztPOKleLYtVktGZkWQ4mN45U6ZfHcs1UJj
	hSDKXFRiuGcEFNOY=
X-Google-Smtp-Source: AGHT+IGuvoK5RgzLqQ/IaA5/oN7Vs7U8BXWDgXOVKnWHlYMf1ehF459kwUTCJ2R3OjQ6AeShO4fPRw==
X-Received: by 2002:a05:6000:491a:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3b20048ccc4mr1692748f8f.43.1751453058597;
        Wed, 02 Jul 2025 03:44:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595d1sm15886414f8f.71.2025.07.02.03.44.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:44:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Reference gcc/g++ directly
Date: Wed,  2 Jul 2025 11:44:16 +0100
Message-ID: <20250702104416.3600982-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 10:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219819

BUILD_CC and BUILD_CXX can be overridden on a per recipe context now so
these tests don't make sense in this form any more. They assume gcc/g++
so lets just use those directly.

This fixes things to work with toolchain selection for the native
case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 3c103d3bfb3..1044ed9cc69 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -606,7 +606,7 @@ def drop_v14_cross_builds(d):
 
 def check_cpp_toolchain_flag(d, flag, error_message=None):
     """
-    Checks if the C++ toolchain support the given flag
+    Checks if the g++ compiler supports the given flag
     """
     import shlex
     import subprocess
@@ -619,7 +619,7 @@ def check_cpp_toolchain_flag(d, flag, error_message=None):
     }
     """
 
-    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", flag]
+    cmd = ["g++", "-x", "c++","-", "-o", "/dev/null", flag]
     try:
         subprocess.run(cmd, input=cpp_code, capture_output=True, text=True, check=True)
         return None
@@ -697,11 +697,11 @@ def check_sanity_version_change(status, d):
     if not check_app_exists("${MAKE}", d):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('${BUILD_CC}', d):
-        missing = missing + "C Compiler (%s)," % d.getVar("BUILD_CC")
+    if not check_app_exists('gcc', d):
+        missing = missing + "C Compiler (gcc),"
 
-    if not check_app_exists('${BUILD_CXX}', d):
-        missing = missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX")
+    if not check_app_exists('g++', d):
+        missing = missing + "C++ Compiler (g++),"
 
     required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES')
 

