Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C7AC25B6F
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:29:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9798.1698420584635552516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 08:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D31D6143D;
	Fri, 27 Oct 2023 08:30:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C76063F64C;
	Fri, 27 Oct 2023 08:29:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] scripts/contrib/patchreview: add commit and recipe count fields to JSON
Date: Fri, 27 Oct 2023 16:29:40 +0100
Message-Id: <20231027152941.232042-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027152941.232042-1-ross.burton@arm.com>
References: <20231027152941.232042-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 15:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189748

From: Ross Burton <ross.burton@arm.com>

The autobuilder scripts post-process the generated JSON to inject recipe
and commit counts into the data.  We can do this easily in patchreview
instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/contrib/patchreview.py | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview=
.py
index af66e32e02e..36038d06d2e 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -197,7 +197,7 @@ def histogram(results):
     for k in bars:
         print("%-20s %s (%d)" % (k.capitalize() if k else "No status", b=
ars[k], counts[k]))
=20
-def gather_patches(candidate):
+def find_layers(candidate):
     # candidate can either be the path to a layer directly (eg meta-inte=
l), or a
     # repository that contains other layers (meta-arm). We can determine=
 what by
     # looking for a conf/layer.conf file. If that file exists then it's =
a layer,
@@ -205,19 +205,26 @@ def gather_patches(candidate):
     # meta-*.
=20
     if (candidate / "conf" / "layer.conf").exists():
-        print(f"{candidate} is a layer")
-        scan =3D [candidate]
+        return [candidate.absolute()]
     else:
-        print(f"{candidate} is not a layer, checking for sub-layers")
-        scan =3D [d for d in candidate.iterdir() if d.is_dir() and (d.na=
me =3D=3D "meta" or d.name.startswith("meta-"))]
-        print(f"Found layers {' '.join((d.name for d in scan))}")
+        return [d.absolute() for d in candidate.iterdir() if d.is_dir() =
and (d.name =3D=3D "meta" or d.name.startswith("meta-"))]
=20
+# TODO these don't actually handle dynamic-layers/
+
+def gather_patches(layers):
     patches =3D []
-    for directory in scan:
+    for directory in layers:
         filenames =3D subprocess.check_output(("git", "-C", directory, "=
ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff"), universal_newl=
ines=3DTrue).split()
         patches +=3D [os.path.join(directory, f) for f in filenames]
     return patches
=20
+def count_recipes(layers):
+    count =3D 0
+    for directory in layers:
+        output =3D subprocess.check_output(["git", "-C", directory, "ls-=
files", "recipes-*/**/*.bb"], universal_newlines=3DTrue)
+        count +=3D len(output.splitlines())
+    return count
+
 if __name__ =3D=3D "__main__":
     import argparse, subprocess, os, pathlib
=20
@@ -229,7 +236,9 @@ if __name__ =3D=3D "__main__":
     args.add_argument("directory", type=3Dpathlib.Path, metavar=3D"DIREC=
TORY", help=3D"directory to scan (layer, or repository of layers)")
     args =3D args.parse_args()
=20
-    patches =3D gather_patches(args.directory)
+    layers =3D find_layers(args.directory)
+    print(f"Found layers {' '.join((d.name for d in layers))}")
+    patches =3D gather_patches(layers)
     results =3D patchreview(patches)
     analyse(results, want_blame=3Dargs.blame, verbose=3Dargs.verbose)
=20
@@ -242,8 +251,11 @@ if __name__ =3D=3D "__main__":
=20
         row =3D collections.Counter()
         row["total"] =3D len(results)
-        row["date"] =3D subprocess.check_output(["git", "-C", args.direc=
tory, "show", "-s", "--pretty=3Dformat:%cd", "--date=3Dformat:%s"]).decod=
e("utf-8").strip()
-        row["commit"] =3D subprocess.check_output(["git", "-C", args.dir=
ectory, "show", "-s", "--pretty=3Dformat:%H"]).decode("utf-8").strip()
+        row["date"] =3D subprocess.check_output(["git", "-C", args.direc=
tory, "show", "-s", "--pretty=3Dformat:%cd", "--date=3Dformat:%s"], unive=
rsal_newlines=3DTrue).strip()
+        row["commit"] =3D subprocess.check_output(["git", "-C", args.dir=
ectory, "show-ref", "--hash", "HEAD"], universal_newlines=3DTrue).strip()
+        row['commit_count'] =3D subprocess.check_output(["git", "-C", ar=
gs.directory, "rev-list", "--count", "HEAD"], universal_newlines=3DTrue).=
strip()
+        row['recipe_count'] =3D count_recipes(layers)
+
         for r in results.values():
             if r.upstream_status in status_values:
                 row[r.upstream_status] +=3D 1
--=20
2.34.1


