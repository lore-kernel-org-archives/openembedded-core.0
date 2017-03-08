Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4A273111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:24:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 09:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="1106280655"
Received: from jyotigan-mobl.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.22.226])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2017 09:24:20 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 17:24:14 +0000
Message-Id: <20170308172417.15776-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/4] chkconfig-alternatives-native: fix obey_variables
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
X-List-Received-Date: Wed, 08 Mar 2017 17:24:20 -0000

This postfunc assumes it's run from S, whereas that seems not to always
be the case in practice. Explicitly define the full path of the file
we wish to sed.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
index c0f7f16..87fa8eb 100644
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -21,7 +21,7 @@ inherit native
 # into the sysroot, as we may use them to construct the rootfs. As such, we
 # only adjust the paths to match the metadata for the target, not native.
 obey_variables () {
-	sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' alternatives.c
+	sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' ${S}/alternatives.c
 }
 
 do_compile () {
-- 
2.9.3


