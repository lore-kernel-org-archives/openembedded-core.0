Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F46FC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:15:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5262.1657883716657368418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ET/a3MfC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e15so1052781wro.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuBPjCqahwZrbcVWkqjlIvHqqelDauk7v4lYA6NupH4=;
        b=ET/a3MfCwAn/ZzwQbuQzNIPOuvFA3VuFclC6Jsw/lfXzGWZOlYkseDJiY2nJbbND08
         yZTRtpuY4BJnxMF11iPcuP6dLcYFIm6iRXZmWZNKPQ47QHiKDpODHGS4rVztrDrJN0EW
         WplrVIPaa+neqC+yfcS+unFBriU4AjTxU6bLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuBPjCqahwZrbcVWkqjlIvHqqelDauk7v4lYA6NupH4=;
        b=V7pR6pw5k9laiVMmv8nAC1bikaR9AZ2mUqFUspEmTw1nL2OI3SsxW4RvTQUU+qYMm2
         TF6pGDDazmbt0WFRqhGpyAjcG3cayskvO7gvC4VlH5W9CXpeOKYQXkjWD3KExxMRsv6g
         uYb89nEC69yRhbYaRRwhJ07+yKP33fZEjaeqp2aKzcExnihC9yqe+Ky49Fu37w0y1YzJ
         ow+kz6IrjVfwud792KLDmJ7a/I+QNYvf97tV9joZQo1qteMcmK7DYi5nJyTx3Rnb4LH3
         bWD0jbZCt4iASkHxoDfqJVqugq9vj3P0dmLXjTwk9iqEE6jpNb0iX00/xwsWMxmxVIfu
         A34g==
X-Gm-Message-State: AJIora9DkWSqWpv8NzU40IOWG100Dv4+kN3vxCW4QUd6U5F9sd065PXw
	XKNc0FHxzYQbvlVwFY9xOGkqZhowuHGIHA==
X-Google-Smtp-Source: 
 AGRyM1si//xbjsDJjfG/DrNNITWlG1w08AnuiFUrkJzPuuweXX3566+JYJWvqu/Zpx1/GPfJQ+L9yA==
X-Received: by 2002:a5d:64e8:0:b0:21d:b277:d4a7 with SMTP id
 g8-20020a5d64e8000000b0021db277d4a7mr12415684wri.621.1657883714545;
        Fri, 15 Jul 2022 04:15:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b0021d6f03b524sm3518841wrp.48.2022.07.15.04.15.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:15:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Update test to work with bitbake
 changes
Date: Fri, 15 Jul 2022 12:15:13 +0100
Message-Id: <20220715111513.634043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:15:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168057

Bitbake is dropping the DL_DIR fallback for local file urls and ensuring
local urls are fetchable. This test fails as it copies the meta directory
of COREBASE but not scripts and nativesdk-qemu-helper references runqemu
from there which doesn't exist in the copied data.

Tweak to symlink scripts into position in the copied metadata which
avoids the now fatal parsing error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 4a32af902fb..4749f28ab8c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -594,6 +594,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         copy_layer_2 = self.topdir + "/meta-copy2/meta"
 
         oe.path.copytree(core_layer, copy_layer_1)
+        os.symlink(os.path.dirname(core_layer) + "/scripts", self.topdir + "/meta-copy1/scripts")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
 """)
@@ -603,6 +604,7 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
         bitbake("bash -S none")
 
         oe.path.copytree(core_layer, copy_layer_2)
+        os.symlink(os.path.dirname(core_layer) + "/scripts", self.topdir + "/meta-copy2/scripts")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 """)
-- 
2.34.1


