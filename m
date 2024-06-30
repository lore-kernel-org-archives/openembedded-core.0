Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6875C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.4260.1719778119000068833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rcd+IJlQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70aaab1cb72so1008865b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778118; x=1720382918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUHmL6hwUZu7fmA0xy2MST1zo8GMGxYT/l1FsHrRs6s=;
        b=Rcd+IJlQ18g6DLghnTHm/FtHUsXbg4SsgV7CNeqTsI5m798em8nVrBZu60aAKeaZsP
         PXAlHaH6cMKVwqRAUiq8KmpcJ3XPQhGiJyaUQvZfifAbymudoxrZJAM6kXdiR15SGaEd
         ad/jR4+mH0GvSapoPETY8FoBvyBRhUhtaNA2l6JUDS6UyM/TSKRuj53fCGmMQ5zCmzRt
         EYhnKdf/ZdVv43OLCQOB32bNKWBO78KJqxNKRwxyj228Kj+mmIUP+TtNyt4A52PLpA0b
         77bcr4crxW0nqtYyy0t9ShGyTxndfSmBtJ/I4U8TtYLsix7yJkqCmKvp8TQK5zXjDGf+
         XfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778118; x=1720382918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUHmL6hwUZu7fmA0xy2MST1zo8GMGxYT/l1FsHrRs6s=;
        b=nubNbvBGOS6MGPKEXsGGsY/xAjZTuVeh3ImgFISfizdOsbOsK9Qpje71M75544o4KH
         S0pIE2WjvGBv9I2RNdk6CMLvxxpUW+nC21W8B5ixTC0pgA6efmYpfZqYTnRAopF7//Yb
         fAUlpQeLKsmldhBbzzS2YHBf2js7hEajG9j4BHZBqS8lx1/5s2SA733Ulvwpze2fbVtm
         +2NnzWtuq1KpUkjY1H3xP+MAzBq0Et4JAQBwd+RQliPxrOfTwNaJ2/akxgYYDrWcOdD5
         m+KbfhnZIi5HI7Cp/cXBdaocNw/P7/6zHrA0DzFrWnQaC70F0CsZSLX4sKNYEaCvBO6H
         AQPg==
X-Gm-Message-State: AOJu0YyAC+MWOQRWM+8j6Pez+LfCYgD4BYTkl2btEtYKKZtIhTPme5ui
	3LQDUYHB4/rH+wndaDRcxW/S0PmPvInY8JLXPWi5draoFPXe2h6/5G3TwROUr7pqHO2j2gN+T5P
	CwN8=
X-Google-Smtp-Source: AGHT+IHWkPDvvwSRfVb6QxHGcwV8HjQPxtOOXiKDS88l0bOrLXZ6MFs8EgIxjG3VTkZqQRaj4OIjyA==
X-Received: by 2002:a05:6a00:1d1d:b0:705:97b3:4605 with SMTP id d2e1a72fcca58-70aaaeec907mr6267368b3a.25.1719778118277;
        Sun, 30 Jun 2024 13:08:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/35] linux-yocto/6.6: intel configuration changes
Date: Sun, 30 Jun 2024 13:07:36 -0700
Message-Id: <b6d9275c81e8abf3321b75b0bfe976d948e8bad7.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201260

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: features/intel-pinctrl: add pinctrl driver for Intel Meteor Lake
    Date: Thu, 9 May 2024 13:01:25 +0800

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: bsp/intel-corei7-64: enable Intel IOMMU support
    Date: Thu, 9 May 2024 13:01:38 +0800

    Enable Intel IOMMU driver for intel-corei7-64 machine.

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1bf24b687f0cd4952eb75b95dd596aa3f11867d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a17e189e8e..7169e94e79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d6479bad645622afeeefff281c6be5339662c701"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 392cbbe9aa..ee21291ac2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index e147fc0d01..2b68a40162 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
 SRCREV_machine:qemux86-64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
 SRCREV_machine:qemumips64 ?= "40b35be7a83982472153cbf0a80fd8ed3f21b053"
 SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


