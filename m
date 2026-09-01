Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E3C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 06:21:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1669.1788243693002455956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 23:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DjiFKoqR;
 spf=pass (domain: est.tech, ip: 52.101.66.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jA/aqXU2ZrCJQFZZe6Bo02vx8yilvF8BGZEhssER7tPqw3MHXO8h/YCN1euJWlhMfLTpAKblAmhue/a2arsER25AFm/foFkjQWsvpuohtIHzvTV82X5uRGcphnNjnCN6MyVpNTGmNNzrkbdYrd7DC0mpYUPZa9ODo/hWsOgtz01POTm9NONc+dl8YtULKl/EU1+eVcZ3Fjsnl1O4BsUR52Jh6+MsiGUZe1LVDiBB2IBcTa+WdMwZFU+dsV6XWr6CLisJnY2mx1+2PAfWV4LxhvplwaW0zxzUidtkBGwRMt/GPREQC3EjKvz+bd5xFob2pRusF4xNenEArciVifuKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k0LvP+PFEeFpowmz6bD/lIUOIxnz/lT1FxBzEswvPg=;
 b=ajs8ejusMqU4MFvPP1jLSfPk0c2MR5hts8o6BY0o85LNxjP+okNjUwFT5+zujs6Xmixd5jgxJoQLkUsf2jSz3m7na9B7pp+LMBTz/FUZ34hP3GeB0Xup5bui/L+r/hj/MXjKktL2rWdbzgkuJyLSIajUP1X40wFdQGJHyMKaP2Fxjnolfiy7kHXBvNKIvpy2HvrKF4XlFONnbrgAGSYFXDL+EJB6U6UDJJH0JVZ7BowSr6nvyhwlZWYBhG4eW4lQGmaX3R8d+JZLBHVdclImj55FGp2MmzxYUvBKWRo83qkq0eqRZ0HYx4XZILwTXrvKoy7O9QRbhwfkMIOxy+2FpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k0LvP+PFEeFpowmz6bD/lIUOIxnz/lT1FxBzEswvPg=;
 b=DjiFKoqR5pWbfWdBVN0tNL5bW0b5JbK82EtMd/DAGCE4EviyOvTIDvyyNl4BQ4VtOdQ1Frw8+bbSR/lEjGpfzlTMv52H8iLc5VNmcTxupX5rFDXiiobAGHfp5DWiuA+yPZ9o6vy1f9fVpNm++pleZxmA/175JsXxzchihLbaE6ql7JCMqZMC54iOADihQ7V19C+9ZSJyr3A4LJr/6X9cBNCbXkL4xBTNFH8q7Lz7U9j/EYRV1XGGo01hYpSgouLb7K2+eivRLTS6sy36GB4veX7g5lbgAMLUy1l1ZHuHycKGNQLege3PQTiN1luD4MqorVuWgh+lqPzoPBolE3ywrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:21:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:21:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] expat: upgrade 2.8.3 -> 2.8.4
