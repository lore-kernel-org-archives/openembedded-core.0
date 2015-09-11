Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A609763F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 12:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCPxqR027328 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h1Yx7EIz8sY9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BCPkOk027313
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:25:58 +0100
Message-ID: <1441974346.24871.383.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Sep 2015 13:25:46 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
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
X-List-Received-Date: Fri, 11 Sep 2015 12:25:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK installing on
anything with an older kernel which is clearly incorrect.

I attempted to extract the correct non-overridden version from the data store
but it proved problematic and I was running into data store issues. Those
are a separate problem but there isn't time to fix this right now.

Instead just code the SDK kernel version separately to work around this for
now (and fix the autobuilder tests and SDK usage).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index b015bf0..aa7a9a5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -81,6 +81,11 @@ python write_host_sdk_manifest () {
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 
+# Some archs override this, we need the nativesdk version
+# turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
+# manipulation.
+SDK_OLDEST_KERNEL = "2.6.32"
+
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
@@ -156,7 +161,7 @@ EOF
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
-		-e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
+		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
 		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \



