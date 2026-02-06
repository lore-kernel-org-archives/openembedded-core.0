Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3211BEE6B59
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:51 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24.1770409667526468006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LW7jZRsL;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-503bf474fdfso23001981cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409666; x=1771014466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaWzs5tKMRgR5crAufV87pNfBtS7nKK2M/Gxaxkm2ac=;
        b=LW7jZRsLABMHUouDsjkWbCzjQ5ctFNHwC9uHF0wMPL89LBEPqiRo5GI1PLNZECFR4a
         DBy6rqI44q8jKb802+2OoxYPzMSKkyB/OW/xGh3YmBr9XDWyrgOky+Diu5QyelqrtZZ5
         eWXXYGmVUYHJZtOyGhQTkQxg+RRzud37De4wL09iNMKeN2vCx423Vf0mr3NZyj5tsGbm
         94dvC4jwoAssCYdQoYsJsalxVmeXz4SzYipbFRC3daCXI5cChA2f3Cc2kYnrVLJzabpD
         XJqnTr3swoO2P/vKWCp20ZTudoQmu3Dl30Q2dtp15ewG3KtM86mnq1bT2QVHuabA8Ur7
         js9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409666; x=1771014466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaWzs5tKMRgR5crAufV87pNfBtS7nKK2M/Gxaxkm2ac=;
        b=Fj695hUdww986jxtMae36HF2JVLJxhi2x0qQI0K9xuuCNRHM9tniUHC935DGzigdXW
         h/gDQkBKK6n41liYpZUTQQ4JVyJZ7OeXsHk/kUMiC89jtSH8GjvfpQRPrga2wKtKZXlS
         /OSmmfLQ1BzyLjsRcGGdJ8KdrcxH6L0WfzUHSmlyukKd+9vAnfMKHtfgN56iYkFhmfBZ
         jDGHJxH3g60Ftv2c84nezB1YT8Bz470f5bI+6vhZ0/750lW/bxvH+HmbI0DuHwSgBt6Y
         AyB2BxzDp1DH7m78YwrF3mAvhE4SnAlvaQ9H5bqc9wZ/JH9ziwHKQCNaIF5qTk5nSBYm
         78XQ==
X-Gm-Message-State: AOJu0Yzzp3/vdcw6zKT7K0Q306zOzFHYeSK4zTUkjjpwLk3Rb266TeEL
	EMNkKvnC2U1+HFCok915cyEkDB7ZA17K5rtsLkTkJMghYdbEfkWW7r164/FbRWVo
X-Gm-Gg: AZuq6aLzUIh7IQmLg2QDNx2QNDWZKodVYsCIr+/4IDjyEnIxizeca2dPccw/WuilyV0
	uSk31UaPkq4JD/TzXMXQo60JqoxM7hPQAhP09ZX1cg6K9Dfeo318Q8JGA4Nv+0Llu79XTbke+OO
	JYmX4+5JCdIRdCoGMQpj2GThvfVzJn/sWNIj23J5bgu2uPMRYoCSQBFJzvbmlvJKoNv9tORxxGS
	/ZIgBbjnHIou3jbe9ZQsmtJGPAftlG8bniaBcMvcG4TSSquNd9CbIQ57i18TYjttZhhUyrc0XBE
	B6bHHSyJnxKfwfiJ8RycT/ttms0OnReOrsJI+qprWKbzAwgAS8yvSRNoB0YdjWGE3CQWh+09nBY
	VeeftaABN9GwSfVsEs92QWUMxYBTxyE9L5SsOYX0/8AHi7DwepdbC+NCt9OJButOMau2mF0sSsT
	hsoPsc04PGVxoT8gMca+4FvFr9XE8SFzJP48Wvla5fkhepgdgkMlibOl+CCpIUt5xbe8ZhxuewB
	JFhLLxdnZOMN0YScJKj58WnGiZGfUaX/lkiqKotzs7ZaFngiX/1eLgeDrLghv1/hTlh3A==
X-Received: by 2002:ac8:5dcd:0:b0:4ee:1c10:729f with SMTP id d75a77b69052e-506398e6a9bmr52963171cf.35.1770409666330;
        Fri, 06 Feb 2026 12:27:46 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:45 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/09] linux-yocto/6.18: beaglebone black: boot and graphics fixes
