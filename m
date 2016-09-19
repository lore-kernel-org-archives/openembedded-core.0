Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D47F56FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:38:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w84so6771801wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Vho8RjGPVprvkyD0Ipb7WLwi3A4aeRhV25xlFt732uY=;
	b=QozQESwaKBx1XM+0y0vbpelekoA/GPsU9GC8qOKMbXKfIjwC/RwMdbw4f+MUtEjwQx
	TdTduA26X7dGKnfwdi+2jh4Q3YRQYKszyXrCyQ+3EeogbQh9e6xPG4wx7iYjw5Kv1OrC
	r5UL3tKQb10J7OBPQ85LoV49rrEB1XypLri1Q/8/DhejdPAXvnqGEm8Q8SwNQkbu/8UL
	7H+mj3AJ9xUKpJ7DCUrEKdXRNuaquQsF0hB0jUAXMNIfBgAdOwR66mlnru+AlC5kU9ky
	zHks30WY3E0ckDbCFOKajjYbs4XiUZQPMZwHS8JdUTHTJxl98VlC/hhz8cX/ZKTOwkdr
	XOwg==
X-Gm-Message-State: AE9vXwN+JNGto3+E35C+Ep/QUw9hrkFBVQzAPOBEqbgHcT9RQWHX7UkFjAWCr4jifSY9/g==
X-Received: by 10.28.59.7 with SMTP id i7mr8792319wma.127.1474277937727;
	Mon, 19 Sep 2016 02:38:57 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	gr7sm22151128wjc.1.2016.09.19.02.38.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 02:38:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 10:38:53 +0100
Message-Id: <20160919093853.15528-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] boost: switch to using C++11 atomics when available
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
X-List-Received-Date: Mon, 19 Sep 2016 09:38:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The alleviates the need to use and maintain hand-written
assembly, just relying on the compiler to do the right
thing.

Signed-off-by: André Draszik <git@andred.net>
---
 ...by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch | 58 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch

diff --git a/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch b/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
new file mode 100644
index 0000000..44b8b49
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
@@ -0,0 +1,58 @@
+From c234cc557f60729e071d6da59747c1a9289555c5 Mon Sep 17 00:00:00 2001
+From: Peter Dimov <pdimov@pdimov.com>
+Date: Sun, 28 Aug 2016 21:28:21 +0300
+Subject: [PATCH 4/4] Use <atomic> by default when BOOST_NO_CXX11_HDR_ATOMIC is
+ not defined
+
+---
+Upstream-Status: Backport https://github.com/boostorg/smart_ptr/commit/20fedcff2ca3143503ec4e876d47745ab0ec7b0c
+ boost/smart_ptr/detail/atomic_count.hpp    | 3 +++
+ boost/smart_ptr/detail/sp_counted_base.hpp | 3 +++
+ boost/smart_ptr/detail/spinlock.hpp        | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/boost/smart_ptr/detail/atomic_count.hpp b/boost/smart_ptr/detail/atomic_count.hpp
+index 8aefd44..6e4f71a 100644
+--- a/boost/smart_ptr/detail/atomic_count.hpp
++++ b/boost/smart_ptr/detail/atomic_count.hpp
+@@ -73,6 +73,9 @@
+ #elif defined( BOOST_DISABLE_THREADS ) && !defined( BOOST_SP_ENABLE_THREADS ) && !defined( BOOST_DISABLE_WIN32 )
+ # include <boost/smart_ptr/detail/atomic_count_nt.hpp>
+ 
++#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
++# include <boost/smart_ptr/detail/atomic_count_std_atomic.hpp>
++
+ #elif defined( __GNUC__ ) && ( defined( __i386__ ) || defined( __x86_64__ ) ) && !defined( __PATHSCALE__ )
+ # include <boost/smart_ptr/detail/atomic_count_gcc_x86.hpp>
+ 
+diff --git a/boost/smart_ptr/detail/sp_counted_base.hpp b/boost/smart_ptr/detail/sp_counted_base.hpp
+index 0995ca8..83ede23 100644
+--- a/boost/smart_ptr/detail/sp_counted_base.hpp
++++ b/boost/smart_ptr/detail/sp_counted_base.hpp
+@@ -44,6 +44,9 @@
+ #elif defined( BOOST_SP_HAS_CLANG_C11_ATOMICS )
+ # include <boost/smart_ptr/detail/sp_counted_base_clang.hpp>
+ 
++#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
++# include <boost/smart_ptr/detail/sp_counted_base_std_atomic.hpp>
++
+ #elif defined( __SNC__ )
+ # include <boost/smart_ptr/detail/sp_counted_base_snc_ps3.hpp>
+ 
+diff --git a/boost/smart_ptr/detail/spinlock.hpp b/boost/smart_ptr/detail/spinlock.hpp
+index 19f93d7..0b618df 100644
+--- a/boost/smart_ptr/detail/spinlock.hpp
++++ b/boost/smart_ptr/detail/spinlock.hpp
+@@ -43,6 +43,9 @@
+ #elif defined( BOOST_SP_USE_PTHREADS )
+ #  include <boost/smart_ptr/detail/spinlock_pt.hpp>
+ 
++#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
++#  include <boost/smart_ptr/detail/spinlock_std_atomic.hpp>
++
+ #elif defined(__GNUC__) && defined( __arm__ ) && !defined( __thumb__ )
+ #  include <boost/smart_ptr/detail/spinlock_gcc_arm.hpp>
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index 6926e84..33f209c 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -8,4 +8,5 @@ SRC_URI += "\
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
     file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
     file://0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch \
+    file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
 "
-- 
2.9.3


