Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E62EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.11767.1689696104159667453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=z5MnsFQW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6686a05bc66so4281718b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696103; x=1692288103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi6zLeMRpuCY7R68sBGRdbCrUhRVagmQuyb5m2mHJmM=;
        b=z5MnsFQWbzZ+VvXI/xanb8teH1112ZZPzHiAFiVo6a5yzWFe09QKMaladK0MLy2Ufy
         L18584NWvXpaalfl6anNxD1dGXx45flWvQVKTKb0pBUVFfKQXJdTOH/ZSG2RHl7n/PMb
         UxQEmrKXDCuAIsa2qfTXIW2Hag9z/l/EaYdrrOAr8RHnE46UP3/KWq+4vC+US6gbmUbR
         I+DUlYvbTaA02KyrlENDRlXKTYhX2azcjFojYIxFZBskMkj5j/nQVSHupN1RvutzhCc3
         LRI9HthqulUv6ErpCKJzVE0UKgfOpMFanr35j7P7BhmkhG2kButoLpQX3cstPHu1IKm6
         Lk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696103; x=1692288103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi6zLeMRpuCY7R68sBGRdbCrUhRVagmQuyb5m2mHJmM=;
        b=LGvdYc5TqjL1Au2ZkxU+v3YzLVptKEsw7Xu093VRGsWf75BTyNkZ9GIt/Kol7cMaiS
         90I5CiYiROyfHIgeqfaMtaIbk6ioQbWbwC6v3nG1xRj0rctQhl8hSfJZVVQQukuuqc83
         eiFIeFMPi/VqjlFboHTqROVOy/E6SEvG9GowuFn6WJH4eO4Nw3LUFnXglL9dJCIPHXb+
         MHbXqdBgJMHtICuWF14AUsnRIIfuJPr1Wwxaqs/2K6s2dIKUHrcyrLLquBIZ0IhH58Or
         /hnExnl8xIN5MBKFAKshwNGT34ghpICyNQny3X/pD+pFN8Rtn/QSzVii58N/5gngC4gF
         qhNQ==
X-Gm-Message-State: ABy/qLaI8wYfheif+GwsuDq/r5DMjWnZ8qOgO35SExS7/GjTxGHPAmzW
	i8ZDWLJQ4MPDrLOGVy5L1nuIEAMDWj7Xx90JHgg=
X-Google-Smtp-Source: APBJJlGrA0SRHJWKm/bs+npCbhOOKwlac0wdi24l1Ury3rA1O3aPLhm18N3SMvhWJeA5VjKNyY0rTg==
X-Received: by 2002:a05:6a00:1949:b0:682:d2af:218 with SMTP id s9-20020a056a00194900b00682d2af0218mr2733690pfk.24.1689696103168;
        Tue, 18 Jul 2023 09:01:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/13] kernel-fitimage: fix dtbo support for fit images
Date: Tue, 18 Jul 2023 06:01:02 -1000
Message-Id: <d1b6c34d33704f05374154e4ea7d8acdea7b8018.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184548

From: Anthony Bagwell <aj.bagwell@gmail.com>

8a2f4e143 added support for u-boot boot script but missed adding the
extra parameter to fitimage_emit_section_config on the dtbo branch

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22bac8aea0d5d28cc5a3bf20edf638225cce2f88)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index b88d7dbe4b..7c7bcd3fc0 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -519,7 +519,7 @@ fitimage_assemble() {
 		for DTB in ${DTBS}; do
 			dtb_ext=${DTB##*.}
 			if [ "${dtb_ext}" = "dtbo" ]; then
-				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "" "${DTB}" "" "${bootscr_id}" "" "`expr ${i} = ${dtbcount}`"
 			else
 				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
-- 
2.34.1


