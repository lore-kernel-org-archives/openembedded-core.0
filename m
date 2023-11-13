Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785FBC072AB
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 09:18:58 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web10.33319.1699867130825050548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 01:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7/ixgSIQ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7/ixgSIQ;
 spf=pass (domain: arm.com, ip: 40.107.13.52, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lrOBJuLbvj4r/emcL2cDhzkmK3vmgXHZ2kpNACFXK86WaVh3fxbDf7IBmVDXYeODq68fhgUa2eMjrewvCj3ALe7oAlQnoDjdsQzSZBA7dRK4oI4d66B/ERZ6GZUETGPHNf15oQJgniNVw39V2BGeCzXzCzPSj4ycmRPDOIZ0rCUE4uEtikNeZWDQpjsOA7/bDePkShj7rFjy0qTgRSVu0DzxSJJkKAxiSVc1mQS3yejpp6UHg8q5exnzH+V4nuBInlmBic+UKvfyUEtPvdwL/1osRxfkW+QKZr8D+TZS6wSLzMhcrS4wRbAk0XxvxLNj9WywJvf5FC505GpRcHxQHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl3wotAbWJRRglqEerJuxxNlQ8SoVFV6RaoajPmXCno=;
 b=cMCZHhe4ZSDrrAL3Kmlf8jwkYkOxacD3VfXLLQbajARsMEFWH+kyaeDtpZDKY0X7d3hkfym6gwl+2bdgmnzPs3Kpig0o7QU5FGxecftNLGgJsH+rTLzb3GU6h6AlUqVMrK4XkOVcIbcREvfII0cr3RifpQu05C/p9SgrdXesKjzjwCDr7N7Q2pud01jDwWompkAyR7KXaeuF3fmznRhBF3UNJYyUJMO061GIR7wd2jYYHQ/tGfWJXMgkiZUaJEiXFomZfdUiZq7sFZltKzYEETRkYtuKRWhk9zxHXGQEdoiHZGmvFTa4nl4G9q13qwlT//dauk0Q407Dbqh89Lq6PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3wotAbWJRRglqEerJuxxNlQ8SoVFV6RaoajPmXCno=;
 b=7/ixgSIQQfSnSAd5DmmdvMRCN49qOHAnm2GUn4R8R2BPTsKrD/trq7QX4l21lpdxvWd/N/CtOUBvg/3SbvFOJAx1lWpOvtLrTblUDdo1yjDHAhQmSq96oQI/QuiwmJhcwsqOY7iQ0bz0fhjw5FuLc01LGSF6p3E+F/ed65IqtuU=
Received: from AS9PR04CA0157.eurprd04.prod.outlook.com (2603:10a6:20b:530::29)
 by AS8PR08MB6327.eurprd08.prod.outlook.com (2603:10a6:20b:31a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 09:18:44 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::c0) by AS9PR04CA0157.outlook.office365.com
 (2603:10a6:20b:530::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 09:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 09:18:43 +0000
Received: ("Tessian outbound e243565b0037:v228"); Mon, 13 Nov 2023 09:18:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af9736c9b4c60377
X-CR-MTA-TID: 64aa7808
Received: from 26d5d94b18e1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A0420A93-9C68-47B1-B49F-314BAEA96506.1;
	Mon, 13 Nov 2023 09:18:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26d5d94b18e1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Nov 2023 09:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+hobIa1gSxVD1QljTh33N7e5EL3LGSSWEWWa7zaYqWh1CoM5sIfWL8cBtX4ydiVwWLzy64btI/bxMS1YUX2byj9Yh+H+gYSHuR3IHLvXwRxOA4uEIZBM6wPOFJePmE8eKYx2Ch1GhMm/EbGlwkND+9Fwein7vaEfgD/FGeoM+wOH/MAnds7DGVJ3lFsGViBB2kUYIw2DZ2P3iSqzZtsTZQ50wY6oYhDtKXbcpkru1WU/x2fAcHwU+b9Ikp35ThvQUJPeQ9XQAzMKPgLfLrMvOg4/8DsoCF1Mq5KPnvibtynHhXlmZ8FkufNrg8eJ+bnZBKwZdXkzzokAe9auxhFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl3wotAbWJRRglqEerJuxxNlQ8SoVFV6RaoajPmXCno=;
 b=YDQjYZkh297yOwF/PmFm93AeHhKErqZmKmoa3xGp+DkLKDQnC7ltaRhRDI30Q9lLgVzwgjZpyTfAID4aAwcIemVaiNh/GWqEZ16pBUudrK00Xlr8MCx5k+i7TvXdoE8J1MwPvCXXHYEivDTnsT5SxCNZY2CpDj34+f+/AtEfUVYla1/f53H8fZZppAdHVQSw2RfLozkht516j6HiTYTEyGvPHxR4ej2FCq0UqfBhWOzI4s6k8MavF/iszvrJ7V3pcxnFyiBrDLQoNRMslWmLK7PX+XudwjRpKwC3QJPi8pHPuMun6cjrzxz7fVKd3b6jE15FDupoiU9wh63tqFTY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3wotAbWJRRglqEerJuxxNlQ8SoVFV6RaoajPmXCno=;
 b=7/ixgSIQQfSnSAd5DmmdvMRCN49qOHAnm2GUn4R8R2BPTsKrD/trq7QX4l21lpdxvWd/N/CtOUBvg/3SbvFOJAx1lWpOvtLrTblUDdo1yjDHAhQmSq96oQI/QuiwmJhcwsqOY7iQ0bz0fhjw5FuLc01LGSF6p3E+F/ed65IqtuU=
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by GV2PR08MB8124.eurprd08.prod.outlook.com (2603:10a6:150:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 13 Nov
 2023 09:18:33 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:18:33 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Topic: [OE-core] [PATCH v2] oeqa,ssh: Handle SSHCall timeout error code
Thread-Index: AQHaExoxwuvZPDi8gUikCMmnqxigdLB3/nsA
Date: Mon, 13 Nov 2023 09:18:33 +0000
Message-ID: <516F7265-433C-4ECC-AC55-1328F27DAC4B@arm.com>
References: <1795FB2C1C71F485.6123@lists.openembedded.org>
In-Reply-To: <1795FB2C1C71F485.6123@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM0PR08MB3745:EE_|GV2PR08MB8124:EE_|AMS0EPF000001AA:EE_|AS8PR08MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: d06bfd90-6aa1-4362-5e42-08dbe4298844
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F5fEGcXt+Ii0F4BaAHrj83i3J+5KkNenf1WUbIE2shJbzBxPOFYUmPzGgcnfW+DH/qJUu0WZr3ag6tg1MlEzOCqwAjaEEfOOcAOTSAIVjY02AUNk2YXYQeyOcHSwm4CdfKfNuAoH0E7BBCVt60HKpJSbew7Y9293Of5uE1VbbyRLVu/69CStUyNOPmd4lEGYNlYxKJ0RVbk8X0sgI4qbJKNymDV8ulV7kgXFT/a02rsLJ9Hopq6uTG3kOpwSSUgIFVz3FyZV6Ho3+C0h4rrn3zjR9zkLNm702IY8NM1zNDUZWvpz3htUSW6qcLWJ20WaGIKNhby5/TS7XZ1/hfToOtT7xGLrw5TJto67vYlvYJ1ptZO5xDysXap7qf30zE+YnBcHchOfXvfPuS69QsNWUr3Ya8Zaa28ol14yTWuEhoBLvz1BEhbvL0eCZB4q0aPpp6cARFQ2MDILFcp4QE24cB+C3kAYm2RD6kSDnqHNvUE+zTCBJrrJjTGMIEfQOsBm3Bd05MXyPp3FHfzHXQRBLogDQjdATDOPlQxxofrO2ZI9p9vo+h7Fr7i9AUtDORK1keR4VTEH7jxUkBQZRQeDuVGxZNpKWgLuxxMvp1oy8AQHaYNEWH52/79dy9hB16s9XT+yD2u4++izxlBsSO2WLA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(41300700001)(6486002)(478600001)(6506007)(53546011)(76116006)(966005)(6512007)(71200400001)(8936002)(54906003)(66946007)(91956017)(316002)(5660300002)(64756008)(2906002)(26005)(8676002)(6916009)(66446008)(66476007)(66556008)(2616005)(38100700002)(122000001)(4326008)(86362001)(38070700009)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D2F556D1FCD241458DCD06D82FC7A9C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8124
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2b09705-092c-4f9e-b251-08dbe4298266
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G96J1VxRA9x0M5MZr11jaeCtFUZ1kcU0vphUjznkeTHc3n0FO1Lv6efidX9BKfdt2kj4QAq8enexKhOFOa2YpBZ+DUW0ZzFrGcEhjXd44++U41nSOv06aFwXOVyLyH8r0DVEFI5PbvA9w8GuQqAtLIDxghWl0xqcOxoC+5Feb+/IX3jXIQ+X/OGN20UVUre1rz5DPLKoFArvsCV3+da8g/V8AOuAE9zccenowhmkTW7nuLgw7gFETkum5yxPvXveJGZqvoVA4xZpRqyZzOyNaJMweY5p4ct7ahTpRyBinNpe+xv+FKjz86tFZ6HYOQBYW/yxKlhimTBoXqhhd5AAqgl7e2Qlh74akX41y0/nYNc7BGY0M0J643AEjQndMGpLLpdpU+6LqvsXyg181Xs3DsFTUqBuxC4g/GkJ7YnRLUbUD1fz3ZND8O5d0TTYebrl4IeG+28cC3D1rDINq+O17IGbdaS9ts1g2Ue8zOKUvFEdKf/lDS2GTdgXDkHaaY+ZO0nQm+jTHz391towNX7gMZDDrXxVeFwD32zvZirQ0IBIF90eEdhqFcEd5X+MLURI3TT9BGNaS+hxqEetJxptl5Btn4JHjJ7UJyc//XDsC84t1xhJ51Nd4VO6V7DTJz/r5Hm+lBUEgL0809b3mDiGc2s9zgj5jHsX2x/wSlO9Sm1D2Mw/nP5w3Jb6w7L0mT1Ju7ulh3fkLD6UCMwivshavoB/xXIP597e+KJNC1vs8FI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(2906002)(40460700003)(356005)(81166007)(8936002)(8676002)(4326008)(5660300002)(82740400003)(33656002)(41300700001)(86362001)(966005)(6486002)(478600001)(6506007)(53546011)(36860700001)(36756003)(336012)(26005)(47076005)(6512007)(2616005)(316002)(40480700001)(6916009)(70586007)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:18:43.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06bfd90-6aa1-4362-5e42-08dbe4298844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 09:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190462

Hi all,

> On 9 Nov 2023, at 14:36, luca fancellu via lists.openembedded.org <luca.f=
ancellu=3Darm.com@lists.openembedded.org> wrote:
>=20
> The current code in ssh.py is terminating the ssh process that
> does not finish its computation in a given timeout (when timeout
> is passed), the SSHCall function is returning the process error
> code.
>=20
> The Openssl ssh before version 8.6_p1 is returning 0 when it is
> terminated, from commit 8a9520836e71830f4fccca066dba73fea3d16bda
> onwards (version >=3D 8.6_p1) ssh is returning 255 instead.
>=20
> So for version of ssh older than 8.6_p1 when the SSHCall time out,
> the return code will be 0, meaning success, which is wrong.
>=20
> Fix this issue checking if the process has timeout (hence it's been
> terminated) and checking if the returned code is 0, in that case
> set it to 255 to advertise that an error occurred.
>=20
> Add a test case excercising the timeout in the SSHTest, test_ssh
> test function.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

I see this one has been merged in master:
https://git.yoctoproject.org/poky/commit/?id=3D0f25c8aa775001166a03b8b215b7=
b9ab80ef4f9e

Is it possible to backport this fix also to mickledore? Or should I send a =
patch with [mickledore] tag?

Cheers,
Luca



