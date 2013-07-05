Return-Path: <"victor@v.mayoralv"@gmail.com>
Received: from victor-desktop (121.197.217.87.dynamic.jazztel.es
	[87.217.197.121])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1426AC48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 12:38:03 +0000 (UTC)
Received: by victor-desktop (Postfix, from userid 1000)
	id 1B1A28C073B; Fri,  5 Jul 2013 14:38:03 +0200 (CEST)
From: vmayoral <v.mayoralv@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 14:38:01 +0200
Message-Id: <1373027881-3518-1-git-send-email-v.mayoralv@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: victor <v.mayoralv@gmail.com>
Subject: [PATCH] apr: add apr_cv_mutex_recursive=yes to support meta-ros
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
X-List-Received-Date: Fri, 05 Jul 2013 12:38:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: victor <v.mayoralv@gmail.com>

By default apr_cv_mutex_recursive in apr is set to "no" and this leads
to the APRENOTIMPL return value of apr_thread_mutex_create in thread_mutex.c when
APR_THREAD_MUTEX_NESTED is requested via flags which leads to a deadlock in applications
using apr, as observed in an application with log4cxx.

This commit adds CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes" to apr_1.4.6.bb
and removes this variable in powerpc32-linux to address this issue.

We detected this issue while working at the meta-ros project https://github.com/bmwcarit/meta-ros
(https://github.com/bmwcarit/meta-ros/issues/68)

Signed-off-by: Víctor Mayoral Vilches <v.mayoralv@gmail.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    3 +++
 meta/site/powerpc32-linux             |    1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 896f79f..ba59639 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -23,6 +23,9 @@ inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
+# Added to fix some issues with cmake. Refer to https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
+CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
+
 do_configure_prepend() {
 	cd ${S}
 	./buildconf
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 4550df3..b3973c9 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -203,7 +203,6 @@ apr_cv_use_lfs64=${apr_cv_use_lfs64=yes}
 apr_cv_epoll=${apr_cv_epoll=yes}
 apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
 apr_cv_pthreads_lib=${apr_cv_pthreads_lib=-lpthread}
-apr_cv_mutex_recursive=${apr_cv_mutex_recursive=yes}
 ac_cv_func_mmap=${ac_cv_func_mmap=yes}
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
 ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
-- 
1.7.9.5


