Return-Path: <"victor@v.mayoralv"@gmail.com>
Received: from victor-desktop (121.197.217.87.dynamic.jazztel.es
	[87.217.197.121])
	by mail.openembedded.org (Postfix) with ESMTP id 832B261485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 13:04:28 +0000 (UTC)
Received: by victor-desktop (Postfix, from userid 1000)
	id 643FD8C10B0; Wed,  3 Jul 2013 15:04:27 +0200 (CEST)
From: vmayoral <v.mayoralv@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:04:25 +0200
Message-Id: <1372856665-29178-1-git-send-email-v.mayoralv@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: victor <v.mayoralv@gmail.com>
Subject: [PATCH] apr_cv_mutex_recursive=yes added to apr_1.4.6.bb to make rosnodes work
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
X-List-Received-Date: Wed, 03 Jul 2013 13:04:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: victor <v.mayoralv@gmail.com>

Working with the meta-ros project we detected that the ROS nodes didn't launch properly
the reason was that by default apr_cv_mutex_recursive in apr is set to no and this leads
to the APRENOTIMPL return value of apr_thread_mutex_create in thread_mutex.c when
APR_THREAD_MUTEX_NESTED is requested via flags.

Added CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes" to sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb
to fix this issue. It has also been removed the mention of this variable in
meta/site/powerpc32-linux.

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


