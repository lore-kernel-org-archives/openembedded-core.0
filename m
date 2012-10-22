Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEw8-0004sd-T2
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 12:08:45 +0200
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:55:18 -0700
Received: by mail-wg0-f69.google.com with SMTP id 16so1816369wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1xKIHZS3bJkcE45wTVhk0FsB316JkqKQg/N6oDkGTF0=;
	b=goRgUJxm5E77C2QsevpX2dYdp2HfmKIsQbotraMuQxWBBjGn1EoG15c8O0Q+GRQYoe
	Gg2Y68ERY5IpcONxKprN8gARi6RiDBHowUGg1QYf9UX3I7RAiT/9E/0rA2gDGszR7Kl6
	hzWNFsF7VkRDoHCA+P9QkgTz3wi+6oDKBMvgi9BeKFrSka6oxO3Yby/rahDVtbGGUxf4
	GZwrd+JHkQThoslrYXgnKyeGVp5DqR6bJHsFv5RYSwqWs+pbKAT7eVRxS8Sztdc+GKqI
	MOaQdjRDUwIEbhs8eq6MbzIBcoJa8cQvpNhYrHUQYY7O7PJfZy2IER1VBR8Ys9DnwJtl
	jPrQ==
Received: by 10.180.79.7 with SMTP id f7mr19849781wix.22.1350899716774;
	Mon, 22 Oct 2012 02:55:16 -0700 (PDT)
Received: by 10.180.79.7 with SMTP id f7mr19849770wix.22.1350899716674;
	Mon, 22 Oct 2012 02:55:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m14sm50330591wie.8.2012.10.22.02.55.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:55:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:37:24 +0100
Message-Id: <d54dfc8939a32ddde2b861d437dd2bf814d7ce15.1350898411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1350898411.git.ross.burton@intel.com>
References: <cover.1350898411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl7JVUZVt5wN3hEOzzwVt1DgdhPRnIopk1cIAtJAvNCP7RcHsJ85f4+wUC4/yI5TmEvo51tDyV92JF9VPrAR09NwAv1aDbIpdkhH41dn2GNeP0KxOMKRwlomP8Lcee69uRnhdyefJrsP2D+6IKFvjEHTZXpVgR+Fs0OnHzyIbWz11JH0WX9zUQFBSmmtNnkqYtH41N1
Subject: [PATCH 1/3] xserver-xorg: add runtime provides for the driver ABI version
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
X-List-Received-Date: Mon, 22 Oct 2012 10:08:45 -0000

The xserver driver ABIs can and do change in a way that is unrelated to the
version of xserver, so it's entirely possible to build an image that has a
mismatch between the server ABI version and the version that the drivers were
built against.  xserver detects this and refuses to load the modules.

By adding RPROVIDEs to the xserver package that describe the ABI versions it has
(such as xorg-abi-video-13, xorg-abi-input-11), drivers can RDEPEND on the
version that they were built against.  This means that when the ABIs change,
there will be package dependency errors at image time instead of images that
build fine but don't work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   27 +++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 772fa52..c5ce208 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r2"
+INC_PR = "r3"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -132,3 +132,28 @@ do_install_append () {
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
 }
+
+# Add runtime provides for the ABI versions of the video and input subsystems,
+# so that drivers can depend on the relevant version.
+python populate_packages_prepend() {
+    import subprocess
+
+    # Set PKG_CONFIG_PATH so pkg-config looks at the .pc files that are going
+    # into the new package, not the staged ones.
+    newenv = dict(os.environ)
+    newenv["PKG_CONFIG_PATH"] = d.expand("${PKGD}${libdir}/pkgconfig/")
+
+    def get_abi(name):
+        abis = {
+          "video": "abi_videodrv",
+          "input": "abi_xinput"
+        }
+        p = subprocess.Popen(args="pkg-config --variable=%s xorg-server" % abis[name],
+                             shell=True, env=newenv, stdout=subprocess.PIPE)
+        output = p.communicate()[0]
+        return "xorg-abi-%s-%s" % (name, output.split(".")[0])
+
+    pn = d.getVar("PN", True)
+    d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
+    d.appendVar("RPROVIDES_" + pn, " " + get_abi("video"))
+}
-- 
1.7.10



