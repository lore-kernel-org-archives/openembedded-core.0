Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8332471637
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 06:52:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0C6qinN011084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 11 Jan 2015 22:52:44 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 11 Jan 2015 22:52:44 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Mon, 12 Jan 2015 14:48:42 +0800
Message-ID: <b2a5af309a2b2e6b23070ae2f2343e39b12a52df.1421044647.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421044647.git.Chong.Lu@windriver.com>
References: <cover.1421044647.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Mon, 12 Jan 2015 06:52:48 -0000
Content-Type: text/plain

It maybe depends on other layers when one layer is added to BBLAYERS. If define
LAYERDEPENDS variable in this layer, we will get error from bitbake. But
sometimes, we don't have defined. Add a mechanism to extend bitbake-layers and
it will query layer dependencies from layer index
(http://layers.openembedded.org/layerindex/api/)
Use `bitbake-layers show-layer-dependencies' to find out dependencies and update
bblayers.conf as appropriate.

[YOCTO #5348]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 bitbake/bin/bitbake-layers | 116 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/bitbake/bin/bitbake-layers b/bitbake/bin/bitbake-layers
index 9879498..0756095 100755
--- a/bitbake/bin/bitbake-layers
+++ b/bitbake/bin/bitbake-layers
@@ -27,6 +27,7 @@ import sys
 import fnmatch
 from collections import defaultdict
 import re
+import httplib, urlparse, json
 
 bindir = os.path.dirname(__file__)
 topdir = os.path.dirname(bindir)
@@ -157,6 +158,121 @@ usage: remove-layer <layerdir>
                 sys.stderr.write("No layers matching %s found in BBLAYERS\n" % item)
 
 
+    def get_json_data(self, apiurl):
+        proxy_settings = os.environ.get("http_proxy", None)
+        conn = None
+        _parsedurl = urlparse.urlparse(apiurl)
+        path = _parsedurl.path
+        query = _parsedurl.query
+        def parse_url(url):
+            parsedurl = urlparse.urlparse(url)
+            try:
+                (host, port) = parsedurl.netloc.split(":")
+            except ValueError:
+                host = parsedurl.netloc
+                port = None
+
+            if port is None:
+                port = 80
+            else:
+                port = int(port)
+            return (host, port)
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
+    def get_layer_deps(self, layername, layeritems, layerbranches, layerdependencies):
+        def layeritems_info_id(items_name, layeritems):
+            litems_id = ""
+            for li in layeritems:
+                if li['name'] == items_name:
+                    litems_id = li['id']
+                    break
+            return litems_id
+
+        def layerbranches_info(items_id, layerbranches):
+            lbranch = {}
+            for lb in layerbranches:
+                # branch is master.
+                if lb['layer'] == items_id and lb['branch'] == 1:
+                    lbranch['id'] = lb['id']
+                    lbranch['vcs_subdir'] = lb['vcs_subdir']
+                    break
+            if not lbranch['id']:
+                logger.plain("The id of layerBranches is not found.")
+                return
+            else:
+                return lbranch
+
+        def layerdependencies_info(lb_id, layerdependencies):
+            ld_deps = []
+            for ld in layerdependencies:
+                if ld['layerbranch'] == lb_id and not ld['dependency'] in ld_deps:
+                    ld_deps.append(ld['dependency'])
+            if not ld_deps:
+                logger.plain("The dependency of layerDependencies is not found.")
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
+        itemsid = layeritems_info_id(layername, layeritems)
+        if not itemsid:
+            return
+        lbid = layerbranches_info(itemsid, layerbranches)['id']
+        ldict = {}
+        for dependency in layerdependencies_info(lbid, layerdependencies):
+            lname = layeritems_info_name_subdir(dependency, layeritems)['name']
+            lurl = layeritems_info_name_subdir(dependency, layeritems)['vcs_url']
+            lsubdir = layerbranches_info(dependency, layerbranches)['vcs_subdir']
+            ldict[lname] = lurl, lsubdir
+        return ldict
+
+
+    def do_show_layer_dependencies(self, args):
+        """Find layer dependencies from layer index"""
+        apilinks = self.get_json_data(apiurl = "http://layers.openembedded.org/layerindex/api/")
+        layeritems = self.get_json_data(apilinks['layerItems'])
+        layerbranches = self.get_json_data(apilinks['layerBranches'])
+        layerdependencies = self.get_json_data(apilinks['layerDependencies'])
+        self.init_bbhandler(config_only = True)
+        bblayers_conf = os.path.join('conf', 'bblayers.conf')
+        logger.plain("%s  %s  %s  %s" % ("Layer".ljust(20), "Dependencies".ljust(20), "Git repository".ljust(50), "Subdirectory"))
+        logger.plain('=' * 111)
+        if not os.path.exists(bblayers_conf):
+            sys.stderr.write("Unable to find bblayers.conf\n")
+            return
+        for layerdir in self.bblayers:
+            layername = self.get_layer_name(layerdir)
+            if not layername == "meta":
+                layerdict = self.get_layer_deps(layername, layeritems, layerbranches, layerdependencies)
+                if layerdict:
+                    for layer in layerdict:
+                        logger.plain("%s  %s  %s  %s" % (layername.ljust(20), layer.ljust(20), layerdict[layer][0].ljust(50), layerdict[layer][1]))
+                else:
+                    logger.plain("%s" % layername)
+
+
     def version_str(self, pe, pv, pr = None):
         verstr = "%s" % pv
         if pr:
-- 
1.9.1


