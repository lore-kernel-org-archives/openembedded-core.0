Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F07B6610FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:40:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9FDe3ex014955 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:40:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CniKuFbV_HHL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:40:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9FDdxov014933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:40:00 +0100
Message-ID: <1381844395.29912.421.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2013 14:39:55 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: nativesdk: Fix pn check
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
X-List-Received-Date: Tue, 15 Oct 2013 13:40:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are missing brackets in the check meaning MLPREFIX doesn't
get set for nativesdk-qemu-helper when it should be.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ed276ef..e092b3b 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -59,7 +59,8 @@ export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 python nativesdk_virtclass_handler () {
     pn = e.data.getVar("PN", True)
-    if not pn.endswith("-nativesdk") or pn.startswith("nativesdk-"):
+    if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
+        bb.warn(str(pn))
         return
 
     e.data.setVar("MLPREFIX", "nativesdk-")



