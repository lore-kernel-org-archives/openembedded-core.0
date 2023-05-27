Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8D9C7EE23
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 06:25:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5827.1685168736669166023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=InVTRIHO;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so15645515e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168735; x=1687760735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=InVTRIHO2mDfCTCls2LkklMnmPjiT50g8WNyCHmVPJrfLe7SXA4z2UAr0X3tOZJgSD
         Tr8W+dS3L+j3kFIyvIXYLoG5j/L8uOZibRoXRnkg7sU6sbKJDzIqj6EhOq3TjallTSgz
         +POtxWa9GK151W6xVvBvEcfApTFYRvBbZlJZ0uS4MVX0dissYn6qA5fcduK+ZK/5EWUk
         M7www1yhvNryFqdQG/fwslYldw57rsfGmrCFjtXSKFjT7Q1tfspHLharbRjdimzMLYnC
         YFq+nZAQcGsCc136CoE7ESBhwn5ulI+25bg/r91os3CYYrNhQ057W0lJ+rIJ+JMgVqm2
         d7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168735; x=1687760735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=i1axdj64kw9nI8zS2Sotor1E8KSWmDLOowfbhMHNmJtnSN8rzsUIjlNgji7vf7cYxD
         GH2ghSyPd5RrRkM7a22bLici3esRE3icnAlgSAfPZYpcruC0Gfw489fO/0LHD8A8eQDB
         +KdVNE7HesboLWGS9e1LoNT8gzcw49tuotGxX5ZmFGOOwiPF6SCbfp7EL688765Jr8wV
         7w+ozvhhTrMs4cioINnz9MenKeX3aSGE/bc5pOK7p9Cnc3micJKbptupskg1v0MDfE83
         s/UwRcamaQeBCdqxL5EkV9LSb/LtRDgPE54u1wBXEgUpxEsVhLdscnotYoHcTpZfKRYv
         Ktng==
X-Gm-Message-State: AC+VfDxLsFiN1Fhd9054dVw1OQO6snbtcRvSg7UYp9PlBmKvOBw5PaHO
	FGtqsgij/Ov+EJGlosbZfwPNKoo7VUSQUWWP
X-Google-Smtp-Source: ACHHUZ6ZdbrGcM8nMXHQ/LwFsRNydMogCLE1t4GyaBghKToRo8G+oreMJB2uh8zqzyFu3hKdhf3g7A==
X-Received: by 2002:a05:600c:246:b0:3f4:e4a2:9f7f with SMTP id 6-20020a05600c024600b003f4e4a29f7fmr3662773wmj.36.1685168734633;
        Fri, 26 May 2023 23:25:34 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f4fffccd73sm7347071wme.9.2023.05.26.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:25:34 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 1/5] recipetool: create: npm: Remove duplicate function to not have future conflicts
Date: Sat, 27 May 2023 08:25:28 +0200
Message-Id: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 06:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181791

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


