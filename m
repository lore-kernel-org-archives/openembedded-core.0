Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CCF45738AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:26:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 08:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,699,1427785200"; d="scan'208";a="736960609"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2015 08:26:56 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 07:20:10 +0000
Message-Id: <f3ca504d666948a1f8fcdd990b2e829a576a36e0.1435562155.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1435562155.git.mariano.lopez@linux.intel.com>
References: <cover.1435562155.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] sanity.bbclass: Check if /tmp is writable
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
X-List-Received-Date: Mon, 29 Jun 2015 15:26:58 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

If /tmp can't be written, bitbake gaves an unrelated error.
This checks if /tmp can be written in every build.

[YOCTO #7922]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/sanity.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2855941..7a580da 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -704,6 +704,19 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check if /tmp is writable
+    from string import ascii_letters
+    from random import choice
+    filename = "bb_writetest.%s" % os.getpid()
+    testfile = os.path.join("/tmp", filename)
+    try:
+        f = open(testfile, "w")
+        f.write("".join(choice(ascii_letters) for x in range(1024)))
+        f.close()
+        os.remove(testfile)
+    except:
+        status.addresult("Failed to write into /tmp. Please verify your filesystem.")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO', True)
-- 
1.8.4.5


