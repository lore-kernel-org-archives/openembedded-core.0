Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C70EC47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8369.1706323078559813661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IIW7Y4/q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d8a66a2976so9533465ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323077; x=1706927877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Raq8N30ep/Eqla9u9bq+0XNyTdbG0PoBBqm1hmK95WM=;
        b=IIW7Y4/q+Qjegrpy9iBii5N8P1iSIvVHVnhVzaHFzo1jLdGbVEGKTs1UFKBKOx9V8u
         xJcDmcOK7QEJZoqzGMRL8FApZZmLdAN49TF45R7rOPV8MDtIyPx0n/+2MblLPLqchQXH
         jH8BoDbQ5mADNj9E0ShFFC1ytnhueqcAZ34hpMaAC6AtPXR7PFI7eNhe1WJYztkobXSW
         8fQe3eM+nHZZ5QpI61Ib6ZXWqb5TlgkMYymBTMdgO/VBxXGP5xcCKPZc9h0mk6hDTIZ0
         lgqzJwtM4RJgQm8XY8Sf0Fb/EA8+7d68yCJ3KZTJDrdj09YJwsuALeOzROYrZ51R4/dq
         Ht8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323077; x=1706927877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Raq8N30ep/Eqla9u9bq+0XNyTdbG0PoBBqm1hmK95WM=;
        b=LANwnXwBBytHGv7oUuLNlPUPFsV9iGaLa665E2Fm+g+q1BHl2jkEWX0OrC4ado6req
         tBPsu4PCVvKJU8A6Vu4R8cKd9Q+Vrzmjy5yh2V8AHcetpgeKR0UrvaxgzOmjsLLiQouT
         VYcdMCn786oL2THCnc5mTFCbrlqih5aenttyPh8Quk6Q7J4ab2n5l2IwLyw5elh7ewqI
         HWuV9QahC51/UcDIzw5YWwv1PeER7p9gKMKLNrXZhcGqHVVpxqsJ3TZ7kyiucYGYAdoa
         q5Jw4ntemLwFZNtbkuz2j5x9NiwGXbnO/Op/O2SbqBtHIiHRVJ8kUJWN8YlqAdW+hNXJ
         I0RQ==
X-Gm-Message-State: AOJu0YwntK7UtyvikaX+5Iv2LVoMhCrg1RKD49Wai1TJK/j7UYH1wWxF
	SB8djmvaZe399sEVtvh3RX0Sl0yqid43eKYYI+te7v3G7+rDyREMxcpaZu4zVj5V8TcdH4t7s/G
	o8hnQlw==
X-Google-Smtp-Source: AGHT+IG2IThh5CN4es1ciArxP/kbgwCMQQBmiG80hjZosHhSAFKiioF/m+nc/PANAKnxCPfyZ7UGdw==
X-Received: by 2002:a17:902:bd97:b0:1d4:bce0:8561 with SMTP id q23-20020a170902bd9700b001d4bce08561mr847856pls.85.1706323077221;
        Fri, 26 Jan 2024 18:37:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/23] linux-yocto/6.1: security/cfg: add configs to harden protection
Date: Fri, 26 Jan 2024 16:37:18 -1000
Message-Id: <6ee7b17677a39302bd14acbc2a4bfe5cb247f32e.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194419

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Xiangyu Chen
    Email: xiangyu.chen@windriver.com
    Subject: feature/security: add configs to harden protection
    Date: Tue, 16 Jan 2024 18:22:31 +0800

    Add some configs to harden protection:
      CONFIG_HW_RANDOM_TPM=y Exposing the TPM's Random Number Generator as a hwrng device.
      CONFIG_DEBUG_WX=y Warn on W+X mappings at boot.
      CONFIG_SECURITY_DMESG_RESTRICT=y Restrict unprivileged access to the kernel syslog.
      CONFIG_LDISC_AUTOLOAD=n Disable automatically load TTY Line Disciplines.

    Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33d3dd8f5469cb0b2999d7f935378899d447b3ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 2d471e3ee3..857197b211 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "6d67557b912380b57b6081da7ac106e9c003f4d1"
-SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
+SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3314e7b2f1..55f78404b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
+SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index fd018db6ed..a75efe66de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
 SRCREV_machine:qemux86-64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
 SRCREV_machine:qemumips64 ?= "3407157586b654c9932356124429ee9dc9f56f18"
 SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "dd140f6b950d56c837dc464af8f2a2a53af24fbf"
+SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


