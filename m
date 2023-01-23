Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C98C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 12:07:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.40460.1674475661106208125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 04:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nXA9VoPl;
 spf=pass (domain: arm.com, ip: 40.107.20.46, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMRGBPXX2ECNC+zHpLGt/a490dB2Ny1TYpyel6AkUxM=;
 b=nXA9VoPlezkjaInXHpxRFDW09Dd5LK7UuNls3jcGW47XvSN1pGNIcO+TQJiy0gpU0WXE4MslhiiGu2TeZ602TH2aFn7xgEIvV4fYGcWGMS2cCFNn+hYPcfAz/RGUByoCocDwbRTX6usX7Dz3UzLFjeAtcIvSSRKXfBsKuf+EogQ=
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by AS8PR08MB5960.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:07:37 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::ec) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 12:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 12:07:36 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Mon, 23 Jan 2023 12:07:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5596d1cec6362020
X-CR-MTA-TID: 64aa7808
Received: from f68ddd821de9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E4D56D0E-A268-4EA2-9332-20E9C6344AAA.1;
	Mon, 23 Jan 2023 12:07:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f68ddd821de9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Jan 2023 12:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx0j/VUbySuMAlZ4GTWVSrgYpnkzJJbp6Nbj+W2YxR0cP3568Wui8GS+ztoYQzqIhbW0r+mxzJiUqjU4d3Zs2h1C0Mm5HMsUzmG2Vye9xPLRsDHvSzWHNOvKdJ/iPoufsoiXL5+xXL2SDnQ7Pt2Qxub+uReNuEVobYI62umPNv65diwxHoTn4XnTl/2Cdg9jfHzbzNfwKFBz/BILQT1zVXMRa/st+XT//9XJUmuYAcmIRifmC/stdRqWqHuuPuflTgm75ltpVooC4k7sW3tsK5t00UY/cLk9iS75qrjbWC1cc8ke0z8/YQb1+JczIiT+TB96ag3enbTnbjiusUftdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMRGBPXX2ECNC+zHpLGt/a490dB2Ny1TYpyel6AkUxM=;
 b=f4CywSi9dLrMgEqfRabkfXjsTETz2HDRR871sFiqxZOmuQtgdlLzsmJc5T8qpR8FycIZTizX2lQD1a69VKMzfni5D95X1AQkPuKxVnA7NLfwE6ZywSV7VI41mIYwaOK5g29C++YUHSJMG1wTKu51oFbzcEy4+8SbDd07mdwUnU2BkY92+8QSeOpa107lFb9Er6UulO6STu8CZEBOLH7r9tXASY7ak9LDMPYyVh0pgna3N4sJhnOANLItMdc4PFrUxBkhN/8eeLX6JOz+ILTjYFciMuYBmghTkv1L+yENcQkWruZJor1+0vh3c1fBBrAITTogiii5Io7qIkuFBHVH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMRGBPXX2ECNC+zHpLGt/a490dB2Ny1TYpyel6AkUxM=;
 b=nXA9VoPlezkjaInXHpxRFDW09Dd5LK7UuNls3jcGW47XvSN1pGNIcO+TQJiy0gpU0WXE4MslhiiGu2TeZ602TH2aFn7xgEIvV4fYGcWGMS2cCFNn+hYPcfAz/RGUByoCocDwbRTX6usX7Dz3UzLFjeAtcIvSSRKXfBsKuf+EogQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7767.eurprd08.prod.outlook.com (2603:10a6:20b:527::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 12:07:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:07:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vkumbhar@mvista.com" <vkumbhar@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: fix CVE-2022-3996 double
 locking leads to denial of service
Thread-Topic: [OE-core][kirkstone][PATCH] openssl: fix CVE-2022-3996 double
 locking leads to denial of service
Thread-Index: AQHZLJItkYHHt+f87kKej1H3T2e59a6r7VEA
Date: Mon, 23 Jan 2023 12:07:27 +0000
Message-ID: <2B944642-B407-4E7E-9CAB-9794F99D2638@arm.com>
References: <20230120025649.105430-1-vkumbhar@mvista.com>
In-Reply-To: <20230120025649.105430-1-vkumbhar@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7767:EE_|DBAEUR03FT036:EE_|AS8PR08MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcbd8bc-48d4-45e3-5b3e-08dafd3a6ac1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dTJvaud3ErJeIKvVi0zdajtM879UmVwMgS5PykU51Q8JskZNsCfpNNt4hWg8OPAJpJnmWUwdVSAaj8K8Xenm0GLf1jvo/1Jcg1eTpgA1TqJTyP6ZA9pm4ESh9ulZf9W2Kkhy/MuSGMh+g/xXTLp1Eht7/UqP+ljdZYujMOklFMdTsLQXCsdyHnzplliZzt1T8SRepR/K/s2baMjIbz/gCr4Ot8mWsC9m4ftmrYrxML5ecTFf3y1BP9XaeGUSHr24fIChQ/jDKm2wktiR8qHEIxC6MfEToab8rASAqjV7do7/RejHqBa1gnpTFnOE2NCVPoLGNmtyUE9OjzInqhkxURq8yqTGOBbOr0rEomDc95oYObgc8RVRsgm58RCSMsWhlras0wZqKAXFvnhCKPwerdflb8NDgJerPswEw0EdKnR0CfYuP0DHuEOCNszfV3BSNhS1huAzlrbVdKn0eIpSV6JQbMPEhtqFFmpyUG8rNjCraLog+8UoP1GiRm7Vqu7c1SE7tp22vOUJJXl2rYuhw5A8rr5rYZprM/tpL4CuWs/07Lcavs3KgaBBGdSIiG8Yd6eSbHON38Mjxvg2G1jd7E9L0OxzfOtgY+OYTRt3DeVy1SWGQGIY5bzSRNRCk5IDWqLBqb0XA3nKtC5JzmqnOhmvYaT56fCFDDFnP/PNwM8C+qJGpGlvtmoqimOmM1YFdqGzMF9IWDuVT6WxiHBPLQxHtXvoh09hASXDh+RlGzMVt7G7wfNNRzBnh1qCk9k8Hv+bLNmrlESxfQRJgFvELCGlv+W7yjPAvmumP0DR8QY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199015)(316002)(38070700005)(2616005)(36756003)(2906002)(83380400001)(41300700001)(5660300002)(8936002)(76116006)(122000001)(91956017)(33656002)(66556008)(64756008)(66476007)(8676002)(66446008)(66946007)(4326008)(6916009)(38100700002)(66899015)(6512007)(26005)(966005)(6486002)(186003)(478600001)(86362001)(53546011)(6506007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <171CAB27CCF3324BB2DB597A1D548749@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7767
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5676d2cd-1ecb-497c-2be6-08dafd3a654c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7BzG/vjWTyZQPXt5pc8wWEtDUj+oz2BL6O95a3Es9sxd9eOr/A1kFuRNFeP+FrNtmHnmzg8s5Aly1h39RlU/adDBv0lPxHmGD6ir0UAK9+fx6PWwIrmZIsA2Ws3da7etMRzeQH30A6kePyvWcQ9X5MVvN9DYtc9q3fatXJu4Bbp6PGPauoP/37tblg2FYYm8mxeNMwoxiTEBKMrf8Cj93CRlbUA0gKWhiIw4ybp0Napi7dJ/Yge2YiGXYIuY57iN1Gmj9GR/TYpgaA7djLOlF12uKQ2a2i97UyjP9MvMIpv0Et7cDZ5GQJXLxfm0Z2L8ShmVIIwOm63rfnYGWjtcS8McqhxBBQsakKxOUHJmlfWdoNEbXmQGHf3T25hKCgN9ES5zjURRYlWoabFuSA8g+Ux+x3nGbt+S7IwpnJqY9NOwPKUx6srhQ/FzWWJsDu6zEcgSI7zOyyKWXgfB9geQlEt0JV3aCWbnn/GjnVsjNyk9jFY/Oljah4Ugur1HWsidumPhtt5+Vj313ZQfKJhILQGnOmbkRp3XkIzXDlbcLq5eCXANWgIo+JjiHAXYkVggGh7empUuS++6UEiQkA4qJv+Ga4nJwiDLAS9eGrHnGHMQREhnUi9pDGWS0bkus129qUqLcU9k0Q2SOqDDTDaHpfw6isRNK/dPGoxxVU3TBPfJKy6Nz9EtRPOT6XECnze7dywcLSKyq+maXpG8EV5xKGX0VowwcRpLBjez5UevQ5IZONI3fBkes+oCu1bp/QGt
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(33656002)(316002)(41300700001)(70586007)(8676002)(4326008)(36756003)(83380400001)(86362001)(70206006)(47076005)(81166007)(356005)(36860700001)(40480700001)(82740400003)(478600001)(966005)(6486002)(336012)(82310400005)(2616005)(6506007)(26005)(53546011)(6512007)(186003)(2906002)(66899015)(5660300002)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:07:36.7333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcbd8bc-48d4-45e3-5b3e-08dafd3a6ac1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5960
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176299

Can you also send this for langdale and master?

Ross

> On 20 Jan 2023, at 02:56, vkumbhar via lists.openembedded.org <vkumbhar=
=3Dmvista.com@lists.openembedded.org> wrote:
>=20
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>=20
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
> .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
> .../openssl/openssl_3.0.7.bb                  |  1 +
> 2 files changed, 44 insertions(+)
> create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-399=
6.patch
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> new file mode 100644
> index 0000000000..6d70b323d1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> @@ -0,0 +1,43 @@
> +From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> +From: Pauli <pauli@openssl.org>
> +Date: Fri, 11 Nov 2022 09:40:19 +1100
> +Subject: [PATCH] x509: fix double locking problem
> +
> +This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed=
 the
> +redundant flag setting.
> +
> +Fixes #19643
> +
> +Fixes LOW CVE-2022-3996
> +
> +Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/19652)
> +
> +(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/772=
5e7bfe6f2ce8146b6552b44e0d226be7638e7]
> +CVE: CVE-2022-3996
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + crypto/x509/pcy_map.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> +index 05406c6493..60dfd1e320 100644
> +--- a/crypto/x509/pcy_map.c
> ++++ b/crypto/x509/pcy_map.c
> +@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAP=
PINGS *maps)
> +=20
> +     ret =3D 1;
> +  bad_mapping:
> +-    if (ret =3D=3D -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> +-        x->ex_flags |=3D EXFLAG_INVALID_POLICY;
> +-        CRYPTO_THREAD_unlock(x->lock);
> +-    }
> +     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> +     return ret;
> +=20
> +--=20
> +2.30.2
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.7.bb
> index 9ed5f11df0..5156586661 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-=
co.patch \
>            file://afalg.patch \
>            file://0001-Configure-do-not-tweak-mips-cflags.patch \
> +           file://CVE-2022-3996.patch \
>            "
>=20
> SRC_URI:append:class-nativesdk =3D " \
> --=20
> 2.30.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176179): https://lists.openembedded.org/g/openembedde=
d-core/message/176179
> Mute This Topic: https://lists.openembedded.org/mt/96393043/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


