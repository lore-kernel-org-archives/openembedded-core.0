Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B26C7EE23
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 06:25:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.6056.1685168741072354024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lp6gheWP;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso15849155e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168739; x=1687760739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8/dDsCJrSYL8PrYUOdwWzwHq/4ZBZ2SonINWnKkMkw=;
        b=lp6gheWPbzqEcZOriCRXmQlQk2xmKv9BlHjzeh3yy8iEPkGL1KNJZvCu8abE6aEi24
         vImHzb1tFlpLMsEKRbMpxWFqWUVE7MJ31GOZRf6IILHLb7aOKrFr7Nn7VLHslFY10TyI
         Dr6eLz6mU9B7A54Txb5LQpNCH4bNqhf4r2yXF7ZaG0Pcc8IQp+8xQCltWkTvALlsUUZk
         leUOHr35zaRi5pF2SgDJtfiFBluM6RmuJMSH1OstWGeocxCZVQsjBWSnW3cAhkluk20L
         XaQKpW5UB0K1hfMiAe1DGpLuheI3G/dbkIp9up+2bkoOA804LKbP+O+V6KMVTKxwZjcS
         kRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168739; x=1687760739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8/dDsCJrSYL8PrYUOdwWzwHq/4ZBZ2SonINWnKkMkw=;
        b=PhXyWvdOwil/ES1mfesqPWSGsQsi/u5VlWnTCmnbw21czUFsuvCKWiwuDKg9zp7fbp
         woiy4ikSHijdADPKJhiDYvonaqrKXHkos+mzurjFJQb7tijfqQvoyHf/PfOGE5zbndAm
         q4N7xkk03OBUr8IR0BsPyp7e+2Cv6Ai9l/vtcg76DMkN+bG6wdjdSa2CtlpTrM3U5fxv
         RAzK6ZGlMWZEUWPDhmnLNLgMfycYFNH0+5VPd4h/8BiLCfH/08gNZgL8nIC//tpFILu8
         +yNjBBp/dDnfBOolumo/ULU9AmLoJdEWlIC5r5uWzAEb91vSr+sWyDwTT7CMShApS5Ed
         7laQ==
X-Gm-Message-State: AC+VfDwLI33lBB/E6ykeyDt2MY3/p3BH06GK94Er6zYLuCoJA1VpCCAp
	lo0yd79GHlRHjqy37RqqTm5S1VWJujygz+/t
X-Google-Smtp-Source: ACHHUZ7N5hy9HmgeSqJ4gDLfA6I6yOBq3MIgpn4wocdL87bfDE6ZKMeJjA7bmJ9uk35aF2ytxL+bLg==
X-Received: by 2002:a05:600c:228c:b0:3f5:fbd0:94ab with SMTP id 12-20020a05600c228c00b003f5fbd094abmr3343231wmf.3.1685168739117;
        Fri, 26 May 2023 23:25:39 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f4fffccd73sm7347071wme.9.2023.05.26.23.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:25:38 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 4/5] recipetool: create: npm: Add support to handle peer dependencies
Date: Sat, 27 May 2023 08:25:31 +0200
Message-Id: <20230527062532.938477-4-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
References: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 06:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181794

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


