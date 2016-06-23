Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D43EE60123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730842"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:07:02 +1200
Message-Id: <dd35dcbf7c159e5dcc73c88cffd2e10550a1285e.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 06/10] classes/testsdk: print output correctly on failure
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:47 -0000

With Python 3 we get a bytes object from the command output and not a
string, which gives some ugly formatting for error messages unless you
decode it first.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index f4dc2c3..18f7678 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -65,7 +65,7 @@ def testsdk_main(d):
     try:
         subprocess.check_output("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
     except subprocess.CalledProcessError as e:
-        bb.fatal("Couldn't install the SDK:\n%s" % e.output)
+        bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
 
     try:
         run_test_context(SDKTestContext, d, sdktestdir, tcname, pn)
@@ -116,7 +116,7 @@ def testsdkext_main(d):
     try:
         subprocess.check_output("%s -y -d %s/tc" % (tcname, testdir), shell=True)
     except subprocess.CalledProcessError as e:
-        bb.fatal("Couldn't install the SDK EXT:\n%s" % e.output)
+        bb.fatal("Couldn't install the SDK EXT:\n%s" % e.output.decode("utf-8"))
 
     try:
         bb.plain("Running SDK Compatibility tests ...")
-- 
2.5.5


