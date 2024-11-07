Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1005D44D78
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.63118.1730946561005061302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5QAe8gR;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d382664fadso2925226d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946560; x=1731551360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7Fq6Q0wfqwIYY6rmOvuAJEYfbpCvndcwa22CkKDL/0=;
        b=M5QAe8gR+trk+bBEUOnTRmq0ROSfEnkQbcdcqFz51NdNs7NXVSZNe1M8JXsYa8OeU+
         ZusqgbNqJSY/7TQ2yGgsgV0hxr7X+Uy1ofZ1+aKiZONPKQ6SK6n2V2h2A6Hkn8LsAEri
         EFH1r7EiBtJmvgxqkLiqdn7YgKZaW4jVYGNzpNBzto4OOmelkdvrZpGt5jXOVqydI/AT
         nPJ15lyoDInaR6+pkCNZkVAzhQ2VJaVzAj1sec3zkVFJclpqcHy4M+y3fpAy3EnnRhsx
         LXmXyuwP38B9/WKiyIZYW6r2NQ6Qwm45QunBaaZlRxCl4Ntw/5mS6q3WeATJPYaAbSSY
         rpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946560; x=1731551360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7Fq6Q0wfqwIYY6rmOvuAJEYfbpCvndcwa22CkKDL/0=;
        b=HjNJTSNoIsjEhPFXWxTTG8Zg7lORtaKUn9ZKK75PSEEbrwfhE5B0tjACJ1NJBQdxsK
         ETJsHJr4hFojkvKJPNS8JE3WIHGw7hErBC2F+kENxCMezswWVkSXU7X+gnLiRIqeA626
         T3jM0R7TMD/GzuZhDjcxCTXH3Wi7Nlz59MNd6oGIIWaqNuXl0cZx/Nj1HgYlgblaT8X1
         gUjg5ttiXCyZ+N3FMts4d7TV8fkbEQ9hMdOxTzmvv3lDtNK84N4vT+39EyzICa5HW+BF
         bPf6AvJQAGFxCfLRBPhFreYR+I0+vcA/7qcBbbT8UxlJSQZ73yBDVmZFCDZbf/xgRkAr
         eCBw==
X-Gm-Message-State: AOJu0Ywo2PR70a2f53auzYZwCs1BvmZYif+yAYcPn31JB8qX2Gh9jAu2
	gHC4czGa9lEMYch5hp4j2rUnG08lloYsVpYXPCabNaD/j3NS7vV7
X-Google-Smtp-Source: AGHT+IFLaZ4QTAbDzydOUFN4q8DulvhGEf/nd5TqWynYI6Bvviz8wUACgbrQMTnLFtupDPMV2ED8LA==
X-Received: by 2002:a05:6214:5708:b0:6cb:e57b:c37f with SMTP id 6a1803df08f44-6d396c92652mr5429046d6.25.1730946559971;
        Wed, 06 Nov 2024 18:29:19 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] kernel/kernel-yocto: consolidated pull request
Date: Wed,  6 Nov 2024 21:29:05 -0500
Message-Id: <cover.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206804

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Apologies for the size of this pull request. I was waiting for the
release builds to settle, and then ended up having to do significant
work on meta-virtualization to get it ready for release .. both
delayed me sending this series.

This is a mix of -stable updates as well as some tools updates
based on a series that Paul Baker sent some time ago.

I've also added some patches to lttng-modules and kernel-devsrc
for 6.12 kernel preparation. More will follow as I work through
the rest of the support matrix.

Cheers,

Bruce

The following changes since commit 7545dc3af8f7d3aa40a965509cd990ef64f17e51:

  local.conf.sample: use explicit IMAGE_FEATURES instead of debug-tweaks (2024-11-06 12:18:19 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  kern-tools: allow .config to be recognized as a fragment
  kernel-yocto: allow cfg fragments to be specified as required
  kern-tools: allow inputs to be tagged for audit
  kernel-yocto: allow early exit to configuration audit
  linux-yocto/6.6: update to v6.6.56
  linux-yocto/6.6: update to v6.6.58
  linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
  linux-yocto/6.6: update to v6.6.59
  linux-yocto/6.10: genericarm64.cfg: enable CONFIG_DMA_CMA
  lttng-modules: fix build for 6.12+
  kernel-devsrc: make tools/Build optional

Paul Barker (1):
  kernel-yocto: Support in-tree config fragments

 meta/classes-recipe/kernel-yocto.bbclass      |  13 +-
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +-
 .../linux/linux-yocto-rt_6.10.bb              |   2 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.10.bb            |   2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |   2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
 ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
 .../lttng/lttng-modules_2.13.15.bb            |   2 +
 12 files changed, 267 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch

-- 
2.39.2


