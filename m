Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 58C1071633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:50:11 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 25 Aug 2015 11:50:08 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 11:50:07 +0200
Message-ID: <1440496207-22738-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy] qemu-slirp: CVE-2014-3640
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
X-List-Received-Date: Tue, 25 Aug 2015 09:50:13 -0000
Content-Type: text/plain

Fixes NULL pointer deref in sosendto().

Reference:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3640

Upstream patch:
http://git.qemu.org/?p=qemu.git;a=commit;
h=9a72433843d912a45046959b1953861211d1838d

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch

diff --git a/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch b/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
new file mode 100644
index 0000000..a7ecf31
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
@@ -0,0 +1,48 @@
+From 9a72433843d912a45046959b1953861211d1838d Mon Sep 17 00:00:00 2001
+From: Petr Matousek <pmatouse@redhat.com>
+Date: Thu, 18 Sep 2014 08:35:37 +0200
+Subject: [PATCH] slirp: udp: fix NULL pointer dereference because of
+ uninitialized socket
+
+When guest sends udp packet with source port and source addr 0,
+uninitialized socket is picked up when looking for matching and already
+created udp sockets, and later passed to sosendto() where NULL pointer
+dereference is hit during so->slirp->vnetwork_mask.s_addr access.
+
+Fix this by checking that the socket is not just a socket stub.
+
+This is CVE-2014-3640.
+
+Upstream-Status: Backport
+
+Signed-off-by: Petr Matousek <pmatouse@redhat.com>
+Reported-by: Xavier Mehrenberger <xavier.mehrenberger@airbus.com>
+Reported-by: Stephane Duverger <stephane.duverger@eads.net>
+Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
+Message-id: 20140918063537.GX9321@dhcp-25-225.brq.redhat.com
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+(cherry picked from commit 01f7cecf0037997cb0e58ec0d56bf9b5a6f7cb2a)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ slirp/udp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/slirp/udp.c b/slirp/udp.c
+index 8cc6cb6..f77e00f 100644
+--- a/slirp/udp.c
++++ b/slirp/udp.c
+@@ -152,7 +152,7 @@ udp_input(register struct mbuf *m, int iphlen)
+ 	 * Locate pcb for datagram.
+ 	 */
+ 	so = slirp->udp_last_so;
+-	if (so->so_lport != uh->uh_sport ||
++	if (so == &slirp->udb || so->so_lport != uh->uh_sport ||
+ 	    so->so_laddr.s_addr != ip->ip_src.s_addr) {
+ 		struct socket *tmp;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index 444a422..92a89d6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-CVE-2015-3456.patch \
             file://CVE-2014-7840.patch \
             file://vnc-CVE-2014-7815.patch \
+            file://slirp-CVE-2014-3640.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-- 
1.9.1


