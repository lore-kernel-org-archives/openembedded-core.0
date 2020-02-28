Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C815B61963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:20 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272114"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:37 +0800
Message-Id: <4b41afeea632f33a490d75621e2c0d6bb2bb6aca.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 13/22] perl: Fix encode module reproducibility issues
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

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code is encoding host compiler parameters into target builds. Avoid
this for our target builds. This should resolve builds which aren't
reproducible between hosts with different compilers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71cdbf426e46e3ca1b5038f40e9f7ba958abc537)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl/files/encodefix.patch | 20 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb        |  3 +++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/encodefix.patch

diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
new file mode 100644
index 0000000..396ed0d
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -0,0 +1,20 @@
+The code is encoding host compiler parameters into target builds. Avoid
+this for our target builds (patch is target specific, not native)
+
+Upstream-Status: Inappropriate [Cross compile hack]
+RP 2020/2/18
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: perl-5.30.1/cpan/Encode/bin/enc2xs
+===================================================================
+--- perl-5.30.1.orig/cpan/Encode/bin/enc2xs
++++ perl-5.30.1/cpan/Encode/bin/enc2xs
+@@ -195,7 +195,7 @@ sub compiler_info {
+     # above becomes false.
+     my $sized  = $declaration && !($compat && !$pedantic);
+ 
+-    return ($cpp, $static, $sized);
++    return (0, 1, 1);
+ }
+ 
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 96f0326..e3915a5 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
+SRC_URI_append_class-target = " \
+           file://encodefix.patch \
+"
 
 SRC_URI[perl.md5sum] = "6438eb7b8db9bbde28e01086de376a46"
 SRC_URI[perl.sha256sum] = "bf3d25571ff1ee94186177c2cdef87867fd6a14aa5a84f0b1fb7bf798f42f964"
-- 
2.7.4


