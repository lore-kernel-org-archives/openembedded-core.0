Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8638572061
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 07:38:02 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so485429wgh.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 23:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XEL5BBLeiPdIxs/q1sCEpXT8758ZC2azEL9+85BcQmw=;
	b=FLPcgVFB2cwaela1qxQoeL35h0SbauoamDvtv2YOmj9zEbuZ5n8RekwbX45GkQB+Sc
	J1HlaqYdowpY2VOFH/z58xVgKhMFpZD4jEWTuZqbPzapppKItLeWeibRJlc8LJSEr/Nh
	ub7E275NpHMBF+mh0/5j25zDd3lrrGLPDZGXQH6v6DeHvd86ETdfzhNZOTt/8fClTG06
	PybnH6QvQ3Y49iJ1rjigR2QrLGC6IhDdpLrULhG15p3GJyNiImFCCsb1HbdXXTpjwo+d
	U43jThoBnk5x8lWumUT7szZHo7yNyXdsmhJgVc5FPjN7RrlTgNJ1iQtKdlmziP7iuAki
	Qmtg==
X-Gm-Message-State: ALoCoQkAZvF8qnzVlcGGQDgAypdWuzSFHLLkZUcDH11QTvzTDUh5d5aOgWjlSWOQ1tg68hR4Phso
X-Received: by 10.180.91.49 with SMTP id cb17mr37788655wib.30.1415259482615;
	Wed, 05 Nov 2014 23:38:02 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id s8sm6760617wjx.9.2014.11.05.23.38.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 05 Nov 2014 23:38:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 08:37:56 +0100
Message-Id: <1415259476-3411-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Thu, 06 Nov 2014 07:38:11 -0000

Besides from being useful as fdisk replacement this gives us 'sgdisk'
which can be used to set the GUID for partitions, e.g.

	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1

To mark it as ESP in scripts like mkefidisk.sh.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
new file mode 100644
index 0000000..62c32c3
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "util-linux popt ncurses"
+
+PV = "0.8.10+git${SRCPV}"
+SRCREV = "a920398fa393f9d6301b32b191bc01e086ab8bc8"
+SRC_URI = "git://git.code.sf.net/p/gptfdisk/code"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 cgdisk ${D}${bindir}
+    install -m 0755 gdisk ${D}${bindir}
+    install -m 0755 sgdisk ${D}${bindir}
+    install -m 0755 fixparts ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.0


