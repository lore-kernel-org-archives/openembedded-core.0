Return-Path: <prvs=8991e90f1=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF2D79EF8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546554629; x=1578090629;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=xM9idUT8WW7tVE5vsLqBuxCbajU6vUoxAWtpM1Xq1io=;
	b=QRiO5z3syd+OCjP9FZmfMrRsrXY+vJew1ijUlliL3ejrnFPmgq7+JQPD
	cgLx7Mz/bsweF3Q5J6b0avxIGswHn8BfS3qvMG/uay2j5UlMvQ+ff0AWp
	nwnI9javwTozbSysOjJy/Ua4dw3WQ+euEGh6NK1B+LgstxY3s7k7DPIhd
	kMYym5wJm3+njZz8P2qbANVsf3JJSbmlRj0f4yhoGFZuxwVZ0d7NSAW0h
	wVcmvdyQiaDKCi6pcUZLLVWcuJPwdAB9yaQD3ITCILc/s/VWVyEdXEr1P
	kHWj2//D0ylYpBI/elaOtnytOBSNcGw/sgAls9VcxBBr1Te8UsEQU1+LN A==;
X-IronPort-AV: E=Sophos;i="5.56,436,1539619200"; d="scan'208";a="99145560"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2019 06:30:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=c4n+lYI2DubqWy39j+Mu0NVclSqy1D1p2/TrwyhLaqw=;
	b=hOcswUCgRff0Fj8rbqmXqYULTaZp3WAvL9EBA4Z/jrgfUuXycpJay8bDGPinFN4rMOcmCBq6IpoNdA4eT2sPrswb5mJAvgsuV5EBzAWqlxyN0bOHRv/Y1Ajb3aFnZVXCi3EaofJt4QxF0ShGV5oMjYoCCJL1rIW9joBE3JlWm3I=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0241.namprd04.prod.outlook.com (10.169.202.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Thu, 3 Jan 2019 22:30:25 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Thu, 3 Jan 2019 22:30:25 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] swig: Fix the build
Thread-Index: AQHUo7PsEOnZxR4+5E+k62AxuKyfYQ==
Date: Thu, 3 Jan 2019 22:30:25 +0000
Message-ID: <20190103223016.17799-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0040.prod.exchangelabs.com (2603:10b6:a03:94::17)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0241;
	6:6jVtTQ9mb4KxhsnoZ1rfx49S6ZdECYkrnJsK08aL4KSmQ+eM0v8n6xqcQKJG/he5NWSI0g1cTDd30xZL3MXMAzadr01n5P4Ockdgm9a3bYOqUhtMsgZRV4h066ndtp1GrU3YHCelyGVOlZ9FCDhjh8R6MDFcoSWwH44/7yvnzAf9Tu30PZULFJZKcEQHsfkonTg71nTRTRFYZEKHa+gsz2NTTmTBymdrxly8b8UCTiaWZOW5ATrxnoOn7b8buR7tQ5gUF5Hbz8z9zeJlmrik86Ixp1avcgHQvEzeAnnDjdfJacY6JoG3ji5btarhyZYe8h81zhx1klhB7vhv6YOEA4MiY9+bnyj6J7OGnxs0FionjcwrRBc9nfMRo9qTNHkgs/7Q8Oazh2yi8HvsQhA+ckl/7aJSnlJoUCnjQsZHRcIsFQv7gDXtXdp/2UJ9MYPHf5xM85C/SjsoXCO4hfB+Ug==;
	5:qTzKR+p4dlnVzmHbMDYX8HZWdEtJ4B1XQR8QpSJtWDk97MZMJWhyOF7CNT4dCqTy0Zn7qMI9rTVkRr2rsgOX2B2gG8ecv9H5SjrmeHIVV7IQl/uOUiSKKMkyzQt1KCESBUf5FA765SXyHtm9NY6+YxYJIwll+ByasQw1fg2WSVLxWeDlsvpJeDFYRm+1B+eQcbDVhGsr7eYFMMjH/twMZw==;
	7:p9SOIzms+yssUgcdE3JPN5boQ8I23NJaYKM50ULEpjvzOmy1ElCpseWqM/gfC2C9QmGZzjLJaGo/KzLAFQlKRM5apLHoADWeX3/M/hAecPUB3rrx5v3HVdX+GV7DGG6lhfVM3/trPS8KbtIRQ+qrgg==
x-ms-office365-filtering-correlation-id: 53dd95d3-c8b4-44a3-3719-08d671cb0e3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0241; 
x-ms-traffictypediagnostic: MWHPR04MB0241:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0241F0FC809BED2B2FA5E318908D0@MWHPR04MB0241.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0241; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0241; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(1076003)(105586002)(476003)(72206003)(305945005)(39060400002)(2351001)(478600001)(4326008)(106356001)(44832011)(486006)(2906002)(6486002)(50226002)(2616005)(81166006)(81156014)(6436002)(8676002)(5660300001)(8936002)(186003)(66066001)(2501003)(6116002)(26005)(5640700003)(54906003)(36756003)(97736004)(7736002)(102836004)(71200400001)(6512007)(71190400001)(25786009)(52116002)(14454004)(53936002)(316002)(256004)(99286004)(86362001)(3846002)(6506007)(14444005)(68736007)(6916009)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0241;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U2b/o8dQMqT3Bg8DBpY6TVgeTp0Ue+bHN9W2T2vKkWVbOR3Gc2J+VqsAOspvmid5MyfMFY3f2GkdzbrWuw+A12M9dIGkX18Zewm6eEl5xEYN9e7DgX0Dgz5ZJIBVr+cLC8vT35ek4vNtCVXcZTtcHr3c023DGzWbavL4LxLjbDhwmNvZW/0XRSayTVbHgoUuX1MGNjQJPnwPo23FmokNz3EOALQlTDPYG7p2dXgqqFC9xo0NLXsV6STqfVx/oX7iwF6Qbc/dDY0oL0iR2B9ynfYhthpg/vJlrN4rCGnaKgoHIQNTrPFKxpCUYMGp0myw
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dd95d3-c8b4-44a3-3719-08d671cb0e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 22:30:25.7572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0241
Subject: [PATCH] swig: Fix the build
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
X-List-Received-Date: Thu, 03 Jan 2019 22:30:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fix the swig build by calling autogen.sh before running configure.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/swig/swig.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/sw=
ig/swig.inc
index aec544997f..49da68c544 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -11,7 +11,7 @@ DEPENDS =3D "libpcre"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
=20
-inherit autotools python3native pkgconfig
+inherit autotools-brokensep python3native pkgconfig
=20
 EXTRA_OECONF =3D " \
     --with-python3=3D${PYTHON} \
@@ -45,6 +45,7 @@ do_configure() {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/T=
ools/config
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+    ./autogen.sh
     oe_runconf
 }
=20
--=20
2.19.1


