Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 95B09600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 16:14:42 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l132so336775941wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=oJb9hkTWsZOYqUa72vQ9XEqflwK1nTy+vZuB/NVGxt4=;
	b=nqBCIT/zL/+DCpYNczzzcaxxMdEa1hYpBYYHSI+nCKiBxZXXdehf9krI2jhLOy08B2
	M8y4ORLjAwNgLmei8Yfn/dIKGkuqUQCoHjD3aESOcFH/YOKJXV5qaoWg90KR4EzbiAoV
	6PmA0CTaHOLD1OW+mqqBHLTkK/q24S81A55BNyquesC34kW6M0oO5CiTLELtZ2e/1mxP
	HCHfTzJ16Cyqm/fCUzly6WHXlsedqZJF2Gssn78zBYP1ubV8du4I7S2SMi6KpbbbvAtV
	bV/OQ7e4z7ILJwf3TklkL4PmIthoC0yg9kv0PD0Chv1QY7BnWE3iUt6YgFHdhP/gxRpQ
	sTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oJb9hkTWsZOYqUa72vQ9XEqflwK1nTy+vZuB/NVGxt4=;
	b=VPkc3IcnX9qVXcSJETcbqjuyITE8lNgStU+oQKoM4YmeB/TxG08OOE03AlZayzhVdK
	XJ/3lIEICeP1iYpFUIVqAtcjI4XykzP8kr8cC0ERNIIg/YQW95IHY3Nle7vur+N6ORex
	UJRUurNGQKz50+LIXYaOZ7fBgWaK/beKVLsmfwn+VBXM4EO1DZQEL7WOJ4qRlE7q5G5h
	ru0yCoq2gs5NSc/dyhUO2yqN1qepuvheOcgq9ex52m0MW++TkCedXqr5ooiW5ozuqWt+
	NRZHoXuFguHN9pjYq5z1hpWBeUw3Z3mp7h3bXB/QTrV13O7bih7nSFIWK2HGGpfDtdlc
	cKHg==
X-Gm-Message-State: AA6/9Rm2x5suYvOfR0OOTDlHePqqSEORODa+y2wzEQF+pqaZ7e/nk5G5B7usRjoJFjVz6P7d
X-Received: by 10.194.242.200 with SMTP id ws8mr2707937wjc.205.1474560882777; 
	Thu, 22 Sep 2016 09:14:42 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i127sm3236214wmf.4.2016.09.22.09.14.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Sep 2016 09:14:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 17:14:40 +0100
Message-Id: <1474560880-8463-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] cmake-native: prefer native sysroot libraries over host
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
X-List-Received-Date: Thu, 22 Sep 2016 16:14:43 -0000

Explicitly set CMAKE_LIBRARY_PATH so that find_library() looks in the native
sysroot before the host.

Also pass --verbose to configure which sets CMAKE_VERBOSE_MAKEFILE for detailed
compile logs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
index a301ae6..aec0d64 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
@@ -12,6 +12,7 @@ do_configure[cleandirs] = "${B}"
 
 # Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
+    -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
     -DBUILD_CursesDialog=0 \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
@@ -21,7 +22,7 @@ CMAKE_EXTRACONF = "\
 "
 
 do_configure () {
-	${S}/configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
+	${S}/configure --verbose --prefix=${prefix} -- ${CMAKE_EXTRACONF}
 }
 
 do_compile() {
-- 
2.8.1


