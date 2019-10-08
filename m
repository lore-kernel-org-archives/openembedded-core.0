Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 628577F36C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 14:26:31 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id w12so36785417iol.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h7pU+zz5fi6sWXQk1sHTmfNXWA2JupgQbmhB3NAvxeU=;
	b=GE+39mll9RFzCIzhFwJWqHpNjbAJy5AKMznjHWQXzkfX+3E5yRjwqJkjv8Bp0MQ94T
	2dJ+DO99RhfbZcIhb9n/P3rcnZGhd2rY/ojlYGWMSPhWJn7+ovUObU/SLPdOmGutXbmZ
	1fMwZZ+ibzkm0e+2gwSFxDYG3DP0P1yLwo9gPnwjF76fSOGecfIxHWS7Bw3CfskYqDq/
	qFkNdp+UlegNi0evwTu0i35mDz78P3WQTx/BzUG+Gq/zJ11e1JbJCD9CvVKykMahPsu+
	qnNycUyNnnwXkaW0U4S3ejP9Guq0Sr/46WQWM0q8nfJP80+hgeMkjr9J8E1RrL/OeL6T
	c6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h7pU+zz5fi6sWXQk1sHTmfNXWA2JupgQbmhB3NAvxeU=;
	b=THN/k29lavHA7V641GbjmCZLunxjUSPett9Kctzkj5f50sAytIuse5irfCEW0G7qXJ
	3Yb/uGbgNZ2ZTtEGWIqZcvFbeeFA9f959mjMRxYswo1LzwHSQlIq2yrGDeghXx4i8Hja
	QMr7dIAlIsCHWSF+a6LVRfbg39bULSqHZFU1cKDU+LMI8SWSaAVzInZm77gF/xcvdv5r
	SqkoBw8Ln4KOa0TZUGMAFN0Q3AQaEpDG5YyfMHj5I6B6uudLgapJP4Q23pISsA/DOy1w
	bMUCYcQfuUhQZ8JXjFDOQgph21/4tXy+nI2/H3n8spcYWDBpvyj7X2VZMBgeG37MvCyU
	MG6Q==
X-Gm-Message-State: APjAAAWxAp73LsMBeku3pUz4H/8Icy/xnawUfJMSxex8+acNwD/dkIMT
	WQ+VTZ8Fr31sdub7h4LR9J4=
X-Google-Smtp-Source: APXvYqy6iqHzBk8a6rPuu2GyxahFb6mlXkcmN/vF2O20TIH6mRAfjqfd0mqpGS4wSgTq5C1L5YNXzA==
X-Received: by 2002:a02:cd8d:: with SMTP id l13mr32331789jap.138.1570544791973;
	Tue, 08 Oct 2019 07:26:31 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id j6sm7845664ilr.2.2019.10.08.07.26.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 07:26:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 Oct 2019 10:26:29 -0400
Message-Id: <20191008142629.62088-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.2: fix strace/ptrace long runtime issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2019 14:26:31 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping SRCREVs to pickup the following kernel commit:

[
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Tue Oct 8 13:15:46 2019 +0000

        signal/ptrace: fix cgroup2/freezer long runtimes

        As reported in the thread: https://lkml.org/lkml/2019/10/1/789, in
        kernels with commit 76f969e8948d82 [cgroup: cgroup v2 freezer], we
        were seeing much longer runtime in strace/ptrace tests (4 minutes
        versus 4 seconds).

        The issue only manifests if CONFIG_PREEMPT is enabled, which is in
        all of the default configurations.

        As sugggested in the thread, the movement of preempt_enable_no_resched()
        until after the cgroup is frozen returns the behaviour to pre-5.2
        runtimes.

        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

With this change in place, our times are back to normal:

   root@qemux86-64:~# cd /usr/lib/strace/ptest/tests
   root@qemux86-64:/usr/lib/strace/ptest/tests# time ../strace -o log -qq -esignal=none -e/clock ./printpath-umovestr>ttt

   real    0m3.909s
   user    0m0.534s
   sys     0m3.342s

This will eventually loop around via -stable, or may need future
tweaks, but it does address the immediate issue/symptom that we are
seeing, with no obvious side effects.

[YOCTO #13556]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.2.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index acae24edb1..e3fe54441f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "90a5890111ca601af1cfba50939d4003fa8d9ce8"
-SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
+SRCREV_machine ?= "0a9f6ee2443b54c614107728ca76485916010023"
+SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index e6eb78198c..f3f546866b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e31887832108a1dfac19601459a84a2fa38207f7"
-SRCREV_machine ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
+SRCREV_machine_qemuarm ?= "aaa66d462ec17345dadd69b1ec0f3fcc83e82536"
+SRCREV_machine ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 49b14b6185..1a2c3ffcd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d956bb318771761069228fc70fea722ceabecb75"
-SRCREV_machine_qemuarm64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_machine_qemumips ?= "9e95334637a4a85b19bea120f9027ff0028d7069"
-SRCREV_machine_qemuppc ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_machine_qemuriscv64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_machine_qemux86 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_machine_qemux86-64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_machine_qemumips64 ?= "29a8d126f60d1b9e9cf0985b38da2033ebde25db"
-SRCREV_machine ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
-SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
+SRCREV_machine_qemuarm ?= "47b80ef7bd932830f299ed76e2302df631ae4fbe"
+SRCREV_machine_qemuarm64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_machine_qemumips ?= "45ff64cb3f87c38db6f46353ea93005d049b0cf6"
+SRCREV_machine_qemuppc ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_machine_qemuriscv64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_machine_qemux86 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_machine_qemux86-64 ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_machine_qemumips64 ?= "ea0fd387a459803ac60e9b8a1729f2fc7d3215f1"
+SRCREV_machine ?= "255a750d28cd45df8923c3aba1e82c322757a50d"
+SRCREV_meta ?= "b867b78b5019ae455af97dec7794cff7527d7624"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


