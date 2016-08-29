Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5CE7002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:55:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so9224086wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DtOZkkMhy9pUl8E21GR/5qCH7a30puKfY1SzbIjfrgg=;
	b=ejk+9MMixRKmoYaA4Bk1EU6MSJwKq9ISJ19TBUy9Kw765IUuDz4exN20Z3WwLzbPOV
	g91k9rQJDNR7MkYiBN7z+oFB4kueMAT52NMtDEPeYgRVLYGtrtmfTN+bb5vRwloFc0aP
	QhKaNhBYxyV2/6T62z+q6GoPAtZGsLx7IzHJNHqPQH5/XPIyW0sfAryGt3Aqi1ze1JIo
	YZLNVJTAC69qTBR3WyTn8z/VYnVVRUTYwfycDvigrFeEpZfmauHd3ilACEOpXxVMSLSU
	K7CVScw02Bxs/RxnTx8jskJ+Bn6nZoKvIgMUUS80rws9HSg3oV+Qrth2Lf+PgAhIg/N1
	oaLQ==
X-Gm-Message-State: AE9vXwOecCNxQl0138znggllEqAd9UScj296H1kPAi0AsDGZk4oJhIFVOR/t5M7NcVoaFw==
X-Received: by 10.28.50.199 with SMTP id y190mr10781426wmy.61.1472471717679;
	Mon, 29 Aug 2016 04:55:17 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o5sm9137789wmg.16.2016.08.29.04.55.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 04:55:16 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:55:10 +0100
Message-Id: <20160829115510.19560-4-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160829115510.19560-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160829115510.19560-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] boost: fix MIPS16e compilation
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
X-List-Received-Date: Mon, 29 Aug 2016 11:55:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

use g++ 4.1+ __sync intrinsics instead of incompatible
hand-written assembly

Signed-off-by: André Draszik <git@andred.net>
---
 ...ips-assembly-doesn-t-compile-in-mips16e-m.patch | 57 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch

diff --git a/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch b/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
new file mode 100644
index 0000000..9fe6389
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
@@ -0,0 +1,57 @@
+From 4f19d72ca94418431e068cfd4ffb96ed9b289f6c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Wed, 24 Aug 2016 17:34:59 +0100
+Subject: [PATCH 3/3] smart_ptr: mips assembly doesn't compile in mips16e mode
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
+Upstream-Status: Sumbitted https://svn.boost.org/trac/boost/ticket/12418
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
index 294703a..46ad3dd 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "\
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
     file://0002-config-gcc-BOOST_NO_FENV_H.patch \
+    file://0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch \
 "
-- 
2.9.3


