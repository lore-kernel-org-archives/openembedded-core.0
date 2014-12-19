Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 614E372907
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244364"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:43 +0000
Message-Id: <2d23ce7c2fa37ce6aba3d043d35fe1fa074c50b0.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/15] meta-environment: don't mark tasks as nostamp
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:08 -0000

With siggen being changed to alter the signature of nostamp tasks on the
fly, having these tasks as nostamp results in the SDK being rebuilt
every time, which is not desirable. In any case this is just legacy from
the days before we used signatures to take care of ensuring these tasks
get re-run when they need to be.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/meta-environment.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index bb208a3..b3737bb 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -19,7 +19,6 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 inherit cross-canadian
 
-do_generate_content[nostamp] = "1"
 do_generate_content[cleandirs] = "${SDK_OUTPUT}"
 do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
 python do_generate_content() {
@@ -58,7 +57,6 @@ create_sdk_files() {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 }
 
-do_install[nostamp] = "1"
 do_install() {
     install -d ${D}/${SDKPATH}
     install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
-- 
1.9.3


