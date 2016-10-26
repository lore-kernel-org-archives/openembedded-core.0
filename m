Return-Path: <ejo@pengutronix.de>
X-Greylist: delayed 1490 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Oct 2016 08:10:42 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 8373771AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:10:42 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzIuM-0007zS-KE; Wed, 26 Oct 2016 09:45:58 +0200
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.87)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzIuG-0000ln-U6; Wed, 26 Oct 2016 09:45:52 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 09:45:40 +0200
Message-Id: <20161026074540.621-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161026074540.621-1-ejo@pengutronix.de>
References: <20161026074540.621-1-ejo@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH] python-3.5-manifest.inc: the signal module RDEPENDS on enum
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
X-List-Received-Date: Wed, 26 Oct 2016 08:10:43 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ python3
>>> import signal
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/path/to/sdk/sysroots/x86_64-pokysdk-linux/usr/lib/python3.5/signal.py", line 4, in <module>
    from enum import IntEnum as _IntEnum
ImportError: No module named 'enum'

(From OE-Core rev: 6306dc8351c19059c4c2a8e75bb5733e64532732)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b9c2fec..bc6842b 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -206,7 +206,7 @@ RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
 FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/shutil.* "
 
 SUMMARY_${PN}-signal="Python set handlers for asynchronous events support"
-RDEPENDS_${PN}-signal="${PN}-core"
+RDEPENDS_${PN}-signal="${PN}-core ${PN}-enum"
 FILES_${PN}-signal="${libdir}/python3.5/signal.* "
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 3a88018..9f53dbe 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -345,7 +345,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core",
+    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core ${PN}-enum",
     "signal.*" )
 
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading ${PN}-signal ${PN}-selectors",
-- 
2.9.3


