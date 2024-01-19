Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A59C47DDE
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.5985.1705698868850935069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQQuew2k;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-429fc7a1eacso10554151cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698868; x=1706303668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZSoorzBu0LauDTvS7VWHc8L/VpKE8V4LtxBKbbasCI=;
        b=XQQuew2kAl22Agcq/AjtG8Q6i2h8lSZOOXJDUHGq6Vs2FOsjIm6c1317ydryJSgscz
         lBl1WZQzrJm14DBEBxmAWzq1L/VJ1fihTIf53HlTnfR3+usaf5/D4dHzFdAvz72rahT1
         +mXFaTh3YUNbKi4Df4VkC71x2gn1PAtBFksTUdGZjiu643LT9Bw7KbhOKPLTBAbs0na1
         1MxX5aYF4lxwAupzCCvv/mGLmWeeqE/62WoANaonQYXKizY7FatcCSpf8DSY9rHXad5S
         O33Otyjk5DZxCLwq3L+WW8tpzORXl7reRqsAQXi+uyE2GifdMwXFa9gIepemdcv2MDzh
         vg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698868; x=1706303668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZSoorzBu0LauDTvS7VWHc8L/VpKE8V4LtxBKbbasCI=;
        b=hf+/izwuLbk0M+DHxkSxv9aGNCOc/22hu/4kFWr1+bAoXvh4PcvI1XHz+uSNNGrg8/
         h5Y0AhStfcFPSVB3x/yEvorVjsiFm8UXW3UvDAkVqPsoc5m5RrkGulJoJgm+jV2UF1UK
         pwFYsjnPzJNkSSLmBWYvr06cbtitntDQ7z9sI3AP6wAToaUyMfZo8Xb5CvbkRP43sI0l
         QAaPsA1vhq99bFKti5vedixr9NPIJ+BZjP07iPt56NBl2ooMA6ncmMQAflwbBFRzVsHu
         Qh22lVwupP2/elMGVO35OyegDWt/378Eh4fnuO0yAD02j5N1nPSyrCcNcv2LCBBcfG8m
         kY5A==
X-Gm-Message-State: AOJu0YwKVGR588FnVbYbhy1UV62nxTzeJRJeCrhGssDoT23YbFWyI790
	HCASGBj0nbbkwOYhho8IhniGEbUcO/zvAksKYzGzUNi86ivA4YaFJ14quJibmfQ=
X-Google-Smtp-Source: AGHT+IHfCELLzjrur5vpl7XPk9xd7stq7suhTi26AdQrzh3wsWHhlgZcny1sOfVnt9xTCrKZCT6v0w==
X-Received: by 2002:a05:6214:d8e:b0:681:78cf:1ed5 with SMTP id e14-20020a0562140d8e00b0068178cf1ed5mr569798qve.50.1705698867881;
        Fri, 19 Jan 2024 13:14:27 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] linux-yocto/6.6: security/cfg: add configs to harden protection
Date: Fri, 19 Jan 2024 16:14:14 -0500
Message-Id: <7806857399611e78c1705b34b7fcf3bec68ae405.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194072

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
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 324494f122..308beb9bc1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e67e7e050ae8af74f9158dc71f952539f1516e5"
-SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
+SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b839bac95d..f32e58f418 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
+SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7c5d5f25d1..0d16fac054 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
 SRCREV_machine:qemux86-64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
 SRCREV_machine:qemumips64 ?= "cbf59cfe385657b0ee385264be2fcf785f6f1959"
 SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
+SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


