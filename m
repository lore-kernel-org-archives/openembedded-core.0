Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946EFCDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:13 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.18837.1697132348998340109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDeM4y4c;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so689535fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132348; x=1697737148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbSZ2wH/mioo5lwy9bhpaYrp//ysqC4hp1cl49Ddq8Q=;
        b=LDeM4y4cLLJ2a4a4UwDt3yjfN21LMP9RBHskrxrGnCjotwJZzshFQX506zhNipzA3r
         Xia2bt2OoWAyD1w5aidsgTFwJh7AKO6hJjVBdaEknI7dBXBvuNi7DV8LF5BhFBKG7rux
         FF4NP5ss9buxjtGZEg0MnB6qUQfOT+gF2EbQ2c0Uz7wNLK5KiFkG35o2+gPVAbrNkMnG
         4rtvZNUivCieyrQfptCU41KKZuorc7HBqxp5cu+vh7LadrfEINqDZM40FWE539Prr/VR
         45IRHpdufS9cy8U4aIJ+0+PTnbGtfIHvqwucvB3kkb6xkiXb72/SAGDk+KoLX1zHBdj4
         5jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132348; x=1697737148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbSZ2wH/mioo5lwy9bhpaYrp//ysqC4hp1cl49Ddq8Q=;
        b=RPObVTHeoQbOTsjUI++LpRPt5xK8ftir/AaNC1GYJ6ZOmnZJJ+B34RrOVXnOVsK6Fr
         muv5Zdwpr5Xjq9OrIEi0rwwO7SuluHjea7AZB2CE4xRxQZR47V+HofmtzXDGQ2BEKUyi
         awj6ePLbuOOn8xV6Sb4WrV+QGJ90u0lQ3119wcLoJjNFU0dnFcaGdq4sm2NbT8gyyukP
         AJnmyIk5+tU5gZCxHxwoKPXB/Cc3Ey1gcNtGOjcYLkJELQ/zgL8hgX/sWjPQQnrHdE1p
         ZoIfajkwe7E6Db6bOXG0gJ/tH+CPFo54Yqzcd92Q2C5x5tQnuQAgEz8OjM4dPCbuNTWP
         Qifw==
X-Gm-Message-State: AOJu0YyJ4gXOhuZKXfYMTapqgA6dEwWw7lqQGhU0svB+SJLvvt4SDus7
	wQROuXZ0pjMkKifAgMie0kk=
X-Google-Smtp-Source: AGHT+IEInuuuOBl6VkdRfPhR80BTSI3kyr14S6jcxYjbQmMQ1HSuzyJimyuSYS4pEw98Ojet2aYbJw==
X-Received: by 2002:a05:6870:e8d:b0:1e9:87fc:d63a with SMTP id mm13-20020a0568700e8d00b001e987fcd63amr6621553oab.56.1697132348172;
        Thu, 12 Oct 2023 10:39:08 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/6.1: tiny: fix arm 32 boot
Date: Thu, 12 Oct 2023 13:38:58 -0400
Message-Id: <1cf1b6a31a9c8c9cd195b8714a23f64ed4c312e2.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697132218.git.bruce.ashfield@gmail.com>
References: <cover.1697132218.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    0816d0a6984 qemuarma15: add ARM_PATCH_PHYS_VIRT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4e40b021d3..a958ade392 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "4b3040c1dc13aaac356ad4ef45a8926118c732d0"
-SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
+SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 9cc3a09247..fd69408873 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
+SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index b2cb763490..9c9b960f97 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemux86-64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemumips64 ?= "aa0e978c979b84d620ad21132cfdbbf857be3878"
 SRCREV_machine ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
+SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


