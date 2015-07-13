Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35BF0741CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 05:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D5VVTj024632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jul 2015 22:31:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 12 Jul 2015 22:31:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 13:25:41 +0800
Message-ID: <1436765141-20967-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] netbase: add rpcbind as an alias to sunrpc
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
X-List-Received-Date: Mon, 13 Jul 2015 05:31:35 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

rpcbind starts successfully, but shows the following errors in dmesg:

  Jul 24 20:34:42 quake rpcbind: cannot get local address for udp: \
    Servname not supported for ai_socktype
  Jul 24 20:34:42 quake rpcbind: cannot get local address for tcp: \
    Servname not supported for ai_socktype

Just add rpcbind as an alias to sunrpc, the patch comes from:
  https://bugs.archlinux.org/task/20273

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch | 51 ++++++++++++++++++++++
 meta/recipes-core/netbase/netbase_5.3.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch

diff --git a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
new file mode 100644
index 0000000..c70d142
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
@@ -0,0 +1,51 @@
+netbase: add rpcbind as an alias to sunrpc
+
+rpcbind starts successfully, but shows the following errors in dmesg:
+
+  Jul 24 20:34:42 quake rpcbind: cannot get local address for udp: \
+    Servname not supported for ai_socktype
+  Jul 24 20:34:42 quake rpcbind: cannot get local address for tcp: \
+    Servname not supported for ai_socktype
+
+Just add rpcbind as an alias to sunrpc, the patch comes from:
+  https://bugs.archlinux.org/task/20273
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ etc-rpc      |    2 +-
+ etc-services |    4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/etc-rpc b/etc-rpc
+index 1b30625..9a9a81a 100644
+--- a/etc-rpc
++++ b/etc-rpc
+@@ -1,7 +1,7 @@
+ # This file contains user readable names that can be used in place of rpc
+ # program numbers.
+ 
+-portmapper	100000	portmap sunrpc
++portmapper	100000	portmap sunrpc rpcbind
+ rstatd		100001	rstat rstat_svc rup perfmeter
+ rusersd		100002	rusers
+ nfs		100003	nfsprog
+diff --git a/etc-services b/etc-services
+index 9d64a52..a19f7c8 100644
+--- a/etc-services
++++ b/etc-services
+@@ -72,8 +72,8 @@ pop2		109/tcp		postoffice pop-2 # POP version 2
+ pop2		109/udp		pop-2
+ pop3		110/tcp		pop-3		# POP version 3
+ pop3		110/udp		pop-3
+-sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper
+-sunrpc		111/udp		portmapper
++sunrpc		111/tcp		portmapper rpcbind	# RPC 4.0 portmapper
++sunrpc		111/udp		portmapper rpcbind
+ auth		113/tcp		authentication tap ident
+ sftp		115/tcp
+ uucp-path	117/tcp
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/netbase/netbase_5.3.bb b/meta/recipes-core/netbase/netbase_5.3.bb
index 4ac0221..ccd89ff 100644
--- a/meta/recipes-core/netbase/netbase_5.3.bb
+++ b/meta/recipes-core/netbase/netbase_5.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.xz \
+           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch \
            file://hosts"
 
 SRC_URI[md5sum] = "2637a27fd3de02a278d2b5be7e6558c1"
-- 
1.9.1


