Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLAyY-0005VJ-5r
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 12:54:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1201; q=dns/txt; s=iport;
	t=1349692874; x=1350902474;
	h=from:to:cc:subject:date:message-id;
	bh=4OC0TeQpKaqYH7Lnl4jDLTocGJciZ5huNDbzw3h5/bc=;
	b=GVYxCW3DP5kBznbU1su4Jy67DHwlQQ5pIS+irpEHMhabL1CbDSjgKuw2
	OIEr1H0OVSKNLvXEOAqSgMH8i1frb8D2undnPAfG5u1W4nKKR/MHtYct8
	arJphNgeVfCsTD0JyNKHsmlOKFsZJxb9OzX/Td7vVgB9j8d3PJouwmeDx I=;
X-IronPort-AV: E=Sophos;i="4.80,551,1344211200"; d="scan'208";a="77263863"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-2.cisco.com with ESMTP; 08 Oct 2012 10:41:11 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q98AfBxI010889;
	Mon, 8 Oct 2012 10:41:11 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 12:41:10 +0200
Message-Id: <1349692870-30635-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Thomas Kristensen <thkriste@cisco.com>
Subject: [[PATCH v2]] populate_sdk_base.bbclass: Make it possible to override the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Mon, 08 Oct 2012 10:54:18 -0000

From: Thomas Kristensen <thkriste@cisco.com>

If you wish to change the install/unpack method of the sdk, this can now be done by making
your own create_shar method, and setting a POPULATE_SDK_CREATE_SHAR_COMMAND variable to your
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



