Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SrQiQ-0006PS-A7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:38:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6I9RL9e008813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jul 2012 02:27:21 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 18 Jul 2012 02:27:20 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Wed, 18 Jul 2012 17:25:49 +0800
Message-ID: <1342603549-3695-3-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
References: <5005B1CC.1020907@linux.intel.com>
	<1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] grub: fix error stating the root device
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
X-List-Received-Date: Wed, 18 Jul 2012 09:38:42 -0000
Content-Type: text/plain

grub-mkconfig (and possibly other commands) complains:
    error: cannot stat /dev/root

Backport an upstream patch to fix the error.

[YOCTO #2777]

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
 2 files changed, 66 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch

diff --git a/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch b/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
new file mode 100644
index 0000000..cde8b87
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Backport
+
+Patch is a slightly edited version from debian. Upstream link is:
+http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3318
+
+Description: Don't stat devices unless we have to
+Author: Vladimir Serbinenko <phcoder@gmail.com>
+Author: Colin Watson <cjwatson@ubuntu.com>
+Bug-Debian: http://bugs.debian.org/627587
+Forwarded: yes
+Applied-Upstream: http://bazaar.launchpad.net/~vcs-imports/grub/grub2-bzr/revision/3318
+Last-Update: 2011-05-31
+
+Index: b/grub-core/kern/emu/getroot.c
+===================================================================
+--- a/grub-core/kern/emu/getroot.c
++++ b/grub-core/kern/emu/getroot.c
+@@ -358,7 +358,7 @@
+ 
+       if (S_ISLNK (st.st_mode)) {
+ #ifdef __linux__
+-	if (strcmp (dir, "mapper") == 0) {
++	if (strcmp (dir, "mapper") == 0 || strcmp (dir, "/dev/mapper") == 0) {
+ 	  /* Follow symbolic links under /dev/mapper/; the canonical name
+ 	     may be something like /dev/dm-0, but the names under
+ 	     /dev/mapper/ are more human-readable and so we prefer them if
+@@ -609,20 +609,27 @@
+ 
+   if (os_dev)
+     {
+-      if (stat (os_dev, &st) >= 0)
+-	dev = st.st_rdev;
+-      else
+-	grub_util_error ("cannot stat `%s'", os_dev);
+-      free (os_dev);
++      char *tmp = os_dev;
++      os_dev = canonicalize_file_name (os_dev);
++      free (tmp);
+     }
+-  else
++
++  if (os_dev)
+     {
+-      if (stat (dir, &st) >= 0)
+-	dev = st.st_dev;
+-      else
+-	grub_util_error ("cannot stat `%s'", dir);
++      if (strncmp (os_dev, "/dev/dm-", sizeof ("/dev/dm-") - 1) != 0)
++	return os_dev;
++      if (stat (os_dev, &st) < 0)
++	grub_util_error ("cannot stat `%s'", os_dev);
++      free (os_dev);
++      dev = st.st_rdev;
++      return grub_find_device ("/dev/mapper", dev);
+     }
+ 
++  if (stat (dir, &st) < 0)
++    grub_util_error ("cannot stat `%s'", dir);
++
++  dev = st.st_dev;
++  
+ #ifdef __CYGWIN__
+   /* Cygwin specific function.  */
+   os_dev = grub_find_device (dir, dev);
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 1009ce8..f1ed7ca 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
           file://grub-1.99-fix-enable_execute_stack-check.patch \
           file://remove-gets.patch \
+          file://grub-1.99-lazy_stat.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-- 
1.7.7



