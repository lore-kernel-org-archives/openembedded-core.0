Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id A0F5472823
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 10:04:24 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so30680343pad.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 02:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pGRIjiwuR8sQUmaV5zyfmIL42gPi0QqMyKeiq4Snv1M=;
	b=Ccan5O6wI8WBL1DuCNmZc0JWXbym/OR+sjDI5LCvcGhvEDCNAnBkRMprz5/MqlKuiJ
	vJ1ClVEUcgVnfPvCQuKEZRbFKT/wSF/BbfRb2mtLz3iLvwWuPhQne9zBGMwu5ZXKo4iW
	tlomGgp88mosknNoEKOUwZCEmvoJlnLCtp6WMdsrorlYEk6G7x1s+zMs4xXNkgm9Te6o
	MaijoBc0d674yBIgIEHAXst58/rQGTsMdM4Qbr5x59V1r7NlSELA0l/hJaPGHF/Fn4Jg
	HX4v60wa02vieU4f2ITJA8/t+huvBGR9d+N8b3wuXkFUZTnt/MFQF9mVLBT3LJnXRqmX
	ox2g==
X-Received: by 10.66.249.99 with SMTP id yt3mr142152260pac.59.1420538664906;
	Tue, 06 Jan 2015 02:04:24 -0800 (PST)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	pg6sm10894974pbb.96.2015.01.06.02.04.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 02:04:24 -0800 (PST)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 15:32:27 +0530
Message-Id: <1420538547-15885-1-git-send-email-sujith.h@gmail.com>
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
X-List-Received-Date: Tue, 06 Jan 2015 10:04:28 -0000

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


