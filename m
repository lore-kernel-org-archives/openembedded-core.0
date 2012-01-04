Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiPtf-0004d1-KA for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 13:24:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04CHQVJ018643
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 12:17:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17912-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 12:17:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04CHJVS018637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 12:17:21 GMT
Message-ID: <1325679439.3555.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 12:17:19 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] populate_sdk_ipk.bbclass: Ensure the correct environment is setup for postinstalls
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
X-List-Received-Date: Wed, 04 Jan 2012 12:24:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, various postinstalls get run with incorrect environments
leading to various failures when building the toolchains.

This adds some duplication and some variables we'd be better off
removing. It does unbreak the SDK ipk code for now though. This needs
revisiting.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 8a0c268..c256c69 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -20,6 +20,11 @@ populate_sdk_ipk() {
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_IPK="${TOOLCHAIN_TARGET_TASK}"
 
+	export D=${INSTALL_ROOTFS_IPK}
+	export OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
+	export IPKG_OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
+	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+
 	package_install_internal_ipk
 
 	#install host




