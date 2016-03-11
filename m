Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC6D6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:40:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2B7eRk9005050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Mar 2016 23:40:27 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 10 Mar 2016 23:40:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 11 Mar 2016 02:40:22 -0500
Message-ID: <26a6e7fd40f8c0be2464f802c41eecb06bc818c0.1457681854.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457681854.git.hongxu.jia@windriver.com>
References: <cover.1457681854.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python3: fix do_configure check platform triplet error
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
X-List-Received-Date: Fri, 11 Mar 2016 07:40:30 -0000
Content-Type: text/plain

For p1022ds bsp, the MULTIARCH is powerpc-linux-gnuspev1 and
python3 did not recognize the extra 'v1' which caused python3
configure error for the platform triplet.

Q:Why Python3 check platform triplet?

A:Under Linux, GNU/KFreeBSD and the Hurd, C extensions now include
the architecture triplet in the extension name, to make it easy to
test builds for different ABIs in the same working tree.

vim config.log
...
EXT_SUFFIX='.cpython-35m-powerpc-linux-gnuspe.so'
...

Here is the generated C extensions which take platform triplet into account.
...
|image/usr/lib/python3.5/lib-dynload/_datetime.cpython-35m-powerpc-linux-gnuspe.so
...

https://bugs.python.org/issue22980
https://www.python.org/dev/peps/pep-3149/
https://bugs.python.org/review/22980/patch/14593/54808

[YOCTO #9226]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch

diff --git a/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch b/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch
new file mode 100644
index 0000000..8d03727
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch
@@ -0,0 +1,52 @@
+From 5d6509313198ec9b686cad50b002212e4344004b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 11 Mar 2016 01:15:45 -0500
+Subject: [PATCH] configure.ac: tweak MULTIARCH for powerpc-linux-gnuspe
+
+For p1022ds bsp, the MULTIARCH is powerpc-linux-gnuspev1 and
+python3 did not recognize the extra 'v1' which caused python3
+configure error for the platform triplet.
+
+Q:Why Python3 check platform triplet?
+
+A:Under Linux, GNU/KFreeBSD and the Hurd, C extensions now include
+the architecture triplet in the extension name, to make it easy to
+test builds for different ABIs in the same working tree.
+
+Here is the generated  C extensions which take platform triplet into account.
+...
+|image/usr/lib/python3.5/lib-dynload/_datetime.cpython-35m-powerpc-linux-gnuspe.so
+...
+
+https://bugs.python.org/issue22980
+https://www.python.org/dev/peps/pep-3149/
+https://bugs.python.org/review/22980/patch/14593/54808
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9eb3d22..c34a9a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -724,6 +724,13 @@ fi
+ 
+ 
+ MULTIARCH=$($CC --print-multiarch 2>/dev/null)
++
++# Tweak MULTIARCH
++if test x$MULTIARCH = xpowerpc-linux-gnuspev1
++then
++	MULTIARCH="powerpc-linux-gnuspe"
++fi
++
+ AC_SUBST(MULTIARCH)
+ 
+ AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 11f959b..2fbb3cb 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -17,6 +17,7 @@ file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
 ${DISTRO_SRC_URI} \
 "
 
-- 
1.9.1


