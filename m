Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4FFC54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.30636.1710889304957285575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Orr7xDzH;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-696147fb5a7so20689236d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889304; x=1711494104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a3aPEA8QY9QGIp/qTxCcsa16to1TgeENAhzN06MKH4=;
        b=Orr7xDzHUbzncdCCECUX3Bw5qLD7QpJaZ2wg+6WBgIKNh3zWzAhq7m48n/QRAjVMYb
         25UIw+mOMr91ZVo2Q9zhLPxUZMKna6bJOKFfZvMWRg0iOFuLU26SlcWssOFWr+TVwMVL
         tQBUVEV1aFUsVe4iH6yUgd3QeaAh300jPCnT4Hs1BQPVzlpAjot17r2ILNWGaXe7vB5N
         SLk6ARcJB8NO1ns5GBML9kDVa0Pxxmm9rpZpdFEdovTb9gFd+84woXPai5iNFp+bMLmH
         Sj6kA+B3scnk6WlT8HXfOy/wP9fIiXmvohsiE01uf6x5/8LOsDQMhAzhOg78CnfKYT4T
         aruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889304; x=1711494104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1a3aPEA8QY9QGIp/qTxCcsa16to1TgeENAhzN06MKH4=;
        b=P/3uddSX8Y6U2ACUqTxOa41r6B5uwFjnWlMzbcM+ywsL1N0zP1ZWbiaMMXtgTy/u97
         bO/q1j+jzE1WU6KtdeGKkiH1Qc+U4EP4/b+9/PcGi3gsIBPbZg5twJISB6cFBxvMsMpB
         Vw66yb8gwB0jiID97AAT3Ibo/A3z/if7fob+/9pTze6lg0PWJi/feDOYdY43kjrULa1Z
         Q/X7m4pQqSKPxnmOPDA0K5I32kp8KG0XRn7q+BHhzHjtSwCx4BqnKZafofg/uutpjcp2
         19SUx40aLBAju8ExSZ6duEGP7DbPPi4QZPqJNteS4A+b9B/hYwVyNu4rBSffco/34vn5
         b1mA==
X-Gm-Message-State: AOJu0YxGX7KyRe+fhNDprsTja2uVG39SeXFOKX1ArU+6xpDUToG3m0uS
	G8BhOzfcoXchk4FsLD08RmWf85aoRCNlLU9l4wGIR/vtXed5iEi3/y2oZK0R
X-Google-Smtp-Source: AGHT+IGrq8IDm2c2RTE+RYllFt9k3fDqOCQUC9zTFLURjNBuO53iA8dk4v1WTs8Id2L8ONAgpWga7Q==
X-Received: by 2002:ad4:57d1:0:b0:690:ed71:d982 with SMTP id y17-20020ad457d1000000b00690ed71d982mr393353qvx.2.1710889304019;
        Tue, 19 Mar 2024 16:01:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/6.6: cfg: drop unsettable options
Date: Tue, 19 Mar 2024 19:01:29 -0400
Message-Id: <8c27863c32994e96ff5fd4372aa809c96db890f0.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197341

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Yongxin Liu
    Email: yongxin.liu@windriver.com
    Subject: features/vfio: remove CONFIG_VFIO_VIRQFD
    Date: Mon, 18 Mar 2024 19:10:37 +0800

    CONFIG_VFIO_VIRQFD was changed to bool in kernel commit
    e2d55709398e ("vfio: Fold vfio_virqfd.ko into vfio.ko") and
    it is not user selectable.

    Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Yongxin Liu
    Email: yongxin.liu@windriver.com
    Subject: features/vfio: remove CONFIG_VFIO_MDEV
    Date: Mon, 18 Mar 2024 19:10:38 +0800

    CONFIG_VFIO_MDEV wasn't a user choice after kerne commit
    8bf8c5ee1f38 ("vfio-mdev: turn VFIO_MDEV into a selectable symbol").

    Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Yongxin Liu
    Email: yongxin.liu@windriver.com
    Subject: bsp/intel-x86: remove CONFIG_IXGB
    Date: Mon, 18 Mar 2024 19:10:39 +0800

    ixgb driver was removed in kernel commit e485f3a6eae0
    ("ixgb: Remove ixgb driver").

    Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 7076a40e1f..1298369d40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "689f65582b3d9a948903cde4e9c29e5fafd1bced"
-SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
+SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f6f4762cbc..82486defd7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
+SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index aaea980df0..3409ce0c8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
 SRCREV_machine:qemux86-64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
 SRCREV_machine:qemumips64 ?= "fe3df2eeb1cca6792c09e6a6530671533ce584e5"
 SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
+SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


