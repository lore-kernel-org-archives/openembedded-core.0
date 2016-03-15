Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9AD762133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 06:39:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2F6dWZv005004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 23:39:33 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Mar 2016 23:39:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2016 14:39:40 +0800
Message-ID: <ae0dda639a0a11a00bd89916a74cdd98113e43c9.1458023911.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458023911.git.Qi.Chen@windriver.com>
References: <cover.1458023911.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] dhcp: enable gentle shutdown
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
X-List-Received-Date: Tue, 15 Mar 2016 06:39:33 -0000
Content-Type: text/plain

For now, `systemctl stop dhcpd' cannot stop dhcpd correctly, the SIGTERM
signal would time out, causing a SIGKILL signal sent to dhcpd.

Patch site.h to enable gentle shutdown to so that dhcpd could be stopped
by SIGTERM.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../dhcp/0001-site.h-enable-gentle-shutdown.patch  | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
new file mode 100644
index 0000000..4344212
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Inappropriate [configuration]
+
+Subject: [PATCH] site.h: enable gentle shutdown
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ includes/site.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/includes/site.h b/includes/site.h
+index 73fa4e8..9c33de3 100644
+--- a/includes/site.h
++++ b/includes/site.h
+@@ -280,7 +280,7 @@
+    situations.  We plan to revisit this feature and may
+    make non-backwards compatible changes including the
+    removal of this define.  Use at your own risk.  */
+-/* #define ENABLE_GENTLE_SHUTDOWN */
++#define ENABLE_GENTLE_SHUTDOWN
+ 
+ /* Include old error codes.  This is provided in case you
+    are building an external program similar to omshell for
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
index ee1e082..970617f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
             file://CVE-2015-8605.patch \
+            file://0001-site.h-enable-gentle-shutdown.patch \
            "
 
 SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
-- 
1.9.1


