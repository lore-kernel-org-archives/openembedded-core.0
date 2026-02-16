Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DE6E8383D
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 21:52:35 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4049.1771276030109112870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 13:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HUhw1D68;
 spf=pass (domain: siemens.com, ip: 52.101.65.68, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQXLQaIXsvrpNuh6XV6j5ZDJP3pckAndm+tRDGbB8Nbn+v6SuYaVBo7YYgpTGt4RR324R44C/i3UzPo1rUffS8v3kQV54YvsRrFhZDW/BWvJy/+1NQAPr2MyFa93PgsL4OH3VHYCoL2+O7GaEqNnf4/Ng5T7bU0LVfUurHUt/QgmaW+2OTneHh87ljmIK/TJ2xsoEPkonMUID3cWmFyv0TtzsDCUg6lDC8grNTYXhQJAv4EnyhwAsyfh1K7+DD/9DpMDnSFmxaoW+xHBgVH8cVIHs8kjLg7mTQ1nQwstXNIBxn0Crd1u7I9Qoc3ZsQ8txcgA47afb/Ch6fu0b1cv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d33vJpV4tIcEU3xDDzJWem4NaUut97BaqV654PFpnz0=;
 b=WdTTisMixJp85y32+RYnl6YDZPGEwKGJkSxLiCvBckJdVj19nSIlTi/xYXR77snlLxWQBH58mnEm9xLUGXvLrMDCnMliNN7qPOa1qiFgySXpVJllSWah0lT72jIXiWOpDZ80qTSyNysmd9f7SPkITAxNvHkBlUc71e05By8CsTAGR/sveg9bKJgolz7oFytgWPQ8svQ8OlcIH0Y6X2DoS9DaMCP3FGTBnzjvDu34EAHgDyNHawHX0+KQDcecjR4uFGtc4ZIOjhRfPm8I+Yzp80xM60vDCucjb/ezcOJK3pX16GqRAGglyrE2W074sjf/+f3um8JvKNln285csBP+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d33vJpV4tIcEU3xDDzJWem4NaUut97BaqV654PFpnz0=;
 b=HUhw1D68DFEcHyQjfdD0RPS+EtsiHPWv0qpKWcboTd5s1eUB3hI47QWZfGq4NLvz1j8F5l7nL2RNQFSvDlNzoU9WkVI2mE512XgoaBUe7AR0WT2/5qavMAGYgOwkn6nvnoTPCr0ttk2EYqSTjwR5hsPazhNtmyENT1bwEDcS9MxDRWdGTD8KWmDvA3lmKL6CS+zRafy2+Nvo8dIMtKZnJugKkVqTliLl6iP38gEIaFBitcNnHzN/Onre/OW1MvbguRk4p6O5oT6Fyxj4DGQoTxQmIE6lpam26NbJpmiRlbqdn2OQ7AWF6M5QBu3peITBQW5BciNB1/sBnO+Bsardqw==
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::20)
 by AS2PR10MB7129.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 20:51:37 +0000
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7]) by AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 20:51:37 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>, "stondo@gmail.com" <stondo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>, Joshua Watt <jpewhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v4] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
Thread-Topic: [OE-core] [PATCH v4] spdx30_tasks: Add concluded license support
 with SPDX_CONCLUDED_LICENSE
Thread-Index: AQHcgAGn5iDUAZV8mEaG9SR9uLuOKLV8Dv0AgAn8kfk=
Date: Mon, 16 Feb 2026 20:51:37 +0000
Message-ID: 
 <AS4PR10MB5441422F7C949A1B457DF3A9AC6CA@AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM>
References: <20260106112557.53709-1-stondo@gmail.com>
 <20260107181541.141957-1-stondo@gmail.com>
 <96B2C029-D85F-4114-8C01-4BCCD7B999E1@arm.com>
