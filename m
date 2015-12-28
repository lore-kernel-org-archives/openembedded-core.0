Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED77F60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7Epr3013831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:51 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:12 -0800
Message-ID: <481eab06645c633eba98de9f8e8632ce7a11c41b.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/40] libunwind: fix build for qemuarm
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:52 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   61 ++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
new file mode 100644
index 0000000..d552502
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
@@ -0,0 +1,61 @@
+From 24484e80b3e329c9edee1995e102f8612eedb79c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 13 May 2014 23:32:27 +0200
+Subject: [PATCH] Add AO_REQUIRE_CAS to fix build on ARM < v6
+
+ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide
+optimize atomic operations in libatomic_ops. Since libunwind is using
+such operations, it should define AO_REQUIRE_CAS before including
+<atomic_ops.h> so that libatomic_ops knows it should use emulated
+atomic operations instead (even though they are obviously a lot more
+expensive).
+
+Also, while real atomic operations are all inline functions and
+therefore linking against libatomic_ops was not required, the emulated
+atomic operations actually require linking against libatomic_ops, so
+the commented AC_CHECK_LIB test in acinclude.m4 is uncommented to make
+sure we link against libatomic_ops.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Upstream-Status: Pending
+Taken from:
+https://raw.githubusercontent.com/rdnetto/teapot-buildroot/master/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
+
+---
+ acinclude.m4          | 8 +-------
+ include/libunwind_i.h | 1 +
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 497f7c2..9c15af1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -22,11 +22,5 @@ fi])
+ AC_DEFUN([CHECK_ATOMIC_OPS],
+ [dnl Check whether the system has the atomic_ops package installed.
+   AC_CHECK_HEADERS(atomic_ops.h)
+-#
+-# Don't link against libatomic_ops for now.  We don't want libunwind
+-# to depend on libatomic_ops.so.  Fortunately, none of the platforms
+-# we care about so far need libatomic_ops.a (everything is done via
+-# inline macros).
+-#
+-#  AC_CHECK_LIB(atomic_ops, main)
++  AC_CHECK_LIB(atomic_ops, main)
+ ])
+diff --git a/include/libunwind_i.h b/include/libunwind_i.h
+index 23f615e..deabdfd 100644
+--- a/include/libunwind_i.h
++++ b/include/libunwind_i.h
+@@ -95,6 +95,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 	(pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
+ 
+ #ifdef HAVE_ATOMIC_OPS_H
++# define AO_REQUIRE_CAS
+ # include <atomic_ops.h>
+ static inline int
+ cmpxchg_ptr (void *addr, void *old, void *new)
+-- 
+1.9.2
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 29bdf94..aa62bcc 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -6,6 +6,7 @@ SRC_URI += "\
     file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
     file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
     file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
+    file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
1.7.9.5


