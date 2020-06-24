Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4124.1592961593570731100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 18:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05O1JV8w002456
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 18:19:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 23 Jun 2020 18:19:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] xinit: add rxvt-unicode in RDEPENDS
Date: Wed, 24 Jun 2020 09:17:00 +0800
Message-ID: <20200624011700.1451586-1-changqing.li@windriver.com>
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
 meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
index c9e28d9bba..ed11830cf2 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
@@ -19,4 +19,7 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-RDEPENDS_${PN} += "util-linux-mcookie"
+PACKAGECONFIG ??= "rxvt"
+PACKAGECONFIG[rxvt] = "--with-xterm=rxvt,,,rxvt-unicode,"
+
+RDEPENDS_${PN} += "util-linux-mcookie rxvt-unicode"
-- 
2.17.1

