Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7244173905
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 21:22:55 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so119165923pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=REcroGm5d11wgQLvJ7Nmul4VkAxixLxgsR89gaHgCuQ=;
	b=Hn6HMYuACYh4A40s9Nie7H7AWIxs5Yw0pX7Z8KRYZ/LXBSaKF+7U069vQBM18WpRdh
	IpuX96mMudGIys1g2PsTHSAIV6tu0ys+r2eaV1bCNqQ64NCdpo0Nc+bSIyDS9BRKKnJF
	HMdTbMOZguSWZvYvZ6HBvyZEbxGcicU6uR8tPC0WNHPhj6rWvR18M0/KlYzk4t5htqQJ
	RItoLCRL5Oyw386G43tIv1HzEmta7e22y5Tn99eCaZn6lXGW9KtaRyw7C/TWqgA6CqIi
	Dy2KTPIiwrP2ywNScG5WyzcrXnoWPeIgD9mDaOK+NluNUmZad+F/NsvZA+hkh04SS564
	DQaA==
X-Received: by 10.68.243.9 with SMTP id wu9mr12950532pbc.28.1436304176011;
	Tue, 07 Jul 2015 14:22:56 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by smtp.gmail.com with ESMTPSA id pq3sm67605pbb.24.2015.07.07.14.22.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Jul 2015 14:22:55 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jul 2015 14:22:54 -0700
Message-Id: <1436304174-24460-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] python-io: Add runtime dependency on contextlib
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
X-List-Received-Date: Tue, 07 Jul 2015 21:23:02 -0000

The python-io package includes ssl.py module which imports the
contextlib library.

This applied to Python 2.7.9 but not 3.3.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 9ba9c7f..dd8d825 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -130,7 +130,7 @@ RDEPENDS_${PN}-importlib="${PN}-core"
 FILES_${PN}-importlib="${libdir}/python2.7/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient"
+RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index a368c8a..936522e 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -275,7 +275,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient",
+    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib",
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-- 
2.1.4


