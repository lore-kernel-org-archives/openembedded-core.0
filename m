Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09D3C25B74
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.3823.1714704050039910826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+6zwbcc;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78f05341128so582326985a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704049; x=1715308849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9cDz5ZM3e1ArFiT6fGLdyJGS/SRMIbhKJwwLycF6Ag=;
        b=R+6zwbccB6HwZt9fU28jdegmpN8aDUb8NYKebpfWYykofoxK73HE1gS/JMxqX3DAvP
         SwbIRM5CkTmS5w8AyI4moueqx0MrtXye4dE0U/hbP8AZwVAJfPOb2ZNWZFmDC4pzDFUh
         RBOy+5HtgtGAuyqxj29R510949hFobGDHY0dUc+UIV/BNom31wXvzeoTfc3nkKKud+hN
         IpQjs0OUHHrjasdEPlGY6omZe+uSHpbCIGigTNxb4NOCgyBsqUwfhID/usaraQDNnZKW
         g6H1oJu2UBFKLgs9dwtslbd4x4ZHMKKA5cxxqNL4RlpC/+/STI+WDVgfaNl8HMBQBXdZ
         OUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704049; x=1715308849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9cDz5ZM3e1ArFiT6fGLdyJGS/SRMIbhKJwwLycF6Ag=;
        b=bndDHqilWAeaLawhmAJ7K7uPznjXIsipguaD12ZIs/BEV9mnI7RcPzvKrhEPgheoJU
         jnBrEXJqDd2Wlkjh5MTxNBRLC3JxLyIlCXCjzc4Cb2gRpZckCCYeqoGwNpwlLxTtuROZ
         MTuZreIkpppYlMOxot5uYWzD6kA+yCA10XKfCkHA/JlJyEFpA7e2jNWvJvVEGba/kPVm
         om1AvzwHO0fhlQAN004cxn7nZspjNfUVXmeE6ai4+mA2FAgrAduwB3DCWA98iZ8i/eKZ
         +Kt/Dy2mIhAVZIrCbvDsoXyvD/67Q40+nW8z4EuDiWgKrgWFprVq5KTtEhO4dG6dSlEY
         rqUw==
X-Gm-Message-State: AOJu0YwCIzrEE1vT6hlDx+eI/4WPqJsYCf2Vrz3SUg689+dKUQpyw9pX
	rGZxjQpgmSNfPkHsPR10X021PZezoPufBx5Ob1obwE2m+leqhN/NHHiQjA==
X-Google-Smtp-Source: AGHT+IF/Usfe2dZwXBrHm+b/NAO+HJOTkTROCeT7fcmaP6aXDNYT5uBlG/kBzB7D3Wcn9YM2xOirjg==
X-Received: by 2002:a05:620a:cc4:b0:790:f905:3c4b with SMTP id b4-20020a05620a0cc400b00790f9053c4bmr1232024qkj.57.1714704049024;
        Thu, 02 May 2024 19:40:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] linux-yocto/6.6: nft: enable veth
Date: Thu,  2 May 2024 22:40:33 -0400
Message-Id: <bbadf7a01e4847e464eea11090f595f9637c19bf.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198936

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: nft_test.cfg: Enable CONFIG_VETH
    Date: Wed, 10 Apr 2024 16:11:47 -0700

    nftable ptests do create interfaces of veth type and this
    feature would be needed to enable those tests

    e.g. from tests/shell/testcases/packetpath/vlan_8021ad_tag

    ip link add veth0 netns $ns1 type veth peer name veth0 netns $ns2

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 5071550640..be60bbee78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9f39c8adfc6025293e5ff131f7bb4f728edd0c99"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index a4af8c8a16..559ca3563a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 583dade097..b0674348e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
 SRCREV_machine:qemux86-64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
 SRCREV_machine:qemumips64 ?= "936a9ceb126dfb2cc4b38229cab68636263ecfab"
 SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


