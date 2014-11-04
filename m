Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC246017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 06:30:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Nov 2014 22:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,312,1413270000"; d="scan'208";a="601769013"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2014 22:30:43 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.25]) with mapi id
	14.03.0195.001; Tue, 4 Nov 2014 06:30:43 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Li, Rongqing (Wind River)" <rongqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] iproute2: backport a patch to make adding
	vxlan	link success
Thread-Index: AQHP8z4AdndobrgrTkWBh5LzR4M7bJxQClAA
Date: Tue, 4 Nov 2014 06:30:42 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F3868F6@IRSMSX105.ger.corp.intel.com>
References: <1414562467-18994-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1414562467-18994-1-git-send-email-rongqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] iproute2: backport a patch to make adding vxlan	link success
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
X-List-Received-Date: Tue, 04 Nov 2014 06:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
1. Patch has not been marked with Upstream-status indication.
2. An upgrade to iproute2 3.17 is due in a short amount of time.

If this is a burning issue, should be taken for inclusion; otherwise hold i=
t to be included with the incoming upgrade.

Regards,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of rongqing.li@windriver.co=
m
Sent: Wednesday, October 29, 2014 8:01 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] iproute2: backport a patch to make adding vxlan =
link success

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
 ...p-link-Remove-unnecessary-device-checking.patch |   35 ++++++++++++++++=
++++
 .../iproute2/iproute2_3.16.0.bb                    |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-lin=
k-Remove-unnecessary-device-checking.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remov=
e-unnecessary-device-checking.patch b/meta/recipes-connectivity/iproute2/ip=
route2/0001-ip-link-Remove-unnecessary-device-checking.patch
new file mode 100644
index 0000000..0305a70
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-link-Remove-un
+++ necessary-device-checking.patch
@@ -0,0 +1,35 @@
+From 38790ccf7bd0e6eab78024ec381fd98d7c6a2782 Mon Sep 17 00:00:00 2001
+From: vadimk <vadim4j@gmail.com>
+Date: Sat, 30 Aug 2014 15:06:00 +0300
+Subject: [PATCH] ip link: Remove unnecessary device checking
+
+The real checking is performed later in iplink_modify(..) func which=20
+checks device existence if NLM_F_CREATE flag is set.
+
+Also it fixes the case when impossible to add veth link which was=20
+caused by 9a02651a87 (ip: check for missing dev arg when doing VF rate)=20
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
+@@ -593,8 +593,6 @@ int iplink_parse(int argc, char **argv, struct iplink_=
req *req,
+ 				duparg2("dev", *argv);
+ 			*dev =3D *argv;
+ 			dev_index =3D ll_name_to_index(*dev);
+-			if (dev_index =3D=3D 0)
+-				invarg("Unknown device", *argv);
+ 		}
+ 		argc--; argv++;
+ 	}
+--
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb b/meta/r=
ecipes-connectivity/iproute2/iproute2_3.16.0.bb
index b1a68f2..39fe9c8 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.16.0.bb
@@ -3,6 +3,7 @@ require iproute2.inc
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
+           file://0001-ip-link-Remove-unnecessary-device-checking.patch=20
+ \
           "
 SRC_URI[md5sum] =3D "6c823b40fdcfa7b8120743349a52ac18"
 SRC_URI[sha256sum] =3D "1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb=
8c51846a127b79"
--
1.7.10.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

