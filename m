Received: from smarthost.mvista.com ([206.112.117.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QFWI1-0007PV-78
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 20:50:23 +0200
Received: from scratch-1.sh.mvista.com (scratch-1.sh.mvista.com [10.40.0.72])
	by smarthost.mvista.com (Postfix) with ESMTP id 5E2A898056;
	Thu, 28 Apr 2011 11:10:39 -0700 (PDT)
Received: from jpuhlman by scratch-1.sh.mvista.com with local (Exim 4.63)
	(envelope-from <jpuhlman@scratch-1.sh.mvista.com>)
	id 1QFVfj-000075-B1; Thu, 28 Apr 2011 11:10:39 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2011 11:09:39 -0700
Message-Id: <1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <RFC: Layer tooling brainstorming>
References: <RFC: Layer tooling brainstorming>
Cc: chris_larson@mentor.com
Subject: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Thu, 28 Apr 2011 18:50:23 -0000

The bulk of this patch is based on Chris Larson's collection.inc,
but refactored for use inside bitbake, and for layers.

Adds two new configuration options:

LAYER_UNPACKDIR - directory to unpack downloaded layers for use in configuration.
LAYER_REMOTE_STASH - location to store downloaded layers for use in configuration.

Layers can be specified in the current manner:
BBLAYERS = " \
   /path/to/layer/one \
   /path/to/layer/two \
"

Or you can specify uris:

BBLAYERS = " \
	http://url.to.my.tarball/tarball.tar.gz \
	git://gitserver.com/git/repo;proto=http \
        /path/to/layer/three \
        file:///path/to/layer/four \
"

Currently there is a single layer option, that can be added to a uri, layerBase=<subpath>.
This option would be used to specify if a layer starts somewhere other then the base of the
tarball/scm repository. For example if you wanted to add oe-core you would do:

BBLAYERS  = "git://git.openembedded.org/openembedded-core;protocol=git;tag=master;layerBase=meta"

Currently for fetch the following uris should work  : 'git','http','https','ftp','file'
Currently for fetch2 the following uris should work : 'git','http','https','ftp','file','svn'

There are certainly some ugly bits in here, and there are certainly lots of places to improve,
but this gets a good chunk of the base support in.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 lib/bb/cooker.py       |    3 +-
 lib/bb/fetch/layer.py  |   65 ++++++++++++++++
 lib/bb/fetch2/layer.py |   76 ++++++++++++++++++
 lib/bb/remotelayer.py  |  197 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 340 insertions(+), 1 deletions(-)
 create mode 100644 lib/bb/fetch/layer.py
 create mode 100644 lib/bb/fetch2/layer.py
 create mode 100644 lib/bb/remotelayer.py

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index d4415d3..0099a65 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -575,6 +575,7 @@ class BBCooker:
             path, _ = os.path.split(path)
 
     def parseConfigurationFiles(self, files):
+        from bb.remotelayer import RemoteLayers
         data = self.configuration.data
         bb.parse.init_parser(data)
         for f in files:
@@ -586,7 +587,7 @@ class BBCooker:
             data = _parse(layerconf, data)
 
             layers = (bb.data.getVar('BBLAYERS', data, True) or "").split()
-
+            layers = RemoteLayers(layers,data,parselog).getLayers()
             data = bb.data.createCopy(data)
             for layer in layers:
                 parselog.debug(2, "Adding layer %s", layer)
diff --git a/lib/bb/fetch/layer.py b/lib/bb/fetch/layer.py
new file mode 100644
index 0000000..3b0d319
--- /dev/null
+++ b/lib/bb/fetch/layer.py
@@ -0,0 +1,65 @@
+"""
+BitBake 'layer' fetch implementation.
+
+"""
+
+# Copyright (C) 2011 Jeremy Puhlman 
+#
+#   Classes for obtaining upstream sources for the
+#   BitBake build tools.
+#   Copyright (C) 2003, 2004  Chris Larson
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+class LayerFetch:
+
+    def __init__(self, url, pathurl, logger, ld):
+	self.parselog = logger
+	self.tarballpath = self._fetch(url,pathurl,ld)
+
+    def supported(self, ud):
+	return ud.type in ['git','http','https','ftp','file']
+
+    def getTarballPath(self):
+        return self.tarballpath
+
+    def _fetch(self, url, pathurl, ld):
+        urldata = {}
+        try:
+            urldata[url] = bb.fetch.FetchData(url,ld)
+        except bb.fetch.NoMethodError: 
+            self.parselog.debug(1, "No method for %s" % url)
+            return
+        ud = urldata[url]
+        filename=os.path.basename(ud.path)
+
+	if not self.supported(ud):
+           bb.fatal("Layer fetching does not support %s uris" % ud.type)
+        if not ud.setup:
+           ud.setup_localpath(ld)
+        m = ud.method
+        tarballpath = bb.fetch.localpath(url, ld)
+        if os.path.exists(tarballpath) :
+           return tarballpath
+        try: 
+           m.go(url,ud,ld)
+        except (bb.fetch.MissingParameterError,
+           bb.fetch.FetchError,
+           bb.fetch.MD5SumError):
+
+           import sys
+           (type, value, traceback) = sys.exc_info()
+           self.parselog.debug(1, "layer fetch failure: %s" % value)
+           return
+        return tarballpath
diff --git a/lib/bb/fetch2/layer.py b/lib/bb/fetch2/layer.py
new file mode 100644
index 0000000..09de8a0
--- /dev/null
+++ b/lib/bb/fetch2/layer.py
@@ -0,0 +1,76 @@
+"""
+BitBake 'layer' fetch2 implementation.
+
+"""
+
+# Copyright (C) 2011 Jeremy Puhlman 
+#
+#   Classes for obtaining upstream sources for the
+#   BitBake build tools.
+#   Copyright (C) 2003, 2004  Chris Larson
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+class LayerFetch:
+
+    def __init__(self, url, pathurl, logger, ld):
+	self.parselog = logger
+	self.tarballpath = self._fetch(url,pathurl,ld)
+
+    def supported(self, ud):
+	return ud.type in ['git','http','https','ftp', 'svn', 'file']
+
+    def getTarballPath(self):
+        return self.tarballpath
+
+    def _fetch(self, url, pathurl, ld):
+        urldata = {}
+        layer_unpackdir =  ld.getVar("LAYER_UNPACKDIR", True)		
+        try:
+            urldata[url] = bb.fetch.FetchData(url,ld)
+        except bb.fetch.NoMethodError: 
+            self.parselog.debug(1, "No method for %s" % url)
+            return
+        ud = urldata[url]
+        filename=os.path.basename(ud.path)
+
+	if not self.supported(ud):
+           bb.fatal("Layer fetching does not support %s uris" % ud.type)
+        if not ud.setup:
+           ud.setup_localpath(ld)
+        m = ud.method
+	if ud.type not in ['git']:
+              tarballpath = bb.fetch.localpath(url, ld)
+              if os.path.exists(bb.fetch.localpath(url, ld)) :
+                 return tarballpath		
+        try: 
+           m.download(url,ud,ld)
+        except (bb.fetch.MissingParameterError,
+           bb.fetch.FetchError,
+           bb.fetch.MD5SumError):
+
+           import sys
+           (type, value, traceback) = sys.exc_info()
+           self.parselog.debug(1, "layer fetch failure: %s" % value)
+           return
+	
+	if ud.type in ['git']:
+           unpackedscm = "%s/%s" % (layer_unpackdir, ud.mirrortarball)
+           if m.need_update(url,ud,ld):
+              m.build_mirror_data(url, ud,ld)
+              m.unpack(ud, unpackedscm ,ld)
+           tarballpath = unpackedscm + "/git" 
+
+        return tarballpath
+
diff --git a/lib/bb/remotelayer.py b/lib/bb/remotelayer.py
new file mode 100644
index 0000000..2a61e71
--- /dev/null
+++ b/lib/bb/remotelayer.py
@@ -0,0 +1,197 @@
+"""
+BitBake 'remote layer' handling.
+
+"""
+
+# Copyright (C) 2011 Jeremy Puhlman 
+#
+#   Classes for obtaining upstream sources for the
+#   BitBake build tools.
+#   Copyright (C) 2003, 2004  Chris Larson
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+class RemoteLayers:
+    """
+    Get remote layers.
+    """
+
+    def __init__(self, layers, data, logger):
+        self.parselog = logger
+        self.layers = self._getRemoteLayers(layers, data)
+
+    def getLayers(self):
+        return self.layers    
+
+    """
+    Ugly. We have not loaded bitbake.conf yet, and need the values set for fetching to work
+    Could load preliminary bitbake.conf, but this works.
+    """
+    def _setFetchValues(self,data):
+	"""Need these for any fetching to work"""
+        def setifunset(d,k,v): 
+           if d.getVar(k,0) is None:
+                d.setVar(k,v)
+
+        setifunset(data, "TMPDIR", "${TOPDIR}/tmp")
+        setifunset(data, "LAYER_REMOTE_STASH", "${TMPDIR}/layers-remote")
+        setifunset(data, "LAYER_UNPACKDIR", "${TMPDIR}/layers")
+
+        ld = data.createCopy()
+        """Provide settings for fetchers.""" 
+        setifunset(ld, "CACHE", "${TMPDIR}/cache")
+        setifunset(ld, "OVERRIDES", "")
+        setifunset(ld, "CVSDIR", "${DL_DIR}/cvs")
+        setifunset(ld, "GITDIR", "${DL_DIR}/git")
+        setifunset(ld, "SVNDIR", "${DL_DIR}/svn")
+        setifunset(ld, "FETCHCOMMAND", "")
+        setifunset(ld, "FETCHCOMMAND_cvs", "/usr/bin/env cvs -d${CVSROOT} co ${CVSCOOPTS} ${CVSMODULE}")
+        setifunset(ld, "FETCHCOMMAND_svn", "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}")
+        setifunset(ld, "FETCHCOMMAND_wget", "/usr/bin/env wget -t 5 -q --passive-ftp -P ${DL_DIR} ${URI}")
+        setifunset(ld, "FETCHCMD_cvs", "/usr/bin/env cvs ")
+        setifunset(ld, "FETCHCMD_svn", "/usr/bin/env svn ")
+        setifunset(ld, "FETCHCMD_bzr", "/usr/bin/env bzr ")
+        setifunset(ld, "FETCHCMD_hg", "/usr/bin/env hg ")
+        setifunset(ld, "FETCHCMD_wget", "/usr/bin/env wget -t 5 -q")
+        setifunset(ld, "CHECKCOMMAND_wget", "/usr/bin/env wget --spider -t 5 --passive-ftp -P ${DL_DIR} '${URI}'")
+        setifunset(ld, "UPDATECOMMAND", "")
+        setifunset(ld, "UPDATECOMMAND_cvs", "/usr/bin/env cvs -d${CVSROOT} update ${CVSCOOPTS}")
+        setifunset(ld, "UPDATECOMMAND_svn", "/usr/bin/env svn update ${SVNCOOPTS}")
+        setifunset(ld, "BB_GENERATE_MIRROR_TARBALLS", "1")
+
+        localdir=data.getVar("LAYER_REMOTE_STASH", 1)
+
+        if not os.path.isdir(localdir):
+            bb.utils.mkdirhier(localdir)
+        ld.setVar("DL_DIR", localdir)
+        ld.delVar("MIRRORS")
+        ld.delVar("PREMIRRORS")
+        ld.delVar("SRC_TARBALL_STASH")
+	return ld 
+    
+    """
+    Unpack remote layer. Code largely pulled from collections.inc
+    """
+    def _layerUnpack(self, layer, data):
+        """ Unpack a layer archive and return the path to it. """
+        from hashlib import md5
+
+        handlers = {
+            ("tar"): "tar x --no-same-owner -f %s",
+            ("tar.gz", "tgz", "tar.Z"): "tar xz --no-same-owner -f %s",
+            ("tar.bz2", "tbz", "tbz2"): "tar xj --no-same-owner -f %s",
+            ("zip", "jar"): "unzip -q -o %s",
+        }
+        basename = os.path.basename(layer)
+        try:
+            cmd, name = ((cmd, basename[:-len(e)-1]) for (exts, cmd) in handlers.iteritems()
+                         for e in exts
+                         if basename.endswith(e)).next()
+        except StopIteration:
+            bb.fatal("No method available to unpack %s (unsupported file type?)" % layer)
+        else:
+            outpath = os.path.join(data.getVar("LAYER_UNPACKDIR", 1), name)
+            cmd = "cd %s && PATH=\"%s\" %s" % (outpath, data.getVar("PATH", 1), cmd)
+
+        try:
+            layerdata = open(layer, "r").read()
+        except IOError:
+            bb.fatal("Unable to open %s to calculate md5 sum" % layer)
+
+        md5obj = md5()
+        md5obj.update(layerdata)
+        md5sum = md5obj.hexdigest()
+        md5file = os.path.join(outpath, "md5")
+        if os.path.exists(md5file):
+            try:
+                oldmd5sum = open(md5file).read()
+            except IOError:
+                pass
+            else:
+                if oldmd5sum == md5sum:
+                    self.parselog.debug(1, "Using existing %s for layer '%s'" % (outpath, name))
+                    return outpath, name
+
+            self.parselog.plain("Removing old unpacked layer at %s" % outpath)
+        
+        if not os.path.isdir(outpath):
+            os.makedirs(outpath)
+
+        self.parselog.debug(1,"Unpacking %s to %s/" % (layer, outpath))
+        ret = os.system(cmd % layer)
+        if ret != 0:
+            bb.fatal("Unable to unpack %s" % layer)
+        md5out = open(md5file, "w")
+        md5out.write(md5sum)
+        md5out.close()
+        return outpath, name
+
+    """
+    Add method for grab layer specific data from uri.
+    """
+    def _getLayerSettings(self, urlinfo):
+        layersettings={}
+        layersettingslist = ["layerBase"]
+        for setting in urlinfo.path.split(";") + urlinfo.params.split(";"):
+            for layersetting in layersettingslist:
+                if setting.startswith("%s=" % layersetting):
+                    layersettings[layersetting] = setting.split("=")[1]
+        return [layersettings]
+
+    """
+    Main hooks for grabing remote layers
+    """
+    def _getRemoteLayers(self, layers, data):
+        from itertools import izip, chain
+        from glob import glob
+        from urlparse import urlparse, urlunparse
+	from bb.fetch.layer import LayerFetch
+        if not layers:
+            return []
+    
+        globbed = []
+        layersettings = []
+        localpath = ""
+	ld = self._setFetchValues(data)
+        for path in layers:
+            pathurl = urlparse(path)
+            layersettings += self._getLayerSettings(pathurl)
+            if not pathurl[0]:
+                localpath = glob(os.path.normpath(path))
+            else:
+                tarballpath = LayerFetch(path,pathurl,self.parselog, ld).getTarballPath()
+                if tarballpath:
+                    localpath=[tarballpath]
+            if not localpath:
+                self.parselog.plain("No matches in filesystem for %s in BBLAYERS" % path)
+            globbed += localpath
+        layers = globbed
+        layers_unpacked = ""
+        for (layer, settings) in izip(layers, layersettings):
+            origpath = layer
+            basepath=""
+            if "layerBase" in settings:
+               basepath = settings["layerBase"]
+            if not os.path.isdir(layer):
+                unpacked, name = self._layerUnpack(layer, ld)
+                if unpacked:
+                    layer = unpacked
+                    for dir in glob("%s/*/" % layer):
+                        layerdir = dir + "/" +  basepath
+                        layers_unpacked += layerdir + " "
+            else:
+                layers_unpacked += layer + "/" + basepath + " "
+        return layers_unpacked.encode('ascii').split()
+
+
-- 
1.7.3.2



