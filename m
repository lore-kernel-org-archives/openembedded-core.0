Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1UNjJ7-0002q2-IM
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 14:30:23 +0200
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 50E94408F4;
	Thu,  4 Apr 2013 13:28:37 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 14:12:57 +0200
Message-Id: <1365077577-477-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] python: adding missing runtime dependency python-io to python-pprint
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 12:30:28 -0000

When trying to import python-pprint on a minimal image, it reports that
the cStringIO python module is missing.
This is provided with python-io, so we add python-io as runtime
dependency.

The complete observed trace was:

Python 2.7.3 (default, Apr  4 2013, 07:45:36)
[GCC 4.7.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import pprint
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/pprint.py", line 40, in <module>
    from cStringIO import StringIO as _StringIO
ImportError: No module named cStringIO

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 84e5a0b..fb44905 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -175,7 +175,7 @@ RDEPENDS_${PN}-pkgutil="${PN}-core"
 FILES_${PN}-pkgutil="${libdir}/python2.7/pkgutil.* "
 
 DESCRIPTION_${PN}-pprint="Python Pretty-Print Support"
-RDEPENDS_${PN}-pprint="${PN}-core"
+RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
 FILES_${PN}-pprint="${libdir}/python2.7/pprint.* "
 
 DESCRIPTION_${PN}-profile="Python Basic Profiling Support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 22470f9..61a068c 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -319,7 +319,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility Support", "${PN}-core",
     "pkgutil.*")
 
-    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support", "${PN}-core",
+    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support", "${PN}-core ${PN}-io",
     "pprint.*" )
 
     m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "${PN}-core ${PN}-textutils",
-- 
1.7.9.5



