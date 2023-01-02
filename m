Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382AFC46467
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 18:55:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.43969.1672685748863399534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 10:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xsg/VHyw;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso26130199pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ57ZgFunvDnZc6QFtz3mLotuKtntcKyWi8bOoyUyq8=;
        b=Xsg/VHyw+yzkbUOxHNrYQASkCnOi9BAJ/WhsAauiZ66xey+XbGRszCVUDr60hS1JXI
         cZof3FOQD7hOTAZ3DxfqY8vsID6khFp7pd0adtOEO9dwI1CIq3S2Iyo5RoHpqZaZNlVp
         waX/blQqG8VcytyStTammP24VnX42zJyVpfDqPDWhXvza8+65nAaZoTCTb5VG6PYVLqa
         +t+efnZiS1nGseGBJp5yPezqADyFXWE4/5nc9YrAqMRCBDXXvfBPDnCxuBuZvkUHJrcL
         bCjcknpkSG1K0kgLeYS1W3DkeF8cYeEDsPOL/gsN5AsxWi7PCjX7BkgBAtakJVloNf3F
         WaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ57ZgFunvDnZc6QFtz3mLotuKtntcKyWi8bOoyUyq8=;
        b=2CKju04jtfYnexuEQgNGRCM8JXxuWjTmZKIGHu/l/TQjr4Tux/hbjJS3RALacX7zra
         GbsX7g0oFIeuboVtTuUNDPhKgASCsa0+mUBz1ADaI+1fw5MdSSwq8IUV6v7jP3GReQ8i
         b88ifMnR9D2hHziFp5b1YAHhH7g/CmfCHyrI8SkuzbFpkRtNcj2oSDFx5rJA9Ot0stDJ
         XK5y4n5gvvBBaGAIrPOCbbqLlXf+3DgIqvV2el5lYnWHuExksIi9d8knHDhTvUuRCvvT
         dmPiDzWH9KF/6gmW8+K90MAtFmr1Phe57E/a6BLBb02mqj1GDg3OHqc8YB05EnHKrgXw
         TaDA==
X-Gm-Message-State: AFqh2kq0kOvrmmfi2fL7WteWCOId0KJsoqXzksJ+RxvBflxWqI/NgC39
	KSXn5Q73bSrpVW34mYivk9VCJHls7hs=
X-Google-Smtp-Source: AMrXdXtxn3sqRfZVE+Lv/4lMO2plkMM+TsYGHzuzLt5AMUcg+ohSOBsCIGCL3lceYFCBJ4tV+Ni9Ug==
X-Received: by 2002:a17:903:2481:b0:189:80d1:9d19 with SMTP id p1-20020a170903248100b0018980d19d19mr47865630plw.26.1672685747780;
        Mon, 02 Jan 2023 10:55:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b001896522a23bsm20634020plg.39.2023.01.02.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 10:55:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] time64.conf: Add GLIBC_64BIT_TIME_FLAGS on ppc/x86 as well
Date: Mon,  2 Jan 2023 10:55:44 -0800
Message-Id: <20230102185545.1145069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 18:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175324

Make mips expression across all 32bit mips architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/time64.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index c6a3b682c2..5c53356d4f 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,9 +1,12 @@
 GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
 
-# TODO: Only for 32-bit architectures?
+# Only needed for some 32-bit architectures, some relatively newer
+# architectures do not need it ( e.g. riscv32 )
 TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
 TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:mipsarcho32 = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:powerpc = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+TARGET_CC_ARCH:append:x86 = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
@@ -23,4 +26,3 @@ INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64 setsockopt se
 # libpulsedsp.so is a preload-library that hooks libc functions
 INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
 
-
-- 
2.39.0


