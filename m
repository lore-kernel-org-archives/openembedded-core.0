Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6767867E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:26:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f3so8665666wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=p8rf/15eIwTy+nGR7fz6qASmkrPl9gEdubUdCh5gEAU=;
	b=S/OucQjw3SBfLCG4blkPuMAtMCmGXuOIDSeZVlMRLbSloBxPao43oMHmIwxVKU8SKu
	rKZU2BwGcEaH4aSmYFse3jxIO2uDIcDWJjJc7l3kmD9JAwtknqahJLE0ztTkGYpdh087
	JNLNoloV7DVg3/zGXrFGtpt/qOkVIPu3NFcI5j9vuQKcXNU18zArIhHWMtHTHtP3larK
	b+lcIXbgJYyrUP1BfcnpA5FzV1eZUr1JGRTBKfcLv5RobsIczRBBqdyu6gmyB0Ab0x79
	M4couhEBi9zjRS07dWi/z0XDkRLif+yIMQxpe1hiXf/07s29eAnXp1LP0TrJyQ4WsnbR
	zf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=p8rf/15eIwTy+nGR7fz6qASmkrPl9gEdubUdCh5gEAU=;
	b=iWYuZBTnVEFVzijwRay9nM4/TwW4GK/PSZNvrdj1AK3IOYc2hj2dTo6qodddb6EC/0
	mR/nr/ZeKpHQFEi1Jlptk8OsI2ppqJh1dbNvLAEBZLWgT6nDOiMWdom4/vqjZqZSBuSw
	oVdsSC9cD4j0Vk+hbcDJqI6di1cbmFnAU4vr+dOtXpWreoFD1pIEfS/i3hSaqWvO7z9d
	6nF4eLmLEkLTZADZCagdopCnxB+5pghlSQUgPjoGuM4LKS3eew1dWRGKscKRx0JS7lTJ
	CrbTyDRWpOJ3q45fZ+wkpHuMUJy8lUCRB3xV/5GKmnGk+JjR4IK9vJPcaIZL6dcqhf03
	/aFA==
X-Gm-Message-State: AKwxytd4hdkrYTmYWT1I1/a0+8BrNEwYYq7RnOFmMyxV/nQu4MWaljws
	ntCmJculQsxxyDTDatF33PUAPlnn
X-Google-Smtp-Source: ACJfBou8AwiActceVocQSiHLiQDvNHs6oNV7AlalBl/oB+COriU9UX+LnFoT1FGWLHQoFY9nlqFUjQ==
X-Received: by 10.28.196.73 with SMTP id u70mr7928535wmf.116.1516109164267;
	Tue, 16 Jan 2018 05:26:04 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b133sm1430134wmh.4.2018.01.16.05.26.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 05:26:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 13:25:59 +0000
Message-Id: <20180116132559.27794-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Tue, 16 Jan 2018 13:26:03 -0000

The Ninja backend is faster than Make for large projects (takes three minutes
off webkitgtk:do_compile for me), so use it by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 10c4edcf1a5..ab29b1f1c23 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,7 +1,7 @@
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
-DEPENDS_prepend = "cmake-native "
+DEPENDS_prepend = "cmake-native ninja-native "
 B = "${WORKDIR}/build"
 
 # We need to unset CCACHE otherwise cmake gets too confused
@@ -120,7 +120,7 @@ cmake_do_configure() {
 		oecmake_sitefile=
 	fi
 
-	cmake \
+	cmake -GNinja \
 	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
@@ -141,7 +141,7 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
-do_compile[progress] = "percent"
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 cmake_do_compile()  {
 	bbnote VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
 	VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
-- 
2.11.0


