Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6D9C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:37:31 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web09.4025.1668004647670723604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gkd0kk8U;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13ae8117023so19803710fac.9
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTeJyGCZftizs6dqpQwkLSDDDCTFebbSR5BS83H+93g=;
        b=Gkd0kk8UgvwpUN6nIoPB5l7/oci8PWAf0Lcx2jd83xruTUewGHFUc8UbgjDQ0JGDwy
         FPK7uduNgT8NsS5cKLWlw9nI31wWSP8MbvgKdydDF4m8berUof6P1I+LcLTtel08NICb
         zkXNPyMyGfmwUDaEPLuotKaPsj8SC0ABklBAiy3uRYTq0Q5y/U/lWzouN7fMNQ4IFNy/
         UMyfppZxN8DzA4DeoK7kkHUCezxu3Ss3zA4rVldsA8LTCfGVcfjRQ3AQlwar42qqqUA2
         r0mPPX+avyukO3Ao5woVHxZ8cZKispZOmjlmtG5LnEDL8Zb1lgt1ltstl3AIEPwxh3l1
         +tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTeJyGCZftizs6dqpQwkLSDDDCTFebbSR5BS83H+93g=;
        b=Nc6g5Ya9KkRiGzZwd2GETN/C+4faTSu/XbQuTc0MDbmwYu3CgGUOs7PwlQYYtvmgE7
         BH8eqGnqAjh8ZfekRaQHE8XQztAG6leqh0T5grH0x41mxrRfBSabEt5+ltCEghm0msht
         jIIWmiBcbLkDBqVZXoMgRJOfvM/lTG58FoHYErO4a0ud0ZNZwBxpSysuDrMPoO2Y4MQB
         V1BEwiR2gFdghZawpNcHLzc9YxYjTtoZdgwM/fuORWq2RcDTNGpeyXjxUJ254rXYduKF
         T9nHXwjMOqzUlQ2eL5cNxICW0LINSf3tCjDAkcskivvura5mj/0lKm2DnhSfuurr68w2
         eODA==
X-Gm-Message-State: ACrzQf1pf84NTZ1qpbv/VLnXw7ps9VNepITwFCWQX9zroouW1ueQMggr
	m9miIf2jgKORr67Wtnc5kn9lpaRv9EM=
X-Google-Smtp-Source: AMsMyM6QbphAIKwOaawCk1/o15VAwtJ1PTTLogw2zNaFQ1RdfioEAU5Iewtv27HT9lscah57LxnNlA==
X-Received: by 2002:a05:6871:826:b0:13c:7071:5155 with SMTP id q38-20020a056871082600b0013c70715155mr37592610oap.262.1668004646694;
        Wed, 09 Nov 2022 06:37:26 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id u20-20020a056870701400b0011f00b027bdsm6177998oae.45.2022.11.09.06.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:37:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Konrad Weihmann <kweihmann@witekio.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] create-spdx: default share_src for shared sources
Date: Wed,  9 Nov 2022 08:37:14 -0600
Message-Id: <20221109143714.1766658-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173030

From: Konrad Weihmann <kweihmann@witekio.com>

if a source is using work-shared but isn't a kernel,
like for instance llvm-source from meta-clang, share_src was
previously undefined leading to a crash of the python code.
Default to WORKDIR and just override it in case the source being
a kernel recipe.
Additionally changes the variable names in the following, as
they imply that it's only about the kernel, which is not the case
in every case

Signed-off-by: Konrad Weihmann <kweihmann@witekio.com>
On-behalf-of: Avnet Embedded <AvnetEmbedded@avnet.eu>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---

NOTE: This patch must be applied *after* the patch to rename
create-spdx.bbclass -> create-spdx-2.2.bbclass

 meta/classes/create-spdx-2.2.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index af6afcc653..f0513af083 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -795,6 +795,7 @@ def spdx_get_src(d):
             bb.build.exec_func('do_unpack', d)
         # Copy source of kernel to spdx_workdir
         if is_work_shared_spdx(d):
+            share_src = d.getVar('WORKDIR')
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
             src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
@@ -802,8 +803,8 @@ def spdx_get_src(d):
             if bb.data.inherits_class('kernel',d):
                 share_src = d.getVar('STAGING_KERNEL_DIR')
             cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
-            cmd_copy_kernel_result = os.popen(cmd_copy_share).read()
-            bb.note("cmd_copy_kernel_result = " + cmd_copy_kernel_result)
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
 
             git_path = src_dir + "/.git"
             if os.path.exists(git_path):
-- 
2.33.0


