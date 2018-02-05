Return-Path: <prvs=5674cc8ee=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id EDBE178429
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1227; q=dns/txt;
	s=ironport1; t=1517833554; x=1549369554;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=1ieNatGJLYV7T+GXG7UnG4mpA92YXmJSPlGLueZEeNg=;
	b=xPVEvdVO+4fHN2tAr7osxVYVL7lya+RXddipWIyHWrdVM9vW5lyZI+Q6
	5gNC0K0G3HT4m8mW/cTVLbBSGPdp5yFQHAKV5hucp6CoTirFd47XC85AP
	EJroE/8ckwtui9beJ2Uhh0LyPRyW2+bDFxypVMEVnVOJ2/i6GetDbuQs2 E=;
X-IronPort-AV: E=Sophos;i="5.46,464,1511823600"; 
   d="scan'208";a="3180862"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 13:25:51 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:25:51
	+0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:25:43 +0100
Message-ID: <20180205122544.27223-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH] usbutils: Split out lsusb.py
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
X-List-Received-Date: Mon, 05 Feb 2018 12:25:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The pretty-printing "lsusb.py" script shipped by usbutils is currently
useless, as it doesn't runtime depend on python, and has unversioned
python in the shebang.

Avoid adding a python dependency to current configurations with usbutils
buy splitting lsusb.py into a usbutils-python package, and make it
runtime depend on python3-core.

Make the script usable by replacing the shebang with a direct call to
${bindir}/python3.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta/recipes-bsp/usbutils/usbutils_009.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-bsp/usbutils/usbutils_009.bb b/meta/recipes-bsp/usbutils/usbutils_009.bb
index 30522fd0f1..a7cbe45406 100644
--- a/meta/recipes-bsp/usbutils/usbutils_009.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_009.bb
@@ -22,3 +22,11 @@ FILES_${PN}-dev += "${datadir}/pkgconfig"
 
 RRECOMMENDS_${PN} = "udev-hwdb"
 RDEPENDS_${PN}-ptest = "libboost-system libboost-thread"
+
+PACKAGE_BEFORE_PN =+ "${PN}-python"
+FILES_${PN}-python += "${bindir}/lsusb.py"
+RDEPENDS_${PN}-python = "python3-core"
+
+do_install_append() {
+    sed -i -E '1s,#!.+python,#!${bindir}/python3,' ${D}${bindir}/lsusb.py
+}
-- 
2.16.1


