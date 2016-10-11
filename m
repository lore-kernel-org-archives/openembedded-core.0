Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id A4D3265C8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:28:55 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n189so30927149qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3LOCG8FED4vz43aCYp6ZNat7q7i2mS147H/vqujKMbs=;
	b=v6/ij+i9xD/vG+sc4otR1lhnbILS/68y+35kgmin6EIarXExb6CicqZkGid16cautn
	3VldyJ/qE06cb625VXqmyYpWXORv4tk2KXL+o3Lqaj78otzJUKKTqdYjEkKSboTa1lZc
	7LCUgBFAKP0pqx3tysQe73MdnqxcSiYQlvrKeAfpT4kpijZ3caUpInwKs9iuNiv4qD+z
	p5AqFQLTe/Ty8VIRVJqebBJeQ7XUz4oOaRb1EIKg01EKDMI09WgqaLZ0+6rPKeE2SgeO
	QraSjkl5tIbbSZ5eALDOjCnHtlp80anH88O4RZSTtPM5abB/xfGPPUsNvUQiZ+YkZNhH
	PSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3LOCG8FED4vz43aCYp6ZNat7q7i2mS147H/vqujKMbs=;
	b=l+gnC5pe9sEGw1nEXWrglyHo+AAgYZIqrEnpjWDrrlXc2EhZKa/BIe8JUf1gIpQyhl
	uOWRxwfggpzUsEr+py5jtMJx14osyfm5qHKpX2HWmYOJI/Tr72s6bq5A5RZ8XCf2Pl7z
	Awdwe715G3M2S/0Qdvv0jqyCoD1QhJwRoXMCqJDzHZIvG9dEGkoa8C6VnmLyEbF5FFD8
	LOMfuJrrtpmPIqGJ0FmxTZUtTxGkhpr54fYU3NOAgktOmDdZIjtdlsuqw8youTYYqcZ9
	EEPJvJ29w8Qs98dHL0bbg0b1lrDXOXSJ1N6SvEHH2IBekXO0zTv6Sr1Op4mE2W7ropiA
	n7Tg==
X-Gm-Message-State: AA6/9RlMGy+2fhSpjWDz335l2r2R42GjdgjK52iRRtITaWhAskBhY9FYLIxdEAy9rUv6qpkK
X-Received: by 10.194.145.37 with SMTP id sr5mr4779697wjb.194.1476188936733;
	Tue, 11 Oct 2016 05:28:56 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v3sm6122654wjm.4.2016.10.11.05.28.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 05:28:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:28:54 +0100
Message-Id: <1476188934-17044-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] cmake: also set CMAKE_FIND_ROOT_PATH_MODE_PACKAGE
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
X-List-Received-Date: Tue, 11 Oct 2016 12:28:56 -0000

The other CMAKE_FIND_ROOT_PATH_MODE_* variables were already set to ONLY, but
PACKAGE was left out.  Fix this so that cmake doesn't look on the host for cmake
modules when it should only be looking in the target sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 60014bb..0ce6573 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -3,10 +3,12 @@ set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
 set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
+
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
 string(REGEX MATCH "sysroots/([a-zA-Z0-9]+)" CMAKE_SYSTEM_PROCESSOR $ENV{SDKTARGETSYSROOT})
 string(REGEX REPLACE "sysroots/" "" CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR})
-- 
2.8.1


