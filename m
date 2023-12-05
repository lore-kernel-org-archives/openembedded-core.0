Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DEAC10F05
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:27:17 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.93043.1701750428482070710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NYg0cgHp;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67ab19339b4so19886826d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701750427; x=1702355227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCMxU+ooYkcKTXHXYG0+NKOPfVfJQmj+rDfOJ0Zdcdw=;
        b=NYg0cgHp2wMp8lGucbSkxKIANCTOhdp9RtHBBsrEIyi41XwSA2eIEIQ9PLONgPHNBt
         J1ZMRpjfVx+P8z83XrcrwJw0M/42BjDMdIFY1qNM0bYDRRJW6jkPqNDVLNnbuQQbkACE
         bWKjpFkvWI+/L95EE4u/s3EHthaONpboruV49W3NrckKB/zWh6nnBBAKxkIartdsHkS4
         plWz2PkDrlEuxVURWhuKahVNzr6dJ7hHuMn8tLoFc3+nhzRzLvOTkoCfNG3lB8A4vZ4y
         A657H6crfioVPmxgicEkjzqIsdGMUVOLTaC2bgFQuOCV95UaVYI6D3JB14lk4EDITsdZ
         zseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701750427; x=1702355227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCMxU+ooYkcKTXHXYG0+NKOPfVfJQmj+rDfOJ0Zdcdw=;
        b=VvpULl36jgzmziA2e+da4G4KONpyQ4DgsXKQgN2KmPz85oEAgtz4aMTqpjC6SQzyV5
         hY8rRZpuY0HT2M2+28L/HqgkuETPMLA9rs1eSGlyDwxQKlCD8rUb+IzvtkKxPz87XbOs
         jPkbXJKwfneTPn8d+DhHimaxsRjYFl5aDn8s7wQKsjz7IQmoWNmUKWymIYYowgKmDZba
         nV+EhcONe9o4uDma0qWg2/rfovD8ALOl0vcGUV9xHY9c8gg78s5K1WnrXU1iKWfeNrw+
         lxJ4Ic7dJLq8dxm2NV6wwTFvVZR2pBsveiUD0rYsxIs9f4SRQkLYCnO2iftkYZEe0wSL
         X3Hw==
X-Gm-Message-State: AOJu0YxbKc5sKJ7B4DHKd+DWCjoJYRLSpYoo1DMgAViVlX6EF/xwJJK5
	WgE4MTGtK2gqqBICnulPSRc=
X-Google-Smtp-Source: AGHT+IH6pJb4MsAb205F0RaOxYMWT7pNBwgvpalQwe8mypI/e/R47lIt2rZsuumGjegteH4Ga1RVAg==
X-Received: by 2002:a05:6214:1710:b0:67a:a721:d77f with SMTP id db16-20020a056214171000b0067aa721d77fmr775757qvb.101.1701750427314;
        Mon, 04 Dec 2023 20:27:07 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b0042542160fd0sm2963298qtb.20.2023.12.04.20.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:27:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.5: cfg: split runtime and symbol debug
Date: Mon,  4 Dec 2023 23:26:56 -0500
Message-Id: <b5a285b107d0f413883766fb84fa5ea2407d3d5d.1701750230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701750230.git.bruce.ashfield@gmail.com>
References: <cover.1701750230.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191778

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: debug: move PREEMPT_DEBUG to a runtime debug fragment
    Date: Thu, 9 Nov 2023 12:08:31 -0500

    For tools like spdx and debuggers to work with the kernel, we
    require extra information. That is provided by the DEBUG_INFO
    flags.

    In that same fragment, some runtime debugging is being enabled
    and that adds signficant overhead to the kernel.

    Let's start a new runtime debug fragment with DEBUG_PREEMPT
    and locking. We can add more to this in the future.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index f004339749..abe788f03d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "833c5da68398da64271c26188b9e15286e8e725c"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index cc75c0c702..ca1c17a84e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "16b52743d64980d531e120aec62c9220b695a269"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 5cdf0e02d0..43ab8c2776 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
 SRCREV_machine:qemux86-64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
 SRCREV_machine:qemumips64 ?= "b63329018323409369e952c84ac6481e68a9b6af"
 SRCREV_machine ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
+SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


