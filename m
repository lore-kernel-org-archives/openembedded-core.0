Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id DC5066B717
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 16:48:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,780,1389740400"; d="scan'208";a="43764444"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 02 Apr 2014 18:48:09 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 2 Apr 2014 18:48:09 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 2 Apr 2014 18:48:08 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Apr 2014 18:46:26 +0200
Message-ID: <1396457186-5961-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [RFC][PATCH] files/device_table-minimal.txt: cleanup
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
X-List-Received-Date: Wed, 02 Apr 2014 16:48:10 -0000
Content-Type: text/plain

This device list is only used if USE_DEVFS is set to '0' (which is NOT the default since 2013-12-14,
see commit f54fdd6673a136ee1cee1f3263a8a7820de43ca3) and if IMAGE_DEVICE_TABLE and IMAGE_DEVICE_TABLES are not set.

This is, of course a very subjective list but minimal with 62 (special) files.
However, you should be able to boot correctly a lot of embedded linux around.

Changes:
- add sda, sdb, sda[1234], sdb[1234]
- add mmcblk0, mmcblk0p[1234]
- add rtc0, rtc1
- restrict maximum hdaX from 19 to 4 (pata is old)
- add ttyS1
- remove initctl, apm_bios, tty8, ttySA
- sorted entries

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/files/device_table-minimal.txt | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 56c74bb..e4891cc 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -9,23 +9,27 @@
 #    p	Fifo (named pipe)
 
 /dev		d	755	root	root	-	-	-	-	-
-/dev/initctl	p	600	root	root	-	-	-	-	-
-/dev/apm_bios	c	660	root	plugdev	10	134	-	-	-
+/dev/console	c	662	root	tty	5	1	-	-	-
 /dev/fb0	c	600	root	root	29	0	-	-	-
 /dev/hda	b	660	root	disk	3	0	-	-	-
-/dev/hda	b	660	root	disk	3	1	1	1	19
+/dev/hda	b	660	root	disk	3	1	1	1	4
 /dev/kmem	c	640	root	kmem	1	2	-	-	-
 /dev/kmsg	c	600	root	root	1	11	-	-	-
 /dev/mem	c	640	root	kmem	1	1	-	-	-
-/dev/null	c	666	root	root	1	3	-	-	-
-/dev/ram	b	640	root	root	1	0	0	1	4
-/dev/tty	c	662	root	tty	5	0	-	-	-
-/dev/tty	c	666	root	tty	4	0	0	1	9
-/dev/ttyS	c	640	root	tty	4	64	0	1	1
-/dev/ttySA	c	640	root	tty	204	5	0	1	1
-/dev/zero	c	644	root	root	1	5	-	-	-
+/dev/mmcblk0	b	660	root	disk	179	0	-	-	-
+/dev/mmcblk0p	b	660	root	disk	179	1	1	1	4
 /dev/mtd	c	660	root	disk	90	0	0	2	8
 /dev/mtdblock	b	640	root	root	31	0	0	1	8
-/dev/console	c	662	root	tty	5	1	-	-	-
+/dev/null	c	666	root	root	1	3	-	-	-
+/dev/ram	b	640	root	root	1	0	0	1	4
 /dev/random	c	644	root	root	1	8	-	-	-
+/dev/rtc	c	644	root	root	254	0	0	1	2
+/dev/sda	b	660	root	disk	8	0	-	-	-
+/dev/sda	b	660	root	disk	8	1	1	1	4
+/dev/sdb	b	660	root	disk	8	16	-	-	-
+/dev/sdb	b	660	root	disk	8	17	1	1	4
+/dev/tty	c	662	root	tty	5	0	-	-	-
+/dev/tty	c	666	root	tty	4	0	0	1	8
+/dev/ttyS	c	640	root	tty	4	64	0	1	2
 /dev/urandom	c	644	root	root	1	9	-	-	-
+/dev/zero	c	644	root	root	1	5	-	-	-
-- 
1.8.5.4


