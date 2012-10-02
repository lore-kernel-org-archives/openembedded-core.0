Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ2Xd-0001zx-Lm for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 15:29:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92DGhsx015863
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:16:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15584-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 14:16:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92DGW7n015857
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:16:33 +0100
Message-ID: <1349183795.15753.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 14:16:35 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: nativesdk.bbclass: Ensure we have chrpath >=0.14
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
X-List-Received-Date: Tue, 02 Oct 2012 13:29:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Versions earlier than 0.14 can't cope with 32 bit binaries on a 64 bit
system and vice versa. This results in problems for certain SDKMACHINE 
combinations on certain hosts. By ensuring we build
chrpath-replacement-native we avoid this problems and the binaries work
correctly.

[YOCTO #3161]
[YOCTO #3201]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 3334817..e2971d1 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -16,6 +16,13 @@ CLASSOVERRIDE = "class-nativesdk"
 PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
 PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 
+#
+# We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
+# binaries
+#
+DEPENDS_append = " chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
+
 STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"
 




