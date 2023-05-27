Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7723C7EE32
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:07:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.5986.1685168254951227736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nhjd6xBK;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3093eb8cd1fso906210f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168253; x=1687760253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8/dDsCJrSYL8PrYUOdwWzwHq/4ZBZ2SonINWnKkMkw=;
        b=nhjd6xBKUdPV99h/Ub/FCpovZK6aywdhtC6uf7ldQTRiSY8EI9SygpGJTSnymXkhK2
         o5760jNk/1NgNlZbuW28zO9AXxNfJZGQUJ/4G7ReEwiIzkz21CQi5OtKFEX3IcCOpiCa
         4pM3V9TMuR5Ca2Yz2l3zN+BKElNb32mUz7361x9ROk2zh+xlZ1Rprg28/4JDQ3H5jxro
         J230LL6PsgJDbjcyLzSB3jYVPeHVBJDkeyP03m82bQDHD1Az2rwsdxOH59c6aOE+8Fz8
         SJ2M3FOCdYk1enEDVFeq6ogwEr2VXlnqIKYdvS++49JtHL8ZEEAbSvPjqT6EE5pptItK
         +mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168253; x=1687760253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8/dDsCJrSYL8PrYUOdwWzwHq/4ZBZ2SonINWnKkMkw=;
        b=bI5Aw/OBl+1Xu3XHvtjFSZpYg3E9MhuTSxo8Y84dGG6YdP8Hm+QtRdqtkGDA8lBJaD
         Ms0+o5P/tT7JGD9aQTckBjVFj04UPA8QQV6ZrjQAWUy+MIz0pW/y1uSR+vkStWsshjOB
         TPSThGQoVQ9bSryLZ7oVTqr2NuijSJeLpZw9yaAbf0ffMzwwonAc35GxVaJXWOrGR5Wa
         3fZtv9tRWwHMitqlOA4iO2oOrxQOHLSlMzZVbOoUzoc4VCBLlIqNcYRq3kFPepfbAsbe
         2BdTztugyVWwLyPyYepbQOFPDGov22M5Mw3vl9NiLCFwTK78wmYeAjh990RSHngeGPWq
         mM0A==
X-Gm-Message-State: AC+VfDwGF9VbELx96KrLQHgdLAJfJzkUEGaYqKFmrs3y5ro6oN1orkfQ
	+sgRnvcy8KVhBFA4x6KvlUPBwUDsKYBM8pKW
X-Google-Smtp-Source: ACHHUZ6vd7LBdH/3+GIWUoVJMPsxro7VHJ9/g2YPSSf6GxU5qI/SHywo1lAfrcdWHA94XEUR6Dkm4g==
X-Received: by 2002:a5d:5685:0:b0:309:4b55:419d with SMTP id f5-20020a5d5685000000b003094b55419dmr3302731wrv.8.1685168252993;
        Fri, 26 May 2023 23:17:32 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm7014623wrw.113.2023.05.26.23.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:17:32 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 4/5] recipetool: create: npm: Add support to handle peer dependencies
Date: Sat, 27 May 2023 08:17:25 +0200
Message-Id: <20230527061726.937747-4-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
References: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181801

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
 scripts/lib/recipetool/create_npm.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 25e7ddb472..113a89f6a6 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -146,6 +146,23 @@ class NpmRecipeHandler(RecipeHandler):
         foreach_dependencies(shrinkwrap, _handle_dependency, dev)
 
         return licfiles, packages
+    
+    # Handle the peer dependencies   
+    def _handle_peer_dependency(self, shrinkwrap_file):
+        """Check if package has peer dependencies and show warning if it is the case"""
+        with open(shrinkwrap_file, "r") as f:
+            shrinkwrap = json.load(f)
+        
+        packages = shrinkwrap.get("packages", {})
+        peer_deps = packages.get("", {}).get("peerDependencies", {})
+        
+        for peer_dep in peer_deps:
+            peer_dep_yocto_name = npm_package(peer_dep)
+            bb.warn(peer_dep + " is a peer dependencie of the actual package. " + 
+            "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
+            % peer_dep_yocto_name)
+
+
 
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         """Handle the npm recipe creation"""
@@ -283,6 +300,9 @@ class NpmRecipeHandler(RecipeHandler):
         classes.append("npm")
         handled.append("buildsystem")
 
+        # Check if package has peer dependencies and inform the user
+        self._handle_peer_dependency(shrinkwrap_file)
+
         return True
 
 def register_recipe_handlers(handlers):
-- 
2.25.1


