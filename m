Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7TQr-0005Cw-2G for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 16:14:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF5rWJ028137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:05:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26998-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:05:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF5iFp028131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:05:45 GMT
Message-ID: <1331651144.17122.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 15:05:44 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] matchbox-keyboard: Fix unpackaged files warning
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
X-List-Received-Date: Tue, 13 Mar 2012 15:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Addresses the warnings:

WARNING: For recipe matchbox-keyboard, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/gtk-2.0/2.10.0/immodules/libmb-im-invoker.la
WARNING:   /usr/lib/matchbox-panel/libkeyboard.la

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 74d8757..4c03541 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
@@ -43,6 +43,9 @@ FILES_matchbox-keyboard-applet-dbg += "${libdir}/matchbox-panel/.debug"
 do_install_append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d/
 	install -m 755 ${WORKDIR}/80matchboxkeyboard.shbg ${D}/${sysconfdir}/X11/Xsession.d/
+
+	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
+	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
 
 pkg_postinst_matchbox-keyboard-im () {




