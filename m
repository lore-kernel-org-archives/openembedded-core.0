Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRKm4-0004Iv-5s for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 12:02:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479qkEC002338
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 10:52:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01674-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 10:52:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479qcNN002332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 10:52:39 +0100
Message-ID: <1336384362.23777.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 May 2012 10:52:42 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] connman: Disable tist plugin on powerpc
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
X-List-Received-Date: Mon, 07 May 2012 10:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This plugin doesn't build on powerpc due to powerpc's terminal ioctl defintions
being incompatible with assumptions being made by this module. Until someone has
need and can test this on powerpc, disabling is the safest option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 8b27cfb..f2da8d9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,6 +20,9 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ofono \
             "
 
+TIST = "--enable-tist"
+TIST_powerpc = ""
+
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     ac_cv_path_PPPD=${sbindir}/pppd \
@@ -28,8 +31,8 @@ EXTRA_OECONF += "\
     --enable-threads \
     --enable-loopback \
     --enable-ethernet \
-    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi --enable-tist', '--disable-wifi', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
     --enable-dnsproxy \
     --enable-ofono \
     --enable-tools \




