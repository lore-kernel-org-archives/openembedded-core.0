Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9B7E73172
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7F5BA025234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:05 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:32 -0800
Message-ID: <1042d020d5d1b6af3f32e5fe29562d1dce765f0a.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 24/40] classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:04 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The extensible SDK relies upon uninative, and with the way that
uninative works, the build system architecture must be the same as the
SDK architecture or the extensible SDK won't be usable. At some point in
future hopefully we can remove this limitation, but until then it's
disingenuous to allow this to build, so add a check to ensure
SDK_ARCH == BUILD_ARCH and fail if it isn't.

(From OE-Core master rev: 9e30e849eda3b0a0c54d3f7ed0102760fdaef06c)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 736f17f..dc05261 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -261,6 +261,11 @@ SDK_POST_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_postinst}"
 SDK_POSTPROCESS_COMMAND_prepend_task-populate-sdk-ext = "copy_buildsystem; install_tools; "
 
 fakeroot python do_populate_sdk_ext() {
+    # FIXME hopefully we can remove this restriction at some point, but uninative
+    # currently forces this upon us
+    if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
+        bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
+
     bb.build.exec_func("do_populate_sdk", d)
 }
 
-- 
1.7.9.5


