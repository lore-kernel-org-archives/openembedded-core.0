Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DB79B71186
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:51 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 08:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835165"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:31 -0700
Message-Id: <e7f36919a07150ba5ebb6a70360d0f3eba880451.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
Subject: [PATCH 5/5] at: Upgrade to 3.1.15
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:56 -0000

Rebase pam.conf.patch
Move to generic files -> at for patches directory

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/at/{files => at}/S99at       |  0
 meta/recipes-extended/at/{files => at}/atd.service |  0
 .../{files => at}/configure-add-enable-pam.patch   |  0
 .../file_replacement_with_gplv2.patch              |  0
 .../{files => at}/fix_parallel_build_error.patch   |  0
 .../at/{files => at}/pam.conf.patch                | 24 ++++++++++++++--------
 meta/recipes-extended/at/{files => at}/posixtm.c   |  0
 meta/recipes-extended/at/{files => at}/posixtm.h   |  0
 .../at/{at_3.1.14.bb => at_3.1.15.bb}              |  4 ++--
 9 files changed, 17 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/at/{files => at}/S99at (100%)
 rename meta/recipes-extended/at/{files => at}/atd.service (100%)
 rename meta/recipes-extended/at/{files => at}/configure-add-enable-pam.patch (100%)
 rename meta/recipes-extended/at/{files => at}/file_replacement_with_gplv2.patch (100%)
 rename meta/recipes-extended/at/{files => at}/fix_parallel_build_error.patch (100%)
 rename meta/recipes-extended/at/{files => at}/pam.conf.patch (68%)
 rename meta/recipes-extended/at/{files => at}/posixtm.c (100%)
 rename meta/recipes-extended/at/{files => at}/posixtm.h (100%)
 rename meta/recipes-extended/at/{at_3.1.14.bb => at_3.1.15.bb} (94%)

diff --git a/meta/recipes-extended/at/files/S99at b/meta/recipes-extended/at/at/S99at
similarity index 100%
rename from meta/recipes-extended/at/files/S99at
rename to meta/recipes-extended/at/at/S99at
diff --git a/meta/recipes-extended/at/files/atd.service b/meta/recipes-extended/at/at/atd.service
similarity index 100%
rename from meta/recipes-extended/at/files/atd.service
rename to meta/recipes-extended/at/at/atd.service
diff --git a/meta/recipes-extended/at/files/configure-add-enable-pam.patch b/meta/recipes-extended/at/at/configure-add-enable-pam.patch
similarity index 100%
rename from meta/recipes-extended/at/files/configure-add-enable-pam.patch
rename to meta/recipes-extended/at/at/configure-add-enable-pam.patch
diff --git a/meta/recipes-extended/at/files/file_replacement_with_gplv2.patch b/meta/recipes-extended/at/at/file_replacement_with_gplv2.patch
similarity index 100%
rename from meta/recipes-extended/at/files/file_replacement_with_gplv2.patch
rename to meta/recipes-extended/at/at/file_replacement_with_gplv2.patch
diff --git a/meta/recipes-extended/at/files/fix_parallel_build_error.patch b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
similarity index 100%
rename from meta/recipes-extended/at/files/fix_parallel_build_error.patch
rename to meta/recipes-extended/at/at/fix_parallel_build_error.patch
diff --git a/meta/recipes-extended/at/files/pam.conf.patch b/meta/recipes-extended/at/at/pam.conf.patch
similarity index 68%
rename from meta/recipes-extended/at/files/pam.conf.patch
rename to meta/recipes-extended/at/at/pam.conf.patch
index dfe76d7..b5ceb9a 100644
--- a/meta/recipes-extended/at/files/pam.conf.patch
+++ b/meta/recipes-extended/at/at/pam.conf.patch
@@ -3,19 +3,25 @@ oe doesn't support "@include", use the concrete directive instead.
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---- at-3.1.12/pam.conf.orig	2009-11-23 23:11:52.000000000 +0800
-+++ at-3.1.12/pam.conf	2011-07-15 11:14:04.132818950 +0800
-@@ -2,8 +2,8 @@
+Index: at-3.1.15/pam.conf
+===================================================================
+--- at-3.1.15.orig/pam.conf
++++ at-3.1.15/pam.conf
+@@ -1,10 +1,11 @@
+ #
  # The PAM configuration file for the at daemon
  #
-
--auth	required	pam_env.so
--@include common-auth
--@include common-account
--@include common-session-noninteractive
--session    required   pam_limits.so
++ 
 +auth    required    pam_env.so
 +auth    include     common-auth
 +account include     common-account
 +session include     common-session-noninteractive
 +session required    pam_limits.so
++session required    pam_loginuid.so
+ 
+-auth	required	pam_env.so
+-@include common-auth
+-@include common-account
+-session    required   pam_loginuid.so
+-@include common-session-noninteractive
+-session    required   pam_limits.so
diff --git a/meta/recipes-extended/at/files/posixtm.c b/meta/recipes-extended/at/at/posixtm.c
similarity index 100%
rename from meta/recipes-extended/at/files/posixtm.c
rename to meta/recipes-extended/at/at/posixtm.c
diff --git a/meta/recipes-extended/at/files/posixtm.h b/meta/recipes-extended/at/at/posixtm.h
similarity index 100%
rename from meta/recipes-extended/at/files/posixtm.h
rename to meta/recipes-extended/at/at/posixtm.h
diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.15.bb
similarity index 94%
rename from meta/recipes-extended/at/at_3.1.14.bb
rename to meta/recipes-extended/at/at_3.1.15.bb
index 68a24b8..a465a76 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.15.bb
@@ -29,8 +29,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "d41cfd79033b6e49a8838add59a42ac6"
-SRC_URI[sha256sum] = "cd092bf05d29c25b286f55a960ce8b8c3c5beb571d86ed8eb1dfb3b61291b3ae"
+SRC_URI[md5sum] = "f0f96db22e3a174b53ce4beeeb848839"
+SRC_URI[sha256sum] = "03a84f5293d5a95ef4231b7faf5578f141f0c76a2b304dd655bc7e90e97bf7fc"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
-- 
1.8.3.1


