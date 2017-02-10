Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 63CD07734B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543544"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:33 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:14 +0200
Message-Id: <1486734151-28331-7-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 06/23] bash: changes to support merged /usr
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:33 -0000

Most of shell scripts refer to '#!/bin/{sh,bash}' inside the script. But when
'usrmege' feature is enbaled this path will be /usr/bin/{sh, bash}.

so to satisify build dependency add '/bin/{sh,bash}' to its providers list.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1d08526..6525d64 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -63,3 +63,5 @@ pkg_postinst_${PN} () {
 pkg_postrm_${PN} () {
 	printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
 }
+
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
-- 
2.7.4


