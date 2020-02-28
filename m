Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BAFD161963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272105"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:36 +0800
Message-Id: <b84f3056591c16fa3e2bba2e4fa936390a76ee9a.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 12/22] perl: fix failing ptests
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:18 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1da6355f13e707b3ffa5025067e509e0120784d)
[Fixup for zeus context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...t-to-correctly-exclude-unbuilt-extensions.patch | 27 ++++++++++++++++++++++
 .../perl/files/perl-configpm-switch.patch          |  4 ++--
 meta/recipes-devtools/perl/perl_5.30.1.bb          |  1 +
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch

diff --git a/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch b/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
new file mode 100644
index 0000000..0f3a2c6
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
@@ -0,0 +1,27 @@
+From b0d53cfd785f64002128ac5eecc4aed0663d9c30 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Jan 2020 17:26:55 +0100
+Subject: [PATCH] tests: adjust to correctly exclude unbuilt extensions
+
+Issue is reported here:
+https://github.com/arsv/perl-cross/issues/85
+
+Upstream-Status: Inappropriate [issue caused by perl-cross]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ t/TEST | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/TEST b/t/TEST
+index a9c844f..8d3505f 100755
+--- a/t/TEST
++++ b/t/TEST
+@@ -419,7 +419,7 @@ sub _tests_from_manifest {
+ 	while (<MANI>) {
+ 	    if (m!^((?:cpan|dist|ext)/(\S+)/+(?:[^/\s]+\.t|test\.pl)|lib/\S+?(?:\.t|test\.pl))\s!) {
+ 		my $t = $1;
+-		my $extension = $2;
++		my $extension = $1."/".$2;
+ 
+ 		# XXX Generates way too many error lines currently.  Skip for
+ 		# v5.22
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3c2cecb..80ce4a6 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7f313cac31c55cbe62a4d0cdfa8321cc05a8eb3a Mon Sep 17 00:00:00 2001
+From 5120acaa2be5787d9657f6b91bc8ee3c2d664fbe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index 09c4a3b..6a0a680 100755
+index c8de8bf..204613c 100755
 --- a/configpm
 +++ b/configpm
 @@ -687,7 +687,7 @@ sub FETCH {
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 15bc5a4..96f0326 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
+           file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://determinism.patch  \
            "
 SRC_URI_append_class-native = " \
-- 
2.7.4


