Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA3756DF55
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 10:30:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB3AURSU003365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 02:30:27 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 02:30:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 18:30:17 +0800
Message-ID: <893fa112fb49ce4c68f6b39d9e2da04ddef5aa95.1386066538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386066538.git.hongxu.jia@windriver.com>
References: <cover.1386066538.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] dhcp-client: override make_resolv_conf for read-only fs
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
X-List-Received-Date: Tue, 03 Dec 2013 10:30:29 -0000
Content-Type: text/plain

When dhclient-script starts, the client script first defines a shell
function, make_resolv_conf , which is later used to create the
/etc/resolv.conf file.

But the read-only filesystem didn't permit the modification, so override
the default behaviour and redefine this function in the enter hook script.

http://linux.about.com/library/cmd/blcmdl8_dhclient-script.htm
[YOCTO #5624]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc                           | 8 +++++++-
 .../recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index ad82b57..d9a6beb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
+	   file://readonly-dhclient-enter-hooks \
 	   file://dhclient.conf file://dhcpd.conf"
 
 inherit autotools
@@ -51,6 +52,9 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		install -m 0755 ${WORKDIR}/readonly-dhclient-enter-hooks ${D}${sysconfdir}/dhclient-enter-hooks
+	fi
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
@@ -66,7 +70,9 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf \
+                     ${sysconfdir}/dhclient-enter-hooks \
+"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks b/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks
new file mode 100644
index 0000000..06c90e3
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks
@@ -0,0 +1,3 @@
+make_resolv_conf(){
+  :
+}
-- 
1.8.1.2


