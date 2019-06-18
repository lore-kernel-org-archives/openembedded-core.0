Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB0A7E966
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:59:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45St7W0wC2z1rBNc;
	Tue, 18 Jun 2019 17:59:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45St7W0kBbz1qqkC;
	Tue, 18 Jun 2019 17:59:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id TN65atyL6lxI; Tue, 18 Jun 2019 17:59:34 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 18 Jun 2019 17:59:34 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 8223A454054B;
	Tue, 18 Jun 2019 17:59:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xl7uMf7lhrrh; Tue, 18 Jun 2019 17:59:30 +0200 (CEST)
Received: from localhost.localdomain (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id BAAEB454045E;
	Tue, 18 Jun 2019 17:59:30 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 17:57:25 +0200
Message-Id: <20190618155725.17612-1-sbabic@denx.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V2] systat: systemd never enables the service
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
X-List-Received-Date: Tue, 18 Jun 2019 15:59:34 -0000

Even if SYSTEMD_AUTO_ENABLE is set to "enable", the service is never
activated by systemd. The cause is the postinst function in the recipe:

 pkg_postinst_${PN} () {
         if [ -n "$D" ]; then
                 exit 0
         fi
         if [ -e /etc/init.d/populate-volatile.sh ]; then
                 /etc/init.d/populate-volatile.sh update
         fi
 }

This generates with activated systemd the following postinst script:

	set -e
	        if [ -n "$D" ]; then
	                exit 0
	        fi
	        if [ -e /etc/init.d/populate-volatile.sh ]; then
	                /etc/init.d/populate-volatile.sh update
	        fi
	OPTS=""

	if [ -n "$D" ]; then
	    OPTS="--root=$D"
	fi

	if type systemctl >/dev/null 2>/dev/null; then
		if [ -z "$D" ]; then
			systemctl daemon-reload
		fi

		systemctl $OPTS enable sysstat.service

		if [ -z "$D" -a "enable" = "enable" ]; then
			systemctl --no-block restart sysstat.service
		fi
	fi

Due to the exit statement, systemctl is never called and the service is
never enabled in rootfs.
Invert the logic for the check to let run the rest of postinst script.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

Changes since V1:
	- rebase on current master

 meta/recipes-extended/sysstat/sysstat.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 6b21c6b8c1..4e29721666 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -52,12 +52,11 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-        if [ -n "$D" ]; then
-                exit 0
-        fi
-        if [ -e /etc/init.d/populate-volatile.sh ]; then
-                /etc/init.d/populate-volatile.sh update
-        fi
+	if [  ! -n "$D" ]; then
+		if [ -e /etc/init.d/populate-volatile.sh ]; then
+			/etc/init.d/populate-volatile.sh update
+		fi
+	fi
 }
 
 FILES_${PN} += "${libdir}/sa ${systemd_system_unitdir}"
-- 
2.17.1


