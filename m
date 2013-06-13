Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 370D46A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 14:07:19 +0000 (UTC)
Received: from lander.brightsign ([172.30.1.6])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Un8BK-0001TQ-Ne; Thu, 13 Jun 2013 15:07:18 +0100
Received: from mac by lander.brightsign with local (Exim 4.72)
	(envelope-from <mac@lander.brightsign>)
	id 1Un8BK-0007GA-By; Thu, 13 Jun 2013 15:07:18 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 15:06:44 +0100
Message-Id: <1371132404-27250-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20130521084102.GA31419@mcrowe.com>
References: <20130521084102.GA31419@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] sstate.bbclass: binutils-cross is not a safe dependency
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
X-List-Received-Date: Thu, 13 Jun 2013 14:07:20 -0000

gcc always needs binutils in order to be useful. If binutils-cross is
considered to be a safe dependency then gcc-cross can be reconstructed into
the sysroot without binutils. Anyone who tries to use the compiler will end
up using the system binutils which is either a bad thing (relying on system
tools) or a very bad thing (it will be for the wrong architecture.)

In the absence of a better fix let's just stop binutils-cross being
considered a safe dependency. The downside of this is that any
reconstructing any other recipe that depends on binutils from the sstate
cache will also cause binutils to be reconstructed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I tried and failed to come up with a better fix for this problem. This
fix at least means that everything will build using the correct
version of binutils even if slightly more files are reconstructed from
the sstate cache than would be desirable.


diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 28dc312..0de62d8 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -655,7 +655,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
     def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "gcc-cross-initial"]:
             return True
         return False
     def isPostInstDep(x):
-- 
1.7.10.4


