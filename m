Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9891786D2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 04:35:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB64Zjep008618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Dec 2017 20:35:45 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Dec 2017 20:35:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Dec 2017 12:37:05 +0800
Message-ID: <93a58a08f5228be92813009dc7b15dccefe7d239.1512534912.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512534912.git.Qi.Chen@windriver.com>
References: <cover.1512534912.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] coreutils: upgrade to 8.28
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
X-List-Received-Date: Wed, 06 Dec 2017 04:35:45 -0000
Content-Type: text/plain

Upgrade coreutils to 8.28.

Backport a patch to fix the following build error on centos7.

  warning: unreferenced node `Realpath usage examples'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...c-fix-Up-field-of-realpath-usage-examples.patch | 40 ++++++++++++++++++++++
 .../{coreutils_8.27.bb => coreutils_8.28.bb}       |  9 ++---
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
 rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch b/meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
new file mode 100644
index 0000000..d763842
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
@@ -0,0 +1,40 @@
+From e83f10c48309b722570dc53a22deb355433f8cbc Mon Sep 17 00:00:00 2001
+From: Bernhard Voelker <mail@bernhard-voelker.de>
+Date: Tue, 5 Sep 2017 00:20:01 +0200
+Subject: [PATCH] doc: fix "Up" field of realpath usage examples
+
+Older versions of 'makeinfo' choke on a missing reference:
+
+  ./doc/coreutils.texi:14177: `Realpath usage examples' has no Up field\
+  (perhaps incorrect sectioning?).
+  makeinfo: Removing output file `doc/coreutils.info' due to errors; \
+  use --force to preserve.
+
+* doc/coreutils.texi (realpath invocation): Add a menu referencing
+the usage examples - introduced in v8.27-91-g7449f0d.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ doc/coreutils.texi | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/doc/coreutils.texi b/doc/coreutils.texi
+index 70e2b76..d374b4a 100644
+--- a/doc/coreutils.texi
++++ b/doc/coreutils.texi
+@@ -14175,6 +14175,10 @@ Exit status:
+ 1 otherwise.
+ @end display
+ 
++@menu
++* Realpath usage examples::              Realpath usage examples.
++@end menu
++
+ 
+ @node Realpath usage examples
+ @subsection Realpath usage examples
+-- 
+2.1.0
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.28.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.27.bb
rename to meta/recipes-core/coreutils/coreutils_8.28.bb
index ea8740a..a980724 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
@@ -21,12 +21,13 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://0001-doc-fix-Up-field-of-realpath-usage-examples.patch \
           "
 
-SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
-SRC_URI[tarball.sha256sum] = "8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b"
-SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
-SRC_URI[manpages.sha256sum] = "1f615819e9167646c731636b6c5ecbe79837e82a18666bacc82c3fb1dfcfaea3"
+SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
+SRC_URI[tarball.sha256sum] = "1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65"
+SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
+SRC_URI[manpages.sha256sum] = "d72c3fa79ae328a4fd1107102e8946755aa2e908044e1efcf1e71ef206dca042"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


