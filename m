Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24580C7618E
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.441.1679092976451188233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6KFuetR3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso6780065pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqvFbKKYjVJ0bXrUl0/8eL7oCIAu/uzUa3Nx7VFDUI4=;
        b=6KFuetR3NpgIYJpDbtW5z19WvlArfB1PkCaS/zQAgGQJx8exL/Lfqdu3SI5GNpGEJJ
         p9qv0tM1PAefD5C2nNub0sJ2ttNH+OPceWH5+5ErCnHOX3mOe1BbMud4lrmVHRQ/lnM7
         dZI2l0sHZb7DMqZtoBNbBYBZ5Td2OzxiMxOvxZKNz6rxhtZpVnr8ERuIzWM2GWopU7Vf
         ecazZzJgwBmMEMHsxDBehRUHt5d7VqJGNw8tW4ROQHe2RMcBdpou7M2VLyEy6jqz7X1i
         gcMWtg8Uw84Q1bx9klU5lmt3swRt4d+OD4q5Mv3dmqDXGkbk+rjPauCXu3a1NFUAYfhz
         dI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqvFbKKYjVJ0bXrUl0/8eL7oCIAu/uzUa3Nx7VFDUI4=;
        b=evCvhJbb3cEWUloOnd9e4wHQoN34hv1B/Qzmsi++BWeCeYwnyMZ8q3iOWdMbehpe0h
         nbxUcF71jT4UhTmKCf3Njp8dmKQ5jrGz/qGiMzuOgY/eEsTnbNYO3RbxuPYwsCe7AD5g
         kPbojvdDgkP6p2LTC9RvGX5191ZA6sdkXIWBpY/AtzQHVFAlzLJLk/+g/2XclEDNAZju
         QdnU3gpLlf0yteCWFHSh14cszW3ue887q7NIl184Se8f+h3QNPUj+MkbkstwkXZV71yo
         U9Y5kUcTYIpSovu8c1LX/5MGUk6UPh17jJaDEe/YtdAAII5sF/xj/PJpfAgzouKeJ/py
         Batw==
X-Gm-Message-State: AO0yUKVJV5CcJLORVdCz872yg+wY+79WD2vDcekb+UJ16grfu1fcdWo7
	lTH6Ehr5Eg2SWvh+XPqg8Gv2IL9ImrdPgf5URD0=
X-Google-Smtp-Source: AK7set+1DFZeRxJBoyecbmJmSmX/8xUf5/ecOliEI6DtzgudTrwqXTnTGPeKlo+KcFFBmzSrduQ1VA==
X-Received: by 2002:a17:902:fa48:b0:1a0:7655:2153 with SMTP id lb8-20020a170902fa4800b001a076552153mr7230330plb.41.1679092975566;
        Fri, 17 Mar 2023 15:42:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/21] mdadm: fix tests/02lineargrow
Date: Fri, 17 Mar 2023 12:42:21 -1000
Message-Id: <3c2d554f141eb64785e86c8d1e5d85c65caaf322.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178768

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix tests/02lineargrow.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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


