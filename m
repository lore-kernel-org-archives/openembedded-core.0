Return-Path: <prvs=920fe819b=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id CFFC47C2FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548369340; x=1579905340;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=QE+b1U4nrvGtLZwnNk4MQMWsGoA+yf2RCMynZIym4VE=;
	b=pfup2OaFQ3szAAUPGSLkaoSSl8o8iHDAkvOPSf7BvLAKKMR9+O+z+SRr
	Rbia0khjLv2IopFzPQbwtlVy6XhbnLM2pAKHdUaERM7pIRBAd1iHBghGv
	mAdN4CMmoE6m3E+GWpjdPVnF0dJVUAWNh2T981zedquSvVujCNBSaig0z
	ZXhW1eXdthkWBemvnYGzOpWO4SMAmznoFPPsXEDJeaWgNJwhb5gejH+ku
	gkCECm2J+w7oWjAft00Ir4pMZGWOaJdeeW29YVrOXcWCLHxOKJS4Q8ZEr
	pBpfzPmGlauGoTOMW67OP+aJr/3pTyp58iw1856p1NTQ5OG13hekaNjKW w==;
X-IronPort-AV: E=Sophos;i="5.56,518,1539619200"; d="scan'208";a="99731579"
Received: from mail-co1nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.53])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jan 2019 06:35:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PCaVq3k09oS/IWL+NaiJgnFvJF3DhkL57bbLGkzFLSk=;
	b=g4Fh4bNbCDj7wccNK9FHrVrwSYXc0N8ralzky3xbDbxiX6Zf0MnMpmSXHmlEGVj7pON68ZG0N6I+pn19QSCkU7WXH/t+ZVbYnB5mBIefDbaFSsY5+No7IMy9ak9xXiDUoo7snIBQzxx2v3yshAJSt3xziGOHevM3yEYRjycFAK4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0288.namprd04.prod.outlook.com (10.169.202.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.17; Thu, 24 Jan 2019 22:35:36 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1537.032;
	Thu, 24 Jan 2019 22:35:36 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] lubusb1: Add udev support
Thread-Index: AQHUtDUfh6+KqSDVO0eGNapKLmchSg==
Date: Thu, 24 Jan 2019 22:35:36 +0000
Message-ID: <20190124223528.17455-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0032.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::45) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0288;
	6:K5QYOX1P5r3bK1R20Htwzl8PgZQ8u8qHMGoqNW/BjW9HdMooPT4/pe/mtJeR27XocySfKdyyOvotQr9T+SXGr1Zhfym4cKrq/5KbgdUHJCWkgthU2vnVlNcAl1RmduFnGQ5KMa74SdOzistu49ndmnvOsJ143YDrCpyKTyuR37kXFqQgxQL7PxvuZsDNA2zBcLi5fsiiuEzpVjyZYpnDK13/os22mHScxQCU5NgUFu1y9YwUaiw7ItlCPMZOT7fTdokXGUEC3ZP2TwHu7SNo7wo8+5vkCWDsibIAaZhP8qyVhletK59cn5+o9AIC+DLfpsHTb//bZ5RpoZcSWvSRY2aworArwXPlKDg5e5OJ0XLuBJitsxhoMPzGFF1A4ccUrgH33iQra9nE4DTzhgJgCx2ZRPN55q1YT7s8qAYnolI8LEqXhC0Izp4HFYQYSWKSFX7cR9M7+RFPsXyHmrr+kg==;
	5:r+Ft5ubU3v16rYXCOEv0Fu3Uydj9WspgZza/aR8LiUF8ymcgSlTVpoy85/m7uPilpOws4qaTIpULCX7ckY1lDw0UxbZZ95dy/DhN3jZkKNYUgctwA2CJdj8my+oY/6j1cPG9wKcl4J/5754Aeh+rKT/0URKRHy73rXdaTP8YtbhRMzlDGcPLMlBbd69PLZCuWiNyVWmO/9vOANcU5m564g==;
	7:m16y837y/jX0M+zKlQ4EQRi2XzzNdUnd6rhM2TurlegAozmQNEGYeOhPDlRxHogi4DhIzV/ifeKNBaz0dsj25bsNB/L6DYCIOMFywz+Knjb3fMfiln0wnVK/Zq8NJPg8er7a5f+IV/fB1xXUSgwlfw==
x-ms-office365-filtering-correlation-id: ef170aef-54b0-452b-f5d9-08d6824c4252
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0288; 
x-ms-traffictypediagnostic: MWHPR04MB0288:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0288348BB79E6865B64E7848909A0@MWHPR04MB0288.namprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(366004)(136003)(346002)(39860400002)(199004)(189003)(52116002)(6512007)(3846002)(6116002)(6486002)(14454004)(6916009)(26005)(102836004)(39060400002)(7736002)(305945005)(8676002)(81166006)(4744005)(53936002)(316002)(54906003)(72206003)(99286004)(81156014)(68736007)(6436002)(478600001)(1076003)(5640700003)(66066001)(50226002)(2351001)(97736004)(71200400001)(71190400001)(106356001)(86362001)(105586002)(36756003)(186003)(256004)(476003)(6506007)(386003)(25786009)(4326008)(486006)(8936002)(2616005)(2906002)(2501003)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0288;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i4FPVSb8PbUg8FgTvoK9UyfrA34MipR9erBhMhq0EqUf3HbBSX9DHMHGToOXZRAMHnOeM3bIgDoiMXpW4UsYhbgElFTgcoIhGJqafvhboZDKdmmL4VG2iJ8weZtsa1trtqSu+QpuCKM8ONwOl10dirmArInRNyYh8S6ZEQa5OSytYVFgpHAE8hRkq121PtQj3deKMRrgZGJDxk+Rr9FtFp+6feGLv5zwxmHrHc4nyd7QvKGgGB+q7iB0wGi81ir7im2veecUAElexNYgeSAnWibXdrN8xvLOq7mIMlg01BEND24Ni85qh4rT2olA+z7MGfDrQY0pDtl7+w/skZhzWJYoAnw2bi+eKp4f0Y0BA0c/tiI7ET8TKp/uLRkspDLn2cDZC/KU4lUIiZaQHVjf92sTywtPnq2Qo4yC27GSGKM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef170aef-54b0-452b-f5d9-08d6824c4252
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 22:35:36.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0288
Subject: [PATCH v2] lubusb1: Add udev support
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
X-List-Received-Date: Thu, 24 Jan 2019 22:35:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't see circular dependencies anymore between libusb1 and udev, so
enable udev support for libusb1.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-s=
upport/libusb/libusb1_1.0.22.bb
index 0c6e116dd7..35c1d705b6 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -20,9 +20,10 @@ S =3D "${WORKDIR}/libusb-${PV}"
=20
 inherit autotools pkgconfig ptest
=20
-# Don't configure udev by default since it will cause a circular
-# dependecy with udev package, which depends on libusb
-EXTRA_OECONF =3D "--libdir=3D${base_libdir} --disable-udev"
+PACKAGECONFIG ??=3D "udev"
+PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
+
+EXTRA_OECONF =3D "--libdir=3D${base_libdir}"
=20
 do_install_append() {
 	install -d ${D}${libdir}
--=20
2.19.1


