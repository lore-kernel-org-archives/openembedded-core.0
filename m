Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 816926CEA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 15:03:30 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r97F3So5024533; 
	Mon, 7 Oct 2013 10:03:29 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 20:05:04 +0500
Message-Id: <1381158304-931-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sysvinit-inittab: Fix getting tty device name from SERIAL_CONSOLES entries
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
X-List-Received-Date: Mon, 07 Oct 2013 15:03:30 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Currently the part after "tty" in the device name go into label along with
everything after that part. For example if SERIAL_CONSOLES="115200;vt100;ttyS0"
than label=S0 but if SERIAL_CONSOLES="115200;ttyS0;vt100" than label=S0;vt100.
If SERIAL_CONSOLES="..;ttyX;..", part after 'X' should also be trimmed.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 23c284d..05ba410 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -22,7 +22,7 @@ do_install() {
     for i in $tmp
     do
 	j=`echo ${i} | sed s/\;/\ /g`
-	label=`echo ${i} | sed -e 's/^.*;tty//'`
+	label=`echo ${i} | sed -e 's/^.*;tty//' -e 's/;.*//'`
 	echo "$label:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
     done
 
-- 
1.7.9.5


