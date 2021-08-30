Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4611.1630363991773354390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 15:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Yb+uTxIQ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: abeltran@linux.microsoft.com)
Received: from abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id E626D20B90FF;
	Mon, 30 Aug 2021 15:53:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E626D20B90FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1630363990;
	bh=3J+ECtayY6KUsbXPOjNeMuPbT1iy9PR4Vg2Gi2FG/aw=;
	h=From:To:Cc:Subject:Date:From;
	b=Yb+uTxIQYhPeRPWqnJzys5O1tygqKBt5cEktUxW3KXxx5JUmdhL0Lia6tlVkL4Gpv
	 uZkGKcybLYDXr5Img6kHN7k970Oqr3J8QO7tCtH1fqq17x3d20YGzyyPYLuiSYjOje
	 7bhmGVemexZEy3sh8C7YlGhtVMesLTP5cr6LzXDs=
From: "Andres Beltran" <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH v2] buildhistory: Label packages providing per-file dependencies in depends.dot
Date: Mon, 30 Aug 2021 22:53:03 +0000
Message-Id: <20210830225303.19407-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Currently, depends.dot includes per-file dependencies but not the packages
providing those files. This makes it hard to obtain all package
dependencies by just looking at depends.dot.

Parse the RPROVIDES and FILERPROVIDES fields from pkgdata to map each of
their values to the package providing the component. Include runtime
packages as dependencies in depends.dot, together with the component
provided by the package as a label.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/buildhistory.bbclass |  4 +++-
 meta/lib/oe/utils.py              | 32 +++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 134b56ab71..20609c435b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -438,7 +438,7 @@ def buildhistory_list_installed(d, rootfs_type="image"):
         output_file_full = os.path.join(d.getVar('WORKDIR'), output_file)
 
         with open(output_file_full, 'w') as output:
-            output.write(format_pkg_list(pkgs, output_type))
+            output.write(format_pkg_list(pkgs, output_type, d.getVar('PKGDATA_DIR')))
 
 python buildhistory_list_installed_image() {
     buildhistory_list_installed(d)
@@ -479,6 +479,8 @@ buildhistory_get_installed() {
 	       -e 's:|: -> :' \
 	       -e 's:"\[REC\]":[style=dotted]:' \
 	       -e 's:"\([<>=]\+\)" "\([^"]*\)":[label="\1 \2"]:' \
+	       -e 's:"\([*]\+\)" "\([^"]*\)":[label="\2"]:' \
+	       -e 's:"\[RPROVIDES\]":[style=dashed]:' \
 		$1/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
 	printf "digraph depends {\n    node [shape=plaintext]\n" > $1/depends.dot
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 83d298906b..75269a9feb 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -345,7 +345,29 @@ def squashspaces(string):
     import re
     return re.sub(r"\s+", " ", string).strip()
 
-def format_pkg_list(pkg_dict, ret_format=None):
+def rprovides_map(pkgdata_dir, pkg_dict):
+    # Map file -> pkg provider
+    rprov_map = {}
+
+    for pkg in pkg_dict:
+        path_to_pkgfile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
+        if not os.path.isfile(path_to_pkgfile):
+            continue
+        with open(path_to_pkgfile) as f:
+            for line in f:
+                if line.startswith('RPROVIDES') or line.startswith('FILERPROVIDES'):
+                    # List all components provided by pkg.
+                    # Exclude version strings, i.e. those starting with (
+                    provides = [x for x in line.split()[1:] if not x.startswith('(')]
+                    for prov in provides:
+                        if prov in rprov_map:
+                            rprov_map[prov].append(pkg)
+                        else:
+                            rprov_map[prov] = [pkg]
+
+    return rprov_map
+
+def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
     output = []
 
     if ret_format == "arch":
@@ -358,9 +380,15 @@ def format_pkg_list(pkg_dict, ret_format=None):
         for pkg in sorted(pkg_dict):
             output.append("%s %s %s" % (pkg, pkg_dict[pkg]["arch"], pkg_dict[pkg]["ver"]))
     elif ret_format == "deps":
+        rprov_map = rprovides_map(pkgdata_dir, pkg_dict)
         for pkg in sorted(pkg_dict):
             for dep in pkg_dict[pkg]["deps"]:
-                output.append("%s|%s" % (pkg, dep))
+                if dep in rprov_map:
+                    # There could be multiple providers within the image
+                    for pkg_provider in rprov_map[dep]:
+                        output.append("%s|%s * %s [RPROVIDES]" % (pkg, pkg_provider, dep))
+                else:
+                    output.append("%s|%s" % (pkg, dep))
     else:
         for pkg in sorted(pkg_dict):
             output.append(pkg)
-- 
2.17.1

