Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 82ECA61EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9xr001260; Thu, 22 Aug 2013 12:42:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vvjNATa15PLI; Thu, 22 Aug 2013 12:42:09 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg6Wg001213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:07 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001hY-2X; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:35 +0100
Message-Id: <1377171000-6469-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/28] populate_sdk_base: Allow sdk tar options to be overridden
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:20 -0000

It can be useful to override or append options to the SDK tarball creation command
so add a variable to allow this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index aa3c2fa..998280e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -108,11 +108,13 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
+SDKTAROPTS = "--owner=root --group=root -j"
+
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
 
 fakeroot create_shar() {
-- 
1.8.1.2


