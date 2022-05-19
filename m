Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50643C43217
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.5808.1652954775985982885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=aPiTJB3U;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6BdK884849
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954771;
	bh=LAbtJG27b/FuMnf9Up6jEiGHILcTrMVuC2S1mCceVL8=; l=5185;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aPiTJB3UuqZk0y8Qbg3Ol85OM2NpLPP312fN3ugLxHW3/sQxOXGfyJ+kZTxYU6WbV
	 dse+IDKecxM5L7gJg82DbJ29AYuywCDrEe0FPWVMNNhOArVY8unyXpzJ0bbTrdeq6s
	 KVPX/mq4n6Z56fZUqs01zK4joih4tfUDRj74o2HtTbJTPqxuEJ7YdccvrouDjxEgV9
	 GiNT+KrGuU7i/S+sDK7mJY2utptb7CDgbPQ3Prpvq7573JxzQjA6CQGqVP3Bqtho+y
	 PpyAC+E5ul9Tb1ySj2Z71r6/7La1JtiXzmCXgqeVeZy5RZyTwnvKzTcxAjZ6CuXGw8
	 gHvKQEVv/bT+g==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68eT791537
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:08 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 186941B4F97; Thu, 19 May 2022 12:06:06 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA66h1596900
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004Imb-Lj;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 5/6] lib:npm_registry: initial checkin
Date: Thu, 19 May 2022 12:05:55 +0200
Message-Id: 
 <e5dce87a8009be32956575fb02383e096de96cfb.1652954597.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165874

Helper module to:

- generate meta information from package.json content.  This data has
  a format as provided by https://registry.npmjs.org

- put this meta information and the corresponding tarball in the
  nodejs cache.  This uses an external, nodejs version specific helper
  script (oe-npm-cache) shipped in oe-meta

To avoid further nodejs version dependencies, future versions of this
module might omit the caching completely and serve meta information
and tarball by an http server.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oe/npm_registry.py | 169 ++++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 meta/lib/oe/npm_registry.py

diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
new file mode 100644
index 0000000000..96c0affb45
--- /dev/null
+++ b/meta/lib/oe/npm_registry.py
@@ -0,0 +1,169 @@
+import bb
+import json
+import subprocess
+
+_ALWAYS_SAFE = frozenset('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
+                         'abcdefghijklmnopqrstuvwxyz'
+                         '0123456789'
+                         '_.-~')
+
+MISSING_OK = object()
+
+REGISTRY = "https://registry.npmjs.org"
+
+# we can not use urllib.parse here because npm expects lowercase
+# hex-chars but urllib generates uppercase ones
+def uri_quote(s, safe = '/'):
+    res = ""
+    safe_set = set(safe)
+    for c in s:
+        if c in _ALWAYS_SAFE or c in safe_set:
+            res += c
+        else:
+            res += '%%%02x' % ord(c)
+    return res
+
+class PackageJson:
+    def __init__(self, spec):
+        self.__spec = spec
+
+    @property
+    def name(self):
+        return self.__spec['name']
+
+    @property
+    def version(self):
+        return self.__spec['version']
+
+    @property
+    def empty_manifest(self):
+        return {
+            'name': self.name,
+            'description': self.__spec.get('description', ''),
+            'versions': {},
+        }
+
+    def base_filename(self):
+        return uri_quote(self.name, safe = '@')
+
+    def as_manifest_entry(self, tarball_uri):
+        res = {}
+
+        ## NOTE: 'npm install' requires more than basic meta information;
+        ## e.g. it takes 'bin' from this manifest entry but not the actual
+        ## 'package.json'
+        for (idx,dflt) in [('name', None),
+                           ('description', ""),
+                           ('version', None),
+                           ('bin', MISSING_OK),
+                           ('man', MISSING_OK),
+                           ('scripts', MISSING_OK),
+                           ('directories', MISSING_OK),
+                           ('dependencies', MISSING_OK),
+                           ('devDependencies', MISSING_OK),
+                           ('optionalDependencies', MISSING_OK),
+                           ('license', "unknown")]:
+            if idx in self.__spec:
+                res[idx] = self.__spec[idx]
+            elif dflt == MISSING_OK:
+                pass
+            elif dflt != None:
+                res[idx] = dflt
+            else:
+                raise Exception("%s-%s: missing key %s" % (self.name,
+                                                           self.version,
+                                                           idx))
+
+        res['dist'] = {
+            'tarball': tarball_uri,
+        }
+
+        return res
+
+class ManifestImpl:
+    def __init__(self, base_fname, spec):
+        self.__base = base_fname
+        self.__spec = spec
+
+    def load(self):
+        try:
+            with open(self.filename, "r") as f:
+                res = json.load(f)
+        except IOError:
+            res = self.__spec.empty_manifest
+
+        return res
+
+    def save(self, meta):
+        with open(self.filename, "w") as f:
+            json.dump(meta, f, indent = 2)
+
+    @property
+    def filename(self):
+        return self.__base + ".meta"
+
+class Manifest:
+    def __init__(self, base_fname, spec):
+        self.__base = base_fname
+        self.__spec = spec
+        self.__lockf = None
+        self.__impl = None
+
+    def __enter__(self):
+        self.__lockf = bb.utils.lockfile(self.__base + ".lock")
+        self.__impl  = ManifestImpl(self.__base, self.__spec)
+        return self.__impl
+
+    def __exit__(self, exc_type, exc_val, exc_tb):
+        bb.utils.unlockfile(self.__lockf)
+
+class NpmCache:
+    def __init__(self, cache):
+        self.__cache = cache
+
+    @property
+    def path(self):
+        return self.__cache
+
+    def run(self, type, key, fname):
+        subprocess.run(['oe-npm-cache', self.__cache, type, key, fname],
+                       check = True)
+
+class NpmRegistry:
+    def __init__(self, path, cache):
+        self.__path = path
+        self.__cache = NpmCache(cache + '/_cacache')
+        bb.utils.mkdirhier(self.__path)
+        bb.utils.mkdirhier(self.__cache.path)
+
+    @staticmethod
+    ## This function is critical and must match nodejs expectations
+    def _meta_uri(spec):
+        return REGISTRY + '/' + uri_quote(spec.name, safe = '@')
+
+    @staticmethod
+    ## Exact return value does not matter; just make it look like a
+    ## usual registry url
+    def _tarball_uri(spec):
+        return '%s/%s/-/%s-%s.tgz' % (REGISTRY,
+                                      uri_quote(spec.name, safe = '@'),
+                                      uri_quote(spec.name, safe = '@/'),
+                                      spec.version)
+
+    def add_pkg(self, tarball, pkg_json):
+        pkg_json = PackageJson(pkg_json)
+        base = os.path.join(self.__path, pkg_json.base_filename())
+
+        with Manifest(base, pkg_json) as manifest:
+            meta = manifest.load()
+            tarball_uri = self._tarball_uri(pkg_json)
+
+            meta['versions'][pkg_json.version] = pkg_json.as_manifest_entry(tarball_uri)
+
+            manifest.save(meta)
+
+            ## Cache entries are a little bit dependent on the nodejs
+            ## version; version specific cache implementation must
+            ## mitigate differences
+            self.__cache.run('meta', self._meta_uri(pkg_json), manifest.filename);
+            self.__cache.run('tgz',  tarball_uri, tarball);
-- 
2.36.1


