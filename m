Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E32CC722DE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Nov 2014 08:46:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAU8kLGJ008773
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Nov 2014 00:46:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 30 Nov 2014 00:46:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Nov 2014 16:46:37 +0800
Message-ID: <be9bd4dce47519cdda188b81ed1ff78497083207.1417337125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417337125.git.Qi.Chen@windriver.com>
References: <cover.1417337125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libxslt: create wrapper to avoid host system referencing
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
X-List-Received-Date: Sun, 30 Nov 2014 08:46:26 -0000
Content-Type: text/plain

By default, xsltproc from libxslt would use configuration files under
/etc/xml. To avoid host system contamination, we create a wrapper for
this command to make it use configuration files in the sysroot directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.28.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 0b2526d..ded883e 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -35,6 +35,11 @@ RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
 RREPLACES_${PN}-bin += "${PN}-utils"
 
+
+do_install_append_class-native () {
+    create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
+}
+
 FILES_${PN} += "${libdir}/libxslt-plugins"
 FILES_${PN}-dev += "${libdir}/xsltConf.sh"
 
-- 
1.9.1


