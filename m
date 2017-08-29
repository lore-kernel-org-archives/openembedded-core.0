Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE7FF7833D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0F99018449;
	Tue, 29 Aug 2017 23:21:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id E2AiX1wZUqxO; Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1014F1843C;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C074F1A0B1;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC37D1A0B0;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9D2A331FF;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLglA030298;
	Tue, 29 Aug 2017 23:21:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLgEZ030297;
	Tue, 29 Aug 2017 23:21:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:21 +0200
Message-Id: <d56fb24da31731a5c5b6cc69cb124c61d0199562.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 25/25] package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:48 -0000

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

Since enabling this may cause packages to break, it is required that
ENABLE_RPM_FILEDEPS_FOR_PYRO is set to "1" to activate it for Pyro.
The name of this variable has been chosen as to indicate that it only
affects Pyro (since releases before and after Pyro has it enabled by
default).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 11 +++++---
 meta/lib/oe/package.py       | 60 +++++++++++++++++++++++++++++++-------------
 2 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc466bd1b2..a03c05b9f7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1434,7 +1434,13 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --rcfile ${STAGING_LIBDIR_NATIVE}/rpm/rpmrc  --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmconfigdir ${STAGING_LIBDIR_NATIVE}/rpm/'"
+# In Morty and earlier releases, and on master (Rocko), the RPM file
+# dependencies are always enabled. However, since they were broken with the
+# release of Pyro and enabling them may cause build problems for some packages,
+# they are not enabled by default in Pyro. Setting ENABLE_RPM_FILEDEPS_FOR_PYRO
+# to "1" will enable them again.
+ENABLE_RPM_FILEDEPS_FOR_PYRO ??= "0"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps${@' --alldeps' if d.getVar('ENABLE_RPM_FILEDEPS_FOR_PYRO') == '1' else ''}"
 
 # Collect perfile run-time dependency metadata
 # Output:
@@ -1451,7 +1457,6 @@ python package_do_filedeps() {
     pkgdest = d.getVar('PKGDEST')
     packages = d.getVar('PACKAGES')
     rpmdeps = d.getVar('RPMDEPS')
-    magic = d.expand("${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc")
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
@@ -1463,7 +1468,7 @@ python package_do_filedeps() {
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
             continue
         for files in chunks(pkgfiles[pkg], 100):
-            pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
+            pkglist.append((pkg, files, rpmdeps, pkgdest))
 
     processed = oe.utils.multiprocess_exec( pkglist, oe.package.filedeprunner)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 52c5f16cf8..4797e7d65a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -57,44 +57,68 @@ def file_translate(file):
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
2.12.0


