Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D30C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:13:54 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40351.1789136032552755179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TKAPYl7n;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso11853895e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789136031; x=1789740831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vy+BiNE/fHvvfLNFW0nWPgFj7MUzpwsFGA/rjhiDMss=;
        b=TKAPYl7nxEU2r/rPIWyaPdEC2OEyH8OuHmuGzlGnslMP3IW0wuyfbyp40PRNGZOMf1
         B807eP/T8xlqq7MJYGg6fpQxVvVu7gY9LVwfBai2wsqYE4KLz2CXeV7MEOKYbCPs96oQ
         Stf/EMCKZVz1cYyJ/lZ2BsDQq3g+DZQEr0LQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136031; x=1789740831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vy+BiNE/fHvvfLNFW0nWPgFj7MUzpwsFGA/rjhiDMss=;
        b=QxfnkB5C4t0dhSQxvKV4yWealfgmuaPlNFaAB3e/oBlPgfetuUMtVAMj7orHSLKgZl
         ZBoDmG3ROFOuB4mg7Nl45FM8N8U+5mLwhISMO7RxsTKkkRxe18jPFbQ4Q8fFOIrK+6EK
         uHAiUvoF2N7u/vHPlc4h37h76+L5vzhTOTdaFghb2JPHo9uFXuwwX7/I4hDPJ+SF6Gws
         +MVODFcjwFAQaPwwaAF0fASD2cjGlioYmZ+4fEspJzUHkPoPwxixWBYZpkbdBs2o+5Wa
         IGsy9hTeuy9ZoiUcBQpzOtbh14V0CXZXlYa9zsW/AGT7LcswkQqFXI0vmUDemzdU5CXj
         hgSA==
X-Gm-Message-State: AFuF++meJDmYz6Oc6NXfdrGn1EcSYiEcJjYGVJxuTO8umsHzF2k6c8it
	kN+gDFKeWJpWRTly+9x+wyepAf+30pFSFhjcxDXpq2rEHltTXryJ46R6Ng7p3Zb+ENOAd8dMCzB
	k8BX051I=
X-Gm-Gg: AYBFou02f/ZciBhwRAAjE0aqEky5zRu7338PdFpPwWpyEUjsXEjjR/eEKJF31QwnBe+
	hi5Aa+cGWdGRybsx2/2iAtDhigATKikEp8YZrSnH08XnzDxJsr4kZam1y/Mo1gVp7o7LrSgpeLS
	/c0JIIfCGPmHva0YaiiZD/G6wwo0kJ/QqWF8gk03nV7SXrKn8I54eOhkbbixetPzJnbXDmjQUIM
	rK+OhALA0FVLRpy5Dq2zw/hq6SrL0u7IL/2IwE4TnG9YLgTH5jedMDRYiVvfyNcCDhPKONTiIwC
	5q0NOM6DbBJWRo75aRezcSzXopYqkjnDXN37vjegoGZGbrOtWiuF1f2ismN06W2D98x76vqHHdv
	riJEr8CO+6ePc+x13+YjPcj0WSpJJtLrVCB9byER840fDnKemimqJ4g2hyGEZ8VypRpdimnYpS3
	QuYH7BnXbS38qIkthakc9lFoWDjpRl8Jh/QyyVk9cOpI3q2clMV/FrPp7y9hlr6C7IWuG5OnSBb
	H+5qji2c3GCmxHt6h31DZ8DsRU7
X-Received: by 2002:a05:600c:3d8b:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49e619e81bfmr106989545e9.9.1789136030734;
        Fri, 11 Sep 2026 07:13:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d0:78c1:8753:128b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm267851205e9.6.2026.09.11.07.13.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:13:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ffmpeg: Fix makefile directory creation race
Date: Fri, 11 Sep 2026 15:13:47 +0100
Message-ID: <20260911141348.3434533-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911141348.3434533-1-richard.purdie@linuxfoundation.org>
References: <20260911141348.3434533-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245652

The recent upgrade exposed another make race in ffmpeg. Add a patch which
resolves it, submitted upstream (pending moderator approval).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ffmpeg/ffmpeg/makerace.patch              | 29 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
new file mode 100644
index 00000000000..c2f87b25fb5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
@@ -0,0 +1,29 @@
+An easy to reproduce make race:
+
+$ make libswscale/x86/uops_macros.gen.asm
+HOSTCC	libswscale/x86/uops_macros.gen.asm
+cc1: fatal error: opening output file libswscale/x86/uops_macros.gen.asm: No such file or directory
+
+It needs the missing directory creation dependency adding.
+
+Upstream-Status: Submitted [Sent to https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/ 2026/9/11]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+ 
+Index: ffmpeg-9.0.1/libswscale/x86/Makefile
+===================================================================
+--- ffmpeg-9.0.1.orig/libswscale/x86/Makefile
++++ ffmpeg-9.0.1/libswscale/x86/Makefile
+@@ -1,3 +1,5 @@
++OUTDIRS += $(SUBDIR)x86
++
+ OBJS                            += x86/rgb2rgb.o                        \
+                                    x86/swscale.o                        \
+                                    x86/yuv2rgb.o                        \
+@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/
+ $(SUBDIR)x86/ops_int.o: $(SUBDIR)x86/uops_macros.gen.asm
+ $(SUBDIR)x86/ops_float.o: $(SUBDIR)x86/uops_macros.gen.asm
+ $(SUBDIR)x86/uops_macros.gen.asm: $(SRC_PATH)/libswscale/x86/uops_macros.asm.h \
+-                                  $(SRC_PATH)/libswscale/uops_macros.h
++                                  $(SRC_PATH)/libswscale/uops_macros.h | $(SUBDIR)x86
+ 	$(HOSTCC) $(HOSTCC_E) $(CPPFLAGS) $<
+ endif
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
index a954234e7f1..07eff2a4e5e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
@@ -24,6 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
+           file://makerace.patch \
            "
 
 SRC_URI[sha256sum] = "cf38e0e28c7e5605942c4a77755349b0145804a397af37eb1fb4c77cb237f635"

