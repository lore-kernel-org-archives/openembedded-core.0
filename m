Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7047FCFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:52:31 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l35so91430pje.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9ReaDUbUKOdFdMt4Xe/ZgIV7oIaZWDGFm79J3hlpFw0=;
	b=E06lng+N1ip+hMC5cXl4sXbMI+eeHzrsedNOt9e4Zoi7Xz2F6uojc6IaL0+iNa0QsB
	JhcybGKp+CorZ0fSMbXPj2XfLJZxDnyKZPsLM1tjw6N/+sbrIcA4bNXsJtfp44jGUIvU
	tiCPoIXhJ/RGPaUgN6/soHmDAER0icI2yMEF+QaAyf8nkVLbuKTFk3jj18j7GYNrply1
	mq0/gI4zYFudD4O9wUV2MG2CFdN4ELWf7iqRvZ+e/DbzhfZemdUtoqu0uowRwY7Hjqcq
	jso7SB0trIMllCP/1zw4IQc4ZwLRDdxehv9ltM5G+Fhi5ZQqZ/NZChPTABpNV5LDhKBK
	RLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9ReaDUbUKOdFdMt4Xe/ZgIV7oIaZWDGFm79J3hlpFw0=;
	b=qYlbUbqVJU73vSU6EhauSix8LOpP91MfN0BIn06XnbMGWqm1MDLscNw9O4dqycTpbx
	5KaL0stGc9nZvHPShP94ksIO0K9xHvZtnU9OJ35xN0O9C5l/obbO3qoaPb6tIJpzbrnz
	OuhjOf4dx+UuvqzuYu8Y+mWdhWuQ6ptYOXsMnUSCz9ZX4FCLVoctQZ2v8Ye4tfrRM3oK
	LMJa7kUuO273kylO7+yFFcYEYVBCO4YsdSWqJ3N6/it7U61Qjg/fcJHJDeFp9ec2eEYD
	aSg2KqdQTOGkDTuFfusIS7llyzdILyX4SIR4JxFMGvF0/mJukeFRjn6pGAHg6Ya/UDlX
	bFlQ==
X-Gm-Message-State: APjAAAXDYXr9RcN99EdQ4DYYVrmKko6CjlIC3dIVwBsjlfTLApQtbQXi
	L3r+8+ZO65PFr49YOl8lvNiqRoJrrco=
X-Google-Smtp-Source: APXvYqwiMN/fk1Y9wsUwjxWC+lrBz9CUW6BVM4n8gw4u+lM1f6CeFxVkBaqh3iQXYHIufCszAvzHFA==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id x3mr113232pjv.45.1579542752069;
	Mon, 20 Jan 2020 09:52:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	68sm38159422pge.14.2020.01.20.09.52.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:52:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:52:27 -0800
Message-Id: <cbdc01a8208698c1129e684c0cf1e15b4a33bd7b.1579542573.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579542573.git.raj.khem@gmail.com>
References: <cover.1579542573.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] mesa: Help compile with clang/mips
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
X-List-Received-Date: Mon, 20 Jan 2020 17:52:31 -0000
Content-Transfer-Encoding: 8bit

meson is detecting it does not support 64bit attomics but then when
defining local suppliments confused clang

../mesa-19.3.1/src/util/u_atomic.c:38:1: error: cannot redeclare builtin function '__sync_add_and_fetch_8'
__sync_add_and_fetch_8(uint64_t *ptr, uint64_t val)
^
../mesa-19.3.1/src/util/u_atomic.c:38:1: note: '__sync_add_and_fetch_8' is a builtin with type 'long long (volatile long long *, long long, ...)'
../mesa-19.3.1/src/util/u_atomic.c:38:1: error: definition of builtin function '__sync_add_and_fetch_8'
__sync_add_and_fetch_8(uint64_t *ptr, uint64_t val)
^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sdetects-64bit-atomics-on-mips-clang.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_19.3.1.bb     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
new file mode 100644
index 0000000000..15485feb71
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -0,0 +1,27 @@
+From bb2f0bea553d51d659a9bc46f7ae186885405151 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 15:23:47 -0800
+Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/u_atomic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
+index e4bffa8..58e1ddd 100644
+--- a/src/util/u_atomic.c
++++ b/src/util/u_atomic.c
+@@ -21,7 +21,7 @@
+  * IN THE SOFTWARE.
+  */
+ 
+-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
+ 
+ #include <stdint.h>
+ #include <pthread.h>
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/mesa/mesa_19.3.1.bb b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
index 855b7f23cd..b889f092e3 100644
--- a/meta/recipes-graphics/mesa/mesa_19.3.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
@@ -6,6 +6,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
 SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
-- 
2.25.0


