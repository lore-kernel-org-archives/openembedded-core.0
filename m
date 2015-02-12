Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1663F732A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:56:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C1ubL2005023
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 17:56:37 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Feb 2015 17:56:37 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Thu, 12 Feb 2015 09:50:23 +0800
Message-ID: <5cc744c385eb41259c26596014eab49eec622729.1423705692.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423705692.git.Chong.Lu@windriver.com>
References: <cover.1423705692.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 2/2] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Thu, 12 Feb 2015 01:56:39 -0000
Content-Type: text/plain

Add a command to query layer dependencies from layer index. Fetch layer and its
dependency layers and add them into conf/bblayers.conf.

[YOCTO #5348]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 bitbake/bin/bitbake-layers | 244 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/bitbake/bin/bitbake-layers b/bitbake/bin/bitbake-layers
index 9879498..699424f 100755
--- a/bitbake/bin/bitbake-layers
+++ b/bitbake/bin/bitbake-layers
@@ -27,6 +27,8 @@ import sys
 import fnmatch
 from collections import defaultdict
 import re
+import httplib, urlparse, json
+import subprocess
 
 bindir = os.path.dirname(__file__)
 topdir = os.path.dirname(bindir)
@@ -157,6 +159,248 @@ usage: remove-layer <layerdir>
                 sys.stderr.write("No layers matching %s found in BBLAYERS\n" % item)
 
 
+    def get_json_data(self, apiurl):
+        proxy_settings = os.environ.get("http_proxy", None)
+        conn = None
+        _parsedurl = urlparse.urlparse(apiurl)
+        path = _parsedurl.path
+        query = _parsedurl.query
+        def parse_url(url):
+            parsedurl = urlparse.urlparse(url)
+            if parsedurl.netloc[0] == '[':
+                host, port = parsedurl.netloc[1:].split(']', 1)
+                if ':' in port:
+                    port = port.rsplit(':', 1)[1]
+                else:
+                    port = None
+            else:
+                if parsedurl.netloc.count(':') == 1:
+                    (host, port) = parsedurl.netloc.split(":")
+                else:
+                    host = parsedurl.netloc
+                    port = None
+            return (host, 80 if port is None else int(port))
+
+        if proxy_settings is None:
+            host, port = parse_url(apiurl)
+            conn = httplib.HTTPConnection(host, port)
+            conn.request("GET", path + "?" + query)
+        else:
+            host, port = parse_url(proxy_settings)
+            conn = httplib.HTTPConnection(host, port)
+            conn.request("GET", apiurl)
+
+        r = conn.getresponse()
+        if r.status != 200:
+            raise Exception("Failed to read " + path + ": %d %s" % (r.status, r.reason))
+        return json.loads(r.read())
+
+
+    def get_layer_deps(self, layername, layeritems, layerbranches, layerdependencies, branchnum, selfname=False):
+        def layeritems_info_id(items_name, layeritems):
+            litems_id = ""
+            for li in layeritems:
+                if li['name'] == items_name:
+                    litems_id = li['id']
+                    break
+            if litems_id:
+                return litems_id
+
+        def layerbranches_info(items_id, layerbranches):
+            lbranch = {}
+            for lb in layerbranches:
+                if lb['layer'] == items_id and lb['branch'] == branchnum:
+                    lbranch['id'] = lb['id']
+                    lbranch['vcs_subdir'] = lb['vcs_subdir']
+                    break
+            return lbranch
+
+        def layerdependencies_info(lb_id, layerdependencies):
+            ld_deps = []
+            for ld in layerdependencies:
+                if ld['layerbranch'] == lb_id and not ld['dependency'] in ld_deps:
+                    ld_deps.append(ld['dependency'])
+            if not ld_deps:
+                logger.error("The dependency of layerDependencies is not found.")
+                return
+            else:
+                return ld_deps
+
+        def layeritems_info_name_subdir(items_id, layeritems):
+            litems = {}
+            for li in layeritems:
+                if li['id'] == items_id:
+                    litems['vcs_url'] = li['vcs_url']
+                    litems['name'] = li['name']
+                    break
+            return litems
+
+        if selfname:
+            selfid = layeritems_info_id(layername, layeritems)
+            selfsubdir = layerbranches_info(selfid, layerbranches)
+            if selfsubdir:
+                selfsubdir = layerbranches_info(selfid, layerbranches)['vcs_subdir']
+            else:
+                logger.error("%s layer is not found in your specify branch." % layername)
+                return
+            selfurl = layeritems_info_name_subdir(selfid, layeritems)['vcs_url']
+            if selfurl:
+                return selfurl, selfsubdir
+            else:
+                logger.error("Can NOT get %s git repo and subdir" % layername)
+                return
+        ldict = {}
+        itemsid = layeritems_info_id(layername, layeritems)
+        if not itemsid:
+            return layername, None
+        lbid = layerbranches_info(itemsid, layerbranches)
+        if lbid:
+            lbid = layerbranches_info(itemsid, layerbranches)['id']
+        else:
+            logger.error("%s is not found in your specify branch." % layername)
+            return None, None
+        for dependency in layerdependencies_info(lbid, layerdependencies):
+            lname = layeritems_info_name_subdir(dependency, layeritems)['name']
+            lurl = layeritems_info_name_subdir(dependency, layeritems)['vcs_url']
+            lsubdir = layerbranches_info(dependency, layerbranches)['vcs_subdir']
+            ldict[lname] = lurl, lsubdir
+        return None, ldict
+
+
+    def get_fetch_layer(self, fetchdir, url, subdir, fetch_layer):
+        layername = self.get_layer_name(url)
+        if os.path.splitext(layername)[1] == '.git':
+            layername = os.path.splitext(layername)[0]
+        repodir = os.path.join(fetchdir, layername)
+        layerdir = os.path.join(repodir, subdir)
+        if not os.path.exists(repodir):
+            if fetch_layer:
+                result = subprocess.call('git clone %s %s' % (url, repodir), shell = True)
+                if result:
+                    logger.error("Failed to download %s" % url)
+                else:
+                    return layername, layerdir
+            else:
+                logger.plain('We need fetch %s layer, please add -f option.' % layername)
+                return layername, layerdir
+        elif os.path.exists(layerdir):
+            return layername, layerdir
+        else:
+            logger.error("%s is not in %s" % (url, subdir))
+
+
+    def do_show_layer_deps(self, args):
+        """Find layer dependencies from layer index. Fetch it and its dependency layers. Add them to conf/bblayers.conf.
+
+usage: show-layer-deps [-a] [-f] [-b[branch name]] <layername,...>
+
+Options:
+  -a   add layer to conf/bblayers.conf
+  -b   specify layer branch, such as master, dylan, danny, oe-classic, dora, daisy or dizzy. Default branch is master.
+  -f   fetch layer from git repository
+"""
+        add_layer = False
+        fetch_layer = False
+        layernames = ""
+        branchname = "master"
+        for arg in args.split():
+            if arg == '-a':
+                add_layer = True
+            elif arg == '-f':
+                fetch_layer = True
+            elif arg.startswith('-b'):
+                branchname = arg[2:]
+            elif not arg.startswith('-'):
+                layernames = arg
+            else:
+                sys.stderr.write("show-layer-deps: invalid option %s\n" % arg)
+                self.do_help('')
+                return
+        if branchname == "master":
+            branchnum = 1
+        elif branchname == "dylan":
+            branchnum = 2
+        elif branchname == "danny":
+            branchnum = 3
+        elif branchname == "oe-classic":
+            branchnum = 4
+        elif branchname == "dora":
+            branchnum = 5
+        elif branchname == "daisy":
+            branchnum = 6
+        elif branchname == "dizzy":
+            branchnum = 7
+        else:
+            sys.stderr.write("Invalid layer branch name: %s\n" % branchname)
+            return
+        if not layernames:
+            sys.stderr.write("Please specify layer name.\n")
+            return
+        self.init_bbhandler(config_only = True)
+        apiurl = self.bbhandler.config_data.getVar('BBLAYERS_LAYERINDEX_URL', True)
+        if not apiurl:
+            logger.error("Can NOT get BBLAYERS_LAYERINDEX_URL.")
+        else:
+            apiurl = apiurl + "api/"
+        apilinks = self.get_json_data(apiurl)
+        layeritems = self.get_json_data(apilinks['layerItems'])
+        layerbranches = self.get_json_data(apilinks['layerBranches'])
+        layerdependencies = self.get_json_data(apilinks['layerDependencies'])
+        invaluenames = []
+        repourls = []
+        printlayers = []
+        def query_dependencies(layernames, layeritems, layerbranches, layerdependencies, branchnum, invaluenames, repourls, printlayers):
+            depslayer = []
+            for layername in layernames.split(','):
+                if not layername == "meta":
+                    invaluename, layerdict = self.get_layer_deps(layername, layeritems, layerbranches, layerdependencies, branchnum)
+                    if layerdict:
+                        repourls.append(self.get_layer_deps(layername, layeritems, layerbranches, layerdependencies, branchnum, selfname=True))
+                        for layer in layerdict:
+                            if not layer == "openembedded-core":
+                                depslayer.append(layer)
+                            printlayers.append((layername, layer, layerdict[layer][0], layerdict[layer][1]))
+                            if not layer == "openembedded-core" and not (layerdict[layer][0], layerdict[layer][1]) in repourls:
+                                repourls.append((layerdict[layer][0], layerdict[layer][1]))
+                    if invaluename and not invaluename in invaluenames:
+                        invaluenames.append(invaluename)
+            return repourls, depslayer, invaluenames, printlayers
+
+        repourls, depslayers, invaluenames, printlayers = query_dependencies(layernames, layeritems, layerbranches, layerdependencies, branchnum, invaluenames, repourls, printlayers)
+        while depslayers:
+            repourls, depslayer, invaluenames, printlayers = query_dependencies(','.join(depslayers), layeritems, layerbranches, layerdependencies, branchnum, invaluenames, repourls, printlayers)
+            depslayers = depslayer
+        for invaluename in invaluenames:
+            logger.warn("%s is not found in layer index." % invaluename)
+        if printlayers:
+            logger.plain("%s  %s  %s  %s" % ("Layer".ljust(19), "Dependencies".ljust(19), "Git repository".ljust(54), "Subdirectory"))
+            logger.plain('=' * 115)
+        for layer, dependencies, gitrepo, subdirectory in set(printlayers):
+            logger.plain("%s %s %s %s" % (layer.ljust(20), dependencies.ljust(20), gitrepo.ljust(55), subdirectory))
+
+        if set(repourls):
+            fetchdir = self.bbhandler.config_data.getVar('BBLAYERS_FETCH_DIR', True)
+            if not fetchdir:
+                logger.error("Can NOT get BBLAYERS_FETCH_DIR.")
+                return
+            if not os.path.exists(fetchdir):
+                os.makedirs(fetchdir)
+            addlayers = []
+            for repourl, subdir in repourls:
+                name, layerdir = self.get_fetch_layer(fetchdir, repourl, subdir, fetch_layer)
+                addlayers.append((subdir, name, layerdir))
+        if add_layer:
+            for subdir, name, layerdir in set(addlayers):
+                if os.path.exists(layerdir):
+                    if subdir:
+                        logger.plain("Add \"%s\" to conf/bblayers.conf" % subdir)
+                    else:
+                        logger.plain("Add \"%s\" to conf/bblayers.conf" % name)
+                    self.do_add_layer(layerdir)
+                else:
+                    break
+
+
     def version_str(self, pe, pv, pr = None):
         verstr = "%s" % pv
         if pr:
-- 
1.9.1


