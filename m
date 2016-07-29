Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4326080F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 09:24:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9300947"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 17:24:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E2EBF42984FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 17:24:26 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 17:24:26 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1461316711-49417-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: E2EBF42984FA.A170F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dhcp: dhcrelay.service cannot start successfully
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
Date: Fri, 29 Jul 2016 09:24:33 -0000
X-Original-Date: Fri, 22 Apr 2016 12:18:31 +0300
X-List-Received-Date: Fri, 29 Jul 2016 09:24:33 -0000
Content-Type: text/plain

Modify dhcrelay.service to avoid it start failed.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc               | 1 +
 meta/recipes-connectivity/dhcp/files/dhcrelay.service | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 421221f..386fe78 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -79,6 +79,7 @@ do_install_append () {
 	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
 	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
 	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
+       sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhcrelay.service b/meta/recipes-connectivity/dhcp/files/dhcrelay.service
index a2d8189..15ff927 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcrelay.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -3,7 +3,8 @@ Description=DHCP Relay Agent Daemon
 After=network.target
 
 [Service]
-ExecStart=@SBINDIR@/dhcrelay -d --no-pid
+EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
+ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
 
 [Install]
 WantedBy=multi-user.target
-- 
1.8.4.2




