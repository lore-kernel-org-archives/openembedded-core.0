Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 94E0E77008
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:36 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so60407599qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eRTBP9hBHG7eMZSODEeMowDIV6NgxqOADU8FdIonNWI=;
	b=lpxU33rSTlpnBj7+dA3A/GtturiF1F/MHE5okz7YjWeZgr5eymypXXYWTXNkOnM05p
	TBF3biVsfRcSZLMNKSdOyW4a/h6zEu5n7qoHingPgGm6OKIcW8BBNtQu2THj94tLNVa5
	dyq3Qwn/VdugfmJFEW/1zPsmv8s89GkSe++YoEZ8PIsfPhNXR7aowFF8Tt5umn3pEcty
	QuE1bAkYZxmMxdccKr04Zf0mZBvLwDVG+x+8k3KDi7nE6uvxJQfxITB0Ye71uKzr8tf/
	ATaiJY/yQ7OYUkq8lsq7KFtdCanAqL9noZ+XbbX9nR74wVJzaGg6dcQe67rteqYnbH8P
	KpdQ==
X-Received: by 10.55.221.199 with SMTP id u68mr23052300qku.83.1442248296864;
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:26 +0000
Message-Id: <0a11e2878fd22572867a93a8e31e26524cab11c1.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 11/12] waffle: upgrade waffle_1.5.1.bb -> waffle_1.5.2.bb
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:36 -0000

Backport needed patches for compilation fixes on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 ++++++++++++++++++++++
 .../waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb}    |  8 ++--
 2 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
 rename meta/recipes-graphics/waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb} (84%)

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
diff --git a/meta/recipes-graphics/waffle/waffle_1.5.1.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
similarity index 84%
rename from meta/recipes-graphics/waffle/waffle_1.5.1.bb
rename to meta/recipes-graphics/waffle/waffle_1.5.2.bb
index b8aa05a..6923f1c 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -3,9 +3,11 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
-SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
+SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch \
+          "
+SRC_URI[md5sum] = "c669c91bf2f7e13a5d781c3dbb30fd8c"
+SRC_URI[sha256sum] = "d2c096cf654bf0061323a4b9231a1ef5b749a1e5c7c5bfe067e964219c2a851c"
 
 inherit cmake distro_features_check lib_package
 
-- 
2.5.2


