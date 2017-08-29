Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDD5782F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7108F18449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ce64HBOIdfiC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:34 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 092091842D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E881D1E096
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB1C31E095
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CF05B2122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TK0Whj009659
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:32 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TK0WNl009658
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Aug 2017 22:00:32 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 22:00:29 +0200
Message-Id: <67d6fbf684b8d011e19a35db0c037170222709fd.1504036763.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504036763.git.pkj@axis.com>
References: <cover.1504036763.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] bitbake: fetch2: Allow Fetch.download() to warn instead of error
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
X-List-Received-Date: Tue, 29 Aug 2017 20:00:35 -0000

Under some situations it can be allowed for Fetch.download() to fail
to fetch a file without causing bitbake to fail. By adding
only_warn=True as argument to Fetch.download(), it will call
logger.warning() instead of logger.error() and thus not cause build
failures.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 3eb0e4d211..58f65ada84 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1608,9 +1608,10 @@ class Fetch(object):
 
         return local
 
-    def download(self, urls=None):
+    def download(self, urls=None, only_warn=False):
         """
-        Fetch all urls
+        Fetch all urls. In case only_warn is True, a failure to fetch a url
+        will only result in a warning message, rather than an error message.
         """
         if not urls:
             urls = self.urls
@@ -1688,19 +1689,28 @@ class Fetch(object):
 
                 if not localpath or ((not os.path.exists(localpath)) and localpath.find("*") == -1):
                     if firsterr:
-                        logger.error(str(firsterr))
+                        if only_warn:
+                            logger.warning(str(firsterr))
+                        else:
+                            logger.error(str(firsterr))
                     raise FetchError("Unable to fetch URL from any source.", u)
 
                 update_stamp(ud, self.d)
 
             except IOError as e:
                 if e.errno in [os.errno.ESTALE]:
-                    logger.error("Stale Error Observed %s." % u)
+                    if only_warn:
+                        logger.warning("Stale Error Observed %s." % u)
+                    else:
+                        logger.error("Stale Error Observed %s." % u)
                     raise ChecksumError("Stale Error Detected")
 
             except BBFetchException as e:
                 if isinstance(e, ChecksumError):
-                    logger.error("Checksum failure fetching %s" % u)
+                    if only_warn:
+                        logger.warning("Checksum failure fetching %s" % u)
+                    else:
+                        logger.error("Checksum failure fetching %s" % u)
                 raise
 
             finally:
-- 
2.12.0


