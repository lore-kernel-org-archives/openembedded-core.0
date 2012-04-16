Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJjNx-0002Gw-7e for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 12:42:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GAWrB9030973
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:32:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30079-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:32:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GAWhZW030966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:32:44 +0100
Message-ID: <1334572366.16992.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 11:32:46 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] dropbear: Allow tasks to be safely re-executed
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
X-List-Received-Date: Mon, 16 Apr 2012 10:42:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Re-running the debug_patch task would cause the build to fail. This patch
moves the extra patch handling directly into SRC_URI and removes the need
for the separate task, allowing safe re-execution of each task.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1894715..2d6aeb2 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 		 file://dropbear-0.53.1-static_build_fix.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
-	         file://allow-nopw.patch;apply=no \
+	         ${@base_contains("DISTRO_TYPE", "debug", "file://allow-nopw.patch", "",d)} \
 	         file://init \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
@@ -40,15 +40,6 @@ EXTRA_OECONF += "\
 
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-do_debug_patch() {
-	if [ "${DISTRO_TYPE}" = "debug" ]; then
-		bbnote "WARNING: applying allow-nopw.patch which allows password-less logins!"
-		patch -p1 < ${WORKDIR}/allow-nopw.patch
-	fi
-}
-
-addtask do_debug_patch after do_patch before do_configure
-
 do_install() {
 	install -d ${D}${sysconfdir} \
 		   ${D}${sysconfdir}/init.d \




