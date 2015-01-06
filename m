Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68CA6728FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 12:52:55 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so30338947pdi.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 04:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5+KZI0IGpn47Zxcr2ICTsUkCBzgbkazK3+nGBclmt9c=;
	b=r3iPmITWhb4OzHdhJ83qBjJXWk49vknZxLa5zadBzvHxOXTeeowAcw+9RRydWYpSG5
	ObqfHiQM6gPM4V0m68+W4iAa4/DxOxBfBBEG7hdaRQmf7xBunsgoItkh+7PE1AEbUcRb
	+SNvlqoorauM768FTovB2lzX7NVb8kTvkb6D5FWe3uN27M5aNcxDU5BL7ERu1KMHbwZ0
	R2IV+70lwgAzw/0hTN4n8LvH/Y7OPDooD8frPbHrwSEsWDd3utmj7Fyz1/oI5RtYd2yU
	TkEQAkpW1o7kC6m4y3yEjLqPou1GvDr4wnpYYxGlhXUZ7Wafpv7/K9s2xQ9RJvyWBNb8
	wfcw==
X-Received: by 10.68.200.68 with SMTP id jq4mr154902954pbc.30.1420548776823;
	Tue, 06 Jan 2015 04:52:56 -0800 (PST)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id y3sm56919427pbt.44.2015.01.06.04.52.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 04:52:56 -0800 (PST)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 18:21:00 +0530
Message-Id: <1420548660-18635-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] xserver-xf86-config: Loading glx module
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
X-List-Received-Date: Tue, 06 Jan 2015 12:52:56 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This module was required to get opengl working with
Qt5 version 5.4 ( when tested with qemuarm and qemux86).
After adding this change to the xorg.conf and restarting
xserver qtquick and qtdeclarative examples of Qt5 started
working appropriately.

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
Signed-off-by: Sujith H <sujith.h@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 549c7c8..391ebae 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -17,4 +17,9 @@ do_install () {
 		install -d ${D}/${sysconfdir}/X11
 		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
+        cat >> ${D}/${sysconfdir}/X11/xorg.conf << EOF
+Section "Module"
+    Load           "glx"
+EndSection
+EOF
 }
-- 
1.8.4


