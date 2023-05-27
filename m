Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0301C77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:07:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.5762.1685168256242174105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dvbzHu2e;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30ab87a1897so848548f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168254; x=1687760254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykaw+olWTZ0e8jh7zgVVzcbFHBjvbKsIgcOS3GLFZk0=;
        b=dvbzHu2ema4IXS4PW2mArLxls3Vt43jbGYIEH1XojqSRZiwVfa3r3/cv6gqi7IsvGh
         iTgMfd6vX1Fpsqnn97DfvkTKAEIO2Si7DDaKTuMuI1D8C+QwL5cX4WPXtWnZom4rpj6w
         gpInIoAm1K0hnZbkRLPaMgFc+0eCL2dKJ3Cea72GqVSJNdWSxvJhlD96BtHium8I1jor
         rteCflGJDoy2bi0ry+2tswtmPTgGuCWBSiW38FiUMYlGQrkCEd0spLEf6ZqgsR/hLVJI
         11kzqfFWgQKALbg5fJP2u25V2HtaJ5pGQSHh953uo2SHUQgjj45i4kLEFN4Cj6a6hDxE
         F2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168254; x=1687760254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykaw+olWTZ0e8jh7zgVVzcbFHBjvbKsIgcOS3GLFZk0=;
        b=YPt3t4nDBfFL1JFcJAcg44P+QUuBBzZGYfII0PMPV81Ek5ZX+9ggxGPgiZwYjjGK89
         2TDXM83zreJURrSMViBEbMb7E4OgDZL/bPvrOBj5hqzwM0iolc1zrwneUacWCK2G8X37
         8iCB+b2MQFt8wZBMsFm8tSWQvSP+5TJDKzC8lxLxaQ4wbQ5EUeZ51d9QF1GFoWmlsP98
         kAWK1VQ7MbTohOzgw4hqnehrynHJhUtXC1r68YG7yEM5O0HkHFdnPrEanK1meKv3GQXc
         wQ+Wx0L0mjNTD+X6rMHd8pbMgrXWHqw6Gcb/KZY/of3oM+k+mFCM6VeInXYye4KFS/7S
         4dlw==
X-Gm-Message-State: AC+VfDw68LaZryhhNcWUpqVCYWXou8R6OLyqCvhWMpqW2Rg1/5L8LzU7
	dduL7DXr00Lg25odyhUvTj4fH3QIIsrT/P+0
X-Google-Smtp-Source: ACHHUZ43V7OB3cVafx4X8DLGs/nodOMnMf2w6gQSw7vbqn0vyVPpuht0kgTKpu9J27Ca73ZITMaDWw==
X-Received: by 2002:adf:fd8d:0:b0:30a:dff0:7bac with SMTP id d13-20020adffd8d000000b0030adff07bacmr1659521wrr.30.1685168254348;
        Fri, 26 May 2023 23:17:34 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm7014623wrw.113.2023.05.26.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:17:34 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 5/5] classes: npm: Add support for the new format of the shrinkwrap file
Date: Sat, 27 May 2023 08:17:26 +0200
Message-Id: <20230527061726.937747-5-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
References: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181802

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


