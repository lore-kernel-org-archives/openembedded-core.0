Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7C3C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 10:38:01 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.61])
 by mx.groups.io with SMTP id smtpd.web10.33339.1702463877202874244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 02:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NmtghTQk;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NmtghTQk;
 spf=pass (domain: arm.com, ip: 40.107.241.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mKQdCQ0+bQ27M1ouWCjrLXG/sab1nZ/J/auj94KbeItRHFiz2zU3WnT6je6//dvUCNS1yauqPEl4ExHJLf9SLALLxI90BbDzV+6bC6eYTHQXuDkVu6q0ENYMmkJhXqnIUVnRaM+Aihx5D1qwmMwOak3XCJJZSVRrTE690HETHQVYY9Sn01IeXyBgaZeWZYrOkNPGL1eW+nQQrwRtrun0dfzISp4YJW+oe0TdNRSbe0ogOoO5G8myMk2kBcgoexXGFz2Wk7hv6DlDkEtbmD3bTE7H5WOB3PS8VmOxlt8JgvJZDoCjCPuaAUaID+mSuQwtyZJpTTvWfBwApr+tIShUJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHjGRLRxp9+isOWF1WPe4uRvN3TaWpfezf7w6xHT0hk=;
 b=dbgp7IEe1zce7FNHt1A+10+pehwZ1jYXjaC7VW5PRc646Z4/kk+q9ShLjnNCIHFdFCY3Wz1MNlXrcFWNEG1kG7w6cnwphVxkXXP7t1avVht3pTa6svWivZrPoyKYN+AeinfytZ1x1NJO1hEkwkzXBwErGkiJ05P53hBDT2fGQ6fW1ycAVTiRuPcjUCq59y4tMIDO760CrJ4/JLjhYOcNw6h9W3MX5CNjiqDgayR/N6wKOyOIWvV3aQccZ7NZwlcHiGHk5EHVMZ5Nl2noTFHjrOSlTSiLljhBx/rxHiNOiVNE62kz1GeYfdgLg0gze9PnzlNuPvAFAlWvL0gzswr6Iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHjGRLRxp9+isOWF1WPe4uRvN3TaWpfezf7w6xHT0hk=;
 b=NmtghTQkl0/PeOIpTPKFc9Bd/yyiOmbEKbmdTsTL6Z0hYYembRwjWM3etK9HRNcal2BiiigLhb8hkBF1pWt4KE/u+xVQ6eRN4MMsANuaMhvu+bui7gq70YE1TfNOJQfF7pHoXMatZOVi2Q5c4Gf0lQZ/hecxjfY5Ku2Gg4G5oQQ=
Received: from DB8PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:100::37)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 10:37:49 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::c4) by DB8PR06CA0024.outlook.office365.com
 (2603:10a6:10:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Wed, 13 Dec 2023 10:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 10:37:49 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 13 Dec 2023 10:37:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36987e9dae43cc60
X-CR-MTA-TID: 64aa7808
Received: from 8d40fe112425.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54627723-93AF-4ED2-90CE-823379A7192F.1;
	Wed, 13 Dec 2023 10:37:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d40fe112425.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 10:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HviqAUc8yNhZXpgU8tZh6djduijGB+BjIQ+E/3BgzePEBhDB/xmaEm9jiAUJ7xc35TJSTnvksbeFpRLaQpHecgtEO3Vxuim0dCU8p/2Lz0JWzMduGcZkT8h18l2YdnKuyjFyzk2fCZ947u/QnjS/M+bPRQ9Ml67cQnU3hqu7jJjO7xq6hpsshVqZQUZJ4fh7bqHip7BE6ZBSTzXMn824Rm0O4s2MB40w6HVAaj409Nwy5wBsJTTz8dtHwWGvwFjU4d1U3XaFAsKrznAZBIU68XwdX8eA4dP3+GiUdcCUzg3wSegiIv+OYn4hnKCamW3BopdhYldpT6gjMwm2y39zAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHjGRLRxp9+isOWF1WPe4uRvN3TaWpfezf7w6xHT0hk=;
 b=HBDoCvjIO8TmfwarB1MC+r6Z+LGBoIPmiVnOvg5ABDEX896beXKe0zBPcWieABUWhTTuKQC5JdlpzF38rzvsq2FY6veWxxph0+R+0yzilCfvGbCopN3Q+w1T8+b1oAsv4N3BnWgC8jdnp9Az/lvUruCyxu+LeUqR5SvQ2kxd6/+XzFHSfpiSI+fH3Bromcj6psZ/MKwWChuE8+VHreW+gnq3rcpXl7WvRJaSIP6DppT/jFCImiQTb061WehhKdarmV0DYPYCCEcQ9TvkATdfOrM46JeBCpZiUmUOKgc6D5JM0F89UqMI/dJTnU5AM69wAaRILNaWt1azv5TRmccuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHjGRLRxp9+isOWF1WPe4uRvN3TaWpfezf7w6xHT0hk=;
 b=NmtghTQkl0/PeOIpTPKFc9Bd/yyiOmbEKbmdTsTL6Z0hYYembRwjWM3etK9HRNcal2BiiigLhb8hkBF1pWt4KE/u+xVQ6eRN4MMsANuaMhvu+bui7gq70YE1TfNOJQfF7pHoXMatZOVi2Q5c4Gf0lQZ/hecxjfY5Ku2Gg4G5oQQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8193.eurprd08.prod.outlook.com (2603:10a6:150:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 10:37:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 10:37:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Deepthi.Hemraj@windriver.com" <Deepthi.Hemraj@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>, "Naveen.Gowda@windriver.com"
	<Naveen.Gowda@windriver.com>, "Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix file conflicts for 32
 and 64 bit target architectures
Thread-Topic: [OE-core] [PATCH] rust-cross-canadian: Fix file conflicts for 32
 and 64 bit target architectures
Thread-Index: AQHaI2zHUdSCsamImkGE9wN3b6VeWrCnGd+A
Date: Wed, 13 Dec 2023 10:37:35 +0000
Message-ID: <F20A2431-865C-4667-A5C3-5EF34FFD7E48@arm.com>
References: <20231130090751.3654747-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231130090751.3654747-1-Deepthi.Hemraj@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8193:EE_|DB5PEPF00014B9A:EE_|AS8PR08MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 12de987c-b53a-4f44-edc2-08dbfbc78da9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V6Lv0KodzlKpMwnzKv2jpMhs8mw5iicfwP+YTZHijcdl16qZceozReFWQk6FEKZlET6Vy8Qe0qzUtUKNwothnO/rZsuSOlWpqTD9dwoyiCEmIi6EZ5DreWhi7OXG0QokuDVz8FEhTCcWP2jrt4uJNDemO/q3YLltQQhZ4Y8IZcMkvGTcBbCx+8HZ2bEWRtoZNoQTRvGIiFzg/x6Q9HjLSaPDQOr5O98HMppVsA6Sej69QELv9CShAMOVjMr0ioCNhxI4rb2MOTa5wXGndpzClzFxfrsTWhe56UxAid+npVspF6VHWFYE5Mm6EzG+vZNzT1JqP29b/6vmarOE3ZMkiTAu6v7PJIgGD4IwnrrHMdSo3MPrsiSY1a01/vy5ZBWb1uYsFT7ObAOIJi3j/GPQcBzPkyGBf/KBer5LIm1ZWKEdnk4aRz6NGwYTmsBzpVvUYe7pdDHJKUANbXCbYTk8QFlkdRwj8aLmZqvp2onstjluzTxK+QH07BTpJf7oNdNzCh36E84uKR5OKzF5YpGQ0yNZHopaUWg6DGJedzM7YgaowDKEpYw1UAM05IkHzX9kSmwonqVnFReBUn04mwoh8kA3NE58oATsBPgmWyY7OmgzhSkUHPZQk8i1YFAnCXsYUwYLa/LnAr29cnRspXehcA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(122000001)(26005)(53546011)(2616005)(6486002)(6512007)(478600001)(6506007)(71200400001)(76116006)(4744005)(5660300002)(66946007)(2906002)(91956017)(66556008)(66446008)(6916009)(54906003)(64756008)(66476007)(4326008)(8676002)(316002)(8936002)(38100700002)(41300700001)(38070700009)(86362001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC44211D3272C44490BD4A0B59D7C3A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8193
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	64237422-55ed-433f-f92b-08dbfbc78568
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VaSKBfaZArXzjRZ4/3gRrfHiC8SqZky8GwhHjjCkz3DYqB6kzIrqGbDtJCR1XLx8ByNe4dK4pXlqvSlMCJlb9+PqGvKM52vBBHqZHitJXyFpymvStg1jqPnppwyfYnCgQZg2+1fxHlAN3BWQDN/9kKdzVMT0Zupcd4G6xUqOlKfN6uswO6Z92SXo7D1ajtIuqM6/pnUo4PDB+SqEnK1efEMqxYE58bDVYzUalkNul222oVmEv9Frx+7krucSFmGuykZFdOxeqGLsq9ymzm7i1lMK00nwW9fqRvf/ZYvgNYjq/TfTm4OWraKDQFnCCGSP2edK/MNN8nU2O6oExa6tZx7skWCOlT/cRYJh5ZiNeDkSLacnfwipn5wVJ56qF2H8/kQFT59BXXsH+If2Qetu5vfwAwtk3l2MNG4HywM7W1LU2WbOC9u9yEy9giKLeZF8Z7b5flClHKvj60k0L139KL0ErlPu5Nub6ng/UrUIwcP9b9WUb7jPQ4a1YtMWFc/xcVzCE38f18fom4F5ioT3iOdJsD0lyvUiRQo5YNI9uqpXSu4g7e5Nst2z1PB6Q0lv/ZLCdkG9sQTv3fbzUUWLeO2kH94rCQgZoaMgnOECRmFPBlKmYAQERPVImzTTrTYhRpT91+Vru0/4nIUyGUrgoRtBSkF4Qe3si/Vncdo8gFqTtJXrUNdHLDapkohRT9k/M8t2uFt/mt0eZwuLYo4m4o69dpkwcUr2CdLMsR6rDMHQ/Qp2U8xvNknkQ3519IAg
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(26005)(336012)(107886003)(6506007)(6512007)(2616005)(36860700001)(47076005)(8676002)(6862004)(5660300002)(4326008)(8936002)(41300700001)(2906002)(4744005)(316002)(6486002)(478600001)(54906003)(70206006)(70586007)(33656002)(36756003)(86362001)(82740400003)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 10:37:49.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12de987c-b53a-4f44-edc2-08dbfbc78da9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 10:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192279

On 30 Nov 2023, at 09:07, Hemraj, Deepthi via lists.openembedded.org <Deept=
hi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
> +    if echo "${TARGET_ARCH}" | grep -q "64"; then
> +        RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> +    else
> +        RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust-32.sh"
> +    fi

If you really must look at the host word size then inherit siteinfo and use=
 SITEINFO_BITS.

However, the usual solution here is for multilib recipes to use ${MLPREFIX}=
.

Ross=

