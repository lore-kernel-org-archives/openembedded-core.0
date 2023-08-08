Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0440DC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:00:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.67388.1691514049120353672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 10:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZYKMd2zM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d8bso16836675e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691514047; x=1692118847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l52GbqJkMLVQ7rlNvidJWyHAtExkQAU7mASYQH72MIk=;
        b=ZYKMd2zM1csT0cj8I9ljf+nkaAYQE88necOABiNS0kk2QVbKoVSFbU14RgVPGIllX0
         k7/4Y+yWgLwr7C53FjLLMwz8sLWF1rW44/WspaMhWeXcnWA35GTrLfDG1mN4nU9SOphy
         SV5gVrFeACQjh1YbWLsdD6SMlWPGPoc+sntSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514047; x=1692118847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l52GbqJkMLVQ7rlNvidJWyHAtExkQAU7mASYQH72MIk=;
        b=FARmXYLvTKEOUMXM1EYfsZZVmi6IYay1x6F1HAGoRgOosrsxNpKDa4l0tfVrRUBFBB
         QEEa4H0xrTbZxHY3Dya8x1ylYGxfGJHlJe+XXIrC8vcH1/PQna9dN/ecxhxy80Mkkjpf
         jRtEuVk+KwTUzC7QfDgt/RVgXV5dhRNpDZRY67+p3TdADQ/3DvZrUPvbbhcWZ4aQC3UV
         WwPPeP4ecMu1u0S7l9Prz0mjq0054HWX2IXPxYEN6j3Va8agROl+xrDUc11SZAqXNPJE
         Y/ibBmEAisJ752Kw4Jmpcf/rtCoM4zWFc4UnHXrlyORNpL9J0+RnBRtOglCC/P+t9z8e
         aCrA==
X-Gm-Message-State: AOJu0YySOAPLj1nupXKKQGSZRZfodyjK1MFjADS5wRJbyg1xT0LXwXXV
	+MSv/5y7+S9U5vVUgcB01bq1ghX+5a+x7lWUjMA=
X-Google-Smtp-Source: AGHT+IGD466/c06IqysdlShEJ+z5p7111ADkYXj1vw6XSo3d74OrBfz6CuS5pjp7/YJHmupR6C7atQ==
X-Received: by 2002:a05:600c:3592:b0:3fb:d68d:4c6f with SMTP id p18-20020a05600c359200b003fbd68d4c6fmr313208wmq.14.1691514047132;
        Tue, 08 Aug 2023 10:00:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1229:bf53:df4f:c7be])
        by smtp.gmail.com with ESMTPSA id x8-20020a05600c2a4800b003fbc30825fbsm14332754wme.39.2023.08.08.10.00.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 10:00:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemuboot/runqemu: Fix 6.2 and later kernel network device naming
Date: Tue,  8 Aug 2023 18:00:45 +0100
Message-Id: <20230808170045.34145-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 17:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185673

With kernel 6.2 and later network devices are renamed by systemd. This does not
match with the current network device naming assumed in our configuration.

We may or may not change that naming but for now, pass the right kernel commandline
so things work as expected with newer kernels and removing a blocker on upgrading
to the 6.4 kernel by default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/qemuboot.bbclass | 2 +-
 scripts/runqemu                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 444871438da..12d0a509f13 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -102,7 +102,7 @@ QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-p
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 net.ifnames=0"
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
 QB_NFSROOTFS_EXTRA_OPT ?= ""
diff --git a/scripts/runqemu b/scripts/runqemu
index 5e6793d44e5..0e105a918b1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -203,7 +203,7 @@ class BaseConfig(object):
         self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         self.cmdline_ip_slirp = "ip=dhcp"
-        self.cmdline_ip_tap = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
+        self.cmdline_ip_tap = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 net.ifnames=0"
         # Use different mac section for tap and slirp to avoid
         # conflicts, e.g., when one is running with tap, the other is
         # running with slirp.
-- 
2.39.2


