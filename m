Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id A31E77C5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 03:05:39 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m11so1414683ioo.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 20:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VVOb6UYf88CxmWfFIlJqJl6nftOz0HSnpEhA+kzmYDE=;
	b=kvc5C6JajfY7fRNkSnKG/SH+40lvQ8/apA8vcNeBveLFb9amAClsf4CRoMR3CyHhrT
	NVyADDNvQrd/xfAqVlfdw3Mt2Dy5YFaJ0hGN57Q+TQZDSnr2tLBfVPkazhYGhD6I1bOs
	/KylJwB7/3coE7qW9zj8TSx6xnE4TGYYov9KWHtyjtkUpMPkviz1+8vDrUSBWs+refB+
	hd5B4XjadzPQn8oAf/KnIFcWcZU+LDC+94NvDN933nm9NtiYX6NMMVu073mJHk8iwGVR
	i/UkQV186V0TtkLbPuhrzdhgePJ2gDr9hq8bSYui8JponPPUcx//JkXsRDesL5xnc1Hn
	Bvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VVOb6UYf88CxmWfFIlJqJl6nftOz0HSnpEhA+kzmYDE=;
	b=KctLlU2VQxxxY3COYD/9jjPZnuwxCVKZhXVbUdIL5Nr8IphQkmJZAQfCOLrTIXeDll
	f4C5HX0+cuWVi+kxT6fCNzRMWqVnUg695mMMn8So2lBJMxVXxDXM7w5kA/aq9UqkMCT0
	mbCMCNElZPRd52asc+5o7j3aBrJ9XMeWmioaKFV9Pp4i5ABcgsk2e5/tDqE6Oi3QhmkP
	+gOOOzI6TuDz66P7dLEHBgo50XEXcreciFo7Dh7YMHnIp0GJ6gZ7usiGWsjNHzhAkgCb
	kW/jhcHeH4mK9paoWPOual+T5BJELbPjOsrSL3cnnXPWGLGUbpt4/ybmfAxTc+XL/DwK
	d0qQ==
X-Gm-Message-State: APjAAAWZV1y6wEbq9Nv+/21N55aBHqB5xMcc16Furwb4tQFtR2dwfU43
	Xf+emH3lxLj2sSe1r5MNO6HP8X1ZtcM=
X-Google-Smtp-Source: APXvYqynvAyZ2SB6rcZUr4DalL+plMGPW/73xVx9qObwe1S3Phw9tljwQmYi5580CLkDBE1tLqYTbg==
X-Received: by 2002:a5d:9b06:: with SMTP id y6mr1494232ion.77.1567652740239;
	Wed, 04 Sep 2019 20:05:40 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d9sm1062521ioo.15.2019.09.04.20.05.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 20:05:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Sep 2019 23:05:35 -0400
Message-Id: <20190905030535.35255-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.2: config tweaks and kallsyms fix
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
X-List-Received-Date: Thu, 05 Sep 2019 03:05:39 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating some 5.2 configuration changes (for new board supprt), and
the following fix:

 kallsyms: Don't let kallsyms_lookup_size_offset() fail on retrieving the first symbol

With this fix, we no longer see:

   [    0.032677] kprobes: failed to populate blacklist: -22

during boot on arm/mips

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This is the integration of a commit that Richard found when we were
debugging systemtap and kprobes issues. This leaves us with 32 bit
arm systemtap issues to sort out .. once that is done, I can send the
rest of my queue that drops 5.0 and makes 5.2 the default everywhere.

Cheers,

Bruce 

 .../linux/linux-yocto-rt_5.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.2.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 1126734dbb..cf5142cf84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "abe36b584560b3ab9c4c2ece15d5e44494f02427"
-SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
+SRCREV_machine ?= "c6eb169e914def00c37cc2917486c637d800d404"
+SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 03525509df..c2193c0c72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "de3456fa6c9c2bec7ffc907be0d19c0ffb8ef459"
-SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
+SRCREV_machine_qemuarm ?= "94d03154067049b417526f46429729d4ba1e09b7"
+SRCREV_machine ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 3d6a3ecf8f..9a75f17818 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
-SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
-SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemuriscv64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
-SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
+SRCREV_machine_qemuarm ?= "d329dc7256dfef66dedb604cafea5b5685c57f9d"
+SRCREV_machine_qemuarm64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_machine_qemumips ?= "6a46b8261433131ea99e5725d3fd75969004617c"
+SRCREV_machine_qemuppc ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_machine_qemuriscv64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_machine_qemux86 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_machine_qemux86-64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_machine_qemumips64 ?= "06bd563009ffc480befa0d116faed18e63785739"
+SRCREV_machine ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
+SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


