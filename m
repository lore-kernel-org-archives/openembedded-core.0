Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8228C600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 21:44:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,272,1496127600"; d="scan'208";a="872323738"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.71.172])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2017 14:44:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 27 Jun 2017 14:44:08 -0700
Message-Id: <1498599848-27163-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH] gnupg: fix floating dependancy on gnutls
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
X-List-Received-Date: Tue, 27 Jun 2017 21:44:14 -0000

gunpg added TLS support to the dirmngr for 2.1.0, mostly we linked with
gnutls and had the RDEPENDS for gnutls. Since we had TLS support continue
enabling it by default.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.1.20.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.20.bb b/meta/recipes-support/gnupg/gnupg_2.1.20.bb
index bbda283..e56421f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.20.bb
@@ -40,7 +40,6 @@ do_install_append() {
 	ln -sf gpgv2 ${D}${bindir}/gpgv
 }
 
-RDEPENDS_${PN} = "gnutls"
-
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
-- 
2.7.5


