Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R6ljo-0001DX-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 18:03:00 +0200
Received: by pzd13 with SMTP id 13so5269338pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0B7EhFGjDL3K4rglHtiOA64OnfywTqMG4RUpW9xju4A=;
	b=b1yNwSkhWUPHr8lBJ1sTQTXfTTjEw9aB5Qd9mPTAe2+zmOAv1v3DsIkw07wrDGVTHj
	8/7R/xY0L3TpOtMD4zTnT+gpHT+NOK25zl/qofWmeSLZ2ZsEqJhukTsTuos3YFS1IeRS
	LUUvsk3NVFI6tdQ4/DgFuwVtAaTJ5C7Ptlohg=
Received: by 10.68.10.199 with SMTP id k7mr4963108pbb.72.1316707055517;
	Thu, 22 Sep 2011 08:57:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ml4sm29135838pbc.0.2011.09.22.08.57.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 08:57:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 08:57:26 -0700
Message-Id: <1316707046-24981-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] eglibc-2.12: Fix build on powerpc/603e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 16:03:00 -0000

We pass --with-cpu to eglibc now. Which breaks
the configure for cpus that it does not support
We add support for ppc603e which gets 2.12
building for qemuppc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |   26 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
new file mode 100644
index 0000000..5c90e5b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
@@ -0,0 +1,26 @@
+We now pass --with-cpu option to eglibc this ends up with configure errors if we do
+not pass a cpu which eglibc has support for in sysdeps
+
+| checking sysdep dirs... configure: error: The 603e subspecies of powerpc is not supported.
+| + bbfatal 'oe_runconf failed'
+| + echo 'ERROR: oe_runconf failed'
+
+We fix this by adding the 603e sub directories with Implies to generic
+powerpc to overcome this error
+
+Upstream-Status: Inappropriate [OE config related]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libc/ports/sysdeps/powerpc/powerpc32/603e/Implies
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/ports/sysdeps/powerpc/powerpc32/603e/Implies	2011-09-17 19:18:57.593292084 -0700
+@@ -0,0 +1 @@
++powerpc/powerpc32
+Index: libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/Implies
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/Implies	2011-09-17 19:17:48.613292100 -0700
+@@ -0,0 +1 @@
++powerpc/powerpc32
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 7a1a569..c443833 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r25"
+PR = "r26"
 
 SRCREV = "14158"
 
@@ -12,6 +12,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
            file://armv4-eabi-compile-fix.patch \
+           file://ppc-enable-603e-cpu.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
 	  "
-- 
1.7.5.4



