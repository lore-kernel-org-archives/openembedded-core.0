Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784A7CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.57864.1697817111573738255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=14twKhIZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9b7c234a7so7835865ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817110; x=1698421910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHZ31MIEmLVnZMOySR1x+BBJfhj3kretdKAieM5YumA=;
        b=14twKhIZoPMMVLfZS8h5zPqDFzqXCS9LQpSGcZNbFAulGRhyEHJXQUtinKXmqA6Ngp
         PPpNNfYd5ZAbDcD98mZ33vs6bGB36yb+aqCIoGQ2I0wEMiI0iyUTrVQCcLCHITPcizKu
         b6KCK2E3yHZJeoHODtYZ65Fil5zjhcaID8AW65x9pXlwNEX5bRyz4SQqIH1oex5GIXfo
         5B1kzPqu6ws18NvjGyzwBHW0yJcNnZSk09NYKnun9magF0FvxwfLUQ0uaBG685hTan7R
         7KO1Acw28YUzoS2oJVlE7qeM7m7N6LQMZW3gKGeopOMwGZAXTmLGbUL+7zv70ZGfuEEv
         VppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817111; x=1698421911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHZ31MIEmLVnZMOySR1x+BBJfhj3kretdKAieM5YumA=;
        b=QzKAygPCMRs3QinbTKS+6gM7YJUWapd2le34q1shx2WmoqDrmRkl3P/sH6CwRoZtKD
         DCoRk6qAEoX5U7k2JXUMRwpE+5Ah8cncADYuNcTuLsLHBiSZ/Frhy4+Py31aUgYdvSS3
         sBTk96lpN+LPZ/aOWaKjujUurX+3Tos7mN53ts4CwMKYIVmtt1TtrQTr3DqM8MsQQHeb
         OxQZYtQT+CBNui7+uafbY8KNRq8a00h/qdkEbpq0XS0dCPduJLlZDf46x0aQMQp/ATe7
         7M3ZWIIv4fFqpH3VS7TVP35I0sM94Bk0rQyMKA9XQkEWxUysTnK1xohxTKY4wbOuHvmN
         owKw==
X-Gm-Message-State: AOJu0YwvksZX9KiGFHWz04pp2qqc94GuJfnwKAWQP+dzdNQWKi3LIB/9
	BsgDG34a2j0GmXIjR4957qfw6PSxfGFx88322Zg=
X-Google-Smtp-Source: AGHT+IGN9K8OPdhw7rdjT9gX5nAnp/C/bGWJvDJP4/Er27Lg/nGczlj5z7gVzO/fmEvfdBnANarbwQ==
X-Received: by 2002:a17:902:f550:b0:1ca:7086:60f7 with SMTP id h16-20020a170902f55000b001ca708660f7mr2306823plf.28.1697817110518;
        Fri, 20 Oct 2023 08:51:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/24] linux-yocto/6.1: tiny: fix arm 32 boot
Date: Fri, 20 Oct 2023 05:51:12 -1000
Message-Id: <80dd08fb9685ae04e4c9f99d9dd32d9044efe8f2.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189555

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    0816d0a6984 qemuarma15: add ARM_PATCH_PHYS_VIRT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 732d1ee4bc824cb52fab4327601efdb1558b6d9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index ab6dbdb52d..bd782d1b09 100644
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
index 29459fabed..11d87d23a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
+SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 21e22c887e..03cecb2da1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemux86-64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemumips64 ?= "aa0e978c979b84d620ad21132cfdbbf857be3878"
 SRCREV_machine ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
+SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


