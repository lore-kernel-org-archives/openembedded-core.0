Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C316660620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 17:14:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so4038212wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P5boaUCBAXj0bkQovB4zV3WAzBRld48FVyso6KNCJlY=;
	b=hGXSOgbjqZsFuaC/ob1whuLYCnDg8fSdgC67NGWlMqawmZHFNAnpTQbCLTX1C3JJyb
	OaTr6Xvq4BMxQlc40K9BUXfu4jkSC6ZmWigM1tb/YWtLmI9m7FYtMu71Iq+TsbWmJHm4
	gMuj5mT1zCFJzo20EnuhpDnWI20ghMNoHioI32dDKlCZ2exfRDvRMeESIJuVL4VDIxAp
	9xsnJUbJPGW7My7unkLXaEnKI+DPfU/BuK3RgJjNjAlfhotI5uiGBbBTumYFqeVuxG1J
	oIpFezCyEtr0myvMwe5a5QdQonjmOQ4NCBBmZkXQ2iBeKzDKgV5CmwZr5H1Qmp4zSUrZ
	D3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P5boaUCBAXj0bkQovB4zV3WAzBRld48FVyso6KNCJlY=;
	b=GJgH9sSeugKKzfAWtp5kopmKwZLVes7qB+tITvMgRHwDXedhs2gTkBnI6gZTKWNbKU
	5Z0EHyx7TL6iYV3kkMNgEh1B1Szm/Q479SzAwwWQE2mDQIML+hq6dymTGZcxH7512bgh
	19orJzeprC89NyitTvUvF5NacsRe1iS3fQbAztf7E/WoCuAzjqFVMiulFlgymBw+zFQG
	r/BraYOfdMAZxOVEQvpdwmrBGqJNjvDictq56AgSU1GFvMPuTBjV5LAK1e/1GSHAUqTr
	fMp8NlQ8H1+uzVDFqf7Ph7Kk8WCmeDlHrjHtPBn8v50kW3yJG+163d9o49ZplVG6o7+S
	uNNA==
X-Gm-Message-State: AE9vXwMDBk4zHA8VXm7oqmPuHp0k8wCZcFXui8kq59DLC+XTPGq3IDnV7jbjOhNTVMvTkA==
X-Received: by 10.194.57.244 with SMTP id l20mr4314442wjq.1.1472577270469;
	Tue, 30 Aug 2016 10:14:30 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-64.hsi15.unitymediagroup.de. [95.222.156.64])
	by smtp.googlemail.com with ESMTPSA id
	e5sm19601476wma.13.2016.08.30.10.14.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 10:14:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 19:14:00 +0200
Message-Id: <1472577240-5378-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [RFC][PATCH] cmake-native: work around gcc6's '-isystem'-allergy
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
X-List-Received-Date: Tue, 30 Aug 2016 17:14:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

since gcc6 we see many cmake/c++ based packets failing with:

| fatal error: stdlib.h: No such file or directory

a fix from gcc is not to expect [1] so work around by replacing '-isystem' by
'-I' for c++.

Build tested with many recipes in meta-qt5-extra / meta-oe inheriting cmake.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.6.1.bb  |  1 +
 .../0001-GNU.cmake-replace-isystem-by-I.patch      | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
index 33930fb..900091e 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
@@ -6,6 +6,7 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
+    file://0001-GNU.cmake-replace-isystem-by-I.patch \
 "
 
 # Disable ccmake since we don't depend on ncurses
diff --git a/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch
new file mode 100644
index 0000000..4c06490
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch
@@ -0,0 +1,42 @@
+From a84d20abe6bc68f8d1a597a22af1ca98d62a5ce4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 26 Aug 2016 12:14:12 +0200
+Subject: [PATCH] GNU.cmake: replace -isystem by -I
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+since gcc6 we see many c++ based packes failing with:
+
+| fatal error: stdlib.h: No such file or directory
+
+a fix from gcc is not to expect [1] so work around
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Modules/Compiler/GNU.cmake | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Modules/Compiler/GNU.cmake b/Modules/Compiler/GNU.cmake
+index c2d393d..9d1477d 100644
+--- a/Modules/Compiler/GNU.cmake
++++ b/Modules/Compiler/GNU.cmake
+@@ -53,6 +53,10 @@ macro(__compiler_gnu lang)
+   set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
+   set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")
+   if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS 4) # work around #4462
+-    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
++    if("${lang}" STREQUAL "CXX")
++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
++    else()
++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
++    endif()
+   endif()
+ endmacro()
+-- 
+2.5.5
+
-- 
2.5.5


