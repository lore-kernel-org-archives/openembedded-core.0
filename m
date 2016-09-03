Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 725E17716E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2016 00:12:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v143so4748286wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 17:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PJ/VOrAV1EqCV06dv8nl09/2eBjshRLahGkwH8I9a5I=;
	b=iQC8rnJ+r/z8R9JCCLeI0IKK0HTnv32XVISBgZpilRENQi2TKyElTONWdctNFVXnOY
	jhSBCGTGJiXb2tNr/yxBaEixBahafjbkU3bU3FReJKGGDnwFeLM4jzJ+WR86kVv1JhgH
	/neZqG9k1xpbF52P6A7/621BRcyQA8fypQTteMoP0haBBZm53yrRv0TLXIgyLSdFVNQi
	EPO8DPSQ8Ii8gNVY70I7y9ipHXz9zd+dr5dLyxWVkCWYvQz+edcIAHKPJD3RneoYsr7c
	77grB9wdV69RL0Q+pGUAIQTArIPy+12xWZmGZJ8p/u0czkS9ZKMCVAqA4xzTFGBvWS8A
	uwyQ==
X-Gm-Message-State: AE9vXwNddLhMk7rso4ijy4LNTCFH7zDbZwqClchJvFi/+r4Jwq1WO/ugaShcINxqzEXEhg==
X-Received: by 10.194.117.104 with SMTP id kd8mr4493836wjb.113.1472861557255; 
	Fri, 02 Sep 2016 17:12:37 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	a3sm12765902wjw.15.2016.09.02.17.12.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 17:12:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2016 01:12:22 +0100
Message-Id: <20160903001222.2864-4-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160903001222.2864-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160903001222.2864-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 3/3] boost: fix MIPS16e compilation
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
X-List-Received-Date: Sat, 03 Sep 2016 00:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport upstream patch to use g++ 4.1+ __sync intrinsics
instead of incompatible hand-written assembly when
compiling for MIPS16e

Upstream-Status: Backport https://svn.boost.org/trac/boost/ticket/12418

Signed-off-by: André Draszik <git@andred.net>
---
 ...ips-assembly-doesn-t-compile-in-mips16e-m.patch | 60 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch

diff --git a/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch b/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
new file mode 100644
index 0000000..2b48d0d
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
@@ -0,0 +1,60 @@
+From 4f19d72ca94418431e068cfd4ffb96ed9b289f6c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Wed, 24 Aug 2016 17:34:59 +0100
+Subject: [PATCH 3/4] smart_ptr: mips assembly doesn't compile in mips16e mode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc.compile.c++ <builddir>/boost/bin.v2/libs/date_time/build/gcc-4.3.1/release/threading-multi/gregorian/greg_month.o
+
+    "mipsel-poky-linux-musl-g++" "-mel" "-mabi=32" "-msoft-float" "-march=mips32r2" "-mips16" "-minterlink-compressed" "-mtune=24kec" "-mdsp" "-Wl,-O1" "-Wl,--as-needed" "-fstack-protector-strong" "-Wl,-z,relro,-z,now" "--sysroot=<sysroot>"  -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=<srcdir>=/usr/src/debug/boost/1.61.0-r0 -fdebug-prefix-map=<sysroot_host>= -fdebug-prefix-map=<sysroot>= -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pthread -fPIC  -DBOOST_ALL_DYN_LINK=1 -DBOOST_ALL_NO_LIB=1 -DDATE_TIME_INLINE -DNDEBUG  -I"." -c -o "<builddir>/boost/bin.v2/libs/date_time/build/gcc-4.3.1/release/threading-multi/gregorian/greg_month.o" "libs/date_time/src/gregorian/greg_month.cpp"
+
+{standard input}: Assembler messages:
+{standard input}:17603: Warning: the `dsp' extension requires MIPS32 revision 2 or greater
+{standard input}:17604: Error: unrecognized opcode `ll $3,4($16)'
+{standard input}:17606: Error: unrecognized opcode `sc $2,4($16)'
+{standard input}:17734: Error: unrecognized opcode `ll $3,8($16)'
+{standard input}:17736: Error: unrecognized opcode `sc $2,8($16)'
+{standard input}:18084: Error: unrecognized opcode `ll $3,4($4)'
+{standard input}:18086: Error: unrecognized opcode `sc $2,4($4)'
+{standard input}:18318: Error: unrecognized opcode `ll $3,8($4)'
+{standard input}:18320: Error: unrecognized opcode `sc $2,8($4)'
+{standard input}:19921: Error: unrecognized opcode `ll $3,4($2)'
+{standard input}:19923: Error: unrecognized opcode `sc $3,4($2)'
+{standard input}:20199: Error: unrecognized opcode `ll $4,4($16)'
+{standard input}:20201: Error: unrecognized opcode `sc $2,4($16)'
+{standard input}:23392: Error: unrecognized opcode `ll $4,8($16)'
+{standard input}:23394: Error: unrecognized opcode `sc $2,8($16)'
+...failed updating 1 target...
+
+boost/smart_ptr/detail/sp_counted_base_gcc_mips.hpp
+contains hand-written MIPS assembly, which is not compatible
+with the MIPS16e instruction set.
+
+By not using this file in MIPS16e mode, we fallback to using
+g++ 4.1+ __sync intrinsics (__sync_fetch_and_add() and
+__sync_val_compare_and_swap()) which are working fine.
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Backport https://svn.boost.org/trac/boost/ticket/12418
+ boost/smart_ptr/detail/sp_counted_base.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/smart_ptr/detail/sp_counted_base.hpp b/boost/smart_ptr/detail/sp_counted_base.hpp
+index 0addf07..0995ca8 100644
+--- a/boost/smart_ptr/detail/sp_counted_base.hpp
++++ b/boost/smart_ptr/detail/sp_counted_base.hpp
+@@ -65,7 +65,7 @@
+ #elif defined( __GNUC__ ) && ( defined( __powerpc__ ) || defined( __ppc__ ) || defined( __ppc ) ) && !defined(__PATHSCALE__) && !defined( _AIX )
+ # include <boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp>
+ 
+-#elif defined( __GNUC__ ) && ( defined( __mips__ ) || defined( _mips ) ) && !defined(__PATHSCALE__)
++#elif defined( __GNUC__ ) && ( defined( __mips__ ) || defined( _mips ) ) && !defined(__PATHSCALE__) && !defined( __mips16 )
+ # include <boost/smart_ptr/detail/sp_counted_base_gcc_mips.hpp>
+ 
+ #elif defined( BOOST_SP_HAS_SYNC )
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index de482ee..6926e84 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "\
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
     file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
+    file://0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch \
 "
-- 
2.9.3


