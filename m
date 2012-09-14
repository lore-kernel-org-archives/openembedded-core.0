Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TCfJb-0007Do-Ev
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 01:28:51 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 11CD73053E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 19:16:06 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 16:15:59 -0700
Message-Id: <674d84a9020d9fc0abfe8a45e6476ef63987d3a6.1347664421.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347664421.git.scott.a.garman@intel.com>
References: <cover.1347664421.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1347664421.git.scott.a.garman@intel.com>
References: <cover.1347664421.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 11CD73053E.AF552
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: show bitbake errors to user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 23:28:51 -0000

In certain edge cases, bitbake may fail to run and cause setup_tmpdir()
within runqemu to fail, and not give the user a helpful error message.
Catch this case and show the user the output of bitbake -e.

This fixes [YOCTO #3112]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e843946..8bb77ff 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -283,8 +283,16 @@ setup_tmpdir() {
         # We have bitbake in PATH, get OE_TMPDIR from bitbake
         OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
         if [ -z "$OE_TMPDIR" ]; then
-            echo "Error: this script needs to be run from your build directory,"
-            echo "or you need to explicitly set OE_TMPDIR in your environment"
+            # Check for errors from bitbake that the user needs to know about
+            BITBAKE_OUTPUT=`bitbake -e`
+            if [ -z "$BITBAKE_OUTPUT" ]; then
+                echo "Error: this script needs to be run from your build directory,"
+                echo "or you need to explicitly set OE_TMPDIR in your environment"
+            else
+                echo "There was an error running bitbake to determine TMPDIR"
+                echo "Here is the output from 'bitbake -e':"
+                bitbake -e
+            fi
             exit 1
         fi
     fi
-- 
1.7.9.5



