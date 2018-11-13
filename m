Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C60736C250
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:48:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 01:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,498,1534834800"; d="scan'208";a="273593284"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2018 01:48:10 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 17:32:57 +0800
Message-Id: <1542101577-59901-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 4/4] testimage: Add support for slirp
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
X-List-Received-Date: Tue, 13 Nov 2018 09:48:09 -0000

Enable testimage to support qemu slirp. Configure
"QEMU_USE_SLIRP" variable to enable slirp.

[YOCTO#10713]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index ba2d9c4..2f6a21b 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -256,6 +256,10 @@ def testimage_main(d):
     else:
         kvm = False
 
+    slirp = False
+    if d.getVar("QEMU_USE_SLIRP"):
+        slirp = True
+
     # TODO: We use the current implementatin of qemu runner because of
     # time constrains, qemu runner really needs a refactor too.
     target_kwargs = { 'machine'     : machine,
@@ -267,6 +271,7 @@ def testimage_main(d):
                       'boottime'    : boottime,
                       'bootlog'     : bootlog,
                       'kvm'         : kvm,
+                      'slirp'       : slirp,
                     }
 
     # TODO: Currently BBPATH is needed for custom loading of targets.
-- 
2.7.4


