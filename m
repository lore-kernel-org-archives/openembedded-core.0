Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RuQQU-0003Mi-Lr
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 16:24:18 +0100
Received: by yhfq46 with SMTP id q46so2375859yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 07:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2w8n72xtpjwBYmISeDdgBacyPDxHJJ5cvJGFtlSt04I=;
	b=nggH7Ahqh4E4U7HyBUsZ1VTWafrkkC3OXgJHTMnvMONYH38tRLlxSN0JYwExpUTKcI
	3RVSwZN23G9JhZJlMrNjJr5Xatj9imWRLoarPiWc55gSNP39CJjTij7oAaLVbzVTpuPm
	3+DuZ6/HhKA0eFk8uS5G7QWExkfVu1u84sr70=
Received: by 10.236.136.99 with SMTP id v63mr24904646yhi.46.1328541377326;
	Mon, 06 Feb 2012 07:16:17 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id i12sm36000501anm.6.2012.02.06.07.16.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 07:16:16 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:16:02 +0000
Message-Id: <f3c82bbf545c086ccd89c06020f8721637fe9202.1328541241.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328541241.git.otavio@ossystems.com.br>
References: <cover.1328541241.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328541241.git.otavio@ossystems.com.br>
References: <cover.1328541241.git.otavio@ossystems.com.br>
Subject: [PATCH 1/2] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Mon, 06 Feb 2012 15:24:18 -0000

Both server and client needs access to leases files so its creation
and removal are now handled by postinst/postrm scripts.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      |   25 ++++++++++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index be256ce..f66dfba 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -66,12 +66,35 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp/"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
 
 pkg_postinst_dhcp-server() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
     touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
     touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
 }
+
+pkg_postinst_dhcp-client() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-server() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
+
+pkg_postrm_dhcp-client() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index a3a560b..3b1c0e2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r5"
+PR = "r7"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.5



