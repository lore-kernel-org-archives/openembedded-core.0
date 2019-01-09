Return-Path: <prvs=9057d3638=Alistair.Francis@wdc.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Jan 2019 00:18:43 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8DECF7BFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 00:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546993125; x=1578529125;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=IsfdDHqmvDa7eoBOJ3wtFw9tw6S6VO3sVRl0nsOVqqg=;
	b=eUvAW/FfGNm3rEz6ucB0pS+4mDPMbsp77ZVIjZgwTf9EIpopN593z7QZ
	GpcbQX9+Bnw+bKRUTGtUyslz5sBs+xZnxVplVJ4LeqeSnOS/BbCCtmREi
	04+jECOewM7EfttEjPJPYcxo4EAzGh3Z/+mzAoD7BAn5IsRi0jDjNOa06
	9hX46osBU5+la9kMNXxMfw/jhEsqwWB85MLs7VQLUshK7oReqU/RM3Ac8
	+a7dbwkyD8QH9qvYzoajWUYNpv0eYINqEi5flxg8bHu9L7ssyNtCu97Xh
	uLeok3LGsuXlRzVzEK4Is22xOhSO9MkBq3R5RZki9stupWhKJU9xQCagF g==;
X-IronPort-AV: E=Sophos;i="5.56,455,1539619200"; d="scan'208";a="100059065"
Received: from mail-sn1nam01lp2057.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.57])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jan 2019 08:09:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UUHMbJbbXcKRIjrIOrgYN0Urm3TCeb9O2ayCcqCv6+Q=;
	b=U97utlVCBhRz9bItkw4N8uMYXbpH6zjlaVgFYEVYy5cnQUnc1zx+yfmRUJBgH/I1cHOrJ/EyUf0wV9jSPFzrkwnRmuks0Vrf2Hg++3/SVCITo0UWRX+PMebve2XKT8vODLdtxH+0WVCgmIJ95BiXETGHwfsdO/ek373ZV9MNb9w=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1070.namprd04.prod.outlook.com (10.174.250.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Wed, 9 Jan 2019 00:09:15 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.011;
	Wed, 9 Jan 2019 00:09:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] gstreamer: Add RISC-V support
Thread-Index: AQHUp6+Oh7RAf+oqS0KoFdJFKWfTxQ==
Date: Wed, 9 Jan 2019 00:09:15 +0000
Message-ID: <20190109000907.7647-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0103.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::44) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1070;
	6:Em+he/S4XEB+mZEr7gQhEONNG7fvbpJXjpC2gOlAabxOicnMjLTbdEqz8RJsDqstTY1u23jH86OynOFVkVja74HZZiPCmSFZNivS1B7ZUrI7prH0/4sRCapCuGXGfC9T4FnoihodJqU5TjnXRjYr0BXr17So/57KISZ7uz4L9BSDOju6Xqig5tNdmXMT99a+wdmWGhvvdWOHWC9PFAkTkxCzZ7jQFl4IcIVH5a56pxgdvpP/lJyU8EBJZ2rs/rC6UEtrIdTkUrRDAkk12QnMn/U0uof/t1QzwtgrGv9Dgfq0rS8Ywl4oR8c9J+GOhgTaOJAA3crpwEWAoK9hKg4bgAlvr+qSF2v0pWDGt58OFGXsVXdE+k6RKLep0YO+Yr6Bdpa351ohLePUWOXbjfkHAgyuFYdxQHW9ZFUrBWWNxHe3GEqwmZBFvrigHjdUr6EFqe8SV6uertRJA8koLuq5vQ==;
	5:BQyh9WMgLbeEU6CNSVhxTcfPMvpb5Yxn2Snag1d0jXImMcAMOhewcYvTJArU1rPLfiUF1BxYiMExtBBFSRYDcZFO/MSzEfcIhejsAYWN489R483BS6BPoiu7LiYHP/nKH3BX/dTliqtb8yeHaMNUlaQ4HFHu4vqFdlosc+lUWcQDRIroNclPGq5QKgg2x8TQyeY7t+ao26Aqvv00GkNfwg==;
	7:/gAjhVMUpKe4+oSI+j+WK5kbGZTzWM5frylO4+BMOQ9prH6qRZpcb5tl46miDuj0qoYTw+tlTH4qU2xg82cqHOT4pOQijElupBv2wCEEYBAh4xLZMKND8fZsonvdVxE5lU+OuO8uMu3a0fV3ZGisoA==
x-ms-office365-filtering-correlation-id: 275a9f9a-5f58-46a3-49ac-08d675c6b0fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1070; 
x-ms-traffictypediagnostic: MWHPR04MB1070:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1070C3EF6CFB197D913921F6908B0@MWHPR04MB1070.namprd04.prod.outlook.com>
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(39860400002)(346002)(396003)(366004)(199004)(189003)(6116002)(3846002)(575784001)(86362001)(44832011)(26005)(486006)(305945005)(186003)(7736002)(36756003)(6506007)(25786009)(66066001)(102836004)(386003)(316002)(97736004)(68736007)(8676002)(256004)(52116002)(71200400001)(14444005)(2501003)(50226002)(71190400001)(99286004)(2616005)(476003)(54906003)(81156014)(8936002)(81166006)(478600001)(72206003)(53936002)(105586002)(106356001)(966005)(14454004)(4326008)(2351001)(39060400002)(1076003)(5660300001)(2906002)(5640700003)(6436002)(6512007)(6306002)(6916009)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1070;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gkv6ndKYmbizd4yy1sVRJbavPLdmhAm9OoUwsO5B69MC2aKK8LnZ33DLlbAZhPxlfYh7E7w5+ZK9Yisgj2F3bCC7fuLyf0VZBgvQqKQff1Qys2Sw1AP3mbTPbiDBKZ/i57Hq2y4htAxqiKFOZ0UiYbZzxsFau/i62UzOuOYJ0unewlbCKvOAOuAIN92O7dtvNc/omBgPVaDKqnfjvzDQokRKr34ijWFW6rbKMHJavxq+vw4+B0mlMPTG2xkCz19UEv63vwmxJfQdESKJbGMLAJrVVXPrI3sOs1+JSnmgsa7SZD/PtGX2dnBgVCx0OxzV
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a9f9a-5f58-46a3-49ac-08d675c6b0fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 00:09:15.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1070
Subject: [PATCH] gstreamer: Add RISC-V support
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
X-List-Received-Date: Wed, 09 Jan 2019 00:18:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Backport RISC-V support from master Gstreamer.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...stconfig.h.in-initial-RISC-V-support.patch | 28 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.14.4.bb          |  3 ++
 2 files changed, 31 insertions(+)
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
index 232234b888..c3bac1f658 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
@@ -30,6 +30,9 @@ SRC_URI =3D " \
 SRC_URI[md5sum] =3D "f67fbbc42bd85a0701df119f52fb52bd"
 SRC_URI[sha256sum] =3D "f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e=
7920afa985ffc7"
=20
+SRC_URI_append_riscv64 =3D " file://0002-gstconfig.h.in-initial-RISC-V-sup=
port.patch"
+SRC_URI_append_riscv32 =3D " file://0002-gstconfig.h.in-initial-RISC-V-sup=
port.patch"
+
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    "
=20
--=20
2.19.1


