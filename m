Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D556CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:25:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.59])
 by mx.groups.io with SMTP id smtpd.web10.22430.1694517944178367534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ukc/zys2;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ukc/zys2;
 spf=pass (domain: arm.com, ip: 40.107.247.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x8WbBEuQguufSJHD5a50C6Wzox+O+Fbizc3pAe5Oys=;
 b=ukc/zys2fkeH1wkkqUTyVOiKmMVyvUERamltF7JLZP5cth+R55tz7W4McG0OhLUoTk3dJlXfDJRFzmdsyDfphiY09Un9IUhwjEjB+y8msq+od1ptZ2ZJkGCHO0t8/AlGAgCzRCGwpfZpdPl6cmDx7+NlvtpYf2uFhlX166zcndo=
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by GVXPR08MB7775.eurprd08.prod.outlook.com (2603:10a6:150:6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 11:25:38 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::4f) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 11:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 11:25:37 +0000
Received: ("Tessian outbound d084e965c4eb:v175"); Tue, 12 Sep 2023 11:25:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28b82f01f118daf8
X-CR-MTA-TID: 64aa7808
Received: from 03a5fd73f7b3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 178F3AEE-7170-40F8-85EB-35B6018F8657.1;
	Tue, 12 Sep 2023 11:25:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03a5fd73f7b3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Sep 2023 11:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbjnCen3EzIcQQBCdDFgj9vfktc6iMaWwd763gpkkrybRo+jF3Vw5xll9DSDO3fzgRfHqv5avOLZOn4iwBxqQSIDxMtfpxKpAu8FT6woHOmg7pJrtkvMW67imdDNs0L/JfrCK51rTFLdrzdSZpIBIHu1i7TxKn1UB94kYGREl5OZzdB2KFUDxhUnoMk7BACEUXmO6cJgcHuRRQ0qAgRyuFN2fbAwvzl/lIDf8CFQ8vn+nt1uon8SvYnK24HeRXh2RSOB5lhN1+k3h27KeWiHmKee7ke/JDaloLSCFXHvFSA+wgxyI7CWquxG58PXzg/K9GjykXjYbh1RM1FC24xWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x8WbBEuQguufSJHD5a50C6Wzox+O+Fbizc3pAe5Oys=;
 b=f/mM7h3vwKyH51+HPPSibXkVCOzp0er5yWaD3fgO1fI+MKahqpzV4PW6mXFizPZrR3PoS/OWegu6UBY+Cmp0J3jbnMmePHQ+LflxDc0f7v3I0KVFCa/ZVEGivGbJKNHyY2zfoX7vfGoxd3qlYquGtSmX9OErRc/CRN9+tGrxso9XeXgu0/RRcs48vdMLg2yel5+9TJ9hMPWrtm6URm43tdPfryEMMikEe/eg2RYyz2yDKZ6hrpGVFRJUa6+nY0lJWTZ67AdbQXzslWn1J18Z1SGyK25fVSuKaLOppI+gRqmLxeEEAjmAq8HmM5pEZTJNsm8iv95hsAjclefabLZ6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x8WbBEuQguufSJHD5a50C6Wzox+O+Fbizc3pAe5Oys=;
 b=ukc/zys2fkeH1wkkqUTyVOiKmMVyvUERamltF7JLZP5cth+R55tz7W4McG0OhLUoTk3dJlXfDJRFzmdsyDfphiY09Un9IUhwjEjB+y8msq+od1ptZ2ZJkGCHO0t8/AlGAgCzRCGwpfZpdPl6cmDx7+NlvtpYf2uFhlX166zcndo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 11:25:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 11:25:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Thread-Topic: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Thread-Index: AQHZ1YiUk55g9HL4TUiP9Q2BFa5WnbAXLIwA
Date: Tue, 12 Sep 2023 11:25:28 +0000
Message-ID: <3E62B71C-8B13-47B3-BE0C-A8A1716680A3@arm.com>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-2-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5976:EE_|AM7EUR03FT014:EE_|GVXPR08MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 18422ec1-294a-4263-b819-08dbb382fd39
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OQ/zOgfgXR2SwateJvtZZ6PpgsvwttW9kJj+uL2BgremSAlM8hyNOPqJxGukqty8cg/A8PPCo5rTtSes/MRX509BCd8ENp0/YDkU2xN/9twyYhnAX6B3hgMgosVQhl/7tkIiU74KFL0Y1e5gNY8hecpego0VtzpA6pRoSxtI/pVEDfP4cnQ/Su86cDO3viwwfdFlENftinODbhuw2M5S1xFPvVPJd1JC61NSdXNJKyUVqeAMttRuoMzeRFdFTwK/PTseAwMSIvSpTgvUkxUdzp9HuczrUPM7fxMMTZS8dMUMJsE2CYWI05DlyI7mTQtZlmu+lKIkoccqoGglbBOZuEOG3sY1kVRP1XUELdFdLD7IrV/lPVHzXzeYfn2UCOoZFBQ49egYHER51jdCx64exYq3agq6z7fUFX3nPaggvsJf9slEOfS+29fdmMYkW7gd1kgeN5wnYlA4TqMegssEHrL5YkTkFi9QDPXu17MNCbhH26KEEA0Gfwv7FlWJZ0vspsH92ILgzzmt0WgWv60IQLQvBfBV4M/kYIyj75/NZBaygMgfoHwZnG3jeO6YZp7uFs46i1Lhx2vp45EdYo8HMllICitvWOqWCphkRkOPmOUaG0hdAv7vmzov75WjPp6gA/g4Xm+RxUDOHcM6742/0w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199024)(186009)(1800799009)(86362001)(558084003)(5660300002)(8936002)(8676002)(2906002)(4326008)(33656002)(36756003)(26005)(6512007)(6486002)(71200400001)(53546011)(6506007)(478600001)(2616005)(38100700002)(38070700005)(122000001)(66556008)(41300700001)(76116006)(91956017)(66946007)(66446008)(66476007)(316002)(6916009)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF149CA0B9A0B242A1EBBB64C76C6F6B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	596073e3-ba54-44b9-b448-08dbb382f7d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Wes3GSD5/ETxhgmlVqCpx5vWx0IjKfYV3g0OhrE0O2RKbNqftYvHYWurs/wq823qLpr0fXesLKSIA7YBknnalmH2xl77Z2DYstmwJRhOUZMAHkWUc5GRtmO76u5ew8OXwF549NfNgPBFAzipS6CqErd3HH6OQ3IUslFjmjQEqldw9KecqsC4CuWosQ36QwL5eKarl5+Gj0qYUutpSLMRSQoEba/LxAOyfuj/OPwDmurrpyGC44cj3X++5axFMr3iOX0CYgHjpI6W/H/8W9IK0I55BkbN4urazFKOlWhUJ7ad1kxRwf+z4MrY0TJPWotCdQi0IWcKIKGt0GPGOFjX2yB+6fZ9WrkM29Hp6XcAIVcr2Uzygt036/rU/CemEV9uLWe/MPo+Aa5jINGXbuMALugCey/PMFrTulKsZCgW2c6wLTbguVorBR4IeKabcZm2Kcxkbpo5oZY0jNmQxgLWyWvk43OjrjGJbPl1li+dReJYUqRsI9XXSQiZzNY7AMflaUlmrn5YmMCFyg+6NLdBJ6Ti5wuMo/MDmug+5H6ULFBG4+/cXTCmydEkNnsSFRvvsC2jwgrDs9J5+ijPgcjSM2j9CNwnrB1VJdxoGX2BZ5WNZNQUr4rDSivRWSPhBvnnZ15e11Q5/hEirZytRbBCq4YX5ADC8AIkHBgR+aSBFpmdHG7V4vLT19gI6YYk4Gjv36iPNAkrj59+oTCPX9ZPF/3R2fKZNUFQNkaDghAz+AkWsDgEyVOxiLtw17jpjdQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(26005)(6512007)(53546011)(82740400003)(81166007)(356005)(2616005)(86362001)(6486002)(6506007)(36860700001)(47076005)(336012)(40480700001)(5660300002)(40460700003)(8676002)(36756003)(478600001)(70206006)(6862004)(316002)(41300700001)(2906002)(70586007)(33656002)(8936002)(4744005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 11:25:37.7970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18422ec1-294a-4263-b819-08dbb382fd39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187504

On 23 Aug 2023, at 07:10, Mikko Rapeli via lists.openembedded.org <mikko.ra=
peli=3Dlinaro.org@lists.openembedded.org> wrote:
> -    if d.getVar("QEMU_USE_SLIRP"):
> +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARA=
MS', 'slirp', True, False, d):
>         slirp =3D True

This means we can remove the QEMU_USE_SLIRP variable too, right?

Ross=

