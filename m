Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROcPS-0002ir-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 22:43:46 +0100
Received: by ywt2 with SMTP id 2so673159ywt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=cHc2B9rpQs/glQwdLK+AAyacvFX8sxm02REN8aiYU/8=;
	b=Srcmpt4wNXu6xgYSKCmRBmOZAN05QBEqt58we2Rtsl8AuF1akFkJuK5HPzkme3p5yO
	ezHp2ipbcJactjAI1/I/7kGSMqOMPt3NL63KdK2b2mqcGXyy/NcSWa3YiKbyIldRr0WL
	5KsHefLAKNbNKOs8DI4dRg1mBzx2BxHl7cRdY=
Received: by 10.101.186.30 with SMTP id n30mr318575anp.98.1320961048925;
	Thu, 10 Nov 2011 13:37:28 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d5sm13778798yhl.19.2011.11.10.13.37.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 13:37:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 21:37:16 +0000
Message-Id: <021aada776e7f9ee9711f2959d00f98035f53a06.1320961001.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] dhcp: generate initial leases files for server
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
X-List-Received-Date: Thu, 10 Nov 2011 21:43:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      |    9 ++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 1cc529d..f9d80e7 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -51,13 +51,15 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+
+	install -d ${D}${localstatedir}/lib/dhcp/
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 FILES_${PN} = ""
 
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
+FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${localstatedir}/lib/dhcp/"
 RRECOMMENDS_dhcp-server = "dhcp-server-config"
 
 FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
@@ -68,3 +70,8 @@ FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
+
+pkg_postinst_dhcp-server() {
+    touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+}
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 8ed7d76..2471d61 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.5



