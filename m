Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD3D72854
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 06:39:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t076dNM4018476
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 22:39:23 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 22:39:22 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 14:35:42 +0800
Message-ID: <15bba8b20b0419737801a6c495d379afb8ed67b2.1420610929.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420610929.git.Chong.Lu@windriver.com>
References: <cover.1420610929.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] layerindex.bbclass: Add ability to fetch layers from layer index
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
X-List-Received-Date: Wed, 07 Jan 2015 06:39:25 -0000
Content-Type: text/plain

It maybe depends on other layers when one layer is added to BBLAYERS. If define
LAYERDEPENDS variable in this layer, we will get error from bitbake. But
sometimes, we don't have defined. Add a mechanism to fetch layers from layer
index and update bblayers.conf as appropriate. The layer index stores
dependencies of all layers. Query dependency from layer index and fetch layer
repo, then add this layer to BBLAYERS.

[YOCTO #5348]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/layerindex.bbclass | 154 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 meta/classes/layerindex.bbclass

diff --git a/meta/classes/layerindex.bbclass b/meta/classes/layerindex.bbclass
new file mode 100644
index 0000000..21d4d97
--- /dev/null
+++ b/meta/classes/layerindex.bbclass
@@ -0,0 +1,154 @@
+LAYER_FETCH_DIR ??= "${COREBASE}"
+
+python layerindex_handler() {
+    import bb.event
+    if not e.data:
+        return
+
+    import httplib, urlparse, json
+    import os
+
+    def get_json_data(apiurl = "http://layers.openembedded.org/layerindex/api/"):
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
+            bb.fatal("Failed to read " + path + ": %d %s" % (r.status, r.reason))
+        return json.loads(r.read())
+
+    def get_deps_url(name, layeritems, layerbranches, layerdependencies):
+        def layeritems_info(items_name = None, items_id = None):
+            litems = {}
+            for li in layeritems:
+                if li['name'] == items_name:
+                    litems['id'] = li['id']
+                    break
+                if li['id'] == items_id:
+                    litems['vcs_url'] = li['vcs_url']
+                    litems['name'] = li['name']
+                    break
+            return litems
+
+        def layerbranches_info(items_id):
+            lbranch = {}
+            for lb in layerbranches:
+                # branch is master.
+                if lb['layer'] == items_id and lb['branch'] == 1:
+                    lbranch['id'] = lb['id']
+                    lbranch['vcs_subdir'] = lb['vcs_subdir']
+                    break
+            if not lbranch['id']:
+                bb.fatal("The id of layerBranches is not found.")
+            return lbranch
+
+        def layerdependencies_info(lb_id):
+            ld_deps = []
+            for ld in layerdependencies:
+                if ld['layerbranch'] == lb_id and not ld['dependency'] in ld_deps:
+                    ld_deps.append(ld['dependency'])
+            if not ld_deps:
+                bb.fatal("The dependency of layerDependencies is not found.")
+            return ld_deps
+
+        itemsid = layeritems_info(items_name = name)['id']
+        lbid = layerbranches_info(itemsid)['id']
+        layerdict = {}
+        for dependency in layerdependencies_info(lbid):
+            layername = layeritems_info(items_id = dependency)['name']
+            layerurl = layeritems_info(items_id = dependency)['vcs_url']
+            layersubdir = layerbranches_info(dependency)['vcs_subdir']
+            layerdict[layername] = layerurl, layersubdir
+        return layerdict
+
+    import sys
+    import subprocess
+
+    def download_layer(url, subdir):
+        fetchdir = e.data.getVar("LAYER_FETCH_DIR", True)
+        if not fetchdir:
+            bb.fatal("Please set LAYER_FETCH_DIR variable.")
+        if not os.path.exists(fetchdir):
+            os.makedirs(fetchdir)
+        urldir = url.split("/")[-1]
+        if urldir.endswith(".git"):
+            urldir = urldir.split(".")[0]
+        repodir = os.path.join(fetchdir, urldir)
+        if subdir:
+            layerdir = os.path.join(repodir, subdir)
+        else:
+            layerdir = repodir
+        if not os.path.exists(layerdir):
+            bb.warn("Fetch '%s' to '%s'" % (layer, e.data.getVar("LAYER_FETCH_DIR", True)))
+            result = subprocess.call('git clone %s %s' % (url, repodir), shell = True)
+            if result:
+                bb.fatal("Failed to download %s" % url)
+            else:
+                return layerdir
+        else:
+            return layerdir
+
+    def add_layer(name, layerdir, bblayersconf):
+        f = None
+        if not os.path.exists(bblayersconf):
+            bb.fatal("Can't find conf/bblayers.conf")
+        bblayers = e.data.getVar('BBLAYERS', True).split()
+        layer = layerdir.split("/")[-1]
+        if not layerdir in bblayers:
+            if f:
+                f.close()
+            f = open(bblayersconf, 'aw')
+            f.write("BBLAYERS += \"%s\"\n" % layerdir)
+            f.close()
+            bb.fatal("Layer '%s' depends on layer '%s', but this layer is not enabled in your configuration\nAdd '%s' to BBLAYERS. You can check conf/bblayers.conf" % (name, layer, layerdir))
+
+    def get_layer():
+        layers = []
+        bblayers = e.data.getVar('BBLAYERS', True).split()
+        for bblayer in bblayers:
+            layer = bblayer.split("/")[-1]
+            if not layer == "meta":
+                layers.append(layer)
+        return layers
+
+    apilinks = get_json_data()
+    layeritems = get_json_data(apilinks['layerItems'])
+    layerbranches = get_json_data(apilinks['layerBranches'])
+    layerdependencies = get_json_data(apilinks['layerDependencies'])
+    bblayersconf = os.path.join(e.data.getVar('TOPDIR', True), 'conf/bblayers.conf')
+    names = get_layer()
+    for name in names:
+        layerdict = get_deps_url(name, layeritems, layerbranches, layerdependencies)
+        for layer in layerdict:
+            if not layer == "openembedded-core":
+                layerdir = download_layer(layerdict[layer][0], layerdict[layer][1])
+                add_layer(name, layerdir, bblayersconf)
+}
+
+addhandler layerindex_handler
+layerindex_handler[eventmask] = "bb.event.ParseStarted"
-- 
1.9.1


