Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C4E6C72992
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:18 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so5171683pab.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xh9AFPU32dz2w1KytRiRXkEqsoAWQ7y9bX+OYWHH2gU=;
	b=SfOvhKNmz343W9Xu7d6Hrk1LQPDfrPVKhl4CDhbMSFidv2ELJ9npmcqtk3GyzlVWj8
	dARALaayHQU2Ipo2BWYUF+ppqe0rvpBBMY/1tHc7oZQj7XkPPQ2VA39XaW9SD8hwbIY5
	RWPKjLkowAw+qg+BTben0AIOFIwzUuCuIg1j0Osn7kJv0SOGmq+1X+VWtJfMUocTmxvR
	zGIe4+ZKd4E+J1QYr/w/DbGSufrgjIwt7leOEcjNSdXIJUwNLdcglM6MG6BaYyiHaRdx
	Mfe0UwvZEh//DtTgPmqM2WIYDEO444d2kl92id1mYw2iVTyxhw5SO7G3otgsjUXySfL/
	gOaQ==
X-Received: by 10.68.106.68 with SMTP id gs4mr32645146pbb.23.1419224119092;
	Sun, 21 Dec 2014 20:55:19 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:55:01 -0800
Message-Id: <1419224101-24900-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH 5/5] xinit: fix depends issue
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:18 -0000

xinit.cpp in xinit package calls xterm, xclock and twm so
add depends for those packages.

Added X11 distro check.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/xinit_1.3.3.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
index 583ea87..874756d 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
@@ -10,11 +10,17 @@ then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
+DEPENDS = "twm xterm xclock"
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PE = "1"
 
 SRC_URI[md5sum] = "3b8da0e6237aee9828cc809c647510a7"
 SRC_URI[sha256sum] = "74b2878de6e3d5b5948f1562a77e7f53b4e10621e505ddb278050c7f3cae00af"
 
+inherit distro_features_check
+
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-RDEPENDS_${PN} += "util-linux-mcookie"
+RDEPENDS_${PN} += "util-linux-mcookie twm xterm xclock"
-- 
1.9.1


