Return-Path: <prvs=90010c98c=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 500AA7BD9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546561687; x=1578097687;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=7yq+lCGNscbiB7meKrxpJJfvFFFyheFC7y4aMYrBErc=;
	b=iW0Ddx/qLZK1VqGytMW5f9HP+GqtkqjMQMQt0T/bifG40q3RWx+PHCSe
	z358qGQy+V5EvE79/bneRRMRzunnesfqn/pBaiVJ8q4D29tEMOYRqz9ZN
	bmjIXQHFyzLX3OKYZoePGE6Rs/mFqTSBue4LV/EAowD8aP9iKx1N+Acj2
	EafDWgao8nhd8rhgySo+h+RN/fnYTQC94jCb9oAjCOWPKmRv5ALZR0Tu2
	oaN4IJ/ZVoalz5t5NlEteQ5CHNwlKUuKTKZ86bfBL1dFdfDPEQl0t1W6f
	FXz8SviegUBTgyzSd5mf9QLDFeyz/Mbw4VUP1Hw4i/Clp5QIXIN87DPsS w==;
X-IronPort-AV: E=Sophos;i="5.56,437,1539619200"; d="scan'208";a="202763935"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2019 08:28:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YoyufZ2p4JznbR4reh4wwXHsEGQDegOHRGz/p6jrZ84=;
	b=fjgsOQYc3dbhsEBLPw+RhNYprvW8AJ2A1re1bqE7lZm0S+YOsl6rNY2f2CBziMNqVNu2T4f3ZtufqadgS5V5nrUDW3z7HOtPrk0s8tgH0IBB9RDoS1j2a/gN1Z7U3l1L1DdB76fj/4yyr6gjrGQtxPsjKGIl0CpsDIe/+rFd3n4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0702.namprd04.prod.outlook.com (10.172.167.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.7; Fri, 4 Jan 2019 00:28:05 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Fri, 4 Jan 2019 00:28:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] swig: Fix configure failure
Thread-Index: AQHUo8RcSg9bQjptzEmMipYAGTz9zg==
Date: Fri, 4 Jan 2019 00:28:05 +0000
Message-ID: <20190104002757.18687-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0028.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::41) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0702;
	6:gFDkTSqc4rueY+EihypoGQJMMakJYAEkbRTzNH8yxugriUpzTgKNiTzZ2d+CqvQ05jT5fi4s43MsnUQG3y+DsRKOVMTQ4Tr3QEkGAVYb0PiZQi4ZZM+M2ehxRXZr05m6297t/Tf7cwBM6QBNDZD6TmxHVYFElCPWHV/8L1phSx50ti+p9qWeDUhgViDqYrsTHYEEyRhEdItZyO+Jgbz6aJqg7Yy3HYmly6xmHmze1AEflx/jQ96CKDgngNTTSAHrKrYvbavvY26e74rBDkCeQejUWwYETXp9V0wuuOGRRKOGC5+Cd91shdjORCWuP2Z4Bi7JNdyyvPoyPRHA8d3F8kZyH4CwClfWd2PAcTQDtJPIfbcECqpZqHgWmDsZg+K9BmxsqPAPSSzbVQM8GbeRMAC22lfjLrMFLZiR4f6wzMXpRR8MDcaN7GnyXmg/zdiBJKhMetTzPU9/6kqRgTbYGQ==;
	5:SpiSeB+2UNtsvRPeRYot9KnHKSHYeUF6yMG1rwoGQSLIIADtgqw7SmXCUluMrPlb3nOxHlJtBG4xOx/5FfdehO89YZot5w9w+Hn5REUdNmQVVNdIINTYuOTWyO9fJ/D2/IqJ495yHeBD7JrRQzkpLxCAuvGLtfAR+hlzsNRyj9bBPKo8fTZ+wI4X4zMLUwxHZPSdTEkAMfiJU2nVX6TL9Q==;
	7:9x08ht0rTKQdjxmQw9EWa/18XdH0mfeeVc6EipQ8N9mQMZdQQjUMokBoPpcKcXMZYFdGeOgvpJgy/8cpffqVwMHeSVF8uJhku8XLNyHpB8m5Uv+8kFjM0KoeRevxYHqxHzjEOPBgoKhNQrbhiSJjQg==
x-ms-office365-filtering-correlation-id: d0be1e8d-6d1e-4990-ecfb-08d671db7e5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0702; 
x-ms-traffictypediagnostic: MWHPR04MB0702:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0702AE2ABED1F6BB9F0D92CB908E0@MWHPR04MB0702.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0702; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0702; 
x-forefront-prvs: 0907F58A24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(39860400002)(366004)(346002)(136003)(189003)(199004)(2501003)(6506007)(1076003)(81156014)(54906003)(8676002)(8936002)(14444005)(6116002)(3846002)(50226002)(39060400002)(53936002)(5640700003)(6486002)(6512007)(26005)(186003)(81166006)(97736004)(6436002)(71200400001)(71190400001)(386003)(52116002)(476003)(68736007)(5660300001)(316002)(256004)(2616005)(102836004)(86362001)(2906002)(478600001)(105586002)(72206003)(2351001)(36756003)(106356001)(99286004)(305945005)(4326008)(25786009)(44832011)(7736002)(14454004)(486006)(66066001)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0702;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e7mZn5ORyxISDen2UskAFO9xHCZx7DfhRlIOwY2udFFUpmlk2bNt9CXTP4sC7BDdBtgR5KP1YWbMsqiNNFKpRtp62kRi6Bw/i3nKcWCATdcOvR6fmtK6OuWFgwNsGcnd9dSqN6G+fIpQh0Uho1RYgCsUOtmZvobh6Yi6+AI2fqioapB+62au1NtDQj7igNr3rJbB7N58iOuqnaK72IU77zPkXbfpcuQHflEmFpMB/vtJvFsamCB2Q6yXt0qX9ih2GDpti0tk7qi9BxV29VYl2Ok+GGorY5132pZj2DnbpAHC6mJuAdvbcwhpxadS/T/U
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0be1e8d-6d1e-4990-ecfb-08d671db7e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2019 00:28:05.3930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0702
Subject: [PATCH v3] swig: Fix configure failure
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
X-List-Received-Date: Fri, 04 Jan 2019 00:28:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fix the swig build failure by calling the default do_configure from autotoo=
ls.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/swig/swig.inc | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/sw=
ig/swig.inc
index aec544997f..f7de40866a 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -38,15 +38,9 @@ EXTRA_OECONF =3D " \
     --without-tcl \
 "
=20
-BBCLASSEXTEND =3D "native nativesdk"
+EXTRA_AUTORECONF +=3D "-I Tools/config"
=20
-do_configure() {
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}=
/Tools/config
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/T=
ools/config
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    oe_runconf
-}
+BBCLASSEXTEND =3D "native nativesdk"
=20
 do_install_append_class-nativesdk() {
     cd ${D}${bindir}
--=20
2.19.1


