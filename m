Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672DDC7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.27.1685485695374536919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rFmf3oGF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso37546375e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485693; x=1688077693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=rFmf3oGFyQSwD8vGcF8pskMR+GNJiZLGZdJOx44dnIR3F07e6hL0zzkJhKwVhfA3lQ
         OpJ5E9sJSIAMEcibmxU6nb1aVjHGUYhBajQoHO0jDTrIAgBwGsqPlRzsxb9txA1zZDvx
         uJspsf4+btRX//QbEdVfugaGAs7pz+dGv4LxUm5ZA0y2njXTV+7gR1vSIO/5zG0493I5
         TyLNzHJ7iSYyJM0+uSMEDWq8ZIHzRb1norIqcde2Na9Hx9TmhzbqU7nt3C8Sxzgm92QO
         fbmPQFrKki0wuCETMLRoqBxzThV6WSIFMrOE/wWt3INK57CKaLU8yArDW181h0GRE0cs
         QPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485693; x=1688077693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bUpakl76o27hJf6ZRoQnS9ltw01zvaQbrcJZKpx2eI=;
        b=S/p3jwWHMZzd/+J7uQmTDmtw45Eu/q/9JQzDvcXU+SRMdQt+NFNq0X+JTGfzehjxig
         dc0yb1Cw0imujDUmbJs2zAj04sVxgz+1cZLLJQAQuqGOLIgFJD58wNJQFb8+U9A07epY
         IVhvxf6oIrBhY1FL2bgIFD8unKUFpjUL/we4HTIJzNqck3CdGv1SZu3qSKHW3Qij8UQw
         tM6OjJLpt3hmZmBh6VbxE3JLZwifm+0fwF1OYduNgCsJiXdW6FTWvZ1lnOqjBIVWxLfA
         +vIjvqXxWBgYrk0zlDUyMglTwIgCf8hQATTVb/FxuOJOQDKYUgP9O7ksOb6KC166ehYQ
         STEw==
X-Gm-Message-State: AC+VfDxiYMiJtDjnq2VSoWMCL6yXIqNuRR0/eqvbK7GWeTFUOvia8pFU
	uYswKSGDd6LHy6yZNCRiJUKDL3UmLrJPMG5I
X-Google-Smtp-Source: ACHHUZ5TjehObQEUlbquGWihj/Tyc9YzYNQsfRW8nZg3dAlkL4s5BFJG8Ob2O0l5Og1rAq4FKPRZig==
X-Received: by 2002:a1c:7918:0:b0:3f6:244:55e3 with SMTP id l24-20020a1c7918000000b003f6024455e3mr2411461wme.35.1685485692700;
        Tue, 30 May 2023 15:28:12 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:12 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 1/6] recipetool: create: npm: Remove duplicate function to not have future conflicts
Date: Wed, 31 May 2023 00:27:47 +0200
Message-Id: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181961

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


