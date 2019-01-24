Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEC260116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:53:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6rE9j026641
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:53:14 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 22:53:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:53:11 -0800
Message-ID: <695f9930079b78a6a2a56fe6571954228f46b318.1548312757.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548312757.git.liezhi.yang@windriver.com>
References: <cover.1548312757.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] native.bbclass/cross.bbclass: No strip sysroot when DEBUG_BUILD
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
X-List-Received-Date: Thu, 24 Jan 2019 06:53:13 -0000
Content-Type: text/plain

This makes dbg work for native tools, and makes debug native tools problem
easier, otherwise, there is no symbol since trippped.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cross.bbclass  | 3 +++
 meta/classes/native.bbclass | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 34d7951..f832561 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -17,6 +17,9 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_LD_ARCH = "${BUILD_LD_ARCH}"
 HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
+# No strip sysroot when DEBUG_BUILD is enabled
+INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
 
 STAGING_DIR_HOST = "${RECIPE_SYSROOT_NATIVE}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ddccfe2e1..30a30f9 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -119,6 +119,9 @@ PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 # reused if we manipulate the paths.
 SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 
+# No strip sysroot when DEBUG_BUILD is enabled
+INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+
 python native_virtclass_handler () {
     pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
-- 
2.10.2