Date: Tue,  1 Sep 2026 08:21:22 +0200
Message-ID: <20260901062125.37994-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
References: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4617f9-b945-4af6-0de1-08df07f141c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|18002099003|22082099003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	YD0LT0e0UIR4uprNqZulOb7CcOc8la1bWj/7nWzR3OXanOVLheGMa0O78dk+JVX0+q0ZSE3jb/bzE8FIZS13bToWtP4RPOr1GZn+czJhxUdvup2CKbeKCGNWdT+f8oWIKBV3jv6dKhVFcGVC2MU8Kta09X6xlVugoa63W3T4wwJTlVKL1n2dZ79p11+YB/PGeiV6ek/UBr932UocYDqBQH4IZr72cLuyij/m+hcJnFs3852dV7sbjZZcN48j+CARlfzqrFADoEbEkEPRP26tR5t/WwIai6MjKvU+26rLTceMK2JYhSjkmvUF8wqgvsR97wq5jKuAn1560C+z3DETcbpn9A9/AaHouXPtR7yWo5NM4jXHpHu09Bp4vFMouzzaZGqrjzlMzyrh1J+9wBAeFAHix1Q4KjJ2zytn3b+oKVRcNzs9W3vUGd2iP1Awt5D85ybRETvEvSHVwNQWP4QcIa+reziuWOHKFHcvGv+MZIyt3yPaA1wuRWrIItM0V5Zl2K+X/CU1JC6DPLtWI1KEaqjezUs41TwcKOpCO9znoEz0j//qtGGIha7ECJvuMz9aW9ENrh+6yG68Vsawh1jsCxLK9LnsiVLLI6ZFwBeYtec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUMq7lcR6+zSEKPYBhMcuprEHvEd/EzNzmVt89xeQ4Ka5YlfAn6BTYXpxZLb?=
 =?us-ascii?Q?IiYRCBGZv1z41OVgRTR78qQBimd31SwDoGt6gxia+d+UEXCHlzYA4L8EKaqy?=
 =?us-ascii?Q?bbv2vDkQOx726sE0ej+NOk3ri2wIZb8vIHdcHQHoqvsUW6MM+4Be8ZQI3OV5?=
 =?us-ascii?Q?e6lbEaWHV6xeH1fY9KQ/CGulW1gjzJqXx+CfWwHXdhd25K1mHvkkJEbrKxQQ?=
 =?us-ascii?Q?JbKjevvNo+ZtBeCwSP++ZU0RNV+hblK8BN5QCj7j3py7B9pwjoZCN6rNwG2H?=
 =?us-ascii?Q?k2pDsriL1AliqS9SFWSa/wXaooqQp5poH+uCrabc1cCzgqMTgtkb+xF+Z8Rh?=
 =?us-ascii?Q?dDiZktF6OxTHGcISKgOWbTJKJaDNgTRhjCsRG4iWBFKOkyY4Y0F4wJq7G+MS?=
 =?us-ascii?Q?QZmjZ7m9U3+s0rVgw+esAC7dE4tX/dv265gO1Je2CXciuRG9Udcs3YGRv+9f?=
 =?us-ascii?Q?/E90JUYVpEtiq07DAjIAMiWlJ7l/hFBs1jSsv05uMwxWDO8C+SaPiy4C64hr?=
 =?us-ascii?Q?GYHigYc/FUsmCKSwGV1BZrm0FkJXnlJUxXT4019lJ8tNzEEJx81dSSmZ424M?=
 =?us-ascii?Q?/4j6HgB07UljcimntCOLAe1lkHRSBMHwOSLd4M8OcxrY5EPwqya4zxmqU4cc?=
 =?us-ascii?Q?ORUcRoOEFpyXpBAJyskR8o+ZnZY5Zw+Y4OBR057pdiNBjTsHUCfS9Oj9UbNY?=
 =?us-ascii?Q?PN4kDSleTiiHkbN6S5fPfZ7Av7vlRZ4Y2p9ZxWDkW6FApw+nhSB2fbotcL3G?=
 =?us-ascii?Q?+SfLX2T3Oa5gIsxTzzwGII4Hyo3m6Z4grx/GI2rGVM1Pf+2fozXXN+DI1xbO?=
 =?us-ascii?Q?shWFQZpaettf5TB7Ml4yBHYHncpsG0JiXZfw1DpVc3BNI655P7fjVjw7Ul6y?=
 =?us-ascii?Q?BjdTCvBSPesWn/HIpv29+/rwLhTjIZYO2TV+8prD1sbv9g3dWvCnWo79hjml?=
 =?us-ascii?Q?g4JTROoo5IxMkIXPtLRREGZC4pexaruB9B5gk+co/oedNhcvUoWocvTfvNhu?=
 =?us-ascii?Q?VX2ZJS/pxa5W1KbIrWshCceX034dIFWBUg/sabJqre5UIpCO7ov2eHR8C6cq?=
 =?us-ascii?Q?e19alEy+9uccmrb1QsieS7oo2Txe246zyDJto52bWG3FnUCSOQlNN0HoK/Lr?=
 =?us-ascii?Q?SVpxaut9aHwponRiArU1PD+RHdqut8y1/WZulpp9VBMeVuLWKVDbeEu3cSow?=
 =?us-ascii?Q?QrXhwlsagvo+jxwqxOGYlOw8NMFY2n4jKbrw8VpDJD0PRJNTxNVOvpcHPeG4?=
 =?us-ascii?Q?jNaDXEBVNw/LXgkJnpyOUm8YUuEUfNNqs8pkDDfxncrZb0WZSuJKjrLgxRQ+?=
 =?us-ascii?Q?j2fjwaoHQT409COCKXK/IsYJTdQtE1O3modIhavxZ2BM50Hqc8DU3ibG7mO6?=
 =?us-ascii?Q?6wkasq7jyQYeLOk1tpjemx2+IqqE6HQHXjxNnN051t3RhTkACj2EWQbWCGdz?=
 =?us-ascii?Q?DtCwO7viO+em59KkaKf+oa9ksMpRXKhq0Bf2LZ6nq32bYhk2oVeD1n7GGJbn?=
 =?us-ascii?Q?2xWUXhbQT6SWAd8c2EL9ANpdLybRCDHPq049ZlzCRLt1/PIJUXl42qWV47gY?=
 =?us-ascii?Q?2ePLDTmuf28iaPrOST0bTjTXvlCytEmIGMPA44/DPCJKTnQ/MPrE/Y4vaZe5?=
 =?us-ascii?Q?elnSazfouUMe6wJKIHWDh1GguBde8uQVix8+mOZd87qINDrYVLWt0Y/x+wxX?=
 =?us-ascii?Q?WQAsJlYYsMCcmkqNI/op0yz3L+AHdTfwAIojq5t9OOHFsbeLL6V98kY56WM1?=
 =?us-ascii?Q?CECn7JmUSpFikw5MyyZ6sN1b2x1bYAtL/v7Q7k7PeGPbbTJgVyZq5NfdaWT1?=
