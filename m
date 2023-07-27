Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05C2C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 15:38:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.10721.1690472326800149885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 08:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YE63ArdI;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso1112077b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690472326; x=1691077126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3ljLX8BTo0Ohsfh8Hw97/EvaP3rjonYNblfOqlgE3Q=;
        b=YE63ArdIoGAYPvdyIoTssymcxLUpU2rpHKeJxYed9bNZmQw/77Q51TweoksnQbMUbB
         j7hYj4YpH7wazXDT9jd6koI4EXnQOww3q7Fg3Mn2yjdR7C43eC17tQF+H/xTH5jLLAg+
         BE0DY9Hm8BhRy0g84u42PwX2y7oynJ/fd7ZzzWKfue86o/4wRFO0EVVDeVsglqJla3NM
         vLxbxGaxHcz3SZsNAYo4l5C+xdirj8fnfUx6e/4aI8i/5F6g68AS0AsmaFBQE8evbrh4
         ks2z2O/drA3SH3LdLRhuH13ac3D+iLfuPiFNYnUZD6aaxmJYPhgqIxq24RQkqRLZsyhz
         jIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690472326; x=1691077126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3ljLX8BTo0Ohsfh8Hw97/EvaP3rjonYNblfOqlgE3Q=;
        b=jgcf8p2Z2vAT9/deenAa3brm4WGPFnLYiDOZsc5pt4w2pgm4kpssgtxt958H2aPlXS
         WLGvakIwNUWczRgpU6wKnYWUrJec0QZZBPV86nUPhaXOrIf9AjhFiXZ/fJyoznEin2gN
         82cKBX80uRNXUdk53+Hx1nAOexhdrG5fpsxBy+90tzzBQ00bDtCsR60ob16rAo2WTySx
         dx511N2+wDzARmsHCTDEcfec5oYhKPffQVYfVg7yfyeHToC1dfE8GvVps7iFHPhoVw6v
         HhCrpeFl/DD1t9rFVbVHrkTiVI4/gqQyX3H8YfzAf8bZ8HY7PF2bvM31tyEgArU6lw2l
         Ne6g==
X-Gm-Message-State: ABy/qLZ7edpdSGEKmxJj8Co7GPgQbZvSpoLDcCj9nlymGeJ3/8O75nhS
	K7+Xt6rH4R0KgX7S3AmO6FkoAYpoCQ9fuA==
X-Google-Smtp-Source: APBJJlEJcjf27dKNf3jiEwEKVDG0GltYftIFb0WJs/H7s4JSkATUUL5AkOkSvev1GQ/RBR3kNimJdg==
X-Received: by 2002:a05:6a20:3c8a:b0:133:d17d:193a with SMTP id b10-20020a056a203c8a00b00133d17d193amr6919461pzj.59.1690472325791;
        Thu, 27 Jul 2023 08:38:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::32be])
        by smtp.gmail.com with ESMTPSA id g16-20020a62e310000000b00686be6e0f5csm1640451pfh.108.2023.07.27.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:38:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] ltp: Use bfd linker when lld is distro linker default
Date: Thu, 27 Jul 2023 08:38:42 -0700
Message-ID: <20230727153842.2322545-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 15:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184965

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also fix KVM_LD and remove -fuse-ld=lld
v3: Drop remove operation, its not needed

 meta/recipes-extended/ltp/ltp_20230516.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
index e9407d3148e..9c9acc6c145 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -41,13 +41,14 @@ inherit autotools-brokensep pkgconfig
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
 
 # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
 # it fails with gold also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
 # work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.41.0


