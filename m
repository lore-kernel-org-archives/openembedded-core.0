Return-Path: <liu.ming50@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 345DE731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:04:37 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id i7so4593336wjf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KF/0H+ihYVBULUye2Qfth3eudpDUIBxTaijnOvOD1Co=;
	b=R8zJ4HNkz3C1BZtjcoi+X4g2mXFQkQLkT28Tk6WrDEwBy2JrvobUtnMSDmHdcL/MSs
	dsByTS55iUSz+q6yjXwIm331hjXeNXcm9Y+4/UsszD+55Uk5E/ncIT7S0dBTe/KloynI
	IXhDin7UOhvEzNMBokwSui0PPtAHgNvfGH/LyR7D29r2f9FZBoR0pi1FaA2y4ZPWFuT5
	UR51kSNGs+BjcrlRA72lfvp3PWkS4ITY3MwQ9HLkYuuRdFJs3XCXFobyU9JQGQyuQzYD
	qRU2myqfz4aXopKXMTezNWhAlhWB9adiMzRx260MLsO3AFAJ82z2Tg2a4bjHX2GEKASP
	xQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KF/0H+ihYVBULUye2Qfth3eudpDUIBxTaijnOvOD1Co=;
	b=Us3XYDJK0R4Fzcf8sgPioUw48AcTEUhTGpwMKFo27KCx429PMLeJabIkXSa4mF+aiU
	Z/rRxXv1I2JJKhHLGpQCBEGX1qoP2XCI+lNZztOTIHt2+m8wHuXohcSrcFad+pA7AEzc
	W9TrFjHPouECoCJeRmaeARI9WedwdCt9UqxJbYKgkvmAq8CVsxkOjh3R6EbL4yTfGG7m
	D8g2dIS7/how2QqeA8Hwbs0QqATPkEczckx6sovfjq0fgnRrAC1nie6qWcASSvXjbGGQ
	IEzT7TlYJ1X1ADUJw/0MV9m/h5RMItW9hGWJiIfezhDJSZqoLwcOQ1ePsjWW+xgpSqen
	xUyw==
X-Gm-Message-State: AIkVDXLNUkDEHhV6DZ6n7RzdfVAqnPgXZyct9puVMkV63P0o26YCGkO22cERQuw8ZRfMwA==
X-Received: by 10.223.136.197 with SMTP id g5mr2550520wrg.56.1485435877999;
	Thu, 26 Jan 2017 05:04:37 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	z67sm2465893wrb.49.2017.01.26.05.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:04:37 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:04:28 +0100
Message-Id: <1485435868-1879-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] package_manager.py: fix issues when dealing with FEED_DEPLOYDIR_BASE_URI
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
X-List-Received-Date: Thu, 26 Jan 2017 13:04:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

There are several flaws need fixing them:
- The "/etc/opkg" should be "etc/opkg" when being passed to os.path.join
- /etc/opkg directory does not exist in image rootfs, need create it.
- There is a "\n" missing when writing path to feed conf file.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/lib/oe/package_manager.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f92f2b3..5d57563 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1662,14 +1662,12 @@ class OpkgPM(OpkgDpkgPM):
             NOTE: Development-helper feature, NOT a full-fledged feed.
             """
             if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
+                cfg_dir_name = os.path.join(self.target_rootfs, "etc/opkg")
+                bb.utils.mkdirhier(cfg_dir_name)
                 for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfdir"),
-                                                 "opkg",
-                                                 "local-%s-feed.conf" % arch)
-
+                    cfg_file_name = os.path.join(cfg_dir_name, "local-%s-feed.conf" % arch)
                     with open(cfg_file_name, "w+") as cfg_file:
-                        cfg_file.write("src/gz local-%s %s/%s" %
+                        cfg_file.write("src/gz local-%s %s/%s\n" %
                                        (arch,
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
                                         arch))
-- 
1.9.1


