Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C6DC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:09:32 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.6641.1699348170529569127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2ldZx1H;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso801700466b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699348169; x=1699952969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0u3tSK1GVkEYkrNInbodp7NKxm3pcdM/fKLtgNpuTs=;
        b=W2ldZx1HXyOe/VBDkAl5S8nzAFW8rjw5t1Of9/SVsiXmONwxQBUGSxT+XDDeZbAx7z
         N0BHDtLHTz2Nxk3WAFD2MgpvHRwS81UD8DimpbLTqaOyKj17a6HxnZqrZEULzkT2MRgU
         UabWgJ1iFeCyYT/p9uoZAbbq/Dc+BSdqhPlSVyosOKaA5qx420A0Vp8znlv473VFiR87
         6ejZJuYE14zylxlVcOatypEZvOL7Bf2SPft9TzayKywl8KIOy0bf8FvQOySw0nwRUPLB
         WLs7kUy+qRNFDib4mAYPjtFet3FbBwUUHyW0YlQq514ysxHHMWeUm01GDF5xfPw7Y0us
         rk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699348169; x=1699952969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0u3tSK1GVkEYkrNInbodp7NKxm3pcdM/fKLtgNpuTs=;
        b=rEMlU3/kSyxHCs7ybgUNuShMoCSGHCB/9wmg4PGjR8of61ANB8b8aIbORXBEWihxnq
         vS/YbeoYXnIhJcqbCJ1Y4OtxIXtXfULOm4FaP8w7Oynu2TKCWezzRoYT1VMcobA+oUdJ
         fS69cuRaTp9o4XtCAumnwWvgNOK84/H/mf2kuV1tdVt9I04GzzPTMgixSzcDMSOsuakU
         u/0IcKrl7CrZewNWlU29YrScz9fk9t34Nw0J5BVCx/nY7p3eu8EEROUlH83zH/bDhSHV
         bD4LH+F3dWsZVde8dkJiRRHuI+SQjNmDOWi2kCE2UABgirGzSWIZ+kOB8GKeLSO3Dr3e
         26og==
X-Gm-Message-State: AOJu0YxqmlcmCeyQTe6JWT0LgFdsCjjRadhPOI4RhadD26kR7S8Tx7Wo
	w9dF+0E1DNn2eoHMU3g6PHh7amsuD7c=
X-Google-Smtp-Source: AGHT+IGKWxMUXqy9Ks6MRQWOjTA6StQtD/qSPP62RbxWXVdU6K6yBnP87b6tjtEDNBaJPZ7DAvwREw==
X-Received: by 2002:a17:906:fd8a:b0:9d3:8d1e:ceb with SMTP id xa10-20020a170906fd8a00b009d38d1e0cebmr15728593ejb.23.1699348168426;
        Tue, 07 Nov 2023 01:09:28 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y6-20020a1709063a8600b00988e953a586sm796370ejd.61.2023.11.07.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:09:27 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2] perf: fix build with latest kernel
Date: Tue,  7 Nov 2023 06:08:52 -0300
Message-Id: <20231107090852.1478021-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 09:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190256

From: Max Krummenacher <max.krummenacher@toradex.com>

Kernel 6.7-rc1 commit 02e85f74668e ("tools: arm64: Add a Makefile for
generating sysreg-defs.h") uses files from arch/arm64/tools/,
gen-sysreg.awk and sysreg.
Without the files the build of perf fails independent of the used
architecture (confirmed with armv7 and qemux86_64).

As arch/arm64/tools/ has been added with 5.13 allow perf to build
even it that directory does not exist.

Add arch/arm64/tools/ to PERF_SRC.

Fixes:
| make[3]: *** No rule to make target '.../qemux86_64-tdx-linux/perf/1.0/perf-1.0/arch/arm64/tools/gen-sysreg.awk', needed by '.../qemux86_64-tdx-linux/perf/1.0/perf-1.0/tools/arch/arm64/include/generated/asm/sysreg-defs.h'.  Stop.
| make[2]: *** [Makefile.perf:456: arm64-sysreg-defs] Error 2

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Changes in v2:
- drop distinction between needed and optional files in PERF_SRC
- allow all file paths in PERF_SRC to not exist, but bb.warn about them

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a392166e73..287d3e68f7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -135,6 +135,7 @@ PERF_SRC ?= "Makefile \
              tools/perf \
              tools/scripts \
              scripts/ \
+             arch/arm64/tools \
              arch/${ARCH}/Makefile \
 "
 
@@ -180,7 +181,8 @@ python copy_perf_source_from_kernel() {
         src = oe.path.join(src_dir, s)
         dest = oe.path.join(dest_dir, s)
         if not os.path.exists(src):
-            bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not match the kernel version." % src)
+            bb.warn("Path does not exist: %s. Maybe PERF_SRC lists more files than what your kernel version provides and needs." % src)
+            continue
         if os.path.isdir(src):
             oe.path.copyhardlinktree(src, dest)
         else:
-- 
2.35.3


