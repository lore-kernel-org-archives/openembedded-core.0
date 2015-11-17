Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90F4060119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:02 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22309118wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d4yyd2n8X7BUKTL19N//rsaK+MicK+C47VxYlTTbTFI=;
	b=g0M9c7cy3YAXhyXmZxmhwM5KHmsu3WjJ+B9XqnDhTLc2P2vBTxkNVhA3vPgIuHqT4h
	HvBm8VVu1mY575uAr5FvfbGvke+sSrC5lIe8BM4PEKyQ8erOdAQKbkDJBM1rbf45u7xt
	HsTVnSvFWXEDSHYcGzrY9xLZAtpm11qZYAzynQ8oOSKyY7l/mUCkbf4MZ9QjabCConCw
	JM/G0V8taRHvnMSj7Y7FTJRp+iKkubH3UawYOnY8O6JvpGX0y2GcCGh3j8fQ9RMpo2YQ
	+DU/lei/7AbPgJkMkqbqq75h9Di0Ei2Lyg29teVlSj5Sx+mih3iupIIvqoi/Al9kuH7v
	5xVg==
X-Received: by 10.28.194.84 with SMTP id s81mr2099801wmf.51.1447761482763;
	Tue, 17 Nov 2015 03:58:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c194sm23585804wmd.13.2015.11.17.03.58.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:56 +0100
Message-Id: <4664e1ca0e1a3d04b70a203f4c8b8f3895f1f24b.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 04/16] libunwind: fix build for qemuarm
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 61 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
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
2.6.3


