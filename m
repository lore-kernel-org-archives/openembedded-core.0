Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2392CCD6E5D
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 16:05:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9895.1780243504277136713
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 09:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=q3EEob5P;
 spf=pass (domain: navimatix.de, ip: 52.101.84.116, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZaA11fCMW90y9ulIEgXAC+XGgHuixh8SmGy+NVq9pFxQydBSC9dHswnDXhRV82ZHN4m7I7ZLqe0n9teedLKbwK+wibi5H8p9VDizF78X5b+xzOcEHr8iI45ZX0m5YEaMmqaeN1abADO6IpTgbTiQxNm3mKxund9G5o1g87wBeeD5mk2ASUUnKb+LaBXh++9q71+t6GBKWAnM9HqryprS9ixqvznnILl90LIBVFYgGoyKK2p+BrucdCeNSMSB0e277y0fvCWaVKwb1jC8UBK/igF/n+BYLv/iUtSg0JKeh7MkNMMgr6x1WfFRcFhRHmv9z2V1hC7SaQKTLwP0HKklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxGcB8dXAYfUTT7JbaolXwAh9snJv64X9VFqIyrVtQ=;
 b=L1YFjm0qOKkep2VtatCq59xEiIdko8kReXrz8QttQw3OH4XKUKWzZ0dmUh02tdozry/xP0zI9s4Wg+UIIv/fzeopmcme7z3kSugoCMJ03X14gOEdlPJ3HlYjNicekUaEAME7zqmgm5Ab4dVtKxwZJLMK212P7ca9d9nWohciPqdGRoJAVePgVLoj+LfNwi8/OIfrAc+CXOK33NFTVOVAmH5p31LloqIjyEVosH2BMkiOSykqUwR9WoC1pC5Sxl9G7jhSym9z6nq7/SVSlfOY1Fi8VYRd1u3O3V1F6nK6LGTNoYCtotiiabH1SnUg/G+xQwXZVLOOJvRV8MFiUHcNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSxGcB8dXAYfUTT7JbaolXwAh9snJv64X9VFqIyrVtQ=;
 b=q3EEob5PW53/iRYf6uIsm9bIkZcG9vN+c7tNJFgSvm5GVlM6GElH9Ti64OL45mjZReCU0wegVnIpJS+wflXAnomqeASufDbrz/EoRJ3FpvADDvPKzSEpZxzX1ose6pNdirJvdxnR7ZjSfn7SotZMMhKAOTyd5RPTNQICk9Q35SE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM0PR01MB6243.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:167::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 16:05:00 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 16:05:00 +0000
Date: Sun, 31 May 2026 18:04:59 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] python3-idna: Upgrade 3.13 -> 3.17
Message-ID: <0669e15d1fb45ef793e7d3982bb3430e50a68f4c.1780243416.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM0PR01MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d3dfd4-5ee3-4f81-5ddc-08debf2e5e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	HN0nYOmcEgPtCOzjHbsV/euO6W2u6eI8jDwXTQAp+LmoAbxOttr1y5nx+Lo3TIrd0hq3Igq18U3tot1uRe6+HTaCPXZj7pZCDxtiJb9KfQY3/U38S5P0H69xYYh3TWdaT1huFsGH8DRRCrTri0vK6G3UzN1F4jPmsRJIRrwUa6PUS2dSYwcJWRvBPePLdCfVgyEvm8lhijPlpmRJIPJEdBuBxQuwErSMDSp2MaGoSjS4hKIhfXMASr5ssGqwKUEVXYUrcHSlDQMptMzdJgVXMCxDI1MUP1yd0cAfpNCanFIgfTVUjiFDe87hzoayEqfSDdMxA1ZqDs6PeBO72k8+M0I8rcrtjnSCQp5+NCadyWngdaNfLnr0cXCdUVCLbw8Qv6WxlRTWnDh9zSVSwn7vC/qz3MkzDr0KSiPOKYk2beEjqW/N4Nv8FBs4LCryg7R8j3XbOxGyHCYmO4IgVHsmZrYCbOQZeP3ds31FISfLJHUYkOG9kP2QLPUsRr8nKYHpCn+tAiDuVHzi8qf5vmrZMNk83K/Ytjl7UeBPzM+oySIpJzO/3BCqgwoOuGQ01mekuFSsIF9v+6/J5CPKOmm0JljN2yim7kr3jFnxdlKYH7lzzD3A4/kgRr4cMU+2wYw1FsDee/XXcnjFyQ4pbEnA54t/nG3FqLcUIrN1pD9ggSbCsTEzutnqQrMT1mcvcwAjaMMqcszpkpxYTN9bz392tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pv4UTjiFeoLSxHqnC62nWOwQadNkF4A18d3l8gyP9kEFuulDkVLOc5oJZUp9?=
 =?us-ascii?Q?wUW5GMaANX4sVJh4B7xCetHOn0Z1fBcs9RkNaFmlHpWOfqH+cyr9y+PbeCfB?=
 =?us-ascii?Q?02W6sMCMSBYg5+7Fxncj0YNHrSqsa18nZntgZyiZYL/XZ6drUFld1wLuece5?=
 =?us-ascii?Q?8yFzJKAWpIz7PkGDeYky55hhuvWElCNeHwAJKe+Vjpri4S80BJDvvhOOOkBr?=
 =?us-ascii?Q?MnKd6FzO+AxctLwdPdmxdCXf3SPxrJt0baW1TsgSNdYHiuELLKqvo93O0lop?=
 =?us-ascii?Q?RpXWMZjEFDQXVUgf3YXSvYrMAvqLeHlnot2dYaIoC4evSDT9P/u1UU/Nrqnu?=
 =?us-ascii?Q?sN5VIQfP7+LXf1rAUl/4mkxLl1Jpyx71cGiHL2ZamAGP3K4OsGoC/XNQkDkB?=
 =?us-ascii?Q?eFALTekqrPVQ+qlR8igBYQymGSN4Ta+Ux8lRC/YBkXWP6ynkqKaaSvNLzwzD?=
 =?us-ascii?Q?URNdlnGDSePQbqdfsCRKdpXxU0y3HZZsytJcNsn5L7pYdAIhL97Ava/9E9jd?=
 =?us-ascii?Q?5ZW/62/zJirGlOtWpQRDcBvtHLKQ0uqebQiqlvHIyrAIk23ezkeJ+1hH2F64?=
 =?us-ascii?Q?gPp7OJQBQkrU8mtsufn6+t1Y2/DGEcd2vWTxqxwZhEE6j34UiDLIG+4BFUBs?=
 =?us-ascii?Q?qIPL/OVOFa07RtaTWSQqLB80EdwVnqXqWHbVHlOnn5ZwNedsgem8hlhM6dQ8?=
 =?us-ascii?Q?ZIZS32umgj1okFqWaxbLadgDCTRjDRaLbolYSEbyq7dmKCjuixWWCdpW7BAl?=
 =?us-ascii?Q?iPuEB0sYOdap83+2u5DJ+9xyJgplyc9tMIu/BEh0OeKEMz2ICYSeoDtdjlpP?=
 =?us-ascii?Q?QQlx9zHeWePXp/vzYivsf1PWs27C3adVhBTTli0YDgQMYPHy8KN0G/KpxLCC?=
 =?us-ascii?Q?gMrrKlvaUZ4NhJMbXiDUH/MRPhqDkcIpFHI0kw+teFPEE1XEotaWR9hC+RSB?=
 =?us-ascii?Q?cDbM6jDcPQ4v2hG0jp5WV5ogq+5mdVjrfdNRUnoFG2TzO14l9zyMf5FH3KvO?=
 =?us-ascii?Q?sVXwX0Ej098mtUlpimT+4ZyHeQO5/ea1guKFz30XvTqsL3heHPzjXiWV+YRB?=
 =?us-ascii?Q?ZkNL4/SZYaWpRELhWdkyt39Zv6L2v+ne+w9XaJzeFg8q0Sj2kPw5oA/0Oacc?=
 =?us-ascii?Q?wCQMhMhl0Z81B75yGbommWQes4wcce6BmmbgWikaclHChfXqNes5mT0r85Y7?=
 =?us-ascii?Q?Hf90vzeEnmbLjUC1VQgZM/8PuRi2+WUziFTnaurUiYQeeCq6f5UOe2SDZ9BZ?=
 =?us-ascii?Q?jEk2zTyMNHccYwQ6bqD5+ADt/Jc7pqvlFwo1QO3z+vbHPQx3jKWG0ARMPq+C?=
 =?us-ascii?Q?lSGSN2PqFH2n+S/6c5/9QhaKEx9AURE72eYtFOfx10Jr+dJrD/D5cNtioTE6?=
 =?us-ascii?Q?7p1ek1vO3oXZ9EJxjud8Xn00PcHDRtL3Clysnssuvf0EHtQDZvUBkz8BWfPj?=
 =?us-ascii?Q?nR4xpZXrz4AQiq4yj4820h/MN17rjv50wK8320+FeCnSy9ymVljFFexKjCKt?=
 =?us-ascii?Q?F7IUnWCGx2/msTeleYNt3kTII0MrBJIW73VJUpGtJ9wsgVE0QEj+qCYCad24?=
 =?us-ascii?Q?DZ0q5K9SikI1YmhcCizMQDI80huHG5IENRKhzdEoxV3+S4BuYSiM1UA+UyyE?=
 =?us-ascii?Q?ciLuLsO4GStcBnOMdNYVSQs2eDAAME55P2vTMDv4Er3GixlE01J/rp7CRu5l?=
 =?us-ascii?Q?m++895SUPxTQ9jUsgfh3kiy35IJi2m6DWoB4jNdRmhVwUpVSxTSiFjbrMtG1?=
 =?us-ascii?Q?9KSGMHoSWM1/p2duGrK56eimeiZug+4=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d3dfd4-5ee3-4f81-5ddc-08debf2e5e65
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 16:05:00.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71v3z8+d9B5dsgEw02tkrUJDMbXVtf+R8+6BQbxUTKDgE2w60ejFLD1aiejEEoYyrlQnpwYo376XQt5cj4zQ173bas3DgXVyVj8CECwW05Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 16:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237797

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

* 3.17 (2026-05-28)

- Substantial 75% reduction in memory usage through new data
  structures and some optimization in processing speed.
- Added a general 1024-character input length cap to the public
  validation, conversion, and codec entry points. This is well above
  any legitimate domain or label and guards against pathological
  inputs.

* 3.16 (2026-05-22)

- Add a command-line interface (`python -m idna`, also available as
  the `idna` script). Encodes or decodes one or more domains supplied
  as arguments or on standard input, with options to select A-label
  or U-label output and control error handling.
- Raise the minimum supported Python version to 3.9
- Various code quality improvements

* 3.15 (2026-05-12)

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

* 3.14 (2026-05-10)

- Removed opportunity to process long inputs into quadratic
  time by rejecting oversize inputs up-front. Closes a bypass
  of the CVE-2024-3651 mitigation. [CVE-2026-45409]

Thanks to Stan Ulbrych for reporting the issue.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v1:

* Added versions in commit description

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


