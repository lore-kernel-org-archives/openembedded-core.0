Return-Path: <prvs=906996e92=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3A87B7C08D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547150457; x=1578686457;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=DgXoSLAJIhIEM/6PBrJikBQDf7KtMNTmHIIm6q6kx/0=;
	b=KdhpaQG+q8u5EDQGUCIrNt2Tmgf3Ar/OTU3PHOtjD96+tB4By/qTLUYS
	GciJzqam/WoVmjBtGyrUJvv/k0MZwfwVjAGCh/hET0iDg00ah+B8+WQFP
	2D66lZiHkuVQ2mkxUhOAfqgnzoTpewcW4z9/oIGzwaxRFB4Ba/GoqfBme
	f43oI+0hFux6M2BtFcnhixA6X7FNYHx8FR8boBxp8Ay2ausr6GipFSUvi
	lRoRosHONUQUaJ0HS6AX3oR/XYMEA+QkPBw6KS5Aif8yIDrV+KqKQM2wy
	2tb9eubwibo09f13aY5tb3rj3ZvpECkheJTronGUKdjHBEEUnIlxp5/p+ w==;
X-IronPort-AV: E=Sophos;i="5.56,462,1539619200"; d="scan'208";a="99711437"
Received: from mail-by2nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.51])
	by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2019 04:00:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Le85EnBC+VIhVhRFMF6s2hVKYeEY4n2Lq4cimxbMnI8=;
	b=S9Zc6RW7bcZBTgN2OkWlVX6AwhElHCFVVXhNAG3ZnYxG1ht8avzbXXyaKmht0b1MxNcTLGxys+B3AJm7by4y7/k9MJYs/aMkbWERT3DS48dfqkBZtI8+C2cSmJhsbrnPX4M5yC4Pdsj0LlbsvWGRW8KzFP313SaAFQImHMNdgXs=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0191.namprd04.prod.outlook.com (10.169.201.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.13; Thu, 10 Jan 2019 20:00:53 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016;
	Thu, 10 Jan 2019 20:00:53 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] gstreamer: Add RISC-V support
Thread-Index: AQHUqR8xrFxbCIHdakaywCnK3MSWng==
Date: Thu, 10 Jan 2019 20:00:53 +0000
Message-ID: <20190110200045.14152-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0058.namprd05.prod.outlook.com
	(2603:10b6:a03:74::35) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0191;
	6:oz/kL88qwrZV0Dh2h370c5fz2RttWm7S/50YASBAgDji1XOKBZlbVm4Uef5xx68gtPRMNuWlIU26R1hOfkYjmZWy3mAh3JFfGhqMGmOVvzZePHBMOwaem0fjPOqZTnO9tSfQe4Xs5PxCvuFKv3TiyAHXiwoarucDc3XX8cvLD24UImsykNyNdJW+UNYyDn4jVvIGU2lOru9EjrIr7SQ6oPWq/ALOcg55og/n4P7c82NUmrN++qnuXxkzfLKXTFW6Oy2WFqw8e62/ClULbRq87KEOYjiHw1bQH53Ms5RZV/8ELeMDmYGw99GU2Rlw2ZDzr/HXTbp2o0oLg7R5dAYYUWqFn421pPHizmZ+Gv6cCZX8ELZA+lj/VtULgP7wSf9C/0mVtR/o/QZGY0SlYdtP/w6gUdAXCtqG33VbFk9jVEQ2bgU2dmnFEv50vIvl/2Ys/OAZEKU27sQKqctGdxmX1Q==;
	5:tIIOMXVjcCC5ZQNKzle7SsD+Q6g4pK212J98XLhJ+ChplPprXjlZbPICsjFCFIEST3koUqoRgfZV5EWBhKUoYAlZ3t7W8hME3V2rUr3m6JDM3itONFpCIlD/MXgi5MB0tSyatZIjoQ2P/xsuYntD+2P7YRXAZ6sStvn76laex+VU3GKks6w+TUCRQiS6MxIoxCTx2F3VG/REN9oYqbAWaA==;
	7:VtlGSdbBPsFcswTtw2RSn71JTMISDA2+fowI84Fftus1uO/35pKanSYyh7NV+64kCQheW7y/Yzr8/UBaGLgrXQwuNxEexFQVw5saoWsZ632zYLUAf69EpwtcG5CzbS/W2ZuFQqAZnYR4mVILCL9heg==
