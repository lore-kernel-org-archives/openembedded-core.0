Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D65DA65E83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 09:43:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2014 02:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,574,1400050800"; d="scan'208";a="565937160"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2014 02:43:50 -0700
From: Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 12:44:03 +0300
Message-Id: <8da3c8378d020bce0ecc2cef6a4a5da3be983709.1404120809.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404120809.git.roxana.ciobanu@intel.com>
References: <cover.1404120809.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1404120809.git.roxana.ciobanu@intel.com>
References: <cover.1404120809.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] python3: fix builtins imports
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
X-List-Received-Date: Mon, 30 Jun 2014 09:43:54 -0000

On some Linux distros the current working directory
is not added to the linker's path.
Issue reproduced on Ubuntu 14.04 LTS.

Fix for [YOCTO #6467].

Signed-off-by: Roxana <roxana.ciobanu@intel.com>
---
 meta/recipes-devtools/python/python3/unixccompiler.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/meta/recipes-devtools/python/python3/unixccompiler.patch
index b2229b4..7b90f13 100644
--- a/meta/recipes-devtools/python/python3/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -13,11 +13,13 @@ Index: Python-3.3.2/Lib/distutils/unixccompiler.py
 ===================================================================
 --- Python-3.3.2.orig/Lib/distutils/unixccompiler.py	2013-05-15 09:32:54.000000000 -0700
 +++ Python-3.3.2/Lib/distutils/unixccompiler.py	2013-08-01 00:58:18.629056286 -0700
-@@ -202,7 +202,7 @@
+@@ -202,7 +202,9 @@
      # ccompiler.py.
  
      def library_dir_option(self, dir):
 -        return "-L" + dir
++        if dir.startswith("."):
++            return "-L" + dir
 +        return "-L=" + dir
  
      def _is_gcc(self, compiler_name):
-- 
1.9.1


