Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8480C799AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:10:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T79p9r016709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:10:01 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 00:09:40 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:01:46 +0800
Message-ID: <20180929070147.88203-4-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180929070147.88203-1-kexin.hao@windriver.com>
References: <20180929070147.88203-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] bitbake.conf: Introduce variables used to access the other recipe specific sysroot directory in multilib case
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
X-List-Received-Date: Sat, 29 Sep 2018 07:10:10 -0000
Content-Type: text/plain

When multilib is enabled, there would be two different recipe specific
sysroot directories:
  libxx-recipe-sysroot
  recipe-sysroot

We do need to access the files under the "recipe-sysroot" directory in
some cases. So introduces these variables for this purpose.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/conf/bitbake.conf  | 4 ++++
 meta/conf/multilib.conf | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93aee1ae4628..b7e3e5ca26df 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -370,6 +370,7 @@ STAGING_DIR = "${TMPDIR}/sysroots"
 COMPONENTS_DIR = "${STAGING_DIR}-components"
 RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
 RECIPE_SYSROOT_NATIVE = "${WORKDIR}/recipe-sysroot-native"
+RECIPE_ALT_SYSROOT = "${RECIPE_SYSROOT}"
 
 STAGING_DIR_NATIVE = "${RECIPE_SYSROOT_NATIVE}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
@@ -394,6 +395,9 @@ STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
 STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 
+STAGING_ALT_DIR_HOST = "${RECIPE_ALT_SYSROOT}"
+STAGING_ALT_DATADIR = "${STAGING_ALT_DIR_HOST}${datadir}"
+
 STAGING_DIR_TARGET = "${RECIPE_SYSROOT}"
 
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index e74dec81a897..4dd824fdb273 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
 STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
+RECIPE_ALT_SYSROOT = "${WORKDIR}/recipe-sysroot"
 
 INHERIT += "multilib_global"
 
-- 
2.14.4


