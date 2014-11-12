Return-Path: <dev@codyps.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id DAE8665C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 01:30:53 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id f12so7634544qad.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=jaEpprn3RTIYATnn452wF7jCGBnpPwKohG/m5yrC/dg=;
	b=GtxW6tM9iSG/Q7lamvkY9y/rQLMraJ5QTsYVw0FHB0ryCZUFy/4y/c/XrzVBKxr/Rr
	TTI5q6P9NIh9irFP5IMCibxd98hZA+Q5P/Yz001R7TBhRMWMg55VHlavNpEwMSWdenjj
	BniAUquaoa40MRWIwKVcqdFbeCJucTsphk6IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jaEpprn3RTIYATnn452wF7jCGBnpPwKohG/m5yrC/dg=;
	b=ksTTiWTPdbzg1FrntzmlE7qW2i0REWvHr7i780BGgphDXdQccPB2sM+x1Ae2S2/KAd
	mPLd7gMNb7rQ+luKoBJMn2TkXxbaPdZLSW3HoY9JA0tAZGd/ofrDbQcenblRsbZSJl+N
	VY2gFW+JCcPAc8a4QlisCPTJ5gFZALYBeo7EQtaZeCZh6DqwU0eio4SQOvFILLPn4DTQ
	CO4/S9JF3CS8i92N3lDCiXJlYb4wBaEaw9tk8gChS8OmHAnfmSOpO9ZMd3yW4ViJRXzi
	M5oLuB4RdQ3zFcLAQp00HmmHKg4/iqHOJsmJniqNNvGz8NE3V33VjjAlm8IG5NNKmlaS
	WVxg==
X-Gm-Message-State: ALoCoQnhCjfHgQ7dG0RXwQyzYfB1hOekTmpCcDX515eIJpU1foLmTAYcxTUD6LFaCjNaHNLaz6cL
X-Received: by 10.224.165.77 with SMTP id h13mr6656135qay.0.1415755853781;
	Tue, 11 Nov 2014 17:30:53 -0800 (PST)
Received: from localhost (c-73-38-182-46.hsd1.ma.comcast.net. [73.38.182.46])
	by mx.google.com with ESMTPSA id
	v15sm9615403qae.40.2014.11.11.17.30.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 17:30:52 -0800 (PST)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 20:30:40 -0500
Message-Id: <1415755840-4750-1-git-send-email-dev@codyps.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] cmake: supply CMAKE_AR in toolchain file
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
X-List-Received-Date: Wed, 12 Nov 2014 01:30:57 -0000

---
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 10f8f98..3549c38 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -13,6 +13,7 @@ inherit autotools
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
 OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
@@ -35,6 +36,7 @@ set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
+set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
-- 
2.1.3


