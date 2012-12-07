Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbY-0001Lc-4C
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:08 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A45C1302B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:27 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:01:59 -0800
Message-Id: <15e13ea1fc8a0c29b4ca68c31c83ca013c89c36e.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A45C1302B2.7B885
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 06/16] rootfs_rpm.bbclass: save rpmlib rather than remove it
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
X-List-Received-Date: Fri, 07 Dec 2012 05:36:08 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The rpmlib was removed when images that add
"remove_packaging_data_files" to ROOTFS_POSTPROCESS_COMMAND, which would
make the increment rpm image generation doesn't work in the second
build, since list_installed_packages would get incorrect value in the
second build, move the rpmlib to ${T} rather than remove it, and move it
back when INC_RPM_IMAGE_GEN =1.

[YOCTO #2690]

(From OE-Core rev: c30e79510c06701f10f659eedaa0fe785538ac17)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass      |    6 ++++++
 meta/classes/rootfs_rpm.bbclass |    6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9557433..90a6a9d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -143,6 +143,12 @@ fakeroot do_rootfs () {
     # When use the rpm incremental image generation, don't remove the rootfs
     if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
         rm -rf ${IMAGE_ROOTFS}
+    elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+        # Move the rpmlib back
+        if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
+                mkdir -p ${IMAGE_ROOTFS}/var/lib/
+                mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
+        fi
     fi
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9039b21..fbc46c0 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -154,7 +154,11 @@ EOF
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
+	# Save the rpmlib for increment rpm image generation
+	t="${T}/saved_rpmlib/var/lib"
+	rm -fr $t
+	mkdir -p $t
+	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 }
 
-- 
1.7.9.5



