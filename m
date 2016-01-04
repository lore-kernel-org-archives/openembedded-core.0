Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 191DC60132
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:05:03 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id u188so146105062wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bAaMODoF+ATJFDcNJ+zkG39xFg5x9sELAmFwGTkPkYs=;
	b=QNk8hniKliNiOKzRQaA43ARJJ6NLwPrTui0LwmDoqAMk6LjiQyXcZDg0ZKmzyt7a/r
	LJyNCrGyFxIHOW2tSsxMsI565aP9hhkC1mkF/Vrzu/LlLp5e7BMAIkv9mqc8reqWVxht
	CZsjvsaof8fX5wzL6I2K+h1AJlHfXrvBQ/BRZif8T4ChnWTzgAzv8GPWaFqDyI6JRt5r
	rsNffsgCvkwaJ+0sP1FCTQeMqRfU20XZxH1zt8MeH4IgjkLNKmA2BWbiCJz8B65p3DpC
	bXff8iZ+2tch/zE4nBU6TSs+H8X8jKxnzsQq//K8gFotDCAsTeBmHgHitoy8Gt4QOUsF
	4jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bAaMODoF+ATJFDcNJ+zkG39xFg5x9sELAmFwGTkPkYs=;
	b=emvcGKhmyJPD7qvd8DPwD1ATWl8kTeHC//6+d0vDvlFGkYCiR5sG+ShYlUsAvQuCUa
	4yMghlXd3Wy3VXmMPDUTk20Z0e6fp8rrhs4R0fFYowBpTMiPXY36NECXRisnu3G67FPJ
	ELKlKdrs7dJdZSuoUmSJrJ468oMR8+UlU9SFFTjgd850ns/4e61+c/ZvJJS+j1ThouoN
	dfrFjWWb57yB1Ew/GCfTV7tH+RfXBhITwlYXXDefeq8xR5ZpGvIGQhW1B4Fw/0TmBGUQ
	lsGxlLY31NxZRB4CrKfVkAJDa6fVoq+yHBlgQgYMc467KIVkogNhxp16ND9g/iC/4LAG
	6yWQ==
X-Gm-Message-State: ALoCoQkQLnqd11hB0aNwZtAA6tpWV8eOdEeJgapUvgCkFXqE1fEfb+Zyie1PVRIIff6DDL/yPwNWEjxuiVuvprenTZloJBdd1A==
X-Received: by 10.28.47.11 with SMTP id v11mr89405469wmv.27.1451912704258;
	Mon, 04 Jan 2016 05:05:04 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f205sm49061274wme.4.2016.01.04.05.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 05:05:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 13:04:57 +0000
Message-Id: <1451912697-31268-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Cc: dan.mcgregor@usask.ca
Subject: [PATCH] gcc-sanitizers: link directly against sysroot libstc++
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
X-List-Received-Date: Mon, 04 Jan 2016 13:05:05 -0000

Instead of building a shadow libstdc++-v3 directory with symlinks to the sysroot
libstdc++-v3.la, fiddle the Makefiles so that it doesn't attempt to link to a
in-tree library at all.

This fixes builds where .la files are not being installed into the sysroot at
all.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index a7b5d71..03627ff 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -21,19 +21,14 @@ do_configure () {
     echo "Configuring libsanitizer"
     rm -rf ${B}/$target/libsanitizer/
     mkdir -p ${B}/$target/libsanitizer/
-    # This is kind of gross, but it's an easy way to make configure happy
-    # without hacking it up to use the system stdc++ instead of the one it
-    # expects to be newly built.
-    rm -rf ${B}/$target/libstdc++-v3/
-    mkdir -p ${B}/$target/libstdc++-v3/src/
-    ln -s ${STAGING_LIBDIR}/libstdc++.la ${B}/$target/libstdc++-v3/src/
-    ln -s ${STAGING_LIBDIR}/libstdc++.so ${B}/$target/libstdc++-v3/src/
     cd ${B}/$target/libsanitizer/
     chmod a+x ${S}/libsanitizer/configure
     ${S}/libsanitizer/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
     # Easiest way to stop bad RPATHs getting into the library since we have a
     # broken libtool here
     sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libsanitizer/libtool
+    # Link to the sysroot's libstdc++ instead of one gcc thinks it just built
+    sed -i -e '/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=/d' ${B}/$target/libsanitizer/*/Makefile
 }
 
 do_compile () {
-- 
2.6.4


