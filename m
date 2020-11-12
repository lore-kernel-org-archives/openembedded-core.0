Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web09.12445.1605220564423997820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 14:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGY8Ne7p;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: alexander.kamensky42@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id d17so2028512plr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 14:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GkdY5jHdYtzxPmlW+WaiYpnK8SkD1x9sSSlgyAQdIyY=;
        b=dGY8Ne7pCtREo7pG4wZR1AXeCQxM7XwsaXRHZ4B3aur4ppsbWqIIXF7fBJslF82Boq
         xNjQNziGoVGl6LYPOuUvtc3Aj/6qYDQ1DF4s/8QoL/jeRbdGEtnXLc3h1+7KskfcBmSS
         nB5UJiuE0OWOUL6e5MyOsN+5AQc7h5wmU13wMK2nKvZp6RKzjOfrOZyf668vo08h7Jzc
         fY7O8LN06HYj2MVOeU1+4pyWmUOiKyoH8EuN8Fvz8TuDVT51BVxRoZYKddQd9yx61wZC
         cCZm02w+24pfJMc9OVP6SJpZ9nNUcZIFP5SjV2Zbh6Gw0zPX81B8Faasx2zcdSOOe/E6
         vQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GkdY5jHdYtzxPmlW+WaiYpnK8SkD1x9sSSlgyAQdIyY=;
        b=CB7I58ErLAifo65uTMRdjZJI9xJeopqeWYVDYgl36yTeGyRr/9gmGfmPx8ejb1sAXE
         OYkiJ/xBGB1qK7f4aNP05yevSe3AWJyxBZhN6qoZBlSUbnWMzaRLBtZDm/r24Jyv8z1c
         vbGM6BuFrE4T/EhZo314jTDLNHmcSgX2mnm2RepWVL9HD5JI13P7JtiE1NM9cLbPzjLR
         b11+rn3Mw6wJsRVKUndk/tNFXH/Sn0RmBrp/99hO/K6uX7rGuGIIGFc8P/jNPVtguIT5
         G//I3MvaHp1jq06Y/OuONQwDcTBX/AcI0OIPkR3iqK9BAcLTsON8pFpX+IUx6iRG8FcJ
         haOA==
X-Gm-Message-State: AOAM532i+C4HQ6htXuIRBGlYFZsWouHjuUxLl0wHZv4Es45sS8aX39WD
	gH5UeyMqVVKPPuuF42ahKFVI41XfTko=
X-Google-Smtp-Source: ABdhPJzLiK/8rafkOYmD0hYfqin2rblly5x28J+v9o1s9ZWi98aSGIYIiJSyJiodvRuNDiB2ahmC6Q==
X-Received: by 2002:a17:902:ee85:b029:d6:c43e:2321 with SMTP id a5-20020a170902ee85b02900d6c43e2321mr1268966pld.29.1605220563625;
        Thu, 12 Nov 2020 14:36:03 -0800 (PST)
Return-Path: <alexander.kamensky42@gmail.com>
Received: from localhost.net ([2601:641:8080:1a70::ffbe])
        by smtp.gmail.com with ESMTPSA id 85sm7636200pfa.204.2020.11.12.14.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 14:36:03 -0800 (PST)
From: "Alexander Kamensky" <alexander.kamensky42@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Alexander Kamensky <alexander.kamensky42@gmail.com>
Subject: [PATCH] kexec: arm64: disabled check if kaslr-seed dtb property was wiped
Date: Thu, 12 Nov 2020 14:35:54 -0800
Message-Id: <20201112223554.2973707-1-alexander.kamensky42@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemuarm64 fails to kexec secondary kernel with following message:

setup_2nd_dtb: kaslr-seed is not wiped to 0.
kexec: setup_2nd_dtb failed.
kexec: load failed.

It happens because kaslr-seed is not wiped in case when CONFIG_RANDOMIZE_BASE
is not set and qemu generates chosen/kaslr-seed property.

Solution is to remove check in kexec-tools that kaslr-seed is 0.

Signed-off-by: Alexander Kamensky <alexander.kamensky42@gmail.com>
---
 ...bled-check-if-kaslr-seed-dtb-propert.patch | 67 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.20.bb               |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
new file mode 100644
index 0000000000..c2301e711d
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -0,0 +1,67 @@
+From d48ec5e1a5fb7907520dee71b1d94045486a0c29 Mon Sep 17 00:00:00 2001
+From: Alexander Kamensky <alexander.kamensky42@gmail.com>
+Date: Thu, 12 Nov 2020 12:56:46 -0800
+Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
+ wiped
+
+Kexec when loading arm64 kernel checks if chosen/kaslr-seed dtb property is
+wiped. It's a good assertion to verify proper behavior of kernel. However,
+if bootloader creates and fills kaslr-seed property and kernel is not
+configured with CONFIG_RANDOMIZE_BASE then logic of reading and wiping
+kaslr-seed does not run. As a result kaslr-seed property is not zero and when
+kexec tries to load secondary kernel it fails with the following message:
+
+setup_2nd_dtb: kaslr-seed is not wiped to 0.
+kexec: setup_2nd_dtb failed.
+kexec: load failed.
+
+This was observed on Yocto Project on qemuarm64 machine with 5.8 kernel,
+qemu 5.1.0. Qemu created kaslr-seed property but kernel was not configured
+with CONFIG_RANDOMIZE_BASE.
+
+Although check has some value, there is a use-case where it breaks kexec,
+this patch removes it.
+
+Note in described use-case the fact that kaslr-seed is not wiped and user
+readable through /sys/firmware/fdt or
+/sys/firmware/devicetree/base/chosen/kaslr-seed is not a security problem
+as kaslr is disabled anyway.
+
+Signed-off-by: Alexander Kamensky <alexander.kamensky42@gmail.com>
+Upstream-Status: Submitted [http://lists.infradead.org/pipermail/kexec/2020-November/021740.html]
+---
+ kexec/arch/arm64/kexec-arm64.c | 14 +-------------
+ 1 file changed, 1 insertion(+), 13 deletions(-)
+
+Index: kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.c
+===================================================================
+--- kexec-tools-2.0.20.orig/kexec/arch/arm64/kexec-arm64.c
++++ kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.c
+@@ -428,7 +428,7 @@ static int setup_2nd_dtb(struct dtb *dtb
+ 	int len, range_len;
+ 	int nodeoffset;
+ 	int new_size;
+-	int result, kaslr_seed;
++	int result;
+ 
+ 	result = fdt_check_header(dtb->buf);
+ 
+@@ -499,18 +499,6 @@ static int setup_2nd_dtb(struct dtb *dtb
+ 			return result;
+ 		}
+ 	} else {
+-		kaslr_seed = fdt64_to_cpu(*prop);
+-
+-		/* kaslr_seed must be wiped clean by primary
+-		 * kernel during boot
+-		 */
+-		if (kaslr_seed != 0) {
+-			dbgprintf("%s: kaslr-seed is not wiped to 0.\n",
+-					__func__);
+-			result = -EINVAL;
+-			goto on_error;
+-		}
+-
+ 		/*
+ 		 * Invoke the getrandom system call with
+ 		 * GRND_NONBLOCK, to make sure we
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index 1e81ecc2c7..69d2e9bfba 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
            file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
            file://0001-kexec-Fix-build-with-fno-common.patch \
+           file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
 SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
-- 
2.26.2

