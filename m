Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD7ACCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 13:59:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.1])
 by mx.groups.io with SMTP id smtpd.web10.12621.1761055168344418480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 06:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Xzj2+oTE;
 spf=pass (domain: est.tech, ip: 52.101.69.1, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2GaSvAYRt0B7znl/JacO4Ag82PbnVG2W+nwWvPtiBh2HnwCkKBoXYmQJP8esd0KBbh4MmyC1lWqdEFD287PQgoi6W3VWPYurvjJN3pppp3JIe4S9xFbqtrr7Zu8yDSmDD3MU9hVL83TkdXVlSY0D8d2scv/o9/Bl5Ziyn9ceI/iIwxIJrd1Oob0ytLUCe0+ZzponnJC7EwCtv7BbI+/0ngVfWL0YD5QNI9FxLI0wRWMf0/PLoawOzyAue6LiqKikQgyGEs18lSuXozuHv8D9Nw9xUPYbaMX2LcL176OjnNxoH5nOIwR23BOIf3TeBCROpK5ujrYGXwFNlBUTg3Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WOxcSjFhanqy7Bae8SV7BU43LP7OELFXiBKmplnI8Y=;
 b=iClbq0uXGRWzoeDWh+7MTb5+9u8cbn39zNTnOnpNVn3+yvAT+8k3dBLFIU4+pDIzxgPio44mhCsQQEw06c3ETMcD50/Ky0qec/CGQqEcg1LilIH+9KaP7l5SdC30CKPabVo6bty6eOb4Rz/LoZz1e53aEi2WPkTWN0YIlYgDVvGCHJQsfkvojKMbM6PmRXwZ/joeeolbJSaq518TWBm5PNJNGABkeyOArOUSDBhGhw4Fky3QBm2stSNP4UKLstKznNST4n+VGNaGI4TZ/SVsn6PJe4wk55Emq15rwv4QM4mqFHqQqsblof6CwcfUg5ZhAJpLaUAvFo5OzE7bHnFgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WOxcSjFhanqy7Bae8SV7BU43LP7OELFXiBKmplnI8Y=;
 b=Xzj2+oTEW5lr04ZB0LFW3ZkBCH5AE5//WxUGB3dX0cfZj0HCjomGkuEWkE2KCFearYQK8dXxw9FOTuuaS1K6WHO4zxQNS3+X/WQqJbg/hMe7gX4Sdt2Ubdwa3IHuUCh3fj8ZmyRdakgKDF2rrO4P69sW1NR0wXlCjjAcwyI/mTOX3hEqRRXpqT78gfICXw3LHGQS23JBaK4aTsp9EssTLSAPvAJi3vJeazIdNv8vuxfJWkMe/kqR3kFYJAd6ztMQ6440+Hz32lHlLNBO+qgOzJiUZ636KhiUQAvFeCVvqYYHeXvDy1gKcqCUjbTYvaLgNJJtXIc2Vjxq8ALc/2mQkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 PR3P189MB0970.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:48::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Tue, 21 Oct 2025 13:59:24 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::4255:282:3810:7c8a]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::4255:282:3810:7c8a%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 13:59:24 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [OE-core][scarthgap][PATCH] libpam: mark CVE-2025-6018 as not applicable
Date: Tue, 21 Oct 2025 15:59:22 +0200
Message-ID: <20251021135922.17776-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::25) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|PR3P189MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1d9461-cf21-4c86-bbc6-08de10aa0aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q5MmRGPDILfiLk9jHDYAyWvKeGPRw95GZ1BI8GLNJYIOKGPjy3xUbsoPCqiM?=
 =?us-ascii?Q?6m7pw9E/NxZjCSmZHznFEtCp515gAqlO7UvkAOcWB53zQLH9Qzo4LNqwO2Yl?=
 =?us-ascii?Q?EcSJJgOeUAtAUTYbtTqbhesQ+/svNAJwqcZXEnfe9eI8eoQBcB3Y1WvCa06G?=
 =?us-ascii?Q?zjgxe+qmqCGwwrAfQxfxN9FpDeoIHiaisY/6pmtguw5oOX/5G3EbIAUVCblM?=
 =?us-ascii?Q?Y8G9KUxkLqGIX62gPQZ2PqJelduV+kX0yh1wxllj3sQk/ClGhFyn4mH2uKEr?=
 =?us-ascii?Q?c2hJItcYBn5Cv5d1j3ftqI/Zxp2mB5mgfMLyn2nqogEzvekc3yLnK4wfIqA6?=
 =?us-ascii?Q?LFt2zgvLQ/oBebtH4b7omMYrasdbLs5rtdsjgckLuVtItdVwwQcF2BYG65iT?=
 =?us-ascii?Q?e1IABavbDYmNE+ZUYD+P6Pwr/JQGm+EUM7zMeDeIsTarJqzGqZUpSxeyj0fk?=
 =?us-ascii?Q?0Yv3yo7HalKbpz5BmQ5ShH5CAtjABYw29UaSXztIflqXeaXSSI+ywLYU72wH?=
 =?us-ascii?Q?rF1WhngfB2naS49b+1Ja7IUk0WLN9X9dnFD8inEGR51QkQew7SjPPpcqTOAr?=
 =?us-ascii?Q?IdK2xPa5IaciCV2Uzm0cU96atuuKxKdkPSGMLcc9FtXbg9IUrHyM+DXTsAgE?=
 =?us-ascii?Q?NxMjj/INq+ovQpECA6dtFos7lUGOguIcE9HPykysPDkElQ9hocqIZxHCMxeC?=
 =?us-ascii?Q?YlGz6HI+mFUTy5Ru6dk7JmnegjNHSnBxnTFkXdsNdlfOe75VaLCc5hV9z/8l?=
 =?us-ascii?Q?iYqS2B5ojqdPWjbLL96Y/oKS2xohjA9Q5IMay4PREqF8eTFOqib78M99hq2H?=
 =?us-ascii?Q?uJPcGFDdp1u9Pc8h9b6GzrD/bsbONxuF4j9pccKuxJUoYXG1Pzd2GzwEfgLw?=
 =?us-ascii?Q?WSWPSvdhCZI4MS6dLb2qH23RemSViEG0UTNkOJ3VMV6XAwJUiParX4bRsZaY?=
 =?us-ascii?Q?1XwyDmrz7hlb151DAwWb7EeZ58p3nL1CYUiNiKi5OiqNnt4jhB1+xn31HLzJ?=
 =?us-ascii?Q?czAItXNJycM4Z29tQh0EfhUhpXidNK6dXFMK0r+ufHceHF0A0bPWtBdjmTt3?=
 =?us-ascii?Q?10KLpnlfZQoGSOUXEL2lssZTDsodVBNNAbq0o6FmjuP2WJ2MvMr8Sd2HyBAf?=
 =?us-ascii?Q?xHKFH9z5vgntqprUhhPrSVsPIEDGxPvYzM8BsFihwUYNIOBBT1zVOqpVvzjW?=
 =?us-ascii?Q?yoxiaSHFyegFHcoGDZXtbVFIOaG3aWljZJ0734GxFOs2ZH4WDqKetczhILq7?=
 =?us-ascii?Q?teBfbWaHPMQIUeqMBIZLtZzdPk8XgKQfsYm1ygnKboCU+n99TAKBc6vo++wB?=
 =?us-ascii?Q?E+GpHUypEYahnJcwpBphnwS1HPiFund0f6svV9ofhUJVQ8agPH9ChbKG3SPe?=
 =?us-ascii?Q?ByQo6QET/D1cL1ozGhPTGMPha8ICRTnjFoLzFvhUP21sWgodVhzD6zAkGLoB?=
 =?us-ascii?Q?T1yZuZJGGpxD7KO3g4EQaKjHmUIqRH3c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?89T3+rR5dAEzA1/BcgAbZyqrNIGHpPbxx+SgAsblXvcMZbYsnCWz8VjCead7?=
 =?us-ascii?Q?tspoSLF6pJphyRuglU2rp4ssahBgJxvTZA8endlwqO1f+ehWJ+jEuZrlhV+N?=
 =?us-ascii?Q?R78EQe1+K/t81fcdPGsR9ruWXfuf4ljphLqDdNr4G7E79e2HsoOwWy+cozvN?=
 =?us-ascii?Q?Ilg+sxSQDqt5M5ut5hPfMWVUz7Qt4ToAQ0fupM+QlpUZVo1dQzwbTkhPjj0s?=
 =?us-ascii?Q?JbMpeCOom4yMagWaJFtD1Cv23iK4N8k2l9tIIuIBHnypY6EGKOjrxJ6+DBst?=
 =?us-ascii?Q?nmY0/ZHSAdXwwxqh6WZsK/J83Z77wQfh7kF1C98VJyNrRA3+1B/jdpKVwRBO?=
 =?us-ascii?Q?FA8EK84GTzKq/mYANYlKEgoa8vU97xz+/Ll0iqJIRu6Ys3vsczofuY2LSR5J?=
 =?us-ascii?Q?7ivP/SIAAChRL8+B0pwhorJFBJJtqI5AYpwwlLK2Yjg4M4/6kqNUzmr5wJ+Q?=
 =?us-ascii?Q?fFvCv6tLdUjMC6lAob9N4jOjP76xIUyVVQ37Bd4VAOwmL4NQB6ljQJznAaUC?=
 =?us-ascii?Q?iNYxgO/Sed8vShcpZ9jXMim/bWlXHUKb70duPO+Jgi32PVVPm7/33znLS0n5?=
 =?us-ascii?Q?xGeOa0+PYZ1fJCGIKHqcEhnR3AwwOGTxRS6q9xvjNgBrjc9lhx/LlgGBSit9?=
 =?us-ascii?Q?sP1beOMkzT1U7DE3cDcXMHUdI0+QOlSQ17CWRcijaYNwHIJR28XDojAxMVi4?=
 =?us-ascii?Q?17C70+KmWWzvXF1KTtpmW2HLK+RLIS4dQLm5GF9bC5XiLLhAtduLrtuf+xog?=
 =?us-ascii?Q?4p3EwFaJ4QTl+IJEz/IVHHG+pMvjjMIB977vNp+Q63UJWh6yfGC7/S3FXtMT?=
 =?us-ascii?Q?HMy0Jdm065blrOfzM/gfGzyj8wKSntLbX+oachKn1rUiJJeWOZhcH+uDM9w5?=
 =?us-ascii?Q?2UjZiF/La0b7HAZAorbkYSqwepG0wDgiHD8tHyS6EnPZYz1vXqTplLw8PePR?=
 =?us-ascii?Q?0676xBa01FuCYRLtmxh8uKAuJLLxxMJU2BM0Godp8brRHgEqYw+mbraTif97?=
 =?us-ascii?Q?E7Bbz4qS+lRvXVuRz5i/0GjFrNaPfM8F/DBtY+zMZFaIhdIPZ8i24DIYDR6n?=
 =?us-ascii?Q?WOyGHF02mxJmyAd3G4wP3G+wS2XoDiw7di69IzNa+gd6oqEuaCnm9F6MOZ5a?=
 =?us-ascii?Q?i2e9jriVtEBBpjXe2uC63p0iMxSam+fxJ0oa1J4kYFAMgzyMcz9DIONY3xSi?=
 =?us-ascii?Q?F2I6Bjt+DMNi0WLBwPpikiQ+QYwp05QWqeclgO7sVKMJaG7fZ9JzV0Nr2GUE?=
 =?us-ascii?Q?FLf1GkXOWIWQGtKdcFrX3tM67dHWizOi/2AgrBjVdSJdN382dA931oVxPcHx?=
 =?us-ascii?Q?JYwwPdyAw+Zj6LrjmTEx1lG4ck2fUU0VkvAKqHJ3HAd125+euPP/PgXkTPB7?=
 =?us-ascii?Q?xyJnI47rCZh3/oKoOW6opbbAjNP0++7gc1NxEx0cVmTyL9PbKhiDLr7MjXWX?=
 =?us-ascii?Q?ezmsgOmo8PQnC4dX6SqdOp2/X0Uok0FkbHaNGThroO/9py/DTJSN/DimgPfg?=
 =?us-ascii?Q?WmOafu1SGbbjXt5svXk/msxRdRH7FtBneZRF/o6zimWfIxHqmWqYiQttr4DI?=
 =?us-ascii?Q?QNCqKoqCEXoCUTrJdw1iFOMR1HgapgYDJ3/Fs93xp1lDA7VhKu54w7s1aq/X?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1d9461-cf21-4c86-bbc6-08de10aa0aee
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:59:24.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE2eLhlK6SU8cS55akFShA6VCLNVJibxHLoV6Grg0zBBJgTCqEZDVrbbWeWxYil8T09Na61bgjqq/2hl1G2FAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 13:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225150

CVE-2025-6018 is a local privilege escalation in PAM that requires
`user_readenv=3D1` to be enabled in the PAM configuration. The default
configuration does not enable reading user environment files (user_readenv
is 0 by default). Hence this vulnerability cannot be exploited using the
default configuration.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-exten=
ded/pam/libpam_1.5.3.bb
index 4c27767ab1..79a0e9f694 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -39,6 +39,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM=
-${PV}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773=
b3c54b0a818283"
=20
+CVE_STATUS[CVE-2025-6018] =3D "not-applicable-config: Default PAM config d=
oes not use user_readenv=3D1"
+
 DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
=20
 EXTRA_OECONF =3D "--includedir=3D${includedir}/security \

base-commit: f16cffd030d21d12dd57bb95cfc310bda41f8a1f
--=20
2.34.1


