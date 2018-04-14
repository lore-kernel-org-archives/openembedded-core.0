Return-Path: <niko.mauno@iki.fi>
X-Greylist: delayed 503 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Apr 2018 07:03:26 UTC
Received: from sypressi2.dnainternet.net (sypressi3.dnainternet.net
	[83.102.40.158])
	by mail.openembedded.org (Postfix) with ESMTP id F053B71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 07:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 1C68A3006;
	Sat, 14 Apr 2018 09:55:03 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.158])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id QWUJMDYrZNzW; Sat, 14 Apr 2018 09:55:02 +0300 (EEST)
Received: from oliivipuu2.dnainternet.net (oliivipuu2.dnainternet.net
	[83.102.40.53])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id DA25D2BE4;
	Sat, 14 Apr 2018 09:55:02 +0300 (EEST)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by oliivipuu2.dnainternet.net (Postfix) with ESMTP id B1955A2;
	Sat, 14 Apr 2018 09:54:59 +0300 (EEST)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2018 09:54:56 +0300
Message-Id: <20180414065456.62948-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH] run-postinsts: Replace pi_dir variable test
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
X-List-Received-Date: Sat, 14 Apr 2018 07:03:27 -0000

Since commit 5159ddcb62682e1b7e63a20a9218ea96e3fe10a2 string length test
performed against pi_dir has effectively never been able to succeed.

Change this to rather test if pi_dir is not an existing directory. By
doing we remove the chance of seeing the following console error message
during first boot to a pristine rootfs:

  'ls: /etc/ipk-postinsts: No such file or directory'

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 50c0a1afea..307feb7187 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -43,7 +43,7 @@ remove_rcsd_link () {
 	fi
 }
 
-if [ -z "$pi_dir" ]; then
+if ! [ -d $pi_dir ]; then
 	remove_rcsd_link
 	exit 0
 fi
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 31c98ec99c..85b3fc867e 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Runs postinstall scripts on first boot of the target device"
 SECTION = "devel"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-- 
2.16.3


