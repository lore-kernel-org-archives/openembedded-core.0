Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TP6AY-0005Hx-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 08:34:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1188; q=dns/txt; s=iport;
	t=1350627696; x=1351837296;
	h=from:to:cc:subject:date:message-id;
	bh=VDuLAy1/b4gC9ehY+0wfXwQGoT2R10qKI1IiA3tmvrQ=;
	b=XH8+3keW+6otgNd+ebWwCUzgYKsNXMNd1kGa87NR5TlSp7oUQsjIvGtz
	0r59Nxy2EzfubemaGcSbMtP4Q7Ev6VUYvTzb7kvz3I3AXLPfXidBC9tk6
	H2imDzf6wQX7us651425ClVIG7yqBoVMzMNF9RkwRo84m9Bt3dEe3o6Np A=;
X-IronPort-AV: E=Sophos;i="4.80,610,1344211200"; 
   d="scan'208";a="8924584"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-3.cisco.com with ESMTP; 19 Oct 2012 06:21:33 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q9J6LXGv016941;
	Fri, 19 Oct 2012 06:21:33 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2012 08:16:27 +0200
Message-Id: <1350627387-20385-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Thomas Kristensen <thkriste@cisco.com>
Subject: [PATCH v2] populate_sdk_base.bbclass: Make it possible to overrise the create_shar method of populate_sdk_base.
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
X-List-Received-Date: Fri, 19 Oct 2012 06:34:54 -0000

From: Thomas Kristensen <thkriste@cisco.com>

If you wish to change the install/unpack method of the sdk, this can now be done by making
your own create_shar method, and setting a SDK_PACKAGAING_FUNC variable to your
new create_shar function.

Signed-off-by: Thomas Kristensen <thkriste@cisco.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6eb6726..a914a2c 100644
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



