Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D6C86608F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 06:11:05 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb11so4394589pad.37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 23:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HPA9K6LY2wiA2wiQXmCCOKAPyAr7CHpDj9Z9dXNGOLk=;
	b=UtS1GJn4YlnIiGp2pUPbA8DXhrDF50JMoXm1RAUwq+66FVa1xiTFTNQHGNkliOSoYU
	rvAhfEzUz9lGm+Cg+x8EshBEjpbF0MBJr29eUnG9bOae6g+myrkbh6gPr3wTzJg75OJP
	VMpEHD4E5MKXKL9yPEatMLKmRYEleAzq7D9lhRsQPbJ6uDVZPR3PX3gyFkp1HJ9h3pq1
	9JXMThdStmkU3+lQ9ojLcOduuoIcTNO0Un2CXmqPHU4MmdO+97LSQkycfxXmKuNhILoU
	6ESiemdEm8OqBbPbjj7sitML2PtieQKOT/K9Bk8t2Mri73e/f67wnk55IPiGw3n6O/++
	GYVg==
X-Received: by 10.66.233.9 with SMTP id ts9mr25108270pac.15.1369548666796;
	Sat, 25 May 2013 23:11:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm23279529pbm.0.2013.05.25.23.11.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 23:11:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 16:24:28 +1000
Message-Id: <1369549468-7753-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] cups: remove /var/run from package as cupsd will populate it on startup
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
X-List-Received-Date: Sun, 26 May 2013 06:11:05 -0000

The /var/run/cups and /var/run/cups/certs directories don't need to be
included in the package as they are created by cupsd with the proper
permissions if they don't exist. The /var/run directory is already
created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-extended/cups/cups16.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cups/cups16.inc b/meta/recipes-extended/cups/cups16.inc
index 9b0ae5b..45e7d51 100644
--- a/meta/recipes-extended/cups/cups16.inc
+++ b/meta/recipes-extended/cups/cups16.inc
@@ -53,9 +53,9 @@ do_compile () {
 fakeroot do_install () {
 	oe_runmake "DSTROOT=${D}" install
 
-   # This directory gets installed with perms 511, which makes packaging fail
-   chmod 0711 "${D}/${localstatedir}/run/cups/certs"
-   rmdir ${D}/${libdir}/${BPN}/driver
+	# Remove /var/run from package as cupsd will populate it on startup
+	rm -fr ${D}/${localstatedir}/run
+	rmdir ${D}/${libdir}/${BPN}/driver
 }
 
 python do_package_append() {
-- 
1.8.2.3


