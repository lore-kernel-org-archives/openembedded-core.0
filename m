Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8F62660107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 14:47:48 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Nov 2015 15:47:47 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 942C628FA82;
	Thu, 19 Nov 2015 15:47:47 +0100 (CET)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Nov 2015 15:47:14 +0100
Message-ID: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
Subject: [fido][PATCH] [AArch64] Fix the big endian loader name
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
X-List-Received-Date: Thu, 19 Nov 2015 14:47:51 -0000
Content-Type: text/plain

Backported from glibc 2.22 (master)

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 .../AArch64-Fix-the-big-endian-loader-name.patch   | 49 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch

diff --git a/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
new file mode 100644
index 0000000..fd2bd8e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
@@ -0,0 +1,49 @@
+[AArch64] Fix the big endian loader name
+
+Signed-off-by: Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+The patch was imported from the glibc's official git server
+(https://sourceware.org/git/?p=glibc.git) as of commit id
+44cb254f9a024db33ba549e59dc9d90355b797c9.
+
+Fixed conflicts raised on glibc 2.21.
+
+Upstream-Status: Backport [glibc 2.22]
+
+Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
+---
+ ChangeLog   | 5 +++++
+ config.h.in | 3 +++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index dc1ed1b..503ad41 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -56278,4 +56278,9 @@
+ 	added check.  Only act on the data if no current modification
+ 	happened.
+ 
++2015-05-01  Szabolcs Nagy  <szabolcs.nagy@arm.com>
++
++    * config.h.in (HAVE_AARCH64_BE): Add.
++
++
+ See ChangeLog.17 for earlier changes.
+diff --git a/config.h.in b/config.h.in
+index 695ca35..85c1761 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -114,6 +114,9 @@
+    include/libc-symbols.h that avoid PLT slots in the shared objects.  */
+ #undef	NO_HIDDEN
+ 
++/* AArch64 big endian ABI */
++#undef HAVE_AARCH64_BE
++
+ 
+ /* Defined to some form of __attribute__ ((...)) if the compiler supports
+    a different, more efficient calling convention.  */
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index a0b2f2d..3bba734 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
            ${EGLIBCPATCHES} \
            ${CVEPATCHES} \
+           file://AArch64-Fix-the-big-endian-loader-name.patch \
           "
 EGLIBCPATCHES = "\
            file://timezone-re-written-tzselect-as-posix-sh.patch \
-- 
1.9.1


