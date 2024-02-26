Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3F4C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:06 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.7230.1708986897850325175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X5MhI6jx;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68f901192afso19391206d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986897; x=1709591697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0Ujq/eOPyrYnrYFrxifE0OBL2FjG2MMkDXbex7xlI0=;
        b=X5MhI6jxfOcZDVBPzUXOR6KnugUGVQvzECqPUO8c8vsfif2bS1IC72MhObcrMKV6/U
         2lqyoXJZT7eVWAIYouAVFmW3kiocW+O/Y4XnhZa7l6cAEsJUYplvr6KQHukrGljpXVCt
         LJIc0LeZaX32JE1uoExjokJG1+e9vaLFvzxZQQOM0qV+G6jN9wrlewK+bCtrjHxPOXhv
         Uc0JI4mxSsDial6tAtURf37FX9p/7PIvt5QEmlzVNHowYZXhbyaM8OrZpuESYK+4QnGe
         yBNcxjeuXw2ux1e0XIMQ3Su5J280O/xwXRDGBkABardJjhD2BTlrOsUV9Dfywa+2KDzC
         bu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986897; x=1709591697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0Ujq/eOPyrYnrYFrxifE0OBL2FjG2MMkDXbex7xlI0=;
        b=Vq2lMj3JSvJ9KULvJu0GDIU3XWfTCgr3YUBEM6S+wLC4dNX7L8lrupqjUCpjnnuIV8
         sypWT48elPQO9qbiVsa6OflpVfMsEGKwY9/BhDXVVDFAwjtr7Nyi7HatRQn7dJlRZqMX
         YIPAQ2qb0mM4YCsuG4K2hGBAR+kduXQGFoyCOYd46JwBQC8zx+vNQrjR9Qezj029cp34
         roIPLCzhsSqY1GWXVcXerpJwHR8zFXiUhF6SS/Mds1CWZ+v7v50E4CKWHysLKzmedbzJ
         ineYSu//DdFzjsMkjcNrAx8gMFxu7GbE4p9UVM/gpVzUOT2SgX68ia8pofOGR+Yxp7rZ
         gNsw==
X-Gm-Message-State: AOJu0Yx1mKJwKaK+E4giEovUVEqFY1wvsFVoVjFtBNvBBxB32MEMpiLA
	2RMZxfnLebw9gXKLLaylAXl+YEMncjSKLLaplUOb1nZAFRQ1jaVL
X-Google-Smtp-Source: AGHT+IFCu66EKTcUUL8w4+UN27jOJqe34QvhrO5oOlXfbq5UdtGxqKPW1zB/renNrJPCjnXfBj1XxA==
X-Received: by 2002:a0c:b681:0:b0:68d:1d9:2be8 with SMTP id u1-20020a0cb681000000b0068d01d92be8mr471978qvd.51.1708986896842;
        Mon, 26 Feb 2024 14:34:56 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:34:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/6.6: enable squashfs for selftests
Date: Mon, 26 Feb 2024 17:34:48 -0500
Message-Id: <efcb1c071025432f0b57446885e85803fece906c.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196225

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Vyacheslav Yurkov
    Email: uvv.mail@gmail.com
    Subject: squashfs: Add initial support
    Date: Wed, 21 Feb 2024 07:15:31 +0100

    It's required at least in selftest to test read-only file systems.

    Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 11f8b0ac21..ab28df64cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "f0a5daf40acf2b457445f9b4f97f9eb2a3d1508a"
-SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
+SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 597ee8eeb5..7ac6987582 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
+SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0dc95ba754..2b93f5d185 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemux86-64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
 SRCREV_machine:qemumips64 ?= "7c478488b642339d97ac55fd8b1acfd086e95c5c"
 SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
+SRCREV_meta ?= "7fa1deab7b048f2b8c5cad8268e48419e00b92fb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


