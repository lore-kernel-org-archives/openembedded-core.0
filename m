Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86C5165C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:22:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Sep 2014 09:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,492,1406617200"; d="scan'208";a="570646550"
Received: from unknown (HELO localhost) ([10.255.12.151])
	by orsmga001.jf.intel.com with ESMTP; 09 Sep 2014 09:22:00 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 11:21:59 -0500
Message-Id: <c13a20c3111cb56d770c8800315b3d5800e111cc.1410279539.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1410279539.git.tom.zanussi@linux.intel.com>
References: <cover.1410279539.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: Completely remove all urlgrabber references
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
X-List-Received-Date: Tue, 09 Sep 2014 16:22:19 -0000

The previous commit, 'wic: Remove 3rdparty/urlgrabber' didn't actually
remove all references to urlgrabber - this does however.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/3rdparty/pykickstart/parser.py  | 87 +------------------------
 scripts/lib/wic/3rdparty/pykickstart/version.py | 29 ---------
 2 files changed, 2 insertions(+), 114 deletions(-)

diff --git a/scripts/lib/wic/3rdparty/pykickstart/parser.py b/scripts/lib/wic/3rdparty/pykickstart/parser.py
index 840a448..9c9674b 100644
--- a/scripts/lib/wic/3rdparty/pykickstart/parser.py
+++ b/scripts/lib/wic/3rdparty/pykickstart/parser.py
@@ -38,8 +38,6 @@ import sys
 import tempfile
 from copy import copy
 from optparse import *
-from urlgrabber import urlread
-import urlgrabber.grabber as grabber
 
 import constants
 from errors import KickstartError, KickstartParseError, KickstartValueError, formatErrorMsg
@@ -55,87 +53,6 @@ STATE_COMMANDS = "commands"
 
 ver = version.DEVEL
 
-def _preprocessStateMachine (lineIter):
-    l = None
-    lineno = 0
-
-    # Now open an output kickstart file that we are going to write to one
-    # line at a time.
-    (outF, outName) = tempfile.mkstemp("-ks.cfg", "", "/tmp")
-
-    while True:
-        try:
-            l = lineIter.next()
-        except StopIteration:
-            break
-
-        # At the end of the file?
-        if l == "":
-            break
-
-        lineno += 1
-        url = None
-
-        ll = l.strip()
-        if not ll.startswith("%ksappend"):
-            os.write(outF, l)
-            continue
-
-        # Try to pull down the remote file.
-        try:
-            ksurl = ll.split(' ')[1]
-        except:
-            raise KickstartParseError, formatErrorMsg(lineno, msg=_("Illegal url for %%ksappend: %s") % ll)
-
-        try:
-            url = grabber.urlopen(ksurl)
-        except grabber.URLGrabError, e:
-            raise KickstartError, formatErrorMsg(lineno, msg=_("Unable to open %%ksappend file: %s") % e.strerror)
-        else:
-            # Sanity check result.  Sometimes FTP doesn't catch a file
-            # is missing.
-            try:
-                if url.size < 1:
-                    raise KickstartError, formatErrorMsg(lineno, msg=_("Unable to open %%ksappend file"))
-            except:
-                raise KickstartError, formatErrorMsg(lineno, msg=_("Unable to open %%ksappend file"))
-
-        # If that worked, write the remote file to the output kickstart
-        # file in one burst.  Then close everything up to get ready to
-        # read ahead in the input file.  This allows multiple %ksappend
-        # lines to exist.
-        if url is not None:
-            os.write(outF, url.read())
-            url.close()
-
-    # All done - close the temp file and return its location.
-    os.close(outF)
-    return outName
-
-def preprocessFromString (s):
-    """Preprocess the kickstart file, provided as the string str.  This
-        method is currently only useful for handling %ksappend lines,
-        which need to be fetched before the real kickstart parser can be
-        run.  Returns the location of the complete kickstart file.
-    """
-    i = iter(s.splitlines(True) + [""])
-    rc = _preprocessStateMachine (i.next)
-    return rc
-
-def preprocessKickstart (f):
-    """Preprocess the kickstart file, given by the filename file.  This
-        method is currently only useful for handling %ksappend lines,
-        which need to be fetched before the real kickstart parser can be
-        run.  Returns the location of the complete kickstart file.
-    """
-    try:
-        fh = urlopen(f)
-    except grabber.URLGrabError, e:
-        raise KickstartError, formatErrorMsg(0, msg=_("Unable to open input kickstart file: %s") % e.strerror)
-
-    rc = _preprocessStateMachine (iter(fh.readlines()))
-    fh.close()
-    return rc
 
 class PutBackIterator(Iterator):
     def __init__(self, iterable):
@@ -682,8 +599,8 @@ class KickstartParser:
         self.currentdir[self._includeDepth] = cd
 
         try:
-            s = urlread(f)
-        except grabber.URLGrabError, e:
+            s = file(f).read()
+        except IOError, e:
             raise KickstartError, formatErrorMsg(0, msg=_("Unable to open input kickstart file: %s") % e.strerror)
 
         self.readKickstartFromString(s, reset=False)
diff --git a/scripts/lib/wic/3rdparty/pykickstart/version.py b/scripts/lib/wic/3rdparty/pykickstart/version.py
index 102cc37..8a8e6aa 100644
--- a/scripts/lib/wic/3rdparty/pykickstart/version.py
+++ b/scripts/lib/wic/3rdparty/pykickstart/version.py
@@ -44,7 +44,6 @@ This module also exports several functions:
                       have a version= comment in it.
 """
 import imputil, re, sys
-from urlgrabber import urlopen
 
 import gettext
 _ = lambda x: gettext.ldgettext("pykickstart", x)
@@ -132,34 +131,6 @@ def versionToString(version, skipDevel=False):
 
     raise KickstartVersionError(_("Unsupported version specified: %s") % version)
 
-def versionFromFile(f):
-    """Given a file or URL, look for a line starting with #version= and
-       return the version number.  If no version is found, return DEVEL.
-    """
-    v = DEVEL
-
-    fh = urlopen(f)
-
-    while True:
-        try:
-            l = fh.readline()
-        except StopIteration:
-            break
-
-        # At the end of the file?
-        if l == "":
-            break
-
-        if l.isspace() or l.strip() == "":
-            continue
-
-        if l[:9] == "#version=":
-            v = stringToVersion(l[9:].rstrip())
-            break
-
-    fh.close()
-    return v
-
 def returnClassForVersion(version=DEVEL):
     """Return the class of the syntax handler for version.  version can be
        either a string or the matching constant.  Raises KickstartValueError
-- 
1.8.3.1


