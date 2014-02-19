Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0CED16C9B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 20:53:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 12:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,507,1389772800"; d="scan'208";a="486107830"
Received: from unknown (HELO localhost) ([10.255.12.82])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2014 12:53:37 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 14:53:36 -0600
Message-Id: <722243f17b60f55830343be89dc2a80d0767d41d.1392842779.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392842779.git.tom.zanussi@linux.intel.com>
References: <cover.1392842779.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/2] wic: Fix exec_native_cmd() path
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
X-List-Received-Date: Wed, 19 Feb 2014 20:53:38 -0000

The path exported in exec_native_cmd() includes bogus 'PATH=' which
means the native paths for all but the first will be ignored.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/oe/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 6b01955..d65b77a 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -74,7 +74,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
     Always need to execute native commands as_shell
     """
     native_paths = \
-        "export PATH=%s/sbin:PATH=%s/usr/sbin:PATH=%s/usr/bin:$PATH" % \
+        "export PATH=%s/sbin:%s/usr/sbin:%s/usr/bin:$PATH" % \
         (native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "%s;%s" % (native_paths, cmd_and_args)
     msger.debug("exec_native_cmd: %s" % cmd_and_args)
-- 
1.8.3.1


