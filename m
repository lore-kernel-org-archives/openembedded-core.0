Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcS-0000tx-Od
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584246"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:32 -0700
Message-Id: <d233ff9b666db604ab0ed7fb6b447a97fe1b1a99.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 05/14] package.bbclass: needs_ldconfig from linux_so is needed in global namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 07:36:05 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

"The suite of statements in a function definition executes with a local namespace
that is different from the global namespace. This means that all variables created
within a function are local to that function. When the suite finishes, these
working variables are discarded."

In this way the needs_ldconfig variable in linux_so never gets True in the statements
below this function. As global statement is generally discouraged, a return value
would be a clean and fast way to solve this issue.

[YOCTO #2205]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/package.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d35667a..c98e8fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1263,6 +1263,7 @@ python package_do_shlibs() {
 	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
 	def linux_so(root, path, file):
+		needs_ldconfig = False
 		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
 		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
 		fd = os.popen(cmd)
@@ -1283,6 +1284,7 @@ python package_do_shlibs() {
 					needs_ldconfig = True
 				if snap_symlinks and (file != this_soname):
 					renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
+		return needs_ldconfig
 
 	def darwin_so(root, path, file):
 		fullpath = os.path.join(root, file)
@@ -1382,7 +1384,7 @@ python package_do_shlibs() {
 				if targetos == "darwin" or targetos == "darwin8":
 					darwin_so(root, dirs, file)
 				elif os.access(path, os.X_OK) or lib_re.match(file):
-					linux_so(root, dirs, file)
+					needs_ldconfig = linux_so(root, dirs, file)
 		for (old, new) in renames:
 		    	bb.note("Renaming %s to %s" % (old, new))
 			os.rename(old, new)
-- 
1.7.7.6



