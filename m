Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 058A477553
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:04 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id a6so22560579lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jeDbk41IveMsIaHe4bZNYgGlB4xMKZ538SuRlA7eS1c=;
	b=LU8+UoLmKsfWMjRr9lz/HJD03U2Uaj77DpzupnuTcU/NkSuZRWB6AeonQOexBpYbMI
	ENhW/vLtYqNHEnrsO8HNbxAwFqHXT21Xv8V4kgU5neNFoZRriKLLxl4Lv9KoWlGt8cUb
	Ntn5B9aUsTaWm42mZby+s8d+If7lqEoDXaVSdAeheIuvVO/ALvJLFu7CADgrYV90cAN3
	+mt5KV+z9623yYyQpa+wjzV7c8xkLEudzacZywheeBaBWncvkFSGPUlH5lr2FFU058qR
	Mofhqp96VMMI1pFQxN3zHaLxxxXsYR0S3zmzQM++UWC0zv8glIC37/1XmhlRg/qf9BlO
	G1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jeDbk41IveMsIaHe4bZNYgGlB4xMKZ538SuRlA7eS1c=;
	b=kmGe44OkJas8D4LRlqXnqYzv6mx5+JW4vIM8PMIctlxXUs1ou6E9CgGEgOwnYk0UT1
	eTb0eZomEzM8rVQXSnPBxd+0vbP4d+8A04ucWS3ha9hp4BmR8YIjh+yaJ+EEaTbaHxN9
	1c5uN12WXiO0bfWqWNtifPPRN6NjCQYHIMZqwiiD/jKUMnPkaAQ9F6zklYjn2xvzDqO5
	kbail9gxID2f6VMyAeo6ticnljYC8EzZK4VemHV9XRn6Vnx/3fcwvnU0RYvi+xfjm7wN
	U+eeQb1CFY9UFMG8wTrbsrUIx80losKrDcptgXzwZnTg4JzuPrsPxbuWhTjMHswtIPHj
	iCkw==
X-Gm-Message-State: AMke39lkVVC/h/mqUyT+NUbkpFR59EkqETHOI/Q0nijsxReH1/0gVg33u1EFwPX0qfpt4g==
X-Received: by 10.46.88.85 with SMTP id x21mr3264085ljd.90.1488388805325;
	Wed, 01 Mar 2017 09:20:05 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	187sm1191784ljf.32.2017.03.01.09.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:04 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:55 +0100
Message-Id: <1d9e36a9b92ba941e472aef5ed9dd32ec29404e9.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/7] create_npm.py: add devDependencies to depends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2017 17:20:05 -0000

Web applications built using e.g. angular2, usually requires that the
packages in devDependencies are available.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/recipetool/create_npm.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 3ba6de0..11b2950 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -83,7 +83,7 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues['extrafiles']['lockdown.json'] = tmpfile
         lines_before.append('NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"')
 
-    def _handle_dependencies(self, d, deps, optdeps, lines_before, srctree):
+    def _handle_dependencies(self, d, deps, optdeps, devdeps, lines_before, srctree):
         import scriptutils
         # If this isn't a single module we need to get the dependencies
         # and add them to SRC_URI
@@ -97,6 +97,10 @@ class NpmRecipeHandler(RecipeHandler):
                         depdata = self.get_npm_data(dep, depver, d)
                         if self.check_npm_optional_dependency(depdata):
                             deplist[dep] = depdata
+                    for dep, depver in devdeps.items():
+                        depdata = self.get_npm_data(dep, depver, d)
+                        if self.check_npm_optional_dependency(depdata):
+                            deplist[dep] = depdata
                     for dep, depver in deps.items():
                         depdata = self.get_npm_data(dep, depver, d)
                         deplist[dep] = depdata
@@ -179,8 +183,8 @@ class NpmRecipeHandler(RecipeHandler):
                 if 'homepage' in data:
                     extravalues['HOMEPAGE'] = data['homepage']
 
-                deps, optdeps = self.get_npm_package_dependencies(data)
-                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, lines_before, srctree)
+                deps, optdeps, devdeps = self.get_npm_package_dependencies(data)
+                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, devdeps, lines_before, srctree)
                 if updated:
                     # We need to redo the license stuff
                     self._replace_license_vars(srctree, lines_before, handled, extravalues, tinfoil.config_data)
@@ -277,15 +281,20 @@ class NpmRecipeHandler(RecipeHandler):
     def get_npm_package_dependencies(self, pdata):
         dependencies = pdata.get('dependencies', {})
         optionalDependencies = pdata.get('optionalDependencies', {})
+        devDependencies = pdata.get('devDependencies', {})
         dependencies.update(optionalDependencies)
+        dependencies.update(devDependencies)
         depsfound = {}
         optdepsfound = {}
+        devdepsfound = {}
         for dep in dependencies:
             if dep in optionalDependencies:
                 optdepsfound[dep] = dependencies[dep]
+            elif dep in devDependencies:
+                devdepsfound[dep] = dependencies[dep]
             else:
                 depsfound[dep] = dependencies[dep]
-        return depsfound, optdepsfound
+        return depsfound, optdepsfound, devdepsfound
 
     # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
     # (split out from _getdependencies())
-- 
2.10.2


