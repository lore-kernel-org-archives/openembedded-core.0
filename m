Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B57C7EE31
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:07:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5984.1685168252191732587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=h7xsYDtK;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f60e536250so17262475e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168250; x=1687760250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Pg2bBoqEJWl2vqD3mDnFoMzH6DPiC4LqbtV9o3gxY=;
        b=h7xsYDtKS5XRcbQ37mJww9HFIH+6S1UrzCa63t7Sc/Hd48WmAbh3zxPk29BtX3IttJ
         BRsXMZXIgUzxncWiWtq2rNUa4D3KS9ZnGjMCQNVYcVofQQSEpbRg89SWyRowKwjfD/Hu
         lNRRS8FVKb9+IwniHJ3zrcJAyx8LgD96lBwgcON5nysIqmmBc+zlRrvpQ5PRBAQ9OsuP
         XUXoh079WkEf3op2flx9MdpWBRuZJP2qclvg3vnLtZChICiw9KbscQx+1xKVVdJBE6ar
         N/OQTwNm6pVxmIB3+oocXq5qBWnByoOZgoWhl6ltSoBlHwhkNBegvilJkOL3BS6P/4Bt
         fVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168250; x=1687760250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2Pg2bBoqEJWl2vqD3mDnFoMzH6DPiC4LqbtV9o3gxY=;
        b=VjtUW7uzsEupaKL6K9VBKAsWjTbKC8sZEIDyFtQehF5E9UnU4DWMQOJnaT9fzrVyEH
         8L0bghRcfgd4HDzaKqIPB8QyqWsReFDlFwqGwa6lv8lZN4mdttHLZ+iTlXPie2En/osV
         e+bMfuZOIUN30q7GRzsEZcUfy9Dnwi0lYLiyXax4qhTiEpWdAbIbiGqZ7NvLIU3fXHGd
         eTCHeeMYOLLagzd2L7dfI0cSzlIJVj/VbP2KVzTSqhxE3Dsv1SUnq9gpCXmAPOdLrJQG
         7M0UIBLQ1m313TlLfjdSBdXt/YJsQ0tZV37MdX6HjggI0qD6y37XDjrpuiGsIFod5afl
         0tzw==
X-Gm-Message-State: AC+VfDz204CXoQKbve4PRhpBQXkfhPx6lVGXuZ8wUK2cLm6jaBqLWctP
	lHyX+swXBd1AU6TQIP3BVNeX/AyhbW3NYCtN
X-Google-Smtp-Source: ACHHUZ7vb3dwO7uioLB6pLZHf3Uj7PdIa+gNfGhqhtLgRElOjvU7IiR6y5cyzOf7KNFzUGhJbRN91w==
X-Received: by 2002:a5d:4806:0:b0:30a:c5dc:6c47 with SMTP id l6-20020a5d4806000000b0030ac5dc6c47mr918367wrq.34.1685168250293;
        Fri, 26 May 2023 23:17:30 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm7014623wrw.113.2023.05.26.23.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:17:29 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 2/5] classes: npm: Handle peer dependencies for npm packages
Date: Sat, 27 May 2023 08:17:23 +0200
Message-Id: <20230527061726.937747-2-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
References: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181799

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


