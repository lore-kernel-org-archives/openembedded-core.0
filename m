Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B315BCCF9FE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:38 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.3231.1761844350805222351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkrvBA9D;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-89e93741839so78649285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844350; x=1762449150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgWu82elLJy3Ts7nZhf0SFqiQ3EGimlHNrzOb0L6f7o=;
        b=NkrvBA9DbfUInijoB+qD4nC5GVPA52pgsfEDrJFYby/1S5qazTvv3aRA7dPTh99KB/
         Mg3WI7IDjKt4Fwe62jEMUPeMG3kUqqj/bpaRInIPZkGeTplnQLuk1FT6kRMssquBlZ0F
         eKAsoVc4R3n6nRewIi3cOW0e/VXsL11+6BsXAUzdeIfFSuV6Y3bWHXF+4jUWIQFTXct6
         7KCIyJIfS2EnxZzPSTb8jZ1yM5Q/DXeO3hNMkbw7ZqTSYSYszSN7YZBnxF+ecYHxYKlr
         UFVMjksG3P9x0IuhkDRfiVnzJvaLVbrbQ/8gjccPFHPVU8vPnJg4LwFGTCuLKhg+5CGo
         QG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844350; x=1762449150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgWu82elLJy3Ts7nZhf0SFqiQ3EGimlHNrzOb0L6f7o=;
        b=N8cLN7ChbHUWthlJ8THpwuvcrItl8CNYMgZz403jFrh6Lz+Q0bsSArYGcs+8rKoIUB
         hHJSSugtVAXWD3niY6yOoqRxrWDUebPuAWYd8Ujtx4EukyGOfq7suKmlgkkFyL+pps+Z
         kIU0hAO/mGY4R1gVeE7Zt8BBmtrv5U/JIF0okTGoP8U1vGBsgUfJYiLx+sCSSS1yeeoS
         aUn12eR/YJNqcppG41CFM4SiMR3HUJ3VDq4tH4WVh7/VPfmLdjVLotNW21X73KG1oYe+
         SiwPFLeMs00k5Bzt7igWrjuswDSc7sMOHI9UZBk4rG9ysAva+T3aXxaCRxCBfvVNFWla
         WQsA==
X-Gm-Message-State: AOJu0YzH6XUZlAsniGEC4AwDOG2/90O68fdYttRe1F+KfQkfwPeN5mCh
	h6jlVg7YVcIWH7le6eT7yiAynJU93xV/JEINx1I5uc6g0HCkiGlMGGdp
X-Gm-Gg: ASbGncvkJMMQLyNDuW/jPUjYIG6hk/QwatPqKwppOw5X0IgeFJb9OkwsFKQ5yQZyyRD
	RVFsyTUFs8lyr+WZ36reo5V7s405Td8NiaXLTs1bHLdkqlobcs9wJnUpg4Km8upFy0VKZx1vQ0v
	acnW5bZ6+vfSwHgkrmRdWPnDZOgz+FXHIy17uEItryD8co2RvLvco8tHpaZF4u6XhiJNxcOQz1c
	lWqf65t6NOZXELhGSQqLCdQ8SLRQUZhv3unJxi7W/cXV+2JscYBjQcQUOLfj7WND1psVuMcl/YT
	N8W/h4ynA8chvlcU7XUsNsCZT8bbJzpsBlLXT9HaLu2ZUB0IWGCeuAj3cS8X7niBboESRax6hsJ
	P4vURyKLACmqSXbewjEzyhNtpLc8/7PJQ91qj1qzjj31vOf5VLLHR/rP7sAJNSygvLSofCxgSr7
	53sigN2OjA/AGY03MNvsZEoj3S0wmNLi+pkDD2rXT3cCjOve03By+1xMCBELVoqm1ZKGbOJyGB9
	h3A
X-Google-Smtp-Source: AGHT+IHWnBOKbhWiTic1fsDnPQEvGRHTGB5tcysAI2eAgd2ae8/x54aLWlHkzMwU7m2r+gHzmaR3vg==
X-Received: by 2002:a05:620a:4115:b0:8a2:ef8:348f with SMTP id af79cd13be357-8ab9b2b624emr22249285a.55.1761844349595;
        Thu, 30 Oct 2025 10:12:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/14] kernel-yocto: consolidated pull request
Date: Thu, 30 Oct 2025 13:12:13 -0400
Message-Id: <cover.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225502

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I've put all of the patches I've sent for 6.17 into this series. The
only new ones are a bump to 6.17.5 (Which also contains some configuration
changes to fix audit warnings for genericarm64) and t he addition of
genericarm64 SRCREVs to the 6.16 and 6.17 appends.

These are against master, I can rebase to master-next as needed (if
some of the older ones merged there that I didn't notice).

If this series works out, we'll remove 6.16 from the tree.

Cheers,

Bruce


The following changes since commit 77348b07ccd98689a15d6b1baf64471953fd557e:

  linux-firmware: drop catch-all QCA package (2025-10-30 11:06:28 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (14):
  linux-yocto: introduce 6.17 reference kernels
  linux-yocto/6.17: update CVE exclusions (6.17.5)
  linux-yocto/6.17: fix qemuarm config audit warning
  linux-yocto/6.17: unify qemumips (malta) branches
  linux-yocto/6.17: fix rdinit boot warning
  linux-yocto/6.17: update to v6.17.6
  linux-yocto/6.17: update CVE exclusions (6.17.6)
  linux-yocto/6.12: update to v6.12.53
  linux-yocto/6.12: update CVE exclusions (6.12.53)
  linux-yocto/6.12: update to v6.12.55
  linux-yocto/6.12: update CVE exclusions (6.12.55)
  poky: make linux-yocto 6.17 the preferred version
  yocto-bsp/6.16: specify genericarm64 SRCREV
  yocto-bsp/6.17: introduce kernel bbappend

 meta-poky/conf/distro/poky-tiny.conf          |     2 +-
 meta-poky/conf/distro/poky.conf               |     4 +-
 .../linux/linux-yocto_6.16.bbappend           |     1 +
 .../linux/linux-yocto_6.17.bbappend           |    11 +
 .../linux/cve-exclusion_6.12.inc              |   258 +-
 .../linux/cve-exclusion_6.17.inc              | 17698 ++++++++++++++++
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-rt_6.17.bb              |    48 +
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 .../linux/linux-yocto-tiny_6.17.bb            |    33 +
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |    79 +
 12 files changed, 18146 insertions(+), 28 deletions(-)
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.17.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.17.bb

-- 
2.39.2


