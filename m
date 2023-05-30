Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46182C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.36.1685485700862219807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=geYqkVEe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso36948275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485699; x=1688077699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3WGXlnuP33E1ry0jo/DgUUKk31riL5yEjPdb4Y7jVQ=;
        b=geYqkVEeqK4ktTWMcxukZUjHx1O2AvNjizL3bSXVb+xaH9lNaVvx7Bt6bJhO1Y6I9l
         mnjDzpM0gdUI4PzvhTmYi193HfCHcZTEiZPwFbkW4MOgZRdP0h37c4EIszLQyGAt0aP0
         2cIErQb6lcF8tGtCq5FbX7/SWlZRU1Jn4oofYepH3K/SXx8h091ZOXEIUJtnsWwWu3Bf
         1WIgFkD8EY2xHe15OFvJkR6NBnlsiOynuIMwWMeQSAicfg6zXsufyGTNqmN9FWe1ChhO
         dgPxKBVsehb+ym/dS07XFCa2HW1H3qbsHqurQuGIPKxtO1yyLMi7pp4Rr1UZsI/h8WT4
         SZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485699; x=1688077699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3WGXlnuP33E1ry0jo/DgUUKk31riL5yEjPdb4Y7jVQ=;
        b=YvADH98viBdr1XhFiPheo69XYjacqs1QZJHuOZ8liyXEDcKxJ4JAlLtDMPwkbbfGfu
         zwaAknAWedfIpuOtYSzQU1yvzs8Y4ydXQu2VTjV4EVYV+Feiu0L8dXu26qtPPmUBHJ90
         jaLeeKArQRgYPyVMSxQ+sgJK9+25ou2+NrEawHGMeJxes3I4R7GmpZL1ODORUZrYuWCd
         c7sdL46nXLCQsD2WOng9/FVCIC7oJsxHOR0eH3WbkAN1F5o9qe21zfgFzDw5k2tXD3Sg
         L9UJZfvRME8sJ7V83WNvTrGmbCh7k6sTLlnfiObFEqoTJFRyYh32nc4vjI5+AwUsNw3Q
         ZEqg==
X-Gm-Message-State: AC+VfDzbWrmWlDAK5p4HXmniIiWivemcKYdCwpYrK+OCdNlQi9at8uae
	BHF7SuV13YC7q3MRsKnSIx9nlRigUacAMDqL
X-Google-Smtp-Source: ACHHUZ51WrFvxImOkDw47dnRyQ9oL/+FIj976MySp5Bm/Sz+mDaRagFJZGU6md3DWL3J6sYRd820QQ==
X-Received: by 2002:a1c:4b09:0:b0:3f6:d09:5d46 with SMTP id y9-20020a1c4b09000000b003f60d095d46mr2665680wma.20.1685485698797;
        Tue, 30 May 2023 15:28:18 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:18 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 4/6] recipetool: create: npm: Add support to handle peer dependencies
Date: Wed, 31 May 2023 00:27:50 +0200
Message-Id: <20230530222752.42503-4-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181964

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM changed its manner to handle peer dependencies over its versions.
Before NPM 3: NPM installs automatically peer dependencies
between NPM 3 and 7: NPM shows a warning about peer dependencies
After NPM 3: NPM reworked its manner how to handle peer dependencies

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


