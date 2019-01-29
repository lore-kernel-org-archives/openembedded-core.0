Return-Path: <prvs=925255644=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE4C60110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548803414; x=1580339414;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=I7yFXX8Wx6SpWGuMvmjXZ+jrXiRiTb2R265G6b0dAAY=;
	b=rL2E3MyG8X58X1fXJDk5+G4F4MBmEOteqkleRq8SKIg4uuQM3Q4/vTwg
	P0kZRWav/PALj5Qz0mn7zkeb5hUBZ7FqGGhypflCSowmZtIAWfMow3BG5
	c+WcejxNCSHw7J7Kb5XPYliM1vdLOGnW+Hzf7EYvPEkvYFQdlodM3CzOa
	do+GhCsj1OFtCx3iuSwIkX+wbq5LnsS6Gy6ASFlPniVjxSlsgqEEFUAHP
	zbXQjdHM2X+RdX7yNkwgNqEhvPlCiCswflSwdidoBG1X75IjhMsBypKiN
	gBpEMszm9H4/WJFSTo6Cv1wQ7qBlsDjiNv1uKKE/+mMx8maVb036n1p46 A==;
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="205120143"
Received: from mail-sn1nam02lp2050.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.50])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2019 07:10:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wa1qgR71uaTZXQYQ/J7WSJiZ+/2u+0k1lgTLR/vPrPM=;
	b=i/t2acXaOYSIZ3rOxTuROVXYS6/sZLG+d4RES70qhcCw6oe8xNqiSQL5POio0RUKZ+BxA1qc3QX0bezibfdjOH4BPljMIueWs0eEzRTrsad/yTmZzDbP/RmOwf5xTHRFpsLiZm0OzVKrEwIFARg+EEmW/IupIOkMKuaY701d76w=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0609.namprd04.prod.outlook.com (10.173.49.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.20; Tue, 29 Jan 2019 23:10:12 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%9]) with mapi id 15.20.1558.023;
	Tue, 29 Jan 2019 23:10:12 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] libusb1: Add udev support
Thread-Index: AQHUuCfJ2HRFksHpd0uk2+DVzFoTUQ==
Date: Tue, 29 Jan 2019 23:10:12 +0000
Message-ID: <20190129231003.6521-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0072.namprd02.prod.outlook.com
	(2603:10b6:a03:54::49) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0609;
	6:60hbwjdv+4pYo6/95zQyoQ+gIBU6D7lcO95X4u5xQhlxUUwa2FKpHXoPq9bNOa+rkBdDg/nZGK0NfG9gldOdNPGd8NbNDoHtFgE1o3OAKFcuWR6SR505UtyDwh2nvVPuBcwpTy7+HGlqyYWNC+W+cDuIlI/lywNtKyTDwNjHG9aLqGEuxVVcKFnCJIlbdY5leLQIDlNfap85ycU62mHQhz1hH3+7p0Wg7aD4Q27xp6fxxPuWXMfPMUudnpLeZHZGdUvgP0uzNfB2Foylcv1LHUOu4h3JXHuykJhWVAgVQ7dJPNlt11kbsKPk6ROgV1f3tcb5raX/kmlF5oWNyppPRsnbXRiv6P6/m7pzZEQ2AAFnJitQUHvcqgXMydPGi6O7o1ZGQn4pj8iHc7bsYNeDBz5Qypuy621LYSil0ihQVavBaCTwEfhL1WBP++y0GfKacq0tmZShNRVTaYpnKB5cZw==;
	5:vW2tOiHURulcZN/HeaBo97t2kKzEEvsmt2TnrN7Fb3/bUuJr9+V93e0+mnJmIjJ29b/ZFIFbrTqlZYaK6I0NiPkD2OdHs+FnZqrU3coxqRK1q/KLrsld18s5n68KaYsDAjeD07j6NEjsOqBBA/H72rDhRMVe87+a017A+h1x8uU1SPM5kJ/Y+o/IGzXmCqj6S7JJW7JvgvlWDH8FtdAI4Q==;
	7:J63NDHilW6KAv8yUiFbDLUXTALXzKLg141QeinRzOzPw9v1labQKw8d74LI7DFB6e+YFvNAg2+yLbEtlQ72eU74RoNSl+pEW/O2MA24k/GVay2r501vIBCIRz81IMOfHbsiGlBRwCmWuG8BBkLoeaQ==
x-ms-office365-filtering-correlation-id: dc15b8ad-d47e-4562-2e0e-08d6863eebc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0609; 
x-ms-traffictypediagnostic: MWHPR04MB0609:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB060992324E6B98A0B9ACB6A690970@MWHPR04MB0609.namprd04.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(105586002)(39060400002)(5640700003)(6916009)(2501003)(6436002)(53936002)(6512007)(3846002)(6116002)(72206003)(66066001)(97736004)(8676002)(478600001)(305945005)(7736002)(6486002)(2351001)(186003)(86362001)(14454004)(256004)(106356001)(50226002)(25786009)(71190400001)(71200400001)(2906002)(81156014)(54906003)(26005)(4744005)(476003)(8936002)(2616005)(99286004)(44832011)(386003)(102836004)(316002)(4326008)(486006)(1076003)(68736007)(6506007)(81166006)(52116002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0609;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 11kHHQdN0LqknUeE2fHQBoMAc3Z7beUUe9acC3XNpMO86cvTQQyDNwrkAxxzkMD8u5BXNgFQxfCzozYp+UzRiW4ftKNUk/uSmrKoueCVQJEx2EeuBRlmlE9yaC3xmxfdDXATuhNg2RVpKGC9cjvvPqTPWn4nTG8XpoVnXENCgC/eqLQ+oS/3hRFmKTMl3fQtGzAsnBf4KSclPVibgQxHk+dd87J7y2r37ktr7c3HE52yDAXtELmUn0EJCmQwOU9SNJQYgAwSWrLPU0u1dPggvY12VQqaOgM6PCFffjxYk13Tkjzgv/zT4QeiycO26pMoXMc1p4aJ1V4cAgkBwJA/EwcTdjfUAclcZJDy38fXTEIyhDfhV0VdMy3KGGv8f1wwR5tRCdv/ski92kdByEvHVKKtUeEEHriiFNt6jffrICc=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc15b8ad-d47e-4562-2e0e-08d6863eebc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 23:10:11.9825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0609
Subject: [PATCH v3] libusb1: Add udev support
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
X-List-Received-Date: Tue, 29 Jan 2019 23:10:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't see circular dependencies anymore between libusb1 and udev, so
enable udev support for libusb1.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Don't build for native SDK

 meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-s=
upport/libusb/libusb1_1.0.22.bb
index 0c6e116dd7..1d9d772575 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -20,9 +20,10 @@ S =3D "${WORKDIR}/libusb-${PV}"
=20
 inherit autotools pkgconfig ptest
=20
-# Don't configure udev by default since it will cause a circular
-# dependecy with udev package, which depends on libusb
-EXTRA_OECONF =3D "--libdir=3D${base_libdir} --disable-udev"
+PACKAGECONFIG_class-target ??=3D "udev"
+PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
+
+EXTRA_OECONF =3D "--libdir=3D${base_libdir}"
=20
 do_install_append() {
 	install -d ${D}${libdir}
--=20
2.20.1


