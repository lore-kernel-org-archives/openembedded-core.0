Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B7FD5761B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:21:44 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZIIJc-0002hA-Dm from Abdur_Rehman@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jul 2015 08:21:44 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 23 Jul 2015 16:21:42 +0100
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 20:20:48 +0500
Message-ID: <1437664848-15504-1-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] sed: rrec on locale-base-ru-ru, not rdep
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
X-List-Received-Date: Thu, 23 Jul 2015 15:21:50 -0000
Content-Type: text/plain

This locale package isn't guaranteed to exist, depending on the value of
GLIBC_GENERATE_LOCALES.

The value of GLIBC_GENERATE_LOCALES can be specified to not contain
locale-base-ru-ru, thus resulting in unsatisfied dependency. Its better
to remove hardcoded dependency upon locale-base-ru-ru in favor of a
recommendation, as this locale isn't always available depending upon the
value of GLIBC_GENERATE_LOCALES.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 meta/recipes-extended/sed/sed_4.2.2.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index a1e3483..5da3355 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -15,7 +15,8 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
 inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
+RDEPENDS_${PN}-ptest += "make ${PN}"
+RRECOMMENDS_${PN}-ptest += "locale-base-ru-ru"
 
 EXTRA_OECONF = "--disable-acl \
                 ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex-tests', '', d)}"
-- 
1.7.9.5


