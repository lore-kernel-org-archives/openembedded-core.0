Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TohvV-0007PV-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:16 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id E6E572FEF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:12 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:40 -0800
Message-Id: <f5b8ba5e51ac41cf375119a88083617f667a85d5.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: E6E572FEF2.38277
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 07/15] psplash: new patch to fix segfault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2012 21:57:17 -0000

This fixes a segmentation fault when passing -a without
an argument.

Fixes [YOCTO #2903]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../files/psplash_fix_bad_arg_segfault.patch       |   22 ++++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb           |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/psplash/files/psplash_fix_bad_arg_segfault.patch

diff --git a/meta/recipes-core/psplash/files/psplash_fix_bad_arg_segfault.patch b/meta/recipes-core/psplash/files/psplash_fix_bad_arg_segfault.patch
new file mode 100644
index 0000000..f69c8a2
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash_fix_bad_arg_segfault.patch
@@ -0,0 +1,22 @@
+Fix segmentation fault when passing -a without angle value.
+
+When psplash -a is called instead of psplash -a<angle value>, it will
+cause a segmentation fault by calling an out of bound argv[]. 
+
+Upstream-Status: Accepted
+Needed for denzil since we're not upgrading the recipe.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+diff -urN git.orig/psplash.c git/psplash.c
+--- git.orig/psplash.c	2012-12-22 21:28:05.830631789 -0800
++++ git/psplash.c	2012-12-22 21:29:54.962633330 -0800
+@@ -219,7 +219,7 @@
+ 
+       if (!strcmp(argv[i],"-a") || !strcmp(argv[i],"--angle"))
+         {
+-	  if (++i > argc) goto fail;
++	  if (++i >= argc) goto fail;
+ 	  angle = atoi(argv[i]);
+ 	  continue;
+ 	}
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index f93afea..56a953b 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 
 SRCREV = "e05374aae945bcfc6d962ed0d7b2774b77987e1d"
 PV = "0.1+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
+           file://psplash_fix_bad_arg_segfault.patch \
            ${SPLASH_IMAGES}"
 
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
-- 
1.7.9.5



