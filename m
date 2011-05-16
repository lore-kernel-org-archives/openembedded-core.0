Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5dK-0003bu-8y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2011 14:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="643470581"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 14:44:12 -0700
Message-Id: <da795c44ef9b049b6bec9748ffe14ef2214e94d3.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 11:18:38 -0700
Date: Mon, 16 May 2011 14:44:11 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 11/14] base.bbclass: Fix PR increment bug when PR number is a single digit
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
X-List-Received-Date: Mon, 16 May 2011 21:47:55 -0000

From: Khem Raj <raj.khem@gmail.com>

PRINC which should add to base PR value has a problem when
the PR is single digit e.g. r0 - r9. Current algorithm
needed atleasts 2 digits to successfully populate end and begin
markers.

We reimplement the incrementing algorithm using regular expressions
which addressed the above mentioned problem and
simplifies the logic a bit and gets rid of loops and conditionals

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/base.bbclass |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d9ed15f..23095ec 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -233,25 +233,18 @@ do_build () {
 }
 
 python () {
-    import exceptions, string
+    import exceptions, string, re
 
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = bb.data.getVar('PRINC', d, True)
     if princ:
         pr = bb.data.getVar('PR', d, True)
-        start = -1
-        end = -1
-        for i in range(len(pr)):
-            if pr[i] in string.digits:
-                if start == -1:
-                    start = i
-                else:
-                    end = i
-        if start == -1 or end == -1:
+        pr_prefix = re.search("\D+",pr)
+        prval = re.search("\d+",pr)
+        if pr_prefix is None or prval is None:
             bb.error("Unable to analyse format of PR variable: %s" % pr)
-        prval = pr[start:end+1]
-        prval = int(prval) + int(princ)
-        pr = pr[0:start] + str(prval) + pr[end:len(pr)-1]
+        nval = int(prval.group(0)) + int(princ)
+        pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
         bb.data.setVar('PR', pr, d)
 
     pn = bb.data.getVar('PN', d, 1)
-- 
1.7.1.1



