Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Mar 2018 09:32:15 UTC
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 258F678997
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 09:32:15 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 03/07/2018 4:17:15 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.162
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 326744616; Wed, 07 Mar 2018 04:17:15 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 326744578; Wed, 07 Mar 2018 04:17:13 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1etVCE-0005AL-1O; Wed, 07 Mar 2018 09:17:14 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1etVCE-0005de-0V; Wed, 07 Mar 2018 09:17:14 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 09:17:11 +0000
Message-Id: <20180307091711.21635-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 03/07/2018 4:17:13 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-35/SG:1 3/7/2018 4:16:57 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.463707 p=-1 Source Normal
X-Signature-Violations: 0-0-0-3157-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G313 G314 G315 G316 G320 G321 G453 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] util-linux: Remove kill from native install
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
X-List-Received-Date: Wed, 07 Mar 2018 09:32:16 -0000

util-linux installs kill as ${base_bindir}/kill. coreutils installs kill as
${bindir}/kill. If base_bindir and bindir are the same (as they are in
meta-micro) then this causes a conflict for recipes that depend on
util-linux-native and coreutils-native.

This means that in the unlikely event that a recipe needs to run kill
during the build, it will need to depend on coreutils-native.

core-image-sato built successfully for me with this change.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e228bde299..5e40b2019a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -196,8 +196,10 @@ do_install () {
 }
 
 # nologin causes a conflict with shadow-native
+# kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
 do_install_append_class-native () {
 	rm -f ${D}${base_sbindir}/nologin
+	rm -f ${D}${base_bindir}/kill
 }
 
 ALTERNATIVE_PRIORITY = "80"
-- 
2.11.0



