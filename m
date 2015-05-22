Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob16.myregisteredsite.com
	(atl4mhob16.myregisteredsite.com [209.17.115.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6F949609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:29:12 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob16.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t4M6TBI6030928 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:29:11 -0400
Received: (qmail 784 invoked by uid 0); 22 May 2015 06:29:11 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 22 May 2015 06:29:10 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:29:03 +0200
Message-Id: <1432276145-31264-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH v2 1/3] fetch2/__init__.py: Make get_srcrev output configurable
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
X-List-Received-Date: Fri, 22 May 2015 06:29:13 -0000

From: Mike Looijmans <milo-software@users.sourceforge.net>

The idea here is to support package version numbering similar to gitpkgv in
meta-openembedded. This commit is the first step towards such functionality.

The original plan was to add a "get_pretty_srcrev" method to the fetcher, as
per Richard's suggestion [1]. While writing this, I noticed that it would
become a copy of get_srcrev with only two lines changed. So to create something
more Pythonic than a boolean argument and conditionals around the calls to the
fetcher's sortable_revision, I just made the method to be called on the fetcher
an argument to the method. Defaulting to 'sortable_revision' prevents affecting
existing code.

Now if the git fetcher were to implement, say 'gitpkgv_revision' one could
set the following in a recipe:
  PKGV="1.2+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
and this would yield the same result as gitpkgv's GITPKGV variable.

See for the discussion leading to this change:
[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 lib/bb/fetch2/__init__.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
index 31d9f01..958469d 100644
--- a/lib/bb/fetch2/__init__.py
+++ b/lib/bb/fetch2/__init__.py
@@ -720,7 +720,7 @@ def get_autorev(d):
         d.setVar('__BB_DONT_CACHE', '1')
     return "AUTOINC"
 
-def get_srcrev(d):
+def get_srcrev(d, method_name='sortable_revision'):
     """
     Return the revsion string, usually for use in the version string (PV) of the current package
     Most packages usually only have one SCM so we just pass on the call.
@@ -729,6 +729,9 @@ def get_srcrev(d):
 
     The idea here is that we put the string "AUTOINC+" into return value if the revisions are not 
     incremental, other code is then responsible for turning that into an increasing value (if needed)
+
+    A method_name can be supplied to retrieve an alternatively formatted revision from a fetcher, if
+    that fetcher provides a method with the given name and the same signature as sortable_revision.
     """
 
     scms = []
@@ -742,7 +745,7 @@ def get_srcrev(d):
         raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")
 
     if len(scms) == 1 and len(urldata[scms[0]].names) == 1:
-        autoinc, rev = urldata[scms[0]].method.sortable_revision(urldata[scms[0]], d, urldata[scms[0]].names[0])
+        autoinc, rev = getattr(urldata[scms[0]].method, method_name)(urldata[scms[0]], d, urldata[scms[0]].names[0])
         if len(rev) > 10:
             rev = rev[:10]
         if autoinc:
@@ -760,7 +763,7 @@ def get_srcrev(d):
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
-            autoinc, rev = ud.method.sortable_revision(ud, d, name)
+            autoinc, rev = getattr(ud.method, method_name)(ud, d, name)
             seenautoinc = seenautoinc or autoinc
             if len(rev) > 10:
                 rev = rev[:10]
-- 
1.9.1


