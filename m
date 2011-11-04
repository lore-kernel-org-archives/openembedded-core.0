Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTL-0001fF-D9
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:35 +0100
Received: by mail-yw0-f47.google.com with SMTP id 9so2651180ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bFplxiWsYNNjytwS/wgwHLCXCJvr3u98NRWGwk/VPAs=;
	b=ENedzDg7SXqaY94Oz10OM1L0fEU3id2wnodrjoOv/6d4arDrc69GOIJm/eR2wpUfJ6
	3WGr+hCdwwjdmHTQK2dWDWsxbKdvlcdDMrJ+QL7DMPhPqsnBBWCODwLHW/4DuH2swOlP
	zLIs5B/ErVdi6zWAmfh6Iw8+jluPOxCKUG04c=
Received: by 10.236.78.130 with SMTP id g2mr21809415yhe.79.1320430827658;
	Fri, 04 Nov 2011 11:20:27 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:08 +0000
Message-Id: <905f2f437c6fd144ae2773aa8fa60a4caba6455b.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: [PATCH 5/5] dhcp: move server configuration to dhcp-server-config
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
X-List-Received-Date: Fri, 04 Nov 2011 18:26:35 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      |   10 ++++++++--
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index bdaa5e9..1cc529d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -53,9 +53,15 @@ do_install_append () {
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
 }
 
-PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
+PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
+
 FILES_${PN} = ""
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
+
+FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
+RRECOMMENDS_dhcp-server = "dhcp-server-config"
+
+FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
+
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
 FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 223522f..8ed7d76 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.5



