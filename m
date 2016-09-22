Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F030065CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:07:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8MA7vSm004552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 03:07:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Sep 2016 03:07:56 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 18:04:24 +0800
Message-ID: <ccd68af80823db0804d7ac646e83bf6653f588ff.1474538635.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1474538635.git.kai.kang@windriver.com>
References: <cover.1474538635.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xserver-xorg: fix qa warnings
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
X-List-Received-Date: Thu, 22 Sep 2016 10:07:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When build lib32-xserver-xorg it has qa warning:

| WARNING: lib32-xserver-xorg-2_1.18.4-r0 do_package_qa: QA Issue:
| Package lib32-xf86-video-modesetting contains Xorg driver
| (modesetting_drv.so) but no xorg-abi- dependencies [xorg-driver-abi]

The qa check xorg-driver-abi has been skipped for xserver-xorg and make
it to skip for multilib package too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 371c279..29503b1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -69,7 +69,7 @@ PACKAGES =+ "${PN}-sdl \
              xf86-video-modesetting"
 
 SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
-INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
+INSANE_SKIP_${MLPREFIX}xf86-video-modesetting = "xorg-driver-abi"
 
 XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp"
 RRECOMMENDS_${PN} += "${XSERVER_RRECOMMENDS}"
-- 
2.9.3


