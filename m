Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A72BE7468B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 02:04:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3K24veF019784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 19:04:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 19 Apr 2018 19:04:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 10:06:00 +0800
Message-ID: <289c9bc9b308ed35d777165d13e364ab8e52606f.1524043165.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1524043165.git.Qi.Chen@windriver.com>
References: <cover.1524043165.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cross-canadian: fix do_configure failure when switching machine and multilib
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
X-List-Received-Date: Fri, 20 Apr 2018 02:04:56 -0000
Content-Type: text/plain

This patch fixes a corner case, where in the same build directory, we
change MACHINE and MULTILIBS but the resulting TUNE_ARCH remains the same.

This situation is encountered when we switch build from 'qemuarm' to
'lib32 qemuarm64'.

And we have the following problem for cross-canadian recipes at do_configure.

  configure: error: C compiler cannot create executable.

The problem could be reproduced by two steps.
step1:
  MACHINE = "qemuarm"
  require conf/multilib.conf
  MULTILIBS = ""
  bitbake binutils-cross-canadian-arm

step2:
  MACHINE = "qemuarm64"
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"
  bitbake binutils-cross-canadian-arm

The problem occured because its lib32-recipe-sysroot is not
constructed correctly, reusulting in missing of necessary components
like crt1.o.

Why this happens? Because for such cross-canadian recipes, their
dependency tasks are nativesdk recipes, whose MLPREFIX are set to
'nativesdk-'. Hence, even if RECIPE_SYSROOT has changed from
'recipe-sysroot' to 'lib32-recipe-sysroot', it's possible that
the checksums of these dependency tasks remain the same. This happens
when variables like TUNE_ARCH remain the same between the switch.
e.g.
TUNE_ARCH remain to be 'arm' when switching from qemuarm to lib32
qemuarm64.

OE supports changing MACHINE and multilib in the same build directory.
So when changing from 'qemuarm' to 'lib32 qemuarm64', things should
build out correctly.

So we need to ensure the do_prepare_recipe_sysroot task is rerun
when switching multilib.

Adding MLPREFIX to vardeps of do_prepare_recipe_sysroot could ensure
the task to rerun in such case.

Besides, when this task is rerun, which invokes extend_recipe_sysroot,
we need to make sure the recipe sysroot is constructed correctly.

So we need to set RECIPE_SYSROOT_NATIVE to contain MLPREFIX. Otherwise,
as the checksums of the dependency tasks are the same and they are stored
in recipe-sysroot-native/intalleddeps, no component would be installed.

After this change, when switching from 'qemuarm' to 'lib32 qemuarm64',
we could ensure that the two builds are not using the same native
recipe sysroot, and they are not using the same recipe sysroot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/cross-canadian.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ee8aa61..9a4d021 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -165,6 +165,16 @@ USE_NLS = "${SDKUSE_NLS}"
 # and not any particular tune that is enabled.
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 
+# Make sure prepare_recipe_sysroot is rerun when changing multilib
+# where TUNE_ARCH remains the same
+# e.g. switch from qemuarm to lib32 qemuarm64
+do_prepare_recipe_sysroot[vardeps] += "MLPREFIX"
+
+# Make sure recipe_sysroot is correctly constructed when changing multilib
+# where TUNE_ARCH remains the same
+# e.g. switch from qemuarm to lib32 qemuarm64
+RECIPE_SYSROOT_NATIVE = "${WORKDIR}/${MLPREFIX}recipe-sysroot-native"
+
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
 # If MLPREFIX is set by multilib code, shlibs
 # points to the wrong place so force it
-- 
1.9.1


