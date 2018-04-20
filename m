Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2D3A746D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3K8w8oh015344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:58:08 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 20 Apr 2018 01:58:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 16:59:29 +0800
Message-ID: <cb681cf61abd18f133c3c141a4ed0d5e5b27494b.1524211328.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1524211328.git.Qi.Chen@windriver.com>
References: <cover.1524211328.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib/bitbake.conf: default to contain MLPREFIX in RECIPE_SYSROOT
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
X-List-Received-Date: Fri, 20 Apr 2018 08:58:07 -0000
Content-Type: text/plain

We set RECIPE_SYSROOT to ${WORKDIR}/recipe-sysroot in bitbake.conf and
${WORKDIR}/${MLPREFIX}recipe-sysroot in multilib.conf.

The problem is about nativesdk recipes. MLPREFIX is set to "nativesdk-"
in nativesdk.bbclass. So if we don't include (or require) multilib.conf,
nativesdk recipe's RECIPE_SYSROOT is 'recipe-sysroot'; if we include (or
require) multilib.conf, its RECIPE_SYSROOT is 'nativesdk-recipe-sysroot'.

Just including multilib.conf or not would affect nativesdk reicpes
RECIPE_SYSROOT value. This is not reasonable. And in fact it sometimes
causes problem for us. When we change configuration about multilib
in the same build directory, we sometimes get the following build failure.

  ld: cannot find crtn.o: No such file or directory

Not only that, sometimes the manifest under sysroot-components of
nativesdk recipes have entries starting with 'recipe-sysroot', but
the actual files that should be removed are under 'nativesdk-recipe-sysroot'.
And that causes problem for prepare_recipe_sysroot task! Errors are like:

  Exception: FileExistsError: [Errno 17] File exists

So change RECIPE_SYSROOT to contain MLPREFIX by default. In this way,
nativesdk recipes would have their RECIPE_SYSROOT set to
nativesdk-recipe-sysroot. After all, changing MULTILIBS should not
affect this value for nativesdk recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf  | 2 +-
 meta/conf/multilib.conf | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 92aa944..7e5baec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -368,7 +368,7 @@ B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
 COMPONENTS_DIR = "${STAGING_DIR}-components"
-RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
+RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT_NATIVE = "${WORKDIR}/recipe-sysroot-native"
 
 STAGING_DIR_NATIVE = "${RECIPE_SYSROOT_NATIVE}"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index e74dec8..fd6a868 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,10 +6,6 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
 MULTILIBS ??= "multilib:lib32"
 
-STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
-STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
-RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
-
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND_append = " ${MULTILIBS}"
-- 
1.9.1


