Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ2Un-0001wg-Sz for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 15:26:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92DDkDO015824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:13:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15584-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 14:13:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92DDcWO015818
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 14:13:39 +0100
Message-ID: <1349183622.15753.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 14:13:42 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] chrpath: We should provide chrpath-replacement-native and install into a native specific directory
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
X-List-Received-Date: Tue, 02 Oct 2012 13:26:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

chrpath is assumed to be provided by the build host system. This means
we need to provide a replacement version and install into a specific directory
to avoid races.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
index 679f1aa..bb9b4b6 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.14.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
@@ -20,4 +20,7 @@ inherit autotools
 # relocatable, so use the one we've just built
 CHRPATH_BIN_virtclass-native = "${S}/chrpath"
 
+PROVIDES_append_virtclass-native = " chrpath-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
 BBCLASSEXTEND = "native nativesdk"




