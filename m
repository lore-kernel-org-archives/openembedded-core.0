Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 6790260169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:50:46 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.11)
	with ESMTP id 507256300; Thu, 05 Feb 2015 12:50:47 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YJQZb-0007lO-Cb; Thu, 05 Feb 2015 17:50:39 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1YJQZb-00070z-Bs; Thu, 05 Feb 2015 17:50:39 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 17:50:23 +0000
Message-Id: <1423158623-26927-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
References: <20150205174208.GA7735@mcrowe.com>
In-Reply-To: <20150205174208.GA7735@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCHv2] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Thu, 05 Feb 2015 17:50:53 -0000

${bindir} and ${base_bindir} may be the same. If they are don't try and
move files onto themselves.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-extended/sed/sed_4.1.2.bb | 6 ++++--
 meta/recipes-extended/sed/sed_4.2.2.bb | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 4c0f345..40e3a53 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -23,8 +23,10 @@ do_configure_prepend () {
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


