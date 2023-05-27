Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D19CC77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 06:25:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6055.1685168738186063924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=j6aZhQYp;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so9980485e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168736; x=1687760736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Pg2bBoqEJWl2vqD3mDnFoMzH6DPiC4LqbtV9o3gxY=;
        b=j6aZhQYpP/5lg0AHSwhgS6Cink8pXRPKwO3QU5VEOSz2STHR73FFqNqRNkHv0O0SwK
         sAzKDxt1tDtgl3YJFOKFe9rTo5PxB+CgKkzVhR8WNIhsIeL81q5JoaRYJgs9sV6EJL37
         gRgPmUb0dPK5XCnv/dFNpIJpZwF57hu0j+0wcu4B6Pd5+1taTliyVpg7A/GMqyDiRYXU
         MLRkChslXEkEk/IV8hnibRT0nWFzMokHHZIQWzdhvazOUNZda/pfZdJIlIc38mdHeNHQ
         bE1/tQgUfw3acQEzIL9Q4TFudAHssD/XXI0OdEOPw5uFe3DRDpWL6CyWOIXkDhayUl1q
         IRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168736; x=1687760736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2Pg2bBoqEJWl2vqD3mDnFoMzH6DPiC4LqbtV9o3gxY=;
        b=TnPzXNjwqhl036PBHKu6SFkIOZ3xZhftEH4Y+KwKVanrA6eyTlJ7Ao9L75sB6Ea3gm
         iphAJvho0kbzc4eUfXxXOKFwWkTV411wTF7Cckzqs/MyNWleTScO5AUdQ7pHVr8lwH1L
         zTgjSKcLBLkgy7ub97DuoRUqL/vQztsDZe8rs6GPlgVCjK5tuJBK8PSgZB+CYLu2YqiK
         5K0lT4QHKXmgwveH3ZYjiR+a4MY9JFJ0L0x2hy7S+nuoFCjeaOXzSfeRvyYq4h9pgd/i
         nnMGBBbYagod9jWXfB/7J17BVjWgmKn+J6J+wq12B1mSAf++7nQzhC+KW2zvi7eeN0qL
         l1Hw==
X-Gm-Message-State: AC+VfDyeVaE4fSLOptp8fHuG3bFY8zv6W0EkOoRrZYY5rbAjTuQj2eq3
	DgCKqOZDVXmu/XIg4g5KQsTilrDRW3iQfdRk
X-Google-Smtp-Source: ACHHUZ7HSEhL2SfuIBmEpEnhe4TVS4WzrTxqcZC6jnzRbq4rhTcJNkECNBRkcLm7v7x56ArAsQZsqA==
X-Received: by 2002:a5d:420c:0:b0:306:31e0:964 with SMTP id n12-20020a5d420c000000b0030631e00964mr2896630wrq.55.1685168736153;
        Fri, 26 May 2023 23:25:36 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f4fffccd73sm7347071wme.9.2023.05.26.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:25:35 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 2/5] classes: npm: Handle peer dependencies for npm packages
Date: Sat, 27 May 2023 08:25:29 +0200
Message-Id: <20230527062532.938477-2-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
References: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 06:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181792

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM changed its manner to handle peer dependencies over its versions:
 - Before NPM 3: NPM installs automatically peer dependencies
 - Between NPM 3 and 7: NPM shows a warning about peer dependencies
 - After NPM 3: NPM reworked its manner how to handle peer dependencies

The shrinkwrap doesn't have the parameters of the peer dependencies, so we cannot
fetch them. in the same time peer dependencies are not direct dependencies, they should
be installed as run time dependencies.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes/npm.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 8379c7b988..abc4c6f92b 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -108,6 +108,7 @@ python npm_do_configure() {
     import tempfile
     from bb.fetch2.npm import NpmEnvironment
     from bb.fetch2.npm import npm_unpack
+    from bb.fetch2.npm import npm_package
     from bb.fetch2.npmsw import foreach_dependencies
     from bb.progress import OutOfProgressHandler
     from oe.npm_registry import NpmRegistry
@@ -168,6 +169,7 @@ python npm_do_configure() {
     if has_shrinkwrap_file:
        cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
        cached_shrinkwrap.pop("dependencies", None)
+       cached_shrinkwrap["packages"][""].pop("peerDependencies", None)
 
     # Manage the dependencies
     progress = OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
@@ -202,6 +204,19 @@ python npm_do_configure() {
     if has_shrinkwrap_file:
         foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
         foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
+    
+    # Manage Peer Dependencies
+    if has_shrinkwrap_file:
+        packages = orig_shrinkwrap.get("packages", {})
+        peer_deps = packages.get("", {}).get("peerDependencies", {})
+        package_runtime_dependencies = d.getVar("RDEPENDS:%s" % d.getVar("PN"))
+        
+        for peer_dep in peer_deps:
+            peer_dep_yocto_name = npm_package(peer_dep)
+            if peer_dep_yocto_name not in package_runtime_dependencies:
+                bb.warn(peer_dep + " is a peer dependencie that is not in RDEPENDS variable. " + 
+                "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
+                % peer_dep_yocto_name)
 
     # Configure the main package
     with tempfile.TemporaryDirectory() as tmpdir:
@@ -277,6 +292,9 @@ python npm_do_compile() {
         args.append(("target_arch", d.getVar("NPM_ARCH")))
         args.append(("build-from-source", "true"))
 
+        # Don't install peer dependencies as they should be in RDEPENDS variable
+        args.append(("legacy-peer-deps", "true"))
+
         # Pack and install the main package
         (tarball, _) = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
         cmd = "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXTRA_OENPM"))
-- 
2.25.1


