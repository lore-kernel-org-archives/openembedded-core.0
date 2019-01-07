Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B35727BEF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so1487439wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uXYx5AdEKzygw1as0yCl2jyD5GN+mv7tMAuIFJ5p5jE=;
	b=IpJfqXxrvtZDZOBD1SRdG4YEbZ8SlJe4XImifJqLfTpPUIkREilYcRUOBeIoNTFZih
	Ll0ClkLDc4l0enlkurcWjvXgTNfQOA1QV3kbBFWlLb1QLSK++n58lcsiRnoKxPQNEdrA
	g+G1fliYXK6odue8JLi5Goj5bF1j3vjDGnbZ0aFgKCW1mSYOQi4YoqzoIvO0MdHWTs+X
	MFD4EbkQ3xyDbh+Kl+qPPF9fmWitwj1pgJWSQr73cHRdAPnQ1/N/ET4WMous3ft6fz7Y
	XzBG5lTvnZmvsTklh/aheh75/SgLmLz7YlqUiugGrUpxFDM7a4G9E0vd3URxbiNH7Hcp
	aoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uXYx5AdEKzygw1as0yCl2jyD5GN+mv7tMAuIFJ5p5jE=;
	b=H+YAdSyM5oPv4eJ4XrtFNxprPzTrfQ3jysUQjbLR6WqzMtVf6kyHMBK5Dq/uxDs2NL
	6T8SI4YwieR7S+PDqtamBSkXwI2HHQfA0AEoy7rWvLzSCm4OZDYmwshI0iZG5PUGH1c0
	4e8X0zYLgrpm1VT8+4gamAv6aF75Cs6ikJEQ+AEWFwAuxT+cdZym5K6Iw2HblI8rQc+S
	eDMbxK29xBXjmDub9vebrqMjFCUkWr3rxZORlFzLNn0tXxJinOvsuPS609myyb+oWOgG
	CeyL3jUeJHUAbiZ5Tt+OYZY0dhUt/7TsZpyoEYKsmXs8TDSZt05yMHtKiXXUkSpS/1b5
	7dtw==
X-Gm-Message-State: AJcUukedy+9y3Ruuf5LxTrhbgbSTkhh1aWtgo6GLtMNjUWuI+zgnpDVe
	zxseGoT3Lx+GAcgd8oK57kguV0QUt2E=
X-Google-Smtp-Source: ALg8bN6WWWq9QNLjroNZ3sneleOQfTjubvcAtIDyGEflBqgAQTbOTDjDbxihQjzdnULwyz5C1EKDMQ==
X-Received: by 2002:a1c:7f0c:: with SMTP id a12mr8933845wmd.89.1546879117170; 
	Mon, 07 Jan 2019 08:38:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:20 +0000
Message-Id: <20190107163823.31816-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 4/7] meson: write correct host endian into SDK cross file
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:36 -0000

Meson doesn't ignore this but will emit a warning, so write the correct value.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
index 55c57775e06..1549357a554 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
@@ -1,13 +1,20 @@
 include meson.inc
 
 inherit nativesdk
+inherit siteinfo
 
 SRC_URI += "file://meson-setup.py \
             file://meson-wrapper"
 
-# both are required but not used by meson
-MESON_SDK_ENDIAN = "bogus-endian"
-MESON_TARGET_ENDIAN = "bogus-endian"
+def meson_endian(prefix, d):
+    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
+    sitedata = siteinfo_data_for_machine(arch, os, d)
+    if "endian-little" in sitedata:
+        return "little"
+    elif "endian-big" in sitedata:
+        return "big"
+    else:
+        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
 MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
@@ -44,7 +51,7 @@ cpp_link_args = @LDFLAGS
 system = '${SDK_OS}'
 cpu_family = '${SDK_ARCH}'
 cpu = '${SDK_ARCH}'
-endian = '${MESON_SDK_ENDIAN}'
+endian = '${@meson_endian("SDK", d)}'
 EOF
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
-- 
2.11.0


