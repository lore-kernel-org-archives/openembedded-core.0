Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70566C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 18:49:34 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.6700.1747853367365779672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 11:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PaHkcsm6;
 spf=pass (domain: linaro.org, ip: 209.85.208.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so9430110a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747853366; x=1748458166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdNuTOTsKpvkf/xfsZUVGJATMCYddHibkDAc7vlr314=;
        b=PaHkcsm67+1nh7k+7ywJkPqT9KhIhbmxcilFqCoE7B6TWStOv7k5bsLza6NZaMW3UN
         qd37ZoGFtXxnHBqIHUaFOAg1pcKfKSvhfWapfVezsdtcqkC482Jq7M3zYaByskdDvzpN
         W11zH1MzCKEA9AsyKrP+7QPyxtG2EKIQ3qkze9slIPPn/Ttpk0XqH8qjO13LzPb4Pb4b
         0WOeyW3C5s1uLTYP1dUozikKuUG2exW7dLMN6ExQl55QfdjAsbcy8GrNGbkokEw99pWu
         cQiwR6Pc7pFxkZH2nIa04+WzIgcbTI9vXBSspbVj3k84hzpMkOB64sYzOh9xIC/rWH8k
         HBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747853366; x=1748458166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdNuTOTsKpvkf/xfsZUVGJATMCYddHibkDAc7vlr314=;
        b=KDLBQBdfE+CmIM2bbhVIGbyBLWAk3+BFrZ8zg1oYp1COPg4L9WCKYJV7Tc1K0xwt1R
         TXBDd8WxkRdFSOuJDcXVBahFvR2NHOEItjwugGoESdUaBgtGUVQc+MwXuMSEf8l5ItrB
         hbiUmp7mwi31xHoE9HG0deLN8c+atl2rVn1FQ6Xp2WfM4n0W539xXr7lKrSlK1AZY7Lh
         JJkYThSmePRaZH+BNd53Uw1lh5DW47GbqUIJkZKjfUY7Oe346EhTuj4U4iWscsCCIvwV
         kqfm3MfU/qySapaJ7H1hKPOgKYII+gXG9SyTSz3FRrZ0bEugLw3BkLYZ4IibFv8lRS6f
         OAkw==
X-Gm-Message-State: AOJu0YwGGpDWcPSigw2Mmy1WszxY6eJhrirQ/PZiBvQ9PJwVPqB3Lp/7
	SWEVh1o0QHLlWGmp/lyxHpkWY4Ehd+0dFWHXW3EdReGAgr4a5wsCQ36c5+1PH6YITEnNgahnrgF
	r6rgczyWtx9cJ
X-Gm-Gg: ASbGncskeyVATN+ObjO8Y7Vv36azFfxHoAQH90i61rr/A5qdyGk2qYTw4LDi3UOlLzi
	2O9bn9f001e+uhL+4p0rJW9F4sAUu+2NJYVq+n5CkZ1qEVyZ90nr22rkZkqy/4nZ70RqLJdNity
	nKziSzuzMRg0JF/xenqEeTFwJvuGm8yixHYPUTJRzQ0sttmA5kx/szRZi2F7mUgawYkdb3obUFm
	S27leKnAiF9iceyGTyYO7vwbrqlSlWvNsIy/kvt90vKYapD8cMOP1ladOYhalBD9p/WkDHQEd9h
	GS9Hgtwatrr1NXe4726Utik9Yx10kq2dyRlv33hyVt7PbdLiUssz3obDdYVxvFwlDQX/2o/S7XH
	VApJ49I+pkijPCXyx
X-Google-Smtp-Source: AGHT+IHeKGE61ybx0ZdD0bLYJRpgdrbMwBb3UoLai1Wc5dNdQ2bIJsjEDAf7sR8QxkCmLK3IYSqySQ==
X-Received: by 2002:a17:906:d542:b0:ad5:6b26:b1e2 with SMTP id a640c23a62f3a-ad56b26b431mr1241805066b.49.1747853365741;
        Wed, 21 May 2025 11:49:25 -0700 (PDT)
Received: from nuoska.www.nordic-sky.finnair.com (213-209-177-110.ip.skylogicnet.com. [213.209.177.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06b497sm932590666b.42.2025.05.21.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 11:49:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH v2] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
Date: Wed, 21 May 2025 19:49:06 +0100
Message-ID: <20250521184906.181219-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 18:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217054

Booting u-boot on qemu with kvm is currently hanging on aarch64
build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
disabled as a workaround.

To reproduce, build on kvm enabled host where "kvm-ok"
succeeds. For example genericarm64 machine and core-image-base
should then boot with:

$ runqemu slirp nographic novga snapshot kvm

On qemuarm64, default kvm setup will boot directly to kernel
and is not affected by this. If build enables u-boot as bios
then the same issue happens.

Without this config workaround, the boot hangs without
any messages in qemu output but ctrl-a-c to qemu console
can shutdown the emulated machine.

This seems to have regressed after u-boot 2025.04 update.
KVM boot can be detected from speed, for example genericarm64
boots in 550 ms with KVM and without in over 5 seconds.

Fixes: [YOCTO #15872]

Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc                 | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg

diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
new file mode 100644
index 0000000000..d01d3d12d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
@@ -0,0 +1 @@
+# CONFIG_BLOBLIST is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdd..a77c49cb8b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,10 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
+# workaround for aarch64 kvm qemu boot regression
+SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.43.0


