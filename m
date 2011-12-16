Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbZkN-0008AW-Rf for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 16:30:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGFNuEm018874
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:23:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18791-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:23:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGFNkv2018868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:23:48 GMT
Message-ID: <1324049027.4568.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 15:23:47 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: nativesdk.bbclass: Remove historical FILES artifact
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 15:30:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Adding everything in ${prefix} to FILES and FILES-dbg is a historical artifact
left over from when this was sdk.bbclass back in 2009.

The BBCLASSEXTEND changes, multilib changes and cleanups to this file
over the intervening time mean this is simply no long needed.

Its also outright dangerous since it can link the packages together
in circular ways which don't make sense. The simplest thing to is
to drop this since it no longer does anything useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index b8abc9f..ceec53e 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -53,11 +53,6 @@ prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib = "lib"
 
-FILES_${PN} += "${prefix}"
-FILES_${PN}-dbg += "${prefix}/.debug \
-                    ${prefix}/bin/.debug \
-                   "
-
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 




