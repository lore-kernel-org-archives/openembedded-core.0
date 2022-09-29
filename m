Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C9C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:11:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web11.9084.1664449854412171523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 04:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=APvC/xGA;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MFZC6W1q4HkWI335jL2K43KLsKgnR5I2dHJ7CHlPJ2tJsgGu+GOo9vHsr2w9U9aSYAXp2rCyuqIHXD4Ff+U2SiZzODCVemmkYyvbhBTO23CkDpr91RpWKrXjKNDMtTA4DCw7DIPy7X51Ua/UIVk90BAsDNskxP2kb218q31J59Le1mSNas63nKS7o7rW15Drto59j/PTZYH1khlII+/1PSLHnoMCRNOTlenHJjwCgX1t1heGULnL+/KOsy31VqdIVj83XRHupnBu8jF2IubX2JfGUS078UsR48sw5x2I4coQeZYD/C7Oz5aiEHjqv2OKxIYnSc+o0lsTdm9pae2HEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaXKkXfWOd10tXhQSP3PQVGJi2pJ8Wui24wrcUQYGNw=;
 b=RGJCetY9KQaZovuhOQBWgm7nqHV8wGD3f4wEbVvrsAZsh1KUGZVnPnxwnGt4AxMJb5ZH2mYxwX7xncCWnbLLv1O1W0eusI7atY9Q1F3K7Hv0e7vepHqTlUU0l2tcWRkKSCKuePsbEG324SsweRzKWuT2WRjJ1rL5GDZcAc5vIA+0W4QH3lCkuSjAbliuoTCoaky99PY4TsGG5/7WPfg1WBn5lf/qdTJifO6GfdVBanaewEjzBtcebKHCuFDrbcWZAn6ed5fudEwlVLAOEpnSqhb/RZNoNwPJuWoASEfx4BAmgKAruKZa6aal5gZcnSLspN9LHZoBac5ont5+fApbFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXKkXfWOd10tXhQSP3PQVGJi2pJ8Wui24wrcUQYGNw=;
 b=APvC/xGASSL3jZfvtXEFIevl3X2/STa+A7ZEogtd+PPVIIDmD+bAdGWnebUpcd+jobhUnIvFdyd2h4/7TmOJ1byGrepG1DY7VqyCsJ9n9iULBroY3Qedt56I2foJuJQ2Ev4vzN1kXvfwCsKsRBOBdjXpWch0nAK58fyeT6lwrFA=
Received: from FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::10)
 by DU0PR08MB8254.eurprd08.prod.outlook.com (2603:10a6:10:412::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 11:10:50 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::f8) by FR3P281CA0128.outlook.office365.com
 (2603:10a6:d10:94::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 11:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:10:49 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Thu, 29 Sep 2022 11:10:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e5f48bcacb3ce04
X-CR-MTA-TID: 64aa7808
Received: from 2a6ccd1c9837.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1566257D-FEFB-46CF-B493-8125D99DB8AE.1;
	Thu, 29 Sep 2022 11:10:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2a6ccd1c9837.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Sep 2022 11:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vze1gIL09D1D+NkSUwUcRAGL/dm+rSdYX2OCSmXaliQbp/b5U7D+Slc7oKlxEsAJ7e+xDrTZz6ezR0Vnn9WenB0loS5Wsoi07C+2spJjITRquvnqYr/kBfYl/FXA7Af1DpzZ0gS90YMrXzYQMZ5Sfutyr4OrVDV09eGdvPsBt51Oagiwicf+tPLj+3dgyzSdaIZz4vRr1I197V0skrklkD68OFx/MEDXpVMhlLcM7WRxzwhOc4njlm+sqissP+6egc4TatY63KW9RpElZaTM9y9WUoWavNQk86xBH1GJ7HClu97E2NTxNTJo+Ht74ps4iO+4mSepA0btqGTs9iXIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaXKkXfWOd10tXhQSP3PQVGJi2pJ8Wui24wrcUQYGNw=;
 b=SX9YLvFliZM6jCUIJcKONCV1e4kTmXL28C/NNN0TsOPtpZG0nDN5Kq6MFNE2PVHNoksX/UFTHeetyDHDAhntnwXI6vX9MfkF+DenY62BU3T5e0BMnKSDjnGS5nEtP2M1EKc7LU+/1Veaacu1EQwdzl8L/EvaR0HhZajAdAbgLrAnZ55AU4Us/WFtQtX2aWdOnxJjEHClI5MmyiulETpo2sqSlTc8sr5wze7HiO4W1ddP4DA9L4104Orws2IOphZ5nOFiduW25Zr0y2NVAFaSX49ZMaGaa+uJLDudMMrG8Z8yWfY0e4HX7eis6GJN1GqwgaYweLDfrjEIW4wpmzOdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXKkXfWOd10tXhQSP3PQVGJi2pJ8Wui24wrcUQYGNw=;
 b=APvC/xGASSL3jZfvtXEFIevl3X2/STa+A7ZEogtd+PPVIIDmD+bAdGWnebUpcd+jobhUnIvFdyd2h4/7TmOJ1byGrepG1DY7VqyCsJ9n9iULBroY3Qedt56I2foJuJQ2Ev4vzN1kXvfwCsKsRBOBdjXpWch0nAK58fyeT6lwrFA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:10:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:10:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] binutils: another way to clear GPROFNG_ALTS for
 clang and musl
