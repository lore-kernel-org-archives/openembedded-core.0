Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1890060102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 05:35:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so5559135pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2016 21:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vrRzTJHA8uKGShG4Tg0iObUSf5Ug6nEkadiFTNvjhmw=;
	b=GKD/JG+sFam0/fq5jzIL041QmwPipdxZMigNEzvhB9N4ZGDAWXnU/5A687Pl/9ih4R
	GvJwBZufd0dcJBeI6FfpQ+gHcItm64gUfGtXlvswSWTZBlK5AtwqnkhILgFZ7Cwx+vfT
	sUrDIoW8NwsKJJRkFB66Vh7n3jg6QPSmi3j/NkAHgHIwHNT52Sdroa1+evqKHVfBr6OS
	AzzlRqlzWA5TZTkZMtnyTPGclsx2WoSCLqFZpaS1OZzJ3SpcijJaj/kB7dRkCtg2YGxw
	5iynREThAvRQCWcZcJ56XCpjc3KTgQ/OjrGOEiF/UclvlKr4+o1XDL3xnTeUNPs9WPNp
	2w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vrRzTJHA8uKGShG4Tg0iObUSf5Ug6nEkadiFTNvjhmw=;
	b=fOO/ooVknipvbNZEFmIskypm4cTiqaI4ndrmBFisRYPiANAYJkrUbINJ033OqJ34qD
	wr50G4rE6DvXGih5asAcfjVYI7SssdYWhpvjopYzcLvYr1lXGpqURrHJkSVe3d8efQAS
	3PZIxPeU6ZQY/CLYD9sMZYpJEARAbX1sDah69z+w34eXmeXoZcj00MPsDoWt9ca0UagE
	ZkIJX/kNUO+zAV9IwkzxiLHTpmkMoMcsf5YZ/YUHF6MdrCUHfoHDfGioSXuSOGEh6zA6
	K2ckqb6s5MXQdttuZM3fCVMpAsOeLYEdHn6titQm209UGSGhtfSw+UGgWDUbKo3Pq3uJ
	LwLA==
X-Gm-Message-State: ABUngvfmHMbcyJW8dREOKzWZYTO5pZ6Z0RWE5dQNsVPB6p0I5I86kn1B5CpSrYBhhFRN3Q==
X-Received: by 10.99.176.78 with SMTP id z14mr42065278pgo.3.1479101755751;
	Sun, 13 Nov 2016 21:35:55 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s3sm27742027pfe.27.2016.11.13.21.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Nov 2016 21:35:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2016 21:35:46 -0800
Message-Id: <20161114053546.1051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] cmake.bbclass: Set CXXFLAGS and CFLAGS
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
X-List-Received-Date: Mon, 14 Nov 2016 05:35:55 -0000

We strip the TOOLCHAIN_OPTIONS and HOST_CC_ARCH from CC/CXX in cmake.bbclass
whereas CFLAFS and CXXFLAGS assume that TOOLCHAIN_OPTIONS are
part of CC/CXX variables, this causes compile failures when cmake
is running compiler tests during configure on some architectures
especially armhf, because hf ABI information -mfloat-abi is part
of TOOLCHAIN_OPTIONS, so what happens is that testcase gets compiled
without hard-float, howver, during linking the float ABI option
is passed via LDFLAGS, now linker rejects this and fails like
/mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: error: cmTC_27947 uses VFP register arguments, CMakeFiles/cmTC_27947.dir/src.cxx.o does not
mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: failed to merge target specific data of file CMakeFiles/cmTC_27947.dir/src.cxx.o
collect2: error: ld returned 1 exit status

This means that CMake now fails the configure time test too
which is not right, e.g. it might disable features which actually do exist
and should be enabled e.g. in case above it is resulting as below

Performing C++ SOURCE FILE Test HAS_BUILTIN_SYNC_SUB_AND_FETCH failed with the following output:

Its actually a bug in CMake see
https://gitlab.kitware.com/cmake/cmake/issues/16421

CMake is ignoring CMAKE_CXX_FLAGS when using CHECK_CXX_SOURCE_COMPILES
function.

Until it is fixed upstream, we add HOST_CC_ARCH and TOOLCHAIN_OPTIONS
to CFLAGS and CXXFLAGS, so that we can ensure that compiler invocation
remains consistent.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3e762de..fad0baa 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -19,6 +19,8 @@ OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
 OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
+CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
-- 
2.10.2


