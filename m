Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3F1A6A564
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:13:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8F9DGtn000553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 02:13:16 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 15 Sep 2013 02:13:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Sep 2013 05:13:12 -0400
Message-ID: <e4f5f3c244b7d3b7f49cad8fd57dbfa7c4a009f7.1379235732.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379235732.git.liezhi.yang@windriver.com>
References: <cover.1379235732.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Sun, 15 Sep 2013 09:13:15 -0000
Content-Type: text/plain

There would be an error when the TMPDIR is long/deep, for example when
len(TMPDIR) = 350 while our supported longest value is 410:

[snip]
aclocal: error: cannot open xxx
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
[snip]

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

Another fix is that we can modify autotools.bbclass to let it use the
relative path rather than the absolute, but I don't think that we have
to do that based on the following 2 thoughts:

* The coreutils is the only recipe which has this issue as far as we
  know when len(TMPDIR) <= 410, because it has the most amount of m4
  files (more than 400 ones).

* That would impact all the recipes which use autotools.bbclass, and we
  are not sure about the side effect, for example, it would break the
  build there is a sub-configure.

[YOCTO #2766]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb  |    6 ++++++
 meta/recipes-core/coreutils/coreutils_8.21.bb |    6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 2654028..eeeab05 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -57,6 +57,12 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
 
 sbindir_progs= "chroot"
 
+# Let aclocal use the relative path for the m4 file rather than the
+# absolute since coreutils has a lot of m4 files, otherwise there might
+# be an "Argument list too long" error when it is built in a long/deep
+# directory.
+acpaths = "-I ./m4"
+
 do_install() {
 	autotools_do_install
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index 35c9100..da14303 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -47,6 +47,12 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdi
 
 sbindir_progs= "chroot"
 
+# Let aclocal use the relative path for the m4 file rather than the
+# absolute since coreutils has a lot of m4 files, otherwise there might
+# be an "Argument list too long" error when it is built in a long/deep
+# directory.
+acpaths = "-I ./m4"
+
 # Deal with a separate builddir failure if src doesn't exist when creating version.c/version.h
 do_compile_prepend () {
 	mkdir -p ${B}/src
-- 
1.7.10.4


