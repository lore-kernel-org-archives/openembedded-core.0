Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F3CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5761.1781637417341668790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NwE8RLUM;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so38970205e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637415; x=1782242215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTwjGQhpJ+49nu34KfALnnYHB5dFMFgfoaULgSUVoGU=;
        b=NwE8RLUMgJI+yq2Jh7vbYVOeHlzNYKtqdcL0Ga9QA2cefEfmZenIvrCd27YI+9fkY/
         8dPZWf70+fZnhdtcgqX5i/+Bmy8uiLVOywh33VA1jo+hBQjaLwVO6Tq+BZR48H1ENZMY
         1k9qMnhwhzBb0hkIyhxx20mkCVMV1ymUZAEzmgcxvPV1q7iSYRvtMpoEDxkI9gSL1QGw
         6cbUJO0hicl/VS/zemI1K8RTQ3fmEG27ZWl6NuaxwISLDhcybv7Cz/pqd6qbxq1/1PzQ
         R8Zbe5O08RgLZbdxtyKh+fD4sJBgdL9m5lmGQZ9sRmjYbGjb8BUVjubK9qsmZ2ipZGCX
         TuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637415; x=1782242215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTwjGQhpJ+49nu34KfALnnYHB5dFMFgfoaULgSUVoGU=;
        b=CnMq6a24KvFe99JEYkPARocc/akn3JtERy7v+pDdccIvU+DLXCuz++d5uUbYmq76jl
         iBIIXlOhH6a8j6zDLRYttkKQfb1wunLqilvXJtJgwIYKScWvpYCpzE+DIP86DsCUdxPM
         uRFvCCu6uWW+rJhk/sWgyxXuHtptw8ijm1ijYxBkRKg5QfIRsaxRNVimurRCPvAKYP9F
         JuOqgaJDwVExu7T01dC+0it5XSS7AOaGclV/TmTSSnomq7EGzj4KMH7OBov85ug/BTcI
         Gd/qNzkykcZPv27Jgu0I/zgOZ60i8sR4+shwSiFWFnmMQEzkiJj8dfipKhuwFSISORrd
         ZKMw==
X-Gm-Message-State: AOJu0YylrKCTQ7RnGOreDGasCyicXKmoKoXqmb1hYX+eskpwUCnKAzvJ
	q1W1nlfgpahVO41Ozx5nSZa9AgIN0rY/HvFE6ilL0mFtDQbkTeL3gS7/Xj6m0/83
X-Gm-Gg: Acq92OHBif9mRLAvvNdd0Yx7yxY8a3wyqena+bOdrK9Q7wRoJaceB7gWeEF1yAiFCVn
	79Mp3jdfbznPpWjEw3hp65gIoR7X9oic1U/3KZOQe7scjVpqdtTVwFXEOBpeFcCi5hTOuQofFO3
	Uhso8c5r4sanspQF1OIkw8KgkJBTte/22gFLq8esB9hjAP9sr+Fs8NJ6RDc/fV8NfI+ocy9lzYB
	mYORQccuGz+vIOlkZGSaAIaoBS1hP52VEIaxfR5agPOlCDa6PDI2CZNGcLtC8gCHGzpIYCMK3C+
	xIrNYq9j9m3Hp4CiqdHnp4TyObOS4SE+QNPu+WPVWRKtc1WZDCeu9h5wutABtVSEq5EcBYs/I01
	JuLBstxfp+n1WgcqoNh7XHOv/zz8lyZTbEohtcCMYybElSO34X5/KLTqYUFR6oFoJOQutgt2cxR
	+IZfuRoNPB3vuFGhS8sLiaCekuFSkjDlw2d+IV8E9MWyMTOrkm90I+4PMWB3G1k2OEv8TfEg==
X-Received: by 2002:a05:600c:6096:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-492333571f3mr15559975e9.0.1781637415452;
        Tue, 16 Jun 2026 12:16:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/30] libfyaml: upgrade 0.9.4 -> 0.9.6
Date: Tue, 16 Jun 2026 21:16:18 +0200
Message-ID: <20260616191628.2014553-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238947

From: Alexander Kanavin <alex@linutronix.de>

Add backports to address 32bit/musl fails.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-by-removing-stray-parameter-to-fy_s.patch | 25 +++++++++++++
 ...ut-none-required-to-LIBM-if-no-linke.patch | 33 +++++++++++++++++
 ...decoding-when-size_t-sizeof-uint64_t.patch | 35 +++++++++++++++++++
 .../{libfyaml_0.9.4.bb => libfyaml_0.9.6.bb}  |  8 +++--
 4 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch
 create mode 100644 meta/recipes-support/libfyaml/libfyaml/0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch
 rename meta/recipes-support/libfyaml/{libfyaml_0.9.4.bb => libfyaml_0.9.6.bb} (54%)

