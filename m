Return-Path: <prvs=87864c7eb=Alistair.Francis@wdc.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Dec 2018 22:15:32 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF4479D7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544739333; x=1576275333;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=QdFduYQlTILc3n6nqul9wzkUBOFOw30kQY4xcI3h23Y=;
	b=Kk5AwqEesYY1q6dFOObyXmmDxMamZR20K9ppPFPjezZniszQQDsqRDqR
	rZaTAxVO3HrJifdJijEs9DrjEzCxmiAQTGDTBiivl92+v7a7gNTyBF1YL
	mPwZrpLkcsyoh6+UYL1NKaZQqu21tPPuyvNW67zJKWxj5vCFzCNS3V4P8
	dI60iACEscNzqo0GFprh+WgN83kdv2WPQI4Fc60kWtr96FbW/uewYclP7
	SA1F3hd3JlE7LZ7ZWPk+4HCD+EqefRzwU+cd+SA2Iux0k7DDpkonvQ4ri
	oRNK11kBaoTqpRBe9pBSSwzbkmoGe0ZjvKRkRxKZU8eG1RnftB+xP+WAJ A==;
X-IronPort-AV: E=Sophos;i="5.56,349,1539619200"; d="scan'208";a="101445909"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 06:06:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KXUu7S5sOPb+CrBaClT9zs4Dl35LpXgJ2nVU+G277/Q=;
	b=OiBG1wmM/aBKVkd7YON/4YYwrVBnfI0W8QI7GZ15iAUM2E/hcBMYsZNio34bM3qW+OTbqjRicbCHKfBnU9M+Nme7Oxz48WaxuU6z0fxqZwUo1oI/gau5XkWyKXgnmmvfUDSp+kminUI2VdK9xxpQmFZlt0r3kDUR/MijM1MEpHg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0862.namprd04.prod.outlook.com (10.172.168.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Thu, 13 Dec 2018 22:06:04 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Thu, 13 Dec 2018 22:06:04 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] qemu-targets: Fix the list of QEMU targets
Thread-Index: AQHUkzAK+KQ8a+N8VUiZCrEREkB/bw==
Date: Thu, 13 Dec 2018 22:06:03 +0000
Message-ID: <20181213220555.690-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0044.namprd11.prod.outlook.com
	(2603:10b6:a03:80::21) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0862;
	6:apQ2/edfKZhaqhFISTneMUhwH42/uIv20Ersv678dw1r6Viwvv9t5SPE4oR1Dh0bAQmciyjKqU9yB/e14Rw8sQoaMlKnOlq2pHpUWMOF+G0l9rhPwyp0u8HWWbsgUEAnwzWbPIxMRY6ei8NYnXRFD5JRbgmfYOyqpVvXxp4FEaljCFAzc7Xv1elPqH8dU77lf4xHA4Xni4rJQU6yP3139tBoNKPyu6xq5Zm3WfjQ06lhvfVW5xw1yjUOjBvjlk/enPwdV8B7meRnbNzgpVGrDL/gS9m6VLePSba0wq+/G2ZFGK4aeEApDNcU3BlgMjRgo43Kg2xQ1yqzbym3kfUY9n9Aq1XrJMY0/84/Ux8/NDvz9weaSJO5bqJ60fzHcZYviNlz+HQqeKM3XXWQOlFXAmhYOKE/geNRRmfmlXY+NfrXjtUFojVtwus4/c8lvBmEaay4CZPGkYEgpOD6PuQxZA==;
	5:P9qEtxItQY6oF0VAOEhL4j56gyosMAGpW9BCv5AQR68mKlaXpQIsMP435eXbM+W7oLeW9bx5+JU5CBkEMhpW4ptVrmvaIavXzxhikfXAPjiuZenqUaEqi64zjaQV516z/KHeHq9/+jo51jlI+CPUnQ5WRWv1J6Cpkn3qFvJ3HOw=;
	7:1Bn9m4YsaoPdJGdV+N+ArYpGwqshEvBhlgc86+6FBtngDgMJpBm2WSf20sDs5sBy33b0EWOe98+5VB7s0YL140gjfoXvgmZO5oTnYjAcePy6UYF85BJlN7CFuGQ5+r1+Ap7L54Tbh/Z38+71BOTwQQ==
x-ms-office365-filtering-correlation-id: 5253d4fa-9e26-4a7a-0c8e-08d661472c74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0862; 
x-ms-traffictypediagnostic: MWHPR04MB0862:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08624C00144E56DEF7DF04D190A00@MWHPR04MB0862.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0862; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0862; 
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(346002)(136003)(366004)(396003)(199004)(189003)(6116002)(5640700003)(1076002)(72206003)(478600001)(6512007)(39060400002)(486006)(71200400001)(14454004)(71190400001)(66066001)(53936002)(3846002)(305945005)(99286004)(26005)(7736002)(186003)(97736004)(2906002)(4326008)(86362001)(44832011)(25786009)(2501003)(476003)(36756003)(52116002)(54906003)(2351001)(6506007)(81156014)(102836004)(81166006)(386003)(8936002)(8676002)(6486002)(68736007)(6916009)(105586002)(5660300001)(316002)(106356001)(256004)(6436002)(2616005)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0862;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 2RrWI1sTVEENJ5aZhaKKmwkneExOqui1l6HRjWnflDfwt/n+gSA8YVDLoNEcsv+w/gIEZv7OH4Ch2nBimu4SasTizGPNiVICS2281oUop3Y+6EVoqtXWxrpnVtXo+QmZ3GV1XstlmT4XJStSzC6c8Nfak/N+Q+mETcyq64Q0gIT/gVp1bMDqV1MMiCawE7yuK0YAOn+a87NJQPDkYS9LHyTASLdecTkE9cz67OBCTJL9frRQIV4rT4/KsYFUPk0FT6Tv1/vspUzPnQ3HNvX3BNdaMJu/U+wdOdFWBzroDX1++Ds33O/UCLjPC9zK1oW0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5253d4fa-9e26-4a7a-0c8e-08d661472c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 22:06:03.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0862
Subject: [PATCH 1/2] qemu-targets: Fix the list of QEMU targets
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
X-List-Received-Date: Thu, 13 Dec 2018 22:15:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-dev=
tools/qemu/qemu-targets.inc
index 810401daa6..a7d7b5f708 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -1,6 +1,7 @@
-# possible arch values are arm aarch64 mips mipsel mips64 mips64el ppc ppc=
64 ppc64abi32
-# ppcemb armeb alpha sparc32plus i386 x86_64 cris m68k microblaze sparc sp=
arc32
-# sparc32plus
+# possible arch values are:
+#    aarch64 arm armeb alpha cris i386 x86_64 m68k microblaze
+#    mips mipsel mips64 mips64el ppc ppc64 ppc64abi32 ppcemb
+#    riscv32 riscv64 sparc sparc32 sparc32plus
=20
 def get_qemu_target_list(d):
     import bb
@@ -19,4 +20,3 @@ def get_qemu_target_list(d):
     if 'linux' not in tos:
         return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in =
archs]).rstrip(',')
     return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "=
," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
-
--=20
2.19.1


