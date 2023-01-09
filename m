Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE28FC61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:14 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.59785.1673224749607331330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JjRas0xx;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id q10so5194682qvt.10
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNSV7H3qBxWj99tdJ4vSBqSSorddzHA8NWmmJc+Qe+4=;
        b=JjRas0xxr/8caGmqAVaPgD3bJcexVEXKjyiTBF+1mgXoFteNpairTKWYAcxJoUyXjy
         Um0sIMbAAXOVW/koxEZw4UETaQxRdpm125DV9Xi8+0BXCJjKj4bdGNI95tEee2PE9dd6
         pDRbuHDX3Sn8mS6z3YnIU8rK1vT17ZTsGgrjiQBCgXVzlpmyY/c9ZnxobJiexp8NVPh0
         22XB0mEusakyl7wPkh5ztHGAqs4OmuVxvdVlRedElFHMmAytGl4yv38L9HK4g0U/mTym
         6Ftl72FeQDnESupb8eBJNYM8tT5h3bHiw3FuY/mTHJp1HCxq6JoiF/UGAJwr2SEFlBtq
         wcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNSV7H3qBxWj99tdJ4vSBqSSorddzHA8NWmmJc+Qe+4=;
        b=svoa2JLTI0lTbrLVWnJYpDYEeq4sS4NYxoJq9LYgk1Q7eY6AG/hBwgLoRVN1DHv6id
         2Q+7mIJDhXju1uMIxNzG/7Ik2L0m3guSGEQ2rHSjgmka0bfzvAKA8KO8AnpMdRf8wN1A
         hpjtbP9tCy+pWJFipbdNWTWNhpRBopDJeYS3pBNSOOBbFjbIjJ5dzskz/B9LRvLTkFto
         OCzwdk4w+fnZX6FBvBfSZBpoyey1G9xI778bu3rbRDIt6XmcRbabiUo6nYKHqXNt4iF1
         idaDnX4xAKk/g6Lv9+5eVktS868cJ25uwb5Cm0bU87vFi8f7fs+qPHTMZ3Vit88yt58i
         C4qw==
X-Gm-Message-State: AFqh2kqLmJrsBJeE3JHrgVSk6lfVg6RCclUoYZ/3w2NZHRwHOvTFsN/K
	CxgyF8eZJFg2CDjmQHsQsjc=
X-Google-Smtp-Source: AMrXdXugrN2bFx+GI7bI/LMHXcqKhril64immuxW+58UtTZYBus18lDXXZe0Q8uUdWU1Y+ocVnm+XA==
X-Received: by 2002:a05:6214:804:b0:4c7:2804:d697 with SMTP id df4-20020a056214080400b004c72804d697mr95229477qvb.19.1673224748621;
        Sun, 08 Jan 2023 16:39:08 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] linux-yocto/5.15: ltp and squashfs fixes
Date: Sun,  8 Jan 2023 19:38:51 -0500
Message-Id: <757f4a63eb2723b2161d6767a06b8d642cfbac0c.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175645

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fc1ccd9b39..bd57d7c47e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "9860fe27332e09dd4f0f3b303e40377de083be9a"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 087c30b5a5..8b83b5a8de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "86627fc3da74aefec1338724a597356e6b8ad88b"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d5f21daf35..0b373c40fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d3aa5916b2b02966ef37bfe3fc527c99754571ec"
-SRCREV_machine:qemuarm64 ?= "a1d364fbe3d8a916426a107f07b89fd0338923c7"
-SRCREV_machine:qemumips ?= "904de7b55a7e8edf4cd894fb0558efee799a314a"
-SRCREV_machine:qemuppc ?= "35d547b91124bef128a13402190ca05f54a2392e"
-SRCREV_machine:qemuriscv64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemuriscv32 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
-SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine:qemuarm ?= "4915b05912ee7d15224eb9064ca63678f0bc6815"
+SRCREV_machine:qemuarm64 ?= "660bf605998f60fd77f24d3316b95b14ef2fa035"
+SRCREV_machine:qemumips ?= "38bf282c052b70c1c6dd79dc6ae49da1ec1c7de8"
+SRCREV_machine:qemuppc ?= "ac4a5d99364cede21dc1838213f7fb29e1735969"
+SRCREV_machine:qemuriscv64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemuriscv32 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86-64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemumips64 ?= "2923c39cc815e2109c9bfc0985adcd8d342fc415"
+SRCREV_machine ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "509a32764e1a5692935c4f26ed96fbe94c480186"
+SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.34.1


