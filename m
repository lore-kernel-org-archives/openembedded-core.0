Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F854C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 07:56:08 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2586.1690444567856183864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 00:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cqLvbHMf;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bb8a89b975so3571085ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690444567; x=1691049367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUdv22bG8xTdlx27soBU++3SuMq8Faj3vBqDc0zK3ik=;
        b=cqLvbHMfEBAYOgOxrCuyM72iUx6L5hwBZGfLfYWrKnypsfg9Su94BmA1teZOA30L3j
         IeUzNEZd64uXdgBejMXGkY8Qq5iBno+NTNw68eDkhMMUcaLCn1imIiUJol89HIYVFCt3
         XXRBnuirqXZpBynhJMm8GB9l24P+qrxXGqOgGfsnA0OvY1N8hItw7wH8Q2G+kYN7kjIA
         rJa9n1vArs7WfWTyqXnzW3TNqwcNpdM0XzGP8MkDx4sEliNM7Z54Rlzs7GIpHgYP4AIY
         54D6pf+5bsnRlYMKe4NWMRoeqDHkhvBuuHYA8rKT7Ilj8sO+Q4FOTbmBueWTebdQ5Huy
         KTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690444567; x=1691049367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUdv22bG8xTdlx27soBU++3SuMq8Faj3vBqDc0zK3ik=;
        b=Plx8r0dx2HYNEiqW9MyLz7/fC7tRfdTiqUb14a+TnQKwl2rjm+9dF5f04/YIIpjCNN
         BikC2J/mgHABQSA3nutSj6EZIqsa4W3yQXKFh4k51aq2bFmuPBAtYaXUXcyYVQ8s2M+d
         2DV19Oel+uE6tvJTBK4t+29bs2oapp0pOdfo5h1mGKzk5/Sj9NWA72w89Sq0dQswbiC/
         hW+t2DvnTROd3lop4HyPu5AIvMkd5xFFTI+3Krz6U5Za7YzAeB9jTzlW1vzloGDBSNDi
         xrO88tJANGRpanZBaBtyXbchYHX0wjv+2CpjrXQWOPLzOVa8xSiO8De1R8eGAGRJ0mDp
         6dUQ==
X-Gm-Message-State: ABy/qLY1wPZSLKuMUQX3IMG/5xUXWGywNxhFD7apRirqoQDWPHk38neQ
	cbjx32/FLCEe0wTav+D60H03SLOPY16NzQ==
X-Google-Smtp-Source: APBJJlEneUUqRzTnRp4kPk8hjFnyHDuz7UbnaJe8g+Ouw/08QYAczHHNs35yrbDQoz8Mb/UCzgcyKw==
X-Received: by 2002:a17:902:dac7:b0:1bb:cd10:823a with SMTP id q7-20020a170902dac700b001bbcd10823amr3892924plx.39.1690444566964;
        Thu, 27 Jul 2023 00:56:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::37f0])
        by smtp.gmail.com with ESMTPSA id jk11-20020a170903330b00b001b8b2a6c4a4sm897803plb.172.2023.07.27.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:56:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ltp: Use bfd linker when lld is distro linker default
Date: Thu, 27 Jul 2023 00:56:04 -0700
Message-ID: <20230727075604.2954034-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184917

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also fix KVM_LD and remove -fuse-ld=lld

 meta/recipes-extended/ltp/ltp_20230516.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
index e9407d3148e..1efb7637dcf 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -41,13 +41,15 @@ inherit autotools-brokensep pkgconfig
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=lld', '', d)}"
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


