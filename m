Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B653871976
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 08:47:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u84so3446180pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wlKlZw3eaa00e1FMjqSwaDS2D2P99qlcwsWJ1X7w4o8=;
	b=AHdpT5fk6fqkW9v+pvNsKdh+Gf9Er5HHgUzfDltgDBbmUIsauqHYmP5dG5vggzsoV0
	ZADzREEKzwWe+3kUoLWlTuEq0oytJf74HezBC46J9lujobssHkQ02bFHBkiOJVHe7u8Z
	FUVQBlcCwQu9DG9C29E6LQBXSQ4VvfxEihR+YcZwOz9SlQse+tYgMGY0nclUvodggkDN
	SOEjWrn4RBZgNmCKqTwVTrzbCJsyZt82PhbvO69moT8M6ZWLydUIwoP/0pPU8ox+pPET
	q/Xl0ko82qPxFBK7izg9PCKGGNawzU0ix1ykzUqugifWWzh2lRGiandZfASKrMmMWv07
	QNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wlKlZw3eaa00e1FMjqSwaDS2D2P99qlcwsWJ1X7w4o8=;
	b=A8d88uyKSoORXBdU63Aa4pvY1C2bCCICevIFOtTtz3Ou/20RwhKmAViIidHigXoFZC
	OGyPN67/ZlXgjM+m+JY7qi8mqfn53BzH2iTAdszmXzMqu61MDRQqXcV8CkB/83Nnc8u4
	h9apilk3jWrH/MBBzjC0GRL9Vetkg1uyaFvF2p/La2yPKxqvQisTTJhxeYILDlt7mYIu
	KONvkkoqWnYYLZg3v+bc6qrujLgie1l7MO9D6DwSnHMss32agzgyScXF8yjd6JoXm4TX
	xUh4q9U64VpquPFB6uhe0iSbyqrzSDuzWYB65gN8jf3H2MX+M+9XAIjN4XZeFBypAAMZ
	1XOQ==
X-Gm-Message-State: ABUngvegRWLQvwgE2vR+HIYC1BPnnhteHNxc5g9hRjXPGNxlhqJWkJLBsHVYu8HzlhbW1A==
X-Received: by 10.98.74.12 with SMTP id x12mr31759258pfa.140.1477730833549;
	Sat, 29 Oct 2016 01:47:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	f129sm23781930pfc.3.2016.10.29.01.47.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Oct 2016 01:47:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 01:47:07 -0700
Message-Id: <20161029084707.29652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] cmake.bbclass: Exclude native sysroot from CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Sat, 29 Oct 2016 08:47:12 -0000

This has been cause of issue where we were getting both usr/include
dirs ( from target as well as native sysroot) added to compiler
flags.

CXX_INCLUDES in final flags.cmake would include
-I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
most of the time it would work since headers are mostly
common but netflix package failed to compile since one of
the headers was including curl headers which it could not
find in target sysroot and it went to next include path
and found it in native sysroot which is not what we want
when doing cross compile.

As per https://cmake.org/Wiki/CMake_Cross_Compiling
never search for programs in target sysroot but search
for packages,libs,includes only.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3e762de..3e8df37 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target = "NEVER"
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
@@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-- 
2.10.1


