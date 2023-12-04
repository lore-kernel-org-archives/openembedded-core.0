Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB60C10F05
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.73102.1701705587783915818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cF8zCIgE;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so48107815e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705585; x=1702310385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBbEqi6s9no++CKjmIJSgIW7ZpeYRQv6BzDLZ4a8D3c=;
        b=cF8zCIgEOXdfaZAXhYSsA5MydT860WBYtrV1nSawNgLCbH+pqD00MDks2HNpn9mbxK
         9swuOD58xfXab7EewolmmEukjrOf9SPhUL3T/nCoSEDHNvAcghBfWOTMKAclBkrG4HeJ
         ecQywta1+Di7PsxLXuuh54MBmk0VdJmqyhM7uPbeNEaSAUHleKf6ll+Y8U0iI2tVbgX2
         PFnMadp1QeelVDkOkJFw75IDmtOCPQ5z94txGrSAMTkXiEw4+SKk41oeBSmK4Z1l0TxV
         ChIvUGfjtOUGArnZJS5cti/YDEigBmeGuY3zook55BYX11/LjKobajJ+DCtnd2JRqYWh
         OPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705585; x=1702310385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBbEqi6s9no++CKjmIJSgIW7ZpeYRQv6BzDLZ4a8D3c=;
        b=ndb68BfyyfdkrNFo8mFvA4TNgylH8RpKw9vFg/XX0WP8pumkvirKG0RdTBwtU6AQ2r
         TCemVfEaFGodOGrvKAANOOQYK3U2Fw5KgDnQ0mvDEimTIl/LVsw7rtm4VLCbVtBDtJZc
         Pn7o3X9ignS+peBaWDb3PpIQvZV1t4RBaQcNgYSzGZFyqdB/rwIE2M3jKEWCNa4pNSsT
         0w17JoRLVILkIuO+b4f51JajGswdviK6Fnjq8IhxcDGyXX6pSfCUkuboQVXM4M5Gyykl
         +RmFqxC/3tKJbM1Xq9P+hTFKPWHQYuAylPPkx8QMLU6HBJM35sJY0S0VEhTmbY48L3v4
         2LBg==
X-Gm-Message-State: AOJu0YxhmXDsaGf2Z5hQox94SOkfEWzSxYmbH9zdFON9yU+xrLFi8pfF
	9JZE/mLFOjDrCkdm9oRo7rD+TtTwmDu4rfTGVHPyzQ==
X-Google-Smtp-Source: AGHT+IHxd9IfDIS0zRJIq13/t09INSVU5c+lU+oGoPyogKuBstLpH+C9+BENV5Gf8dkgFuYqbsscTw==
X-Received: by 2002:a7b:cb42:0:b0:40b:5e4a:40a2 with SMTP id v2-20020a7bcb42000000b0040b5e4a40a2mr2348191wmj.194.1701705585607;
        Mon, 04 Dec 2023 07:59:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 5/7] recipetool: create_buildsys_python: add pypi support
Date: Mon,  4 Dec 2023 16:59:32 +0100
Message-ID: <20231204155934.836992-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191759

Today, we can use devtool/recipetool to create recipes for python projects
using the github url or the direct release tarball of the project, but the
create_buildsys_python plugin doesn't support the pypi class, since we cannot
know from the extracted source if the package is available on pypi or not.

By implementing the new optional process_url callback, we can detect
that the url is a pypi one (i.e 'https://pypi.org/project/<package>')
and retrieve the release tarball location.
Also detect if the url points to a release tarball hosted on
"files.pythonhosted.iorg" (i.e https://files.pythonhosted.org/packages/...)

In both cases, adds the pypi class, remove 'S' and 'SRC_URIxxx'
variables from the created recipe as they will be handled by the pypi class
and add the PYPI_PACKAGE variable

This helps to produce cleaner recipes when package is hosted on pypi.

If the url points to a github url or a release tarball not coming from
"files.pythonhosted.org", the created recipe is the same as before.
One can also use the newly added "--no-pypi" switch to NOT inherit
from pypi class on matching url, to keep legacy behaviour.

To create a recipe for a pypi package, one can now use one of the
new following syntax (using recipetool create / devtool add):

* recipetool create https://pypi.org/project/<package>
* recipetool create https://pypi.org/project/<package>/<version>
* recipetool create https://pypi.org/project/<package> --version <version>

or the old syntax:
* recipetool create https://files.pythonhosted.org/packages/<...>

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py               |  3 +
 scripts/lib/recipetool/create.py              |  1 +
 .../lib/recipetool/create_buildsys_python.py  | 72 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d53fb810071..f18ebaa70d3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -147,6 +147,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' -a'
     if args.npm_dev:
         extracmdopts += ' --npm-dev'
+    if args.no_pypi:
+        extracmdopts += ' --no-pypi'
     if args.mirrors:
         extracmdopts += ' --mirrors'
     if args.srcrev:
@@ -2260,6 +2262,7 @@ def register_commands(subparsers, context):
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree (deprecated - pass as positional argument instead)', metavar='URI')
     parser_add.add_argument('--npm-dev', help='For npm, also fetch devDependencies', action="store_true")
+    parser_add.add_argument('--no-pypi', help='Do not inherit pypi class', action="store_true")
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
     group = parser_add.add_mutually_exclusive_group()
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5c5ac7ae403..963aa91421e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1413,6 +1413,7 @@ def register_commands(subparsers):
     parser_create.add_argument('-B', '--srcbranch', help='Branch in source repository if fetching from an SCM such as git (default master)')
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--npm-dev', action="store_true", help='For npm, also fetch devDependencies')
+    parser_create.add_argument('--no-pypi', action="store_true", help='Do not inherit pypi class')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
     parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disabled by default).')
     parser_create.set_defaults(func=create_recipe)
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index b620e3271b1..5e07222ece1 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -18,7 +18,11 @@ import os
 import re
 import sys
 import subprocess
