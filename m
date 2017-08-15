Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE483784EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:21:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7FLLdGI021087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Aug 2017 14:21:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:21:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:19:51 -0500
Message-ID: <1502831992-47827-6-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
References: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 5/6] package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Tue, 15 Aug 2017 21:21:41 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <pkj@axis.com>

During the transition to dnf and rpm4, the functionality to
automatically make RPM determine dependencies was lost.

Before the transition, an OE specific tool called rpmdeps-oecore had
been added to the rpm suit. It was based on the rpmdeps tool that is
part of rpm. For each file specified on its command line, it would
output the provides and requires that RPM could determine.

During the transition to rpm4, rpmdeps-oecore was replaced with the
standard rpmdeps. However, what no one noticed was that unless rpmdeps
is given options, e.g., -P or -R, to tell it what it should output, it
will not output anything. Thus, it would do all the work to determine
the requirements, but would keep silent about it. And since no output
from rpmdeps is expected unless there are requirements, there were no
warnings indicating that everything was not working as expected.

Porting the old rpmdeps-oecore to work with rpm4 is not really
possible since it relied on being able to access internals of RPM that
are no longer available. However, it turned out that rpmdeps had a
debug option, --rpmfcdebug, that would output exactly the information
that we need, albeit in a different format and to stderr. To make this
usable, rpmdeps has now received a new option, --alldeps, which sends
the information we need to stdout.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |  5 ++--
 meta/lib/oe/package.py       | 60 +++++++++++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d2fa617..2fe30da 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1453,7 +1453,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --rcfile ${STAGING_LIBDIR_NATIVE}/rpm/rpmrc  --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmconfigdir ${STAGING_LIBDIR_NATIVE}/rpm/'"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps"
 
 # Collect perfile run-time dependency metadata
 # Output:
@@ -1470,7 +1470,6 @@ python package_do_filedeps() {
     pkgdest = d.getVar('PKGDEST')
     packages = d.getVar('PACKAGES')
     rpmdeps = d.getVar('RPMDEPS')
-    magic = d.expand("${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc")
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
@@ -1482,7 +1481,7 @@ python package_do_filedeps() {
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-') or pkg.endswith('-src'):
             continue
         for files in chunks(pkgfiles[pkg], 100):
-            pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
+            pkglist.append((pkg, files, rpmdeps, pkgdest))
 
     processed = oe.utils.multiprocess_exec( pkglist, oe.package.filedeprunner)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 43748b2..a79c668 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -162,44 +162,68 @@ def file_translate(file):
 def filedeprunner(arg):
     import re, subprocess, shlex
 
-    (pkg, pkgfiles, rpmdeps, pkgdest, magic) = arg
+    (pkg, pkgfiles, rpmdeps, pkgdest) = arg
     provides = {}
     requires = {}
 
-    r = re.compile(r'[<>=]+ +[^ ]*')
+    file_re = re.compile(r'\s+\d+\s(.*)')
+    dep_re = re.compile(r'\s+(\S)\s+(.*)')
+    r = re.compile(r'[<>=]+\s+\S*')
 
     def process_deps(pipe, pkg, pkgdest, provides, requires):
+        file = None
         for line in pipe:
-            f = line.decode("utf-8").split(" ", 1)[0].strip()
-            line = line.decode("utf-8").split(" ", 1)[1].strip()
+            line = line.decode("utf-8")
 
-            if line.startswith("Requires:"):
+            m = file_re.match(line)
+            if m:
+                file = m.group(1)
+                file = file.replace(pkgdest + "/" + pkg, "")
+                file = file_translate(file)
+                continue
+
+            m = dep_re.match(line)
+            if not m or not file:
+                continue
+
+            type, dep = m.groups()
+
+            if type == 'R':
                 i = requires
-            elif line.startswith("Provides:"):
+            elif type == 'P':
                 i = provides
             else:
-                continue
+               continue
 
-            file = f.replace(pkgdest + "/" + pkg, "")
-            file = file_translate(file)
-            value = line.split(":", 1)[1].strip()
-            value = r.sub(r'(\g<0>)', value)
+            if dep.startswith("python("):
+                continue
 
-            if value.startswith("rpmlib("):
+            # Ignore all perl(VMS::...) and perl(Mac::...) dependencies. These
+            # are typically used conditionally from the Perl code, but are
+            # generated as unconditional dependencies.
+            if dep.startswith('perl(VMS::') or dep.startswith('perl(Mac::'):
                 continue
-            if value == "python":
+
+            # Ignore perl dependencies on .pl files.
+            if dep.startswith('perl(') and dep.endswith('.pl)'):
                 continue
+
+            # Remove perl versions and perl module versions since they typically
+            # do not make sense when used as package versions.
+            if dep.startswith('perl') and r.search(dep):
+                dep = dep.split()[0]
+
+            # Put parentheses around any version specifications.
+            dep = r.sub(r'(\g<0>)',dep)
+
             if file not in i:
                 i[file] = []
-            i[file].append(value)
+            i[file].append(dep)
 
         return provides, requires
 
-    env = os.environ.copy()
-    env["MAGIC"] = magic
-
     try:
-        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE, env=env)
+        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE)
         provides, requires = process_deps(dep_popen.stdout, pkg, pkgdest, provides, requires)
     except OSError as e:
         bb.error("rpmdeps: '%s' command failed, '%s'" % (shlex.split(rpmdeps) + pkgfiles, e))
-- 
1.8.3.1