Date: Fri,  6 Feb 2026 15:27:25 -0500
Message-ID: <20260206202732.1080699-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230651

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/2 [
    Author: Kevin Hao
    Email: haokexin@gmail.com
    Subject: net: cpsw_new: Execute ndo_set_rx_mode callback in a work queue
    Date: Wed, 4 Feb 2026 14:27:57 +0800

    commit c0b5dc73a38f954e780f93a549b8fe225235c07a from net

    Commit 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for
    IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.") removed the RTNL lock for
    IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP operations. However, this
    change triggered the following call trace on my BeagleBone Black board:
      WARNING: net/8021q/vlan_core.c:236 at vlan_for_each+0x120/0x124, CPU#0: rpcbind/496
      RTNL: assertion failed at net/8021q/vlan_core.c (236)
      Modules linked in:
      CPU: 0 UID: 997 PID: 496 Comm: rpcbind Not tainted 6.19.0-rc6-next-20260122-yocto-standard+ #8 PREEMPT
      Hardware name: Generic AM33XX (Flattened Device Tree)
      Call trace:
       unwind_backtrace from show_stack+0x28/0x2c
       show_stack from dump_stack_lvl+0x30/0x38
       dump_stack_lvl from __warn+0xb8/0x11c
       __warn from warn_slowpath_fmt+0x130/0x194
       warn_slowpath_fmt from vlan_for_each+0x120/0x124
       vlan_for_each from cpsw_add_mc_addr+0x54/0xd8
       cpsw_add_mc_addr from __hw_addr_ref_sync_dev+0xc4/0xec
       __hw_addr_ref_sync_dev from __dev_mc_add+0x78/0x88
       __dev_mc_add from igmp6_group_added+0x84/0xec
       igmp6_group_added from __ipv6_dev_mc_inc+0x1fc/0x2f0
       __ipv6_dev_mc_inc from __ipv6_sock_mc_join+0x124/0x1b4
       __ipv6_sock_mc_join from do_ipv6_setsockopt+0x84c/0x1168
       do_ipv6_setsockopt from ipv6_setsockopt+0x88/0xc8
       ipv6_setsockopt from do_sock_setsockopt+0xe8/0x19c
       do_sock_setsockopt from __sys_setsockopt+0x84/0xac
       __sys_setsockopt from ret_fast_syscall+0x0/0x5

    This trace occurs because vlan_for_each() is called within
    cpsw_ndo_set_rx_mode(), which expects the RTNL lock to be held.
    Since modifying vlan_for_each() to operate without the RTNL lock is not
    straightforward, and because ndo_set_rx_mode() is invoked both with and
    without the RTNL lock across different code paths, simply adding
    rtnl_lock() in cpsw_ndo_set_rx_mode() is not a viable solution.

    To resolve this issue, we opt to execute the actual processing within
    a work queue, following the approach used by the icssg-prueth driver.

    Fixes: 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.")
    Signed-off-by: Kevin Hao <haokexin@gmail.com>
    Cc: stable@vger.kernel.org
    Link: https://patch.msgid.link/20260203-bbb-v5-1-ea0ea217a85c@gmail.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Kevin Hao
    Email: haokexin@gmail.com
    Subject: drm/tilcdc: Set preferred depth
    Date: Wed, 4 Feb 2026 14:27:58 +0800

    The commit c91acda3a380 ("drm/gem: Check for valid formats") adds a
    check for valid pixel formats on drm_gem_fb_create(), but this breaks
    the X server on the beaglebone black board.

    We have set 'DefaultDepth' to 16 in our xorg.conf. In the X modesetting
    driver, the drmmode_get_default_bpp() is used to guess the default
    depth/bpp. First it tries to get them via DRM_CAP_DUMB_PREFERRED_DEPTH
    ioctl, and if it fail, then try to create a FB with 'depth = 24' and
    'bpp = 32' to check whether this depth/dpp is a valid combo. Before the
    kernel commit c91acda3a380, the FB always can be created successfully.
    This will avoid the bpp to be set to 24 forcibly. But after kernel
    commit c91acda3a380, the FB will not be created successfully due to the
    check of the valid pixel format. Then the bpp is set to 24, but the
    'depth = 16' and 'bpp = 24' combo is not a valid pixel format.

    Fix this issue by explicitly setting the preferred_depth in this driver.
    With this change, the modesetting driver would choose the correct
    depth/bpp combo based on our setting in xorg.conf.

    Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
    Cc: stable@vger.kernel.org
    Signed-off-by: Kevin Hao <haokexin@gmail.com>
    Link: https://lore.kernel.org/r/20240317033918.535716-1-haokexin@gmail.com/
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index b6e1d081cc..8df3c14f9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4cab0751277e181dc5d1b163b0e85f734725adfb"
-SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
+SRCREV_machine ?= "1292f3b6fc58f2b157bea9c8703188fd1f4ccd50"
+SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index e7f5c85688..194bb01d93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
+SRCREV_machine ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index dc23819e6c..c7185eb3c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "3247ad9a8d55ba35c8707f44ff4e51c434a1feb7"
-SRCREV_machine:qemuarm64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_machine:qemuloongarch64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemuarm ?= "b36eb7592b944efb3f0c022a25bffb30a74f429b"
+SRCREV_machine:qemuarm64 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemuloongarch64 ?= "13406870d76895304abb5722793d4abe03b40549"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_machine:qemuriscv64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_machine:qemuriscv32 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_machine:qemux86 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_machine:qemux86-64 ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
+SRCREV_machine:qemuppc ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemuriscv64 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemuriscv32 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemux86 ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_machine:qemux86-64 ?= "13406870d76895304abb5722793d4abe03b40549"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "bafdbc156dae11ada271e112c2e331d9f9b2653d"
-SRCREV_meta ?= "c809ea8463218ea51f3aee6a9471ef593407d4cf"
+SRCREV_machine ?= "13406870d76895304abb5722793d4abe03b40549"
+SRCREV_meta ?= "240c73660dec670caa087090b0a1b2bfb0b8b308"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


