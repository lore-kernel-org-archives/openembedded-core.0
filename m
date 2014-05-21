Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DACB65EDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 02:16:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4L2Ge0Q019721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 19:16:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 20 May 2014 19:16:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 10:16:40 +0800
Message-ID: <1400638600-22676-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] man: use '#' instead of ', ' as separator in configure
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
X-List-Received-Date: Wed, 21 May 2014 02:16:41 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

$CC is able to has ',', when $CC includes some flags, which will trigger error,
like:
    | Creating Makefile from Makefile.in
    | sed: -e expression #1, char 72: unknown option to `s'
    |
    | sed: -e expression #1, char 72: unknown option to `s'

So use '#' instead of ',' as separator, it is more safe for the case.

Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/man/man/man-configure.patch |   23 +++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb             |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/man/man/man-configure.patch

diff --git a/meta/recipes-extended/man/man/man-configure.patch b/meta/recipes-extended/man/man/man-configure.patch
new file mode 100644
index 0000000..edef7d4
--- /dev/null
+++ b/meta/recipes-extended/man/man/man-configure.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+$CC is able to has ',', when $CC includes some flags, which will trigger error,
+like:
+    | Creating Makefile from Makefile.in
+    | sed: -e expression #1, char 72: unknown option to `s'
+    |
+    | sed: -e expression #1, char 72: unknown option to `s'
+
+So use '#' instead of ',' as separator
+
+Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
+--- a/configure
++++ b/configure
+@@ -1321,7 +1321,7 @@ do
+   echo "Creating $infile from $infile.in"
+   sed -e '
+ s,@version@,$version,
+-s,@CC@,$CC,
++s#@CC@#$CC#
+ s,@EXEEXT@,$EXEEXT,
+ s,@BUILD_CC@,$BUILD_CC,
+ s,@INSTALL@,$INSTALL,
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index a66e01c..a2b16d2 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5m2-sigpipe.patch \
            file://man-1.6e-i18n_whatis.patch \
            file://man-1.6e-new_sections.patch \
+           file://man-configure.patch \
            file://man.1.gz;unpack=false \
            file://man.7.gz;unpack=false \
            file://man.conf \
-- 
1.7.10.4


