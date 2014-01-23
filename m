Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6570A6E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:12:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NCCSCl001799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:12:29 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 23 Jan 2014 04:12:29 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 20:12:37 +0800
Message-ID: <69dcfa603cb2e43419a1b8795212c850398516f0.1390479069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390479069.git.Qi.Chen@windriver.com>
References: <cover.1390479069.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] initscripts: add initscripts-functions-dev package
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
X-List-Received-Date: Thu, 23 Jan 2014 12:12:28 -0000
Content-Type: text/plain

Add initscripts-functions-dev package to avoid initscripts package
being installed unexpected via the dependency of initscripts-dev package.

Before this patch, if we have 'dev-pkgs' in IMAGE_FEATURES, the initscripts
package would be installed once the initscripts-functions package is installed,
which is not what we need.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index d1644a3..db310a6 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -42,9 +42,11 @@ KERNEL_VERSION = ""
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 
-PACKAGES =+ "${PN}-functions"
+PACKAGES =+ "${PN}-functions ${PN}-functions-dev"
 RDEPENDS_${PN} = "${PN}-functions"
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
+RDEPENDS_${PN}-functions-dev += "${PN}-functions"
+ALLOW_EMPTY_${PN}-functions-dev = "1"
 
 ALTERNATIVE_PRIORITY_${PN}-functions = "90"
 ALTERNATIVE_${PN}-functions = "functions"
-- 
1.7.9.5


