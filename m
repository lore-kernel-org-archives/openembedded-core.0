Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6ACC77B60
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.44324.1679494939056805020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yDXt0HxE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso19304189pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZikPyctQpdKU61NhwhoKqw/ktGoFIB9OEt/V6Pxpx0=;
        b=yDXt0HxEJ0HYynFGpPPfiGN6iTbIve/2otFjLjmZWrUENhW/8/28OYEMQRm/JG+I9M
         42YzFYoQ6Np6vcMAbXNE+njjDraCJeaxAxn0zvcEeQzpahDioFLbDBjJkphqxa+SrQLa
         iDbNLPOUCHVwT1oalSn2Kg2nqGcewq/s441DmSOz9cgq7nTApCIOGnoATAfG9LtVb//W
         im87+ANK++xU6dnqux76JiHFkEEKj1eaO+2RJqgUHyEhf5JgZUohcYmRSj2xB0YeWjvP
         fMkkbzaJ9X+VjjQTTWkm4d5kKmk1g6z3UtCwY9a77ip111vpiIabQzo8A+y3OuC8O8V2
         3Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZikPyctQpdKU61NhwhoKqw/ktGoFIB9OEt/V6Pxpx0=;
        b=VaMziJexZaa+K93LsRtqX40bzhzFc9GLTgw5hIxP7Vm2pxLTnuvjyExwL24dtq5z0O
         3x168uARtMjNogaU4mb0Kvwa2kpWXfNupc2wl27RMMBVTSRTIvXL96IPuA6qWRJaWRjO
         Xw7nEvFSP6p+2zaAmYDb3iATXNufavh0J6qUt62oNEua83X3r1eyGl52iOA3KBXeFyMJ
         0nxtomXCT0tBRlXZYUzCGmhqF6kNO7TS8xxdmUv48phmLLHxSOdClHqgvYIpgnCQ/PSK
         d2ZSVisg+cE3LidDhzOJ1UzAyVDCSCjuhehshavNtcdtMV7XHDPKk+pgNSKJUU0cPZO7
         dSdg==
X-Gm-Message-State: AO0yUKV1h9tyHTiXrCF81w8jDaO5SMPNVe0ZvF0P4UNjWkabusm3iMlt
	k/yOcERK17d7NU3w9mQnj2ktfnR3SHpVWqZMxJg=
X-Google-Smtp-Source: AK7set/nHt/BaRlZ77LriybwBKAPr6u/L1dKQQYiN+cW6r3X4KMrEcNpT38AKFQ6t4OCRqabS5480Q==
X-Received: by 2002:a05:6a20:b23:b0:d9:b94c:54a2 with SMTP id x35-20020a056a200b2300b000d9b94c54a2mr4691326pzf.16.1679494938111;
        Wed, 22 Mar 2023 07:22:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/21] mdadm: fix tests/02lineargrow
Date: Wed, 22 Mar 2023 04:21:36 -1000
Message-Id: <fd3aaff0e52fad6075b5e1c516ed2aff2a3742fc.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178942

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix tests/02lineargrow.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 3c2d554f141eb64785e86c8d1e5d85c65caaf322)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ow-clear-the-superblock-at-every-ite.patch | 33 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch b/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
new file mode 100644
index 0000000000..1a7104b76d
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
@@ -0,0 +1,33 @@
+From a2c832465fc75202e244327b2081231dfa974617 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:16 -0600
+Subject: [PATCH] tests/02lineargrow: clear the superblock at every iteration
+
+This fixes 02lineargrow test as prior metadata causes --add operation
+to misbehave.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/02lineargrow | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/02lineargrow b/tests/02lineargrow
+index e05c219d..595bf9f2 100644
+--- a/tests/02lineargrow
++++ b/tests/02lineargrow
+@@ -20,4 +20,6 @@ do
+   testdev $md0 3 $sz 1
+ 
+   mdadm -S $md0
++  mdadm --zero /dev/loop2
++  mdadm --zero /dev/loop3
+ done
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index be08d512d7..120c7f582b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
            file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
+           file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


