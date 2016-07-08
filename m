Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0D4560119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u68H0qTI030401; Fri, 8 Jul 2016 18:00:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HC-bFOYgYlj6; Fri,  8 Jul 2016 18:00:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u68H0neW030398
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 8 Jul 2016 18:00:50 +0100
Message-ID: <1467997249.28829.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2016 18:00:49 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	"saul.wold" <saul.wold@intel.com>
Subject: [PATCH] linux-yocto-dev: Handle performance regression
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
X-List-Received-Date: Fri, 08 Jul 2016 17:00:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After commit 0437a59e3c298d40aaa96af09b80bff8fcbe292d, the linux-yocto-dev
recipe is being parsed every time we run "bitbake -p". This was spotted
on some performance benchmarks and showed up as a performance regression.

We can tweak the recipe to ensure this doesn't happen and that its only
used if selected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 3085263..c50b319 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -20,6 +20,9 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 python () {
     if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
+    else:
+        d.setVar("SRCREV_machine", "${AUTOREV}")
+        d.setVar("SRCREV_meta", "${AUTOREV}")
 }
 
 KBRANCH = "standard/base"
@@ -33,8 +36,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 # linux-yocto-dev is the preferred provider, they will be overridden to
 # AUTOREV in following anonymous python routine and resolved when the
 # variables are finalized.
-SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
-SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
+SRCREV_machine ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
+SRCREV_meta ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
 
 LINUX_VERSION ?= "4.6-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"



