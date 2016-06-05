Return-Path: <kad@kad.name>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 038497715A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:45:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m124so11084011wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ij4z8Rq3mHgRzhsLkri7utbYjF46/cufjtlLfvR1e9A=;
	b=p9g3nrZ69uNpZjv+grJkyD+3tDgELNljevQxWx0ecMcvkqLK5YmV8VsFbLTL39d/zR
	QQzDPsniVLruWfRd3Qc+b+LOWCmWo0JqUoaU1XYPAzH4XibAvI8wy0UP0bXReIt5gAGv
	pgbbnwU24P2BtQCQuh03HbK0fWlFmTfPSzGX6lHbtg5fzk7+oAcDsl2qqgRYh8IZWlE1
	gCeXxQigeWEY7aI2GO5pBexb3cPQ8vwbvs04/xmzqZL47eoUFE+IeTJlDhn/R+QfEstg
	95N7riQ/Zmdx+TJeIBbaAmKazo5SC1JpPRC0OMShI1aFV2FEoe/9m7izWFjHQ7u7TtKo
	Ehiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ij4z8Rq3mHgRzhsLkri7utbYjF46/cufjtlLfvR1e9A=;
	b=XqmLg9RpV8WRNCarJEHL3D2ezb8MSQBvs4NbdmFnsVZhZmEV+5MDAee6SpnQbeB9PS
	Gtps2YbmWkt1v9IIgzDUBqnGj2YSROQkHjL/q1kreo4XykYnFihPUFdYk7qUp+TwyA5L
	PxG1SL0ahixbnj2B60Es1QnJwrlv0r+JuuHAjGqxqkBvniaML2pqdorvjRL/Dv4s7bsT
	w4Hzz8lJYftNEKP7njP1mAI3POLLrEbQ7pDiS5S0pSJuDPM8y8KLG46oo4x56rDGFjoG
	nsUzc2ewbdGLQ8eXT9XlpzsNYC5c7lwN6+zzGznC1HWBkSHGC+U4zAG8lxkIP0nx7wSx
	cf/A==
X-Gm-Message-State: ALyK8tKmr4H+6an8BKuc7SHi1myptk7pGBp1Hd7y43ZAXHDBs8GEElhHv79+0EPayU7n2A==
X-Received: by 10.28.230.200 with SMTP id e69mr8990985wmi.53.1465163100945;
	Sun, 05 Jun 2016 14:45:00 -0700 (PDT)
Received: from localhost.localdomain (dsl-hkibrasgw3-54fb77-110.dhcp.inet.fi.
	[84.251.119.110])
	by smtp.gmail.com with ESMTPSA id u70sm1125649wmd.4.2016.06.05.14.44.59
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Sun, 05 Jun 2016 14:45:00 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 00:44:29 +0300
Message-Id: <20160605214429.63811-1-kad@kad.name>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH] oe-pkgdata-util: new option to provide full info for binary package(s)
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
X-List-Received-Date: Sun, 05 Jun 2016 21:45:03 -0000

New option can be used for displaying full information about binary
package(s), including name, full version, recipe name, recipe full version
and package size.

This information can be useful to produce detailed image manifest
for further analysis.

List of packages can be specified as command line or can be read
from file (e.g. image manifest)

Output format:
{PKG} [PKGE:]{PKGV}[-{PKGR}] {PN} [PE:]{PV}[-{PR}] {PKGSIZE}

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 scripts/oe-pkgdata-util | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index b16ecc9..efc54c1 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -274,6 +274,58 @@ def lookup_recipe(args):
         items.extend(mappings.get(pkg, []))
     print('\n'.join(items))
 
+def package_info(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    packages = []
+    if args.file:
+        with open(args.file, 'r') as f:
+            for line in f:
+                splitline = line.split()
+                if splitline:
+                    packages.append(splitline[0])
+    else:
+        for pkgitem in args.pkg:
+            packages.extend(pkgitem.split())
+        if not packages:
+            logger.error("No packages specified")
+            sys.exit(1)
+
+    mappings = defaultdict(lambda: defaultdict(str))
+    for pkg in packages:
+        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
+        if os.path.exists(pkgfile):
+            with open(pkgfile, 'r') as f:
+                for line in f:
+                    fields = line.rstrip().split(': ')
+                    if fields[0].endswith("_" + pkg):
+                        k = fields[0][:len(fields[0]) - len(pkg) - 1]
+                    else:
+                        k = fields[0]
+                    v = fields[1] if len(fields) == 2 else ""
+                    mappings[pkg][k] = v
+
+    if len(mappings) < len(packages):
+        missing = list(set(packages) - set(mappings.keys()))
+        logger.error("The following packages could not be found: %s" %
+                     ', '.join(missing))
+        sys.exit(1)
+
+    items = []
+    for pkg in packages:
+        items.append(("%s %s%s%s %s %s%s%s %s" % (
+            pkg,
+            mappings[pkg]['PKGE'] + ":" if mappings[pkg]['PKGE'] else "",
+            mappings[pkg]['PKGV'],
+            "-" + mappings[pkg]['PKGR'] if mappings[pkg]['PKGR'] else "",
+            mappings[pkg]['PN'],
+            mappings[pkg]['PE'] + ":" if mappings[pkg]['PE'] else "",
+            mappings[pkg]['PV'],
+            "-" + mappings[pkg]['PR'] if mappings[pkg]['PR'] else "",
+            mappings[pkg]['PKGSIZE']
+        )).strip()
+        )
+    print('\n'.join(items))
+
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     recipedatafile = os.path.join(pkgdata_dir, recipe)
     if not os.path.exists(recipedatafile):
@@ -469,6 +521,13 @@ def main():
     parser_lookup_recipe.add_argument('pkg', nargs='+', help='Runtime package name to look up')
     parser_lookup_recipe.set_defaults(func=lookup_recipe)
 
+    parser_package_info = subparsers.add_parser('package-info',
+                                          help='Shows version, recipe and size information for one or more packages',
+                                          description='Looks up the specified runtime package(s) and display information')
+    parser_package_info.add_argument('pkg', nargs='*', help='Runtime package name to look up')
+    parser_package_info.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
+    parser_package_info.set_defaults(func=package_info)
+
     parser_find_path = subparsers.add_parser('find-path',
                                           help='Find package providing a target path',
                                           description='Finds the recipe-space package providing the specified target path')
-- 
2.8.3


