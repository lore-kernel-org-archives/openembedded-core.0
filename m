Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 235397821A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:28:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="123361399"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 28 Aug 2017 13:28:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 13:28:26 -0700
Message-Id: <1503952106-26310-9-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
References: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 8/8] qemuboot.bbclass: create deterministic qemuboot.conf file
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
X-List-Received-Date: Mon, 28 Aug 2017 20:28:29 -0000

The lines in qemuboot.conf are in random order.
This patch fixes this by printing the lines in sorted order.
This makes it easier to compare two different builds for
any differences.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 0e21fc9..bd2f01d 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -87,7 +87,7 @@ python do_write_qemuboot_conf() {
     topdir="%s/"%(d.getVar('TOPDIR')).replace("//","/")
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
-    for k in qemuboot_vars(d):
+    for k in sorted(qemuboot_vars(d)):
         # qemu-helper-native sysroot is not removed by rm_work and
         # contains all tools required by runqemu
         if k == 'STAGING_BINDIR_NATIVE':
-- 
2.7.4


