Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusQO-0001ts-SI
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 22:18:05 +0100
Received: by yenr5 with SMTP id r5so3087870yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2w8n72xtpjwBYmISeDdgBacyPDxHJJ5cvJGFtlSt04I=;
	b=LwrcMU0eN1ZHmrZiqCQYMwJzA3Ooke2JIv3EEFG/BxIy+JrL3LMJ1vnmnnpnUNu/u9
	s7TmJk72UFiyNzHot1NeZXymKWM32ci+geH6ltKvar2Xm8rKl+0lJ+TTttOU23s8uF2d
	Xaoz9Y39y1BtWzMMntjxcwCgRuf9cVeLoN16Q=
Received: by 10.236.191.134 with SMTP id g6mr33795056yhn.95.1328649002017;
	Tue, 07 Feb 2012 13:10:02 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id f47sm30150280yhh.8.2012.02.07.13.10.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 13:10:01 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 21:09:48 +0000
Message-Id: <f3c82bbf545c086ccd89c06020f8721637fe9202.1328648562.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Tue, 07 Feb 2012 21:18:05 -0000

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



