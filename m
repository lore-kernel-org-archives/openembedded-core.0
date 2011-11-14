Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RPx8S-0005AQ-5N for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 15:03:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEDvM9w012462
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:57:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12050-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:57:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEDvGOk012456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:57:17 GMT
Message-ID: <1321279039.26881.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 13:57:19 +0000
In-Reply-To: <8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
	<8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base-passwd: Move update-passwd into a separate package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2011 14:03:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

update-passwd is the only user of the passwd/group.master files
and was never used by OE since it wasn't run.

This patch packages this separately and adds an appropriate postinst
to make the package useful so people can include it as they wish.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 05be23f..f6e17f9 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files
(/etc/passwd and /etc/group).  The update-passwd tool is also provided
to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r5"
+PR = "r9"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM =
"file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -16,6 +16,11 @@ S = "${WORKDIR}/base-passwd"
 
 inherit autotools
 
+PACKAGES =+ "${PN}-update"
+FILES_${PN}-update = "${sbindir}/* ${datadir}/${PN}"
+
+ALLOW_EMPTY_${PN} = "1"
+
 SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
 
 do_install () {
@@ -78,3 +83,10 @@ fi
 	d.setVar('pkg_preinst_${PN}', preinst)
 }
 
+pkg_postinst_${PN}-update () {
+#!/bin/sh
+if [ "x$D" != "x" ]; then
+	exit 0
+fi
+${sbindir}/update-passwd
+}




