Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D30D477265
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 08:29:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u858TrWs003375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 01:29:53 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 01:29:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 01:29:48 -0700
Message-ID: <36902360023167363cf3da4209efe8531ee3ec68.1473064099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473064099.git.liezhi.yang@windriver.com>
References: <cover.1473064099.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gobject-introspection: set GI_SCANNER_DISABLE_CACHE for native
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
X-List-Received-Date: Mon, 05 Sep 2016 08:29:53 -0000
Content-Type: text/plain

The native recipe should not write files to $HOME/.cache as target, this can
avoid problems when multi builds are running on the same host like:
|   File "./g-ir-scanner", line 66, in <module>
|     sys.exit(scanner_main(sys.argv))
|   File "../gobject-introspection-1.48.0/giscanner/scannermain.py", line 543, in scanner_main
|     transformer = create_transformer(namespace, options)
|   File "../gobject-introspection-1.48.0/giscanner/scannermain.py", line 389, in create_transformer
|     symbol_filter_cmd=options.symbol_filter_cmd)
|   File "../gobject-introspection-1.48.0/giscanner/transformer.py", line 54, in __init__
|     self._cachestore = CacheStore()
|   File "../gobject-introspection-1.48.0/giscanner/cachestore.py", line 61, in __init__
|     self._check_cache_version()
|   File "../gobject-introspection-1.48.0/giscanner/cachestore.py", line 89, in _check_cache_version
|     self._clean()
|   File "../gobject-introspection-1.48.0/giscanner/cachestore.py", line 141, in _clean
|     self._remove_filename(os.path.join(self._directory, filename))
|   File "../gobject-introspection-1.48.0/giscanner/cachestore.py", line 123, in _remove_filename
|     os.unlink(filename)
| FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/.cache/g-ir-scanner/0a47aa95823c95a0b5d1bd610b60d02f35785f26'
| Makefile:3518: recipe for target 'GModule-2.0.gir' failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index b41a317..abaa485 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -107,7 +107,7 @@ EXTRA_OECONF_class-target += "--enable-host-gi \
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
 
-do_compile_prepend_class-target() {
+do_compile_prepend() {
         # This prevents g-ir-scanner from writing cache data to $HOME
         export GI_SCANNER_DISABLE_CACHE=1
 
-- 
2.9.0


