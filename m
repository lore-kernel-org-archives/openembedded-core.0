Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C7CE0607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:15:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jul 2015 08:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,447,1432623600"; d="scan'208";a="726490526"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 08:15:37 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 08:13:19 +0000
Message-Id: <d0fa281d129a9dce1a95679071d154c23032c70c.1436515631.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1436515631.git.alejandro.hernandez@linux.intel.com>
References: <cover.1436515631.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] If a the number of hard links decreases or increases while creating the tar files used for an ipk package, tar fails with error code 1, we use hardlinks on package/ and packages-split/ to decrease disk usage, sometimes other parts of the build can cause a change in the link count, since this happens in a controlled environment we can safely ignore the error and continue to create the ipk file, fixed some typos from old version.
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
X-List-Received-Date: Fri, 10 Jul 2015 15:15:36 -0000

[YOCTO #7933]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | 2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
index 4bcae4954..e8250b7 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -12,7 +12,7 @@ We detect if the error code produced by tar is 1 and in this case ignore it.
 This a similar behavior to the one on dpkg:
 http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
 
-Upsteam-Status: Inappropriate
+Upstream-Status: Inappropriate
 
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 74b974d..2f66632 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,9 +10,9 @@ PROVIDES += "virtual/update-alternatives"
 SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils " 
+SRC_URI = "git://git.yoctoproject.org/opkg-utils"
 
-SRC_URI_append_class-native = "file://tar_ignore_error.patch"
+SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.5


