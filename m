Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2CFC43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:47:35 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51345.1782546450277756470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=iISEkBmI;
 spf=pass (domain: ericsson.com, ip: 52.101.72.70, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2NC0meT9LH1iK1txRo4kbIaYYhUFGLw0OOiVeo0EGM+Posd3dweyHFxCvIMBu/xeNBa1trvVPqfL95pXmR7CF4YCUNGMK0LRNvjpsvqqkr3K2WKmvAfrN9zFtsr5Aunryrnb+Rhv5VPcIwD+R0RJzt8oVJeHvKLBRZWqJN79YjKFHJlcezYuBOnCAZmXkGRidogFjOtx2w39l1GG+wBIX1P+SolE8PTLBkOheoSeY9YfhzwBdHaRhGcGNF6MMbhuc3Br8UiEpzaf3mpmfkzxkt8EqFk9IHsicPRSvj47jOD8NYu+UJ7EaDCzVSYpu3XoSPliD5UMb/Uqj7jvIZbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtZjq6kzyEbFfC+hXM3r/8858IhDRARyrFX8Jojpq94=;
 b=Uv+3jScMZR6ff7AW+iJ1HlD8MOCgeXtPLBNWzRuWpIS+oe5KCLRTu9lTnYTgbxAdJfSbGbfABLn3FRtzyeNCb996y5WjNx+M+EFo/dQOveHVn9+Ql7QfN4y1ofBzo+617dyyAQlA26OJjYZFs+vJPEjq2qt6FGEPMew/LtIcJfXqWGhhke3F+BZ+fYPHq/xDd7ZBH1AdMTJCj9wd9ygHJL5VMwsway/GQBq+U0v6ykm51m4ueauOZ662s0ZLLLWN/PCL6WhltzcGDmiHBNI4uxI6kn3JgJoZk0U0nzeKmYVcs/QSeiQls8YsWi3YQeBpbVXT5/KjRJYNouNNT0755g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtZjq6kzyEbFfC+hXM3r/8858IhDRARyrFX8Jojpq94=;
 b=iISEkBmIp7gn9r+bidaL0Ll94IcawqysiaV6rNn9Z6/+xQxHREbsWHdf9xU39kEwF/aC+UOVjiplsqh5NC23BEXSa66c9uob7Q8YAtBo+xGvFDD+WY7je5VE0Ouz/pppQdMBbSWSQrrQFqNxq4Hp+HQyita/JhnOHeV+aYLn2tH58f89wTW51HyAe99RIHPyc9i+h1LHzcevm0ItegLOTYKSCuScZiNW3aRGSM76E7lgy+erHDwF3R0qQH5C6LAFO0AilIdFNnuxT5g594nXbxf1CLasli198P+lkcxczKqAwMyB65/9Qkd4AXcyvYGyjFUocx+Uu6GVlaYmtCow8g==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DBAPR07MB6838.eurprd07.prod.outlook.com (2603:10a6:10:19d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 27 Jun
 2026 07:47:23 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.016; Sat, 27 Jun 2026
 07:47:23 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anders.heimer@est.tech" <anders.heimer@est.tech>
Subject: Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200
Thread-Topic: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200
Thread-Index: AQHdAipNaujlo6jbIUmfXU2LHq+ao7ZRfIYAgACOCe0=
Date: Sat, 27 Jun 2026 07:47:23 +0000
Message-ID: 
 <PA3PR07MB107219471CE7CCEF801347F1F8AEA2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260622093400.2735723-1-daniel.turull@ericsson.com>
 <DJJCWETHYRIH.1MYP9M9XYIZAS@smile.fr>
In-Reply-To: <DJJCWETHYRIH.1MYP9M9XYIZAS@smile.fr>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DBAPR07MB6838:EE_
x-ms-office365-filtering-correlation-id: 87fe2779-07c0-49be-00ce-08ded420530b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|56012099006|4143699003|11063799006|22082099003|4133799003|18002099003|8096899003|6133799003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 gMhPQoppkr6NWOJgClg1p668Jatej0wycqefnLDtNglvwB9lasW8uz0eOACLapZ9UAcD+FODQFU0umKjYWgf0kCWOrWViWQvVtB1OAd+KXq5B+So+eztkSHz1NPrgbMl2kqPFkxPovGLDu2n7kXLVCVmtJcdBkJqc2qedfKWrE5XNNr9n1r+0hyaUmyentxZ6lJEgXviQ7I7Y5yjPc13trAV+mdvw2W+2V0KPbzcYwY0poMDwwUrqWjWRoO++Vbmt1slKXaPJS5EyJbXa2Ji8SmAN0rdruHkSl3teOPZrvTEI4WXCfD0o2FX3M5LrCqPAUNMXb106RskAggYsetFTcY5grHmZ5ApG7PTcO1/erxy7ArBXynrORDIvWTufuTIL2J0a0Pz0vafICGyy00Xn3EYRFJp194CZq1xiPW6GSjFjY9DySOcuaQvDLUFv5xbXNFvRVw5n+EhnxvtWRVo9qqPcBN+RdX1tSqnxqibbGvhjZAaSfEev9OIY4Z9tS8emhfNMplqxCYNEjbLiYQTEy0h1VskHQC4IF5/E41NGElfb+/NLtr3ZQ9b3e8OsI/J/0dM6A0S1pXJAY5oDXEN+JbktEk3kXHiVYuDlzKzcvN211HGq9kqI/epbMhJqrcoVtRriliUnOZeq157AM0TloOXzDCXt+o5zGn0cAkjJ20=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(4133799003)(18002099003)(8096899003)(6133799003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?cpFOo1YOqNRcPHJC/47fNOdXneoUHVJo/Ww531vRlVfMCyKgae1/mwCc?=
 =?Windows-1252?Q?0Qpc7ZqlWcR1VHNRsWla6BCW64yGgAP0eEgu6sbSCuJQzhiRqgWS9OxB?=
 =?Windows-1252?Q?5O2MHVgwWQbkuPXQpp2s7qSCcAQaof0AoOHQP9xI1irpKhlZTUHvfepD?=
 =?Windows-1252?Q?HpmEhveE1KwJxXABRcSOd5w2AQKgTTouaA60VPpthEPUkpyNm7KjfzEY?=
 =?Windows-1252?Q?fwXyshpWZNaKhpo3x0G8n2ov/DFT80zSoSShsY5s8K1CHF+ar4cdXRI7?=
 =?Windows-1252?Q?q3r8y9LLmXuAYMbdlxdS8RfzqpHK3fBuUj1apQAPyZdahiW68Oi57qG3?=
 =?Windows-1252?Q?QWyhKIvd6Y/AFixYJoCkws5SH/ud+8UlBbm0PzHXgHMcP4Uwr+Mgcc7P?=
 =?Windows-1252?Q?o1SY4VH/yuFDL49m8f11Cl6EPoBCX0po+alqP12vJEr7GKuEWEhaNewv?=
 =?Windows-1252?Q?T5rS8nJUU4rbhIA/1hIpqzLPO9J+Pi+Dr2MInzK6Id7PgCFm6l+CoL+8?=
 =?Windows-1252?Q?BLBJgw0Pswj3jOkN8scqe442PeP/j0nX5oSFX/rG5B87YxE5c1Ndz1LL?=
 =?Windows-1252?Q?gaJKixO+lwGccZoNKZ/TZyJaIEXZM3gLpKWmV6PSOiAbwyP5IG+MVKYD?=
 =?Windows-1252?Q?bZiiZYQ3eBtlQ8/OsXbf59onRyQ2QMnc3LZEfDTjoKyw3qN8fA2tf2sp?=
 =?Windows-1252?Q?W7RROjhYl72GSBvDn7FCMUS67r4D85Lxuups1ZbyhJdeENmZFjhHalxn?=
 =?Windows-1252?Q?zpcbupN+ebJMdoC+ES7A3jc49PS2NuCvmNmLUJmoFHL3+jYO0dN320IK?=
 =?Windows-1252?Q?/mftmCaKhWqT76TCwvrZe4FQkRC5MBVfzbrjeRMew8CwYNcLp4z3xcqK?=
 =?Windows-1252?Q?O2JBRE3PYY9U0q3fUqOfSheS2zFjILr5IXHTAeo5wzxEKe55l7zZaIgO?=
 =?Windows-1252?Q?6g1YHf4/PfTKXJRqnBaWNgYaiWV49SXCjWUjlXDWL8CNCT0BUpMKpZqV?=
 =?Windows-1252?Q?zzwIW6oqFqzoiAPLCNohjomMDAWcdRSvz+AtfGI6pQO7INtxdZZ90L9h?=
 =?Windows-1252?Q?v0o1EqZSct5JBV1DfulIcVXom+yGPCoBgcstvFaEL/GTu1Fenpw2bIZd?=
 =?Windows-1252?Q?nc40XNrnTQAJMP+Ben8nwgr4ir4MiirdUhLRnyXNXNzbtgXylU7voyAX?=
 =?Windows-1252?Q?MPiJIppSrhjpd55PZ6wHrHI4K8c54nfaw5jObAbgNuxHKISLdQzLSfh5?=
 =?Windows-1252?Q?/nL2NS0HogdAOq9a3NjD8Lph2cvWdSySsozpFRw7hSJA9wUNtGGdvyWy?=
 =?Windows-1252?Q?9lrMBndZrGQhZEIUDk5nSsz6eIqP9SS/ckbcmR01D+BcyIGpk/NiHNep?=
 =?Windows-1252?Q?psdMjKhCxtPxKRyY3X9CAlRLWHHvF1xCUaxKcC13toU5j+ETuB9hkSMp?=
 =?Windows-1252?Q?Fhr/i6III1m3OM344QsQ+b8BFDtpcSTrAYW2sHwMamUpPCBAk55CGFzO?=
 =?Windows-1252?Q?FB5ZVS9QuTF4sxYTjqUVl9u4QQCLWaTNWeexUty04ewFGQMvdCU0DDxt?=
 =?Windows-1252?Q?1podJpvo3IX6g1e+cLkdRft4MpdRrFhoFE2hKutg5yR/EUX9KB1C/tlB?=
 =?Windows-1252?Q?C+/fFXDA5R+IiiNIo4iEHNvdi3OuhhUVZOM8A9722AJEhh/j0pDWCuZF?=
 =?Windows-1252?Q?yNWN//dGsA29dHt/cio6H0ldtTxVDD82hw0GMma4f9CfPhjKoa6KuLtW?=
 =?Windows-1252?Q?g03qyeafDNE7GA2sHbRJRWr+QsuPQU1gUEk9X5X9n5vJOk0fVgrxErRJ?=
 =?Windows-1252?Q?qhfguLZtsrfFg7vOFZJdpCzZ+oog9UsrZJUvKV9GN7DoqbkZbdwtXHtd?=
 =?Windows-1252?Q?MIeXhMghGB5B3gp/XVPV125vKR4qr3bjLhxZWjVR+0Bq1Lk0f119TL40?=
 =?Windows-1252?Q?TEZcIzQw?=
x-ms-exchange-antispam-messagedata-1: 
 D+iuLO/Zfq1LqutO/uAIcucLIIIYIiAUx5ONzCcVBC5ea4o09jz2AFFT
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB107219471CE7CCEF801347F1F8AEA2PA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fe2779-07c0-49be-00ce-08ded420530b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2026 07:47:23.0340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2b2VvkycZgXvbzAo243kd0ndeMUlMcKrlWKGWVJorjqfXeexB+4A3jcncapuKxPsbgc7eqYEKUocYePYvXdkZ++mceAIP2Uv2Yn4ThXsOg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239684

--_000_PA3PR07MB107219471CE7CCEF801347F1F8AEA2PA3PR07MB10721eu_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
I have sent the wrong version of the patch. I realized on the same issue wh=
en I created the wrynose one and I had this version in my scarthgap build.

It should have been the same that I sent for wrynose and master. Those are =
correct. It is the same libssh2 version.

I'll resend a v2 on Monday.

I really thought I sent the same patch to the three releases.

In the future, if it is the same patch to multiple branches, how should it =
be marked?

Thanks
Daniel
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Saturday, June 27, 2026 1:06 AM
To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Cc: anders.heimer@est.tech <anders.heimer@est.tech>
Subject: Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200

On Mon Jun 22, 2026 at 11:33 AM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Backport patch to fix CVE-2026-55200.
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2026-55200&data=3D05%7C02%7Cdaniel.turull%40e=
ricsson.com%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b=
87953f%7C0%7C0%7C639181119971761508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk=
iOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%=
3D%7C0%7C%7C%7C&sdata=3DtmWBrZABG8OQtWK6Cds18odLAc%2FOcm4ql3en4e0Wgio%3D&re=
served=3D0<https://nvd.nist.gov/vuln/detail/CVE-2026-55200>
>
> Upstream fix:
>   https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1=
a7a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508=
ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971778602%=
7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dct5f7AASg%2F=
MtVlbo6YFwhO4C1xrUbTzkI3J7pTZpCRM%3D&reserved=3D0<https://github.com/libssh=
2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8>
>
> Tested with ptest:
> Before: PASSED: 3, FAILED: 0, SKIPPED: 0
> After: PASSED: 3, FAILED: 0, SKIPPED: 0
>
> Reviewed-by: Anders Heimer <anders.heimer@est.tech
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../libssh2/libssh2/CVE-2026-55200.patch      | 51 +++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.p=
atch
>
> diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> new file mode 100644
> index 00000000000..f5ab9b9f204
> --- /dev/null
> +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> @@ -0,0 +1,51 @@
> +From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Fri, 12 Jun 2026 15:57:44 -0700
> +Subject: [PATCH] transport.c: Additional boundary checks for packet leng=
th
> + (#2052)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Backport Resolution: Add additional bounds checking on packet length to
> +prevent OOB write =97 checks that packet_length is not below 1 and not
> +above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.
> +
> +Conflicts Resolved:
> +
> +src/transport.c (1 conflict):
> +- Upstream uses renamed API ssh2_ntohu32(); stable branch uses
> +  _libssh2_ntohu32(). Kept stable function name while applying the
> +  new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.
> +
> +Assisted-by: kiro:claude-sonnet-4.6
> +
> +Changes from upstream commit 97acf3dfda80:
> +  - src/transport.c: adapted from upstream

While resolving the conflict, your AI completely rewrote the patch
message and notably removed the Credit: line.

Please keep the original patch message and put the backporting
information below the "Upstream-Status:" line. While you changing this,
the conflict resolution is trivial, no need to be so verbose (a line
referencing ssh2_ntohu32 should be enough).

Thanks!

> +
> +CVE: CVE-2026-55200
> +Upstream-Status: Backport [https://eur02.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda=
80c91c3a8c9f2372546301d4a1a7a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.co=
m%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0=
%7C0%7C639181119971788230%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsI=
lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%=
7C%7C&sdata=3D2qunEVqQYFYAKjgr3pUGogxQYBa9GYLKBT%2FQslEJb9o%3D&reserved=3D0=
<https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301=
d4a1a7a8>]
> +
> +Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> +---
> + src/transport.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/transport.c b/src/transport.c
> +index e1120656..d147505b 100644
> +--- a/src/transport.c
> ++++ b/src/transport.c
> +@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * sessi=
on)
> +                 total_num =3D 4;
> +
> +                 p->packet_length =3D _libssh2_ntohu32(block);
> +-                if(p->packet_length < 1)
> ++                if(p->packet_length < 1) {
> +                     return LIBSSH2_ERROR_DECRYPT;
> ++                }
> ++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
> ++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
> ++                }
> +
> +                 /* total_num may include size field, however due to exi=
sting
> +                  * logic it needs to be removed after the entire packet=
 is read
> diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipe=
s-support/libssh2/libssh2_1.11.1.bb
> index 2284d054b10..d6ee97f7ed0 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "https://eur02.safelinks.protection.outlook=
.com/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%24&data=3D05%7C02%7C=
daniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebf=
bfd47abbe52080c6b87953f%7C0%7C0%7C639181119971797263%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Db6xuzsvaWoBiC%2BiylM5H5sHW7Boo2xTy=
zR7gquZrO1g%3D&reserved=3D0{BP}.tar.gz \
>             file://run-ptest \
>             file://0001-Return-error-if-user-KEX-methods-are-invalid.patc=
h \
>             file://CVE-2026-7598.patch \
> +           file://CVE-2026-55200.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a5=
6b0f109cabf658f7"


--
Yoann Congal
Smile ECS


--_000_PA3PR07MB107219471CE7CCEF801347F1F8AEA2PA3PR07MB10721eu_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I have sent the wrong version of the patch. I realized on the same issue wh=
en I created the wrynose one and I had this version in my scarthgap build.<=
/div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
It should have been the same that I sent for wrynose and master. Those are =
correct. It is the same libssh2 version.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I'll resend a v2 on Monday.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I really thought I sent the same patch to the three releases.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
In the future, if it is the same patch to multiple branches, how should it =
be marked?</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Thanks</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Daniel</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" id=
=3D"ms-outlook-mobile-signature" dir=3D"ltr">
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;<b=
r>
<b>Sent:</b>&nbsp;Saturday, June 27, 2026 1:06 AM<br>
<b>To:</b>&nbsp;Daniel Turull &lt;daniel.turull@ericsson.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Cc:</b>&nbsp;anders.heimer@est.tech &lt;anders.heimer@est.tech&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-202=
6-55200</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">On Mon Jun 22, 2026 at =
11:33 AM CEST, Daniel Turull via lists.openembedded.org wrote:<br>
&gt; From: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-55200.<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-55200">https://eu=
r02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%2Fvu=
ln%2Fdetail%2FCVE-2026-55200&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.=
com%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7=
C0%7C0%7C639181119971761508%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7=
C%7C%7C&amp;sdata=3DtmWBrZABG8OQtWK6Cds18odLAc%2FOcm4ql3en4e0Wgio%3D&amp;re=
served=3D0</a><br>
&gt;<br>
&gt; Upstream fix:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/libssh2/libssh2/commit/97acf=
3dfda80c91c3a8c9f2372546301d4a1a7a8">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7a8=
&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508=
ded3d79154%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971778602%=
7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dct5f7AAS=
g%2FMtVlbo6YFwhO4C1xrUbTzkI3J7pTZpCRM%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Tested with ptest:<br>
&gt; Before: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
&gt; After: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
&gt;<br>
&gt; Reviewed-by: Anders Heimer &lt;anders.heimer@est.tech<br>
&gt; Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../libssh2/libssh2/CVE-2026-55200.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 51 +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-support/libssh2/libssh2_1.11.1.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 52 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026=
-55200.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch=
 b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..f5ab9b9f204<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Will Cosgrove &lt;will@panic.com&gt;<br>
&gt; +Date: Fri, 12 Jun 2026 15:57:44 -0700<br>
&gt; +Subject: [PATCH] transport.c: Additional boundary checks for packet l=
ength<br>
&gt; + (#2052)<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Backport Resolution: Add additional bounds checking on packet length =
to<br>
&gt; +prevent OOB write =97 checks that packet_length is not below 1 and no=
t<br>
&gt; +above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.<br>
&gt; +<br>
&gt; +Conflicts Resolved:<br>
&gt; +<br>
&gt; +src/transport.c (1 conflict):<br>
&gt; +- Upstream uses renamed API ssh2_ntohu32(); stable branch uses<br>
&gt; +&nbsp; _libssh2_ntohu32(). Kept stable function name while applying t=
he<br>
&gt; +&nbsp; new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.<b=
r>
&gt; +<br>
&gt; +Assisted-by: kiro:claude-sonnet-4.6<br>
&gt; +<br>
&gt; +Changes from upstream commit 97acf3dfda80:<br>
&gt; +&nbsp; - src/transport.c: adapted from upstream<br>
<br>
While resolving the conflict, your AI completely rewrote the patch<br>
message and notably removed the Credit: line.<br>
<br>
Please keep the original patch message and put the backporting<br>
information below the &quot;Upstream-Status:&quot; line. While you changing=
 this,<br>
the conflict resolution is trivial, no need to be so verbose (a line<br>
referencing ssh2_ntohu32 should be enough).<br>
<br>
Thanks!<br>
<br>
&gt; +<br>
&gt; +CVE: CVE-2026-55200<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libssh2/libs=
sh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8">https://eur02.safelink=
s.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibssh2%2Flibssh=
2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7a8&amp;data=3D05%7C02%7C=
daniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508ded3d79154%7C92e84cebf=
bfd47abbe52080c6b87953f%7C0%7C0%7C639181119971788230%7CUnknown%7CTWFpbGZsb3=
d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb=
CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D2qunEVqQYFYAKjgr3pUGogxQYBa9GY=
LKBT%2FQslEJb9o%3D&amp;reserved=3D0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; +---<br>
&gt; + src/transport.c | 6 +++++-<br>
&gt; + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/transport.c b/src/transport.c<br>
&gt; +index e1120656..d147505b 100644<br>
&gt; +--- a/src/transport.c<br>
&gt; ++++ b/src/transport.c<br>
&gt; +@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * se=
ssion)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; total_num =3D 4;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; p-&gt;packet_length =3D _libssh2_ntohu32(block)=
;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if(p-&gt;packet_length &lt; 1)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if(p-&gt;packet_length &lt; 1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_DE=
CRYPT;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; else if(p-&gt;packet_length &gt; LIBSSH2_PACKET_MAXP=
AYLOAD) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_OUT_OF_=
BOUNDARY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* total_num may include size field, however du=
e to existing<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * logic it needs to be removed after the =
entire packet is read<br>
&gt; diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/rec=
ipes-support/libssh2/libssh2_1.11.1.bb<br>
&gt; index 2284d054b10..d6ee97f7ed0 100644<br>
&gt; --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb<br>
&gt; +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb<br>
&gt; @@ -11,6 +11,7 @@ SRC_URI =3D &quot;https://eur02.safelinks.protection=
.outlook.com/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%24&amp;data=
=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C2f3364dd9a284c28d67508ded3d7915=
4%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639181119971797263%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs=
IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Db6xuzsvaWoBiC%2Bi=
ylM5H5sHW7Boo2xTyzR7gquZrO1g%3D&amp;reserved=3D0{BP}.tar.gz
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://run-ptest">file://run-ptest</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-Return-error-if-user-KEX-methods-are-invalid.patch=
">
file://0001-Return-error-if-user-KEX-methods-are-invalid.patch</a>&nbsp;\<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2026-7598.patch">file://CVE-2026-7598.patch</a>&nbs=
p;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-55200.patch">file://CVE-2026-55200.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;d9ec76cbe34db98eec3539fe2c899d26b0c=
837cb3eb466a56b0f109cabf658f7&quot;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_PA3PR07MB107219471CE7CCEF801347F1F8AEA2PA3PR07MB10721eu_--

