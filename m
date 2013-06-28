Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id DBC906AED0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:57:31 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 06CD340084;
	Fri, 28 Jun 2013 11:00:41 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 11:57:12 +0200
Message-Id: <1372413432-30545-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1372413432-30545-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1372413432-30545-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [PATCH 2/2] python-multiprocessing: adding runtime dependencies
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
X-List-Received-Date: Fri, 28 Jun 2013 09:57:32 -0000

As python-multiprocessing requires python-threading and
python-pickle, this commit adds them as runtime dependency.

The observed behavior was:

When typing 'import multiprocessing' in the python shell on a
minimal image with only the python-multiprocessing recipe installed,
python reports at first:

Python 2.7.3 (default, Jun 27 2013, 08:26:25)
[GCC 4.7.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing;
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/multiprocessing/__init__.py", line 65, in <module>
    from multiprocessing.util import SUBDEBUG, SUBWARNING
  File "/usr/lib/python2.7/multiprocessing/util.py", line 38, in <module>
    import threading        # we want threading to install it's
ImportError: No module named threading

After adding python-threading as runtime dependency and rebuilding
the image, python reports:

Python 2.7.3 (default, Jun 27 2013, 08:26:25)
[GCC 4.7.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing;
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/multiprocessing/__init__.py", line 84, in <module>
    import _multiprocessing
ImportError: No module named cPickle

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index fb44905..ca5d282 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -151,7 +151,7 @@ RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
 FILES_${PN}-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
 
 DESCRIPTION_${PN}-multiprocessing="Python Multiprocessing Support"
-RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang"
+RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading"
 FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
 
 DESCRIPTION_${PN}-netclient="Python Internet Protocol Clients"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 61a068c..b884432 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -300,7 +300,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.so " )
 
-    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing Support", "${PN}-core ${PN}-io ${PN}-lang",
+    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading",
     "lib-dynload/_multiprocessing.so multiprocessing" ) # package
 
     m.addPackage( "${PN}-netclient", "Python Internet Protocol Clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
-- 
1.7.9.5


