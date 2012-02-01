Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsguI-00052g-FE
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 21:35:54 +0100
Received: by mail-yw0-f47.google.com with SMTP id q46so830227yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SV4lfHxE48E82kZZz/Ge0qLzhW2mEdUEy5uVRh9FvYQ=;
	b=iRB5jLDylGAL2zjHkLRv2bZLLd+p3gRd4cpQlfxZlLIjxIhVcVUTgEPxJUPKuB6vAL
	xqcCggQSKfoS7LSbtJhtLjUGYgo5s42onSq63mMvnVZAiw7ChwnmGUFgxHnYgqKq+HY/
	1OxMk+pXpH2uu3OHaTX2tVftYy6si7I293nlY=
Received: by 10.236.175.164 with SMTP id z24mr31214581yhl.84.1328128081258;
	Wed, 01 Feb 2012 12:28:01 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm120200yhk.15.2012.02.01.12.27.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 12:28:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 20:27:44 +0000
Message-Id: <429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Wed, 01 Feb 2012 20:35:54 -0000

Both server and client needs access to leases files so its creation
and removal are now handled by postinst/postrm scripts.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      |   19 ++++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index be256ce..9f0c5ea 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -66,12 +66,29 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp/"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
 
 pkg_postinst_dhcp-server() {
+    install -d $D/${localstatedir}/lib/dhcp
     touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
     touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
 }
+
+pkg_postinst_dhcp-client() {
+    install -d $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-server() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+    rmdir $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-client() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
+    rmdir $D/${localstatedir}/lib/dhcp
+}
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index a3a560b..478fd06 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.5



