Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyhzA-0001nF-EY for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 13:30:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BIJS3010100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 12:18:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09711-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 12:18:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BIBWo010093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 12:18:12 +0100
Message-ID: <1344338293.9756.219.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 12:18:13 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python: Fix RPATH QA issue on non-gplv3 builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 11:30:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On non-gplv3 builds, gdbm gets built different due to the different version
which triggers a different codepath in python's db support and then hence
triggers an invalid RPATH QA issue. This change extends the appropriate patch
to cover the code paths we need it to cover and avoid adding the problematic
RPATH.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch b/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
index 4b8953a..dfd346f 100644
--- a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
+++ b/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
@@ -1,15 +1,14 @@
-Remove the RPTH to avoid QA issue warning.
+Remove the RPATH to avoid QA issue warning.
 
+RP: Added secondary unnecessary rpath to the list 2012/8/7
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- setup.py |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index 83b5e56..1fd5487 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1025,7 +1025,6 @@ class PyBuildExt(build_ext):
+
+Index: Python-2.7.3/setup.py
+===================================================================
+--- Python-2.7.3.orig/setup.py	2012-08-07 10:41:58.560132529 +0000
++++ Python-2.7.3/setup.py	2012-08-07 11:09:47.852094515 +0000
+@@ -1042,7 +1042,6 @@
              exts.append(Extension('_bsddb', ['_bsddb.c'],
                                    depends = ['bsddb.h'],
                                    library_dirs=dblib_dir,
@@ -17,6 +16,11 @@ index 83b5e56..1fd5487 100644
                                    include_dirs=db_incs,
                                    libraries=dblibs))
          else:
--- 
-1.7.4
-
+@@ -1252,7 +1251,6 @@
+                         print "building dbm using bdb"
+                         dbmext = Extension('dbm', ['dbmmodule.c'],
+                                            library_dirs=dblib_dir,
+-                                           runtime_library_dirs=dblib_dir,
+                                            include_dirs=db_incs,
+                                            define_macros=[
+                                                ('HAVE_BERKDB_H', None),