+import json
+import urllib.request
 from recipetool.create import RecipeHandler
+from urllib.parse import urldefrag
+from recipetool.create import determine_from_url
 
 logger = logging.getLogger('recipetool')
 
@@ -111,6 +115,74 @@ class PythonRecipeHandler(RecipeHandler):
     def __init__(self):
         pass
 
+    def process_url(self, args, classes, handled, extravalues):
+        """
+        Convert any pypi url https://pypi.org/project/<package>/<version> into https://files.pythonhosted.org/packages/source/...
+        which corresponds to the archive location, and add pypi class
+        """
+
+        if 'url' in handled:
+            return None
+
+        fetch_uri = None
+        source = args.source
+        required_version = args.version if args.version else None
+        match = re.match(r'https?://pypi.org/project/([^/]+)(?:/([^/]+))?/?$', urldefrag(source)[0])
+        if match:
+            package = match.group(1)
+            version = match.group(2) if match.group(2) else required_version
+
+            json_url = f"https://pypi.org/pypi/%s/json" % package
+            response = urllib.request.urlopen(json_url)
+            if response.status == 200:
+                data = json.loads(response.read())
+                if not version:
+                    # grab latest version
+                    version = data["info"]["version"]
+                pypi_package = data["info"]["name"]
+                for release in reversed(data["releases"][version]):
+                    if release["packagetype"] == "sdist":
+                        fetch_uri = release["url"]
+                        break
+            else:
+                logger.warning("Cannot handle pypi url %s: cannot fetch package information using %s", source, json_url)
+                return None
+        else:
+            match = re.match(r'^https?://files.pythonhosted.org/packages.*/(.*)-.*$', source)
+            if match:
+                fetch_uri = source
+                pypi_package = match.group(1)
+                _, version = determine_from_url(fetch_uri)
+
+        if match and not args.no_pypi:
+            if required_version and version != required_version:
+                raise Exception("Version specified using --version/-V (%s) and version specified in the url (%s) do not match" % (required_version, version))
+            # This is optionnal if BPN looks like "python-<pypi_package>" or "python3-<pypi_package>" (see pypi.bbclass)
+            # but at this point we cannot know because because user can specify the output name of the recipe on the command line
+            extravalues["PYPI_PACKAGE"] = pypi_package
+            # If the tarball extension is not 'tar.gz' (default value in pypi.bblcass) whe should set PYPI_PACKAGE_EXT in the recipe
+            pypi_package_ext = re.match(r'.*%s-%s\.(.*)$' % (pypi_package, version), fetch_uri)
+            if pypi_package_ext:
+                pypi_package_ext = pypi_package_ext.group(1)
+                if pypi_package_ext != "tar.gz":
+                    extravalues["PYPI_PACKAGE_EXT"] = pypi_package_ext
+
+            # Pypi class will handle S and SRC_URIxxx variables, so remove them
+            # TODO: allow oe.recipeutils.patch_recipe_lines() to accept regexp so we can simplify the following to:
+            # extravalues['SRC_URI(?:\[.*?\])?'] = None
+            extravalues['S'] = None
+            extravalues['SRC_URI'] = None
+            extravalues['SRC_URI[md5sum]'] = None
+            extravalues['SRC_URI[sha1sum]'] = None
+            extravalues['SRC_URI[sha256sum]'] = None
+            extravalues['SRC_URI[sha384sum]'] = None
+            extravalues['SRC_URI[sha512sum]'] = None
+
+            classes.append('pypi')
+
+        handled.append('url')
+        return fetch_uri
+
     def handle_classifier_license(self, classifiers, existing_licenses=""):
 
         licenses = []
-- 
2.42.0


