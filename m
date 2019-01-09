Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7785D7C055
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 15:28:26 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l14so6304775ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4HWsiPJx4CbGZra5oIhiIUgf7Przpy6DUBEGIBHb/YY=;
	b=toFduW5RE7eCAeC8qaSCy1+5/l/smhrZWdIpzX6Fj/b9uuJ2HW5CymCzh7H/Kjf1C/
	7frO1bvMYEElzE43VfFsK1A5lAotLaiXa1/WBfCPAv9jOy2xPH+jVjiURJ00Gp9ZSLcq
	nUhIjCevBqg7OH5GUAzKWU4moOPogZL0S5uMNyrhM8kzhjL18JLmzE6Ups5YSeEa+iNc
	qxif4UE/v9EVNNAGXz0ZqbYUQfMthB+DA660eWzjphcVaIxcqAkx0hNIC00RKuhfhn7w
	pQd0qhqRrF6AW+B3bLY2xW9SkTu1w9Hv/d1KXI+vNFAB6NCIuG5w3IRZmViU/l2y09+h
	euoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4HWsiPJx4CbGZra5oIhiIUgf7Przpy6DUBEGIBHb/YY=;
	b=CFR5QGfGck8WzZnBR18lPMBuwzNjcbNHaieJbXIyy9fuqJGwvW0mGpjU2RLtVNo2Ss
	i9neO88xwDEpj8h+vT1Vy83+LodheP1MpSUmMjN8fCSev+QGzUlIQMp8I3ucoO+bObl3
	kyU18sFTzRi4O4Tka7Z9wrv6kGokNB350X1Ze/zdfGKzz/RgKXU4rgVvzXBozf0zAbOD
	Y/U7wHFz0rggvR7V0F454Ed0O32at3gMgze6h19JgIBdrV3MzCDMWzXkJPkhVN+bzb+z
	fNLSjDVrxVbSQITUBoIqAj+ovdCpdCvdQMg7yMgIM/8HC3GZl8LrjZPIKSic0xq3URu7
	w5OA==
X-Gm-Message-State: AJcUukdRbJrOtU+eUVnDgVU0wWJ0agQt4CmqcA+TaOtFCkoFu+TCx2ko
	cBRJOBAaWInoIlkGLICyxipodRh3NUo=
X-Google-Smtp-Source: ALg8bN5/9foiE5fgslkfLl4D5eYNyPaQw4TNyS1haw+2BDhGdVR9Luuo3YRgT7E23s5NRKUke9LM0A==
X-Received: by 2002:a6b:9188:: with SMTP id t130mr3983055iod.261.1547047707207;
	Wed, 09 Jan 2019 07:28:27 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b18sm15809828ioh.28.2019.01.09.07.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Jan 2019 07:28:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 09:28:20 -0600
Message-Id: <20190109152820.16845-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109152820.16845-1-JPEWhacker@gmail.com>
References: <20190109152820.16845-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] nativesdk-icecc-toolchain: Use TARGET_PREFIX in post-relocate
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
X-List-Received-Date: Wed, 09 Jan 2019 15:28:26 -0000
Content-Transfer-Encoding: 8bit

The icecc setup for the SDK was broken in multilib configurations now
that each multilib environment runs the post-relocate scripts
separately. Including $TARGET_PREFIX in the icecc shim path and in the
toolchain environment name prevents the various multilib setups from
conflicting.

[YOCTO #13128]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh            | 4 ++--
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh          | 6 +++---
 .../icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb        | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
index 94760076bfa..81b3018bb6d 100644
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
@@ -38,11 +38,11 @@ if [ -n "$ICECC_PATH" ]; then
         CXXFLAGS="$CXXFLAGS -fno-diagnostics-show-caret"
     fi
     export ICECC_PATH ICECC_CARET_WORKAROUND
-    export ICECC_VERSION="$OECORE_NATIVE_SYSROOT/usr/share/icecream/@TOOLCHAIN_ENV@"
+    export ICECC_VERSION="$(echo "$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/@TOOLCHAIN_ENV@" | sed "s,@TARGET_PREFIX@,$TARGET_PREFIX,g")"
     export ICECC="$(which ${CROSS_COMPILE}gcc)"
     export ICECXX="$(which ${CROSS_COMPILE}g++)"
     export ICEAS="$(which ${CROSS_COMPILE}as)"
-    export PATH="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin:$PATH"
+    export PATH="$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/bin:$PATH"
 else
     echo "Icecc not found. Disabling distributed compiling"
 fi
diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
index 25250b7c0e2..fbd9f038b88 100644
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
@@ -32,7 +32,7 @@ mkdir -p "`dirname $ICECC_VERSION`"
 icecc-create-env $ICECC $ICECXX $ICEAS $ICECC_VERSION || exit $?
 
 # Create symbolic links
-d="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin"
+d="$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/bin"
 mkdir -p "$d"
-ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}gcc"
-ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}g++"
+ln -sf "$ICECC_PATH" "$d/${CROSS_COMPILE}gcc"
+ln -sf "$ICECC_PATH" "$d/${CROSS_COMPILE}g++"
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
index 9d2750e4798..304ad7fec0e 100644
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
 
 inherit nativesdk
 
-ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TUNE_PKGARCH}-${DISTRO_VERSION}.tar.gz"
+ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTRO_VERSION}.tar.gz"
 
 do_compile() {
 }
@@ -24,12 +24,12 @@ do_install() {
     install -d ${D}${SDKPATHNATIVE}/environment-setup.d/
     install -m 0644 ${WORKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/environment-setup.d/
     sed -i ${D}${SDKPATHNATIVE}/environment-setup.d/icecc-env.sh \
-        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
+        -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
     install -m 0755 ${WORKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
     sed -i ${D}${SDKPATHNATIVE}/post-relocate-setup.d/icecc-setup.sh \
-        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
+        -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
 }
 
 PACKAGES = "${PN}"
-- 
2.20.1


