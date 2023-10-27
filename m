Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F5C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:29:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9784.1698420584599374409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 08:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADBA1424;
	Fri, 27 Oct 2023 08:30:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B1493F64C;
	Fri, 27 Oct 2023 08:29:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] scripts/patchreview: rework patch detection
Date: Fri, 27 Oct 2023 16:29:39 +0100
Message-Id: <20231027152941.232042-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 15:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189747

From: Ross Burton <ross.burton@arm.com>

A previous patch[1] added the ability to allow the search pattern for
patches to be changed, so that patchreview can be used across the entire
meta-oe repository by changing the patterns.

However, this means the caller needs to write long patterns when calling
patchreview.

Instead, we can see if the specified directory contains a layer by
checking if conf/layer.conf exists.  If it does, then search for patches
inside this directory.  If it doesn't, assume that the specified
directory is a repository that contains sublayers (such as
meta-openembedded) and look through each of the directories that match
the pattern meta-*.

This means patchreview can both scan either a single layer (eg
.../poky/meta) or a repository of sublayers (eg .../meta-openembedded).

[1] oe-core 599046ea9302af0cf856d3fcd827f6a2be75b7e1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/contrib/patchreview.py | 36 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview=
.py
index 43de105adc2..af66e32e02e 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -41,7 +41,7 @@ def blame_patch(patch):
                                     "--format=3D%s (%aN <%aE>)",
                                     "--", patch)).decode("utf-8").splitl=
ines()
=20
-def patchreview(path, patches):
+def patchreview(patches):
     import re, os.path
=20
     # General pattern: start of line, optional whitespace, tag with opti=
onal
@@ -56,11 +56,10 @@ def patchreview(path, patches):
=20
     for patch in patches:
=20
-        fullpath =3D os.path.join(path, patch)
         result =3D Result()
-        results[fullpath] =3D result
+        results[patch] =3D result
=20
-        content =3D open(fullpath, encoding=3D'ascii', errors=3D'ignore'=
).read()
+        content =3D open(patch, encoding=3D'ascii', errors=3D'ignore').r=
ead()
=20
         # Find the Signed-off-by tag
         match =3D sob_re.search(content)
@@ -198,21 +197,40 @@ def histogram(results):
     for k in bars:
         print("%-20s %s (%d)" % (k.capitalize() if k else "No status", b=
ars[k], counts[k]))
=20
+def gather_patches(candidate):
+    # candidate can either be the path to a layer directly (eg meta-inte=
l), or a
+    # repository that contains other layers (meta-arm). We can determine=
 what by
+    # looking for a conf/layer.conf file. If that file exists then it's =
a layer,
+    # otherwise its a repository of layers and we can assume they're cal=
led
+    # meta-*.
+
+    if (candidate / "conf" / "layer.conf").exists():
+        print(f"{candidate} is a layer")
+        scan =3D [candidate]
+    else:
+        print(f"{candidate} is not a layer, checking for sub-layers")
+        scan =3D [d for d in candidate.iterdir() if d.is_dir() and (d.na=
me =3D=3D "meta" or d.name.startswith("meta-"))]
+        print(f"Found layers {' '.join((d.name for d in scan))}")
+
+    patches =3D []
+    for directory in scan:
+        filenames =3D subprocess.check_output(("git", "-C", directory, "=
ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff"), universal_newl=
ines=3DTrue).split()
+        patches +=3D [os.path.join(directory, f) for f in filenames]
+    return patches
=20
 if __name__ =3D=3D "__main__":
-    import argparse, subprocess, os
+    import argparse, subprocess, os, pathlib
=20
     args =3D argparse.ArgumentParser(description=3D"Patch Review Tool")
     args.add_argument("-b", "--blame", action=3D"store_true", help=3D"sh=
ow blame for malformed patches")
     args.add_argument("-v", "--verbose", action=3D"store_true", help=3D"=
show per-patch results")
     args.add_argument("-g", "--histogram", action=3D"store_true", help=3D=
"show patch histogram")
     args.add_argument("-j", "--json", help=3D"update JSON")
-    args.add_argument("-p", "--pattern", nargs=3D1, action=3D"extend", d=
efault=3D["recipes-*/**/*.patch", "recipes-*/**/*.diff"], help=3D"pattern=
 to search recipes patch")
-    args.add_argument("directory", help=3D"directory to scan")
+    args.add_argument("directory", type=3Dpathlib.Path, metavar=3D"DIREC=
TORY", help=3D"directory to scan (layer, or repository of layers)")
     args =3D args.parse_args()
=20
-    patches =3D subprocess.check_output(("git", "-C", args.directory, "l=
s-files") + tuple(args.pattern)).decode("utf-8").split()
-    results =3D patchreview(args.directory, patches)
+    patches =3D gather_patches(args.directory)
+    results =3D patchreview(patches)
     analyse(results, want_blame=3Dargs.blame, verbose=3Dargs.verbose)
=20
     if args.json:
--=20
2.34.1


