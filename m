Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2A0EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 11:17:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web11.5126.1689074276768980602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 04:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eoe9GbU8;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcCyGdRTe4g5EbJ3pzofXGlmebPTk19RMXOOLOX81q8=;
 b=eoe9GbU8oqDoHKwkXpozShk5fSHGQex8o1Y7qOa7v2YccyOwbgs8rvPk/MgJS+SDduReimNCL3Lnr55XEhud7ggYJhm+1nrykddUCFqRJxy8c2t2Hbz9S391WNPcKsvzi4G36T2eXCtLVRBFWd5dX/1FFtG7WdV6Qbv0wIME2Zo=
Received: from DB8PR03CA0001.eurprd03.prod.outlook.com (2603:10a6:10:be::14)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 11:17:47 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::d3) by DB8PR03CA0001.outlook.office365.com
 (2603:10a6:10:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 11:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 11:17:47 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145"); Tue, 11 Jul 2023 11:17:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 94aeba4f3e845c64
X-CR-MTA-TID: 64aa7808
Received: from 572ab02d22cb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B33F3A64-59B6-439A-A02A-A891305F417B.1;
	Tue, 11 Jul 2023 11:17:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 572ab02d22cb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jul 2023 11:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m15ezDonq64q/ph06+R4nUAmRy/h3e+RaOeJhyWozS6nS2AXL7vS9ILfMvSI2X/YxJ7Raq1YFOW4P+udKBs3EWFrPA7xgKZRYLHQeeA9wFUQn4IKOchScYL4ObJbTS+LPdb6duVi7CcowTUA2rNULIQ95WEwm/Tca4EYO8mtZobO/ToFie6YWE/6YvcwAuE1P+fnDcRJ9jEpDGB9Hq/osoHB0Ohmlsuq9EF/jnhydkPtjxnEv8ClFvdKySvR/kIlxQvTEPIZbO+gPMBGEqXaFbAv52XZWuoN7+G8Qn+AvaHN4+voYyLVhx+sKtmPsB0dx/99pA1SWfYmS0FS94naUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcCyGdRTe4g5EbJ3pzofXGlmebPTk19RMXOOLOX81q8=;
 b=NiEOoxeXRakyPvIvz7J1eXkKHZiYLSk5fDQfeypCM+QnWtHzo0HXeVucHIrL9hBCKnbgA+N56wAjEIghPbNuYpysHxN6QeNCq48By58hRJg+8G4OLDYIhWge+EvZ8gNTcgNT3WT2H5/64tVivYvYXqMGmkExXCIXMkVqUy3dDmQvGFT6zzGC2vdLn9Qa+QhF6ivwQPtzbyGtMU/7F0LKZXLRrcF7OspfLNbQvuDnJrCSeKm3+sUMRqiYeXV4PgJRzDcOicLfSpdgZfRlglrRPrioFjl2wQGo3TYQFbVIeOve1DWLAF5OLGMRo+TTMe2fosChzk9X/bXZca8kswqLhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcCyGdRTe4g5EbJ3pzofXGlmebPTk19RMXOOLOX81q8=;
 b=eoe9GbU8oqDoHKwkXpozShk5fSHGQex8o1Y7qOa7v2YccyOwbgs8rvPk/MgJS+SDduReimNCL3Lnr55XEhud7ggYJhm+1nrykddUCFqRJxy8c2t2Hbz9S391WNPcKsvzi4G36T2eXCtLVRBFWd5dX/1FFtG7WdV6Qbv0wIME2Zo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9406.eurprd08.prod.outlook.com (2603:10a6:10:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 11:17:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 11:17:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 2/2]
 cve-update-nvd2-native: increase retry count
Thread-Topic: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 2/2]
 cve-update-nvd2-native: increase retry count
Thread-Index: AQHZs8JA+ICFvAOS8US69VuUaYqXqq+0awqA
Date: Tue, 11 Jul 2023 11:17:39 +0000
Message-ID: <A4D67F2A-877E-42E6-8843-4328749A6F9C@arm.com>
References: <20230711063629.7627-1-peter.marko@siemens.com>
 <20230711063629.7627-2-peter.marko@siemens.com>
