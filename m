Return-Path: <prvs=906996e92=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id AB47D7C092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547149807; x=1578685807;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=J4QEusJlviQyHo58I0ZE3LwJ9Y9NFrO+aSkMi1BxvEI=;
	b=XjuUXNRivdqKZuHq/8QyPNZD02gdQxAn5U3uItCQccWhFUhxceZlpQiy
	y2e3kxKJ3GZ5ShP32p3oMIKukCQgYmjUp5Ge6WKVptky8e96Q0EQvUF7r
	E3YBqzqn30ktfuqTV+PLgkmtyLHP/5CAV9u5Gzl0S8OaCNLP0+/j0xGPM
	tbVA+ffyKdlaCjF9qBziBtwFLEzeLEoSFfeTSb3Zi2cT6WEazAXn2upXE
	2PHBw4sFLy1bBOqK1H3MdcXzWIGnEtxrJiSiCkYwMdpfNfdqXz0T+krML
	R2yYzTniz0L1/+N+l9WCK6rWcJiwVSmMrvXVAz1uat3ZLFRcG9kth27R/ w==;
X-IronPort-AV: E=Sophos;i="5.56,462,1539619200"; d="scan'208";a="100265670"
Received: from mail-by2nam05lp2059.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.59])
	by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2019 03:50:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q04rxi/tx+p6xkvI27IVTbEbXWjBcvA506NWbv2HDoU=;
	b=bbWGFm2UXw1vSWamgHL8TeKGorF+zosQMLGOrcJi5NZKZuTRTTgch+nedGMXLXucSpXqUgEBUqGrwTEo4suG9gWS37lGg7JOQhPLmhTn3tGill0zihyzz28RcMuXn9KC8Cb+JzLJBzjQiBq+IUwGyQ/fFWYxc6jjYhT0kjWRjoQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0318.namprd04.prod.outlook.com (10.169.202.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.13; Thu, 10 Jan 2019 19:50:04 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016;
	Thu, 10 Jan 2019 19:50:04 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] gstreamer: Add RISC-V support
Thread-Index: AQHUqR2uT3dED64zo0eEsfj7yXQE0Q==
Date: Thu, 10 Jan 2019 19:50:04 +0000
Message-ID: <20190110194956.12327-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0082.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::23) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0318;
	6:v6O3psBPt2IRI7HmslnPk9XcpFDtwk22kDTkdo4R2UL/ny6nd3OPGXXWBiEMa2ZAe0m+xmq2ut4SSKZt4fcebYVmewW14FLzxVPKPK1sdtqTIdyx8J3dM+TQ2loE3NC2wrHwdw+F7wck+VJNt7XgYcv3t+UsPvVTvkcMGO7k9+sAnFIUS1h5zL4Qlc2MUhEat+96l3Ck4GyxOrtkxsVToMcle1pdkVr2ADuKDCH5rhxYCjFvBgW9sClmpUNIuTQGLbk80Bo1/FBwuIYXZg6562q7IiWGl2pKpC0MKNOphYVkk8uJjMuikji2swUCbNi85kP+qwl8TiQUKJsPvLDjNo72zv4GEGZ5xNz/KAjWOMXNNFGmsx/QtSc8Nm4bbN5gIZx1CMDE9bP10ewLrweLHfYFuuOYcfhuX2NpW2va+Dkl/kSKndjogLwM3I+3pUh+ZE7VkOGqQHMTMWhzySggLw==;
	5:zVsfbUaH6tKKJWig7NixVqNZiHbFzMJFfhswys6WkwXngCrLkaczuFXC2ghozefg2HSp663X50IwsDuB3WawUIU1HUhdz4iHfU+Me2Bzg8/7td6aJ11vt+gp/g1WdXC9751Ol97jYrzsXaW8d4G0h2JpZTjWLp17T2044EZHIKu0RsPwAPGs+nioEGnKEEOwyAngUEmOIaoOewk98RHcMg==;
	7:n+6xjxYVCdfuecP4YaRJFN2L8/ZZTU9qVrhi79VJUN2jeNZnVGcRpBQtY3y569lQvIay6pnlR6Wpa/0+4oVsC9a/Qb5JKt6Ri6E5M8XHfrZKA1OxXK6/7R0zQsOWwUeGmTWDrFb1Sloodr2Bw2gW1A==
x-ms-office365-filtering-correlation-id: efa414f5-3158-41fc-5f7c-08d67734d056
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0318; 
x-ms-traffictypediagnostic: MWHPR04MB0318:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB03184350CEA09D0CCE7C18F490840@MWHPR04MB0318.namprd04.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(396003)(346002)(39860400002)(189003)(199004)(72206003)(966005)(14454004)(36756003)(478600001)(68736007)(1076003)(66066001)(71190400001)(71200400001)(97736004)(14444005)(256004)(86362001)(316002)(305945005)(99286004)(44832011)(486006)(54906003)(4326008)(25786009)(6486002)(2351001)(39060400002)(105586002)(106356001)(2501003)(6512007)(6436002)(6306002)(5640700003)(53936002)(6916009)(5660300001)(2906002)(3846002)(6116002)(6346003)(81166006)(81156014)(386003)(8936002)(102836004)(6506007)(2616005)(50226002)(26005)(476003)(8676002)(186003)(52116002)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0318;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j9qUt2ilq1DjRxAIh5QJJ49cUgjpKQxtcx165IFPaX6zn830Zy0HfMzFYqgan2omQorwQ8b7R/Gwg9EGQIQ1KWCXtVkpWjzL6MgG3tgVvIghO1oDtZn3EJZs4WiifMjJE7QjiIFbyyeLjSgSIXTF058qT/6Yb3ai41+V8r8q3dhQUe/BP4YDDD8eL+Sw4lRoaBcU8E8Y+PtxFUEjHm2YxcI0dBZb0d0bnlffy0bRwnOVsnYmGVesR/AadV4C6oqH/NTkS7ZeMSoWljtfpkLzrFhhw6FtvJzHCEcZnDicAWFSoVasDelC3GmIGTfdWFMvsYej2QbYzNmKAoBtiSByTjjareif6LMMSUBH33tEtIhMlIiGO+uHUy2FBFbyy42YfgMYMAIMlWSflRB+1NOEiW8aHY5L2SY+/YtcNA616lTC/3tBDOZVZj4EIvf6Oiw9Y1bXiWi+SVncsnN4GqKyjg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa414f5-3158-41fc-5f7c-08d67734d056
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 19:50:04.0893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0318
Subject: [PATCH v2] gstreamer: Add RISC-V support
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
X-List-Received-Date: Thu, 10 Jan 2019 19:50:05 -0000
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
index 232234b888..c948244f63 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch=
 \
     file://add-a-target-to-compile-tests.patch \
+    file://0002-gstconfig.h.in-initial-RISC-V-support.patch
     file://run-ptest \
 "
 SRC_URI[md5sum] =3D "f67fbbc42bd85a0701df119f52fb52bd"
--=20
2.19.1


