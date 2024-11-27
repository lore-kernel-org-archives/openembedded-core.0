Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C49D66BBB
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.64664.1732680714967688927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bgGzGSDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso5219047b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680714; x=1733285514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVv8T/U4LV4ak4uYuzVpx1dmzUpqhpbpmfIVRseRXlU=;
        b=bgGzGSDYXErfOX00+bqrVJtJ63HLgNd9Om4p2YyJekiXKcXlDpfKi4L7hms2A68FEE
         OqS5EYX+kOyOt+Rr9tZl+onF1oqBRl1H0ey6Nc7VbacTrOM70KTqu7BXrE3XsxEBQDSZ
         X3RWINQ52Jn+7PBj8TeY33WEQuCR48lVeoTjeUvs9oCywv7EMU1/BDSAKREH2TeRixFy
         lOztkSDzRD1tmV0gwWMOqMnls8Rv+p+id5DZcxbjYqBpr2nyajkqx1E3a1eLsSxxYvyK
         1kWBvaK5+yivvmeFUYeX9gZ4xW0e0EWFO4c5B0amAhKjYkLlwKKUAh9jTeZN1OJhh5As
         OPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680714; x=1733285514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVv8T/U4LV4ak4uYuzVpx1dmzUpqhpbpmfIVRseRXlU=;
        b=WZ8pZHLcoFb6g8g1OeBBw4MWT8EJaFOJXBl6/fPblOIDKNViYhKkeAdlwGRYgt0lYJ
         BxiMLJQFtIYN+0shiWdrL3Fne3IFt8cJPFnDnZWRNefqCJPLjMcLsxRc4bgqAoeWFNuH
         nS1COrB5IDeRxAvDnfgnugdv20Ga8K8TRyfaGdsuQSUKlezyqpfNewXXUuEHmelIOHOZ
         jKJq/EVT2kLdpBwqxiYed1+Dxbybe9ZLBZGeae8do3tV2Fo7lEg33WteU76BjdAljqnt
         lvko8Qv6kq63LSAM0G1kmfQjvSYM3/HtPz19ak18HX5lJ0tbdlGq8g+Rhq2Ksb2/zGYm
         nzIQ==
X-Gm-Message-State: AOJu0YxrwxlK8WpFMKQxhCgrrq8Ah7v/hXzohCVsL211VaBrg9ohRWVg
	98Apwbbjoaf8Tc7a93lNiB0uOH44jjCe2KgxyqzIMiM4rNEaOzynPYhbu9DyPtlz7vL/KogAq/x
	i
X-Gm-Gg: ASbGnctsjUR3kDgrpBFhXIdz0m5vqNbE5xONrHq04196xOscZ82Qliafl6XgsiMPMJ+
	o8FPujr57o2HaStRjtZFuiS0ib1A7Q4K8TF0PYyTqO1mO6OMyPU2s/8VZ55MRMofcGq4PgR5KKK
	jWk6dzUGI3VrYGI0bNK49U+rVp/EqCi7aSsRw1rmEO63SK/9Q3aey9CBBlaAdVio1FrHT7qsAJz
	R9Je3N993aAP/3/ISQOs+wPsKdFNLySVYPfcc4=
X-Google-Smtp-Source: AGHT+IEct65Sq/bf+N8ZkIOKG7X8ngkJkNd8jwk5ChN+jDb8RzmbiIGaeSe5xuZIOZOaCNuch/3Iug==
X-Received: by 2002:a05:6a00:3a1c:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-7253013e41dmr1966332b3a.16.1732680714141;
        Tue, 26 Nov 2024 20:11:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/18] linux-yocto/6.10: cfg: gpio: allow to re-enable the deprecated GPIO sysfs interface
Date: Tue, 26 Nov 2024 20:11:27 -0800
Message-Id: <b286e3dd8624cab0c57fe85c457b617e402ff6b9.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207901

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bartosz Golaszewski
    Email: bartosz.golaszewski@linaro.org
    Subject: gpio: allow to re-enable the deprecated GPIO sysfs interface
    Date: Mon, 11 Nov 2024 14:08:23 +0100

    The GPIO sysfs interface is disabled in standard linux config and in
    general users should use the character device instead but there are still
    programs out there that depend on it so for the time being add a kernel
    feature allowing to enable it.

    Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae19861bfc336d869a7a84b13ab3e7b318e1b560)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 8f87a096ad..fa78313a9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index abfee6953d..d21fd63d38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 9b2334afd0..45d7bfd619 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


