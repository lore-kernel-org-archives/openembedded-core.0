Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fE-0002bY-Dx
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FqD020478; Mon, 4 Feb 2013 00:01:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2x+TN5KB5Tvl; Mon,  4 Feb 2013 00:01:16 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14019Sb020449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:11 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pi-0000XM-4x; Sun, 03 Feb 2013 23:55:58 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:36 +0000
Message-Id: <1c30e095444653f1f33d3feee35b691016230c8d.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/22] staging/insane.bbclass: Move legacy do_stage check iinto insane.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

We might as well put all the sanity checks in one place.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass  |    3 +++
 meta/classes/staging.bbclass |    5 -----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7e5634d..504182c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -903,6 +903,9 @@ python () {
     # Check various variables
     ###########################################################################
 
+    if d.getVar('do_stage', True) is not None:
+        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
+
     issues = []
     if d.getVar('PACKAGES', True):
         for var in 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index da90d31..643352d 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -114,9 +114,4 @@ python do_populate_sysroot_setscene () {
 }
 addtask do_populate_sysroot_setscene
 
-python () {
-    if d.getVar('do_stage', True) is not None:
-        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
-}
-
 
-- 
1.7.10.4



