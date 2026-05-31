Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FBECD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 15:56:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.122])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9746.1780243001367266637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 08:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=OCoeO+jH;
 spf=pass (domain: navimatix.de, ip: 52.101.65.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgnNedccjUVTdKQbcOoEN5wei6f7iJ9wWoNVQedsrleyJ7RcA9wdMiERYChSRXaoA9O4RKiUjYwqvgtJI4T4OKCtztAZ3Tcgmp4XYMDxROE1DTQe4sjWlKGJPWaiL2modbnz0r6osgSUPOZ6ZCFWkpto0Rf/pWcpeiwe9/6BQaxqBboGjqtNXw491t4Nogyc6rnUeGBnh1sSLBpWpPODErTLJwphB++DPQ8+usEgF9Z2Bn8zS99tEOyoRfTr2hSq62zokCMBM3Mh4UR7LOo+gsgwQphn5X/fSb/mUDbnbgY9yWi/mR+96R3a1MohKpHlIy8LUBa8v6UelOj8zaIixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJGjwQLgQW0AQMtPumwiJ9oyQgjZcUeXFQkxoQN8FkA=;
 b=w4thMHAEcxudiP0jsmenU19zDvBmDVLaAF0hIa00KgjN7kYsYfBOZmpwjaTelPdSH/7ivUbwYY/2580rMH5x15sYvzrmZaB1fqV4NmZxpMQm5GCE5cSdnaPbtN/NE4NKcmKR67ZrI94Zb9uYwb+kbBcb+4ViCEwoMRDYejhtzFHyYyazzDKxjEYIA5dNrR6I57hgbMbNdj3pbhAO2QiF8TijfCUBLykyM1FJJmw39MxezPsIrscBIrJCKJ4hPG8r3V5nishgtv/z2gM5zRij2nME4xOuBo4UfdC6yTT/8MOfzMT1GtXJg3+m+kAtrO10v+u1niiaAHbGMKv2qYEq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJGjwQLgQW0AQMtPumwiJ9oyQgjZcUeXFQkxoQN8FkA=;
 b=OCoeO+jHmdOfS57dW+uGZ85loV9+tb+tV7I4U17kgsPeSrKJflq0ojovmA5tw49ypMi9nvLR7VtVGMHoHUA8SrA95IE/ag9WkmkwGuZoFdf401i7PMKOVSggm6NzecCeRa0VYf4TvRDZyr4+ggyq/W0oFEK8osIjfB9psdc0+YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11673.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:71d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Sun, 31 May
 2026 15:56:38 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 15:56:38 +0000
Date: Sun, 31 May 2026 17:56:37 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] python3-idna: Upgrade 3.13 -> 3.17
Message-ID: <247109cf4af1f3b239e804ee0d7a359f738e1329.1780242996.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0377.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11673:EE_
X-MS-Office365-Filtering-Correlation-Id: 11212741-8977-4fc0-3468-08debf2d32eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BrquwJCROVNyzayA8ACFc8QM6IWy6r17r1FHTb04Wlr7mo582/a0T+IS+JubPXI6Y7UX+4OuPNcj1fE2iycnwG/AU/Ze8bDVDOAyEOsvseh4ZE8H+stSwOvcHysJ1dNzxExAscjE6SHNGRqWQ3j8vMpSIN3lg9BgsjvNSIAnYQu3bGPFnXJ8LvG4LxmPi4+cbmlwjbdCvkH29xMGhGO/HB0lTl4cFP/86ArBKf/qIzD3wiLRVocztBy3F1ktFIMKnDe6h9daUWUHiBiC+LdvpIZRyo++0RRK6JwvHbNs31w5SE+JRdMK2q17tZ8f8aY48wrtvWwxDwETO41FtJ45gpaBc6MTMDGs7PkXK1uFrWXdvHkganHUDAN2QCVNx73SuALRh7xf2y7ZG0PHUlGFweEtyYH0pXsTMrtvCNdqhJ3Z1sSZeOvi724dF0Y+alRicTHmByk58ufsfVThWcsO/0BUR4oKOKXaqltwPYkIV+vJsV7Azl9OF/kCrfFKikGbzlyurmE1Wm/q+g7uI3c+zsastYNQltHXBH4HLkatoae3GIhs4X9w/2Gq/fvHKWHktAU/KxplMRS+ZqFtX6J2mKGxc97iSn5ukxX20/KZNd/HMSAGmugAXthg07LgNES39SFog8QWz2clLO4ZYVhz90rOPqR/1TYBg0+U0BDyFknKr0xYQdzfIboVTEHbgnOVzYRizCPvlaZbMQC1ALpi3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/2lfzEhZqHtW8xFw3CNSY+XbR4JPoUOBmUbLKaaGKoiXY3arrPl8f2zCmBsr?=
 =?us-ascii?Q?K5ctO13ImbgWZnDIlxYSjP1OrKXh/qIh63H3mfW/LiDI06ZVDfcuNDx17yk7?=
 =?us-ascii?Q?5963WhC9NlhhUQVQabZ2SWD0ijjL11zrylI5Rql7xf2ZWMUNiYBu1ThsccTr?=
 =?us-ascii?Q?JeNLYxhqNEj97oi9AtFP0IvHYKdjfHP3eh+YXIOQJlVa5EvWA9cKPBPn5+UP?=
 =?us-ascii?Q?zqWBDiLSYkXQdR/pR2cbIBtW018+RV+EMTBJpeUedWR/w9KE/j8hYv8e+rIC?=
 =?us-ascii?Q?hADCDv8726kB7jNoqWi2K/dyltS0fAF/113uZDFrB3uqF8FWu47KY2DSOcoY?=
 =?us-ascii?Q?Z4kDHOwjWLthBFhRYv/hiC1qDiYchUHjevcT8wcb2kyT9h5k1Qp6BODUsmNE?=
 =?us-ascii?Q?Aw7/nOUEdP2EtAtg0e0mun5wruQTQXv8sVi12xNBDyML52ZLp15AZqMItooK?=
 =?us-ascii?Q?1Jf64UStR2DmuwzpgxlW4h+9TM8StM7zRYgsmIGAmaNuWR+9ExLCNqqjAB1y?=
 =?us-ascii?Q?ABQo8eJ0fZPBaHrpkXHUgninjeCKZ/mAuSZc9YdqjO1ddSmBV3ctfQiqN0yf?=
 =?us-ascii?Q?cCaP/csaY7/wqFvbG6VWG2vUKa5/A6E5VS6vAtUvDxjmH9iyDV6rv5KMeT4S?=
 =?us-ascii?Q?mM18Tyvpq6vIbLNdNKPy7WyAwSWEcsJv4dE8ORJaWrLcq/ki1bP1K2M/IN67?=
 =?us-ascii?Q?uVtCwsdWko73Fb5hYNGwzm35Xg4EKbT4vavxWBr2VzjDym/q8onLv+oCZDHT?=
 =?us-ascii?Q?KpnZbUeN2bzyzUw+lOb+qalg9G/hp5OsCgFlvNf5tPZZPqxYgvYg5zm+WnvH?=
 =?us-ascii?Q?D0yvhzV+KST6B25gHmkAgdEUYaXioOuxl77nY8YPbAlPt7XlOOPE43oCecys?=
 =?us-ascii?Q?PrjGyByqIcrCwxTfSF2WaWhQo9uB2yvRlbkhSi3jGxZ7kOF2lPhokde1eFLF?=
 =?us-ascii?Q?trXwo/xNCDZ8KPLDcXtpY+INu/ESzkOXPXQONDc9UkoqpYPLDA+n+iiEoHYq?=
 =?us-ascii?Q?Wk0WrgCgelkhJYwLRyiv6lWbMF05NPEHBo/4+x9hLUjXzf8xwPeoJSX6LnAK?=
 =?us-ascii?Q?HKBqC0iEhlxxEzJTYVZ40DBJLnNP9dBa3CRNLsmfiFiw68xjYlHR54NNlISx?=
 =?us-ascii?Q?+mlBKN9rCIGmpeDJ4G5on+0KEo3YfkdLUlP+vSzLoW49fE1HVhV+S+bBrHBs?=
 =?us-ascii?Q?I5Pon7qolkDzmOk3r+GxzrELNPAGVQXXH8C0nWH9iw6Prq71L8CIR4zd+WpI?=
 =?us-ascii?Q?mrx7rX02C+gA/VNZmB9kbLXZnOItqPDJkQqF/VMGYp0Z6vxDMpUdYiHkhzYB?=
 =?us-ascii?Q?5t1Ftjys7ZB4EicpTNq+PrBxzGlVGYXzRTSwa/+aYcygi29nPQGQ8cUCba/1?=
 =?us-ascii?Q?+b0bFHdFxNknss4KwJsC7iyQ9AQw5JquvVN16KObdrz/3w6Yw7cy7uQNYwj8?=
 =?us-ascii?Q?I9PWxZ/ybyRKImkceMJrny/WrTbaAgXxUKiMi3qfg9/lRTYY0pBq4M4kjYNE?=
 =?us-ascii?Q?eELr9zH7PODbg9YbrsY84PmQ9R0u4B6rTsfoot1yh/T9ODIiresf6MF4wpdW?=
 =?us-ascii?Q?HeN4EMRDPWJr8CUgAh6ukkzdHE9JAx3qNUm0ZknKChvtzDwmRtUEj1kVICuE?=
 =?us-ascii?Q?H7iUYzHnt67iWmDhO5CVq75boVarIcBit1+XuqVbqY/gHXKiqjOTJP9r1QUy?=
 =?us-ascii?Q?QvgDxYir0SjHpQWkiY0IFLQUfPjPgei3wukLNCdZhYap34msxOyqBAt4Uv9e?=
 =?us-ascii?Q?epP1ufVltoTGGfuuhWplGTJ2k6Ur0NU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 11212741-8977-4fc0-3468-08debf2d32eb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 15:56:38.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+hIuFzXsP64OGo4VTqfqSpBlqT9nRfgkRS7+1AXKcuaJJRX91fKgMxbCuPwau+pZVFJZcFfb7hUiBos/D6qqBRrTCYvekSOllijBeeOX8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 15:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237796

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

