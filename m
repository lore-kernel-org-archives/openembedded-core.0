Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E055C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 07:24:47 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.9046.1690961083028594357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 00:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d1Alimwo;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1274301a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 00:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690961081; x=1691565881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lG0LfdeJMx9zfPCNFEza95BQzqMAXcJd7ruyxUxXhpk=;
        b=d1AlimwouBUTJpQT6ij7NDSK4503QW0BAhiRpT2Bpw+2MkMl7q+r3U4QmfEGs0WTDC
         +blt/WPNeD6RocheK/Lod/R4z4sBnDrSeBUOtxK/XcnvRnL65Eulk8t8TxnosJoweTbD
         M1T8Rv2n9r1cFm5tUrl2gqFTZhw3LlyASoxJ8tQ2yjm4d/lN/HUzO/yFCn3mqhxw8rhQ
         i8x8iQTVvPya9SetxWtTgunuslUkv6qq49ZlHJNQ/DsoQqoTolALR5I3dFhOlWNx3uEA
         Yfxgdp2Ml9di74h/ZiNIn7z6J+UL143Qvt+9RiurRRQwV+VI7hxitiJPrYdVCl7ZkKcv
         ns9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690961081; x=1691565881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lG0LfdeJMx9zfPCNFEza95BQzqMAXcJd7ruyxUxXhpk=;
        b=YTlowMlo0p1HDexupiiYYyA+V4/kKmt9e1wfrZDI/SyY8Brfa1sQ1o3cBgnoIJ3MLE
         om+kzBZZW0WBvLwR7y6mcm/hsxOug+JaP/rkGYvNlysjBGXNTXb7Nn3mpOY4L4KmywdZ
         C69JGTXiel/+N8sX3U4Z8noEXuyIUiiZ6do2R2hZf3WKs7sEcYTSJGWJtLj9VkRgjj05
         3I0NXdeqTxS7b8F/SX9jc3pTrppnkIkyB5sAG6d8NyjOwDnYyBErpPH/zMxGXT49FUYN
         Ps8dtaZz/m/G1W6I9+hkhgzDVlLbzpttzOIVfgiVMYa6LhE7WtOrS3R02VNoS/m5iBU8
         /Dvg==
X-Gm-Message-State: ABy/qLaiIppqiBaKzoMRJg5asLa0Q6yN9fFIxQIMNOoDKQLzj6QxiYMs
	q997FD+1qnFcQ1XFa05W5iX9bkg7x0c=
X-Google-Smtp-Source: APBJJlGx2etUUnSU9kstmRXNcJKHf56r4E0y+kOYk1Za5Ier7sUcpKZvsDGVd1lPEe/RBQD/dGWlnQ==
X-Received: by 2002:a05:6402:358f:b0:51d:b184:efd with SMTP id y15-20020a056402358f00b0051db1840efdmr5772576edc.20.1690961081250;
        Wed, 02 Aug 2023 00:24:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q25-20020a056402033900b0052286e8dee1sm8022013edw.76.2023.08.02.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 00:24:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] devtool/upgrade: raise an error if extracting source produces more than one directory
Date: Wed,  2 Aug 2023 09:24:35 +0200
Message-Id: <20230802072436.1020900-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185378

This can happen if running unpack task produces unrelated files and directories
(e.g. if recipe_qa or other tasks run); in this case it's better to stop, rather
than allow devtool to continue and error out much later with a message that has
nothing to do with where the problem originated.

The idea here was to handle tarballs that don't contain a top level directory and thus
the source tree is one level up; this basically never happens, and if it does we
should find a less brittle way to handle such tarballs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 6c4a62b5584..e015a85982c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -35,6 +35,8 @@ def _get_srctree(tmpdir):
     dirs = scriptutils.filter_src_subdirs(tmpdir)
     if len(dirs) == 1:
         srctree = os.path.join(tmpdir, dirs[0])
+    else:
+        raise DevtoolError("Cannot determine where the source tree is after unpacking in {}: {}".format(tmpdir,dirs))
     return srctree
 
 def _copy_source_code(orig, dest):
-- 
2.30.2


