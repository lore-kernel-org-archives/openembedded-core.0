Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 913 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Feb 2015 17:18:05 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id B797D60017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:18:05 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.11)
	with ESMTP id 507230185; Thu, 05 Feb 2015 12:02:51 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YJPpA-0007d5-KM; Thu, 05 Feb 2015 17:02:40 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YJPpA-00021X-JQ; Thu, 05 Feb 2015 17:02:40 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 17:02:21 +0000
Message-Id: <1423155741-7715-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Thu, 05 Feb 2015 17:18:15 -0000

${bindir} and ${base_bindir} may be the same. If they are don't try and
move files onto themselves.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-extended/sed/sed_4.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index 72976de..bbfa238 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -22,8 +22,10 @@ EXTRA_OECONF = "--disable-acl \
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
-	rmdir ${D}${bindir}/
+	if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
+	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
+	    rmdir ${D}${bindir}/
+	fi
 }
 
 ALTERNATIVE_${PN} = "sed"
-- 
2.1.4


