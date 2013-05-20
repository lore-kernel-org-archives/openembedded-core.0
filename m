Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60CB269698
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 23:00:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4KJUh58003584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 12:30:43 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 20 May 2013 12:30:43 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2013 12:30:42 -0700
Message-ID: <1369078242-4032-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1369078242-4032-1-git-send-email-jslater@windriver.com>
References: <1369078242-4032-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: adjust hwclock ALTERNATIVE_PRIORITY
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
X-List-Received-Date: Mon, 20 May 2013 23:00:08 -0000
Content-Type: text/plain

Make ALTERNATIVE_PRIORITY[hwclock] dependent on an
OVERRIDE so that the hwclock from busybox, if available,
will be used for the nslu2 bsp.

Independently, add util-linux-agetty to RRECOMMENDS.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c783385..10493aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -88,7 +88,9 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_util-linux-reset += "ncurses"
 
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
+                     util-linux-mount util-linux-readprofile util-linux-mkfs \
+                     util-linux-agetty "
 
 RRECOMMENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-native = ""
@@ -175,9 +177,10 @@ ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
-# There seems to be problem, atleast on nslu2, with these, untill they are
+# There seems to be problems, at least on nslu2, with these, until they are
 # fixed the busybox ones have higher priority
-ALTERNATIVE_PRIORITY[hwclock] = "10"
+#
+ALTERNATIVE_PRIORITY[hwclock] = "${@['100', '10']['${OVERRIDES}'.find('nslu2') != -1]}"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 
 ALTERNATIVE_util-linux-fdisk = "fdisk"
-- 
1.7.3.4


