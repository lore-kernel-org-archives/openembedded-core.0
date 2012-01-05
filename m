Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RiujQ-0002SP-5a
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 22:20:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2012 13:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94935772"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.152])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2012 13:12:52 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 13:12:50 -0800
Message-Id: <7583e732bc226f24befcad605b4bfa0536a1ae3c.1325797875.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325797875.git.scott.a.garman@intel.com>
References: <cover.1325797875.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1325797875.git.scott.a.garman@intel.com>
References: <cover.1325797875.git.scott.a.garman@intel.com>
Subject: [PATCH 1/1] insane.bbclass: use bb.process.Popen instead of subprocess.check_output
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
X-List-Received-Date: Thu, 05 Jan 2012 21:20:16 -0000

subprocess.check_output was only introduced in Python v2.7, so we
cannot use it. This refactors the QA test to use bb.process.Popen
instead.

This fixes the error:

AttributeError: 'module' object has no attribute 'check_output'

It no longer checks the return status of prelink-rtld, as that
case was simply adding noise. This QA test is intended to only
warn about specific paths that binaries could be linking to, not
handle the case where there is a missing library.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/insane.bbclass |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b8d4507..8d6b11c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -227,16 +227,12 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 		sysroot_path_usr = sysroot_path + exec_prefix
 
 		try:
-			ldd_output = sub.check_output(["prelink-rtld", "--root", sysroot_path, path])
-		except sub.CalledProcessError as e:
-			if e.returncode != 127:
-				error_msg = pn + ": prelink-rtld aborted when processing %s" % path
-				package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-				return False
-			else:
-				# Sometimes this is done deliberately (e.g, e2fsprogs), so only warn
-				bb.warn("%s has missing library dependencies" % path)
-				return
+			ldd_output = bb.process.Popen(["prelink-rtld", "--root", sysroot_path, path], stdout=sub.PIPE).stdout.read()
+		except bb.process.CmdError:
+			error_msg = pn + ": prelink-rtld aborted when processing %s" % path
+			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+			return False
+
 		if sysroot_path_usr in ldd_output:
 			error_msg = pn + ": %s links to something under exec_prefix" % path
 			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-- 
1.7.5.4



