Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07E7C62134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:47:56 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id x23so15232672pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vrRzTJHA8uKGShG4Tg0iObUSf5Ug6nEkadiFTNvjhmw=;
	b=Byp6sdFcXnJGWOtZZrCx3aPNCSL0l2ymA1x5ExQ7XVXsFq3KiidbmZARgHKG253e6E
	7QH/nSc7EqhI0Eh6dzywZauLmMd6vwuUZdW6RToYmuVYlxdqEQwKJRnlw1vm2IrmTgP+
	07jCvrvZFpuZnxnjEHyW/i7a5KzrGn9UBOiLtZB43riDiAKSwr3RZYpsdrcPheMXrhet
	LwlyCqtHogkIK31QniDoB0eoko0/vbJ1bOyhqsjRm3dGd63FWJFKQ/QkteNeEBwtWqCd
	NHWJVkI9+I157XZsqrm788TS2ILG5HBeolZINXFbUjQEwnWKidlH+uwSO5fXjd5EG9N9
	CeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vrRzTJHA8uKGShG4Tg0iObUSf5Ug6nEkadiFTNvjhmw=;
	b=ROjw/YCLTOQcPlXd0zileoDP+LPSWtz0ijuf5m77sh58cGxDgRiiLqlty1wSaVqPfe
	GmZ2mJl/IPpOMG+0RQ0wLrjc8BAGwJliNnPUxEHyGJ4sPC7i86QX4LcY71x8XbKc1qR4
	HxG7QkHm2oGNTTIMo/e2p4ZRLo0xuyGmQrWrH3pyWcLICuTD57YDwdFat9lIX31k7Gia
	xhbrwhM9FFwQqNXkc85IfMNsUk8WbS8g/FuBFYrh6YjrsVQPSDSOOq4agOHghoVs34PR
	felieMOo35utTkzHaHgt+DBmT9jm3OME6rIo9c8MeZT53/mGBSAnXtaxjmAhje4u1EAt
	Mrsg==
X-Gm-Message-State: ABUngvfcqs6LLPyI5gKMVNPpED0orZkuvEEYek5QY7RSJPvkz8oBdHVPxnhURhCMCYXKuA==
X-Received: by 10.99.150.10 with SMTP id c10mr10859022pge.46.1479318478137;
	Wed, 16 Nov 2016 09:47:58 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s2sm55946617pfi.10.2016.11.16.09.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:47:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:47:47 -0800
Message-Id: <20161116174748.26994-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161116174748.26994-1-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
Subject: [PATCH 4/5] cmake.bbclass: Set CXXFLAGS and CFLAGS
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
X-List-Received-Date: Wed, 16 Nov 2016 17:47:57 -0000

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


