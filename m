Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A676C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 11:40:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web10.9139.1691149257248258139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 04:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=y0VrxZ3Y;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=y0VrxZ3Y;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDTSlfBfWKqHgcTFq91h538sLQyM7eJVj8jioNtgGzQ=;
 b=y0VrxZ3Y+NLBCOkLNZ+7l+ps9rQ1GnFZ3LHFkO6kE/kNWxsYbY5G2anMxpPHzsf/Ot8y8b4n/sAsfWoecH4nsC3afAG4TPjzeMr0LwkodBX9A2e93odkPA0jABSHXIlLJTB/rfQX4pmDfQrOhACqJufmaPYXvEp0XiDkMVDIbi8=
Received: from AM6P191CA0080.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::21)
 by PAWPR08MB10089.eurprd08.prod.outlook.com (2603:10a6:102:365::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:40:51 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::83) by AM6P191CA0080.outlook.office365.com
 (2603:10a6:209:8a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Fri, 4 Aug 2023 11:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.48 via Frontend Transport; Fri, 4 Aug 2023 11:40:51 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Fri, 04 Aug 2023 11:40:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d14d96e321d23d49
X-CR-MTA-TID: 64aa7808
Received: from 9ca115e7b015.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DFCE865A-0005-4C20-911D-388AD0BF3EE6.1;
	Fri, 04 Aug 2023 11:40:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ca115e7b015.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Aug 2023 11:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHWXK0KoG6l1GMP5sZ3CzUgT7niLgtdg0ZGvRDvwchEtvggTun/vnuhwEUnDxuNaznh+B4JRfFDMT5i/bzS+FDn/eS50bURTAldD7riZx/upyeNfOf6sek9s7UjPLr9lmSykM2Cs+4C4oHMWF57aGeQOZIHkb6lS3BOeBA1lXJz1nJAtzpAgzOs7A59ue3GnZaZTiHWBo6jG4VI1+lFHM9P3i6WUuuUllW1AZP0Z9iH2P1LSlZ714FA9VFfLAYwgGjFSBM/C75ug9bjBNR2ncs1tFd92OpuJrVeb5ZvNAUl7ZjFRU3xVxt52KVm3Ji+SMJmVMeW8qZMCbck+/0FHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDTSlfBfWKqHgcTFq91h538sLQyM7eJVj8jioNtgGzQ=;
 b=lCjE81fRSZiBtcJhBnL+kX4vRnHUQ9/MTr4R9r8DmCH3AFXc3GAs9kbG4Fi9BtOaR4iFazJRdLPEPwAfjSinSCjc/MWfYelXjFQopsvD2DEprEyN0MrV0WZ880U0YppXsvC0zkUFNYuGxNVIpnZrX+S40uaQ+Lqbp2Owv20heMMihDvcjgeTiWzqGkSqt7GqJ27UGIrqjX2mxM/+AcVdTQs50tlP1MFYwMjYLTHpCf4J7vlAwf7iq7k/TxfGdVgFYui219uvrJZYB4GWarjYUD9eWlCT6or8yijuXssVWfse/h1+Lccu8MAukkBZiHQTPqJg81zXmG1Ngi1UwVcr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDTSlfBfWKqHgcTFq91h538sLQyM7eJVj8jioNtgGzQ=;
 b=y0VrxZ3Y+NLBCOkLNZ+7l+ps9rQ1GnFZ3LHFkO6kE/kNWxsYbY5G2anMxpPHzsf/Ot8y8b4n/sAsfWoecH4nsC3afAG4TPjzeMr0LwkodBX9A2e93odkPA0jABSHXIlLJTB/rfQX4pmDfQrOhACqJufmaPYXvEp0XiDkMVDIbi8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8438.eurprd08.prod.outlook.com (2603:10a6:150:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 11:40:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:40:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: Enable mathvec when sve is available
 as tune feature
Thread-Topic: [OE-core] [PATCH 2/2] glibc: Enable mathvec when sve is
 available as tune feature
Thread-Index: AQHZvqwKzbEkvH4f/U6c4b8XXZlU06/aE5sA
Date: Fri, 4 Aug 2023 11:40:42 +0000
Message-ID: <EAAEAFD4-C39B-4812-B021-2E7157BD9D9F@arm.com>
References: <20230725035626.984709-1-raj.khem@gmail.com>
 <20230725035626.984709-2-raj.khem@gmail.com>
In-Reply-To: <20230725035626.984709-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8438:EE_|AM7EUR03FT022:EE_|PAWPR08MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfe94d8-fc4a-40b0-4031-08db94dfa7c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F7rIlbhktNXYiyZAfmoFdT34Jh5JDcHQei1NdXN0zpVr7qS9Q23g1LxI7UQCDln5ohvLSHkzC6ksV5CPcHF/Jv9rUdT9JSVn/8+T+L8WS+/Yjy+KclrCZM1VENr4dRxYYHbpWbowN8/pBklsVeMl1q5LYujYn/xK8hvr/PyMNnlxVx2X85c36wZW1NJCFG/ShOUQI1+UnWWUubEmP5ZiVPdnjp7PuxTCrrtkBX62GSgoBrEKsdW9Z4CsMiftUIAN6L7MNXwfg2fYxAapjns27td/nBPWIGYRhPb+TGJfWcShMnXdEpMuN1V3HMtAEPrjqqSYfqoFTJgscpRJp/3rw1hLh7Knk52QhBUT3Vsmses3ZBCUcqaqkS/6KHkAvt4dm+M8Bhr4zhNzna0wFMz/QsHRIBHitvyC0o0aPrem5YtwG2LSkRUFqU3bnC6QBVWsW2qZNRAwzwGfKTjkDhd7WptcWLsIAl7/24UOmH5H1Aes7ogIFspHa+/T0i+2ScCoSW6EWMcORJa3qGD8SNHgVL6fACSQnppW6JCa/YLf7c+onuFCcl/eld1Lc1ohQFVvEPa+ofj2aBLRvS/7H/ZIkOapRnSUdgXuIU28Wi3kpdxeTet+NVok3VA6G7qsaS+trecDgX1tgqlFKz2WLLvwEg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(1800799003)(186006)(66946007)(64756008)(66476007)(66556008)(41300700001)(66446008)(91956017)(2906002)(316002)(76116006)(6916009)(4326008)(8676002)(8936002)(5660300002)(122000001)(38100700002)(6506007)(33656002)(26005)(53546011)(38070700005)(36756003)(86362001)(2616005)(83380400001)(478600001)(6512007)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27ABB19185BBFC438D8689E0E7388078@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec68d368-867c-4f72-6578-08db94dfa27e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tnASA+uFtgZ40dKderc9YZPDVCqxTMR/9DxX/C38dTdYqyO7Q1zTBzLb5azQ19IAlY0pbmRHyq0JAmNwHcNdsVQQ5W0tcGBZ8mBFnNKIN4C9jGQMr4K+37CqWGHi4sLU1y6I4T0qvgcNMz/0uX9sEm4T4wzgvcuhl5tRn1wuNQLDxfoj43p/fcBfkFWTyJdANtnBvOCCHIY4/4+QmSwKbeOZIEuUxXGDZAvaNt4s2PndRCLS76ApmKbO4/NZ7v3D9ZxN/QeACvY2R+BO011DtlXcK81oZm5xZMQPUJqXSvkuAY/1yUKjnQ199disyWNO74OaQKLxImCMioysI9fMs1myZQ/QBb/VQ33/KE8UT/Klpvao64uCDdHQM8WFXHITW5Hg5MYbD0MFuZe+fii9+RjeSDCuZkbVs9XUKczdElbXLd/+A0TmgvL54cTMMCLIfT/FAmWAFaaWugovW7j17+KxnXU0vE43STIU4V45926PxOb5lE56iA9EyK2UqmOfbXTXs8cF+4chbdloMLLkEsigcoj9bqwLSu2bQZqR35kqmHoUuCcxkC0LELRwYL46GMD7jDk5tHLySHGYoswlaaQR5Ph+VY1mlEq1vuQn0ybfaOXVk3CgZVvFBaUbfnUrM9biVfUOQkHM292K5iDOK3IESGrKl71vK7WNHieLTgWsKFIS5tFEdLZKMSO/CVgcUHM8JcYjlRbOxxFYLiiuaAGngHQ5DXlEE/ndkReYamo2FVhLLG8j+0KVB5ImhGrw
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(186006)(82310400008)(1800799003)(451199021)(46966006)(40470700004)(36840700001)(336012)(478600001)(316002)(40480700001)(2616005)(41300700001)(8676002)(8936002)(53546011)(26005)(6486002)(86362001)(6512007)(6506007)(47076005)(83380400001)(33656002)(4326008)(70586007)(70206006)(36756003)(5660300002)(82740400003)(36860700001)(356005)(81166007)(40460700003)(2906002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:40:51.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfe94d8-fc4a-40b0-4031-08db94dfa7c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 11:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185522

On 25 Jul 2023, at 04:56, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-core/glibc/glibc_2.37.bb | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
> index 8ff9801ed4b..4290f3e6e4f 100644
> --- a/meta/recipes-core/glibc/glibc_2.37.bb
> +++ b/meta/recipes-core/glibc/glibc_2.37.bb
> @@ -85,7 +85,8 @@ EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> EXTRA_OECONF:append:x86 =3D " ${@bb.utils.contains_any('TUNE_FEATURES', '=
i586 c3', '--disable-cet', '--enable-cet', d)}"
> EXTRA_OECONF:append:x86-64 =3D " --enable-cet"
>=20
> -PACKAGECONFIG ??=3D "nscd memory-tagging"
> +PACKAGECONFIG ??=3D "nscd memory-tagging ${@bb.utils.filter('TUNE_FEATUR=
ES', 'sve', d)}"
> +
> PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
> PACKAGECONFIG[memory-tagging] =3D "--enable-memory-tagging,--disable-memo=
ry-tagging"
> PACKAGECONFIG[sve] =3D "--enable-mathvec,--disable-mathvec"

This is the wrong thing to do, imho.

mathvec has existed since glibc 2.22 for x86-64 and only with 2.38 did it g=
ain aarch64 support, where it has both NEON and SVE (optional in 8.2+) impl=
ementations.

Fedora 38 and Debian 11 both have a libmvec.so, so it looks like we should =
be turning it on by default for the relevant architectures (x86-64 for <2.3=
8, x86-64 and aarch64 for 2.38+).

Ross=

