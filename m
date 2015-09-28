Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 92EAA600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 10:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8SAuUoh003740 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:56:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4VQJ0PUYh8yI
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:56:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8SAuFJe003737
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:56:26 +0100
Message-ID: <1443437775.19044.277.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 11:56:15 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base: Simplify postprocess commands
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
X-List-Received-Date: Mon, 28 Sep 2015 10:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When looking at and trying to build a slightly customised SDK, I
realised the code could be simplified and written in a way which was
more customisable.

This patch moves various function calls into the SDK_POSTPROCESS_COMMAND
which was intended for this kind of use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index aa7a9a5..36876e8 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -80,6 +80,7 @@ python write_host_sdk_manifest () {
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; tar_sdk; ${SDK_PACKAGING_FUNC}; "
 
 # Some archs override this, we need the nativesdk version
 # turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
@@ -108,15 +109,6 @@ fakeroot python do_populate_sdk() {
                     manifest_type=Manifest.MANIFEST_TYPE_SDK_TARGET)
 
     populate_sdk(d)
-
-    # Process DEFAULTTUNE
-    bb.build.exec_func("create_sdk_files", d)
-
-    bb.build.exec_func("tar_sdk", d)
-
-    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
-    if sdk_packaging_func.strip():
-        bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
 }
 
 fakeroot create_sdk_files() {



