Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFEA65D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 06:01:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T614S4018150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:01:04 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 23:01:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 14:01:07 +0800
Message-ID: <1414562467-18994-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] iproute2: backport a patch to make adding vxlan link success
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
X-List-Received-Date: Wed, 29 Oct 2014 06:01:07 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

If without this patch:
    $ ip link add vxlan0 type vxlan id 51 group 238.1.1.1 dev eth0
    Error: argument "vxlan0" is wrong: Unknown device
    $

With this patch;
    $ ip link add vxlan0 type vxlan id 51 group 238.1.1.1 dev eth0
    $ ifconfig -a |grep vxlan0
    vxlan0    Link encap:Ethernet  HWaddr da:61:56:2e:c2:20
    $

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...p-link-Remove-unnecessary-device-checking.patch |   35 ++++++++++++++++++++
 .../iproute2/iproute2_3.16.0.bb                    |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
new file mode 100644
index 0000000..0305a70
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-unnecessary-device-checking.patch
@@ -0,0 +1,35 @@
+From 38790ccf7bd0e6eab78024ec381fd98d7c6a2782 Mon Sep 17 00:00:00 2001
+From: vadimk <vadim4j@gmail.com>
+Date: Sat, 30 Aug 2014 15:06:00 +0300
+Subject: [PATCH] ip link: Remove unnecessary device checking
+
+The real checking is performed later in iplink_modify(..) func which
+checks device existence if NLM_F_CREATE flag is set.
+
+Also it fixes the case when impossible to add veth link which was
+caused by 9a02651a87 (ip: check for missing dev arg when doing VF rate)
+because these devices are not exist yet.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ ip/iplink.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/ip/iplink.c b/ip/iplink.c
+index 1a907d9..ea06871 100644
+--- a/ip/iplink.c
++++ b/ip/iplink.c
+@@ -593,8 +593,6 @@ int iplink_parse(int argc, char **argv, struct iplink_req *req,
+ 				duparg2("dev", *argv);
+ 			*dev = *argv;
+ 			dev_index = ll_name_to_index(*dev);
+-			if (dev_index == 0)
+-				invarg("Unknown device", *argv);
+ 		}
+ 		argc--; argv++;
+ 	}
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
index b1a68f2..39fe9c8 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
@@ -3,6 +3,7 @@ require iproute2.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
+           file://0001-ip-link-Remove-unnecessary-device-checking.patch \
           "
 SRC_URI[md5sum] = "6c823b40fdcfa7b8120743349a52ac18"
 SRC_URI[sha256sum] = "1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79"
-- 
1.7.10.4


