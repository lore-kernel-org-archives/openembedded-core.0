Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97113C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 10:40:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web12.4769.1665398434899688108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 03:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=XSY/NZPV;
 spf=pass (domain: arm.com, ip: 40.107.22.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gzpO9alYgS53u/Yk0AzK5Z8HowcGpp81QM9TNe1610/OcXhxwfmud28HkE2K4PemNz0Wi2gHLkDgesuxUdb8532O4DHDkKvV6SmkAxjLlqzlsM5U+GGpeL8/RN+tjcQX7oc2ymECdoEl4HW5Bk3DgVb6d699726G1Wx72H1Xe3xTDClzQvG/CZzWOhUdzVXNXdew1Fczk/XnLmpLoHZxclIX6L435XfAtWJOKu5cqT+Rj+ffN3mBbVSUfIb/p+PvEBroyaLdVoGof/tuzXkZ/+vrcc4lZUk5Ld4cA9s8R5Fy50Fzh8GIfwd7FyZzgXILML+vAiG0dk6x32TyNAvI+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnpB3PPLqXNt8xj/14Vx2cQjxZoDhil4cWbgFZIhvXo=;
 b=j+vvftt/lKusfEUJJoGQFvCNr9AbnTCCuEkn8cPY29CYDu8woAD1pUxFvWsUvEmNuoFHvXCJoyNRz9PTk6EIFzLST+7JDaQpmrwRU7kculRMjVT4SSNZIBnGj/DJQGXGSlfzQICLjll83IBirXMtH42bGGAwPq6wO0qhGahndu58EoFdnVbiKZDSS9kuf3enOPazGPBZL4jyub0t1spT6jw3zh3G712CYWsq4u4mNyxie036L75o7GmJO5tC5taQz88XN/PEZ4G7cvk6azuonhBjnc4WCe7Xyk7KUmOvYFLy4HXqV3N/i7kv8U0LyxulwN/C/iMGsWMrkqXYxpIoDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnpB3PPLqXNt8xj/14Vx2cQjxZoDhil4cWbgFZIhvXo=;
 b=XSY/NZPVv+h8ehpiJKnEKE2obPM2oJsWGNr+ufbv34EXNcCExGPpub6JygyUFXVrmR/owUM9G9FWMWABuTr34Wi/PCmPdwcEs4OiRJnLlcjCZ2EW6nRcVb+SIGnOGhaMCnjI59BKwyUHWIL1axXSXw3xfeMgeU8qk63ELxpC2yU=
Received: from AM0PR06CA0099.eurprd06.prod.outlook.com (2603:10a6:208:fa::40)
 by DBBPR08MB6297.eurprd08.prod.outlook.com (2603:10a6:10:20b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Mon, 10 Oct
 2022 10:40:31 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::6f) by AM0PR06CA0099.outlook.office365.com
 (2603:10a6:208:fa::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 10:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 10:40:30 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Mon, 10 Oct 2022 10:40:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f78e15c3578fb7d4
X-CR-MTA-TID: 64aa7808
Received: from 0d5828f5e05d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A3C5F5D-F1CE-4B91-B797-A95DF385DDDE.1;
	Mon, 10 Oct 2022 10:40:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0d5828f5e05d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Oct 2022 10:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLsnpxcqzdSzuYQ8aXmwhbQxF4fwZaNGLesRmr3sQxU5PPN+bI1HtrlWJyaQIR3Ob7I3somRNhRVf1KtdtB8gtIt30QXl3WDPcSUCERS4DHS+QAfzW9VSNf0KQMDXT0J1uVJFfOlBI0sGAzOrc8KplzpR5kebcJG7EAYaFYxw1pkLsn6rRSqUJx4sVcunTkhEFN3QAKko5pthgxDREhrZStnfTyGN9tjcVwa5+Jx4CElAqThD4P3ERaj6WLjXlOQsWdV0V0zYZo7Jaw8SFUz3RVAtfvxg7vG924jSyNo8H9pI1EUTHKw5cRdCv3Iou6fY6RcdE5R+1njt4ssXYf80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnpB3PPLqXNt8xj/14Vx2cQjxZoDhil4cWbgFZIhvXo=;
 b=gPSGy7VR/AD7Q8PPaE7YhVQTfGjelNmvKRVLpSizIuRpS3cBDvl2Oqq6cdeZGYIlueSAy3yRKLHbY0T9AJgtSnCNSK1gGpd1IWwzmS3B2VFnqEqYmuTSMA52bteKJu32h2U43fOSTDjbFMzU6D8Sjz9hVD1jdu/FFPXXSkDZAmAOp/CE5/iTmyjrgoRmUoeg6oymb7Gag7+UdLfZpS8r24fBKo+E0z5GbugtWHUr3WLSsDH5ih+5qsPZrIdxhUnj7hio5VSoc1DJ7vMKXo31QBCV+nNh9KM1jTiEdJdK01HTG0D4v3dOutRXH3cosPXDCxKxf6s5JSz1ZqXsTOnR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnpB3PPLqXNt8xj/14Vx2cQjxZoDhil4cWbgFZIhvXo=;
 b=XSY/NZPVv+h8ehpiJKnEKE2obPM2oJsWGNr+ufbv34EXNcCExGPpub6JygyUFXVrmR/owUM9G9FWMWABuTr34Wi/PCmPdwcEs4OiRJnLlcjCZ2EW6nRcVb+SIGnOGhaMCnjI59BKwyUHWIL1axXSXw3xfeMgeU8qk63ELxpC2yU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 10:40:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Mon, 10 Oct 2022
 10:40:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Daiane Angolini
	<angolini@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	"paul.eggleton@linux.microsoft.com" <paul.eggleton@linux.microsoft.com>
Subject: Re: [OE-core] How is 'devtool sdk-install' supposed to work?
Thread-Topic: [OE-core] How is 'devtool sdk-install' supposed to work?
Thread-Index: AQHY3Blq7d8/JlWQVkWdOPBB+pigtK4Hb86AgAABXwA=
Date: Mon, 10 Oct 2022 10:40:18 +0000
Message-ID: <AC217A27-4056-4BA7-8180-593E75E8A8D6@arm.com>
References: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
 <B4C207D2-A37B-4CA5-A418-DD1387741263@arm.com>
In-Reply-To: <B4C207D2-A37B-4CA5-A418-DD1387741263@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8129:EE_|VE1EUR03FT023:EE_|DBBPR08MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: bd52027a-60ec-4575-c029-08daaaabda81
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hMapVevNajofNP/E1Ee20Ud9zp2kWlfDgLZ14IwC6jBn8MewBe3CSdZp5Q81103KXnLi4mBJSgUltV2oTBaCtLL4LmDuS+EWce97FC1h36LpU527V3OjRthk2TOWQAnbhk/lT7dBE77NIH9BZH5zPBYRjtL4bHvBLY7AqS/dXClSvrLdw43xXvR48o04gCejW3kW5FeTjC7X1ulSDsrNE5YcaWSa8WL4v51Cdk9C0o2wXZqcnlXDpTowV2Uv3y1uJX+2BKPI7fevyovcN1Ud2YYWvtW5qvyfSPfNd8gR9EetLVieCP2qzr6TJCeEOpufPddvIiNQ2nQ/RZ3C/vxzLSSLD64JoW6b0d1VKglgttHKls5D0TZij/1ETFnuDe9aEd5imt0HM2nIs+ONN1xDnLfmbH7rfVqHzPUxddvDFWPgInJ0H3yuKbIWV8+1gAGU0+Fc2b8welLpr3148CPc7XT+nOCMW2MtGdYxUza0Zy+vow59I9+x2DLG8cqTs22f1kPvfYIYjz/zEHw08rY6Osk7HG+NWKdyHVWAIxdoGOWC9VWwejhHFo1hOeWfJe5NFZHj3BtQywaPjGx/cRz9CisFVZLGcLSDE0+7dBgxPgvdQXrMN+lqmzrme85pKsVZuvYrOAGFIJnft2sFtnU9i4O+AgTalKhAqBfOiZpjUuy09ioXJqaCdfnpenTP7qNa9lOKAz18edvfe5EBKtVRV4kOO+BvsQ5kNusL137Y75gI7PtNoiB2ngkfiS+mqOyfFgXORcBSqvk4v35+mXQX1Y0ClI+jRJuMnBKdg2Q/g6XJE3pYUBiA1qipSgS8bfPxdLMm7zRaKreyK6MMWMPqJA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(83380400001)(6506007)(2616005)(53546011)(122000001)(186003)(41300700001)(86362001)(33656002)(5660300002)(2906002)(8936002)(91956017)(4326008)(6486002)(71200400001)(6512007)(26005)(36756003)(38070700005)(66446008)(64756008)(316002)(8676002)(54906003)(966005)(66476007)(6916009)(76116006)(66556008)(38100700002)(478600001)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EB005FEB1710948B62188907C9C93E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87df6f1b-0592-4524-d6b1-08daaaabd365
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wQAqs2P1OcugiC/5dtIzK6Wtm8VU6vI1SCOcB325Wfz+n8NkkXFydTUEIPvS1VyugpA9YpcRguSYlQX6svlsTu6Y6bdu9g67gp8AJoeWorrKg1mWM5KyhZrJKgPumL2guEoUYhoAPUIfkPb1CAQAskxCw10+vQ+s1YStpISOa173dF3UVKy5L+FLp9qHGtdwXJ2btN5G/d0A4tajKlUKMcEnwEnWmkjWNTC7zLWsIVwiQj+0FiFavcWBHwJy5q9gsXFJZGWK1ZS6VOZ6AIdNrolEs4KlycP7WWOAZncwFQV2360HV6EMV2GI7W8lJk3KIyrBNcd66D3sSI6fWZAWdFKH33w8FuUh4jF51550dgBHPJF3VNaqvejsgaZ8jbBRU3zAGz99hlZhAIPmltUNsZ3gydlNKynmtethX8mN0xHhO3GrvJE7OEBT+z6r52D1z9SMFzoKpfsAvl8ZBCRge1vZItiCeQWszzPKX/0j6DRlq7X4c5JysQNvT8hARubcMvV8f3CpQSy416B5/LX00+RDCeLgQ8DFg97Q1xIQfRGxqzdZkaLNzEzhcjRKxi4LPeNqGPlrvx76x6Ram0G8tXbofrJF+QcYdovuaIelWaM+kVDCF9hP/RZjwiRI2BawdRuWQ8B8fe4uuQRZoOnLtFGbD2i8q3JnhXQBnRoI8qiA5a88UdZnEbnCBvGDwPe7tmsEDTgGWTEPa3iIGp4W5g2F9sJiGmEHfJREfkoj1okEVVS95Vk836Mu4/8BpsQTXBJPwgxIP1HPJcfN0Xgm9CfIxeSMbkJ/vXcG0KKu/so=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(336012)(41300700001)(83380400001)(40460700003)(36756003)(107886003)(82740400003)(5660300002)(8936002)(40480700001)(86362001)(356005)(81166007)(6486002)(33656002)(478600001)(6506007)(6862004)(53546011)(8676002)(316002)(70586007)(82310400005)(54906003)(6512007)(36860700001)(2906002)(186003)(4326008)(26005)(47076005)(70206006)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:40:30.7344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd52027a-60ec-4575-c029-08daaaabda81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6297
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 10:40:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171573

RmlsZWQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0x
NDkyNC4NCg0KUm9zcw0KDQo+IE9uIDEwIE9jdCAyMDIyLCBhdCAxMTozNSwgUm9zcyBCdXJ0b24g
PFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPiANCj4gQ29weWluZyBpbiBQYXVsIGFzIGhl
IHdhcyBpbnZvbHZlZCBpbiB0aGlzIGNvZGUgc28gbWlnaHQgaGF2ZSBzb21lIHRob3VnaHRz4oCm
DQo+IA0KPiBPbiA5IE9jdCAyMDIyLCBhdCAyMDo1NywgT3RhdmlvIFNhbHZhZG9yIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxvdGF2aW8uc2FsdmFkb3I9b3NzeXN0ZW1zLmNvbS5ickBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gSGVsbG8gYWxsLA0KPj4gDQo+PiBE
YWlhbmUgYW5kIEkgYXJlIHdvcmtpbmcgb24gdGhlIDNyZCBlZGl0aW9uIG9mIG91ciBZb2N0byBQ
cm9qZWN0IGJvb2sgYW5kIG5vdyB3b3JraW5nIG9uIHRoZSBjaGFwdGVyIHdoZXJlIHdlJ2QgbGlr
ZSB0byBjb3ZlciB0aGUgZVNESyB1c2UgYmV0dGVyLiBXZSBhcmUgbGlrZWx5IG1pc3Npbmcgc29t
ZXRoaW5nIG9idmlvdXMsIGJ1dCBpdCBpcyBiZXR0ZXIgdG8gYXNrIGlmIHdlIGNhbid0IGZpZ3Vy
ZSBpdCBvdXQuDQo+PiANCj4+IEhvdyBpcyAnZGV2dG9vbCBzZGstaW5zdGFsbCcgc3VwcG9zZWQg
dG8gd29yaz8NCj4+IA0KPj4gV2UgdXNlZCB0aGUgJ2RldnRvb2wgc2RrLWluc3RhbGwgLXMgbGli
cG5nJyBjb21tYW5kLCBhbmQgdGhlIGJ1aWxkIHN1Y2NlZWRlZCwgYnV0IHRoZSBwYWNrYWdlIGRp
ZG4ndCBpbnN0YWxsLiBUaGUgZXJyb3IgaXM6DQo+PiANCj4+IEVSUk9SOiBGYWlsZWQgdG8gaW5z
dGFsbCBsaWJwbmcgLSB1bmF2YWlsYWJsZQ0KPiANCj4gWWVhaCwgSSBqdXN0IGhpdCB0aGF0IHRv
by4NCj4gDQo+IEkgd29uZGVyIGlmIHRoZSBoYXNoIGVxdWl2IGJyb2tlIHNvbWV0aGluZ+KApg0K
PiANCj4gSW50ZXJlc3RpbmdseSwgdGhlIGVTREsgdGVzdHMgdXNlIHRoYXQsIHNvIGVpdGhlciB0
aGV54oCZcmUgZG9pbmcgc29tZXRoaW5nIHNwZWNpYWwsIG9yIHRoZXnigJlyZSBub3QgYWN0dWFs
bHkgcnVubmluZy4gIEl0IG1heSBiZSB0aGUgbGF0dGVyLg0KPiANCj4gSXQgbG9va3MgbGlrZSBz
b21lIG9mIHRoZSBzc3RhdGUgaXMgbWlzc2luZyBpbiB0aGUgZVNESy4gIEZvciBleGFtcGxlLCBj
b25mL2xvY2tlZC1zaWdzLmluYyBzYXlzOg0KPiANCj4gICAgbGlieG1sMjpkb19wYWNrYWdlX3dy
aXRlX3JwbTo3ODdmZThhYWJkMDAxMDEyMmM4YzIwNzBhYTBjNmUzZmFjMzk4OTU5NjNlMTk2MDBh
NDgyMjZhYjNlMmIxMzQ2DQo+IA0KPiBBbmQgaW5kZWVkLCB0aGlzIHNzdGF0ZSBleGlzdHM6DQo+
IA0KPiBzc3RhdGUtY2FjaGUvNzgvN2Yvc3N0YXRlOmxpYnhtbDI6Y29ydGV4YTU3LXBva3ktbGlu
dXg6Mi45LjE0OnIwOmNvcnRleGE1NzoxMDo3ODdmZThhYWJkMDAxMDEyMmM4YzIwNzBhYTBjNmUz
ZmFjMzk4OTU5NjNlMTk2MDBhNDgyMjZhYjNlMmIxMzQ2X3BhY2thZ2Vfd3JpdGVfcnBtLnRhci56
c3QNCj4gDQo+IEhvd2V2ZXIsIHRoZSBwb3B1bGF0ZS1zeXNyb290IHNzdGF0ZToNCj4gDQo+ICAg
IGxpYnhtbDI6ZG9fcG9wdWxhdGVfc3lzcm9vdDphMzdlYzcyNjg1ZDg0NzQwMmE4YTE4Yjc4MWY0
NTNhZDMwZjZhZmY3Mjg5MmU0NTdlMzY0NTYxNjM3MTRiYjgxDQo+IA0KPiBEb2VzIG5vdCBleGlz
dCBhdCBhbGwuDQo+IA0KPiBTbyBpdCBsb29rcyBsaWtlIHRoZSBlU0RLIGdlbmVyYXRpb24gaXMg
ZmFpbGluZy4gTWF5YmUgdGhpcyBpcyBhIGhhc2ggZXF1aXYgaXNzdWUgYW5kIHRoZSBlU0RLIGNv
cHkgb2YgdGhlIHNzdGF0ZSBpcyB1c2luZyB0aGUgd3JvbmcgaGFzaGVzPw0KPiANCj4gUm9zcw0K
DQo=

