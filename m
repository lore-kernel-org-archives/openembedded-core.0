Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5E3C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:52 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.5154.1633479171417899277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNLo0EOK;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id z3so783345qvl.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J/h9ETZUsQaczHH5Wi44qZjW8BzwteY/Yo0ucRrG3oA=;
        b=iNLo0EOKAT9QwyarXDoAQsgxJ2ZalFd55+SKsItKE/hQPkZNyVaXqHwZl6L96XuHQ0
         mS/esjVciMTi+ioshvtfjnlCgx6sSlwkNx3YZlhs2+gLndTUy7fORqE42aSL5gAHrFkf
         InKkoQuogXfNg/CONVxVdXA7mgqeXeAENlHPehMaIURh3UKUODMj3c3HaVlDF4rCgNjA
         +AMALSuKzeYaADTTimcDTYfKr6r9RfYcKxVbNMdC05hnudoJNOQlobU5XDqWtU+A0lGc
         CpBw1mpT06Kojp3MVOKiqixFApyhY/VnkHKQgrYwB1zr/wB4vzntOmGnbVLwuFHdnVhj
         h6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J/h9ETZUsQaczHH5Wi44qZjW8BzwteY/Yo0ucRrG3oA=;
        b=XiFukqu27fG2tm4rYLtv6y5bbAGsim/offzNCxId7M4LHFqUqy9k04LYsP85gi5p81
         ow1FpmpxKr/RlSj2TeggliABQoDF339N8EF1EiWdj5+Elfpsj+NOM4zzlNtWJ9wnyQrX
         7AGNesU7nneVinH2RMdRgTDEZAeaaabGYLSK0rYrKn9SRKTCEwucCOGaKWW+LBWLikut
         uDyHa5slxqyk9GmGlmvVggi/ENYAsnOMjdaNGJcSaxeWiyjy0a3ytIH1UbFvE1r9s5Aw
         XY4rW0u02p01xlEMTSmvwj4fXVVBMplOWV5AOV+OhPh7CNS6ITSyRuDEE4JiLheZ45Qq
         ckPw==
X-Gm-Message-State: AOAM53243FdsPtOLO9L4EQHykRwc1DLtGrbgrZcgwbKueSVD43NF/MYd
	qQOwSiltykBH2zLhqc2ntmNCqtbvT95UMw==
X-Google-Smtp-Source: 
 ABdhPJyX0EBSUWw9hkW3lk8cwOmPGbeQpHeSMwRGbJJo5mfIjIsT2d0aRmtB35DcC3sTLBnG9F8lMg==
X-Received: by 2002:a0c:c590:: with SMTP id a16mr18980338qvj.22.1633479170594;
        Tue, 05 Oct 2021 17:12:50 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/5.14: bsp/qemuarm*-gfx: use virtio graphics
Date: Tue,  5 Oct 2021 20:12:42 -0400
Message-Id: 
 <1e455008b7f06076290b7665846531965e67e978.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156663

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration change:

  Author: Jon Mason <jdmason@kudzu.us>
  Date:   Thu Sep 16 18:22:33 2021 -0400

      bsp/qemuarm*-gfx: use virtio graphics

      Remove Bochs and start using virtio graphics

      Signed-off-by: Jon Mason <jdmason@kudzu.us>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 5e5be1362a..a16612eb31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "61d40facfa18554ae6c57cd4d3cab9be8272e177"
-SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
+SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 8ba2d0a737..89696fbec2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "372ed9b008af35e56e5dacc906522203a4dd897b"
 SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
+SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 4fec074a58..47ada6e184 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "b6850b99071366f57df504f6deefbd0276189554"
 SRCREV_machine:qemux86-64 ?= "b6850b99071366f57df504f6deefbd0276189554"
 SRCREV_machine:qemumips64 ?= "d333b4641aa536e004174d65a3e91f0018eedf43"
 SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
+SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


