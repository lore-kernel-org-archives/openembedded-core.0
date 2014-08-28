Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C44D71081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SARkGR012555 for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F_IvwmCisLcK
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SARhRA012551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:44 +0100
Message-ID: <1409221664.29296.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 11:27:44 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base: Remap TOOLCHAIN_HOST_TASK variable
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
X-List-Received-Date: Thu, 28 Aug 2014 10:27:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently this variable isn't passed through the magic rename
mangling. This means that if you try adding "nativesdk-eglibc"
to an image directly, you can't since the package is renamed
by debian.bbclass and nothing sees the renaming.

This is annoying since I wanted to exactly that. This code
change passes it through the standard renaming function, the
tricky part is that we have to set PKGDATA_DIR to point to
the correct sysroot during the call. We create a copy of the
 datastore for the purposes of the call to do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index db64d3a..abfcdc7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -72,6 +72,13 @@ fakeroot python do_populate_sdk() {
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
 
+    ld = bb.data.createCopy(d)
+    ld.setVar("PKGDATA_DIR", "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}/pkgdata")
+    runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
+    runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
+    d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK", True))
+    d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", True))
+    
     # create target/host SDK manifests
     create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
                     manifest_type=Manifest.MANIFEST_TYPE_SDK_HOST)



