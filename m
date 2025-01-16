Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DAEC02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 02:40:37 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.40060.1736995227735839738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 18:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rsV17SAc;
 spf=pass (domain: linaro.org, ip: 209.85.208.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso550781a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 18:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736995226; x=1737600026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYI2vLZIJOzRKA92uZJfG9wwjcqNe7gnitrx5mTpel8=;
        b=rsV17SAcxuDuDkm3hkzxKK/xSqDpTjhdd5ZYHKi9kMRvozWwgBEZbZwoQfHt9IeefN
         HUXaFcemg2K7h8mEjxb+PLBa7fZunLUl84pEqeD8LvArbIq7k/jmt2gDNjD1nrQFfu4d
         t7YUiXSHCIcaEY7mKZUoaSMfZ/Ybx/rSp1vRLkrOMKVa58mnDlFULzkEfCTzvxKsY7PG
         v2Xk9hRmc6dlbSyFnsoea8L0kr6qaa4iMH6YqIozNoBFjujp1MuxpLaBthpy0+RpLrlT
         gqBurU07/MRknIRTnT+88Yaf1NKKNWlIRQ5njFTSuQ9EH4gm6ns1bOM9YwRjiMAFKpy7
         TS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736995226; x=1737600026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYI2vLZIJOzRKA92uZJfG9wwjcqNe7gnitrx5mTpel8=;
        b=WwOq1knfQ3uNuSCovdaXI8wlAQppjOrDdbeOYml4YCs77suYLZWWrTKs3SozUuTuFU
         33F4pkjc0Og5S42JpOt/AyPSwrC213+firWOGYyfaWHyLc2/WBs9Wf3lyOY7vAlh8daM
         oTqryp7JrIXlMK3EnpwUiTkeZi4fLYE/VP6zr8WxTbfzE6M7V347d5mjj5Eoo1AZD+cz
         Q/Wu0cqvlY9YoBl/GGtcYCngvYdZOiJk14A1q6DYCiV4w/CaFmR/023t7Lwh6DikDGSe
         rJNhskeXllPIiwhhlFwMlzvXfAZ3Y6GO2gJXrx/ND28tsMLDRMhaCsi69feqJF0s/LU1
         Ddpw==
X-Gm-Message-State: AOJu0YwdrpkUbtkxbx8i5YncuZBFJ1H+egW4pPctYoZtdr1QnFf+LocH
	5z9P9i2xixaw9sV1ZUwgfl2K4q9Y4ZTS3NN3tPNXdPEjg+/BpAoYegD6iUEb4bVNZF3nSQvOnNo
	m5Us=
X-Gm-Gg: ASbGncvczmgTEUe9WG4v1GV2iKkCtrw0tENzaFbQb4jBWqQd5FFGS/ITfTvoYXhq5lM
	FtAVjlDZz0sL3ufV0+ec4WWIioeWZO7IPpSSPyuWt44ZK4UwKeZTv3BE7Smtg4swKAfxDAjr0Lr
	tYRfae8xC/JDkzSQAB+a93FDIb/AiYmVe4wREW2cNFOX83HC/4Rcxx+wyX8R9HGAbmd5ea09DvT
	iPzudtotOQVx10rHjM2Q5b+n93BBS85ZLblkSw7SomI9de/n+pHeFjCf8JNdxPzBYksukaD
X-Google-Smtp-Source: AGHT+IH0igORtSWOlTBvrs4+/pX7PkuvGhds1ZCfehnPKc47mQ+qAz6mlN0F+LDqHyefmUx5Yx3OBg==
X-Received: by 2002:a05:6402:350b:b0:5db:67a7:e741 with SMTP id 4fb4d7f45d1cf-5db67a7eb0cmr66834a12.8.1736995225606;
        Wed, 15 Jan 2025 18:40:25 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a5277sm7963982a12.80.2025.01.15.18.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 18:40:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: upgrade 20241210 -> 20250109
Date: Thu, 16 Jan 2025 04:40:23 +0200
Message-Id: <20250116024023.500807-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 02:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209931

The linux-firmware now requires GNU Parallel in order to run parallel
builds. As the GNU Parallel is not a part of oe-core (the recipe is
present in meta-oe) disable parallel builds.

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...nux-firmware_20241210.bb => linux-firmware_20250109.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241210.bb => linux-firmware_20250109.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index d3757b5bbc92..ba66ea407dec 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "0b30c661e226decdac3acd31d83517e0"
+WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5"
+SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
 
 inherit allarch
 
@@ -259,6 +259,9 @@ PACKAGECONFIG[deduplicate] = ",,rdfind-native"
 # Possible values are "xz" and "zst".
 FIRMWARE_COMPRESSION ?= ""
 
+# Specifying -j requires GNU parallel, which is a part of meta-oe
+PARALLEL_MAKE = ""
+
 def fw_compr_suffix(d):
     compr = d.getVar('FIRMWARE_COMPRESSION')
     if compr == '':
-- 
2.39.5


