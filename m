Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 65BC56D6F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:17:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78776941"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 13:17:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 995C54CE14FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:08:44 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 13:17:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2019 13:17:04 +0800
Message-ID: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 995C54CE14FF.A9592
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 20 Nov 2019 05:17:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following error occurred during the steps of do-configure:
| Fixing libtool for -rpath problems.
| ../alsa-lib-1.2.1.1/configure: line 16567: libtool: No such file or directory
| mv: cannot stat 'libtool-2': No such file or directory
| chmod: cannot access 'libtool': No such file or directory

add alsa-lib/0001-Fix-problem-with-libtool-not-found.patch to fix it.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...1-Fix-problem-with-libtool-not-found.patch | 31 +++++++++++++++++++
 ...{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.1.bb} |  8 +++--
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-libtool-not-found.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.1.bb} (83%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-libtool-not-found.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-libtool-not-found.patch
new file mode 100644
index 0000000000..5fb84cd6f8
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-libtool-not-found.patch
@@ -0,0 +1,31 @@
+From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 20 Nov 2019 11:24:17 +0800
+Subject: [PATCH] Fix problem with libtool not found
+
+Upstream-Status: Inappropriate
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 35eb315..548b9ea 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -769,9 +769,9 @@ dnl Taken from https://wiki.debian.org/RpathIssue
+ case $host in
+    *-*-linux-gnu)
+    AC_MSG_RESULT([Fixing libtool for -rpath problems.])
+-   sed < libtool > libtool-2 \
++   sed < "$srcdir"/libtool > "$srcdir"/libtool-2 \
+      's/^hardcode_libdir_flag_spec.*$'/'hardcode_libdir_flag_spec=" -D__LIBTOOL_IS_A_FOOL__ "/'
+-   mv libtool-2 libtool
+-   chmod 755 libtool
++   mv "$srcdir"/libtool-2 "$srcdir"/libtool
++   chmod 755 "$srcdir"/libtool
+  ;;
+ esac
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
similarity index 83%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
index 2c63ee7522..56544b0d45 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
@@ -7,9 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e6d429dbdcfaa0f034d907fa6dc3735e"
-SRC_URI[sha256sum] = "488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://0001-Fix-problem-with-libtool-not-found.patch \
+          "
+SRC_URI[md5sum] = "1d428f46d6160f5e4bbdd64a2ff34f45"
+SRC_URI[sha256sum] = "c95ac63c0aad43a6ac457d960569096b0b2ef72dc4e3737e77e3e2de87022cec"
 
 inherit autotools pkgconfig
 
-- 
2.20.1




