Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EFFAD74719
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 23:11:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 16:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,412,1517904000"; d="scan'208";a="214301512"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 05 Apr 2018 16:11:17 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 16:11:27 -0700
Message-Id: <1522969887-82043-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] hello-mod_0.1.bb: add RPROVIDES
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
X-List-Received-Date: Thu, 05 Apr 2018 23:11:17 -0000

Although the package will get an automatic prefix "kernel-module", so
the package kernel-module-hello does exist, populating rootfs can
generate an error:
  - nothing provides kernel-module-hello ...

This is quite unfortunate, as this recipe is used as a sample.

Adding RPROVIDES_${PN} += "kernel-module-hello" to the recipe fixes
the problem.

[YOCTO #12641]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index b140b0a..3d33446 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES_${PN} += "kernel-module-hello"
-- 
2.7.4


