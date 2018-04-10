Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 92A5374B3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:14:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="32526544"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Apr 2018 05:14:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:07:45 +0300
Message-Id: <20180410120747.41814-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Subject: [RFC][PATCH 3/5] openssl: update to 1.1.1
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
X-List-Received-Date: Tue, 10 Apr 2018 12:14:08 -0000

At the moment 1.1.1 is in pre-release stage, however the final release
should be available within a few weeks. The major selling point is that
it supports the new TLS 1.3 specification. At the moment it is not clear
whether this also will be a long term support version of openssl;
we can make the decision to merge this version once that is made clear
by upstream. More information:

https://www.openssl.org/policies/releasestrat.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 ----------------------
 .../{openssl_1.1.0h.bb => openssl_1.1.1-pre4.bb}   | 21 +++++------
 2 files changed, 10 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0h.bb => openssl_1.1.1-pre4.bb} (83%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
deleted file mode 100644
index 6ce4e47d712..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 28 Mar 2017 16:40:12 +0300
-Subject: [PATCH] Take linking flags from LDFLAGS env var
-
-This fixes "No GNU_HASH in the elf binary" issues.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Configurations/unix-Makefile.tmpl | 2 +-
- Configure                         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index c029817..43b769b 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -173,7 +173,7 @@ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
- CC= $(CROSS_COMPILE){- $target{cc} -}
- CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
- CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
--LDFLAGS= {- $target{lflags} -}
-+LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
- PLIB_LDFLAGS= {- $target{plib_lflags} -}
- EX_LIBS= {- $target{ex_libs} -} {- $config{ex_libs} -}
- LIB_CFLAGS={- $target{shared_cflag} || "" -}
-diff --git a/Configure b/Configure
-index aee7cc3..274d236 100755
---- a/Configure
-+++ b/Configure
-@@ -979,7 +979,7 @@ $config{build_file} = $target{build_file};
- $config{defines} = [];
- $config{cflags} = "";
- $config{ex_libs} = "";
--$config{shared_ldflag} = "";
-+$config{shared_ldflag} = $ENV{'LDFLAGS'};
- 
- # Make sure build_scheme is consistent.
- $target{build_scheme} = [ $target{build_scheme} ]
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
similarity index 83%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
index 94b75eb92a8..859362f7afe 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
-SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
+SRC_URI[md5sum] = "07c3f6831fb6dfe975795ef7bbbee9fc"
+SRC_URI[sha256sum] = "df2d5fcc2a878525611c75b9e9116fbcfbce8d9b96419a16eda5fb11ecc428f6"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
-           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
            "
 
 S = "${WORKDIR}/openssl-${PV}"
@@ -114,20 +113,20 @@ do_configure () {
         if [ "x$useprefix" = "x" ]; then
                 useprefix=/
         fi
-	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
+        # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
+        # environment variables set by bitbake. Adjust the environment variables instead.
+	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 }
 
-#| engines/afalg/e_afalg.c: In function 'eventfd':
-#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
-#|      return syscall(__NR_eventfd, n);
-#|                     ^~~~~~~~~~~~
-EXTRA_OECONF_aarch64 += "no-afalgeng"
+# This prevents openssl from using getrandom() which is not available on older glibc versions
+# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
+EXTRA_OECONF_class-native += "--with-rand-seed=devrandom"
+EXTRA_OECONF_class-nativesdk += "--with-rand-seed=devrandom"
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
+CPPFLAGS_libc-musl += "-DOPENSSL_NO_ASYNC"
 
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-- 
2.16.1