In-Reply-To: <20230711063629.7627-2-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9406:EE_|DBAEUR03FT062:EE_|DB9PR08MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cc0229-b5bd-49f4-adbc-08db82007512
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 geAqBeSjl03NuHcLYFSlEs3rhe7y9zIsC7WnRqDr/B8jam4sUrSOSiLdLdGrB/711Ee33bZKDf79VgIAhpRGMZpQ2ouRiAj/z/I7Fmr3C2zi7SIEq/8wmPXBwI2JNtAAD5cfmvIUn9z03W+uYCJg/qOR5IInAB6DJe/bxZdYzk0DDbCCM6Mh61CooADkBC+x9kabHcUghfgceQ6u0MsAUQIMvewwNtPGO2M3X/4sixMpCx6JOPJOO3/I98jBpuOK7RHk4qFjjUobsqe7XCmT+2BpOJY0Aalk03RR3DFDY26ruxBqjs0D+oCoNIUZhrSGbnozo0jqaqmZl1kGnBancSnjpfaeTKEwUH4GaRKjMC7jE59C9/rAGuJPviryQzAEDl/CxjSiISuYuDIdQj8T/OTqEpmHrTxQ6qBxNjTLlUy4IEspGJRtXcYLNJY0bMHs1O5rCr05ErhYCB6iKNu8YE2O5YYroNdVkcqcsqHZnop6cTCNUoiFjfJLLR3lx7EcmtdANCXAA9CCmBKnL/hWrDlxmx739PmVIs2eeUFiy4qg/8kwSUXhHQHS4UNgPL5RJQuXaPZV32iY9xhtMpOvIvxNiBtMtfK5zRFoVD0O1SgzoSGI9Sk+w+21t00KiuBl7fky1viki1+R+L/gyGqxBEvioyxKIhWy47jCLbsZ0AI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(38070700005)(66899021)(36756003)(71200400001)(33656002)(6486002)(76116006)(91956017)(122000001)(6506007)(26005)(186003)(53546011)(966005)(6512007)(2616005)(5660300002)(66556008)(2906002)(316002)(15650500001)(66946007)(8936002)(66476007)(8676002)(83380400001)(64756008)(66446008)(4326008)(6916009)(478600001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <53F7698C35F23C4797D3A90A2491A930@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9406
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4afd0f6d-7640-4223-011c-08db8200701f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	88HIpye7ouUo9m+UCjQEkPFlCyIH0TMRZbvIW0gAWWpa7REIVRsCfrwxYZLewNf+eAyzv5j0/23h+BjF7945riHhbpP3jwbY9VsBg/NFcRq0MQqJsJgMgvXD3C0zdfJXRCr3/Rj2/EMovXcXTYsmuPnWYxczNp+CSojePFuX4JKM3wwjd80vxmZjKXi/cJfjyFp90hdJfPyupVRbxG9NRdcvbWG6KFrZht+YHdaD+/XQmXaPghzxMu09SrS+/HsEnFvSW8ekypyR8KK+/OheYHUprYyjEUhLT2EXevRTZgpGzDaV2CiOWPbrEwZesk4pdip0lsewbAXcbvEdFKOQHTWvcrKCyFm+sH9LXXOuExINlLaaVlrTK5XT8FWOu6glI9hBdGs31IJ39gcSKQQIj7q0MqFaDJkc1DWwa09qD58hQwLs+rW8EGkW5zTLUTMMfymN9I1NX32KHf02J5ffrSDTTvrfkSglfHcxjN3LZTZUIoHZ5OEU/c+y1P3+YKZ60roXqOQoMfveJL8rmpVJC93i+mO+iW0pXkPV3TmmcJ4qCwWc0cHBbsjaJlUvYRPhCUR7wPcB1LJsTAwei8Al1Z62rULzepU0pq6R4axg8X8IIlzp16+K/m+Qdy32SQq2ZLlDYAjFESHmXyuXrsacZXxOaKMWQOEgvkoKwtpptfEcqMw8CVs/asftL1pW97j2drnJ3lqmGZsxE75hAz3xmxcoYPW/MLjD+j5N0uH9j9qb6eQaxboe5+4/0lxpfWtb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(186003)(336012)(53546011)(6506007)(8936002)(8676002)(6862004)(66899021)(15650500001)(26005)(5660300002)(6486002)(40460700003)(41300700001)(86362001)(2616005)(40480700001)(81166007)(316002)(2906002)(82740400003)(4326008)(83380400001)(356005)(33656002)(6512007)(47076005)(70586007)(70206006)(36756003)(36860700001)(966005)(478600001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 11:17:47.8826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cc0229-b5bd-49f4-adbc-08db82007512
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184130

Horrible, but in my testing it works. Thanks Peter!

Ross

> On 11 Jul 2023, at 07:36, Peter Marko via lists.openembedded.org <peter.m=
arko=3Dsiemens.com@lists.openembedded.org> wrote:
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Current 503 errors seem to last several seconds.
> In most cases there are two errors and third request succeeds.
> However sometimes the outage takes more than time needed
> for two retries and third one also fails.
>=20
> Extend retry count from 3 to 5 to improve the probablity
> that the fetcher succeeds.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index a7392405e0..b3d0038c2f 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -129,7 +129,7 @@ def nvd_request_next(url, api_key, args):
>=20
>     full_request =3D url + '?' + data
>=20
> -    for attempt in range(3):
> +    for attempt in range(5):
>         try:
>             r =3D urllib.request.urlopen(full_request)
>=20
> --=20
> 2.30.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184116): https://lists.openembedded.org/g/openembedde=
d-core/message/184116
> Mute This Topic: https://lists.openembedded.org/mt/100074007/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


