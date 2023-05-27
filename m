Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A8CC77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 06:25:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.6058.1685168742704428403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ipukR/qF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6d3f83d0cso15626645e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168741; x=1687760741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykaw+olWTZ0e8jh7zgVVzcbFHBjvbKsIgcOS3GLFZk0=;
        b=ipukR/qFLneBwtPaqygIOiN4ErMD+frNTiQVhhZUVR49BofrZPKqcZm470Ku+snHCA
         wA1kk66dIYKSDtWY7+jUWdP4hSRrGt6Np5mVyZ+JNJNCyKZxoRvnN7dpJd47+bQicvqF
         CFoT0l0HU6v/TyLKjWIkPc/MFAotyE9LLEm4DFdvvEDHi6LuvNddZvOpu3DN09ycDbmL
         LwBP5WsvimKhpBswqAjYbKVS7txkExaLUZocvtWshwkYK08CVid07bQ2LEBNoYskpbkA
         OPchD3e61zvrVDHj4184ddlKrIWGI5/9Q01F7u+wcKjD27HYNvqjqeIz0rsFLLgl/uth
         HIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168741; x=1687760741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykaw+olWTZ0e8jh7zgVVzcbFHBjvbKsIgcOS3GLFZk0=;
        b=GkjI8HEImllI3OGyW+NbSyNvocU3aeQPr4XIhuEJr1LCvOzGAgcvJ9sDiA9WNKMI0C
         u4GRZ2n98gq3t4nLMi/4Xq4x9hnm0+jKUcH1Br9Oc5Wi9qkUHqCWFcv7JnBqGGUkg/qN
         zedoaicAWXBmdVXsBR7fbgtOdCfbX7dmgHSuJ+zN9OZ5SDUQK7tM7WsWD2EDQQzOwqsA
         aViqjMUsSSfcn6W52ubzsZmt0lKOTyv3/36/c9cFkk/cX3sTwBh27abzieRuKYY0zcSt
         3Cjxs9csyPe3J2FmmI2GgByuYm5BSn7I95B6fX7MsJMqd0iFIeWhSmE4UIKOebANDIgW
         RF0Q==
X-Gm-Message-State: AC+VfDxi/jsI+uxrdCW4F8PEnWMhyFOlz9TIbILD9eYdbbCbhNbqPgU7
	spW0nRtdPiW0/ngpBjwG60bqivyl8k3Eqk+S
X-Google-Smtp-Source: ACHHUZ4iNYazPicgEZcztz+KacqOwJiV5l//udZdaRBeM6ccy3jkWfhOj1Evmf7rjNW4cUQ4OJmaRw==
X-Received: by 2002:a7b:cc8e:0:b0:3f4:2b98:428f with SMTP id p14-20020a7bcc8e000000b003f42b98428fmr3377776wma.39.1685168740753;
        Fri, 26 May 2023 23:25:40 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f4fffccd73sm7347071wme.9.2023.05.26.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:25:40 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 5/5] classes: npm: Add support for the new format of the shrinkwrap file
Date: Sat, 27 May 2023 08:25:32 +0200
Message-Id: <20230527062532.938477-5-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
References: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 06:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181795

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

1 - Adapt do_configure to the new format of the shrinkwrap

2 - Remove useless function _npmsw_dependency_dict because the dictionnary
    is already given by npmsw:foreach_dependencies

3 - Rename arguments of callback functions

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes/npm.bbclass | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index abc4c6f92b..6899a64909 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -129,22 +129,6 @@ python npm_do_configure() {
         sha512 = bb.utils.sha512_file(tarball)
         return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decode()
 
-    def _npmsw_dependency_dict(orig, deptree):
-        """
-        Return the sub dictionary in the 'orig' dictionary corresponding to the
-        'deptree' dependency tree. This function follows the shrinkwrap file
-        format.
-        """
-        ptr = orig
-        for dep in deptree:
-            if "dependencies" not in ptr:
-                ptr["dependencies"] = {}
-            ptr = ptr["dependencies"]
-            if dep not in ptr:
-                ptr[dep] = {}
-            ptr = ptr[dep]
-        return ptr
-
     # Manage the manifest file and shrinkwrap files
     orig_manifest_file = d.expand("${S}/package.json")
     orig_shrinkwrap_file = d.expand("${S}/npm-shrinkwrap.json")
@@ -176,24 +160,25 @@ python npm_do_configure() {
     progress_total = 1 # also count the main package
     progress_done = 0
 
-    def _count_dependency(name, params, deptree):
+    def _count_dependency(name, params, destsuffix):
         nonlocal progress_total
         progress_total += 1
 
-    def _cache_dependency(name, params, deptree):
-        destsubdirs = [os.path.join("node_modules", dep) for dep in deptree]
-        destsuffix = os.path.join(*destsubdirs)
+    def _cache_dependency(name, params, destsuffix):
         with tempfile.TemporaryDirectory() as tmpdir:
             # Add the dependency to the npm cache
             destdir = os.path.join(d.getVar("S"), destsuffix)
             (tarball, pkg) = npm_pack(env, destdir, tmpdir)
             _npm_cache_add(tarball, pkg)
             # Add its signature to the cached shrinkwrap
-            dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
+            dep = params
             dep["version"] = pkg['version']
             dep["integrity"] = _npm_integrity(tarball)
             if params.get("dev", False):
                 dep["dev"] = True
+            if "dependencies" not in cached_shrinkwrap:
+                cached_shrinkwrap["dependencies"] = {}
+            cached_shrinkwrap["dependencies"][name] = dep
             # Display progress
             nonlocal progress_done
             progress_done += 1
-- 
2.25.1


