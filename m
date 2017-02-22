Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3E773027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114017880"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:23 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:26:52 +0200
Message-Id: <1487752042-19804-21-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 21/25] net-tools: Place package content as per bitbake environment.
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:23 -0000

net-tools Makefile was hardcoded sbin, bin installation paths to /bin and /sbin
respectively.  This change moves the installed files to appropriate location as
per configured bitbake environment.

This might be solved much better way by patching Makefile, but that causing
build issues, as net-tools recipe is using pre-generated config.{h/status}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 49a65f8..c4af7ef 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -93,6 +93,17 @@ do_install() {
 	unset CFLAGS
 	unset LDFLAGS
 	oe_runmake 'BASEDIR=${D}' install
+
+	if [ "${base_bindir}" != "/bin" ]; then
+		mkdir -p ${D}/${base_bindir}
+		mv ${D}/bin/* ${D}/${base_bindir}/
+		rmdir ${D}/bin
+	fi
+	if [ "${base_sbindir}" != "/sbin" ]; then
+		mkdir ${D}/${base_sbindir}
+		mv ${D}/sbin/* ${D}/${base_sbindir}/
+		rmdir ${D}/sbin
+	fi
 }
 
 inherit update-alternatives
-- 
2.7.4


