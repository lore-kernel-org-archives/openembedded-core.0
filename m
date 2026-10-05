Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2159CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 22:41:03 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32778.1791240063437460691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 15:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eaNgAGW0;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: festevam@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f6f130bso2083896eec.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240063; x=1791844863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNaYPvNYwgg/pb2sjOyz+3Ew+BnczXVJEye2dPJSGiY=;
        b=eaNgAGW0ykCEG4ww/Qnt+PIpudKacy9BQjDJULiHkVqbDcp16K8zMxK6d9BhYZLlV9
         rnQzT20u4ecJMlaG+LdtknaS3BPa2uW3vYlLvXQldsqhfjnbI2Xb55VPJpB1Uy1xG0Tw
         CoZliOneeZtFE2bFygWKl2PN6QrB2CysQrBxT/SseGrTXcA8GXCGciJTkvFgwg0A7CdD
         zlaTd62nB7kn2YMQYI9Hf1ZQ4JC+DKALDWYmZtUIyEn5ayT+CaxqlCrzFaOm5VnyeJ4Z
         sv918MQOWAJEdcrI/PWSv2/+og8Z2v0WnM4GnNtmPqYqMoSXyDdSQc+TSFo0VT7ANexc
         YtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240063; x=1791844863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNaYPvNYwgg/pb2sjOyz+3Ew+BnczXVJEye2dPJSGiY=;
        b=Bp9BO2G2vdDgPnrp70Bm0/8erSNYRZW9CZLOuhXtSMzbdClU+EYGOWylzoX+2Hi3cz
         AtNLR5UivsppJ7QeoRl+zl0Hym8IRdkOY/pr06wmNzZNG7Cu47u8+YdODe0tfqVDJ0eP
         Mk0I1xT4PPwYPraKm/i844RbEs6dGV0bOOoJ6Kh6D87da8vlDSsVZ758SAwzzDB+Ata7
         xhgLPWaAA6C4jm6d8B7nc4VUbCzhQdjct0cmkEEx2JCimZX1vOofVEzPOI7wOXN+fcMr
         uSr361KlZLpiP+uqwZzlEAmlUOyZyhDT7tE8PRl8oyB5k/7FgYQ0wHohdec5uXEEdXkX
         KAGQ==
X-Gm-Message-State: AFuF++nyvLEpg2/HymoCC+Phc3oFTKOB7KI8jEqMiBuo7IDOvThzvM+2
	fiB8Y1p6nkGhSRxCSsPunS3yRAF6KIy9kRgGcHJVgI1vEiqxCefo1wgrtjemxA==
X-Gm-Gg: AYBFou3grkD4kfLnQ4l6ldKXv3LPdJDSW01NhRVDtEbf7zY9eUHCxqmw67GEuUT0vuf
	20TSzATR2lv/Dy9uD7M0gniXzLwQdRHMpKIYLlZyqs0YV8qUMpk0QtFHcNjYd+Q9XmDXZb5ocey
	2PZyujp9H/l9b5QtNEdL/F7L1cNAfHiFswN9fJzi1r3mVdSmK369ySP2RJBnhRvfTi97SBXWIaA
	wsN5wDK0WngtAcsGlmVSox8KwwhO1vwe8OXbpT9Wt9rj4+EsgpwvDql7YD2FW6tcIb9wrUfD1WS
	rXKpHd6mFhipGsE/LlOIZPqM4oohrK5pyfe1cPMr1Yz9SBjK1zkpTB2lOkhjjQo7wKAAGlZjYTP
	vz49RDaacPAMDc0VJ5PE/qRE+nS9fedDLZb3fo+C0GSGvkCLMpt18iqnQZ+RCKccc1FZMQIw+g1
	dlmh4re38+30bfYoAT83ZCxJgDUvN0S90Qz5f8+uGlkuoHTSgIgiedNnPPxkFkG3Nm9XI1T+bin
	IhRuVUGhE3ue00iPnex478GrldLDvhUR9GPBEoekb6Iz54=
X-Received: by 2002:a05:701b:2704:b0:144:f096:4dda with SMTP id a92af1059eb24-14f5c9da5abmr16879150c88.43.1791240062392;
        Mon, 05 Oct 2026 15:41:02 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:a591:442e:c8b6:e423])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85e3db9asm1370774c88.17.2026.10.05.15.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:41:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: upgrade 2026.07 -> 2026.10
Date: Mon,  5 Oct 2026 19:40:43 -0300
Message-ID: <20261005224043.2044227-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 22:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247263

Update to U-Boot 2026.10.

Remove the patch that has landed upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...-removed-SWIG-Python-2-compatibility.patch | 55 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  3 +-
 ...ols_2026.07.bb => u-boot-tools_2026.10.bb} |  0
 .../{u-boot_2026.07.bb => u-boot_2026.10.bb}  |  0
 4 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2026.07.bb => u-boot-tools_2026.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2026.07.bb => u-boot_2026.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
deleted file mode 100644
index c1d0204e3290..000000000000
--- a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 886616d03b6afcc5ce8b34e7af91f7ccfbb0a5c Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 11 Aug 2026 13:21:01 +0000
-Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
-
-SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
-from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
-them with their Python 3 C API equivalents:
-
-- PyString_FromString -> PyUnicode_FromString
-- PyString_AsString -> PyBytes_AsString
-- PyInt_AsLong -> PyLong_AsLong
-
-The replacements are safe since the macros were already aliased to
-these exact functions in SWIG's Python 3 code path.
-
-This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
-removed SWIG Python 2 compatibility macros").
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/2283713/]
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
-index e4659489..326a15c7 100644
---- a/scripts/dtc/pylibfdt/libfdt.i_shipped
-+++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
-@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
- 	PyObject *buff;
- 
- 	if ($1) {
--		resultobj = PyString_FromString(
-+		resultobj = PyUnicode_FromString(
- 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
- 		buff = PyByteArray_FromStringAndSize(
- 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
-@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
-         }
-         $1 = PyBytes_AsString($input);
-     %#else
--        $1 = PyString_AsString($input);   /* char *str */
-+        $1 = PyBytes_AsString($input);   /* char *str */
-     %#endif
- }
- 
- /* typemaps used for fdt_next_node() */
- %typemap(in, numinputs=1) int *depth (int depth) {
--   depth = (int) PyInt_AsLong($input);
-+   depth = (int) PyLong_AsLong($input);
-    $1 = &depth;
- }
- 
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ece0fade551f..74aa61250841 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,10 +14,9 @@ CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
+SRCREV = "5508406582f6f7120dce0c4b3059819a41788db2"
 
 SRC_URI = "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=https;branch=main;tag=v${PV} \
-           file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch \
            file://0001-Add-support-for-OpenSSL-Provider-API.patch \
            "
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot_2026.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2026.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.10.bb
-- 
2.43.0