Thread-Topic: [OE-core] [PATCH] binutils: another way to clear GPROFNG_ALTS
 for clang and musl
Thread-Index: AQHY09pVmqhBzEhbRES8ZZ9iDEFSFK32QIAA
Date: Thu, 29 Sep 2022 11:10:39 +0000
Message-ID: <A149B29C-EF0D-4231-8D2B-9D552DF4E09C@arm.com>
References: <20220929080536.5400-1-kai.kang@windriver.com>
In-Reply-To: <20220929080536.5400-1-kai.kang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5336:EE_|VE1EUR03FT027:EE_|DU0PR08MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: e68fcae2-c31f-4ed6-8ebd-08daa20b43fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MNULQq17RejkiydtTj+3jW/G3yC+u1YIV2VQ4a+heTBuwXpMTGcKdZilyiUkne7lbu2Ir3PNOwhbWJdARttU8HlG3OLkn/olKLJoT+6oGG3p5Eb0xCnLCe8htKlXWx658+qynquonN4ADLMxlT7EXDa0Xg/En1uT9PnjksXB74Zlva/dxIeolaOL4XCkt2aQtkhVGKd1mCIEZ181PYZZtnjF6PKYiBwyTsV+JcwcDuzUJqwc8gETcRpNMnlzYOIaT/HRKx2ZMZSkeaIjovrOu6v7H1YQXsFxF9Cf6COmqSTKZyvkc51wcqOHWVwI4EgMVGuxPLW9FxtgnetWt3AEeo9ris+6UOXbYfSS5EGlXgOxPoCsG3nfKPYuGHnAnUGhNfb1xi/pK3OhYJZPxq2EIjJDmD8eq7xDsY7h1Cegi8aOwL7K6vIohbFUo/TvDvwXYRWLl4ZSoKnFqSq/Ti/5IPE4VHduQg7cuI/+4L+MmCc0TJXq86Nr3UXlaidRjMVUA9LNrVh6YsGKFGDqBGadKSY1vQQruTuPPAv74QRjPD5X+GC0xYpl5oVLEkYIpi+ylKPVhp0PaXh0QFcZk8ebhav91KIbz7Nm2zpuCajKRd4XtFw+3/QQmvhPszZwQX8ftDu+D+BWYH3rWSqyLJ90f4tM+CF9Czwp9p+e91W6BKhm18GEcoYEl7VLI8nFUgIsyHYIqcNLWf9m+7iXPu8aeMPKD8SJv5DndWSX8KNY1MXGrkIHfOMqd/YR65iCSKQzEHfo7MyQuQmXchFiyMT6nD29aerecEAW/3zuHXFeJT4B8K/uHmp+1rZ6+eX3/Qak8QBZgPrSrWTDhJLaZxPPjGkxMv7vaaigyukNQ50oD9k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199015)(53546011)(6506007)(26005)(6512007)(66899015)(8676002)(316002)(86362001)(122000001)(4326008)(64756008)(76116006)(91956017)(66476007)(71200400001)(66946007)(66556008)(66446008)(33656002)(54906003)(6916009)(36756003)(38070700005)(186003)(6486002)(2616005)(478600001)(966005)(38100700002)(2906002)(8936002)(83380400001)(5660300002)(41300700001)(43043002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB30861DA4513747A4E58D798E91AAC3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f90dfc6-3515-46a3-b912-08daa20b3e1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Da+3HqKRxIooG/J9pTFwMnDhJ4rn+4GaSz8XLTnsQcKJIAdSMNh/TAp1oEFdlYzhA3O4tCsGpylQmdBv9DDuekfKucPc8bZzaNMyzH8pUZBbteo4h/A/QpsX+J5DjkEYSDcHdHyQ9QlOdpgM3Tyvq6PqFniASwmTKVt8EE5YOJY0wNV8voONQGSt/v/PrTuJyeUon3HYIfHMMT7sUfcXRngo2efqM0V2C3hGSxs0ZmUTKfFDxiuiB0qf6Q4NjVibdUmidsKahP9GLmNgdAcp6hCBDImUmf4n3jvNc+4UP02iqS66ITUWoQLyzYC46K3T0rBJ6iCI3OGCEIJUnOl9H2ikTxHG3eC2PE7pyVrW0VQuO4qYD28F3kCbh4nC+J4JUxMa9U1vJeLcfueFJ666dMWgGynNBtgsMWNdNfhSJXEtb/c/VLZECGibixRJW2n0VZKkA2VzctDhsw9FrwMvus0GzMDLMAeKS7souUzX7FoL7E5Qs3dBvh2NslAAdf2+pbvfEDx6Mtkdmp05/fOejmTD9zXihXp3TlL59G8ziYpVtBCxqhF6fsucrLw4gKRoeylESqeHUOpFLh2IN8dufYwxXkNHWIYfQp5ds1M0hFD41lXNr6GcIiYDufk9WakZ/uzIkqyKE9lGLQ7L5gZzWCoqGhkITluNg8ap00PAaAT3jy0db5CKQ+6X+CRhJSnzMhTDOV+EEH+vSv8wWvRc6O1MX9g3KkimJi6U0BBVw3uhOo0wNKnl++sCmLN31+eoCUaOSZ56/PNNGeUc/oqbBgqWMy2TMA5YkJu6chBUHE02YVqgQTXsh8FRafUtEw0
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(336012)(66899015)(40460700003)(83380400001)(33656002)(36756003)(8936002)(6486002)(70206006)(8676002)(4326008)(186003)(70586007)(54906003)(356005)(82310400005)(40480700001)(82740400003)(2906002)(6512007)(5660300002)(36860700001)(6862004)(41300700001)(81166007)(53546011)(26005)(86362001)(6506007)(478600001)(316002)(966005)(2616005)(43043002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:10:49.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e68fcae2-c31f-4ed6-8ebd-08daa20b43fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8254
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 11:11:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171181

Fixes my builds, thanks Kai.

Ross

> On 29 Sep 2022, at 09:05, kai via lists.openembedded.org <kai.kang=3Dwind=
river.com@lists.openembedded.org> wrote:
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It disables gprofng for toolchain clang and libc musl, so GPROFNG_ALTS
> should be cleared for them. But override 'toolchain-clang' is applied
> before overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then
> GPROFNG_ALTS is still set and not cleared.
>=20
> Apply overrides 'toolchain-clang' and 'libc-musl' for GPROFNGS rather
> than GPROFNG_ALTS to make it work as expected.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-devtools/binutils/binutils.inc | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 4dde387a8a..98acf0a222 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -44,15 +44,16 @@ GPROFNGS =3D " \
> 	gp-display-text \
> 	gprofng \
> "
> +
> +# it disables gprofng for clang and musl in the bb file
> +GPROFNGS:toolchain-clang =3D ""
> +GPROFNGS:libc-musl =3D ""
> +
> GPROFNG_ALTS ?=3D ""
> GPROFNG_ALTS:x86 =3D "${GPROFNGS}"
> GPROFNG_ALTS:x86-64 =3D "${GPROFNGS}"
> GPROFNG_ALTS:aarch64 =3D "${GPROFNGS}"
>=20
> -# it disables gprofng for clang and musl in the bb file
> -GPROFNG_ALTS:toolchain-clang =3D ""
> -GPROFNG_ALTS:libc-musl =3D ""
> -
> LDGOLD_ALTS ?=3D "ld.gold dwp"
> LDGOLD_ALTS:riscv64 =3D ""
> LDGOLD_ALTS:riscv32 =3D ""
> --=20
> 2.17.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171173): https://lists.openembedded.org/g/openembedde=
d-core/message/171173
> Mute This Topic: https://lists.openembedded.org/mt/93990044/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


