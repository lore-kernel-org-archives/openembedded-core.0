Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D835561980
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:21 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272123"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:38 +0800
Message-Id: <1589115ff42e8c211bc0784bd8aca7d3a5b8f566.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 14/22] perl: Fix makefile race causing configuration differences
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a missing makefile dependency which can cause differences in
configuration (submitted upstream).

[YOCTO #13800]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe97845a45434902c5a994e253a127a462d7d3b4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl/files/racefix.patch | 24 ++++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb      |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/racefix.patch

diff --git a/meta/recipes-devtools/perl/files/racefix.patch b/meta/recipes-devtools/perl/files/racefix.patch
new file mode 100644
index 0000000..bac42d2
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/racefix.patch
@@ -0,0 +1,24 @@
+In our builds Config_heavy.pl sometimes has lines:
+cwarnflags=XXX
+ccstdflags=XXX
+and sometimes does not.
+The reason is that this information is pulled from cflags by configpm and yet
+there is no dependency in the Makefile. Add one to fix this.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/89]
+RP 2020/2/19
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: perl-5.30.1/Makefile
+===================================================================
+--- perl-5.30.1.orig/Makefile
++++ perl-5.30.1/Makefile
+@@ -204,7 +204,7 @@ configpod: $(CONFIGPOD)
+ git_version.h lib/Config_git.pl: make_patchnum.pl | miniperl$X
+ 	./miniperl_top make_patchnum.pl
+ 
+-lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh \
++lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh cflags \
+ 		lib/Config_git.pl Porting/Glossary | miniperl$X
+ 	./miniperl_top configpm
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index e3915a5..32746c7 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://determinism.patch  \
+           file://racefix.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.7.4


