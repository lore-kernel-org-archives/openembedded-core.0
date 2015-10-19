Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9201577035
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 22:03:20 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so19265620wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uIOmL2qxlUwIDB4HC4OUYiIzEJLYucOunx6y3uqC2zQ=;
	b=I2K4GIBsmFw9OJYWRKOjeu1ckqFVhrGhy/X2Jads+BExdYOBhMT4OurKh0J8F/A3/s
	YzNFnUonV9rN0mNLk/ZfNO3WvH52I+MltBegJCUH1mMq+y7PE0sSoi9uPsNIix52Kdrk
	yRLdUHR0t6Crf6kGtiEcvCLvKWX9XfsE4zbbkfzsP7uCYJpGsrO6VR5enJm1gZA2Ohao
	nN0whn46YLCS9y4tgtN/V47PAMrM3C2K1FMm3n58WFghoDReOHwFU6vCQCGem3KP7/O1
	HnBQKtiAmttWC61BQuEhhAGmnRe4k0UVv0fmb+2NLiaOETCJsHEpEgpOufdhfTaxTTiv
	3wCQ==
X-Gm-Message-State: ALoCoQkAb9LPdAv1bFHnzdizQwM+BbKTrTbMm3sH6pGwi8ZFGVpnwGk2Gk86AlgpKfdUD9DngXay
X-Received: by 10.194.242.167 with SMTP id wr7mr35610312wjc.27.1445292200225; 
	Mon, 19 Oct 2015 15:03:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jd7sm42607072wjb.19.2015.10.19.15.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 15:03:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:55:41 +0100
Message-Id: <1445291743-6618-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 3/5] file: don't replace host file when built natively
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
X-List-Received-Date: Mon, 19 Oct 2015 22:03:20 -0000

To avoid races over the file binaries being replaced mid-build we made
file-native an assume-provided binary and check for it at startup, but target
file still needs a native file binary of the same version to compile the magic
data.

The least invasive way of doing this is to build a native file don't put it on
PATH, and tell the target build where to find the native binary.  We do however
want the native libmagic to be installed normally (as for example rpm and
subversion need it) so we can't use NATIVE_PACKAGE_PATH_SUFFIX as that change
libdir.

[ YOCTO #8144 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/file/file/host-file.patch | 32 +++++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.24.bb         |  9 ++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/host-file.patch

diff --git a/meta/recipes-devtools/file/file/host-file.patch b/meta/recipes-devtools/file/file/host-file.patch
new file mode 100644
index 0000000..a7efbdc
--- /dev/null
+++ b/meta/recipes-devtools/file/file/host-file.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted (http://bugs.gw.com/view.php?id=485)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3cde199d03b39632361c275cd30fa0612a03138b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 19 Oct 2015 10:30:57 +0100
+Subject: [PATCH 2/2] When using the host file, respect FILE_COMPILE
+
+If we're cross-compiling and not using the file binary that was just built,
+execute the binary that we've been told to use (via FILE_COMPILE) when checking
+the version instead of assuming that "file" is correct as the actual compile
+uses FILE_COMPILE so different binaries may be used.
+---
+ magic/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/magic/Makefile.am b/magic/Makefile.am
+index 89ac844..67067fe 100644
+--- a/magic/Makefile.am
++++ b/magic/Makefile.am
+@@ -293,7 +293,7 @@ ${MAGIC}: $(EXTRA_DIST) $(FILE_COMPILE_DEP)
+ 	@(if expr "${FILE_COMPILE}" : '.*/.*' > /dev/null; then \
+ 	    echo "Using ${FILE_COMPILE} to generate ${MAGIC}" > /dev/null; \
+ 	  else \
+-	    v=$$(file --version | sed -e s/file-// -e q); \
++	    v=$$(${FILE_COMPILE} --version | sed -e s/file-// -e q); \
+ 	    if [ "$$v" != "${PACKAGE_VERSION}" ]; then \
+ 		echo "Cannot use the installed version of file ($$v) to"; \
+ 		echo "cross-compile file ${PACKAGE_VERSION}"; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/file/file_5.24.bb b/meta/recipes-devtools/file/file_5.24.bb
index 08b95d7..e0a31e8 100644
--- a/meta/recipes-devtools/file/file_5.24.bb
+++ b/meta/recipes-devtools/file/file_5.24.bb
@@ -8,12 +8,13 @@ SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
 
-DEPENDS = "zlib file-native"
+DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         file://0001-Add-P-prompt-into-Usage-info.patch \
+        file://host-file.patch \
         "
 
 SRCREV = "3c0874be4d3232d672b20f513451a39cfd7c585a"
@@ -21,6 +22,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
+
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
 do_install_append_class-native() {
@@ -34,3 +37,7 @@ do_install_append_class-nativesdk() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+PROVIDES_append_class-native = " file-replacement-native"
+# Don't use NATIVE_PACKAGE_PATH_SUFFIX as that hides libmagic from anyone who
+# depends on file-replacement-native.
+bindir_append_class-native = "/file-native"
-- 
2.1.4


