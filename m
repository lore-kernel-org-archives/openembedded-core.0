Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id F240E7F394
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v15so69130804wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=soS5yJnuADZ4XIV07wkNfzS+WhoZ/W7MVGb6h35ym9U=;
	b=s9GZ0fKbRHqPb0YMKufJKj8t1rhjbEAIX1b5QjJOfwd/Z/5Lt/BrgVczXwpGPvhhJo
	I8MrSHQbxJV5+ryovaB4iBuqh7KrtC5SPOqREy5Wv7Ui7t52sPiF99frf35444ARK9qp
	h+iokCPRb37yGSxKfqs3W/5cfmPXEIOACu1BU8E8r3RzF2D92drxPDchxYu37flOVre6
	xiJHMYJPnv3nu7j0A5lIrqlsBdZjLZeQ78d5L1d3EmjL6k1OZcWxzF+7i0aJrH1z89tt
	3IHLOHOmA3HUSjdvDbGquJi5jbDKnXPDqx8ajUTjRNeUz+Wy6m+iMsbPsCyNRKK7GkSX
	gheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=soS5yJnuADZ4XIV07wkNfzS+WhoZ/W7MVGb6h35ym9U=;
	b=iiU+7mjJvIVa1DUe9MEbGdoJ0W2lXET8SnGZERiRwN93uwUhj81TsZGg1SYten5YVa
	3Zp9RF/P3xU3c3yE/DheJ0NS/+UaXes8x2CyeSX5V7GCYIlxTRsD3bVhXtLMaL6cIecf
	ZkT6HXL4i7kFgLFFw3FHu2NT40M9qxcSYM3uh5LTZwrdf/ZFfvxHYf3pyIAAyaMP4WCL
	/cdnXHu8ws7Z39EQ00omZk/n6LqJeVesaXTOF3PBXSmEbFfJTb0th8funz6YfgHOcZav
	gpjZUyn0/kkNG7yCMoPxzovf8BZV3S9zQfQtHxK0VCzX0WGjH1iUeO/JR2reaq8rTs41
	21fg==
X-Gm-Message-State: APjAAAWbCfcDnC4mCa3OEouqkI04uOepnmIi+4fHd9nnvgDIWxiVJotR
	cEEsRw5IL4l3ReKxnESgy4s660Mmy1c=
X-Google-Smtp-Source: APXvYqyeErzEwJ9nRzLzi3gXOwK4fSGj4GyvHPjzw+Sm8EPeMqKbykQ+Hbg+DteXcxlKHZFB2edkKQ==
X-Received: by 2002:a1c:f61a:: with SMTP id w26mr6050826wmc.75.1564778248398; 
	Fri, 02 Aug 2019 13:37:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:16 +0100
Message-Id: <20190802203719.20437-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] xserver-xorg: remove embedded build path in the source
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:28 -0000
Content-Transfer-Encoding: 8bit

The generated source file sdksyms.c has a comment with the absolute build path,
which means xserver-xorg-src contains this build path.  This is both potential
build information leakage and a source of unreproducibility, so remove the
comment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xserver-xorg/sdksyms-no-build-path.patch  | 22 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.4.bb       |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
new file mode 100644
index 00000000000..54d128cb39e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
@@ -0,0 +1,22 @@
+sdksyms.sh: don't embed the build path
+
+This script generates a header that has a comment containing the build path for
+no real reason.  As this source can end up deployed on targets in debug packages
+this means there is both potentially sensitive information leakage about the
+build environment, and a source of change for reproducible builds.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
+index 39e33711d..cdb3794b9 100755
+--- a/hw/xfree86/sdksyms.sh
++++ b/hw/xfree86/sdksyms.sh
+@@ -308,7 +308,6 @@ BEGIN {
+     print(" * These symbols are referenced to ensure they");
+     print(" * will be available in the X Server binary.");
+     print(" */");
+-    printf("/* topdir=%s */\n", topdir);
+     print("_X_HIDDEN void *xorg_symbols[] = {");
+ 
+     printf("sdksyms.c:") > "sdksyms.dep";
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
index d7c5e6b3550..abc4656b0f8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://pkgconfig.patch \
             file://0001-test-xtest-Initialize-array-with-braces.patch \
             file://0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch \
+            file://sdksyms-no-build-path.patch \
             "
 SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
 SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
-- 
2.20.1


