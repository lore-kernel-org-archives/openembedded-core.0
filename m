Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id BE37278195
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 19:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=7+hlUYbhjF0Fr9JBHFgXJbXp9btLJ29iWgQpxDwMahY=; 
	b=MRbeX5sFR9GITRD6AHEH+ENzQgGeqz/dJGB0/SyvZ/m8aZ5+DP/hRycqmAJ/fXo3XSbG2rZ1BQ4xsi2TGKua3F++XSawe0QU4xNVWaVEZYHnTAp+rU/PFg3w2nknBLT6Tv7HObqfYoOYk6hx5J8OI/a5ptQ2xTFExBE+/KeA7ZftNR0H1fxxDxDPQV3UfaDRNLdRH++H8vVdm6n6hZls8O2isSxV7Tbgdgxwli794PBHHDTC/tpvJUxEMDghadDNTVefZd0vobk7Xbif8TD3gDWP8RbP1msbpzqDVmpN54dHv7ginQBWxoJNZvGrXc5VGGSnIDQ+G9WLoMIjxsPxVg==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1djs1Y-0005SP-HR for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:06:08 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 21:05:01 +0200
Message-Id: <20170821190501.19909-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemd: don't symlink /etc/resolv.conf if resolved is disabled
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
X-List-Received-Date: Mon, 21 Aug 2017 19:06:09 -0000

 * symlinking /etc/resolv.conf to /run/systemd/resolve/resolv.conf
   when resolved is not enabled is wrong, as this prevents network
   manager from handling the resolv.conf file itself and breaking
   DNS resolution.

   See: NetworkManager.conf manpage or https://git.io/v5UJQ

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 4560cf4175..dddad62941 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -235,12 +235,7 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
-		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
-		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
-	else
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
-- 
2.11.0


