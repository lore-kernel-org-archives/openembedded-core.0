Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2FC781CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:19:10 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id r103so40034310wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OTu3wkm9sn3o4AKaIY4nCYLoCEIYlphmUQ8Hszf4tkU=;
	b=ogosdhNB564ght+eo+ZmUZW65ZlvcFZTjXLEeQc043fvTptHmoffESmK8lXP7RbXxg
	bjXHOTNlBpuxqZ5zJjxl32Z9xjZfFxxj/FvoQ9np7mJkMS9eBMRKKYbnewkdpOsCT1uv
	iDCxDS3HiGYQMBePDcmksMr39/hrIT5SqTDtbZeJ58nSWciniHli5ANCuJBQmXmnNFE7
	8R6gW2ur9/BBM1FgFJ0kM/n2BCuw+oCQmFtXjig9FdmL9GmFkzMiEuAejrfxWAI2R0nt
	6liiTRSUYCSclWo33YBagw5fTFm30x6f54dD4Qh20MzG95WLZIw3CtdtFgZKbZmG5UHf
	4TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OTu3wkm9sn3o4AKaIY4nCYLoCEIYlphmUQ8Hszf4tkU=;
	b=Mc6UnY+gN06HzQohdUb64DDUNKLZX2utQe8uV2JvzX3PtFwoUgKGkiKG42gLs98GNF
	b0k3gBSr7qw2XuFvTbWqxpFBEFkpp68KfJHu/Dw83Rwb6TQhYg9caXwCMhe9JGM1th7B
	nQ3zWVSNxIVrkW4ZrLdl3leDrc+m6NHKp0UPQnPhIBn6mr8J5kTDgUMx7OcX0KyuZ/vs
	IuNwfcpfKhLZfcO4HuUXg97WnrRG20/JWrrJKoGPi5bhRHrDhpJ7JMIYk0PH11DMTWT3
	pj9sSP7vSkgl+E1ZxjXEsxZZosT+xRTr7pgXHdsiYNAMB8J4woeMabd/TGpYz2nCyhWh
	xc1Q==
X-Gm-Message-State: AIVw113Ix/+3t0CAZ+3yuUkrLxlrIa/hfaO6vNjw5xYgM3Dg4Z5seKWa
	V3ZrZXFw9gRolSc6VOg=
X-Received: by 10.28.7.211 with SMTP id 202mr3324440wmh.113.1499876351742;
	Wed, 12 Jul 2017 09:19:11 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y76sm14733689wmh.2.2017.07.12.09.19.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 09:19:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 17:19:07 +0100
Message-Id: <20170712161907.13526-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: fix build race on src/intel/vulkan
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
X-List-Received-Date: Wed, 12 Jul 2017 16:19:12 -0000

It's possible that src/intel/vulkcan can be written into by sed before it has
been created, so add the required mkdir calls.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/mesa/files/vulkan-mkdir.patch | 37 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/vulkan-mkdir.patch

diff --git a/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch b/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
new file mode 100644
index 00000000000..15ee5eeb14c
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c78979fd95a1c4f732f7e6edf0f32c524e5955b8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 12 Jul 2017 17:10:07 +0100
+Subject: [PATCH] src/intel/Makefile.vulkan.am: create target directories when
+ required
+
+In out-of-tree builds src/intel/vulkan won't exist, so always create it before
+writing into it.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/intel/Makefile.vulkan.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
+index 3857a5dc62..26e9cd410c 100644
+--- a/src/intel/Makefile.vulkan.am
++++ b/src/intel/Makefile.vulkan.am
+@@ -44,11 +44,13 @@ EXTRA_DIST += \
+ 	vulkan/TODO
+ 
+ vulkan/dev_icd.json : vulkan/dev_icd.json.in
++	$(MKDIR_GEN)
+ 	$(AM_V_GEN) $(SED) \
+ 		-e "s#@build_libdir@#${abs_top_builddir}/${LIB_DIR}#" \
+ 		< $(srcdir)/vulkan/dev_icd.json.in > $@
+ 
+ vulkan/intel_icd.@host_cpu@.json : vulkan/intel_icd.json.in
++	$(MKDIR_GEN)
+ 	$(AM_V_GEN) $(SED) \
+ 		-e "s#@install_libdir@#${libdir}#" \
+ 		< $(srcdir)/vulkan/intel_icd.json.in > $@
+-- 
+2.11.0
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.4.bb b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
index 2257045c42c..f0b634a045b 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0002-hardware-gloat.patch \
            file://0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch \
+           file://vulkan-mkdir.patch \
 "
 
 SRC_URI[md5sum] = "be2ef7c9edec23b07f74f6512a6a6fa5"
-- 
2.11.0


