Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C10567372E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 02:35:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1Q2Zrkk019256
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 18:35:53 -0800 (PST)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 25 Feb 2015 18:35:53 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2015 10:35:52 +0800
Message-ID: <1424918152-19470-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] man: fix bugs of makewhatis script
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
X-List-Received-Date: Thu, 26 Feb 2015 02:35:54 -0000
Content-Type: text/plain

- man-1.6e-whatis2.patch does not delete the tail "fi"
  fix it to avoid syntax error
- Use the command "which" to get the path of awk

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-extended/man/man/man-1.6e-whatis2.patch |  7 +++++++
 meta/recipes-extended/man/man/man-1.6g-whatis3.patch | 20 ++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb                |  4 +++-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/man/man/man-1.6g-whatis3.patch

diff --git a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch b/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
index 7f01383..f65971a 100644
--- a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
+++ b/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
@@ -50,3 +50,10 @@ Index: man-1.6f/src/makewhatis.sh
         here=`pwd`
         cd $mandir
         for i in $sections
+@@ -447,7 +447,6 @@
+
+        chmod 644 ${mandir1}/whatis
+        rm $TMPFILE
+-     fi
+    done
+ done
diff --git a/meta/recipes-extended/man/man/man-1.6g-whatis3.patch b/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
new file mode 100644
index 0000000..145aeaf
--- /dev/null
+++ b/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
@@ -0,0 +1,20 @@
+Do not use absolute path for awk while getting the path of awk
+when running makewhatis.
+This can avoid errors if path of awk changes.
+
+Upstream-Status: Submitted [man-1.6g]
+
+Signed-off-by: Jian Liu <jian.liu@windriver.com>
+
+diff -Nur man-1.6g.orig/src/makewhatis.sh man-1.6g/src/makewhatis.sh
+--- man-1.6g.orig/src/makewhatis.sh	2015-02-25 16:13:12.657611419 +0800
++++ man-1.6g/src/makewhatis.sh	2015-02-25 16:14:49.334694815 +0800
+@@ -67,7 +67,7 @@
+ # but that leads to problems and bugs.
+
+ # AWK=/usr/bin/gawk
+-AWK=@awk@
++AWK=`which awk`
+
+ # Find a place for our temporary files. If security is not a concern, use
+ #	TMPFILE=/tmp/whatis$$; TMPFILEDIR=none
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index a2b16d2..917fd50 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -38,7 +38,9 @@ SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man.1.gz;unpack=false \
            file://man.7.gz;unpack=false \
            file://man.conf \
-           file://manpath.5.gz;unpack=false"
+           file://manpath.5.gz;unpack=false \
+           file://man-1.6g-whatis3.patch \
+"

 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
 SRC_URI[sha256sum] = "ccdcb8c3f4e0080923d7e818f0e4a202db26c46415eaef361387c20995b8959f"
--
1.8.5.2.233.g932f7e4


