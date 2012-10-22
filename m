Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEwA-0004sf-ET
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 12:08:46 +0200
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:55:20 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so1829523bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=y1uFoO9q+hCNpc3+mO17D/cBaj88Ll00mujNzp0YKXs=;
	b=B5V2VsJYvm2AmgrI4gss21epM3PXv943tN6b1ZEewfeY93D9qvI0ZZRUvhzq8enI84
	fFIYWzN8nv5/qIYpotvR07XGKwYL1/dZPqiDYVvqEPci9B1WIZiKr5q6KamGrKWweV7c
	c9GclXY0sB0Bmn2bUTqi+yqCgk5w55auHpe4lWY9gLB8NnbOBJnBwlQuUTwIuRbJwS60
	e/AJSFijaxUvy0bt4wku2vBhybJQ9D49qXY76H2o0ZnGM4KQCAj/9tUVLyfWDQP6Yx4r
	A75wBl2a9AXndeO9qz5cEVWjKutyFe9rGgeMOqPnAFaRDvU97herHOZUrt5iUl4uGXUi
	ZdAw==
Received: by 10.180.79.100 with SMTP id i4mr35729881wix.12.1350899718412;
	Mon, 22 Oct 2012 02:55:18 -0700 (PDT)
Received: by 10.180.79.100 with SMTP id i4mr35729861wix.12.1350899718235;
	Mon, 22 Oct 2012 02:55:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m14sm50330591wie.8.2012.10.22.02.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:55:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:37:25 +0100
Message-Id: <317edf41e92630b775f728629e1a9612cdb195c8.1350898411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <d54dfc8939a32ddde2b861d437dd2bf814d7ce15.1350898411.git.ross.burton@intel.com>
References: <d54dfc8939a32ddde2b861d437dd2bf814d7ce15.1350898411.git.ross.burton@intel.com>
In-Reply-To: <cover.1350898411.git.ross.burton@intel.com>
References: <cover.1350898411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkXbVO/M2sZbtpjDgmSVul4/J8s9O5Gw/1KWCwwLRNNVyItjdPyY28/eRKkyS575URdivXxu3ByHwZjDzGji0Y0aVulURJO9UjxSb1FHneuIH4TzGqiBvUgW6aw3S8fzk4m+jlGVJTOCQB52RiEn+FS+/b7pP9Pbr05/BoxHOjAHkHI000NO17ZvjX3NGlGsfbxqJAi
Subject: [PATCH 2/3] xorg-driver: add xserver driver ABI dependencies
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
X-List-Received-Date: Mon, 22 Oct 2012 10:08:46 -0000

At build time extract the xserver driver ABI versions that we're building
against and add RDEPENDs on them, so the driver isn't used against an xserver
with a different ABI (which won't work).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xorg-driver-common.inc                |   17 ++++++++++++++++-
 .../xorg-driver/xorg-driver-input.inc                 |    4 ++++
 .../xorg-driver/xorg-driver-video.inc                 |    3 +++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 9a474b7..f9f25ff 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "2"
-INC_PR = "r17"
+INC_PR = "r18"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
@@ -31,3 +31,18 @@ do_configure_prepend () {
 do_install_append() {
 	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
 }
+
+# Function to add the relevant ABI dependency to drivers, which should be called
+# from a populate_packages append/prepend.
+def add_abi_depends(d, name):
+    # Map of ABI names exposed in the dependencies to pkg-config variables
+    abis = {
+      "video": "abi_videodrv",
+      "input": "abi_xinput"
+    }
+
+    output = os.popen("pkg-config xorg-server --variable=%s" % abis[name]).read()
+    abi = "xorg-abi-%s-%s" % (name, output.split(".")[0])
+
+    pn = d.getVar("PN", True)
+    d.appendVar('RDEPENDS_' + pn, ' ' + abi)
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index bf4ca6c..a544d71 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -2,5 +2,9 @@ include xorg-driver-common.inc
 
 DEPENDS += "inputproto kbproto "
 
+python populate_packages_prepend() {
+    add_abi_depends(d, "input")
+}
+
 FILES_${PN} += " ${libdir}/xorg/modules/input/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index 57c80d1..4fe3349 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -2,3 +2,6 @@ include xorg-driver-common.inc
 
 DEPENDS =+ "renderproto videoproto xextproto fontsproto"
 
+python populate_packages_prepend() {
+    add_abi_depends(d, "video")
+}
-- 
1.7.10



