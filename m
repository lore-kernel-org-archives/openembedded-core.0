Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8AA66DF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:41:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Dec 2013 08:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,825,1378882800"; d="scan'208";a="438491238"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2013 08:40:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:40:28 +0000
Message-Id: <2dd7befefe608408e58b46ac7af3daafe7d5aa82.1386175183.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] libarchive: add e2fsprogs to DEPENDS
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
X-List-Received-Date: Wed, 04 Dec 2013 16:41:56 -0000

libarchive's configure script looks for ext2fs/ext2_fs.h in order to use
some defines for file attributes support if present (but doesn't link to
any additional libraries.) There is no configure option to disable this,
and if e2fsprogs is rebuilding between do_configure and do_compile you
can currently get a failure. Since we normally only build this recipe
for the target, and this functionality should really be supported on all
linux systems, just add the dependency as most normal Linux distros seem
to.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/libarchive/libarchive_2.8.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 11c2f7d..d3fb09e 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -4,6 +4,8 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
 
+DEPENDS = "e2fsprogs"
+
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
-- 
1.8.1.2


