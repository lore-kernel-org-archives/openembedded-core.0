Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D45C9778A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:01:55 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id j90so61390224lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7ah/LQldhwKPW1YsaLaJ5NtHve4xCPMsUWPT3aaOaM=;
	b=ETlGL15JpB/iw8cvQNr7wEpZ5N/ZHdUDVatYyJfHOS8qBUImYJNxd7CpS7UxhrPRK9
	h3GlqJM4gzD8I8+1wmzYd/mfq2NJcYK5yEu4PgJuMvt/u3klskAbq4A8Y9lp+KkKbTdp
	rGp/QP9eUrHVmVVzgswDqvRV75yaiILHpl55rw6lCjMqabc5YpuXhCDkJa7F2WhCkmoS
	0c9EImpNGqw/2gxoPXzFABkNgHJMp8AbsZgpkKOWABVxszzGF6HFlnbNpDcG0CFDGD1S
	/HDkRgawAtFkqiezN0zFyOyNUTwbRVtqSD+JHk6zaayEytJNTrNshuidSxFsljJZbsbQ
	D0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n7ah/LQldhwKPW1YsaLaJ5NtHve4xCPMsUWPT3aaOaM=;
	b=L4bHV5P7mF+pO1+H2SFKngWf95fK3ayY+vkS5l+80Fj7Fp9UM3pxDaIboqi2GUBB7e
	wviWzQh0EWililkq/pfxEw2fodb4kBKWARzgBHjz/wZ7Px/EFhDh58zCCLkp3Hixpi7b
	oyurGph+w6gDEb1haCCzU2UzJUXmpMQ7ALs/jwNj/snFyc1WUWKmCMP5cZ3fa09V5PSS
	0UeLfBF0qBVSHiBa29BUKb7Dlam969JhI/PLWVOXt9oH3Z3YEFSKyCyR9Vdnswn5LStg
	j6MZ/vtSloSO/br0/fN6lJzYvQTbPv2N7J92vUQcTAH426evjyfa9Y3VXd0Qz9uUkukH
	Vtpg==
X-Gm-Message-State: AMke39nxCUX1B5RGQyg1NrEiPpoy+w6Ci3hXgpxSFWgGWVkN40CCuyacXZUiWKpp3xAnbA==
X-Received: by 10.25.99.27 with SMTP id x27mr8001641lfb.104.1489399316466;
	Mon, 13 Mar 2017 03:01:56 -0700 (PDT)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	r10sm2234296ljd.54.2017.03.13.03.01.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 03:01:55 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:01:52 +0100
Message-Id: <68af93e717af43db85d638b159e4d5450a877a05.1489399045.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489399045.git.anders@chargestorm.se>
References: <cover.1489399045.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 1/2] devtool/recipetill: npm install of devDependencies
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
X-List-Received-Date: Mon, 13 Mar 2017 10:01:56 -0000

Web applications built using e.g. angular2, usually requires that the
packages in devDependencies are available.

Thus, add an option '--fetch-dev' to both devtool add and recipetool, to
add npm packages in devDependencies to DEPENDS.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/lib/devtool/standard.py      |  3 +++
 scripts/lib/recipetool/create.py     |  6 ++++++
 scripts/lib/recipetool/create_npm.py | 23 ++++++++++++++++++-----
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5bd498c..07c1400 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -150,6 +150,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' --src-subdir "%s"' % args.src_subdir
     if args.autorev:
         extracmdopts += ' -a'
+    if args.fetch_dev:
+        extracmdopts += ' --fetch-dev'
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -1823,6 +1825,7 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree (deprecated - pass as positional argument instead)', metavar='URI')
+    parser_add.add_argument('--fetch-dev', help='For npm, also fetch devDependencies', action="store_true")
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
     parser_add.add_argument('--autorev', '-a', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1be3f14..648f2d6 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -599,6 +599,11 @@ def create_recipe(args):
         lines_after.append('INSANE_SKIP_${PN} += "already-stripped"')
         lines_after.append('')
 
+    if args.fetch_dev:
+        extravalues['fetchdev'] = True
+    else:
+        extravalues['fetchdev'] = None
+
     # Find all plugins that want to register handlers
     logger.debug('Loading recipe handlers')
     raw_handlers = []
@@ -1134,6 +1139,7 @@ def register_commands(subparsers):
     parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_create.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
     parser_create.set_defaults(func=create_recipe)
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 158029f..a215026 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -101,7 +101,7 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues['extrafiles']['lockdown.json'] = tmpfile
         lines_before.append('NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"')
 
-    def _handle_dependencies(self, d, deps, optdeps, lines_before, srctree):
+    def _handle_dependencies(self, d, deps, optdeps, devdeps, lines_before, srctree):
         import scriptutils
         # If this isn't a single module we need to get the dependencies
         # and add them to SRC_URI
@@ -115,6 +115,10 @@ class NpmRecipeHandler(RecipeHandler):
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
@@ -197,8 +201,9 @@ class NpmRecipeHandler(RecipeHandler):
                 if 'homepage' in data:
                     extravalues['HOMEPAGE'] = data['homepage']
 
-                deps, optdeps = self.get_npm_package_dependencies(data)
-                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, lines_before, srctree)
+                fetchdev = extravalues['fetchdev'] or None
+                deps, optdeps, devdeps = self.get_npm_package_dependencies(data, fetchdev)
+                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, devdeps, lines_before, srctree)
                 if updated:
                     # We need to redo the license stuff
                     self._replace_license_vars(srctree, lines_before, handled, extravalues, tinfoil.config_data)
@@ -293,18 +298,26 @@ class NpmRecipeHandler(RecipeHandler):
 
     # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
     # (split out from _getdependencies())
-    def get_npm_package_dependencies(self, pdata):
+    def get_npm_package_dependencies(self, pdata, fetchdev):
         dependencies = pdata.get('dependencies', {})
         optionalDependencies = pdata.get('optionalDependencies', {})
         dependencies.update(optionalDependencies)
+        if fetchdev:
+            devDependencies = pdata.get('devDependencies', {})
+            dependencies.update(devDependencies)
+        else:
+            devDependencies = {}
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


