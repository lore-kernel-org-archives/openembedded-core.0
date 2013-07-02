Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5651E6AE77
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:02:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2013 07:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="363530388"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.242])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 07:02:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:02:41 +0100
Message-Id: <6f10b6f7efcda0ef8232572033b703241f10adcd.1372773662.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372773662.git.paul.eggleton@linux.intel.com>
References: <cover.1372773662.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372773662.git.paul.eggleton@linux.intel.com>
References: <cover.1372773662.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] ghostscript: fix patch failure with some versions of patch
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
X-List-Received-Date: Tue, 02 Jul 2013 14:02:57 -0000

Some versions of patch (e.g. 2.6.1.136-31a7 on OpenSUSE 12.2) will
refuse to patch a file via a symlink (probably a fairly sensible
security precaution). The "base/" subdirectory specified within the
ghostscript-9.05-NOT-check-endian.patch file was being lost by the
default application with -p1, but this was not caught on most systems
due to the symlink. Fix the path so that we always patch the file
directly.

Fixes [YOCTO #4773].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
index f78387d..14c036e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
@@ -7,8 +7,8 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
---- base/configure.ac.orig	2013-06-24 03:58:26.224723002 -0400
-+++ base/configure.ac	2013-06-24 04:03:29.730807957 -0400
+--- ghostscript/base/configure.ac.orig	2013-06-24 03:58:26.224723002 -0400
++++ ghostscript/base/configure.ac	2013-06-24 04:03:29.730807957 -0400
 @@ -255,13 +255,13 @@
  
  AC_MSG_CHECKING([for big endian])
-- 
1.8.1.2


