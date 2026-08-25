Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EE1C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 14:13:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23013.1787667189176481353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 07:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=KeOJGJuk;
 spf=pass (domain: est.tech, ip: 52.101.66.33, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URI8p4y2h8zXv2N9eIqGBE2l5X2UMt6dFa34Y7GVjU4XAwKTS4RU61HBuanm7ZnDYYNdyPxDMm8x7zfoAK98eoiM3gXUr4rhBIBS5LoqzgA527xtgeK71JRkXvmyiMJqaVu5mNC/n7BXShczD7soLWTOil3q+L/63yNRCNBhfTbLT6Gelai1yKSxxY8obXKdf/2vyNw7NAuyTv4VrgA4ROQZcD+KJa7mu9LmNDU3nPrASB5uqigqfhMo3tK2ppORNaBdAI3o6n7DSx9e8kpozm5ebg5sgRp7szsgR7MnkNA6SPDelkZqpdvBUXn7JPSRtUoKes/xHjSsAXyF3OZefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wIJfgu0x+pzyoF0GU081cT5olz4o2M8bEGQ4HK40rk=;
 b=HJeAGSVLueA80KicVY8SS+e1H0lhkjxgOn95mmulz6tg3gIprn/33z29u61On8dB6si6NrtXmkLahGKdDBR2hzikpGDt35z/mtvozRsxUSIsxE2/mFA9D2eHy5FXT/LXecolhsCV6Fnjy7JMlI6iTctMMl7C4wqvsgERXOhqojQJquUX038joC/s+MhoKE2q65HyX4F3Z3mO9RWs26NXlq7nxByKfhy6Mbz0ywMviz+/kAQ/rIetTQTyAwmQx6O1Sxp8gpMWBF7katA6H+WhkImmaH0WAxVgeNJMXD3aSBxz1o0RxmEDxYPOkqwpVwycBGYWSNEg3wbmlSylydAjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wIJfgu0x+pzyoF0GU081cT5olz4o2M8bEGQ4HK40rk=;
 b=KeOJGJukU6+p4zdVVJVrWDp9w5JrDc/anzo8hXQgYoNUPc1W3MKQy/drQVsamNfaj+eFnY/tr3j+lqR1LiSUslereLdMErrop4tNU0RRG5IxUUjieLe4sMdvcQwOTITTsl+Vrhmng4uaw1dAp1hgTsXPb1R903ZtczZqDxIFP8DYkgOtmFzpT6RFOlN7FobsJD8u3YcB14NiAfk83yDy42/Se80+Fo7DA+/U1TClhBhC4tpugN+0NpM9xoslI6Dyd/G7NN1CSk3+Anf556DtqNvrEefPv6VCbpTcA03aIyRovmq9kUExTbHRmaIDjCYwoSyngc4qRCuLqS7g8c1xLw==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DU0P189MB3182.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 14:13:05 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:13:05 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210
Thread-Topic: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210
Thread-Index: AQHdDUsrvkyu2cae50afU8kzWoYUlLZ1dhsAgDlK7YCAAFqSCg==
Date: Tue, 25 Aug 2026 14:13:05 +0000
Message-ID: 
 <AMBP189MB319674C0B7921A10AB796FAFF8AF2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260706132712.51931-1-amaury.couderc@est.tech>
 <DK2VN8KB0RQM.2Q9LKRBCIRRGZ@smile.fr> <DKXW4CIOR10C.2WL3O0DP768DB@smile.fr>
In-Reply-To: <DKXW4CIOR10C.2WL3O0DP768DB@smile.fr>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|DU0P189MB3182:EE_
x-ms-office365-filtering-correlation-id: 46cda263-f561-4387-bf33-08df02b2fb59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 OOPUt1sih2gkk/PRYkrJ80oQYbRZZ/2Xq5SRmv2eWYYp/s/zG0K9oNqgXC7ZZr+/n+a4D+nAL2m5syxYnw+rhHZOX+DU06TrXCMSrItBrstStO84p4L8HQW4NWMF3V+7+YQ1K38bVpUyOwWhtLCaeROWnsKhEP7WX3DWb0iRk5v4SMNOtBdR+IlrfVrIPlOHOi/g3XFxjQZPi0Zz7sddvPTTByVHbv9W/T2BjMpQ/7BXIJM2b9vnHVBxgwscznNUcFHv5xSbI35v85GXA8AmYVazEXiTeQRGebPDROq8KkwhBSWqrhFE9VLqMR51+UGVnK50IA/Ne3H6zia06poedI44UfXw53Ndl0XWA1fpkzhiGoFUUrqoSzgo0ptC6a8kXlXJkzKZ6hdDBO0iZ+l40Xf4ELQdttonALPlrFyaYDixJ9xtUa5oaqIzjOmubnWzcMhKzKzlFncaPhz7mVlipVMrU21uH1mGtQS1lzErZElI1lfHajNBbzcbYh4ToqvbGEtntIJZPaUbbfF7WxOitSz42oLLF6rmUtklaY0muRLoy/CMgkkqal8prxtkguMbJ3IkGXT+672S9tyhHef5Ynak690mes/pfFLlJtSQBSSWkCE+QIwB7HPn9EX2943ik/Crs4k8Xm/8Yl0fwfevLXTu+VGGK4fEpApxprekFsc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HzTNvUfkBGrTCYyc/mIHy12o/FbVYDEHwACy6+fefrdt+ckLK+tb5DyrIK?=
 =?iso-8859-1?Q?efp1/SKbBYZ58i1+6ds6/jEWsurpsSab8gy1MEWxguYsNb+w8SvcyHLUBH?=
 =?iso-8859-1?Q?Xy34Pte6SepGxiiNw/uF4Awxm4GaUVa0DvcdWG1UZ9COb0dRrAUxUjprlb?=
 =?iso-8859-1?Q?koZYQwfEkCjE2HELYKrkOtm8nb4mGqAPdp9Kbdkojp0TXqbxA9TOowyX8K?=
 =?iso-8859-1?Q?T/cfFGn8HMGD3X7yEsY3YPYrHifjLj8IHz3pv3IOET6IRM+dODfpiolCgh?=
 =?iso-8859-1?Q?tN+HBoBleAWW+vaCm2NkXq3xWzZUOh09oMi+bntPhqnae6VAbRTWtHdutl?=
 =?iso-8859-1?Q?oKH0r8pki4wcPc5YxVPObocBcJx862K5pHQJl7uyHQbsl9WAZTPFeT4k0H?=
 =?iso-8859-1?Q?9+mcz1/jF+oiBcFN8iTO9OD/YVDzSfsoVSyQwUDF995GJdAlXumGDidFCV?=
 =?iso-8859-1?Q?AiAQgzLWolMnyn7oPnDsGhYa1AIEdsdzAqEcCh4M17M4q4wIvr+iKH4Dno?=
 =?iso-8859-1?Q?pRHBNzlBZSZegZLYyfjOxBGO3DDyi9Bi4OFc+WbWX6x753ZcTFwFcGm079?=
 =?iso-8859-1?Q?YXSQ/3IGCyFIu6YCtwsTP4U+NPKRcvruKibhbgCcavi36R7nmfa04nTAXv?=
 =?iso-8859-1?Q?OKMv1Loaaxvb2NeQCH+qfFXmhZ8JMhV1i2O+aqdvg8EK/gHpKQHo7MX+Qc?=
 =?iso-8859-1?Q?7Mopjlhspty+7i6E9JOc9D0Kbgb65NPlIP4KkH08WzUmSAfQO0adh54SCg?=
 =?iso-8859-1?Q?wN8yko0y0gRHMtO6sfjFnV3Vh4M3C/pMfV1LIPb+CjDuf+CuGmBACZbDhX?=
 =?iso-8859-1?Q?noQkz2c+khG2AAnBAbjCn8jQraQmcxlktWuq0ogAtV0XD0wojcuMr5P46g?=
 =?iso-8859-1?Q?WP8uqPAyTpp15LxIswOWMWvGydGsa33BR8yOatUsPV5123OKWs6Dk4m40r?=
 =?iso-8859-1?Q?eIqIcA1T6ZL+c9g06m9wtAxrnBFCJgPlpGqt7zL/CrKyHNxLduAElG+r2z?=
 =?iso-8859-1?Q?ux9GfnBjOsfL6jo9JTcbPgYwWMMmQ4zNOY7oL3udw+WWEPoyLv3WjjP0c7?=
 =?iso-8859-1?Q?D31KBvSw28YPENsp4knNvK9XKiIa5/VMeucPgMNeEzpxWKUj26ys+fFsGL?=
 =?iso-8859-1?Q?dkVUkAjXXe+kPEO4mDh/C9ftXaZHZv15wUP5+N/rlySd9mQAiSOmtRKaYB?=
 =?iso-8859-1?Q?URp3SS/20sA+Ia8eP7vbJE+diCGYsQSE+dhAQUJ6sTr7CRJl2aMJ1/gtV9?=
 =?iso-8859-1?Q?dL8WFTjyKlDtj/buDrtON3HgkrK9YPsIZY9HVVAjxEfF75EgVQfWvvWy/F?=
 =?iso-8859-1?Q?XQ1TnVhTqcCgOCgDO9SINTh49sWg+IsXRGcNr05+SxjFsPbyAxyo/3ymBI?=
 =?iso-8859-1?Q?M+L5Po0arxS/FFAkI+0wnGBE/oN1dPYIcjxw3qLTnxabfKIQwBLSbu/8/L?=
 =?iso-8859-1?Q?a3sFUMbmBmfRQ9ZSZreXm5Py8GtE914q7xu4/hlVF5SgiAG4jUXK4Hr77O?=
 =?iso-8859-1?Q?XnWMlTAYQM4auhCymYRGruG330Z5qgZ4t6CTpj3yJ+DPsXCvlyOzJczh1c?=
 =?iso-8859-1?Q?jgF5xkLtf/vPBebgacrGWdVgVeUChlhWzw7m2UQumjkZbObzdC9Gq2ANf6?=
 =?iso-8859-1?Q?7ruCc2I82KLb0vTryRRznAXJV8G8b9nJ3vpwtmkzTXGgZfXCQ4dK7ElEfk?=
 =?iso-8859-1?Q?wh74TXNCv1HmTMIdZWBuMRDALqhJXauaPfX+hz1C/Xp6cOTL2wvZLiispV?=
 =?iso-8859-1?Q?8HalfWZCqISq5eA771C1nhOtK+z32pPJR+u8gocGkMZ9ppbywI9iLnszxB?=
 =?iso-8859-1?Q?bfUpKv0Krw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cda263-f561-4387-bf33-08df02b2fb59
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 14:13:05.3690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PR1K/hxN7U4nz8gxsts0wZI2qIQ6yGDEv3Z62JnfNW0l3mZGMHAvomY1V1yblvnTTBv1kisMXAYU3HUGKkJQZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244243

Hi Yoann,

Thanks for the reminder, I believe I sent a v4 of this patch here
https://lists.openembedded.org/g/openembedded-core/message/242445

Later on this patch has been merged in scarthgap the 18th of august:
https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recip=
es-devtools/python/python3/CVE-2026-7210.patch

Here are the changes to v4:

[yocto: Use weak symbol detection for XML_SetHashSalt16Bytes instead of
XML_COMBINED_VERSION >=3D 20800, since our backported expat 2.6.4 provides
the function but does not bump the version macros.]

Let me know if you need further input from my side ,

Kind Regards,

Amaury

________________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, 25 August 2026 10:43
To: Yoann Congal; Amaury Couderc; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210

On Sun Jul 19, 2026 at 11:48 PM CEST, Yoann Congal wrote:
> Hello,
>
> On Mon Jul 6, 2026 at 3:26 PM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
>> From: Amaury Couderc <amaury.couderc@est.tech>
>>
>> CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
>> Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
>> An attacker can craft XML input that forces O(n=B2) hash collisions in
>> libexpat's internal name dictionary, causing excessive CPU consumption.
>>
>> The previous mitigation seeded libexpat's hash function with only 4
>> bytes of entropy, which is insufficient against a determined attacker.
>> This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
>> providing a full 16-byte secret. Older expat versions fall back
>> gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
>>
>> Backport patch to fix CVE-2026-7210.
>> https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>>
>> Upstream fix:
>>   https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442=
fcd495391e4
>>
>> Tested with ptest:
>> Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
>> After: PASSED: 40020, FAILED: 0, SKIPPED: 1882
>>
>> CVE: CVE-2026-7210
>>
>> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> ---
>>
>> NOTE: CVE-2026-7210 full mitigation requires the companion
>>     expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
>>
>> .../python/python3/CVE-2026-7210.patch        | 122 ++++++++++++++++++
>>  .../python/python3_3.12.13.bb                 |   1 +
>>  2 files changed, 123 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.p=
atch
>>
>> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/=
meta/recipes-devtools/python/python3/CVE-2026-7210.patch
>> new file mode 100644
>> index 0000000000..8acf174a0a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
>> @@ -0,0 +1,122 @@
>> +From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
>> +From: Stan Ulbrych <stan@python.org>
>> +Date: Sun, 10 May 2026 18:36:26 +0100
>> +Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
>> + `pyexpat`/`_elementtree` when possible (#149023)
>> +
>> +
>> +CVE: CVE-2026-7210
>> +Upstream-Status: Backport [https://github.com/python/cpython/commit/24b=
8f12544468e4cedf5bfbe25442fcd495391e4]
>> +
>> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> +---
>> + Include/pyexpat.h                                      |  3 +++
>> + Include/pyhash.h                                       |  8 +++++---
>> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
>> + Modules/_elementtree.c                                 |  8 ++++++--
>> + Modules/pyexpat.c                                      | 10 +++++++++-
>> + 5 files changed, 26 insertions(+), 6 deletions(-)
>> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-is=
sue-149018.a9SqWb.rst
>
> The patched files have slighty changed
> Include/internal/pycore_pyhash.h -> Include/pyhash.h
> This time, I could check that nothing important changed but next time
> I'd like a like a little change log about what changed between upstream
> and the imported patch.
>
>> [...]
>> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
>> +index 79492ca5c4f..388473d3855 100644
>> +--- a/Modules/pyexpat.c
>> ++++ b/Modules/pyexpat.c
>> +@@ -1388,7 +1388,10 @@ newxmlparseobject(pyexpat_state *state, const ch=
ar *encoding,
>> +         Py_DECREF(self);
>> +         return NULL;
>> +     }
>> +-#if XML_COMBINED_VERSION >=3D 20100
>> ++#if XML_COMBINED_VERSION >=3D 20800
>> ++    /* This feature was added upstream in libexpat 2.8.0. */
>> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt=
16);
>> ++#elif XML_COMBINED_VERSION >=3D 20100
>> +     /* This feature was added upstream in libexpat 2.1.0. */
>> +     XML_SetHashSalt(self->itself,
>> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
>> +@@ -2257,6 +2260,11 @@ pyexpat_exec(PyObject *mod)
>> + #else
>> +     capi->SetHashSalt =3D NULL;
>> + #endif
>> ++#if XML_COMBINED_VERSION >=3D 20800
>> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
>> ++#else
>> ++    capi->SetHashSalt16Bytes =3D NULL;
>> ++#endif
>> + #if XML_COMBINED_VERSION >=3D 20600
>> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
>> + #else
>
> We did not upgrade expat but patched in the fixing API
> XML_SetHashSalt16Bytes. Can you check we can activate the fixed code
> path with those "#if XML_COMBINED_VERSION >=3D 20800"?
>
> I will hold the patch in the meantime, I really want to avoid a false
> negative in CVE data.

Hello,

Gentle ping for the above

Regards,
--
Yoann Congal
Smile ECS


