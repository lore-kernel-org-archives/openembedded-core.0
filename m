Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A55F765C86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 00:33:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O0XMiu003658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 17:33:22 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 17:33:21 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 08:33:27 +0800
Message-ID: <1414110807-2167-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] BusyBox: Fixing broadcast address is not fed and rightly initialized
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
X-List-Received-Date: Fri, 24 Oct 2014 00:33:24 -0000
Content-Type: text/plain

From: "yadi.hu@windriver.com" <yadi.hu@windriver.com>

When using udhcpc along with ip command(/sbin/ip), broadcast address is not
assigned. Broadcast address is successfully assigned when using udhcpc without
ip command existence.

with ip command:
    $ifconfig eth0|grep Bcast
          inet addr:128.224.162.141  Bcast:0.0.0.0  Mask:255.255.254.0
    $
without ip command:
    $ifconfig eth0|grep Bcast
          inet addr:128.224.162.141  Bcast:128.224.163.255  Mask:255.255.254.0
    $

/etc/udhcp.d/50default[simple.script] is called to set ip address by dhcp
client, In case of ifconfig, it doesn't care of it's existence because it
will automatically calculate broadcast address then assign it if there is
no broadcast option. However in case of ip command, it requires broadcast
address statically.

Signed-off-by: Hu <yadi.hu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/busybox/files/simple.script |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 78ac424..90002b1 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -5,7 +5,6 @@
 [ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
 
 RESOLV_CONF="/etc/resolv.conf"
-[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
 
 # return 0 if root is mounted on a network filesystem
@@ -17,8 +16,11 @@ root_is_nfs() {
 have_bin_ip=0
 if [ -x /sbin/ip ]; then
   have_bin_ip=1
+  BROADCAST="broadcast +"
 fi
 
+[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
+
 case "$1" in
 	deconfig)
 		if [ -x /sbin/resolvconf ]; then
-- 
1.7.10.4


