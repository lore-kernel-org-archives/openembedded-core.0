Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26F8C7EE2C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:07:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5983.1685168251152313113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZYmCdWRV;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso10129165e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168249; x=1687760249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=ZYmCdWRVazNTzC5Dpa74hnaMq47nkaZnGvKAi3F8wDkDqmRj79vhxWpH+AR4UAwl3X
         4KMAptvlGSPFP+Us7XiAURndsY/j21zyaAwiejdtL6W98k1heo6ti13tfWHkcJl2EfEx
         jrdOjT0UMO3NhydUx3oW6niJTLIXKmSSvV97CBiH5BO83slnbBC68RLrjDCDKP3riT5U
         t2wl26bikvvIqQFrOIutYGDzP5fBlfYO3B5Q5mFILYBTdc1cSq2b6pDTVmHmcAdTF6U5
         ujrRtSmcB5ERVLccKWaaeZtn7kCsm+8942Se2MW1n/xbb0mJGXgEzNJiQWB76AlrCKkW
         JF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168249; x=1687760249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=X64v7S45vObaSxPb7tiibawpXlMODAi1fgYYv/i2UFt7B0znz6Y97IA8Uyr6AJR4x6
         MkyQHE7NS7SeqkB878wfbrkJCuttfiDCECw37P8zhu7AvCmGBKdigf/4zw3NATX0mSPW
         Zj+85yXprQp43mfSg9csbqhsKuu55C+beHPQx8qZjOnz4ccTO+B/X9ToPU7J0GNVyl/+
         8RjNKGMw68RmqQZesdukgX0d0Z5U22eXZKT4njojziRu5NJBV2pQQjoL/X04fhCdfoij
         ULaS2BNximxaroXpXHhrZerpCdeHe9khwViuYytp2LyPpzgGDvJ2xukB/l73eUr+dJ0f
         Go9w==
X-Gm-Message-State: AC+VfDx60OmiCS0EPx4O0FuLWCCN3jcZrTVtH2sts1+McJMAASrkuY/u
	QqpHlCadYkD5bc+ZcxtTW6ydHKjnU99MMFEp
X-Google-Smtp-Source: ACHHUZ6pQPVXD6h5TcL+9A9V394xFDfIwSAL93YpqhXt8z3S61IR/cHxCtyfj6nVpHBycW2rN5TikQ==
X-Received: by 2002:a1c:4b11:0:b0:3f1:70a2:ceb5 with SMTP id y17-20020a1c4b11000000b003f170a2ceb5mr2856573wma.13.1685168248776;
        Fri, 26 May 2023 23:17:28 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm7014623wrw.113.2023.05.26.23.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:17:28 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 1/5] recipetool: create: npm: Remove duplicate function to not have future conflicts
Date: Sat, 27 May 2023 08:17:22 +0200
Message-Id: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181798

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

Npm packages do not have yocto friendly names. fore instance we can have names like
"@example/npmPackage"

npm fetcher has a function that convert these names to yocto friendly names.
But in recipe tool we have an other function (duplicate).

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 scripts/lib/recipetool/create_npm.py | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 3394a89970..e667a4d19b 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -13,6 +13,7 @@ import sys
 import tempfile
 import bb
 from bb.fetch2.npm import NpmEnvironment
+from bb.fetch2.npm import npm_package
 from bb.fetch2.npmsw import foreach_dependencies
 from recipetool.create import RecipeHandler
 from recipetool.create import get_license_md5sums
@@ -30,15 +31,6 @@ def tinfoil_init(instance):
 class NpmRecipeHandler(RecipeHandler):
     """Class to handle the npm recipe creation"""
 
-    @staticmethod
-    def _npm_name(name):
-        """Generate a Yocto friendly npm name"""
-        name = re.sub("/", "-", name)
-        name = name.lower()
-        name = re.sub(r"[^\-a-z0-9]", "", name)
-        name = name.strip("-")
-        return name
-
     @staticmethod
     def _get_registry(lines):
         """Get the registry value from the 'npm://registry' url"""
@@ -143,7 +135,7 @@ class NpmRecipeHandler(RecipeHandler):
 
         # Handle the dependencies
         def _handle_dependency(name, params, deptree):
-            suffix = "-".join([self._npm_name(dep) for dep in deptree])
+            suffix = "-".join([npm_package(dep) for dep in deptree])
             destdirs = [os.path.join("node_modules", dep) for dep in deptree]
             destdir = os.path.join(*destdirs)
             packages["${PN}-" + suffix] = destdir
@@ -173,7 +165,7 @@ class NpmRecipeHandler(RecipeHandler):
         if "name" not in data or "version" not in data:
             return False
 
-        extravalues["PN"] = self._npm_name(data["name"])
+        extravalues["PN"] = npm_package(data["name"])
         extravalues["PV"] = data["version"]
 
         if "description" in data:
-- 
2.25.1


