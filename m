Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F22BF730F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:24:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 12:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,137,1486454400"; d="scan'208";a="74304918"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2017 12:24:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:23:29 +0200
Message-Id: <20170309202331.5595-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] bash: package bashbug separately
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
X-List-Received-Date: Thu, 09 Mar 2017 20:24:35 -0000

It's a machine-specific script, which is causing conflicts
when multiple versions of bash are installed in multilib setting,
and it also does not really make sense for embedded systems anyway.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/bash/bash.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index a05b987b87b..3e9c6625693 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -65,3 +65,7 @@ pkg_postinst_${PN} () {
 pkg_postrm_${PN} () {
 	printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
 }
+
+PACKAGES += "${PN}-bashbug"
+FILES_${PN} = "${bindir}/bash ${base_bindir}/bash.bash"
+FILES_${PN}-bashbug = "${bindir}/bashbug"
-- 
2.11.0