x-ms-office365-filtering-correlation-id: d6e91cb9-3f16-4945-2b97-08d6773653b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0191; 
x-ms-traffictypediagnostic: MWHPR04MB0191:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB019193EE49D24B3AEC7949E390840@MWHPR04MB0191.namprd04.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(6916009)(5660300001)(54906003)(44832011)(486006)(3846002)(6116002)(39060400002)(97736004)(5640700003)(2351001)(386003)(53936002)(68736007)(52116002)(99286004)(316002)(36756003)(6306002)(72206003)(6436002)(6512007)(105586002)(2906002)(6486002)(4326008)(81166006)(6506007)(71190400001)(71200400001)(305945005)(81156014)(50226002)(14454004)(186003)(966005)(478600001)(2501003)(476003)(26005)(2616005)(102836004)(25786009)(86362001)(7736002)(8676002)(106356001)(1076003)(66066001)(8936002)(14444005)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0191;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rgcGjHOOh1SauANe2p4VWd2x/WIUhmqKnxHP1V8P9vyM2Bt+5eD72xvb5P3IYMW2mMaZNymQgUN7t7Mhh5HrH3D93KAslSD5ns4JIqJOvkzPw1fNkJ9OnxNSgjtS4r2mIc6y/hQEcADlSMBSmyKbeBjq/ftAXvsIukK10gXemdTUeSmmf9AWenjbkQw7jEKkelh9WyV9coJ3zHTD1bYWLbHk502u00QZoSSVYiP8JV53/K8kMFDadfE8quRjVqzYIplD+p1M14Uu2RJCnPwiQKSt9TN/qv49/7HY/lhD4PyWO0ZHoJ1OtNXgsoSNRY5X
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e91cb9-3f16-4945-2b97-08d6773653b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 20:00:53.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0191
Subject: [PATCH v3] gstreamer: Add RISC-V support
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
X-List-Received-Date: Thu, 10 Jan 2019 20:00:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Backport RISC-V support from master Gstreamer.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...stconfig.h.in-initial-RISC-V-support.patch | 28 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.14.4.bb          |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0002-gstconfig.=
h.in-initial-RISC-V-support.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-in=
itial-RISC-V-support.patch b/meta/recipes-multimedia/gstreamer/files/0002-g=
stconfig.h.in-initial-RISC-V-support.patch
new file mode 100644
index 0000000000..8d8f8dca00
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-R=
ISC-V-support.patch
@@ -0,0 +1,28 @@
+From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sun, 15 Apr 2018 00:49:55 +0200
+Subject: [PATCH] gstconfig.h.in: initial RISC-V support
+
+RISC-V supports unaligned accesses, but these might run extremely slowly
+depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
+to 0 on this architecture.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=3D795271
+Upstream-Status: Accepted [1.15.1 - https://bugzilla.gnome.org/show_bug.cg=
i?id=3D795271]
+---
+ gst/gstconfig.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
+index 6351c04da..33dfed1f6 100644
+--- a/gst/gstconfig.h.in
++++ b/gst/gstconfig.h.in
+@@ -104,7 +104,7 @@
+  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
+  * https://software.intel.com/en-us/node/583402
+  */
+-#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__)
++#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
+ #  define GST_HAVE_UNALIGNED_ACCESS 0
+ #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defin=
ed(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__=
) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) ||=
 defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390=
__) || defined(__s390x__) || defined(__zarch__)
+ #  define GST_HAVE_UNALIGNED_ACCESS 1
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
index 232234b888..98c9a28e39 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch=
 \
     file://add-a-target-to-compile-tests.patch \
+    file://0002-gstconfig.h.in-initial-RISC-V-support.patch \
     file://run-ptest \
 "
 SRC_URI[md5sum] =3D "f67fbbc42bd85a0701df119f52fb52bd"
--=20
2.19.1


