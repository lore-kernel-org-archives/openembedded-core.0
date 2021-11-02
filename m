Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] scripts/convert-srcuri: Update SRC_URI conversion script to handle github url changes
Date: Tue,  2 Nov 2021 11:42:57 +0000
Message-Id: <20211102114258.3540995-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211102114258.3540995-1-richard.purdie@linuxfoundation.org>
References: <20211102114258.3540995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Github are dropping support for git:// protocol fetching. Update the script
to learn about corner cases found in the previous conversion and
support remapping the github urls as needed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/convert-srcuri.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
index 4bf9e3013d3..5b362ea2e84 100755
--- a/scripts/contrib/convert-srcuri.py
+++ b/scripts/contrib/convert-srcuri.py
@@ -19,19 +19,33 @@ if len(sys.argv) < 2:
     sys.exit(1)
 
 def processfile(fn):
+    def matchline(line):
+        if "MIRROR" in line or ".*" in line or "GNOME_GIT" in line:
+            return False
+        return True
     print("processing file '%s'" % fn)
     try:
+        if "distro_alias.inc" in fn or "linux-yocto-custom.bb" in fn:
+            return
         fh, abs_path = tempfile.mkstemp()
         modified = False
         with os.fdopen(fh, 'w') as new_file:
             with open(fn, "r") as old_file:
                 for line in old_file:
-                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and "MIRROR" not in line and ".*" not in line:
+                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and matchline(line):
                         if line.endswith('"\n'):
                             line = line.replace('"\n', ';branch=master"\n')
                         elif line.endswith(" \\\n"):
                             line = line.replace(' \\\n', ';branch=master \\\n')
                         modified = True
+                    if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
+                        if "protocol=git" in line:
+                            line = line.replace('protocol=git', 'protocol=https')
+                        elif line.endswith('"\n'):
+                            line = line.replace('"\n', ';protocol=https"\n')
+                        elif line.endswith(" \\\n"):
+                            line = line.replace(' \\\n', ';protocol=https \\\n')
+                        modified = True
                     new_file.write(line)
         if modified:
             shutil.copymode(fn, abs_path)
-- 
2.32.0

