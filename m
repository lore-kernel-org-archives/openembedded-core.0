Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B1DEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 11:16:26 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.89])
 by mx.groups.io with SMTP id smtpd.web10.11329.1689765377774025683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZGrAqOkV;
 spf=pass (domain: arm.com, ip: 40.107.249.89, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwHqfeW9/iD7OmpiVlJ2ZVO50/50HKZKVY4Mo7QmWMA=;
 b=ZGrAqOkVYM/IzjCOh9i6htHjWldWYwweCesWunjMbCZKyqsXJQULZ9VuLe3iz8TTogTY0ut9jxx73LPYI4Y/QOhWrmfdlez0+5kqPvmz4cwsTrw7Q0Tk5mpf1OvvMggy1Bb4V0JheNlANJjoViib+t/gnt1fLcpca1S9fqbCvvY=
Received: from DUZPR01CA0253.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::7) by DBAPR08MB5751.eurprd08.prod.outlook.com
 (2603:10a6:10:1a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 11:16:12 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::85) by DUZPR01CA0253.outlook.office365.com
 (2603:10a6:10:4b5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24 via Frontend
 Transport; Wed, 19 Jul 2023 11:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Wed, 19 Jul 2023 11:16:12 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Wed, 19 Jul 2023 11:16:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81bdb52e27f6928b
X-CR-MTA-TID: 64aa7808
Received: from 1d0a72e52583.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0AB1AB43-1569-4784-A8BE-01D03308E21C.1;
	Wed, 19 Jul 2023 11:16:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d0a72e52583.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jul 2023 11:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWCPhY2durIprQBh9P6UW3sFfVnMUbunL7wDQoai6hyXHAx4BttRzCI4OB500T9DOjjkJYyVBZ7HP48PQo5kw7vPWTJwdpgC7Tlo2u0/idGV6lpu6QIpX1e/DLP61wgYuQSXZF9MXmoMGjEFnign+8YyUGXtP9I0q8dKvd6zSoU4kUcoG+gGrOE5Sty/n7dhZHlCGomg2xLh5nDzg17BXhBrjGrr5y2axfntqUsYbp/ZU0WWFSBiymnJ8Y69DSvLN33uGETxbxujmfsGG+dclSruAnfX2/5fxGPXiClekDRABm/wYdLEgvqokuu7e33aaj0PkQ9YsOCYV6xew6cd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwHqfeW9/iD7OmpiVlJ2ZVO50/50HKZKVY4Mo7QmWMA=;
 b=Wo+/SmYUM8aCxytwWJGSsUdohe1T5pR3ucW++XQAgmPjOr5VKxJFqv2azYv3TjU4DVZ8cC+TvBetGNi8g0VLXErOfqtjAerkgOf1xgteWdFHTXqyoCTxZoVb880gY2/7V3yh9eIAVGjwbkKVwYsYw31Q19Vi+0Iqr0/7hWbp2s10B0OWSIpPpJK97v4O9vkTUxQbm0v0GRhS22LmbZ9e4xsGj/i47Pp4RXfZ3VCe33zE4jg2qofIVaLNwYx3gMrwGe3gUZm6Nh/GWnzMW6PvWFK11UEa5rMZ1hVp6qvFR1SkMgweEEoxJy139O66Q1IpB0omN+/GO9YU+goIeAzXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwHqfeW9/iD7OmpiVlJ2ZVO50/50HKZKVY4Mo7QmWMA=;
 b=ZGrAqOkVYM/IzjCOh9i6htHjWldWYwweCesWunjMbCZKyqsXJQULZ9VuLe3iz8TTogTY0ut9jxx73LPYI4Y/QOhWrmfdlez0+5kqPvmz4cwsTrw7Q0Tk5mpf1OvvMggy1Bb4V0JheNlANJjoViib+t/gnt1fLcpca1S9fqbCvvY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 11:16:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::67ae:749a:f0aa:f239%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 11:16:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Index: AQHZpcQwa7DC32i+xkS2T62IbzZTSa/BC4YAgAAH3YCAAAXWAA==
Date: Wed, 19 Jul 2023 11:16:02 +0000
Message-ID: <1B3C5AD0-9492-4319-9409-DFB59F587E9F@arm.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
 <20230623111459.97933-2-andrej.valek@siemens.com>
 <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
 <ca87e264250af926f1cf3a2463e3213436c515bd.camel@linuxfoundation.org>
In-Reply-To: 
 <ca87e264250af926f1cf3a2463e3213436c515bd.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8651:EE_|DBAEUR03FT037:EE_|DBAPR08MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 04aee657-8444-4299-6440-08db88498f8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4iGCPOU9CRMh1brMvXq8A3QZnzZH5HtiQoQkyaO9lPpD6KJphj1MsNLY0fHml7bTKPXpeJ5aZgLJeF+Z45ZhIaT+hWIS65A1QZQnoLzp9GqzBji53xzkLQEzm+TXfCxcL6ycAgadOF9HZgEJkEECaIhSpyPZi79+0ik4TVSkSDQCYTveBbrSVv0SvznjDT5OJCIVKDSUuXrQpOJEya6WekDEBMxetAzl1KyRbRR3ctd5zNwnuZ3dLIaZdHS/JAl1pPv/jkeyaGgRCmVp8IeSbrs6IrzLxAJEsOC3omtJaNOQzQ4X+yywYuQsaa4G1EAZG6EBn3JaIqgOKWY9ePkRJEtnLCgLNr1dmQiqxmKAjlTEgSNFCyZFfzeBEf12wRK2F9+xp1z8KkEfUNqjtIZD1YsTV+2t74aTauw6oEH/VYacX/9gCdXIxuxB3W61h4g5FDA/utD60wSE00BnfZbyiEDGYZU+WBSFIqFhE7G6qxUJnBya9CcvY/SX2YvwKiXrtmvUma0lPOqUG+zXKezd8GGXX0hQJwDqjQWeLWIp/blQjH6rKikcpVuFn9dSOS7hOyHDcWV0z6IG/+xK9DrnUG3++zx5cHbTHZwGsc0hmx0z0ql6XeeR9BDpG59AHC9uWvPZ/u7Qof8knBet3skHJg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(53546011)(6506007)(36756003)(26005)(186003)(6512007)(38100700002)(122000001)(33656002)(5660300002)(6486002)(71200400001)(4744005)(2616005)(478600001)(4326008)(66946007)(6916009)(66476007)(66556008)(76116006)(316002)(91956017)(38070700005)(86362001)(41300700001)(54906003)(8676002)(8936002)(2906002)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B3A711D15B1CD4CA6324F06049BACE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8651
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8885f02-85fe-409f-a7ae-08db8849899e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IazqtT3kmutxiGl1F80jHxFaW+xheEIjksFfUC4fqBvBvOyHlRic76F7atI+3+7YzfABb6crquWBZxJ1bSmkQl8I79QOtfv71i6X8QzN8cJ7nCNg2E/IBhYr9UtYirOCkgLcNgc9zU8yt2QMxaTneKtxVoqAuY2eDuy1yZqR6zu2dWnMk1xAo/vMX/6bOfMfm8QwtF6G55bcNVtojKr/Ep+YGRZGhzrhYmBujXRL6AEFA2ocYRz4DlxB5h6lKZ6dOWat5xDNpciPTIFwZN5yphDepwUQHDSfOAczvxrrIX6lQyHsV5g297Pl7bQqLvSL5/7bjlFSBQKnXaCK9Rsb9s+3hmzLV/OdhlWPxYWFnieJvg6HvNxuZwDUPeWTBDUILaWJCo+XvEb9s5KBpL5bx2A1fCrTBAZzt/XzOAlkBTtQn9Z8Efr6SgyfyXCoRXavrFsYeTvjtU73lQ2J4JNO+uAE5ORhAmgcDZAgGZQ2Drk+xsodEB1SRqFgDprwsheL+8aAfqlxXeh4lV2F+Fh7z38TIz/QtEcIt/XiQ83OcwehKuaXXgUawJf1ffkiHhZl4Dqv7L7WjpDnsCXK6OjBQKU+YI213wcibgBA19/Z0LhtX+GXTxddfFpmRMnTkFHpuC0s/5Tykx7rmUZ8NbN/TT263ugDCjN6VpIUMVAdu16YvGB5q1DOpsr7bfxrG4WWF867QwY7+SuM9sCsl9zzelU3Q+PHglc1pbk1DI0whYoT2Tsts4FBcwWk73TbRmQn
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(53546011)(40460700003)(6486002)(6506007)(36756003)(6512007)(26005)(36860700001)(47076005)(2616005)(336012)(86362001)(356005)(33656002)(82740400003)(186003)(81166007)(40480700001)(8936002)(41300700001)(4744005)(6862004)(8676002)(2906002)(478600001)(5660300002)(4326008)(70586007)(70206006)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 11:16:12.5520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04aee657-8444-4299-6440-08db88498f8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 11:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184578

On 19 Jul 2023, at 11:54, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
>=20
> On Wed, 2023-07-19 at 10:26 +0000, Valek, Andrej wrote:
>> Hello,
>>=20
>> I would like to ask, what's the status here?
>=20
> I've asked for some people to help review it and I'm waiting on their
> feedback. FWIW they did promise "this morning" yesterday so they have
> around 6 minutes!

I suspect I was that person :). I have no major objections to the patch now=
.

Cheers,
Ross=

