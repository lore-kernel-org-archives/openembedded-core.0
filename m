Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROXiL-0007GF-Ng
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 17:42:57 +0100
Received: by yenm3 with SMTP id m3so2140664yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=cHc2B9rpQs/glQwdLK+AAyacvFX8sxm02REN8aiYU/8=;
	b=FQ50QUD5v4zf+AwNSFbhbJSqCAY3e9sh7baYLCGQI6bMunzUgi30jx9jkApgDGXDgR
	ixOpKdzMXALuE2Hw48zrABocvKmuR9PdHGc971KNufzh8zQ45k1JMdhKyMEVso/byJCI
	mdB+WcybZPjQteI1jTYIQ8ZTpDyXbM+7edE/Q=
Received: by 10.101.194.15 with SMTP id w15mr3684587anp.62.1320943000654;
	Thu, 10 Nov 2011 08:36:40 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y71sm12885073yhh.6.2011.11.10.08.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 08:36:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 16:36:30 +0000
Message-Id: <a69f9c464cf0976ce52ea2f14a20a409b27615ff.1320942947.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320942947.git.otavio@ossystems.com.br>
References: <cover.1320942947.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320942947.git.otavio@ossystems.com.br>
References: <cover.1320942947.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] dhcp: generate initial leases files for server
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
X-List-Received-Date: Thu, 10 Nov 2011 16:42:57 -0000

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



