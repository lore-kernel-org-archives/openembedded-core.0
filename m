Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A863F74230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4RGSRjb024652 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 17:28:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NVxsVBJwzULT
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 17:28:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4RGSC8Q024640
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 17:28:24 +0100
Message-ID: <1432744092.404.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 May 2015 17:28:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] update-rc.d: Improve RRECOMMENDS handling
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
X-List-Received-Date: Wed, 27 May 2015 16:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately the combination of:

RRECOMMENDS_${PN} = "X"
UPDATERCPN = "${PN}"
RRECOMMENDS_${UPDATERCPN}_append = "Y"

is tricky for bitbake to order correctly since RRECOMMENDS_${UPDATERCPN} can
become "Y" which can then completely overwrite RRECOMMENDS_${PN}.

Avoid these issues and improve handling in general by explictly setting
the RRECOMMENDS on the list of packages modified in the general
code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index a9c0323..c385635 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -8,8 +8,6 @@ UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
 
-RRECOMMENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
-
 INITSCRIPT_PARAMS ?= "defaults"
 
 INIT_D_DIR = "${sysconfdir}/init.d"
@@ -120,6 +118,8 @@ python populate_packages_updatercd () {
         postrm += localdata.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
+        d.appendVar('RRECOMMENDS_' + pkg, " ${UPDATERCD}")
+
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
     if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \



