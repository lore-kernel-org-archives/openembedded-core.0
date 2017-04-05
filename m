Return-Path: <martin.balik@siemens.com>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Apr 2017 10:49:51 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A0A8177980
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 10:49:50 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v35Adr6m021901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 12:39:54 +0200
Received: from dev.sbt.siemens.com ([163.242.51.204])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v35AdrFn000744;
	Wed, 5 Apr 2017 12:39:53 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 6B8862FBF093;
	Wed,  5 Apr 2017 12:39:53 +0200 (CEST)
From: Martin Balik <martin.balik@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 12:38:57 +0200
Message-Id: <1491388737-4855-1-git-send-email-martin.balik@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] busybox: Security fix BUG9071
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
X-List-Received-Date: Wed, 05 Apr 2017 10:49:53 -0000

Signed-off-by: Martin Balik <martin.balik@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../busybox/BUG9071_buffer_overflow_arp.patch      | 53 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch

diff --git a/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch b/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
new file mode 100644
index 0000000..828694c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
@@ -0,0 +1,53 @@
+busybox1.24.1: Fix busybox - (local) cmdline stack buffer overwrite 
+
+[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=9071
+
+busybox - (local) cmdline stack buffer overwrite 
+
+Busybox provides an `arp` applet which is missing an array bounds check for 
+command-line parameter `IFNAME`. It is therefore vulnerable to a command-line 
+based local stack buffer overwrite effectively allowing local users to write 
+past a 16 bytes fixed stack buffer. This leads to two scenarios, one (A) where 
+an IOCTL for GET_HW_ADDRESS (`SIOCGIFHWADDR`) fails and results in a corrupted 
+`va_list` being passed to `*printf()` and one (B) where an attacker might provide 
+valid params for the IOCTL and trick the program to proceed and result in a 
+`RET eip overwrite` eventually gaining code execution.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/networking/arp.c?id=88e2b1cb626761b1924305b761a5dfc723613c4e]
+BUG: BUG9071
+Signed-off-by: Martin Balik <martin.balik@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+--
+
+diff --git a/networking/arp.c b/networking/arp.c
+index 0099aa5..87eb327 100644
+--- a/networking/arp.c
++++ b/networking/arp.c
+@@ -176,7 +176,7 @@ static int arp_del(char **args)
+ 	if (flags == 0)
+ 		flags = 3;
+ 
+-	strncpy(req.arp_dev, device, sizeof(req.arp_dev));
++	strncpy_IFNAMSIZ(req.arp_dev, device);
+ 
+ 	err = -1;
+ 
+@@ -217,7 +217,7 @@ static void arp_getdevhw(char *ifname, struct sockaddr *sa)
+ 	struct ifreq ifr;
+ 	const struct hwtype *xhw;
+ 
+-	strcpy(ifr.ifr_name, ifname);
++	strncpy_IFNAMSIZ(ifr.ifr_name, ifname);
+ 	ioctl_or_perror_and_die(sockfd, SIOCGIFHWADDR, &ifr,
+ 					"can't get HW-Address for '%s'", ifname);
+ 	if (hw_set && (ifr.ifr_hwaddr.sa_family != hw->type)) {
+@@ -330,7 +330,7 @@ static int arp_set(char **args)
+ 	/* Fill in the remainder of the request. */
+ 	req.arp_flags = flags;
+ 
+-	strncpy(req.arp_dev, device, sizeof(req.arp_dev));
++	strncpy_IFNAMSIZ(req.arp_dev, device);
+ 
+ 	/* Call the kernel. */
+ 	if (option_mask32 & ARP_OPT_v)
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 41fc641..5dc1808 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -55,6 +55,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://makefile-libbb-race.patch \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
            file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
+           file://BUG9071_buffer_overflow_arp.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.1.4