diff --git a/meta/recipes-support/libfyaml/libfyaml/0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch b/meta/recipes-support/libfyaml/libfyaml/0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch
new file mode 100644
index 0000000000..a964a5a71e
--- /dev/null
+++ b/meta/recipes-support/libfyaml/libfyaml/0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch
@@ -0,0 +1,25 @@
+From 6e7cc36489999843990ff2da558f9f70e579c8e9 Mon Sep 17 00:00:00 2001
+From: Fredrik Fornwall <fredrik@fornwall.net>
+Date: Sun, 15 Mar 2026 21:47:27 +0100
+Subject: [PATCH] Fix 32-bit build by removing stray parameter to
+ fy_skip_size32()
+
+Upstream-Status: Backport [https://github.com/pantoniou/libfyaml/commit/0982fcefc6a16d4c8cb5b06747d3fc8e630de3ae]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ include/libfyaml/libfyaml-vlsize.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libfyaml/libfyaml-vlsize.h b/include/libfyaml/libfyaml-vlsize.h
+index 6ccb7ab..1b950c4 100644
+--- a/include/libfyaml/libfyaml-vlsize.h
++++ b/include/libfyaml/libfyaml-vlsize.h
+@@ -816,7 +816,7 @@ fy_decode_size_nocheck(const uint8_t *start, size_t *sizep)
+ static inline const uint8_t *
+ fy_skip_size(const uint8_t *start, size_t bufsz)
+ {
+-	return fy_skip_size32(start, bufsz, &sz);
++	return fy_skip_size32(start, bufsz);
+ }
+ 
+ static inline const uint8_t *
diff --git a/meta/recipes-support/libfyaml/libfyaml/0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch b/meta/recipes-support/libfyaml/libfyaml/0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch
new file mode 100644
index 0000000000..8eeefb532d
--- /dev/null
+++ b/meta/recipes-support/libfyaml/libfyaml/0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch
@@ -0,0 +1,33 @@
+From 97a93fc2859bcb88ca15dc92e1ba6f852b4a0cb7 Mon Sep 17 00:00:00 2001
+From: "E. Madison Bray" <madison@bray.work>
+Date: Tue, 24 Mar 2026 17:09:24 +0100
+Subject: [PATCH] build: don't output "none required" to LIBM if no linker
+ flags needed for it
+
+Upstream-Status: Backport [https://github.com/pantoniou/libfyaml/commit/24b18e7363b336962fe160c1dc05ca57ba95783c]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b03cf24..f5c854f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -254,9 +254,10 @@ AC_DEFINE_UNQUOTED([HAVE_ASAN], [$HAVE_ASAN], [Define to 1 if ASAN is enabled])
+ # Link libm on platforms where trunc() lives outside libc.
+ AC_SEARCH_LIBS([trunc], [m])
+ LIBM="$ac_cv_search_trunc"
+-if test "x$LIBM" = "xno" || test "x$LIBM" = "xyes" ; then
+-	LIBM=""
+-fi
++case "$ac_cv_search_trunc" in
++	no|yes|"none required") LIBM="" ;;
++	*) LIBM="$ac_cv_search_trunc" ;;
++esac
+ AC_SUBST(LIBM)
+ 
+ # check if there's a qsort_r available (musl does not have it)
+-- 
+2.47.3
+
diff --git a/meta/recipes-support/libfyaml/libfyaml/0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch b/meta/recipes-support/libfyaml/libfyaml/0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch
new file mode 100644
index 0000000000..6090444529
--- /dev/null
+++ b/meta/recipes-support/libfyaml/libfyaml/0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch
@@ -0,0 +1,35 @@
+From 3fea9f76ea36ec9364a9935ca1b64fa742d47fa1 Mon Sep 17 00:00:00 2001
+From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
+Date: Wed, 18 Mar 2026 15:56:10 +0200
+Subject: [PATCH] vlsize: Handle decoding when size_t < sizeof(uint64_t)
+
+Those two might differ.
+
+Upstream-Status: Backport [https://github.com/pantoniou/libfyaml/commit/9192deaac095f9881cc1e5756dede683f36b09d6]
+Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ include/libfyaml/libfyaml-vlsize.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/libfyaml/libfyaml-vlsize.h b/include/libfyaml/libfyaml-vlsize.h
+index 1b950c4..acfd78d 100644
+--- a/include/libfyaml/libfyaml-vlsize.h
++++ b/include/libfyaml/libfyaml-vlsize.h
+@@ -810,7 +810,12 @@ fy_decode_size(const uint8_t *start, size_t bufsz, size_t *sizep)
+ static inline const uint8_t *
+ fy_decode_size_nocheck(const uint8_t *start, size_t *sizep)
+ {
+-	return fy_decode_size32_nocheck(start, sizep);
++	uint64_t sz;
++	const uint8_t *ret;
++
++	ret = fy_decode_size32_nocheck(start, &sz);
++	*sizep = (size_t)sz;
++	return ret;
+ }
+ 
+ static inline const uint8_t *
+-- 
+2.47.3
+
diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
similarity index 54%
rename from meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
rename to meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 77fe0a15b0..1a98b396b0 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -4,8 +4,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6399094fbc639a289cfca2d660c010aa"
 
 GITHUB_BASE_URI = "https://github.com/pantoniou/libfyaml"
-SRC_URI = "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV}.tar.gz"
-SRC_URI[sha256sum] = "dac2b0af7b757b32a4fa7c6493d85d0f7dea6effd20ae4352570b6a450b9e5fb"
+SRC_URI = "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV}.tar.gz \
+           file://0001-Fix-32-bit-build-by-removing-stray-parameter-to-fy_s.patch \
+           file://0002-vlsize-Handle-decoding-when-size_t-sizeof-uint64_t.patch \
+           file://0001-build-don-t-output-none-required-to-LIBM-if-no-linke.patch \
+           "
+SRC_URI[sha256sum] = "a59cc3331e2eb903ec36933ad52a45888041cac31e44f553a00511131242c483"
 
 inherit autotools pkgconfig github-releases
 
-- 
2.47.3


