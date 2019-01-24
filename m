Return-Path: <prvs=920fe819b=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 158147C2CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548367715; x=1579903715;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=c5CrZfZDg/Lo+OEI7NjzbxmgacW/ch9xnDJiE5S3A6Q=;
	b=oUy7imIeKw1lKqqEHr+JwdYrPzpJQQkF7vNyy1BqQ+uBRialDNlRDNYh
	iFQHmNgUXYrt3spC7qn13wDzGnvMRcSf1L3fXwvfKhUK25S4xp/SEZKUh
	xeFfAjdMxPUjgsmFE1hLi9TSjrdrYNnJYf6pUs7dj6+T3L0ZGWEt5GsOt
	JtDfb8C6hdbmxqCd5NjaFyGTrR6Gme0sxNQRzZJj37dQXSySPseJtF/SY
	CN9R+CkJ5PHtL8pGSt4B6OjIJOokwuv5nerY+Hq6OEQnb4L1m6jD89KNA
	SUs5E+jJ3RouOVo57tzffcemGLD/fFcXOoyoj8iEGO9rj4MAF8hxbdir1 A==;
X-IronPort-AV: E=Sophos;i="5.56,518,1539619200"; d="scan'208";a="99729997"
Received: from mail-dm3nam03lp2051.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.51])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jan 2019 06:08:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XZUEpaBlsRDkfJ2ujFeujNDBm7n+r8kFys1WD+X7rAU=;
	b=FZQesTI4Nnmh8CAiEblzgx4wYgXZxBW5MuztsqrY4EgN3r5B5WGCNEbdidYMjT4jHDwz7LuFSe/IXJLQSCtRmazSjqF791jwJ0jNXR6poQaZphdXUN7T82L8/LU/gZamXBjlPATzExgMBddWpU+GzE+MKL2GsCx7DwpfS5MmbFQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0238.namprd04.prod.outlook.com (10.169.202.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Thu, 24 Jan 2019 22:08:24 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1537.032;
	Thu, 24 Jan 2019 22:08:24 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] lubusb1: Add udev support
Thread-Index: AQHUtDFTgkLfqSnijUyUOFIjRvyCEg==
Date: Thu, 24 Jan 2019 22:08:24 +0000
Message-ID: <20190124220816.6193-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0062.namprd07.prod.outlook.com
	(2603:10b6:a03:60::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0238;
	6:jQ/ZcCdNZKvskaMTrHQNvJ5B0z43vKyCGCTx1CEPuMj9Q+7I6sRjJd9lzzxugDvgGHxwVuVZt+OxdqNrbLAgn1aSbbdho9fnKQaelHnYOQQngkYZf8PJhSvY/vmGwVYYVbf1TuSJavgCt0SBESoiwHwRkCq6TfpL4qwsNZ/P6N6E9lv1DWgknS/vkl1oD9F8+NeUieiGsBUuj59WcFdoaIraD8CZ53tSDjUmy/5Jtbi7CHwFiVky4O5PxRIoMEaRgT5xWRf4xdE6GZWdD7OIeCo3kqM38bYx0SL560TB9GByCy3enWTsku9dfc09xQLpAmubpVgc81hwOoNDg4kALpRj/zjwVyrpwa8EHJdVdoM90EvBxrg22Hz3ZYmtag91mp3JuVesXmTk/0gXAed08oIX0VmxGeDPzRc/Ed6PwXTn7HIzN00JVF/7ANi2x6UvwThI6AnL/ga4czU2GvH2NQ==;
	5:0AkZU057/I5rk9LXEjHKtqgdDlWhQrpZnGr8+qFfNgKbXe2+FU454Zk87rJZZSHvTrkXoVCR9SbbIcUG5b+ACaJQMbFYcF6tW3+sll68fSZ85V1795oD21xt5MDO9/MXeUXb2sjnmGeZJqD8oHWB6IIE1dtx9p6g43iGhTbzx1lBq19m8sLnY/Nnj/u4aEFkUz0NTKoiWLHRn+inKGhSIA==;
	7:/zH1DaOlYg2ofh3JyZf58L2SFHD3PtzLKfyQbdTQEjbBtnf5ufopcE0FJ8pKzZNGrAEKRuW8y1GHZB25WF9SM/6FApPWKWDCEKV66LzyKPGlQUnx3IT35Yvz4rnIWx2A7iXReHI48UbScjLUyfuevw==
x-ms-office365-filtering-correlation-id: fe59e1b7-4213-4b08-1a23-08d68248758a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0238; 
x-ms-traffictypediagnostic: MWHPR04MB0238:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0238BD7FE30845DDAE410753909A0@MWHPR04MB0238.namprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(486006)(26005)(39060400002)(102836004)(4326008)(86362001)(186003)(53386004)(106356001)(66066001)(2616005)(53936002)(2351001)(476003)(3846002)(2501003)(97736004)(6506007)(52116002)(25786009)(6116002)(386003)(44832011)(6916009)(71190400001)(71200400001)(54906003)(6436002)(72206003)(5640700003)(305945005)(7736002)(14454004)(50226002)(6306002)(1076003)(6486002)(8936002)(2906002)(68736007)(256004)(99286004)(478600001)(36756003)(105586002)(81156014)(81166006)(8676002)(6512007)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0238;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q7fhYmVxWFfbS1l3fD4k1G/zuQdy++C897prdoVTfwB/ukiBe7bWrhNtXFhx1xh+91CoRV4HwV9BCuxTC6csZnfdInfayhUmKlKhuEUmGpUDnbMi/z8AqKqu7nn1pcZ3MkVDWGCnRtBDF/3eVu/19Mtqbh+RhBtJ3yE2Gn2RC8/LjHKPaFxyXkzoPPnj0QgSMRq+VUF5tzVS9hp3jokNEuGpOxYtZlsTioV0hCiHb7ZWrwUUTCkQ/uXIgqpYu/4QOvaGQvrgy1r1MmOiWD+14q4YWz5PnkNNZbOjQg+dOko5khCp2XysvmZ0xMcOE53Xsvk6PnmamCVdBoPpWpdq9cPnED6pLE8TOJ0iv6Z2UaRKaqxOf0hPZefAirMv+5g9O1elqWwb3fJypPV2QGwendtNwiIpJEf09ec/nc7XklY=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe59e1b7-4213-4b08-1a23-08d68248758a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 22:08:23.9433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0238
Subject: [PATCH] lubusb1: Add udev support
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
X-List-Received-Date: Thu, 24 Jan 2019 22:08:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't see circular dependencies anymore between libusb1 and udev, so
enable udev support for libusb1.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-support/libusb/libusb1_1.0.22.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-s=
upport/libusb/libusb1_1.0.22.bb
index 0c6e116dd7..9d1b8f4abb 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -3,6 +3,8 @@ HOMEPAGE =3D "http://libusb.sf.net"
 BUGTRACKER =3D "http://www.libusb.org/report"
 SECTION =3D "libs"
=20
+DEPENDS =3D "udev"
+
 LICENSE =3D "LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c2=
4"
=20
@@ -20,9 +22,7 @@ S =3D "${WORKDIR}/libusb-${PV}"
=20
 inherit autotools pkgconfig ptest
=20
-# Don't configure udev by default since it will cause a circular
-# dependecy with udev package, which depends on libusb
-EXTRA_OECONF =3D "--libdir=3D${base_libdir} --disable-udev"
+EXTRA_OECONF =3D "--libdir=3D${base_libdir}"
=20
 do_install_append() {
 	install -d ${D}${libdir}
--=20
2.19.1