In-Reply-To: <96B2C029-D85F-4114-8C01-4BCCD7B999E1@arm.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-16T20:51:36.622Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5441:EE_|AS2PR10MB7129:EE_
x-ms-office365-filtering-correlation-id: bac25a5b-d46a-4fa2-eb2b-08de6d9d2d75
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|39142699007|31052699007|1800799024|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?SKSNkyhL0wfKDReH4iETYfqezOP1r7AC+FjvGl7U/sIzo5h2XNwtjsrP?=
 =?Windows-1252?Q?tv0Ejd1bo04Ynp3pAPu9GIsZInLOsS4qaBo4L+cSuK2X1AH+KGVcLGcY?=
 =?Windows-1252?Q?Aioh+C5/uor18NdR4+y8A3Iz9ZlxNkz7KEQUkoqDmYjXrSAv4Btqolnp?=
 =?Windows-1252?Q?Vpo7OFjpWtknnnYVwJ1xWdbLemsHPalAFFEl/w5eRpQZWnykj89mMhYO?=
 =?Windows-1252?Q?m/0n1jgjHuEaqY4k6vqXRqNAs84QIS0jTCqko0t21Cj7GpEkb4/CeNJ8?=
 =?Windows-1252?Q?XLXD8mi5yi5i/SQBttVY/QqdHDGfR8fH12M63diHlAtX8b1eSfWjLMB9?=
 =?Windows-1252?Q?XHU56Ub608GpDM0LzU2F2/CzNQeUlC0K6XACaJ7Ccb502OKr2Fqd1XIw?=
 =?Windows-1252?Q?A/5AkQbotV1FvEDBNrVxXLAmwltZLTPyxQKsBhM9Dpn5yfIlbzA/CeRu?=
 =?Windows-1252?Q?M5QkCb2cCqL6cstop4K7MgZwXDk0ngQ1h7sj9Q2/0fzfeTQa9ai6UYsA?=
 =?Windows-1252?Q?5AXeWBeqtu/EmWTD7m4bnyINMcs7B0YKgNQSL6+PTNU7SVBTBhzapriq?=
 =?Windows-1252?Q?I8NKctPdU+4PZDLyX0QdfDId8L1mMgUi3BU1ASTnqZtRVv6NFqkFwB0E?=
 =?Windows-1252?Q?fm7xo4kgSdxd5qVyQWYh/i1huPUkGHnpCuYckHrkdCEvNQc7zTriM8gN?=
 =?Windows-1252?Q?eGM2+spvuobYaT4vxCBA9rdTMZ1tkmoIz18rzkdId5+JAlQ8bvWGdYP/?=
 =?Windows-1252?Q?UeRJNJP3aNiTWqripSjWA0FMBLMxM4EyjMGc+sxiBdHYyaFxLV3hTZAI?=
 =?Windows-1252?Q?s1Xb4hGVKXFfk6KM5AIC1+X8c5cnH+a6aoCYr4F+hzY7+TOWZ2bwjLaw?=
 =?Windows-1252?Q?lNyr+MUGDu+Fl1A5Fn0/G8avtCwCVbjIjmRbsYK+0eF4WsPkHVMVFk5U?=
 =?Windows-1252?Q?GBeNY8e/MuC5Zbq7oIBbkwtgC4DWHHyr55idwQjgX6S8uubFWQYA4ayk?=
 =?Windows-1252?Q?cB4NFSCQ5TN2LQ6eIyqqgIqIKIfH4IIzoGbAiOAiRBfLlnpblIVIhBz+?=
 =?Windows-1252?Q?UuH94TPSIa/1Yu+UotnGSPunqhovhsrQWE0zc0OqNwgujaNyAhGcbwmV?=
 =?Windows-1252?Q?46vb5eSjatmwHAfr1cCf/6LAa0105aFEtOs0T+3S2Adx7wVw1T65fGTp?=
 =?Windows-1252?Q?ZGVGvC+6FoqGhWwNB85AkfBBK+wyMYnUXicNeRwQC4wDymx8/lbYWoRJ?=
 =?Windows-1252?Q?jyw3lYhWlrajx8nyz4KYW2avxmeZJgIPDy75n6hJB39G9SgR8zQQQeMl?=
 =?Windows-1252?Q?w8B8p0ssdjm4eNf+bhDV7Wt2GucWxBEriwqysgQYaIFgjbCWERHWuL2Q?=
 =?Windows-1252?Q?6kqt3wr3ywpianzLINbprgByycauKjk/BRCMpbW+HvRa/zFJXTdwaPLt?=
 =?Windows-1252?Q?qLCUlKKdCBDbYCjwmzRlf6ZtaknH9AbPqebMFQgM16JNHdm4o0Ywwo7z?=
 =?Windows-1252?Q?Mc3hFyt+G5RHQyy1+YJqKwG8fgZDq2ldthM1hYEftED1JQph4SwptZaz?=
 =?Windows-1252?Q?2mSLgKkNKGYS5nbnuqGtGxxmoRyP3BJzNOLD+M/EL/c9/vtQVdnXost8?=
 =?Windows-1252?Q?QPgbyEYwgxOnJifv7Itd7TFJ+d1vaR2LePq+iDhml/3I7js92iLESYAl?=
 =?Windows-1252?Q?z97kp1zqRTOLo6tC/mN314654+9t9NllyAFgyPwXU+1s+7dQbFkx2AtT?=
 =?Windows-1252?Q?675eHMm+NN0GlKGp27A=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(39142699007)(31052699007)(1800799024)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?5KIukkIyJZ1LB7Faz0ug21413/TsevgLDBRdgqPvbpknKgDwiPumrIF7?=
 =?Windows-1252?Q?+xgF5+sTIZWoMz4tFFzaIiaKq99urxcaIuEoBTLUr/YODhLIccALzMsm?=
 =?Windows-1252?Q?t15ODMk8D/DfwitKC7iCTkLv/to/TfwAtdgG20+VXEbg3DOPfootZadc?=
 =?Windows-1252?Q?UFuRsHSr7wvUwGQ4hy5NaRP1m7COB4rvqZWW9cX5sf955XXlr1VxS0nW?=
 =?Windows-1252?Q?XPlSOjGyJd/o8A7JOYqOCKrWdbcocioxnm88fVD1iO3LQlfdMM0vaLa7?=
 =?Windows-1252?Q?kXageM7QXDAMx5ycrqcSOsmfgGIzyosVEiz29ZKloH/Tfb7tIoQq8uHU?=
 =?Windows-1252?Q?+KhTGdCPexNULaXr0BzpswdV93GPaaYqOPvIPB7jMzK6AnEyJ5/ugGaA?=
 =?Windows-1252?Q?M856u5EGhS1PL7jQDR92NK64WoDSddUDbIm2DN9sWyz43TpHFC/JAull?=
 =?Windows-1252?Q?bK7/ITUaRo2fVdXIiIqYTF2cSpZ2bvxyYD6pwwqQArsyBd7qH4pmPdQC?=
 =?Windows-1252?Q?hC2F3qeW4OEafFm2SzwEsMXjfNzk3vMytq1HbkueIqURYXtb965oH/Z3?=
 =?Windows-1252?Q?cVw8FxUd3ZKSxpaxtiQjdP8I+7BOv9ERzFTPMg4hsyFZk1Dq58HJxxvu?=
 =?Windows-1252?Q?ieA+ChtbR8wuLk9e5rwApWHIsWpbgIaGfWESbl5/AWnWxLMeU8tc0yor?=
 =?Windows-1252?Q?Noj9+yaDKt4YKBABXIjJqK00/dkT+jURPWf4ieCbjO74GMPtuVAI22QQ?=
 =?Windows-1252?Q?JQa4E8o5NaLu2a0L27LbUdP+3IJ03ChCVmcqeaqwMa7/jTDILApk/Q02?=
 =?Windows-1252?Q?ZHIw9MWVj3kVMyq4Zr4ErjfiHZLxl4nqYmhGliNo7+9X6R6tlp9OvsjN?=
 =?Windows-1252?Q?T9cDpCbz5/Prvs/E7XaSV2fg0OnKdO0Y0xSp8IhQvxif8r2P5EFL9nPp?=
 =?Windows-1252?Q?WbIrtqxptm+0pWgKwTH4GfelYev0qDZOQ83/n3bq5cPXt0QI5eDGXq5H?=
 =?Windows-1252?Q?M/Vf/1u9l82phzVhpgvLJyHaFF1kXnpCQQH2eMMG+fVdSJ4nphLR5+9l?=
 =?Windows-1252?Q?ty34Ud0qxPNf0LgcoVUuNGqxWWdMsRrTdqtawTH/GwVjJnCspL8BkgAD?=
 =?Windows-1252?Q?FkIDJKL3djvIqpdDSS50iTpV4PPSj8Pu37DTLNpj+ClkXsPnPoRsWMcA?=
 =?Windows-1252?Q?emdM6U/Qalu8iSZ/Qnhyznbd1etHkrzvaaEkoOFWqa0jsE0a3sb3bPp/?=
 =?Windows-1252?Q?tH5wSWF3DKrvvwHTnYH2KXzOmNSNzQ+AygplOuZ7m4/tun21XNx9kLKo?=
 =?Windows-1252?Q?ugkWoe7afDvflx3q7o8wChZrnQeQPntHrJ2P8bS/xVqKlL4wIBEx5qyD?=
 =?Windows-1252?Q?aJTFs/TcLPXrExaSA7BoXqfgmMn5bAHmP4lV6NYJsP39ghIFIvPXzsVd?=
 =?Windows-1252?Q?ANbktjYdETPOKmV5aYmOTi2zBvsdqp3fFhoYO3mXFrz89CtiwfYopUOf?=
 =?Windows-1252?Q?MdD90/oGy6T/HABDoId3/IzetmwwveUiejS1TiRV5jR8RrMpwAY23m76?=
 =?Windows-1252?Q?4J2W5zvCyPCWSii63KPg01z6QqhIzBRW8uyYbKn/nSY1RJtGMxunbSQF?=
 =?Windows-1252?Q?zaoHzHSIkFFUCzlNFBEZDJFKoxk75OGNMcE3KmKtjEYxvMjvCvL0Ax+h?=
 =?Windows-1252?Q?AVo5jBopKW4YhsoEDkWU2ULjzYf3M0wSMPR6glTeQIzkW289HUR5STl2?=
 =?Windows-1252?Q?uVI4i+x3gXqgKA/VLAnDGRafBfCOvrHufKzQ0suljN14rgYZkEz+hqFz?=
 =?Windows-1252?Q?ZAq7Z4Au14rQD5srLQwDdWlBQm2Ut5uFRJfSBApSmxu3fXT8N6/hDqNj?=
 =?Windows-1252?Q?91c48qcVCX0Kuz8/BkRrs9KUCcIJtpQkxxY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bac25a5b-d46a-4fa2-eb2b-08de6d9d2d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 20:51:37.2925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUT5umeaANHemRbu80XY71/sO3HNZ3PG5cjW7kWaSVWzkS0kStg7u8o2C4JumD/ZNnGjh7MOQ3xmAkPCkxRGZfIw1zbjAZUkvp5pPUak9O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7129
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB5441422F7C949A1B457DF3A9AC6CAAS4PR10MB5441EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 21:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231224

