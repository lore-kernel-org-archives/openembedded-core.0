Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBDA6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:58:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u29Jwlxm012521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 11:58:47 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 11:58:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2016 13:58:42 -0600
Message-ID: <785dd92671d9815d78b2ac263da5bd881e25ebc9.1457553474.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457553473.git.mark.hatle@windriver.com>
References: <cover.1457553473.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rpm: Sync CVS to regular version
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
X-List-Received-Date: Wed, 09 Mar 2016 19:58:48 -0000
Content-Type: text/plain

A previous fix for a python dep issue was not merged to the CVS version.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 982c035..bacdef5 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -634,6 +634,14 @@ EOF
 	${@multilib_rpmmacros(d)}
 }
 
+do_install_append_class-native () {
+	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env nativepython|' ${D}/${libdir}/python2.7/site-packages/rpm/transaction.py
+}
+
+do_install_append_class-nativesdk () {
+	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env python|' ${D}/${libdir}/python2.7/site-packages/rpm/transaction.py
+}
+
 def multilib_rpmmacros(d):
     localdata = d.createCopy()
     # We need to clear the TOOLCHAIN_OPTIONS (--sysroot)
-- 
2.5.0


