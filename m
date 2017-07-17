Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8BC71ABB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 16:20:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 09:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="993935882"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.133.170])
	by orsmga003.jf.intel.com with ESMTP; 17 Jul 2017 09:20:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 17 Jul 2017 09:20:14 -0700
Message-Id: <1500308415-19435-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH 1/2] populate_sdk_ext: Add variable to indicate running in eSDK
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
X-List-Received-Date: Mon, 17 Jul 2017 16:20:22 -0000

This allows for other scripts to know that they are being executed in
the context of the eSDK in order to provide different behaviour as
needed.

[YOCTO #11155]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4791d74..c70c435 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -352,6 +352,9 @@ python copy_buildsystem () {
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
 
+            f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
+            f.write('WITHIN_EXT_SDK = "1"\n\n')
+
             # Map gcc-dependent uninative sstate cache for installer usage
             f.write('SSTATE_MIRRORS += " file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
 
-- 
2.7.5


