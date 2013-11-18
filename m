Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7316F6D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 10:31:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAIAViI5002700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 02:31:44 -0800 (PST)
Received: from pek-lpgbuild2.wrs.com (128.224.153.30) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 18 Nov 2013 02:31:44 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 18:31:41 +0800
Message-ID: <1384770701-30455-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.3.5
MIME-Version: 1.0
Subject: [PATCH] pr-util: insert appropriate parameter to adapt libtool
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
X-List-Received-Date: Mon, 18 Nov 2013 10:31:44 -0000
Content-Type: text/plain

When ccache is enabled, a parameter "ccache" is inserted.
libtool can not handle this parameter correctly. So "--tag=CC"
is introduced to help libtool handle it.
---
 meta/recipes-support/apr/apr-util_1.5.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
index ea0f7fb..d6ae394 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
@@ -34,6 +34,11 @@ do_configure_append() {
 	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 	fi
+
+	# When ccache is enabled, libtool needs --tag=CC to choose correct handle methods.
+	if [ -f ${S}/build/rules.mk ]; then
+		sed -i "s,^LTFLAGS,LTFLAGS      = --silent --tag=CC\n#LTFLAGS,g" ${S}/build/rules.mk
+	fi
 }
 do_configure_prepend_class-native() {
 	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk
-- 
1.7.3.5


