Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43D877058C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 06:59:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6N6xRpM008110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 23:59:27 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 22 Jul 2014 23:59:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 02:59:25 -0400
Message-ID: <1406098765-27347-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] net-tools: ifconfig interface:0 del <IP> will remove the aliased IP on IA64
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
X-List-Received-Date: Wed, 23 Jul 2014 06:59:29 -0000
Content-Type: text/plain

From: Yong Zhang <yong.zhang@windriver.com>

Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...terface-0-del-IP-will-remove-the-aliased-.patch | 32 ++++++++++++++++++++++
 .../net-tools/net-tools_1.60-25.bb                 |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch b/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
new file mode 100644
index 0000000..06f8142
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch
@@ -0,0 +1,32 @@
+From 81814dc2b14843009193efd307d814c26baa61f0 Mon Sep 17 00:00:00 2001
+From: Jiri Popelka <jpopelka@redhat.com>
+Date: Wed, 7 Dec 2011 19:14:09 +0100
+Subject: [PATCH] ifconfig interface:0 del <IP> will remove the aliased IP on IA64
+
+Upstream-Status: Backport
+
+commit 81814dc2b14843009193efd307d814c26baa61f0 from
+git://git.code.sf.net/p/net-tools/code
+
+---
+ ifconfig.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ifconfig.c b/ifconfig.c
+index bc405c6..dae8922 100644
+--- a/ifconfig.c
++++ b/ifconfig.c
+@@ -890,7 +890,9 @@ int main(int argc, char **argv)
+ 		    continue;
+ 		}
+ 		
+-		memcpy(&ip, &sin.sin_addr.s_addr, sizeof(unsigned long));
++		/* Clear "ip" in case sizeof(unsigned long) > sizeof(sin.sin_addr.s_addr) */
++		ip = 0;
++		memcpy(&ip, &sin.sin_addr.s_addr, sizeof(sin.sin_addr.s_addr));
+ 		
+ 		if (get_nmbc_parent(ifr.ifr_name, &nm, &bc) < 0) {
+ 		    fprintf(stderr, _("Interface %s not initialized\n"),
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
index 5a7b307..02826a0 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
            file://net-tools-config.h \
-           file://net-tools-config.make" 
+           file://net-tools-config.make \
+           file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
+	   "
 
 S = "${WORKDIR}/net-tools-1.60"
 
-- 
2.0.0


