Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 328B27CBE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:47:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U5kcB1000859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 22:46:48 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 29 Aug 2019 22:46:28 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 30 Aug 2019 01:46:09 -0400
Message-ID: <20190830054609.165333-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190830054609.165333-1-kai.kang@windriver.com>
References: <20190830054609.165333-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] avahi: launch avahi-daemon after connman
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
X-List-Received-Date: Fri, 30 Aug 2019 05:47:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When connman installed to image, /etc/resolv.conf is link to
/etc/resolv-conf.connman. So launch avahi-daemon after connman too
just same as after systemd-resolved.service.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/0001-Fix-opening-etc-resolv.conf-error.patch     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch
index 11e7e8a9bc..cb8b83fd23 100644
--- a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch
+++ b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch
@@ -19,6 +19,11 @@ is marked as OE specific.
 Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+When connman installed to image, /etc/resolv.conf is link to
+/etc/resolv-conf.connman. So launch avahi-daemon after connman too.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  avahi-daemon/avahi-daemon.service.in | 1 +
  1 file changed, 1 insertion(+)
@@ -31,7 +36,7 @@ index 548c834..63e28e4 100644
  [Unit]
  Description=Avahi mDNS/DNS-SD Stack
  Requires=avahi-daemon.socket
-+After=systemd-resolved.service
++After=systemd-resolved.service connman.service
  
  [Service]
  Type=dbus
-- 
2.20.0


