Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9177871E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ89LKT023329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:35 +0800
Message-ID: <3fc689101c90ad0216272caeb538086721b6938d.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] coreutils: upgrade to 8.26
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:19 -0000
Content-Type: text/plain

Add 0001-local.mk-fix-cross-compiling-problem.patch to fix the following
cross compiling problem.

| Makefile:3418: *** Recursive variable 'INSTALL' references itself (eventually).  Stop.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...need_charset_alias-when-building-for-musl.patch |  0
 ...0001-local.mk-fix-cross-compiling-problem.patch | 26 ++++++++++++++++++++++
 ...e-report-processor-and-hardware-correctly.patch |  0
 .../disable-ls-output-quoting.patch                |  0
 .../fix-selinux-flask.patch                        |  0
 .../man-decouple-manpages-from-build.patch         |  0
 .../remove-usr-local-lib-from-m4.patch             |  0
 .../{coreutils_8.25.bb => coreutils_8.26.bb}       |  9 ++++----
 8 files changed, 31 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/disable-ls-output-quoting.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.25.bb => coreutils_8.26.bb} (93%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.25/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.26/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
new file mode 100644
index 0000000..66f9a71
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
@@ -0,0 +1,26 @@
+Subject: local.mk: fix cross compiling problem
+
+We meet the following error when cross compiling.
+| Makefile:3418: *** Recursive variable 'INSTALL' references itself (eventually).  Stop.
+This patch fixes this problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/local.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/local.mk b/src/local.mk
+index 36dfa4e..c5898cc 100644
+--- a/src/local.mk
++++ b/src/local.mk
+@@ -649,4 +649,4 @@ cu_install_program = @INSTALL_PROGRAM@
+ else
+ cu_install_program = src/ginstall
+ endif
+-INSTALL = $(cu_install_program) -c
++INSTALL_PROGRAM = $(cu_install_program)
+-- 
+2.1.0
+
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch b/meta/recipes-core/coreutils/coreutils-8.26/0001-uname-report-processor-and-hardware-correctly.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/0001-uname-report-processor-and-hardware-correctly.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/0001-uname-report-processor-and-hardware-correctly.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch b/meta/recipes-core/coreutils/coreutils-8.26/disable-ls-output-quoting.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/disable-ls-output-quoting.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.26/fix-selinux-flask.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/fix-selinux-flask.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/fix-selinux-flask.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils-8.26/man-decouple-manpages-from-build.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/man-decouple-manpages-from-build.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/man-decouple-manpages-from-build.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.25/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.26/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.25/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.26/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.26.bb
similarity index 93%
rename from meta/recipes-core/coreutils/coreutils_8.25.bb
rename to meta/recipes-core/coreutils/coreutils_8.26.bb
index 6d6f7bc..caa6d96 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.26.bb
@@ -20,12 +20,13 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://disable-ls-output-quoting.patch \
+           file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[tarball.md5sum] = "070e43ba7f618d747414ef56ab248a48"
-SRC_URI[tarball.sha256sum] = "31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87"
-SRC_URI[manpages.md5sum] = "415cc0552bc4e480b27ce8b2aebfdeb5"
-SRC_URI[manpages.sha256sum] = "2ee31c3a6d2276f49c5515375d4a0c1047580da6ac10536898e0f0de81707f29"
+SRC_URI[tarball.md5sum] = "d5aa2072f662d4118b9f4c63b94601a6"
+SRC_URI[tarball.sha256sum] = "155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e"
+SRC_URI[manpages.md5sum] = "b58107f532f7beffcb2f38e2ac1f2da3"
+SRC_URI[manpages.sha256sum] = "9324ec412ffca3b0431e6299720c33ac98e749e430f72a7c6e65f3635c86aa29"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


