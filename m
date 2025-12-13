Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE21D5AE5B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2977.1765620033143861613
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UBe3dUYs;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2984dfae043so19369105ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620032; x=1766224832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ADkl07pfHrtI+NwUxkWr1NwZTANlOzXnmOvcnEKbHM=;
        b=UBe3dUYsqobsCKOfqTUOuxjyt2/XOyhysUCfcV3yVONSbSpdjytLrcCjjDfniRWkAn
         VpsXVSKOp17Eu8ZTq4VUHWv/CSAFXjK92Ln25MuHM6oX0Lr2xAYwwQ1epMAP2mex5kRU
         LuN45CoGBJ1DVwaB+qkp1pGNob3w0aEj6wkn2xBmfF56Uy2e507gNyOLFpedV6nZLzXd
         HbWpYvM8h6DRDA5F2r3Y8MR1cSIAXSYrnyMPOwLM2JgVS96PPTzy92xNFuUfSAdR3UhR
         tbtP+JnoNCu9zefGcMZAApzMtZcZdlYhZ2eZkVu/EOrL+6sjEUTMVDTMric+EW8PLyqm
         ULuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620032; x=1766224832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ADkl07pfHrtI+NwUxkWr1NwZTANlOzXnmOvcnEKbHM=;
        b=aUx52CYo8sHnW6/ild3ojuNAJE08CpRQQ+pIGK69Ji16HEJuzbNBPZuGKNd+jmyc6M
         eQ3aA2dfEm4AtOwRwVMN9LmhI2vCU5UrQ4vE48p8KmAehJ4SHM6tDzU7y1daXqmLBw0n
         YiVgIpZpp1GGATdlJ5TNzTOc0KLpZHH/8XOc+wJqoPdv29di4zVkzw0VnyhmzErPI19w
         GVqT/iAPnx5mCag9mLhSImYkHomJZe21SaeIdYWtFT7kXbGp0eEsC31R+w9Zk9yoos62
         YhoOXd43XLvkKGnQJzd90H/QoADSkbqvVczndyjpkiVYq+GcQyDemRo947bnD2eryjM7
         xwUA==
X-Gm-Message-State: AOJu0YzfX2zLagclq40SO/Wnu3zzABdX920/0VUXN7BhblZYrEa9QyAT
	pFY587cvMFk2TUuYO+hJ2qwvf8hjHiDQ14+Zp0h2fzyJv1FHtfANJjNJ+wkcTHvi
X-Gm-Gg: AY/fxX7Uqe7XOudIbbX1A9BRzjWb1yNbqpJM3/ttjmWsqiaRHP8r8D8q5psFm7L4VXR
	wUiNix0Pp8YWMFeUo9SRx2tyH4NVFnVTbeBA3yrMn8eUUApUtxLqUUcYNGMgb1z+FGEs2B49CW5
	CjH/HnJBKU6oHmLCMY5uEi2VzD4jKolC0moEMkwwV2DkiU28Xuk2NJvdBRNtmLXvn4FNkoM7J9K
	xjKjz3WMZ2RBe6OYVJLP7ydKzsAxXXiUUnsIDCMrSB6a8Fi4gPkpCc8lVZDs2Hg8yX+Gxbmnxj6
	Jiw47NJ0gm56EZTzkUvdKTOLrLlxTf88dyPWu4slNOz5ekqeE0b3kRGr9iu48WWyVn+5uYCN9GT
	iScwdMWiGjsY7NLP03OzF7gqotWMKfqJMTYms6O2nV+3kHeklLs9Zw8i5TutGu87q5qDnmWqJPt
	nl7Y8/qOTAd3u/yVj90rZ+JoWK
X-Google-Smtp-Source: AGHT+IH1BFTK51ZwdJa2YDjhpK4EEJlR0BWCE/HdIG2VdW/sZ9FipMAEXW+2eFLgF2NOir7CrsdSGw==
X-Received: by 2002:a17:902:f707:b0:2a0:9040:637b with SMTP id d9443c01a7336-2a090406449mr18188915ad.26.1765620032344;
        Sat, 13 Dec 2025 02:00:32 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:32 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 20/67] spirv-llvm-translator: Upgrade to 21.1.2
Date: Sat, 13 Dec 2025 15:28:44 +0530
Message-ID: <20251213095931.2571498-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227638

From: Khem Raj <raj.khem@gmail.com>

[Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370) (#3386)
[Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak builtin ptr arg type. (#3390) (#3392)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a824c087bd3f3af36374efd45ce6fb8838f813b7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...lvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
index 503e7df644..763afbd608 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "29758b55816c14abb3e4142d42aca7a95bf46710"
+SRCREV = "a37544fc0bb90b4e8b8d755580119c018891dfa4"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "

