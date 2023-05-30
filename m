Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540B9C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.41.1685485704504445814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qCbACiKN;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so53754825e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485702; x=1688077702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMD7EyVX2OrlngbQaE672YAgUmndMTtl+bj5fJxXQcI=;
        b=qCbACiKN9K1WYOQ3xXZkAKjhLVLtvsUmxaojlz1CnGlHiIUv6Y8eOzFP8LsXEevrIq
         r65VlrFoyfaD2KBiMQMMAhMm86fzxztjWtNiG2QXAbCi5PbamLlffW/aMwRcTX/11wHG
         PA3hyC9zyBnVXGmJRttlX3j2NTALua74jrHVMDa7qmlj5dQYB7vuoT27sQrovupQTwfH
         fj0xHwa0bISUcMUc4nOEwDEirvZlDj3esPW+Nm8AHR7Qr1z7lv8rXy6KbknPe3eWbY0C
         ul+XsgmCimngRH4u85RyVCf62H2DQBxTJb8dOE834r+SGWgQmQeyL9P2T1CZrnzbsary
         YWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485702; x=1688077702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMD7EyVX2OrlngbQaE672YAgUmndMTtl+bj5fJxXQcI=;
        b=Fwujq1nL/jlShu6gRpQuR0QebgTBkulpSejMcsZ5viIJ04bL3S8fWqXse0A+xUd/oE
         cwOSqpPHUl3LmDcxr/Fup0M5ra5aTH2iNYtD0R7uGKfgOW1MIFNkENcSHQN5+gWfSkxi
         rYJZh1Lgx+T1fNd5/jq9bsmAIX4+OyA6roHX9vYM6GDspayt+RgO4CaDO9ueJ1xTomI9
         oSAG+rNpn8u3BxQcKidSa3GRD6ReTwOIAuOlTRC0RU6HHHWD0mbGnJhvbB+3T1+ZIgaM
         mA66VImV5p8a20GQGeo5Oy9Gqcc4ZoA3sA0jftKpYIRrJnPWlIKKIIe/WSO2f2pIYvWH
         4oAQ==
X-Gm-Message-State: AC+VfDxx2QUOiZ/QJapzSkYkG8SQDO0JYzjTEOZvnBcnU+oZX7xkh7fE
	TrbGm0hIxCu8mV5byj5z7dihtDjLwje8lhE5
X-Google-Smtp-Source: ACHHUZ5xUSJWD8QzOFqYaFT675JFUB6MUZMur5t8/yB6T/kWdL4oXOAfSAxqbpq3apPOKnZkUIo8LA==
X-Received: by 2002:a7b:cb9a:0:b0:3f4:23a4:7a93 with SMTP id m26-20020a7bcb9a000000b003f423a47a93mr2973033wmi.25.1685485702421;
        Tue, 30 May 2023 15:28:22 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:22 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 6/6] classe-recipes: npm: Add support for dependencies and devDependencies
Date: Wed, 31 May 2023 00:27:52 +0200
Message-Id: <20230530222752.42503-6-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181966

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

Adapt the npm classe for the shrinkwrap of Nodejs 18, and seperate
dependencies and dev dependencies.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes-recipe/npm.bbclass | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index c1944ca14e..91da3295f2 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -153,7 +153,11 @@ python npm_do_configure() {
 
     if has_shrinkwrap_file:
        cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
-       cached_shrinkwrap.pop("dependencies", None)
+       for package in orig_shrinkwrap["packages"]:
+            if package != "":
+                cached_shrinkwrap["packages"].pop(package, None)
+       cached_shrinkwrap["packages"][""].pop("dependencies", None)
+       cached_shrinkwrap["packages"][""].pop("devDependencies", None)
        cached_shrinkwrap["packages"][""].pop("peerDependencies", None)
 
     # Manage the dependencies
@@ -177,9 +181,16 @@ python npm_do_configure() {
             dep["integrity"] = _npm_integrity(tarball)
             if params.get("dev", False):
                 dep["dev"] = True
-            if "dependencies" not in cached_shrinkwrap:
-                cached_shrinkwrap["dependencies"] = {}
-            cached_shrinkwrap["dependencies"][name] = dep
+                if "devDependencies" not in cached_shrinkwrap["packages"][""]:
+                    cached_shrinkwrap["packages"][""]["devDependencies"] = {}
+                cached_shrinkwrap["packages"][""]["devDependencies"][name] = pkg['version']
+
+            else:
+                if "dependencies" not in cached_shrinkwrap["packages"][""]:
+                    cached_shrinkwrap["packages"][""]["dependencies"] = {}
+                cached_shrinkwrap["packages"][""]["dependencies"][name] = pkg['version']
+
+            cached_shrinkwrap["packages"][destsuffix] = dep
             # Display progress
             nonlocal progress_done
             progress_done += 1
@@ -212,7 +223,7 @@ python npm_do_configure() {
     # Configure the cached manifest file and cached shrinkwrap file
     def _update_manifest(depkey):
         for name in orig_manifest.get(depkey, {}):
-            version = cached_shrinkwrap["dependencies"][name]["version"]
+            version = cached_shrinkwrap["packages"][""][depkey][name]
             if depkey not in cached_manifest:
                 cached_manifest[depkey] = {}
             cached_manifest[depkey][name] = version
-- 
2.25.1


