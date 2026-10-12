Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2341ACC6B00
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13147.1791811226690939817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=awcCXzZN;
 spf=pass (domain: est.tech, ip: 52.101.84.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvC3sf3uLecCZX5/+qeTNwP/5e2XpGvwZ4R105qsY4D8MUvgbQweSu57ClYE6ZsD8G7e1YvPW3V2fNKVwmaRycCZ4uHWzPJCLx+cp3XggAXKzxOG2IhM6on7t8NUgLXVXdP2K0nW+kdBlsbQiFjlc4TMz8/3P7rpJrmPCdK+g66QhXSxqxqr7dXrRH/8Kk9PIcV2wpkFV8xVEHS8uIYtdGn3LsnaqwOyo+98o367LrO0WH3aWwgSXZUK9QrWqUfPYpb7L/hmbkPa0+axKjer5tOMnv5ei1QgTO430wA3+hQziaR69+5JiPazuES9WOqdAgDM++bzUJ7SaJK+sIWyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAYv/Jwjy4H2odIJrvOv4b3xNhW4IEs7jSf0xvCBA40=;
 b=ssgjLbMq1lMpEJRA7xh8O0E6CKJEXNjoLkt3qUFoPNMjRfyiH/4RSQ9Wwrh85BIXeR9w9JwVFCuJvrr1KbXChabKE8DBTu5rMsMgNiEtQL2LCCUl6rhN6rN31e8Z0KYZeJRmCnAs1O57tycgHV5HOwLLo0xMKAgUyTaKmgsxIQxXpwVmNrxbZU9hWVBXJ6rS0TYn2hbTWZHN59pMvSLQ2YuywlIchiH28NQLVeTBniOJKgxqUrCahkVRuUAxVgRWxF6mVEAk645zovJgO663ZJKc7qnppMZrvF1I4vC37uutVjcb+1tOmUBIxAF+MgSCi/lBq/7wGUGCY48TfwUKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAYv/Jwjy4H2odIJrvOv4b3xNhW4IEs7jSf0xvCBA40=;
 b=awcCXzZNRzfqDSVsd86s2B5TIIb6a88YEJSU6XowHkOpZB7vUe9zwK1rk+0SimejWlt5Ig5AnGNJciBxp5LeiomqShUQnb2VlDMoEApvTwpGGvMsu0dos59omtY/jK0N3h0wPgE6wB8fm0FNareBsW1w+PuYhD3QDMzY0PLK8TTkk2YeYMeW36O+UapMLSb6Hq+L82eVfPz8YgKS7pzyMhalPB5G1FdH3ZSKuYv/bXJbgiz7le9BABQer/1A7c9XfgmVAAQEEh3tufYPQwjAPLEma53lC9iWh0ls+JMiys4GRQMQnhFi5DDhwMszqw//wUJq+qhBbk7RrRpDXLnpKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/18] python3-jsonpointer: upgrade 3.1.1 -> 3.2.1
Date: Mon, 12 Oct 2026 15:19:59 +0200
Message-ID: <20261012132005.23909-13-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: ee52f502-c25e-4c8d-9dac-08df2863939f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	kyloddkQfWzOG41eJi9QsJBqAXOsJoRgSViwm+lL3SlnZUP/7EHC+Q1R+PSIPLY2et5clMRNs0nhhDw81zoQPdm/yQwPHFNM90rGazqThDwOhxJlo0EP/GxCaCLGO+ytjuNfF05/O0PETSxuKXlP/KIc/mBwlpCG/8Bcx4dlgyiiVxLQFUU31zE1sFW6pGWI//BdtyAe6H8Rv5GBjk33fMa55lHb6HjfX4k8aKTlni76pLQ5671Gn7jJrwZaiXtVxXxTvg6WA++pWmeSk9L7iwHlG/dxEX+iLCODH6Jrkpk42vIJhDpCVtO48uwDxa2rUQzKgQkoiPRRPiYW+662ySop9JblL4T4Cale2RLGe8utrx1w6dkb7f8e+aKnZc0LpwfKRpteJqSg0NoSrK/aHm60k78Fl8BT/PHzRNo1gINw2r3x27+Qb52sfwsrpP8J+VwzGE9wI9s3l54jhG5QMHmthsQt5K091TpELqfk6UxtVfn1PsGt0qREmQQHcQdNXvJiDomP0gQxEtRzrMoC5+TLSPuhjEpD0rVXY6E47KRWyj9cCVpwt8tIBCH+Lua3+IfynVAW3x7N8Gwjs+vP/ZsRn6xBBzqDI+OfrooBedi629B+Mpxa8uFmI0fLup1LN5g9usuah82HlJTA3uC6nktb1PCvOhMXSHueV4i4JRo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6omwmXxVsM6/Q5rc9uZplzsfw5fqD+dfpPXOhliapP4T4h9+5xd9D1FvCSbm?=
 =?us-ascii?Q?1DiYmyZVgc4vu0dKLKQVZZ/ae/OBB5IO+jiQLoOFdRrRHtz/OD0vIsRi0ZKQ?=
 =?us-ascii?Q?t3N1VG96EzX8VtLeofIAqAzKg5+37n6MXfDLlEXQ5Nvq05iRkB4BjYsdFNYX?=
 =?us-ascii?Q?9Trs/th3XFZ4BlSIxyXRjPRQvSPfVaAR3PxZVGv4oPTOeMVYuJJezai2yVI6?=
 =?us-ascii?Q?avG9Qi5JzvtFSFzTQ/2vmdeir17+Qpm0erqsv+TRnynLD2HRFoQQDQ7XDrHW?=
 =?us-ascii?Q?TsmJD3j1CZ6rRo4TFYLx+aKRGb85Uh9h5oHBCH37ALFzp/ABimMMvAq0DtsA?=
 =?us-ascii?Q?yTcY6gCaNsZ1aY+/PqiTOe7wiIgmSDiqAYztrwCeft7yYtB8fftFPHbRUq8w?=
 =?us-ascii?Q?oD5dCoCz44vjEf/UquX4+wo0pSXcb1CTfNUOXWv5qLGxzQL7u8icH5sR9ibu?=
 =?us-ascii?Q?PcXD/kh6FZZGoersiqXNq/JqFWSWOiuq6Hzq2SvOlHDAzfbflml1dLop3vUV?=
 =?us-ascii?Q?KZXm8XB1mVQ+CI38cFzMmtmFhvbYIwobjOsOL0uNuprtruDWmsdOydjufcg9?=
 =?us-ascii?Q?N6ALcusD8cAUtj0nFRslItz0q9NQFYY0UvRUUbU120STBiOP29jtry68NYsF?=
 =?us-ascii?Q?FWE4H6//VpsJEbAxNTMnY6Muuc78WTpKeP1nOpU8aEwWvo3tdPjxKTZHUzc3?=
 =?us-ascii?Q?d4w9zzUilVxU28Zq/56wsSFXM+QgurvquUzXuzeDn6DzIjxMv+zz9i6hYL4F?=
 =?us-ascii?Q?cHInrmj1hEC1wp0qx3cdjnt7Nq+UV/iYEuiPIgv94PpKRJt2ornSeRdBBT2j?=
 =?us-ascii?Q?F5j6ZaRTqiwQQ/Ch9oxseo/rDJjF8JSpguilhEd/tGVc1MpkxVZcpmr8o0wk?=
 =?us-ascii?Q?VOXOsSxy+TEfk0c6hjMn46Dcf+0bOEbYBMCT9KMy89wppgIQpbRRYilqdlk1?=
 =?us-ascii?Q?+KnE8yBLadzFz/yqEyJNmNBeZFzUBYdqZC4SAL2WIuSkNwbZJMJfevw9uDR8?=
 =?us-ascii?Q?7/TyGYp2LEHWiq2Cq5nmmVsiI9jehw4RNGHpZIEBLIOOl11oUvNqv4OLMoAK?=
 =?us-ascii?Q?9OhjSlYF639tHkcZchryGt5JdZQ7lyMZiF2kvAdDc58SwRYiFNbQq0f49O06?=
 =?us-ascii?Q?CLk/80C5BxcddWbokbdDcAFqLoEkzWq5LtA65uGAH83dBgLjC6HIZuWUOeoj?=
 =?us-ascii?Q?uDB2/kMEvKO2UpsbepxZbGKlQ2/z3MTbfzSPbm3eoA/gd7j4gdCPKguEfwAz?=
 =?us-ascii?Q?PgnyAgG5p5HDbP1tuTFh7wuUokMibzs2Lg2mBCS6W8s+zEWtseuCIdHxAu48?=
 =?us-ascii?Q?puz3bKXc4liyWdre6phUZA4vyG15zZVGf1tvBkjSi2brc7+GBy2UbuE1uu77?=
 =?us-ascii?Q?i9Im0ZWd/YtQcvfJXK+8rq5fdTZyjGqHkAevycgoPxypmpQkwkJ4Hn8Ess18?=
 =?us-ascii?Q?fIe3YOn8f0MZIQM/yUVRoAgTcWyDgh7Q8tx/bXrbAIvFUxikgFS2O8uX7a82?=
 =?us-ascii?Q?ZSR+hnYmAOaLk6T0TKpYDQSnpuBbTUbN1ykSdoYpPN7/2nivkuWDgdrFydrW?=
 =?us-ascii?Q?H+C45dEV0mb/M3OuU9lmOPw/LhpFZvRpcJurDTy87hlNI5PqK8HcQ6X/rMOT?=
 =?us-ascii?Q?UXSjh/j56ibeBIE9OMv3bhCA/YzRWboJIQ68GEs56RbFwd4h1EWPp39PQvBV?=
 =?us-ascii?Q?p2oehZxfUSdo4AwGiitqHZvMZcxGJmpw93oAjuao0fGoLL+tizaPLXAADqqo?=
 =?us-ascii?Q?wn3ifwvxRg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ee52f502-c25e-4c8d-9dac-08df2863939f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:25.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VqL5lzvSNU32rle1njyASur4XVUAGH/LiPU+qPrQ5EbzYygc4AqT9Q7R5iOXg/INV9Z+GeNeH9qGmn1qWvOWe6skKxWjeUOUVpoPX1L1t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247656

ReleaseNotes: https://github.com/stefankoegl/python-json-pointer/releases/t=
ag/v3.2.1

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.1=
.1...v3.2.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ython3-jsonpointer_3.1.1.bb =3D> python3-jsonpointer_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb =3D> pyt=
hon3-jsonpointer_3.2.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
index ddc8e256a4..52e6d9a2df 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a=
329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10=
beadf60adf1900"
+SRC_URI[sha256sum] =3D "47c846513b3a4ec46eecef1105207fba075e2a3659048e362b=
d7daff0fc33342"
=20
 SRC_URI +=3D " \
 	file://run-ptest \

