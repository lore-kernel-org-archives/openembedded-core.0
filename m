Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UW2pQ-0003Vv-Db
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 12:58:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3RAeHF1016440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 03:40:17 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sat, 27 Apr 2013 03:40:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Apr 2013 18:40:06 +0800
Message-ID: <b02de228d1892b8b2f21706af508bc33f3f9e081.1367052630.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367052630.git.hongxu.jia@windriver.com>
References: <cover.1367052630.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] craklib:fix testnum and teststr failed
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
X-List-Received-Date: Sat, 27 Apr 2013 10:58:06 -0000
Content-Type: text/plain

The testnum and teststr are small programs to test cracklib.
Here is error log:
...
$ ./testnum
(null).pwd.gz: No such file or directory
PWOpen: No such file or directory

$ ./util/teststr
(null).pwd.gz: No such file or directory
PWOpen: No such file or directory
...
Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...02-craklib-fix-testnum-and-teststr-failed.patch |   53 ++++++++++++++++++++
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch

diff --git a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
new file mode 100644
index 0000000..6210e82
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
@@ -0,0 +1,53 @@
+From 06f9a88b5dd5597f9198ea0cb34f5e96f180e6e3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 27 Apr 2013 16:02:30 +0800
+Subject: [PATCH] craklib:fix testnum and teststr failed
+
+Error log:
+...
+$ ./testnum
+(null).pwd.gz: No such file or directory
+PWOpen: No such file or directory
+
+$ ./util/teststr
+(null).pwd.gz: No such file or directory
+PWOpen: No such file or directory
+...
+Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ util/testnum.c |    2 +-
+ util/teststr.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util/testnum.c b/util/testnum.c
+index ae2246d..ca210ff 100644
+--- a/util/testnum.c
++++ b/util/testnum.c
+@@ -20,7 +20,7 @@ main ()
+     PWDICT *pwp;
+     char buffer[STRINGSIZE];
+ 
+-    if (!(pwp = PWOpen (NULL, "r")))
++    if (!(pwp = PWOpen (DEFAULT_CRACKLIB_DICT, "r")))
+     {
+ 	perror ("PWOpen");
+ 	return (-1);
+diff --git a/util/teststr.c b/util/teststr.c
+index 2a31fa4..9fb9cda 100644
+--- a/util/teststr.c
++++ b/util/teststr.c
+@@ -15,7 +15,7 @@ main ()
+     PWDICT *pwp;
+     char buffer[STRINGSIZE];
+ 
+-    if (!(pwp = PWOpen (NULL, "r")))
++    if (!(pwp = PWOpen (DEFAULT_CRACKLIB_DICT, "r")))
+     {
+ 	perror ("PWOpen");
+ 	return (-1);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
index 349c74f..ae5abc4 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
@@ -11,7 +11,8 @@ PR ="r0"
 EXTRA_OECONF = "--without-python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
-           file://0001-packlib.c-support-dictionary-byte-order-dependent.patch"
+           file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
+           file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
 SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
 SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
-- 
1.7.10.4