--_000_AS4PR10MB5441422F7C949A1B457DF3A9AC6CAAS4PR10MB5441EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From 4b9338d0083d1b79319a82e9e6858c553ea3111c Mon Sep 17 00:00:00 2001
From: Stefano Tondo <stefano.tondo.ext@siemens.com>
Date: Mon, 16 Feb 2026 21:40:14 +0100
Subject: [OE-core][PATCH] oeqa/selftest: Add test for SPDX_CONCLUDED_LICENS=
E
 behavior

Add a selftest for the SPDX_CONCLUDED_LICENSE variable (introduced in
commit bb21c6a429) to verify the conditional behavior doesn't change
or break, as requested during review.

The test verifies three scenarios:
1. Global SPDX_CONCLUDED_LICENSE creates a hasConcludedLicense
   relationship on the package
2. Package-specific override (SPDX_CONCLUDED_LICENSE:<pkg>) takes
   precedence over the global value
3. When unset, no hasConcludedLicense relationship is added

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py
index 41ef52fce1..13386ef648 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -146,6 +146,118 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.=
spdx.json",
         )

+    def test_concluded_license(self):
+        """
+        Test that SPDX_CONCLUDED_LICENSE creates a hasConcludedLicense
+        relationship with correct conditional behavior:
+
+        1. When SPDX_CONCLUDED_LICENSE is set, a hasConcludedLicense
+           relationship is added to the package
+        2. Package-specific overrides (SPDX_CONCLUDED_LICENSE:<pkg>)
+           take precedence over the global value
+        3. When unset, no hasConcludedLicense relationship is present
+        """
+        # Test 1: Verify hasConcludedLicense is created when variable is s=
et
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.=
spdx.json",
+            extraconf=3D"""\
+                SPDX_CONCLUDED_LICENSE =3D "MIT"
+                """,
+        )
+
+        # Find base-files package
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if "base-files" in pkg.name:
+                break
+        else:
+            self.assertTrue(False, "Unable to find base-files package")
+
+        # Verify hasConcludedLicense relationship exists
+        for rel in objset.foreach_type(oe.spdx30.Relationship):
+            if (
+                rel.relationshipType
+                =3D=3D oe.spdx30.RelationshipType.hasConcludedLicense
+                and any(pkg._id =3D=3D f._id for f in rel.from_)
+            ):
+                self.assertGreater(
+                    len(rel.to),
+                    0,
+                    "hasConcludedLicense should reference a license",
+                )
+                break
+        else:
+            self.assertTrue(
+                False,
+                "SPDX_CONCLUDED_LICENSE should create hasConcludedLicense =
relationship",
+            )
+
+        # Test 2: Verify package-specific override takes precedence
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.=
spdx.json",
+            extraconf=3D"""\
+                SPDX_CONCLUDED_LICENSE =3D "GPL-2.0-only"
+                SPDX_CONCLUDED_LICENSE:base-files =3D "BSD-3-Clause"
+                """,
+        )
+
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if "base-files" in pkg.name:
+                break
+        else:
+            self.assertTrue(False, "Unable to find base-files package")
+
+        for rel in objset.foreach_type(oe.spdx30.Relationship):
+            if (
+                rel.relationshipType
+                =3D=3D oe.spdx30.RelationshipType.hasConcludedLicense
+                and any(pkg._id =3D=3D f._id for f in rel.from_)
+            ):
+                # Verify the concluded license is the package-specific one
+                for to_id in rel.to:
+                    for lic in objset.foreach_type(
+                        oe.spdx30.simplelicensing_AnyLicenseInfo
+                    ):
+                        if lic._id =3D=3D to_id._id and hasattr(
+                            lic, "simplelicensing_licenseExpression"
+                        ):
+                            self.assertIn(
+                                "BSD-3-Clause",
+                                lic.simplelicensing_licenseExpression,
+                                "Package-specific override should take pre=
cedence",
+                            )
+                            break
+                break
+        else:
+            self.assertTrue(
+                False,
+                "Package-specific SPDX_CONCLUDED_LICENSE should create rel=
ationship",
+            )
+
+        # Test 3: Verify no hasConcludedLicense when variable is unset
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.=
spdx.json",
+        )
+
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if "base-files" in pkg.name:
+                break
+        else:
+            self.assertTrue(False, "Unable to find base-files package")
+
+        for rel in objset.foreach_type(oe.spdx30.Relationship):
+            if (
+                rel.relationshipType
+                =3D=3D oe.spdx30.RelationshipType.hasConcludedLicense
+                and any(pkg._id =3D=3D f._id for f in rel.from_)
+            ):
+                self.assertTrue(
+                    False,
+                    "No hasConcludedLicense should exist when SPDX_CONCLUD=
ED_LICENSE is unset",
+                )
+
     def test_gcc_include_source(self):
         objset =3D self.check_recipe_spdx(
             "gcc",
--
2.53.0
________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, February 10, 2026 13:19
To: stondo@gmail.com <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) <stefano.tond=
o.ext@siemens.com>; Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com=
>; Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>; =
Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v4] spdx30_tasks: Add concluded license suppo=
rt with SPDX_CONCLUDED_LICENSE

