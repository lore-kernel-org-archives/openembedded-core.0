Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8507277A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 03:09:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI39IuV025460
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:09:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Dec 2014 19:09:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Dec 2014 11:09:18 +0800
Message-ID: <532a954382bdbcd36be7d3554271cb788a65aa7a.1418871891.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418871891.git.Qi.Chen@windriver.com>
References: <cover.1418871891.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] dhcp: fix for systemd service file
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
X-List-Received-Date: Thu, 18 Dec 2014 03:09:18 -0000
Content-Type: text/plain

1. Add '-f --no-pid' option to make dhcpd start correctly
2. Do not force existence of the environment file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/files/dhcpd.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
index 8648f1a..484f46a 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcpd.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -4,8 +4,8 @@ After=network.target
 After=time-sync.target
 
 [Service]
-EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
-ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
+EnvironmentFile=-@SYSCONFDIR@/default/dhcp-server
+ExecStart=-@SBINDIR@/dhcpd -f --no-pid -q $INTERFACES
 
 [Install]
 WantedBy=multi-user.target
-- 
1.9.1


