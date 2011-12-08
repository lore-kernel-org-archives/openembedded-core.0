Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhF-0007dd-Ak
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987704"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:05 -0800
Message-Id: <438de7d90ce485067b62dbaf8c284c8da1f9aa7a.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/17] dpkg: Fix preinst execution
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a patch to fix exeuction of pre/post install scripts. See the patch
header for more details.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dpkg/dpkg/preinst.patch |   46 +++++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb   |    5 ++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/preinst.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/preinst.patch b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
new file mode 100644
index 0000000..06d2aac
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
@@ -0,0 +1,46 @@
+Our pre/postinsts expect $D to be set when running in a sysroot and
+don't expect a chroot. This matches up our system expectations with
+what dpkg does.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+RP 2011/12/07
+
+Index: dpkg-1.15.8.7/src/help.c
+===================================================================
+--- dpkg-1.15.8.7.orig/src/help.c	2010-12-20 01:25:36.000000000 +0000
++++ dpkg-1.15.8.7/src/help.c	2011-12-07 14:51:02.783461487 +0000
+@@ -181,30 +181,9 @@
+    * FIXME: none of the stuff here will work if admindir isn't inside
+    * instdir as expected.
+    */
+-  size_t instdirl;
+-
+-  if (*instdir) {
+-    if (chroot(instdir)) ohshite(_("failed to chroot to `%.250s'"),instdir);
+-    if (chdir("/"))
+-      ohshite(_("failed to chdir to `%.255s'"), "/");
+-  }
+-  if (f_debug & dbg_scripts) {
+-    struct varbuf args = VARBUF_INIT;
+-    const char **argv = cmd->argv;
+-
+-    while (*++argv) {
+-      varbufaddc(&args, ' ');
+-      varbufaddstr(&args, *argv);
+-    }
+-    varbufaddc(&args, '\0');
+-    debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename, args.buf);
+-    varbuf_destroy(&args);
+-  }
+-  instdirl= strlen(instdir);
+-  if (!instdirl)
+-    return cmd->filename;
+-  assert(strlen(cmd->filename) >= instdirl);
+-  return cmd->filename + instdirl;
++  if (*instdir)
++    setenv("D", instdir, 1);
++  return cmd->filename;
+ }  
+ 
+ void
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index f1a0eeb..f1030fa 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -4,10 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
             file://check_version.patch \
-            file://perllibdir.patch"
+            file://perllibdir.patch \
+            file://preinst.patch"
 
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 
-- 
1.7.6.4



