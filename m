Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3424771993
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:37:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v196bfg2028765
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2017 22:37:41 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 8 Feb 2017 22:37:40 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 14:37:03 +0800
Message-ID: <1486622223-32848-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] dhcp: Add choice for "with ddns" and "no ddns".
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
X-List-Received-Date: Thu, 09 Feb 2017 06:37:42 -0000
Content-Type: text/plain

Disable DNS update functionality can solve this issue:
dhcpd is listening on additional random ports.
To meet different requests, add a choice in dhcp's bb file:
"with ddns" version should add "ddns" to PACKAGECONFIG, and it is the
default;
"no ddns" version should set PACKAGECONFIG to be without "ddns".

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...001-DDNS-disable-DNS-update-functionality.patch | 28 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       | 13 +++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-DDNS-disable-DNS-update-functionality.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-DDNS-disable-DNS-update-functionality.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-DDNS-disable-DNS-update-functionality.patch
new file mode 100644
index 0000000..881ca23
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-DDNS-disable-DNS-update-functionality.patch
@@ -0,0 +1,28 @@
+From 1d804738080d52c0977947c7271d2db49bd6f90d Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 8 Feb 2017 10:02:59 +0800
+Subject: [PATCH] DDNS: disable DNS update functionality
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ includes/site.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/includes/site.h b/includes/site.h
+index abb66e4..cefc12e 100644
+--- a/includes/site.h
++++ b/includes/site.h
+@@ -121,7 +121,7 @@
+ 
+ /* Define this if you want DNS update functionality to be available. */
+ 
+-#define NSUPDATE
++/* #define NSUPDATE */
+ 
+ /* Define this if you want to enable the DHCP server attempting to
+    find a nameserver to use for DDNS updates. */
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
index 678c29a..764ae09 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
@@ -1,5 +1,14 @@
 require dhcp.inc
 
+# If don't want DNS update functionality to be available becauses dhcpd will
+# be listening on additional random ports, please set PACKAGECONFIG to be
+# without ddns.
+PACKAGECONFIG ?= "ddns"
+PACKAGECONFIG[ddns] = ",,,"
+PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
+
+SITE_H_PATCH = "${@bb.utils.contains('PACKAGECONFIG', 'ddns', '', 'file://0001-DDNS-disable-DNS-update-functionality.patch', d)}"
+
 SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://link-with-lcrypto.patch \
             file://fixsepbuild.patch \
@@ -9,10 +18,8 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://libxml2-configure-argument.patch \
             file://tweak-to-support-external-bind.patch \
             file://remove-dhclient-script-bash-dependency.patch \
+            ${SITE_H_PATCH} \
            "
 
 SRC_URI[md5sum] = "2b5e5b2fa31c2e27e487039d86f83d3f"
 SRC_URI[sha256sum] = "eb95936bf15d2393c55dd505bc527d1d4408289cec5a9fa8abb99f7577e7f954"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
1.9.1


