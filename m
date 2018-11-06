Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id CD6AD745AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 10:04:19 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id BFA091C1A74;
	Tue,  6 Nov 2018 11:04:20 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Nov 2018 11:04:16 +0100
Message-Id: <20181106100416.41548-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCHv2] glibc: make ld-2.28.so reproducible on arm
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
X-List-Received-Date: Tue, 06 Nov 2018 10:04:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Play the whack-a-mole game and add the .file directive to another
assembly file that otherwise shows itself in ld-2.28.so debug file,
which in turns alters the build-id of ld-2.28.so on target.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Changes since v1:

 - Added signed-of-by tag

 .../0034-inject-file-assembly-directives.patch      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
index 3f9f8cf189..55eba2d43e 100644
--- a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
@@ -257,3 +257,16 @@ index 244d87fb6d..14d3e2ce14 100644
  /* Initial entry point code for the dynamic linker.
     The C function `_dl_start' is the real entry point;
     its return value is the user program's entry point.	*/
+diff --git a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
+index d26ad1f8d3..a0de10bf81 100644
+--- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
++++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
+@@ -27,6 +27,8 @@
+    ARM unwind tables for register to register moves, the actual opcodes
+    are not defined.  */
+ 
++      .file "libc-do-syscall.S"
++
+ #if defined(__thumb__)
+ 	.thumb
+ 	.syntax unified
-- 
2.19.1


