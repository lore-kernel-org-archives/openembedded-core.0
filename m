Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLB17-0005cO-Jl
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 12:56:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1187; q=dns/txt; s=iport;
	t=1349693033; x=1350902633;
	h=from:to:cc:subject:date:message-id;
	bh=4c2FKee1P2odHcNL7JEMFPZba0FMFz6l4jP7dzEn1Aw=;
	b=MGUhpXMzSwiNGQDV3c2MK6PrK3c1Fhq0UY8wi5L2utbFyVowTDo2nKNV
	HIKMQULx6KdTEkwc3kK0ijSPDKq657MjhRtM93hYJeljC4fId95qczqeN
	G8BjKHC38kOMskD0w6+u1y/ycCWvkcTvcOlrUcT+oTlcFJ9pPF3l8Ro24 c=;
X-IronPort-AV: E=Sophos;i="4.80,551,1344211200"; d="scan'208";a="144926510"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-1.cisco.com with ESMTP; 08 Oct 2012 10:43:51 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q98Ahpvl008789;
	Mon, 8 Oct 2012 10:43:51 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 12:43:50 +0200
Message-Id: <1349693030-31861-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Thomas Kristensen <thkriste@cisco.com>
Subject: [[PATCH v3]] populate_sdk_base.bbclass: Make it possible to override the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Mon, 08 Oct 2012 10:56:57 -0000

From: Thomas Kristensen <thkriste@cisco.com>

If you wish to change the install/unpack method of the sdk, this can now be done by making
your own create_shar method, and setting a SDK_PACKAGING_FUNC variable to your
new create_shar function.

Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 1c151d7..762ba12 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -24,6 +24,8 @@ PID = "${@os.getpid()}"
 
 EXCLUDE_FROM_WORLD = "1"
 
+SDK_PACKAGING_FUNC ?= "create_shar"
+
 python () {
     # If we don't do this we try and run the mapping hooks while parsing which is slow
     # bitbake should really provide something to let us know this...
@@ -56,7 +58,7 @@ fakeroot python do_populate_sdk() {
 
     bb.build.exec_func("tar_sdk", d)
 
-    bb.build.exec_func("create_shar", d)
+    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
 }
 
 fakeroot populate_sdk_image() {
-- 
1.7.8.6



