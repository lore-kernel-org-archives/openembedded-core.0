Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 56B2B65CE9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2019 22:41:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 357793A0037
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2019 22:05:30 +0000 (UTC)
X-Originating-IP: 64.126.170.184
Received: from localhost.localdomain (w170184.wireless.fsr.net
	[64.126.170.184])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DE6E3C0007;
	Sat, 20 Apr 2019 22:05:27 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Apr 2019 15:05:16 -0700
Message-Id: <20190420220516.2973-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] qemu: Add PACKAGECONFIG for snappy
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
X-List-Received-Date: Sat, 20 Apr 2019 22:41:55 -0000
Content-Transfer-Encoding: 8bit

In addition to toggling libsnappy support, this allows a qemu-native
build to explicitly disable snappy support. When building qemu-native,
the configure script will detect libsnappy on the build machine and
improperly enable snappy support. This can corrupt the sstate cache if
the cache is populated with a qemu-native build with snappy improperly
enabled, and the cached qemu-native gets used on another build machine
that does not have libsnappy.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e503aa866d..13f0549c25 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -165,5 +165,6 @@ PACKAGECONFIG[virglrenderer] = "--enable-virglrenderer,--disable-virglrenderer,v
 PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
+PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.21.0


