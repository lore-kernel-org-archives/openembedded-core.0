Return-Path: <prvs=221486d377=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 506FE7FA37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:27:59 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA7MRVJI018066; Thu, 7 Nov 2019 16:27:59 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2w41w84sxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 07 Nov 2019 16:27:59 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xA7MRwGG030686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2019 16:27:58 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:27:58 -0600
Received: from harisdt.amer.corp.natinst.com (172.18.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Nov 2019 16:27:58 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2019 16:27:56 -0600
Message-ID: <20191107222756.2224119-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-07_07:2019-11-07,2019-11-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] dhcp: Workaround busybox limitation in Linux dhclient-script
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
X-List-Received-Date: Thu, 07 Nov 2019 22:27:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Busybox's implementation of chown and chmod doesn't provide a
"--reference" option used in the latest version of dhclient-script.
This change works around that limitation by using stat to read
ownership and permissions flags and simple chown/chmod calls
supported in both coreutils and busybox.

Patch submitted upstream to ISC, tracked as bug 48771.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 ...-limitation-in-linux-dhclient-script.patch | 64 +++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb  |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
new file mode 100644
index 0000000000..fa07c5ad5e
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
@@ -0,0 +1,64 @@
+From eec0503cfc36f63d777f5cb3f2719cecedcb8468 Mon Sep 17 00:00:00 2001
+From: Haris Okanovic <haris.okanovic@ni.com>
+Date: Mon, 7 Jan 2019 13:22:09 -0600
+Subject: [PATCH] Workaround busybox limitation in Linux dhclient-script
+
+Busybox is a lightweight implementation of coreutils commonly used on
+space-constrained embedded Linux distributions. It's implementation of
+chown and chmod doesn't provide a "--reference" option added to
+client/scripts/linux as of commit 9261cb14. This change works around
+that limitation by using stat to read ownership and permissions flags
+and simple chown/chmod calls supported in both coreutils and busybox.
+
+	modified:   client/scripts/linux
+
+Upstream-Status: Pending [ISC-Bugs #48771]
+---
+ client/scripts/linux | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 0c429697..2435a44b 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -32,6 +32,17 @@
+ # if your system holds ip tool in a non-standard location.
+ ip=/sbin/ip
+ 
++chown_chmod_by_reference() {
++    local reference_file="$1"
++    local target_file="$2"
++
++    local owner=$(stat -c "%u:%g" "$reference_file")
++    local perm=$(stat -c "%a" "$reference_file")
++
++    chown "$owner" "$target_file"
++    chmod "$perm" "$target_file"
++}
++
+ # update /etc/resolv.conf based on received values
+ # This updated version mostly follows Debian script by Andrew Pollock et al.
+ make_resolv_conf() {
+@@ -74,8 +85,7 @@ make_resolv_conf() {
+         fi
+ 
+ 	if [ -f /etc/resolv.conf ]; then
+-	    chown --reference=/etc/resolv.conf $new_resolv_conf
+-	    chmod --reference=/etc/resolv.conf $new_resolv_conf
++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
+ 	fi
+         mv -f $new_resolv_conf /etc/resolv.conf
+     # DHCPv6
+@@ -101,8 +111,7 @@ make_resolv_conf() {
+         fi
+ 
+ 	if [ -f /etc/resolv.conf ]; then
+-            chown --reference=/etc/resolv.conf $new_resolv_conf
+-            chmod --reference=/etc/resolv.conf $new_resolv_conf
++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
+ 	fi
+         mv -f $new_resolv_conf /etc/resolv.conf
+     fi
+-- 
+2.20.0
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index 275961a603..020777b8f2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0013-fixup_use_libbind.patch \
             file://0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch \
             file://0001-Fix-a-NSUPDATE-compiling-issue.patch \
+            file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
 "
 
 SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
-- 
2.24.0


