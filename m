Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TBiae-0005DA-PG
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 10:46:32 +0200
Received: from mail6-db3-R.bigfish.com (10.3.81.230) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 08:03:48 +0000
Received: from mail6-db3 (localhost [127.0.0.1])	by mail6-db3-R.bigfish.com
	(Postfix) with ESMTP id 198AD48015A	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 08:03:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh1155h)
Received: from mail6-db3 (localhost.localdomain [127.0.0.1]) by mail6-db3
	(MessageSwitch) id 1347437026202498_23635;
	Wed, 12 Sep 2012 08:03:46 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.249])	by
	mail6-db3.bigfish.com (Postfix) with ESMTP id 2D9182E0053	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 08:03:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 08:03:43 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Wed, 12 Sep 2012 03:03:41 -0500
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8C83dpC001814;
	Wed, 12 Sep 2012 01:03:40 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2012 16:20:46 +0800
Message-ID: <1347438046-9745-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [oe-core v2] valgrind: fix debug info reading error when do memcheck on ppc targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 08:46:32 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    following is the error message:
        --2263-- WARNING: Serious error when reading debug info
        --2263-- When reading debug info from /lib/ld-2.13.so:
        --2263-- Can't make sense of .got section mapping
        --2263-- WARNING: Serious error when reading debug info
        --2263-- When reading debug info from /home/root/lzh:
        --2263-- Can't make sense of .data section mapping
        --2263-- WARNING: Serious error when reading debug info
        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_core-ppc32-linux.so:
        --2263-- Can't make sense of .data section mapping
        --2263-- WARNING: Serious error when reading debug info
        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_memcheck-ppc32-linux.so:
        --2263-- Can't make sense of .data section mapping
        --2263-- WARNING: Serious error when reading debug info
        --2263-- When reading debug info from /lib/libc-2.13.so:
        --2263-- Can't make sense of .data section mapping

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   33 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
new file mode 100644
index 0000000..b1626f0
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+fix debug info reading error when do memcheck on ppc targets
+    following is the error message:
+        --2263-- WARNING: Serious error when reading debug info
+        --2263-- When reading debug info from /lib/ld-2.13.so:
+        --2263-- Can't make sense of .got section mapping
+        --2263-- WARNING: Serious error when reading debug info
+        --2263-- When reading debug info from /home/root/lzh:
+        --2263-- Can't make sense of .data section mapping
+        --2263-- WARNING: Serious error when reading debug info
+        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_core-ppc32-linux.so:
+        --2263-- Can't make sense of .data section mapping
+        --2263-- WARNING: Serious error when reading debug info
+        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_memcheck-ppc32-linux.so:
+        --2263-- Can't make sense of .data section mapping
+        --2263-- WARNING: Serious error when reading debug info
+        --2263-- When reading debug info from /lib/libc-2.13.so:
+        --2263-- Can't make sense of .data section mapping
+
+Signed-off-by: Zhenhua Luo <b19537@freescale.com>
+
+--- a/coregrind/m_debuginfo/readelf.c	2012-09-11 21:45:36.696462313 -0500
++++ b/coregrind/m_debuginfo/readelf.c	2012-09-11 21:45:49.913463615 -0500
+@@ -1539,7 +1539,7 @@
+                 && phdr->p_offset < di->fsm.rw_map_foff + di->fsm.rw_map_size
+                 && phdr->p_offset + phdr->p_filesz 
+                    <= di->fsm.rw_map_foff + di->fsm.rw_map_size
+-                && (phdr->p_flags & (PF_R | PF_W | PF_X)) == (PF_R | PF_W)) {
++                && (phdr->p_flags & (PF_R | PF_W | PF_X)) >= (PF_R | PF_W)) {
+                if (n_rw == N_RX_RW_AREAS) {
+                   ML_(symerr)(di, True,
+                               "N_RX_RW_AREAS is too low; "
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index abda7a6..651ae60 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -21,6 +21,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://configure-with-glibc-2.16.patch \
           "
 
+SRC_URI_append_powerpc = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
+SRC_URI_append_powerpc64 = "file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
+
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
-- 
1.7.9.5




