Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9830A77005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:00:03 +0000 (UTC)
Received: by qgx61 with SMTP id 61so61735609qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yZ8h1a/usqaX96Kd3Y+63iByXI4AGociCTGO89esctE=;
	b=G51ZRIUDFDVH+w3O7Jh4kutF6dL39yRzSXxeJngrkcROH0tNzfUeU4rdMftWv7egVL
	bXVhPOq2dciTiRH6D0fEwJENFKtRptUCJ9MfJxM4Kku75zCnyvKr3Pf49k/48GAGHzS3
	ogyKsIK6ueNil7on6Le6HoA0z16ulA+B/QEHEgmkHItwQ90jhBxaDCdYJzorEJzDACs3
	R/mqh3kcNFyXMlOqTm8kD8CHSUPYHTgtbKcgW0VnMdKEC/o0N248rZaLy7snbG7NRy97
	pu9ptN1/BiXokgEFGSi9RFTot62AiB/NJWkYNGy22xZOrkc/+FzRuUZsTP5ww0mJ6o3p
	h34g==
X-Received: by 10.140.41.240 with SMTP id z103mr3802161qgz.7.1443157202844;
	Thu, 24 Sep 2015 22:00:02 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c188sm768477qka.37.2015.09.24.22.00.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 22:00:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 04:59:17 +0000
Message-Id: <1443157157-33969-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/4] waffle: Fix build with musl
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
X-List-Received-Date: Fri, 25 Sep 2015 05:00:03 -0000

Backport needed patches for compilation fixes on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 ++++++++++++++++++++++
 meta/recipes-graphics/waffle/waffle_1.5.1.bb       |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch

diff --git a/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch b/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
new file mode 100644
index 0000000..a0c826e
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
@@ -0,0 +1,54 @@
+From 3b9b8f5f6d1b99af43e95ec0868404e552a85b73 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.l.velikov@gmail.com>
+Date: Thu, 19 Mar 2015 22:26:11 +0000
+Subject: [PATCH] third_party/threads: Use PTHREAD_MUTEX_RECURSIVE by default
+
+PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
+Although due to the_GNU_SOURCES define the portable,
+PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
+1998. Simplify things giving us compatibility with musl which
+apparently does not provide the non-portable define.
+
+Inspired by almost identical commit in mesa aead7fe2e2b(c11/threads: Use
+PTHREAD_MUTEX_RECURSIVE by default) by Felix Janda.
+
+Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
+Reviewed-by: Chad Versace <chad.versace@intel.com>
+---
+Upstream-Status: Backport
+
+ third_party/threads/threads_posix.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
+index 5835e43..e122bf9 100644
+--- a/third_party/threads/threads_posix.c
++++ b/third_party/threads/threads_posix.c
+@@ -26,6 +26,9 @@
+  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+  * DEALINGS IN THE SOFTWARE.
+  */
++
++#define _GNU_SOURCE
++
+ #include <stdlib.h>
+ #ifndef assert
+ #include <assert.h>
+@@ -150,13 +153,8 @@ int mtx_init(mtx_t *mtx, int type)
+       && type != (mtx_try|mtx_recursive))
+         return thrd_error;
+     pthread_mutexattr_init(&attr);
+-    if ((type & mtx_recursive) != 0) {
+-#if defined(__linux__) || defined(__linux)
+-        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
+-#else
++    if ((type & mtx_recursive) != 0)
+         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
+-#endif
+-    }
+     pthread_mutex_init(mtx, &attr);
+     pthread_mutexattr_destroy(&attr);
+     return thrd_success;
+-- 
+2.5.2
+
diff --git a/meta/recipes-graphics/waffle/waffle_1.5.1.bb b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
index b8aa05a..af84020 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
@@ -3,7 +3,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch \
+          "
 SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
 SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
 
-- 
2.5.3


