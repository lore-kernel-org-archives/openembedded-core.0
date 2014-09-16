Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 014E4702AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:08:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G88ahY029762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:08:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:08:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:09:03 +0800
Message-ID: <6a598c186a0d023d66175a7b7f29c5e09f3a97a3.1410854885.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410854885.git.Qi.Chen@windriver.com>
References: <cover.1410854885.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] dhcp: use ${PN} for SYSTEMD_SERVICES
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
X-List-Received-Date: Tue, 16 Sep 2014 08:08:36 -0000
Content-Type: text/plain

We should use ${PN} instead of hardcoding 'dhcp' for SYSTEMD_SERVICES,
otherwise we would have 'installed-not-shipped' QA error if we are building
lib32-dhcp.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index a175254..4949e02 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -21,12 +21,12 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
 
 inherit autotools systemd
 
-SYSTEMD_PACKAGES = "dhcp-server dhcp-relay"
-SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
-SYSTEMD_AUTO_ENABLE_dhcp-server = "disable"
+SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
+SYSTEMD_SERVICE_${PN}-server = "dhcpd.service"
+SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 
-SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
-SYSTEMD_AUTO_ENABLE_dhcp-relay = "disable"
+SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
 
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
-- 
1.9.1


