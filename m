Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C72978240
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:27:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7EARJmc025633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 11:27:20 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dhCad-0001PW-CL; Mon, 14 Aug 2017 11:27:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 11:27:16 +0100
Message-Id: <1502706437-5377-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 11:27:20 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] expat: Don't use getrandom() in the -native case
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
X-List-Received-Date: Mon, 14 Aug 2017 10:27:20 -0000

getrandom() is only available in glibc 2.25+ and uninative may relocate
binaries onto systems that don't have this function. For now, force
the code to the older codepath until we can come up with a better solution
for this kind of issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/expat.inc                |  3 +++
 meta/recipes-core/expat/expat/no_getrandom.patch | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/no_getrandom.patch

diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 067687e..0ee6c27 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -8,6 +8,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
            file://libtool-tag.patch \
 	  "
+
+SRC_URI_append_class-native = " file://no_getrandom.patch"
+
 inherit autotools lib_package
 
 # This package uses an archive format known to have issue with some
diff --git a/meta/recipes-core/expat/expat/no_getrandom.patch b/meta/recipes-core/expat/expat/no_getrandom.patch
new file mode 100644
index 0000000..d64f1bf
--- /dev/null
+++ b/meta/recipes-core/expat/expat/no_getrandom.patch
@@ -0,0 +1,23 @@
+The native version of expat may be used on older systems which dont have glibc 2.25
+and hence don't have getrandom() thanks to uninative. Disable the libc call and
+use the syscall instead to avoid a compatibility issue until we have 2.25 everywhere
+we support with uninative.
+
+RP
+2017/8/14
+
+Upstream-Status: Inappropriate
+
+Index: expat-2.2.3/configure.ac
+===================================================================
+--- expat-2.2.3.orig/configure.ac
++++ expat-2.2.3/configure.ac
+@@ -151,7 +151,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([
+   #include <stdlib.h>  /* for NULL */
+   #include <sys/random.h>
+   int main() {
+-    return getrandom(NULL, 0U, 0U);
++    return getrandomBREAKME(NULL, 0U, 0U);
+   }
+ ])], [
+     AC_DEFINE([HAVE_GETRANDOM], [1],
-- 
2.7.4


