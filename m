Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758CFC47E49
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.5986.1705698869899161975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nmuKKkdg;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc2308fe275so1145647276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698869; x=1706303669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2R02UepQ+XCiGnutFSW2R6GlACuGb1pZL6xvOphVpw=;
        b=nmuKKkdgYz3FLifHar6mDJsLk4Uh4wbRIP/np5j82iIHCr+O0oBpG8icgm5tmYcETG
         9KXxwLtGl4KcODp890PjDkPZ0vhwF2W72IvBngvGOZtlByVinxIg6mCTQcmogdpI/x1Y
         RVc94DVvMYBzvfotp/riMu0wuxgeRrObEcPMCMqC82U/LLeWk03cHRASTq5N0YT+c2br
         r4SVzBAlVSn4aKYes2dnE1jkEeyVuFqhw8GXCyfwXjMLoNETWJunPZlv/h85Hnmpi3t6
         FAX4a010MtkE5YHswPtk1G/pBD2Bn9ErAJBAdoCn9+VLL6PqK/+Ko0xHBgItHVcigAQJ
         1yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698869; x=1706303669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2R02UepQ+XCiGnutFSW2R6GlACuGb1pZL6xvOphVpw=;
        b=fwsakApmtStSLXoPkVD5tQmrCNAEWfHsk/MOYyu7NN8+dYZtVvHK7Ln0OUkFhQQGqj
         q2Sj5C6DpJEA4QJgs/5+wuI4vLw2NyKslA7L/2LmtiU/44Pg9jwc6iWMZPBYPCfRwLUl
         tgvtuy5CQoE8AEm+m6y6ows4CCu+nlwzLXrURnp88UhO1YENb3tscUZOxEo/9vvHNMEV
         v0GzyHExT3QX+eRD0XKFtOIIw6hl4r1yjTcvKppWEB0VInSKZEFr4F9uBoOPXRQ2RFi2
         HPElOxlskgKRxiiLdQ70K1GFkBZALdXQ7BbFGMeyWkSNtTr8KaHD5y/j6kggcGiAH6q9
         apuw==
X-Gm-Message-State: AOJu0Yw6TeZv2yXyRLJU2Krm6raHLZ6+tpH19uJfQeQN6TYHVeIHUthX
	SfeVkHsK7sbtEcjw36HHqtCjErn5px82UbT3OmWXJNfdvBy3GmdPujEXK99jTTM=
X-Google-Smtp-Source: AGHT+IEXX7rT/sdRsnIGUFpYLJck5A1lUCLn+fwlOkj8xjiZz9iPhhz1hiJJ6rTlsWnoCltblIn96g==
X-Received: by 2002:a25:bf91:0:b0:dc2:2f9c:bfa1 with SMTP id l17-20020a25bf91000000b00dc22f9cbfa1mr509853ybk.8.1705698868979;
        Fri, 19 Jan 2024 13:14:28 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] linux-yocto/6.1: security/cfg: add configs to harden protection
Date: Fri, 19 Jan 2024 16:14:15 -0500
Message-Id: <309df25db3eb44693830d364ea9f10e4563c2ec2.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194073

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
2.39.2


