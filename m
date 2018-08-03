Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3541C78A02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:01:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h14-v6so5494170wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=58UzkkMlFxOhmJku/UneyoYLHmp1PTluSICvylp9+JU=;
	b=vrSrpXdyhUNamMG52l7RIzfQ89EQZ0vW6C5GZzJThuhsmoAktjiEkB9X+z8IuRK+iL
	RpHv9ZSEHV3aZClyhTjiyFFGKBz5CpzubANycIWo/CO/xwqo6WCY21FbNqPPEoODQCTL
	r06JWAFu2FlbYXIdJ1UwA5N1QKQAHylFXaEm6LC5wpQVRkqCmwAjCNT4AJp77MmfhcmT
	Ml0Prk45BUxnti/t7KVXHexxGiNy3rLBPQDMAl1k9Lhj/RmeWsbcg5N49ZSJr7rGi240
	4Np8CGMzeLLT6OBhXmtgqQmaL0QI0yT4Zf1MqmKTF80tjLHz8YdVGVMHn8Ho6fjvmfn9
	rgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=58UzkkMlFxOhmJku/UneyoYLHmp1PTluSICvylp9+JU=;
	b=Kd3nR9Ic/R7hlsvn06u5V4CaEJV2oEwZsSjb9KiDohlgpgp5wfTW/r3liPutbNB+rR
	+FJyl1TW/SIxfqlWlvzIgAsloDw0FVAzzr8l2gQHGhoDOqm0t/SoV0eQ2w1fpAHLeXAv
	1piuWLpSm6/lekdYy4o1oyzaGC+lIBfnA264oBJvXKDxYzYFL7q4HfLGUkpxai6uW6tY
	lk/a0RJCEdwPw0N9ZbJdLGnmRfxZjqWZPZNX515+JPkMoJg1//ngFjOkQx7BjisNTTrL
	T2HJiW08lDQkM5AzEiUgnwQRhoQRLOo+rcZ6Xwi0nxZ/gMo9WC0Ys6V1KGAM4Pa8zD7D
	KDWg==
X-Gm-Message-State: AOUpUlF0ja+Gm+zmG2rtOEfAhK9Fzm0MRvHKQWLDqOr4NUzPlKiChNxE
	G7h9V4K4h2/dV8sXv2xZyqUwVvoJ8e4=
X-Google-Smtp-Source: AAOMgpe5MUIQrBjOltK2BpQjC7PcFF+QwQQPQc6BR1lBRBVs2YN7bYpPnOyR8bElEuPWtZ0R+CLCEg==
X-Received: by 2002:adf:dfcd:: with SMTP id
	q13-v6mr2607484wrn.113.1533304891236; 
	Fri, 03 Aug 2018 07:01:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm7753757wmd.32.2018.08.03.07.01.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 07:01:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 15:01:12 +0100
Message-Id: <20180803140115.25450-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] cmake: fix linking in multilib SDKs
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
X-List-Received-Date: Fri, 03 Aug 2018 14:01:31 -0000

CMake, in it's infinite wisdom, when searching for libraries (using
find_library) will look inside the libraries PREFIX/lib, PREFIX/lib32, and
PREFIX/lib64.  In a multilib SDK more than one of these will exist (potentially
all three) and obviously for a given build configuration only one of those is
valid.  This search path is hard-coded deep inside CMake but by setting
CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX we can bypass it and set an explicit
lib<SUFFIX> to use.

Do this by writing ${baselib} into the environment file, and then stripping
"lib" from this to obtain the suffix in the cmake-specific environment script,
which is then read in the CMake toolchain.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/toolchain-scripts.bbclass                    | 1 +
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 ++
 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 0ff5301530b..63b07c802f4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -51,6 +51,7 @@ toolchain_create_sdk_env_script () {
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
+	echo 'export OECORE_BASELIB="${baselib}"' >> $script
 	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index dc8477ea345..d52c29e5a1c 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -10,6 +10,8 @@ set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
+set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
+
 # Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
 if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
   set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
index 64b6cf3c6a3..7bdb19fb6ce 100644
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
@@ -1 +1,2 @@
 export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
+export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
-- 
2.11.0


