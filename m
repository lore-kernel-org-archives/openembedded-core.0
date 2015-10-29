Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 528F9755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:00:32 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so53116705pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RzYq2zS6lRxw7840CtbvEXKlbEUfOTho+GbMl/2WEIA=;
	b=v6p1ycjuLO45NceugPen9FQI8ySxlK3JUv2+ALa9vDKYBxh3EEysQNsYt3SP7e02Ht
	RchqTtjsMPrsnF/AlAQdUNJVCEe1X+PTBBVWbnVKEgaMPsTMls6yjAQJYABp9WkDyIa/
	mlD498+FzT5uLUQM3KxES8xOBn/zYEXobEmy2H8X0yHf/HZZb0J7XPycr4MMDFa3qAk3
	0Wg+uEfd5xHxgq8gTLmxaCsQdAcCUPVC1BiyPsHb3uvstW1iyagQ2hJ5sZiMk9Y1qi8z
	FVjSrl4Lq0gTIx7xaI/5KorWa3tNv0Ukie3BdEhV8RLXNhDQjvntu8OtVRaUrMKp4g89
	Fd6A==
X-Received: by 10.68.228.200 with SMTP id sk8mr4211525pbc.115.1446152432993;
	Thu, 29 Oct 2015 14:00:32 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id yp9sm4042423pab.1.2015.10.29.14.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 14:00:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2015 14:00:22 -0700
Message-Id: <1446152422-5384-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake.bbclass: don't duplicate CMAKE_C_FLAGS in CMAKE_C_FLAGS_RELEASE
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
X-List-Received-Date: Thu, 29 Oct 2015 21:00:36 -0000

The base CMAKE_<LANG>_FLAGS are included for all build types,
therefore the CMAKE_<LANG>_FLAGS_RELEASE should contain only
additional flags or over-rides.

  https://cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/cmake.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ae3cc02..70e8677 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -18,8 +18,8 @@ OECMAKE_AR ?= "${AR}"
 # Compiler flags
 OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
 OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
-OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CFLAGS} -DNDEBUG"
-OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
+OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
 OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
 
@@ -53,9 +53,9 @@ set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
-set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
-set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
-set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "ASM FLAGS for release" )
+set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
+set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
+set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
 set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
-- 
1.9.1


