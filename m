Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 61B97782D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:56:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 23:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,337,1493708400"; d="scan'208";a="980108481"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 12 Jun 2017 23:56:13 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:52:36 +0300
Message-Id: <1497336760-36835-5-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v3 4/8] bash: changes to support merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 06:56:12 -0000

Most of shell scripts refer to '#!/bin/{sh,bash}' inside the script. But when
'usrmege' feature is enabled this path will be /usr/bin/{sh, bash}.

so to satisify build dependency add '/bin/{sh,bash}' to its providers list.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 3e9c662..6c94a24 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -69,3 +69,5 @@ pkg_postrm_${PN} () {
 PACKAGES += "${PN}-bashbug"
 FILES_${PN} = "${bindir}/bash ${base_bindir}/bash.bash"
 FILES_${PN}-bashbug = "${bindir}/bashbug"
+
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
-- 
2.7.4


