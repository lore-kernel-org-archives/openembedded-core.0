Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A6BE77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 13:46:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11277.1733924803620598188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 05:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/1Eqgb/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385eed29d17so4372598f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 05:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733924802; x=1734529602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3a8pNLaQuCuJIGCEyqj2cxuICIhHBJ03LMSTgEXcB7s=;
        b=j/1Eqgb/Q5drGdC50dHcdH3JOfqmxHrezUKOVeOz2quzSbLzdoA49uKgXoBmp2Zc1H
         K7/ekIqY9gRVSJHnFx/vy37NUs6r1tCkcH411AlwmUuDYXsamgxdOkegDiAS0yxwiQA/
         HMYSvbrYKQF291mIYo/qb1N9XPjYJaVcF/64pEO6BvwWlBwHBE5m46INt4v7T2HTV/3j
         NuNuVsF8Yv9Qu1anahL76csDrxF46ThmFvOf/rKImD5W2MBh89H4y5zc7pjgPrgI1a0U
         elNzy/IHPsKkXcXzxLazO3/9Uuxe+z4KhfeVkUvtvdBM1tqAWrwUJH7JFDjC9j7rim7Q
         nihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924802; x=1734529602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3a8pNLaQuCuJIGCEyqj2cxuICIhHBJ03LMSTgEXcB7s=;
        b=O2XZ839OaN9kQ/Xkuun6bqWZF/nXa3+pTBJV9HuRdJlAZ8U/sw1eBtgtIviDvXNiwq
         wAOIRqxNlgrtXxBHy9Bj7HmWhGf3O0fwu48Tc7UAIzzovRS4UGmxc0BgspiXpJOcFqdw
         MULsosmVU8i6jwF9XccOjElEWqKRAUtpPu0Gq+Op+xAxl0dSMAdMCkzeJfkxbUBGEH+2
         iNdh65BT9rRdVlG8Ye/d+mAxitO6PSHTvhD0m/y3R5rFGsX26PEWS+1MMCmZdLqBQ/ts
         uyyuPus3QlE0H8qUdW3bnhhxjkajoSMr4gK8cblM0dq6Hyr62pQtFHJAgDJoJs07ZyDz
         r1Fg==
X-Gm-Message-State: AOJu0Yyi++A2fsu6JxZogfIQjjIdDXW+r6TiGD6xR3643Uxa6bWb4380
	InzQx7HNQCirH9jQxHYNoExdYwmok4cfYUeZB/SNYozrVIw0xa4Ny/flJw==
X-Gm-Gg: ASbGncspLy3Au5Bih4VIIpTubN0h/LsSgM3PrAGVVhgsMvM59t4VyUowwjHSHNDriBR
	5xnJIGfSj/5L/u+0Jl9BTGAprDEJZY7nchqjp1RwK8Jo6ylzA8Js60XIWNINU0RHxmEdepK+ecT
	ZSjm7G55C2TYd1YFT8m21x7lxI94SrRhbAdVvU2VonXFZY8gc8jxU7TRzPgK/cDKhYWgDVMKCnH
	cxS8T+tW1Ujf4BDCus+f0sT8PqSIiQqooxnloy0XHwsJfJtlRcntm7z4d0+G4KzqxZnumtg2OOz
	EUEsLx8i5DWYAzc=
X-Google-Smtp-Source: AGHT+IENPlePF9KFjSmmmt0p1Wvimbm6PWd2EzYkLUYNrHDi1xxAUv3WGwUHg/uTb6XySUvRqoSefw==
X-Received: by 2002:a05:6000:4807:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-3864cea3c1fmr2710080f8f.45.1733924801919;
        Wed, 11 Dec 2024 05:46:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f533sm1354045f8f.3.2024.12.11.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:46:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] bitbake-config-build: add an alias to bitbake-layers intended for managing specific local configs
Date: Wed, 11 Dec 2024 14:46:28 +0100
Message-Id: <20241211134630.2685983-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208579

From: Alexander Kanavin <alex@linutronix.de>

This was prompted by adding support for config fragments (in a separate
commit to oe-core); after some deliberation I concluded there should be
a separate tool, as bitbake-layers is already somewhat over-stuffed,
and this will give space for more build/conf/* operations in the future
that anyone can come up with (such as tweaking site-specific items
in site.conf etc.)

The alias completely reuses existing code via symlink and
the difference is in where it looks for plugins.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/bin/bitbake-config-build | 1 +
 bitbake/bin/bitbake-layers       | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 bitbake/bin/bitbake-config-build

diff --git a/bitbake/bin/bitbake-config-build b/bitbake/bin/bitbake-config-build
new file mode 120000
index 00000000000..11e6df80c4b
--- /dev/null
+++ b/bitbake/bin/bitbake-config-build
@@ -0,0 +1 @@
+bitbake-layers
\ No newline at end of file
diff --git a/bitbake/bin/bitbake-layers b/bitbake/bin/bitbake-layers
index 7bd3ea20e47..341ecbcd971 100755
--- a/bitbake/bin/bitbake-layers
+++ b/bitbake/bin/bitbake-layers
@@ -18,13 +18,14 @@ import warnings
 warnings.simplefilter("default")
 
 bindir = os.path.dirname(__file__)
+toolname = os.path.basename(__file__).split(".")[0]
 topdir = os.path.dirname(bindir)
 sys.path[0:0] = [os.path.join(topdir, 'lib')]
 
 import bb.tinfoil
 import bb.msg
 
-logger = bb.msg.logger_create('bitbake-layers', sys.stdout)
+logger = bb.msg.logger_create(toolname, sys.stdout)
 
 def main():
     parser = argparse.ArgumentParser(
@@ -67,7 +68,8 @@ def main():
             bbpaths = tinfoil.config_data.getVar('BBPATH').split(':')
 
         for path in ([topdir] + bbpaths):
-            pluginpath = os.path.join(path, 'lib', 'bblayers')
+            pluginbasepath = {"bitbake-layers":'bblayers', 'bitbake-config-build':'bbconfigbuild'}[toolname]
+            pluginpath = os.path.join(path, 'lib', pluginbasepath)
             bb.utils.load_plugins(logger, plugins, pluginpath)
 
         registered = False
-- 
2.39.5


