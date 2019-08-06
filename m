Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8B97C7F2F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:46:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id y8so37463832plr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wd19fIZlwMFVvj3yh236vizLA8ANlaLewEREeJft6R0=;
	b=ScXdwS9PHMGmfwE1jq5H/kW+KOMmYPdvkNHn2PPdpql78a/NaPuD6UmDVdBMLdnXd6
	tPGApgtvxdgQKH5SU5NQIKQngWEHc5OtgNnY4H4jIj55GmScCEu0/O7/InSCzctuU3fQ
	lMNuohdVtYO5450aDTDUuCGxVZNs0RokHp0rE2Yslb0jffxemK7vC/pUGh53s9/9xUEq
	R1kXTubxyIksoRdjrTTI1HU5GqMSePHM27kARhXhzjEB7yBwg6N0av6hIfheyV7GAAU/
	X4FUfYNlL6VAvJo3UDISixrG+q+1JgxAD8CN+zYW/uKJlKM1bnBtrOXxPQ06+dYYtbY7
	C2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wd19fIZlwMFVvj3yh236vizLA8ANlaLewEREeJft6R0=;
	b=gj5TCqYS6Zo5PGWr1BVWgRw4vdCfI8nv79tnZ8ELq/hdos432mnLkZVeyrTQ6i74kF
	z9KIA7UBKb9DtxlzIaW+Qd4GeYcD4CAigs1nILcD2SS2G9tI8OQkLQ2v8UEvQ/nnQw/z
	KW+VY+4IR0ipsYh4hd6qthakyqPDOLcSdfCGVezfIAZJzb0N2oBQIVW+Vl3AiYEFZ497
	4pxZRZTxTH2zi9mAASP0/f/PXU1wABY1rb55lckkIPXvZtzqRsDFwHimUjLxKW82sUp2
	jk9pg3ZYB+YGA/1BR/Hk2HOrEb73FuwMhVsRNbv0VEdmM9F/LUw/b2q7KA0Y/bkHEAzJ
	N13Q==
X-Gm-Message-State: APjAAAWT5FeQxDViCR0xMUf+SKpsTSod0Y2dZTEss7OjtyhftxgXHE9k
	JGF1Fm6hLnemUvEJvrX8GZcKbWxOJ8o=
X-Google-Smtp-Source: APXvYqyeZxTrx2n/7IBGWlUUgvYigJWDxuwV5aOk6nV/uNz1fHlc00QenjL6aABcT5vNaRUdwdqLmA==
X-Received: by 2002:a17:902:8696:: with SMTP id
	g22mr1578323plo.249.1565073961839; 
	Mon, 05 Aug 2019 23:46:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id x1sm17957104pjo.4.2019.08.05.23.46.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:46:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:45:45 -0700
Message-Id: <20190806064547.32044-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/3] virglrender: Fix endianness check on musl
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
X-List-Received-Date: Tue, 06 Aug 2019 06:46:01 -0000
Content-Transfer-Encoding: 8bit

Seen to fail on musl/mips, this fixes the check to be linux specific
which means it can detect the endianness for musl correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-libc-check-to-be-platform-OS-check.patch | 36 +++++++++++++++++++
 .../virglrenderer/virglrenderer_0.7.0.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch
new file mode 100644
index 0000000000..a0ac3aefdd
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch
@@ -0,0 +1,36 @@
+From 3d30df8d8ccb919733b5339b2a82474305b83998 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Aug 2019 01:19:48 +0000
+Subject: [PATCH] gallium: Expand libc check to be platform OS check
+
+endianness on musl based systems can also be detected in same way as
+glibc, therefore check for __linux__ define instead of __GLIBC__
+
+Fixes build on musl/mips
+
+| ../../../../git/src/gallium/include/pipe/p_config.h:171:2: error: #error Unknown Endianness
+| #error Unknown Endianness
+|  ^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gallium/include/pipe/p_config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/include/pipe/p_config.h b/src/gallium/include/pipe/p_config.h
+index d603681..71cdf49 100644
+--- a/src/gallium/include/pipe/p_config.h
++++ b/src/gallium/include/pipe/p_config.h
+@@ -130,7 +130,7 @@
+  * Endian detection.
+  */
+ 
+-#ifdef __GLIBC__
++#ifdef __linux__
+ #include <endian.h>
+ 
+ #if __BYTE_ORDER == __LITTLE_ENDIAN
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
index 225a0b8b0c..818d5b6307 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -9,6 +9,7 @@ SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-vtest-add-missing-includes.patch \
            file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
+           file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


