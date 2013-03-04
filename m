Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCZgk-0007fY-0M for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 19:00:39 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24HpTUX025227; Mon, 4 Mar 2013 17:51:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OFvJe-FEzg2Y; Mon,  4 Mar 2013 17:51:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24HpZXj025234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Mar 2013 17:51:42 GMT
Message-ID: <1362419021.29587.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 04 Mar 2013 17:43:41 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: "saul.wold" <saul.wold@intel.com>
Subject: [PATCH] populate_sdk_base/image: Fix races for variable mappings
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
X-List-Received-Date: Mon, 04 Mar 2013 18:00:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When using the -c populate_sdk option, images are not generated quite as
they should be under certain circumstances. For example the dropbear
feature may not get replaced with openssh, leading to both being installed
with an appropriate rootfs failure.

This patch moves the remapping logic to later points in the code, ensuring
there is no conflict. The result is slightly simpler too as an added bonus.

[YOCTO #3749]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 19564d8..68bd342 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -117,6 +117,10 @@ python () {
 
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
 
+    if d.getVar('BB_WORKERCONTEXT', True) is not None:
+        runtime_mapping_rename("PACKAGE_INSTALL", d)
+        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
+
     # Ensure we have the vendor list for complementary package handling
     ml_vendor_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
@@ -129,19 +133,6 @@ python () {
     d.setVar('MULTILIB_VENDORS', ml_vendor_list)
 }
 
-python image_handler () {
-    if not isinstance(e, bb.event.RecipeParsed):
-        return
-
-    # If we don't do this we try and run the mapping hooks while parsing which is slow
-    # bitbake should really provide something to let us know this...
-    if e.data.getVar('BB_WORKERCONTEXT', True) is not None:
-        runtime_mapping_rename("PACKAGE_INSTALL", e.data)
-        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", e.data)
-
-}
-addhandler image_handler
-
 #
 # Get a list of files containing device tables to create.
 # * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device table file
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 88de1e4..7af2d2e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -29,14 +29,9 @@ EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
 
-python () {
-    # If we don't do this we try and run the mapping hooks while parsing which is slow
-    # bitbake should really provide something to let us know this...
-    if bb.data.getVar('BB_WORKERCONTEXT', d, True) is not None:
-        runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
-}
-
 fakeroot python do_populate_sdk() {
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
+
     bb.build.exec_func("populate_sdk_image", d)
 
     # Handle multilibs in the SDK environment, siteconfig, etc files...




