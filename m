Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1CDE71547
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 08:59:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S8xCbQ020780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 01:59:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Sep 2014 01:59:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Sep 2014 16:59:59 +0800
Message-ID: <e8d9350d5e90ff8b13ab18cd0ec0c868e7cc7f9e.1411894750.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411894750.git.Qi.Chen@windriver.com>
References: <cover.1411894750.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dhcp: fix for systemd service file
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
X-List-Received-Date: Sun, 28 Sep 2014 08:59:18 -0000
Content-Type: text/plain

1. Set Type=forking for dhcpd.service to make it start up correctly.
2. Add PIDFile=/var/run/dhcpd.pid
3. Do not force existence of the environment file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/files/dhcpd.service | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
index 8648f1a..4215173 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcpd.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -4,7 +4,9 @@ After=network.target
 After=time-sync.target
 
 [Service]
-EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
+Type=forking
+PIDFile=/var/run/dhcpd.pid
+EnvironmentFile=-@SYSCONFDIR@/default/dhcp-server
 ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
 
 [Install]
-- 
1.9.1