X-MS-Exchange-AntiSpam-MessageData-1: FnsdqNQBBmrKzKmRh1ZAkRoYDNjWN6ogWhw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4617f9-b945-4af6-0de1-08df07f141c5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:21:28.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmaornNqOMuSDNxQ7lDEM1hUjJ/Pdgh1S8vDO4TWKZBL0i9wJPw8N4GZxuESfT3U/MChMWjavqOaQJ/4OV5rm4uD2Gh21n30BcbOyPYt31Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 06:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244794

Source: Changes [1]

Release 2.8.4 Mon August 31 2026
        Security fixes:
     #1321 #1331  CVE-2026-66046, CVE-2026-76641 -- Fix quadratic runtime f=
rom
                    "attribute isCdata lookups" that allowed denial of serv=
ice
                    attacks through moderately sized crafted XML input
                    (CWE-407).
                    The vulnerability is closely related to past CVE-2026-4=
5186
                    that was fixed with Expat 2.8.1.
                    Please note that a layer of compression around XML can
                    significantly reduce the minimum attack payload size.
                    Upstream CVSS 3.1 vector:
                    AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H (CVSS score: 7.5)
                    (Note the "AV:N" for network/remote.)
           #1322  CVE-2026-76957 -- Protect custom encoding callbacks from
                    parser re-entry. The vulnerability is closely related t=
o
                    past issues CVE-2026-50219, CVE-2026-56131 and
                    CVE-2026-56412 that were all fixed with Expat 2.8.2.
           #1326  CVE-2026-76956 -- Fix inverted getentropy() return handli=
ng
                    Allows for hash flooding denial of services in
                    configurations where getentropy is configured or detect=
ed
                    as the only high quality entropy extractor.
                    Upstream CVSS 3.1 vector:
                    AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:H (CVSS score: 5.9)
                    (Note the "AV:N" for network/remote.)

        Other changes:
     #1332 #1333  CMake: Only add `/source-charset:utf-8` when `/utf-8` is =
not
                    present
           #1315  lib: Resolve (currently unreachable) undefined behavior f=
rom
                    overshifting a signed int to the left
     #1325 #1334  lib: Support read-only hash table lookup with keys that a=
re
                    not zero-terminated
           #1340  lib: Use a C99 bool for `ENTITY.open`
           #1319  Fix typo in comment
           #1320  Sync file headers
     #1328 #1329  Version info bumped from 13:3:12 (libexpat*.so.1.12.3)
                    to 13:4:12 (libexpat*.so.1.12.4); see https://verbump.d=
e/
                    for what these numbers do

        Infrastructure:
     #1317 #1335  CI: Cover compilation and execution with Fil-C
           #1337  CI: Cover compilation and execution on riscv64
           #1338  CI: Cover compilation and execution with Clang-based MinG=
W
           #1339  CI: Cover compilation and execution on (big-endian) s390x
           #1316  CI: Run test suite with musl, also
           #1336  CI: Bump WASI SDK from 33 to 34
           #1345  CI: Bump Clang from 22 to 23

 - Complete Changes at [1]

[1] https://github.com/libexpat/libexpat/blob/R_2_8_4/expat/Changes

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/expat/{expat_2.8.3.bb =3D> expat_2.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.3.bb =3D> expat_2.8.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/exp=
at/expat_2.8.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.3.bb
rename to meta/recipes-core/expat/expat_2.8.4.bb
index 79e8c15227..050f148b07 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.4.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "b4cc2483927d5e90bf8c40b44a6b95b368b42a8a96e25883fc=
e188b48a92b670"
+SRC_URI[sha256sum] =3D "963250a823c16a498582b4ad82ad0f88926be0769675d3b695=
6be4d769a1cd8f"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20

