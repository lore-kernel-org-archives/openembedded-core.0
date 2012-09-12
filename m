Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TBeH9-0003Yk-BO
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:10:07 +0200
Received: from mail4-db3-R.bigfish.com (10.3.81.232) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 03:27:30 +0000
Received: from mail4-db3 (localhost [127.0.0.1])	by mail4-db3-R.bigfish.com
	(Postfix) with ESMTP id F3DE5C0136	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 03:27:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh1155h)
Received: from mail4-db3 (localhost.localdomain [127.0.0.1]) by mail4-db3
	(MessageSwitch) id 1347420447827122_24657;
	Wed, 12 Sep 2012 03:27:27 +0000 (UTC)
Received: from DB3EHSMHS019.bigfish.com (unknown [10.3.81.237])	by
	mail4-db3.bigfish.com (Postfix) with ESMTP id B964DA0060	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 03:27:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS019.bigfish.com
	(10.3.87.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 03:27:26 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 11 Sep 2012 22:27:15 -0500
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8C3RDdi020399;
	Tue, 11 Sep 2012 20:27:13 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2012 11:44:18 +0800
Message-ID: <1347421458-2044-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: valgrind: fix debug info reading error when do memcheck on ppc targets
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
X-List-Received-Date: Wed, 12 Sep 2012 04:10:07 -0000
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
 ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   11 +++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 ++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
new file mode 100644
index 0000000..c3ebd67
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
@@ -0,0 +1,11 @@
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




