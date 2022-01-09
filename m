Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB32AC433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.23778.1641767279920741546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBcD2sia;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id l10so23331849wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T24Q0mJHWdvKVo6sWSVCBZ9aRDxhjc1oIsNDN4WZYGA=;
        b=gBcD2sia7fajPj5DTpwyec63HKsNIOYuHRenM82BK1LIqbmunlBCyfO5Xca+GnT7p6
         34WrkkW+P9jzAjMxcI8Ioo8N93mSrTsttYGvXe4oYo35OBNO4ZdxG1AxB+wsNkmPjhtE
         j42s/7NIXB6N0D662Ai+smqVhvQGx8OVUOsq4GfmQTyT5r3icobkb9FossiPOYv22GuQ
         MBteOAntDg6ebEqTAQMU0AkfiJpYKEXCtfQhSBk2AE+TN6JOUJOFS2XKmZ0gAglIFpAu
         cM56YjgJ90zGK8witreAy/44e5x5UeXbHst2Ckh2qoQxMB22sfSdJBxxyxFPrle6lWQD
         LaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T24Q0mJHWdvKVo6sWSVCBZ9aRDxhjc1oIsNDN4WZYGA=;
        b=sIVgntmA4Ei7PRI/Ob2N8ETGakvrNk/O5R49/nnEDcLZJVB/xuooWoFjR2Ib3IYGzz
         rjziPOVLSmQJgI1i7+DYZfTuQE0oTgYgH8CnCMpsynQK11GWrNFeFptWKpZMSfp9lLHX
         16v0g1OaeJnwET0dUZ3oyk45XenU6njOlPK8H+/929wYb9IB/aBr8IwZ0MlS6ajFyz2/
         dN8IWUS2DNad4IJjLGSUjPyD/FnjTx5QAhfy2SCfQk/NE3ilxpf3UinJUua6FJmR9D+4
         sowEqN+R5kWis+5dR5HNNdQ+f8cbKBPrfmbCDrCh9ypaSB3AE8et2a7jxEWkZZXo2VQT
         +W1g==
X-Gm-Message-State: AOAM531kJZqSYUxDeckcUbokhxAGHsIF0RHuiPidPlIUX6NiFAe86+MT
	cpOPFaucmsi13QP3YUVjXwQ2KRY2SCw=
X-Google-Smtp-Source: 
 ABdhPJyIL+1NH6ciIygT+ZvSkh2U5v2PXM+qfUvhr45lCfQvl6gV4N+S7J7PtbFYGvKMJuV8PPSAGg==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr61663853wrf.398.1641767278529;
        Sun, 09 Jan 2022 14:27:58 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/14] qemuboot/runqemu: fully form the ip= kernel parameter
Date: Sun,  9 Jan 2022 23:27:29 +0100
Message-Id: <20220109222732.2252416-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160314

New systemd is actually parsing this in systemd-network-generator
and fails if it is not fully formed. 'off' means 'static ip, do nothing':
https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/qemuboot.bbclass     | 2 +-
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 scripts/runqemu                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 95cd1d6c4a..cc1cbce69d 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -93,7 +93,7 @@ QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-p
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0397148082..76296d50cd 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -407,7 +407,7 @@ class QemuRunner:
                 self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
-                match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
+                match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+).*',
                                  out, re.MULTILINE|re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask = match.groups()
diff --git a/scripts/runqemu b/scripts/runqemu
index d49f128fe4..4e05c1bb15 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -199,7 +199,7 @@ class BaseConfig(object):
         self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         self.cmdline_ip_slirp = "ip=dhcp"
-        self.cmdline_ip_tap = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
+        self.cmdline_ip_tap = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
         # Use different mac section for tap and slirp to avoid
         # conflicts, e.g., when one is running with tap, the other is
         # running with slirp.
-- 
2.20.1


