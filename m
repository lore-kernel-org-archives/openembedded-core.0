Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB117763F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:54:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T7sDHQ002819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 00:54:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 00:54:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2015 15:54:12 +0800
Message-ID: <eea7f5b8bfa634cc1fb6f3232f6404a4bda2611f.1446105200.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446105200.git.Qi.Chen@windriver.com>
References: <cover.1446105200.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: fix reporting 'unknown' by `uname -p' and `uname -i'
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
X-List-Received-Date: Thu, 29 Oct 2015 07:54:15 -0000
Content-Type: text/plain

This patch make `uname -p' and `uname -i' not reporting 'unknown'.
It refers a to Fedora's way to do this.

The coreutils upstream rejects to accept this patch, blaming the
'unknown' result to the kernel not providing enough information.
As on normal distros, `uname -p' and `uname -i' do not report 'unknown',
we refer to Fedora's patch to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e-report-processor-and-hardware-correctly.patch | 64 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.24.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.24/0001-uname-report-processor-and-hardware-correctly.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.24/0001-uname-report-processor-and-hardware-correctly.patch b/meta/recipes-core/coreutils/coreutils-8.24/0001-uname-report-processor-and-hardware-correctly.patch
new file mode 100644
index 0000000..c5f449f
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.24/0001-uname-report-processor-and-hardware-correctly.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Rejected
+
+Subject: uname: report processor and hardware correctly
+
+This patch is rejected by coreutils upstream, but distros like debian and fedora
+uses this patch to make `uname -i' and `uname -p' to not report 'unknown'.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/uname.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/src/uname.c b/src/uname.c
+index 39bd28c..c84582d 100644
+--- a/src/uname.c
++++ b/src/uname.c
+@@ -299,13 +299,19 @@ main (int argc, char **argv)
+ 
+   if (toprint & PRINT_PROCESSOR)
+     {
+-      char const *element = unknown;
++      char *element = unknown;
+ #if HAVE_SYSINFO && defined SI_ARCHITECTURE
+       {
+         static char processor[257];
+         if (0 <= sysinfo (SI_ARCHITECTURE, processor, sizeof processor))
+           element = processor;
+       }
++#else
++      {
++	static struct utsname u;
++	uname(&u);
++	element = u.machine;
++      }
+ #endif
+ #ifdef UNAME_PROCESSOR
+       if (element == unknown)
+@@ -343,7 +349,7 @@ main (int argc, char **argv)
+ 
+   if (toprint & PRINT_HARDWARE_PLATFORM)
+     {
+-      char const *element = unknown;
++      char *element = unknown;
+ #if HAVE_SYSINFO && defined SI_PLATFORM
+       {
+         static char hardware_platform[257];
+@@ -361,6 +367,14 @@ main (int argc, char **argv)
+           if (sysctl (mib, 2, hardware_platform, &s, 0, 0) >= 0)
+             element = hardware_platform;
+         }
++#else
++      {
++	static struct utsname u;
++	uname(&u);
++	element = u.machine;
++	if(strlen(element)==4 && element[0]=='i' && element[2]=='8' && element[3]=='6')
++	  element[1]='3';
++      }
+ #endif
+       if (! (toprint == UINT_MAX && element == unknown))
+         print_element (element);
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb
index f042346..ae9c375 100644
--- a/meta/recipes-core/coreutils/coreutils_8.24.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-uname-report-processor-and-hardware-correctly.patch \
           "
 
 SRC_URI[tarball.md5sum] = "40efdbce865d2458d8da0a9dcee7c16c"
-- 
1.9.1


