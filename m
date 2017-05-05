Return-Path: <amarnath.valluri@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5528C719B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 12:36:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 05:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="1144055632"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2017 05:36:33 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 15:03:14 +0300
Message-Id: <1493985795-7748-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cross.bbclass: Preserve the bitbake configuration
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
X-List-Received-Date: Fri, 05 May 2017 12:36:36 -0000

While preparing target_libdir and target_base_libdir we should preserve the
bitbake configuration used for 'base_libdir' and 'libdir' instead of assuming
${base|exec}_prefix/${baselib}, which is not true in case of merged '/usr'.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/cross.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8757303..0195b26 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -53,8 +53,10 @@ SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 target_base_prefix := "${base_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
-target_base_libdir = "${target_base_prefix}/${baselib}"
-target_libdir = "${target_exec_prefix}/${baselib}"
+base_libdir_suffix := "${@base_libdir.split(base_prefix)[1] if base_prefix != "" else base_libdir}"
+libdir_suffix := "${@libdir.split(exec_prefix)[1] if exec_prefix != "" else libdir}"
+target_base_libdir = "${target_base_prefix}${base_libdir_suffix}"
+target_libdir = "${target_exec_prefix}${libdir_suffix}"
 target_includedir := "${includedir}"
 
 # Overrides for paths
-- 
2.7.4


