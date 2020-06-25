Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.5959.1593072826843286730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 01:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05P8Djrc015490
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 01:13:46 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 01:13:32 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V3][PATCH] xinit: add rxvt-unicode in RDEPENDS
Date: Thu, 25 Jun 2020 16:11:20 +0800
Message-ID: <20200625081120.2740259-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
/etc/X11/xinit/xinitrc: line 55: exec: xterm: not found

by default, xinit will generate /etc/X11/xinit/xinitrc,
and have below config in it:
XTERM -geometry 80x50+494+51 &
XTERM -geometry 80x20+494-0 &
exec XTERM -geometry 80x66+0+0 -name login

the default XTERM is xterm, but xterm is in meta-oe,
use rxvt instead

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
index c9e28d9bba..301ea1c243 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
@@ -19,4 +19,7 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
+PACKAGECONFIG ??= "rxvt"
+PACKAGECONFIG[rxvt] = "--with-xterm=rxvt,,,rxvt-unicode"
+
 RDEPENDS_${PN} += "util-linux-mcookie"
-- 
2.17.1