- Substantial 75% reduction in memory usage through new data
  structures and some optimization in processing speed.
- Added a general 1024-character input length cap to the public
  validation, conversion, and codec entry points. This is well above
  any legitimate domain or label and guards against pathological
  inputs.

- Add a command-line interface (`python -m idna`, also available as
  the `idna` script). Encodes or decodes one or more domains supplied
  as arguments or on standard input, with options to select A-label
  or U-label output and control error handling.
- Raise the minimum supported Python version to 3.9
- Various code quality improvements

- Enforce DNS-length cap on individual labels early in `check_label`,
  short-circuiting contextual-rule processing for oversized input
  while staying compatible with UTS 46 usage.
- Tidy core helpers: hoist bidi category sets to module-level
  frozensets (avoiding per-codepoint list construction), simplify
  length checks, and reuse the shared `_unicode_dots_re` from
  `idna.core` in the codec module.
- Use `raise ... from err` for proper exception chaining and
  switch internal string formatting to f-strings.
- Allow `flit_core` 4.x in the build backend.
- Expand the ruff lint set (flake8-bugbear, flake8-simplify,
  pyupgrade, perflint) and apply the surfaced fixes; pin lint CI
  to Python 3.14.
- Add Dependabot configuration for GitHub Actions.
- Convert README and HISTORY from reStructuredText to Markdown.
- Reference CVE-2026-45409 for the 3.14 advisory in place of the
  initial GHSA identifier.

Thanks to Felix Yan, Stan Ulbrych, and metsw24-max for
contributions to this release.

- Removed opportunity to process long inputs into quadratic
  time by rejecting oversize inputs up-front. Closes a bypass
  of the CVE-2024-3651 mitigation. [CVE-2026-45409]

Thanks to Stan Ulbrych for reporting the issue.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../python/{python3-idna_3.13.bb =3D> python3-idna_3.17.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.13.bb =3D> python3-idn=
a_3.17.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.13.bb b/meta/recip=
es-devtools/python/python3-idna_3.17.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-idna_3.13.bb
rename to meta/recipes-devtools/python/python3-idna_3.17.bb
index 339abb89c2..bf91b8627d 100644
--- a/meta/recipes-devtools/python/python3-idna_3.13.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/kjd/idna"
 LICENSE =3D "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D9a6c29079fc90c29d80332f44d26=
25f2"
=20
-SRC_URI[sha256sum] =3D "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a=
91d4eef164a242"
+SRC_URI[sha256sum] =3D "5eb0cb53bc467c12eadcf6de83163ad8527cec9416f44b9b61=
b19caedad2b87f"
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
--=20
2.53.0


