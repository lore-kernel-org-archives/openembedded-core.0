Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820AECDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:49:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39421.1782121767454444698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 02:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=knkoZPXg;
 spf=pass (domain: ericsson.com, ip: 52.101.69.28, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n578IbDA5FEwUCAKGaL2AP65rFRv6ynnjFlC8hyZhVWh8LldhTgkO1kvMoLT7EfaI+3S0EZ3+uDzcPxCEZEXjziouvZCo016Uny5eK8UkFnKhGUQHbhmStW7OetPVbH1pLUlSztaOSaSpzlp8ZSxKxVPUZR3uHmr9RuXR2+jKPeYeeYooWkYV7Qwepub8nZ+hKZi2uFq3TkWcT7kNMATMtlAEMTrTxagGAGrxcjvhxRaYgSzqv+8fllmPhkv9d/nviw+zTgC5/LxRcaenA+i/34RCGBSF4ZxDn0nsdsq7mS43LcXa6s4X/eSuCZ0DAB8bm/bemNOCtG1Dtdcqi6uWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjIPBb//NycKEX4EHvaAENKtVBeIbnu/Kx8uStcptAM=;
 b=k579BLwEa3GSNqUiXoiGSxvvlQVmzclTJY43OFG67bt29J09mIslD2vkhi0/djT4YUzrNNsvU22785Iz9FWOJaasgQOT9KzZ9W55+WBHZxmu6jAhVoMAMHW2xCWjbIXEQZ+YGXz3pLEOzT5Yl8+QP+0Tx8gvZBS/Wi5tjtGgN+i8TleqeLhH9e8OzaKLGM15wDB1og19B4QYXGnbG0Ugmz/FK17cmiv6+wqJUx9VNu8R3xQHt3GH4J9ErbC3x7oA73a/7uKEkG4IO8TEZvlLlsKB1+DYJUN/9xP/F6cl6EuhtMF3Dbn39f4nVMBWiLlWhfCXmXLX802OBDjvo4T7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjIPBb//NycKEX4EHvaAENKtVBeIbnu/Kx8uStcptAM=;
 b=knkoZPXgWh+v57DzSNK4XgyDW1j76tziKlD/DKQGV5dn0QUyOU21hBubGSjBrGYudaZM0Kpwo14+JlKXYYfnmobGeBW+vEk/i6ySVjIxzMiiyDEflUpg1dgV7gx4aclTZLQ6+fcVwpZRRgeigsxieSX7l2pdY8mrQKy3wxs11cwdtP1HLFm9GdT0Gp52SsaCg2vhG8AWgOmEHvTNTnYNIXeJEfJi4rnk5E7ZWEOejQvbqFrcwPai/6PnKxJ97kFjtzknFwEyujqm1B5PWGcFIpiiOAzSJBzUMZ8U1u1kMLyevVKdCguMtC9UCVWox5IK5kwSBqCCpIrMc8Uo0J9+Uw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DUYPR07MB12324.eurprd07.prod.outlook.com (2603:10a6:10:65e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:49:21 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:49:21 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anders.heimer@est.tech" <anders.heimer@est.tech>
Subject: Re: [PATCH] libssh2: fix CVE-2026-55200
Thread-Topic: [PATCH] libssh2: fix CVE-2026-55200
Thread-Index: AQHdAiozw85OQEIrkUWXBB2wyiAOCLZKVD5k
Date: Mon, 22 Jun 2026 09:49:20 +0000
Message-ID: 
 <PA3PR07MB10721D4AD22A949F3729AA8178AEF2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260622093325.2735695-1-daniel.turull@ericsson.com>
In-Reply-To: <20260622093325.2735695-1-daniel.turull@ericsson.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DUYPR07MB12324:EE_
x-ms-office365-filtering-correlation-id: 08cd35bb-c6f8-4979-82f7-08ded04388d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|13003099007|4133799003|6133799003|8096899003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 9xpRF0rqSMVo/YZ+oZlwugk7seyj4Rm2q6phd7ta1gPX4ySFp8YJd2jj+wwF4gRqWKD5jBjieSBuvruNNOxn+swPGzbKJ3DeNy+9iw2m3eulOIObECDUTB039ZAgVKkRLcyGASaQMYB/6DoA7xMqpYa32eTmyhq3PidmjWngyTXMNF/hv/QZMavnH48/k4vbQmYgATsFN1VL3qevRslwkAnpQ7hahTqT045DZOY9PDxbeqRJ/qPuur5qbVkIlIaG2/02eRX69X89X6Gdpy9+V86J+wZhZVvCVX7aEC2pP+9FtnVGCCAhdCcO78R4YMVeMERmwE38UGarHhAmkFab+0sUzSQldsB5t3zxiI7f9RDNAWe5p0OlTNNmr/DJsuKkQle18hphF+i5Ge2OlOUxmggNu9KE/W0EuxYsCyvcHMXKSe+gLgeh8qwk9L5p/sfV3ZysoQ4H08OkPgvlgZ4EZsf9E5cJ6f29yv5lTBrghKJA8T3wAvKD/NpqYjr5utyaTVKL9NP5rxqFlngfrrYJilI6pvHpWjoXXxYhAiA6iAIOfW7niMfVowUUk9EAMVbNDo8bklfVNuklZHOrUTpXnhIPdc3OY71Y1UFoq573AQ+EtLKYi57FjGmfA+QMwA68qoIf6pLBX6Bf0nSNF4mFbo+g8bLPfDeqHhLxuYqIObk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(13003099007)(4133799003)(6133799003)(8096899003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q8IO/Q25gxwsWiAoPO5e6XlR+Jl4oZYjJ9FBNZYQfVIKWCCtHGajdncdD6Qn?=
 =?us-ascii?Q?PfFk1JZr10hgNKO1NT667Psv2ZDh9bmfqZcB9Yaez8JTcuDIoLbvR78hT1m0?=
 =?us-ascii?Q?IWCCRvcjmr1odXf0PkRZDzSQYEU0Mg1R5gt/DPswQlb+B8Ux73rjOXVqR34r?=
 =?us-ascii?Q?ZU9KUSWbRcITN8AuBBf4mbeYQ8GM+D2x/ITrzBSkqe8zWYUHBupdYxxVF5ik?=
 =?us-ascii?Q?qvaWdNyjLh7WasjMbSV/Dg8crJR4V+/XqUWcPQyY246dKzcHy+C6gzumO1RE?=
 =?us-ascii?Q?ykMpUvlbKTs4aS1SBzSTUqi5xP+QyWKclIrjoRLsf2NGhtH3gXEjw+i9lLTT?=
 =?us-ascii?Q?WQI2tHHqpzUCFF4hDBAgMw0lkNfb7FFvnPvlNwB3DdNn6+bKs2SD7GaKG8OC?=
 =?us-ascii?Q?JB4uqkHiY/hC1lkAv2nnii2T81LtT580jVb5YfXQ47e9R8R/sxiNOYLuzqlR?=
 =?us-ascii?Q?yWFz8K9r70E4cB8JUeujGhKvjC56LFxnUpfnrQi+O6xFzPS+60t6NfaNCthl?=
 =?us-ascii?Q?Wv++Adp1Qw/fQrTbvVME8ivNrUho69Urkm/iH59Qro6zpVxVnmL5g3SXBgJg?=
 =?us-ascii?Q?6UzyI0c3MjOEY/jtSk+NjhwNWMoUsc3V6ewxHkm1PND+BmQlR5sv+VkCSTn1?=
 =?us-ascii?Q?yNrsuZvunq/q0Fafed5IfdF5IWxsUHMljhEJrHyMBC7DEdY1xIY68xYwuGeT?=
 =?us-ascii?Q?j8sjzt3mZrFyFh+1fTRQ30CWFAcmvwXgeZtED8MeAB5wI7a9UdCIYar1ZPmu?=
 =?us-ascii?Q?bLcjpeoEeg/y5c+s6lCmsRugMi+3ds/7h1v8AqjeR2JzuEkULZeHGVqPpzqr?=
 =?us-ascii?Q?oYbxAToT5E0oCbBRtFRB+RrrvazynCPPgnxUPVEr9ZzJIpJE4hv1pFzhyXL6?=
 =?us-ascii?Q?KP09ff2ydMvqTBHxdKSn9M4/YG6xW2BeQ1mHBzyCBLi3RyufZLCTvar80o+0?=
 =?us-ascii?Q?JcUHdZsQXjL7o4e6ipuHvAFGwEQYaEBjcfJo1v6xdmjc9i3+7gGYMe6kLA1w?=
 =?us-ascii?Q?FHVatP2hDnZhFcU4ITy5pUuaDIaRraL5FfE5aOxJ0og5GcX/tKGlHdImqVvN?=
 =?us-ascii?Q?V5WcE56FMtZ25LNbZOczKX5FU5s8aLyb8hXJSuC6oWj0oOQWPYBuNvA3KEPm?=
 =?us-ascii?Q?cxbQQtqRf7w8Ec1c+CfQm/GM5p7kEzFf2zdldbfZPzEFZsS2Y9CCopwmHyc6?=
 =?us-ascii?Q?c++hOZ2FmVTV9ViFif5IhCzm2RFHtBvpP1TxnOjz6ipxsBJ+caYT+YnAhODO?=
 =?us-ascii?Q?SQgBWTnu8ALEo96GMfsTkXuj1zMdtudXoTbuaCwE41zjEBPOYsk4GMU9OQoc?=
 =?us-ascii?Q?x+8I0e+btG21huoWu3/3QcwmAqqgeskQueRGc40nVuFx/kQj+1PeVXaC8I/5?=
 =?us-ascii?Q?Z5YkpBSjMgsDHHl/VHBhzsNpJ7hnHndhkihOFqAhTgBzrrEqZm9B04BB8etI?=
 =?us-ascii?Q?xlCpTH/7LvHGHmiVDAet3+/QgBdURe7AKmTCN0q/isTm2GYs9l3uBL2B0vrb?=
 =?us-ascii?Q?RzqhQm2Z4zknf7SD1MwoFX7cPKTlKNhCtOYIlOOL/Rm0ssiQmjR4BKpdvZbL?=
 =?us-ascii?Q?xp21k39kIdD87ElmpFWRD9bKhUsWOzxByFkx0ZgZrMKezpaPgiZEhjjKLwIz?=
 =?us-ascii?Q?5rjPkgJC/a5wH1khBzVgIdA8gI5WGGGu3oKZh7oUmG9S+CSfp6hEAY+HWPji?=
 =?us-ascii?Q?YFXkPEkJw2DenJ7awrK66IQ2Z7UsGRzAPBYX3X3jGVe+AhUIb+TntluCWhE2?=
 =?us-ascii?Q?75VnLV8xlDzZIA3PpzsXeyZTw+aGzQotv0BWW8H+IXiV3n1A/h34lAyg2q1I?=
x-ms-exchange-antispam-messagedata-1: 8HWKhO/m9oUQcw==
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB10721D4AD22A949F3729AA8178AEF2PA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cd35bb-c6f8-4979-82f7-08ded04388d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 09:49:21.0091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHHhkjDt+rIYjQSCucwkBlWoh82RbgCAiUst8yYRIwUIkw29jiZPQ0s30NStGXfJcSH/5HmhWXOjDwnV2pHVUzqGJy0IGmk0OpG95vRUL0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR07MB12324
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 09:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239280

--_000_PA3PR07MB10721D4AD22A949F3729AA8178AEF2PA3PR07MB10721eu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

it is the same patch for scarthgap, wrynose and master. The last release of=
 libssh2 was libssh2 1.11.1, released on 2024-10-16

Best regards,
Daniel
________________________________
From: Daniel Turull <daniel.turull@ericsson.com>
Sent: Monday, June 22, 2026 11:33 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: anders.heimer@est.tech <anders.heimer@est.tech>; Daniel Turull <daniel.=
turull@ericsson.com>
Subject: [PATCH] libssh2: fix CVE-2026-55200

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55200.
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nis=
t.gov%2Fvuln%2Fdetail%2FCVE-2026-55200&data=3D05%7C02%7Cdaniel.turull%40eri=
csson.com%7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47abbe52080c6b87=
953f%7C0%7C0%7C639177176172245168%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO=
nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D=
%7C0%7C%7C%7C&sdata=3Dx0PEtNrUxDn3ap4t8IRPibWGSluDhB2fvbhGfqB5zI0%3D&reserv=
ed=3D0<https://nvd.nist.gov/vuln/detail/CVE-2026-55200>

Upstream fix:
  https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7=
a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C380160d5f0454d1ff74708de=
d0415503%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639177176172278243%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DpLfxTiNg%2BKJc=
2KzfvPBJHTRCYdt7ruSljxCyiK9T6o4%3D&reserved=3D0<https://github.com/libssh2/=
libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8>

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../libssh2/libssh2/CVE-2026-55200.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
new file mode 100644
index 0000000000..9a71277cce
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
@@ -0,0 +1,36 @@
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://eur02.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FTristanInSec&data=3D05%7C02%7Cdaniel.turull%4=
0ericsson.com%7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47abbe52080c=
6b87953f%7C0%7C0%7C639177176172291860%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hc=
GkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3=
D%3D%7C0%7C%7C%7C&sdata=3DburE%2BssH971QHGaL54oTCRH4KtOJmV7HARO9YVZ7t1U%3D&=
reserved=3D0)
+
+CVE: CVE-2026-55200
+Upstream-Status: Backport [https://eur02.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80=
c91c3a8c9f2372546301d4a1a7a8&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%=
7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7=
C0%7C639177176172309431%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlY=
iOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C=
%7C&sdata=3Dxl8wl5MyK8t6qDm%2BCnhVF5MJ4%2BYwPWLgZwRVs%2Foll%2FA%3D&reserved=
=3D0<https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f237254=
6301d4a1a7a8>]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index e1120656..d147505b 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session=
)
+                 total_num =3D 4;
+
+                 p->packet_length =3D _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+
+                 /* total_num may include size field, however due to exist=
ing
+                  * logic it needs to be removed after the entire packet i=
s read
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index e825c8c5bb..5ffc40b8fc 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%24&data=3D05%7C02%7Cda=
niel.turull%40ericsson.com%7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbf=
d47abbe52080c6b87953f%7C0%7C0%7C639177176172325100%7CUnknown%7CTWFpbGZsb3d8=
eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI=
sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DYtFT2NdDTIZ6wdi0A9BWMoMd2dZAKxKfbjG8=
UFFq9rM%3D&reserved=3D0{BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch =
\
            file://CVE-2026-7598.patch \
+           file://CVE-2026-55200.patch \
            "

 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--
2.51.0


--_000_PA3PR07MB10721D4AD22A949F3729AA8178AEF2PA3PR07MB10721eu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
it is the same patch for scarthgap, wrynose and master. The last release of=
 libssh2 was
<b>libssh2 1.11.1</b>, released on&nbsp;<b>2024-10-16</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Daniel</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Turull &lt;dan=
iel.turull@ericsson.com&gt;<br>
<b>Sent:</b> Monday, June 22, 2026 11:33 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> anders.heimer@est.tech &lt;anders.heimer@est.tech&gt;; Daniel Tu=
rull &lt;daniel.turull@ericsson.com&gt;<br>
<b>Subject:</b> [PATCH] libssh2: fix CVE-2026-55200</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Daniel Turull &lt;daniel.turull@ericsson.com=
&gt;<br>
<br>
Backport patch to fix CVE-2026-55200.<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-55200">https://eur02.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%2Fvuln%2F=
detail%2FCVE-2026-55200&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7=
C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C=
0%7C639177176172245168%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&amp;sdata=3Dx0PEtNrUxDn3ap4t8IRPibWGSluDhB2fvbhGfqB5zI0%3D&amp;reserved=
=3D0</a><br>
<br>
Upstream fix:<br>
&nbsp; <a href=3D"https://github.com/libssh2/libssh2/commit/97acf3dfda80c91=
c3a8c9f2372546301d4a1a7a8">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flibssh2%2Flibssh2%2Fcommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7a8=
&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C380160d5f0454d1ff74708=
ded0415503%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639177176172278243%=
7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DpLfxTiNg=
%2BKJc2KzfvPBJHTRCYdt7ruSljxCyiK9T6o4%3D&amp;reserved=3D0</a><br>
<br>
Tested with ptest:<br>
Before: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
After: PASSED: 3, FAILED: 0, SKIPPED: 0<br>
<br>
Reviewed-by: Anders Heimer &lt;anders.heimer@est.tech<br>
Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
---<br>
&nbsp;.../libssh2/libssh2/CVE-2026-55200.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 36 +++++++++++++++++++<br>
&nbsp;.../recipes-support/libssh2/libssh2_1.11.1.bb |&nbsp; 1 +<br>
&nbsp;2 files changed, 37 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-5520=
0.patch<br>
<br>
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
new file mode 100644<br>
index 0000000000..9a71277cce<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch<br>
@@ -0,0 +1,36 @@<br>
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001<br>
+From: Will Cosgrove &lt;will@panic.com&gt;<br>
+Date: Fri, 12 Jun 2026 15:57:44 -0700<br>
+Subject: [PATCH] transport.c: Additional boundary checks for packet length=
<br>
+ (#2052)<br>
+<br>
+Add additional bounds checking on packet length to prevent OOB write.<br>
+<br>
+Credit: [TristanInSec](https://eur02.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2FTristanInSec&amp;data=3D05%7C02%7Cdaniel.turu=
ll%40ericsson.com%7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47abbe52=
080c6b87953f%7C0%7C0%7C639177176172291860%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e=
U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy=
fQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DburE%2BssH971QHGaL54oTCRH4KtOJmV7HARO9YVZ=
7t1U%3D&amp;reserved=3D0)<br>
+<br>
+CVE: CVE-2026-55200<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libssh2/libssh2/c=
ommit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8">https://eur02.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibssh2%2Flibssh2%2Fc=
ommit%2F97acf3dfda80c91c3a8c9f2372546301d4a1a7a8&amp;data=3D05%7C02%7Cdanie=
l.turull%40ericsson.com%7C380160d5f0454d1ff74708ded0415503%7C92e84cebfbfd47=
abbe52080c6b87953f%7C0%7C0%7C639177176172309431%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dxl8wl5MyK8t6qDm%2BCnhVF5MJ4%2BYwPWL=
gZwRVs%2Foll%2FA%3D&amp;reserved=3D0</a>]<br>
+<br>
+Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
+---<br>
+ src/transport.c | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/transport.c b/src/transport.c<br>
+index e1120656..d147505b 100644<br>
+--- a/src/transport.c<br>
++++ b/src/transport.c<br>
+@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; total_num =3D 4;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; p-&gt;packet_length =3D _libssh2_ntohu32(block);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if(p-&gt;packet_length &lt; 1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if(p-&gt;packet_length &lt; 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_DECRYPT=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; else if(p-&gt;packet_length &gt; LIBSSH2_PACKET_MAXPAYLOA=
D) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return LIBSSH2_ERROR_OUT_OF_BOUND=
ARY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* total_num may include size field, however due to =
existing<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; * logic it needs to be removed after the entir=
e packet is read<br>
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb<br>
index e825c8c5bb..5ffc40b8fc 100644<br>
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb<br>
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb<br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://eur02.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.libssh2.org%2Fdownload%2F%=
24&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C380160d5f0454d1ff747=
08ded0415503%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63917717617232510=
0%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DYtFT2N=
dDTIZ6wdi0A9BWMoMd2dZAKxKfbjG8UFFq9rM%3D&amp;reserved=3D0{BP}.tar.gz
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Return-error-if-user-KEX-methods-are-invalid.patch">
file://0001-Return-error-if-user-KEX-methods-are-invalid.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-7598.patch">file://CVE-2026-7598.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-55200.patch">file://CVE-2026-55200.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;d9ec76cbe34db98eec3539fe2c899d26b0c837cb=
3eb466a56b0f109cabf658f7&quot;<br>
-- <br>
2.51.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PA3PR07MB10721D4AD22A949F3729AA8178AEF2PA3PR07MB10721eu_--

