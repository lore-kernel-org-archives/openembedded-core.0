Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 656D360017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:57:32 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so154562244wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vO4j1infRdzTuBbzKkyjLTi5MvAd/7HLNQ8cc8cYxEE=;
	b=i0rrx+hHQKIjVlRIZQkGObJAarHTuVMim9KkHR7/0nJAfw+0CnMqNZN8ns/e8kvhi6
	2WTf7XM/jHNak1vK1/t6XYWcED/i4OUurJ5YqDbs4E5R4e834+cnA2lh9HhXhDV72Jxw
	C9JDUZ547DL4zxTmbFSAC4RU7k4tInGOHVneqoMVzegLfO2TE9n00YWcb5jLGh99VEFv
	xAK17vynrigG2BEoZje1ckY6QS54XJGljcjj9YHVein6XKJ7tS3yDxfXu0tpG1lLe5Jv
	EGrfNgf2qC6k8Br7qLwOo39/gWf6lk+sb4mMmHrcoeTENn90rNjOrhesc2FCfRI/gNaP
	Zq8g==
X-Gm-Message-State: ALoCoQlOanzBUkXHM1gNpLIeaR/DS4F0Ad15Ygd2cMnVHyd/AQ3WxSb9q+OjV7d5Kd7ZWyaCHIyb
X-Received: by 10.194.121.34 with SMTP id lh2mr22953142wjb.101.1435733852549; 
	Tue, 30 Jun 2015 23:57:32 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id c7sm1362990wjb.19.2015.06.30.23.57.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 23:57:31 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 08:57:25 +0200
Message-Id: <1435733845-5742-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2] cmake bbclass: fix support for native builds
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
X-List-Received-Date: Wed, 01 Jul 2015 06:57:36 -0000

For native builds  of recipes (e.g. mariadb-native) cmake *must* look outside of its sysroot to find the compiler, so instruct it to do so.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/cmake.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index b0a3972..c174246 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,6 +27,9 @@ OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
+
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
@@ -50,7 +53,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 # up libraries and tools from the native build machine
 set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
 
-- 
1.9.3


