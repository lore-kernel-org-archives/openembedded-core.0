Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMG7e-0006Mw-04
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 10:31:38 +0100
Received: by wyh5 with SMTP id 5so2245741wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:25:28 -0700 (PDT)
Received: by 10.227.205.20 with SMTP id fo20mr16694583wbb.20.1320398728367;
	Fri, 04 Nov 2011 02:25:28 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q30sm14910983wbn.17.2011.11.04.02.25.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 02:25:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 10:25:24 +0100
Message-Id: <1320398724-22429-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] rootfs_ipk bbclass: special-case base-passwd preinst to run first
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
X-List-Received-Date: Fri, 04 Nov 2011 09:31:38 -0000

Preinst are run alphabetically which breaks when e.g. avahi-daemon needs /etc/passwd present.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/rootfs_ipk.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index e02b816..3ae0529 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -77,6 +77,15 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${ROOTFS_POSTINSTALL_COMMAND}
 	
 	runtime_script_required=0
+
+	# Base-passwd needs to run first to install /etc/passwd and friends
+	if [ -e ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst ] ; then
+		if ! sh ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst; then
+			runtime_script_required=1
+			opkg-cl ${IPKG_ARGS} flag unpacked base-passwd
+		fi
+	fi
+
 	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
 		     	runtime_script_required=1
-- 
1.7.2.5



