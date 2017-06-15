Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9405A783DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9CCAD1834E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6LysoA-8_Xw8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:02 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C3A8D1850F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 719CB1A07E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64E151A07D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 57A9730CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FFc1Y0014231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FFc1Fk014230
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 17:38:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:37:55 +0200
Message-Id: <eca20d19c0b6951cc40074fcb947ea9ac85557d5.1497540930.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 08/11] texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
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
X-List-Received-Date: Thu, 15 Jun 2017 15:38:02 -0000

We do not build the Locale::gettext_xs Perl module and the code will
test for it and happily use Locale::gettext_pp instead if it is not
found. However, this still causes a file dependency on
perl(Locale::gettext_xs) to be generated, which must be satisfied by
adding an explicit provide for it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/texinfo/texinfo_6.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.3.bb b/meta/recipes-extended/texinfo/texinfo_6.3.bb
index d82731e11e..f58df928aa 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.3.bb
@@ -79,4 +79,10 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
+# Lie about providing the Locale::gettext_xs module. It is not actually built,
+# but the code will test for it and if not found use Locale::gettext_pp instead.
+# However, this causes a file dependency on perl(Locale::gettext_xs) to be
+# generated, which must be satisfied.
+RPROVIDES_${PN} += "perl(Locale::gettext_xs)"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.12.0


