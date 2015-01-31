Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.online.nl (smtp03.online.nl [194.134.41.33])
	by mail.openembedded.org (Postfix) with ESMTP id 07F5D60024
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 14:06:17 +0000 (UTC)
Received: from smtp03.online.nl (localhost [127.0.0.1])
	by smtp03.online.nl (Postfix) with ESMTP id 30FEB68753;
	Sat, 31 Jan 2015 15:06:17 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.online.nl (Postfix) with ESMTP;
	Sat, 31 Jan 2015 15:06:17 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Jan 2015 15:06:12 +0100
Message-Id: <1422713174-18522-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp03.online.nl)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH 1/2] fetch2/__init__.py: Make get_srcrev output configurable
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
X-List-Received-Date: Sat, 31 Jan 2015 14:06:21 -0000

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
 lib/bb/fetch2/__init__.py |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
index 599ea8c..0eb1a23 100644
--- a/lib/bb/fetch2/__init__.py
+++ b/lib/bb/fetch2/__init__.py
@@ -618,7 +618,7 @@ def get_autorev(d):
         d.setVar('__BB_DONT_CACHE', '1')
     return "AUTOINC"
 
-def get_srcrev(d):
+def get_srcrev(d, method_name='sortable_revision'):
     """
     Return the revsion string, usually for use in the version string (PV) of the current package
     Most packages usually only have one SCM so we just pass on the call.
@@ -627,6 +627,9 @@ def get_srcrev(d):
 
     The idea here is that we put the string "AUTOINC+" into return value if the revisions are not 
     incremental, other code is then responsible for turning that into an increasing value (if needed)
+
+    A method_name can be supplied to retrieve an alternatively formatted revision from a fetcher, if
+    that fetcher provides a method with the given name and the same signature as sortable_revision.
     """
 
     scms = []
@@ -640,7 +643,7 @@ def get_srcrev(d):
         raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")
 
     if len(scms) == 1 and len(urldata[scms[0]].names) == 1:
-        autoinc, rev = urldata[scms[0]].method.sortable_revision(urldata[scms[0]], d, urldata[scms[0]].names[0])
+        autoinc, rev = getattr(urldata[scms[0]].method, method_name)(urldata[scms[0]], d, urldata[scms[0]].names[0])
         if len(rev) > 10:
             rev = rev[:10]
         if autoinc:
@@ -658,7 +661,7 @@ def get_srcrev(d):
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
-            autoinc, rev = ud.method.sortable_revision(ud, d, name)
+            autoinc, rev = getattr(ud.method, method_name)(ud, d, name)
             seenautoinc = seenautoinc or autoinc
             if len(rev) > 10:
                 rev = rev[:10]
-- 
1.7.9.5


