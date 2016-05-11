Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A306B758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so5033189pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bMMHeaYgxe7/cWVosgKgOpNIgc7vCV5sgAJNK5F/Qu0=;
	b=CSFHM068ZBqG49eAURstT/IzLj+Z0rDL0CT/udb7jpGGDxhnFH6GGdBxKwBj05OIPH
	JfcWqYfdSBKEiF8xcSPkSewjKk1mwn/8NNcIlvkJkCkIVnyfKTjbJNITsfn3JyWt8Nzh
	seryKyoR3e1YFcsgQvho/3tH6njMQ0KukU32ChG1exwxfmTRy0ttWqVB/COI9fRPCrGT
	d/SK3xzuVZtCgzv/RzYQ57q0AwY2V+qxHBT5W6tjXM0jW+9znAZtStvbX4WhNSRe88Cl
	meOT2i0vlKhoFDREQxQwt3jPWCaqkjNTRkp+LVvBMBwuCssTZfKm6nzCIdwmxXzzmTlK
	BRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bMMHeaYgxe7/cWVosgKgOpNIgc7vCV5sgAJNK5F/Qu0=;
	b=aWYyDt2Cn1SU+t6iOqkdqQfPXzFR1CqtRNzQgKVdr33Dc4qkBTlG2FmI6Df0bScty0
	RnhjYSshCh1cxYGRsorPhbMSiTn/2wmtjhMgwgZdM8aeu0wRAV2+YBM8eBxYIar8uxv0
	m3ZJTdYtTpAJfQJJVE/G1DRs7RnyBuCuz+tW4oqiaAND1xRZqTvyyp2Rq5bjKLVZ7wgB
	9NXayR3hQ9FwVOW9LdBAXEWIVslsrD0KVUdgNW5Q4RZnfvVmrSYyxO9xKdUmkq2JjWhs
	6RVacgasEwlMDwwNr5EFCneP6haRXrk1DpgDs6UXB2nsMZj/Gqw3L4kKHKMjRh8LJMAx
	PC8Q==
X-Gm-Message-State: AOPr4FUxR+7KDEdhAqGW9FnpN58LsnC4xf+yxM5l5/jVL8ZdDXxEk5QW5LY9KpiIHM9HZA==
X-Received: by 10.98.2.79 with SMTP id 76mr6782506pfc.147.1462988168683;
	Wed, 11 May 2016 10:36:08 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:18 -0700
Message-Id: <367b9df4b639290cfce1e409b903c0569d22a9ff.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 15/42] valgrind: Fix build with gcc6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind/valgrind/gcc5-port.patch              | 64 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch b/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
new file mode 100644
index 0000000..76bc821
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
@@ -0,0 +1,64 @@
+backport fix from upstream to fix build errors with gcc 6
+
+http://valgrind.10908.n7.nabble.com/Valgrind-r15773-in-trunk-configure-ac-drd-tests-std-thread-cpp-drd-tests-std-thread2-cpp-td56109.html
+
+../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:3: error: '_Impl_base' is not a member of 'std::thread'
+   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
+   ^~~
+../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:28: error: '__t' was not declared in this scope
+   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
+                            ^~~
+../../../valgrind-3.11.0/drd/tests/std_thread.cpp:30:59: error: '_Impl_base' in 'class std::thread' does not name a type
+   std::thread::_Impl_base* __t = static_cast<std::thread::_Impl_base*>(__p);
+                                                           ^~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+Index: configure.ac
+===================================================================
+--- a/configure.ac	(revision 15772)
++++ b/configure.ac	(revision 15773)
+@@ -160,7 +160,7 @@
+      icc-1[[3-9]].*)
+ 	AC_MSG_RESULT([ok (ICC version ${gcc_version})])
+ 	;;
+-     notclang-[[3-9]].*|notclang-[[1-9][0-9]]*)
++     notclang-[[3-9]]|notclang-[[3-9]].*|notclang-[[1-9][0-9]]*)
+ 	AC_MSG_RESULT([ok (${gcc_version})])
+ 	;;
+      clang-2.9|clang-[[3-9]].*|clang-[[1-9][0-9]]*)
+Index: drd/tests/std_thread2.cpp
+===================================================================
+--- a/drd/tests/std_thread2.cpp	(revision 15772)
++++ b/drd/tests/std_thread2.cpp	(revision 15773)
+@@ -26,6 +26,7 @@
+   return 0;
+ }
+ 
++#if defined(__GNUC__) && __GNUC__ -0 < 6
+ //
+ // From libstdc++-v3/src/c++11/thread.cc
+ //
+@@ -70,3 +71,4 @@
+     }
+   }
+ }
++#endif
+Index: drd/tests/std_thread.cpp
+===================================================================
+--- a/drd/tests/std_thread.cpp	(revision 15772)
++++ b/drd/tests/std_thread.cpp	(revision 15773)
+@@ -21,6 +21,7 @@
+   return 0;
+ }
+ 
++#if defined(__GNUC__) && __GNUC__ -0 < 6
+ //
+ // From libstdc++-v3/src/c++11/thread.cc
+ //
+@@ -65,3 +66,4 @@
+     }
+   }
+ }
++#endif
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 8240500..13354f4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
+           file://gcc5-port.patch \
 "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
-- 
2.8.2


