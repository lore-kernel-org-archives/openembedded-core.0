Return-Path: <sujith.h@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0967201A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 10:56:53 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so9395109wes.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pGRIjiwuR8sQUmaV5zyfmIL42gPi0QqMyKeiq4Snv1M=;
	b=uBmJuyyk4iXeo88YURPBuZP2t72gfEoOV7Hw7ZmgjFO5emqClY+UTbomtkjJfZl0SA
	O+4DUbiVqXcgLa8R+7fpTeE9BEesC1raFOxg+GheBX67DSnzYVX4PZ+xJezuPy2M6rvX
	D1LaQ3GUWqjgUPSMY6+uLZn09bq5zlACnRrAySQLXcRKYQjOOU/Tnzax0fDwdUgf0Eum
	JOYuWhBSWbHK6g8bNNPf4QEUmXVEFeyZHa8fOSSi1CUeQqXDlSCBggLDA9kFR2ZhsVvm
	uAijYeHHwgFh4scoo3pG+CBf+J+UlCIMY0JYlQjCwPQQ6+RDEJ2rWiziS9Td3qPapmGP
	DeBw==
X-Received: by 10.181.29.198 with SMTP id jy6mr43123348wid.0.1420541806151;
	Tue, 06 Jan 2015 02:56:46 -0800 (PST)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	je12sm13451871wic.22.2015.01.06.02.56.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 02:56:45 -0800 (PST)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 16:24:28 +0530
Message-Id: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
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
X-List-Received-Date: Tue, 06 Jan 2015 10:56:55 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This module was required to get opengl working with
Qt5 version 5.4 ( when tested with qemuarm and qemux86).
After adding this change to the xorg.conf and restarting
xserver qtquick and qtdeclarative examples of Qt5 started
working appropriately.

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
Signed-off-by: Sujith H <sujith.h@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 549c7c8..bcd9d8a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -17,4 +17,11 @@ do_install () {
 		install -d ${D}/${sysconfdir}/X11
 		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
+        if ${@bb.utils.contains('DISTRO_FEATURES','x11','true','false',d)}; then
+                cat >> ${D}/${sysconfdir}/X11/xorg.conf << EOF
+Section "Module"
+    Load           "glx"
+EndSection
+EOF
+        fi
 }
-- 
1.8.4


