Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 64D4D6AFF4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:40:48 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so1909622pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 00:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XH5t7S/gz428MBRHiwY2MuCybK4r24YLPX3oG5Lmyo8=;
	b=DBH2i8I/Px6n5Ae1C4eYzNeOVnRDMsdlVrhcDYpYFx/90KAxbRnkkDVWJ/OhzZ7rl3
	F7tBGCxTlfTFUvGRQ8k1ViUSZ2yoKJxfgAXsr/dQBq+ZbAKU6LFuVaNnqAvsNTmoG8PC
	z1Ycssww3DtNN0hGG8Evr+MknW8uigC9TDobwKbfN19scDqvhA+s2epVzpQKnYeSHYDd
	Bu3hu1kwP7M6kPWtocTtcCrdrOLuvFcBSOSCQDQWo+Og9F/hjuMjukNxvKBnKb0ovMRA
	HFFY/xUq2R2R0dZvW/0bmlp4/DZIWPDytPCssQX3vI6kpnXlY4Xf186RlBoIENpyGY2p
	ifLg==
X-Received: by 10.68.164.225 with SMTP id yt1mr8379779pbb.195.1373010049274;
	Fri, 05 Jul 2013 00:40:49 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49])
	by mx.google.com with ESMTPSA id p2sm6968818pag.22.2013.07.05.00.40.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 00:40:48 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 16:40:30 +0900
Message-Id: <1373010030-16034-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkkobnQbgg3eZlSThUwHKMsqNtSXpYua+wmayvr54MHZX0WveXoxPu6sU1iygJwtTrpzfZJ
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH] gstreamer1.0-plugins: Fix method of specifying URI of the package source to SRC_URI
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
X-List-Received-Date: Fri, 05 Jul 2013 07:40:48 -0000

The present method overwrites all the data included in SRC_URL by URI of package source.
This adds URI of package source to original SRC_URI.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../gstreamer/gstreamer1.0-plugins.inc             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 9484b20..89c21c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -43,9 +43,9 @@ python __anonymous () {
     branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
 
     if pv == "git":
-        d.setVar("SRC_URI", "git://anongit.freedesktop.org/gstreamer/%s;branch=%s;protocol=git" % (gstpkg_basename, branch))
+        d.setVar("SRC_URI", d.getVar("SRC_URI") + " git://anongit.freedesktop.org/gstreamer/%s;branch=%s;protocol=git" % (gstpkg_basename, branch))
     else:
-        d.setVar("SRC_URI", "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv))
+        d.setVar("SRC_URI", d.getVar("SRC_URI") + " http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv))
 }
 
 delete_liblink_m4_file() {
-- 
1.7.9.5


