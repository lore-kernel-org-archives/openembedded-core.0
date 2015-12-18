Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57C1260721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:40:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 00:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,445,1444719600"; d="scan'208";a="843854147"
Received: from lleszczu-mobl.igk.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.252.17.67])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 00:39:49 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 10:39:42 +0200
Message-Id: <1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/5] kernel.bbclass: copy .config instead of moving
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
X-List-Received-Date: Fri, 18 Dec 2015 08:40:18 -0000

Copy kernel .config from ${S} to ${B}, instead of moving it. This
prevents mangling the source tree, which is undesirable e.g. when
externalsrc is used.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..7de9f20 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -338,7 +338,7 @@ kernel_do_configure() {
 	touch ${B}/.scmversion ${S}/.scmversion
 
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
-		mv "${S}/.config" "${B}/.config"
+		cp "${S}/.config" "${B}/.config"
 	fi
 
 	# Copy defconfig to .config if .config does not exist. This allows
-- 
2.1.4