Hi Stefano,

> On 7 Jan 2026, at 18:15, Stefano Tondo via lists.openembedded.org <stondo=
=3Dgmail.com@lists.openembedded.org> wrote:
> Add hasConcludedLicense relationship to SBOM packages with support for
> manual license conclusion override via SPDX_CONCLUDED_LICENSE variable.
>
> The concluded license represents the license determination after manual
> or external license analysis. This should be set manually in recipes or
> layers when:
>
> 1. Manual license review identifies differences from the declared LICENSE
> 2. External license scanning tools detect additional license information
> 3. Legal review concludes a different license applies
>
> The hasConcludedLicense relationship is ONLY added to the SBOM when
> SPDX_CONCLUDED_LICENSE is explicitly set. When unset or empty, no
> concluded license is included in the SBOM, correctly indicating that
> no license analysis was performed (per SPDX semantics).

Could you add a test case to oeqa to this, so that we know the conditional =
behaviour doesn=92t change or break?

Thanks
Ross

--_000_AS4PR10MB5441422F7C949A1B457DF3A9AC6CAAS4PR10MB5441EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
From 4b9338d0083d1b79319a82e9e6858c553ea3111c Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
From: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Date: Mon, 16 Feb 2026 21:40:14 +0100</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Subject: [OE-core][PATCH] oeqa/selftest: Add test for SPDX_CONCLUDED_LICENS=
E</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;behavior</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Add a selftest for the SPDX_CONCLUDED_LICENSE variable (introduced in</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
commit bb21c6a429) to verify the conditional behavior doesn't change</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
or break, as requested during review.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The test verifies three scenarios:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
1. Global SPDX_CONCLUDED_LICENSE creates a hasConcludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp;relationship on the package</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2. Package-specific override (SPDX_CONCLUDED_LICENSE:&lt;pkg&gt;) takes</di=
v>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp;precedence over the global value</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
3. When unset, no hasConcludedLicense relationship is added</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Signed-off-by: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
---</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;meta/lib/oeqa/selftest/cases/spdx.py | 112 ++++++++++++++++++++++++++=
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;1 file changed, 112 insertions(+)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
index 41ef52fce1..13386ef648 100644</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
--- a/meta/lib/oeqa/selftest/cases/spdx.py</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+++ b/meta/lib/oeqa/selftest/cases/spdx.py</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
@@ -146,6 +146,118 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;{DEPLOY_DIR_SPDX}/{MA=
CHINE_ARCH}/packages/package-base-files.spdx.json&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp;def test_concluded_license(self):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;Test that SPDX_CONCLUDED_LICENSE creates a has=
ConcludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;relationship with correct conditional behavior=
:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;1. When SPDX_CONCLUDED_LICENSE is set, a hasCo=
ncludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; relationship is added to the package</=
div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;2. Package-specific overrides (SPDX_CONCLUDED_=
LICENSE:&lt;pkg&gt;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; take precedence over the global value<=
/div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;3. When unset, no hasConcludedLicense relation=
ship is present</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Test 1: Verify hasConcludedLicense is create=
d when variable is set</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;objset =3D self.check_recipe_spdx(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;base-files&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/packages/package-base-files.spdx.json&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extraconf=3D&quot;&quot;&quot;\<=
/div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SPDX_CONCLUDED_LIC=
ENSE =3D &quot;MIT&quot;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;=
,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Find base-files package</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if &quot;base-files&quot; in pkg=
.name:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;else:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(False, &quot;Una=
ble to find base-files package&quot;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Verify hasConcludedLicense relationship exis=
ts</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for rel in objset.foreach_type(oe.spdx30.Relat=
ionship):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rel.relationshipTy=
pe</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D=3D oe.spdx30.R=
elationshipType.hasConcludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and any(pkg._id =
=3D=3D f._id for f in rel.from_)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertGreater=
(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;len(=
rel.to),</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0,</=
div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;hasConcludedLicense should reference a license&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;else:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;False,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;SPDX_CONCLUD=
ED_LICENSE should create hasConcludedLicense relationship&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Test 2: Verify package-specific override tak=
es precedence</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;objset =3D self.check_recipe_spdx(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;base-files&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/packages/package-base-files.spdx.json&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extraconf=3D&quot;&quot;&quot;\<=
/div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SPDX_CONCLUDED_LIC=
ENSE =3D &quot;GPL-2.0-only&quot;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SPDX_CONCLUDED_LIC=
ENSE:base-files =3D &quot;BSD-3-Clause&quot;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;=
,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if &quot;base-files&quot; in pkg=
.name:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;else:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(False, &quot;Una=
ble to find base-files package&quot;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for rel in objset.foreach_type(oe.spdx30.Relat=
ionship):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rel.relationshipTy=
pe</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D=3D oe.spdx30.R=
elationshipType.hasConcludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and any(pkg._id =
=3D=3D f._id for f in rel.from_)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Verify the concl=
uded license is the package-specific one</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for to_id in rel.t=
o:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for =
lic in objset.foreach_type(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;oe.spdx30.simplelicensing_AnyLicenseInfo</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;):</=
div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;if lic._id =3D=3D to_id._id and hasattr(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;lic, &quot;simplelicensing_licenseExpression&quot;<=
/div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;self.assertIn(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;BSD-3-Clause&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lic.simplelicensing_licenseExpression=
,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Package-specific override shoul=
d take precedence&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;else:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;False,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Package-spec=
ific SPDX_CONCLUDED_LICENSE should create relationship&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Test 3: Verify no hasConcludedLicense when v=
ariable is unset</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;objset =3D self.check_recipe_spdx(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;base-files&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/packages/package-base-files.spdx.json&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if &quot;base-files&quot; in pkg=
.name:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;else:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(False, &quot;Una=
ble to find base-files package&quot;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;for rel in objset.foreach_type(oe.spdx30.Relat=
ionship):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rel.relationshipTy=
pe</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D=3D oe.spdx30.R=
elationshipType.hasConcludedLicense</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and any(pkg._id =
=3D=3D f._id for f in rel.from_)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(</=
div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Fals=
e,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;No hasConcludedLicense should exist when SPDX_CONCLUDED_LICENSE is unset&=
quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;def test_gcc_include_source(self):</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;objset =3D self.check_recipe_spdx(</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;gcc&quot;,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
--&nbsp;</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
2.53.0</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Tuesday, February 10, 2026 13:19<br>
<b>To:</b> stondo@gmail.com &lt;stondo@gmail.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) =
&lt;stefano.tondo.ext@siemens.com&gt;; Marko, Peter (FT D EU SK BFS1) &lt;P=
eter.Marko@siemens.com&gt;; Freihofer, Adrian (SI
 B PRO TI EAC CCP) &lt;adrian.freihofer@siemens.com&gt;; Joshua Watt &lt;JP=
EWhacker@gmail.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v4] spdx30_tasks: Add concluded licens=
e support with SPDX_CONCLUDED_LICENSE</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Stefano,<br>
<br>
&gt; On 7 Jan 2026, at 18:15, Stefano Tondo via lists.openembedded.org &lt;=
stondo=3Dgmail.com@lists.openembedded.org&gt; wrote:<br>
&gt; Add hasConcludedLicense relationship to SBOM packages with support for=
<br>
&gt; manual license conclusion override via SPDX_CONCLUDED_LICENSE variable=
.<br>
&gt; <br>
&gt; The concluded license represents the license determination after manua=
l<br>
&gt; or external license analysis. This should be set manually in recipes o=
r<br>
&gt; layers when:<br>
&gt; <br>
&gt; 1. Manual license review identifies differences from the declared LICE=
NSE<br>
&gt; 2. External license scanning tools detect additional license informati=
on<br>
&gt; 3. Legal review concludes a different license applies<br>
&gt; <br>
&gt; The hasConcludedLicense relationship is ONLY added to the SBOM when<br=
>
&gt; SPDX_CONCLUDED_LICENSE is explicitly set. When unset or empty, no<br>
&gt; concluded license is included in the SBOM, correctly indicating that<b=
r>
&gt; no license analysis was performed (per SPDX semantics).<br>
<br>
Could you add a test case to oeqa to this, so that we know the conditional =
behaviour doesn=92t change or break?<br>
<br>
Thanks<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_AS4PR10MB5441422F7C949A1B457DF3A9AC6CAAS4PR10MB5441EURP_--

