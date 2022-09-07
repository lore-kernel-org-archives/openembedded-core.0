Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C79C6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.8331.1662560478505957919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nKkDOsen;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id t3so9639302ply.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Y8lQU0RF4e1Ve/7ITKpXx3MwmKXzKsM5mAjzDyi/TQY=;
        b=nKkDOsenvQi+H+d8pFxLts7ZRuYDe9crKqhMoE2VEVAbnyVFbYjYbi/s5EpaIIfgcV
         pYSYik0V2wwl76O8ge6l0dIbwJkA1PXAKHQsz7ZDaMYVAg+I6OpAdpCh30/SIB/JdY8b
         l5FvV+l6/CGsHOFZ9aqL9cZcEPT47nncgsX9KM0jHl3MFcBrR66+Vbd8cvSIqc6KcjwA
         9CRLruXoHgpDBHA/PwUKELscksj+Djn70L8+AkfYNvEUMlX2lpPAUQ5lUOJWvh9pEeow
         zZQzqz932iHR6gSBijHHJ2vIhwokMBEFaBAnycLd5BolING9ZLBqkaFTUb7qseEi4HXL
         8ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Y8lQU0RF4e1Ve/7ITKpXx3MwmKXzKsM5mAjzDyi/TQY=;
        b=ik4/FIJ+pBuzzeShEP9sVmdKBxEU9/7MFMIJowTzu34GQYqhy8cvjRezyHQO1joXMN
         Dmtarw2XvxEiH+hBZdUtcyWAS9699LeQG0JsblMhMzwH8GJHuyPM0uAb/h3dKPDfhYVh
         imH/0PopfmXcWYRfIUeDX3+ysw357X5dAhiIZErMxWm5+j2NdSkyMV/W25UnYuTS0XNk
         PhxvTEM1sfnxnnKxjwv/cDIrhQkiewnha/eXFj5D62+Wj9uqcVKX3+53lmg2WPnO7Ob/
         w31GJnD90o1rrMNfhs9yAtTod9DeJNxjo1m4tz13EIG5+lYHYzx6MLGncPCptNiooRV0
         sTSQ==
X-Gm-Message-State: ACgBeo17kFG/xVYLRZR4ec0OwTOC9t976pLVQ1Y+uU7GgOyoF6QyWr1a
	vpcbxQrZUlG1hN08WgGRVZaVdsSMhKDXMYM/
X-Google-Smtp-Source: 
 AA6agR4x1vDeswPWHBGF4v1nR1My6UzJxFzjgl645cspUB+m/2tKd+7KM57LL8i6EIrd1dbDXOi2vA==
X-Received: by 2002:a17:902:7d86:b0:176:a6eb:1758 with SMTP id
 a6-20020a1709027d8600b00176a6eb1758mr4316575plm.90.1662560489492;
        Wed, 07 Sep 2022 07:21:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/24] lib:npm_registry: initial checkin
Date: Wed,  7 Sep 2022 04:20:24 -1000
Message-Id: 
 <17132402031f4659db5cc1f84263278b82b27ffa.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170418

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cd5886ad05fee704e8a5892bd370c360c8c3b54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


