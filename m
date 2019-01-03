Return-Path: <prvs=8991e90f1=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9AF7BDB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546557527; x=1578093527;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=mazdZcT2UNpa4z4Et/MK9kH96glF3o3VYOxoV38KlOE=;
	b=kS9W8UDKiYnXxhyQAhSq7LGQ/QvQS+JzQxBryX+G7UmNc+XoW4B+DMJT
	Kb2Oy07lUTf7tlThSIoaDnPBI46Xop2GIuxQNrP7Ri1uyCdJtaGtnV1QU
	fPO2zpjVFTuHXtO6ouxzkzIcNAjQQH21RXPhr/PabJwvsPFVt5Ybm8kit
	Rr+oeSM94Tmc1FpKzBk4r1/YrPTadZZkeKGVk1W+BkOf7hnMrErDsTQpU
	tp2XLfi2mXRNLbo0axJcJ/cBvkzfhtgA0Ic7MXVAS+kQyDcc22vE+kO1v
	scfO4GvQocJW/SyywmgITImp1ulEj2i9GK7aQsdlWpdZO/iiv6402tegS g==;
X-IronPort-AV: E=Sophos;i="5.56,436,1539619200"; d="scan'208";a="99148020"
Received: from mail-dm3nam05lp2055.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.55])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2019 07:18:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ytFV1NjzXjgSjs/ro8cDFqJvvkQ52dF5j9R9R5Jxyfk=;
	b=Nmr0SFLHCwWSQmKGtr7ImxdjOLy5hNqlaHCtN1D15sQVMLxzGcXoYpNX7C+8fLbm6Yw7dkrB7wlfjAIyMsjr6kE76CUobSjCYGtOhbWSc8O/aAigG2ANu0FtrGN3HyXZNX3aTpLmj5llkDOWWPH4KQq1Fjht0fJJ+K3ukIp2Rtg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1104.namprd04.prod.outlook.com (10.174.250.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.8; Thu, 3 Jan 2019 23:18:34 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Thu, 3 Jan 2019 23:18:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] swig: Fix configure failure
Thread-Index: AQHUo7qmntWXvCduUkS5joqm+zM1Tw==
Date: Thu, 3 Jan 2019 23:18:34 +0000
Message-ID: <20190103231826.31290-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0032.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::45) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1104;
	6:yBBv/F7Yfbem/2Jesm2mzUhlsQOHtcv+KNiOnByHcl0NPoydhWBHHEJg5zcY8knvvlS47iMnDXIV7IXClsIehLpUkuovonJeepOuPhatJhkY1WrqWemZXmR6QWii53MwJMM0DPOFQVjmq9M6zlRQqNLPxZ3b29XDmzL2tK7MBSHFz5aDYBKKg14OZOpdoisYJhXqai2DsTuuLt0er1Y9nwG7UP6MAHbz8qHy5FJjKP9vovDClZrEKAVXinafVXNQL2x3MznfEQn7HOr+wtb/XLttojVZjFUn/MXR8KgrJrehLoMi5NhMOxZNh8wbBBlnA0fF8KWEsrBmzBhYp0aPoht57k/HZciv8rQIa3OZgRnAeqOCrD1EbLna+EoiU+tQJXPmeUAk7d/5KtAEyrwuYbUfsirxDww0UrOEfTiNUDQ/EN7/PSuS/pu71c0Jvi3VH1tvLpnTAKE7Oab0GB/S/Q==;
	5:mw6qjdqMigDY2bk25qKInxXKFmMpwvZdlTrZ2DhEHBau53QabIMt32AC0Llijdj2k5NTi3E6SWP3ol+XVty4ABG1G02QPhHQqYVNazIVHEY8sq2pQ+ARTW03s9UqWG09lRwRn13EEyKWSD0GdVXNCJWRUG9bSx52fZVN2RWq0Hae61RFJndYWITe7Zozk2r64AUYGLf7kdstj0n7a0fsJw==;
	7:1HMuwNXVFogyepvd/sBTtGE207TjeHfebVvzWviEYdOc8QxgeKBujuSXAdV+NG7CnBMUDmfqvVsWPzf7OyZki/GhE9HXVDGaioD27E/KTAhxNRHPIzQoHlo8+QhGty6uEWuHD35bmTqvFQkI69eC9A==
x-ms-office365-filtering-correlation-id: 6a0534b7-d93c-4212-1953-08d671d1c85c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1104; 
x-ms-traffictypediagnostic: MWHPR04MB1104:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1104135F7E4E7522BB607185908D0@MWHPR04MB1104.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(6055026)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1104; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1104; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(396003)(346002)(39860400002)(199004)(189003)(8676002)(71190400001)(81156014)(81166006)(6486002)(71200400001)(6512007)(476003)(478600001)(5640700003)(52116002)(486006)(72206003)(86362001)(26005)(386003)(102836004)(6506007)(50226002)(6436002)(1076003)(44832011)(36756003)(39060400002)(2906002)(25786009)(4326008)(256004)(305945005)(316002)(6116002)(186003)(54906003)(53936002)(99286004)(2351001)(105586002)(7736002)(6916009)(14454004)(66066001)(3846002)(68736007)(2501003)(2616005)(97736004)(106356001)(5660300001)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1104;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RpL57kmATofd7uQCQ64vPTZCg371QRjnMZrBwMckefvwpI0jXKlYBzYwX/7dT+bNt9HxP7Op988zCro8auzPOPBvyAuPkp2qUlJ568s99wDhrejUZNUuIMmjJ3oCtHjFg26Dcq0dBdeZEHYLmsvN5cE48nfKVvBbHRUNAHU/gI0DKCXdLt23Gz2HCkbELwcnMDlTGtPSdFiNtfcopu9iHg8HeRkeV+ybTTOs8X0MIr6fIa3VPntT2hYryweQ6ur2y/nCBUV/mC4qKlv7b10qj7qPg5DZOJZ8kuunbn+gy6Qb3b7OizFyXNZBxFudOPBA
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0534b7-d93c-4212-1953-08d671d1c85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 23:18:34.8242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1104
Subject: [PATCH v2] swig: Fix configure failure
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
X-List-Received-Date: Thu, 03 Jan 2019 23:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fix the swig build by calling autogen.sh before running configure.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/swig/swig.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/sw=
ig/swig.inc
index aec544997f..d74e34c1b6 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -45,6 +45,7 @@ do_configure() {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/T=
ools/config
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+    (cd ${S} && ./autogen.sh)
     oe_runconf
 }
=20
--=20
2.19.1


