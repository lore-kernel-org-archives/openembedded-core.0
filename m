Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BDE1365C78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 19:24:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2015 12:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,425,1432623600"; d="scan'208";a="601788751"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 07 Jul 2015 12:24:45 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jul 2015 11:17:40 +0000
Message-Id: <b2819bc40cf0c1e5e775abb5cdf3eb117a3fc236.1436267456.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1436267456.git.mariano.lopez@linux.intel.com>
References: <cover.1436267456.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] sanity.bbclass: Check if /tmp is writable
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
X-List-Received-Date: Tue, 07 Jul 2015 19:24:46 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Used mkstemp instead of raw open file call.
Also added the exception message to the output of
the sanity check.

[YOCTO #7922]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/sanity.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7a580da..125cc4c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -707,15 +707,16 @@ def check_sanity_everybuild(status, d):
     # Check if /tmp is writable
     from string import ascii_letters
     from random import choice
-    filename = "bb_writetest.%s" % os.getpid()
-    testfile = os.path.join("/tmp", filename)
+    from tempfile import mkstemp
+    tmpfd, tmppath = mkstemp()
     try:
-        f = open(testfile, "w")
+        f = os.fdopen(tmpfd, "wt")
         f.write("".join(choice(ascii_letters) for x in range(1024)))
         f.close()
-        os.remove(testfile)
-    except:
-        status.addresult("Failed to write into /tmp. Please verify your filesystem.")
+    except Exception as err:
+        status.addresult("Failed to write into /tmp; %s. Please verify your filesystem." % err)
+    finally:
+        os.remove(tmppath)
 
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
-- 
1.8.4.5


