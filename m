Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A150C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 10:37:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.43])
 by mx.groups.io with SMTP id smtpd.web11.36564.1701599818907779470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 02:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=BGbtemhn;
 spf=pass (domain: outlook.com, ip: 40.92.90.43, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKd7eSUiqyy+GdFHKPATiYv5A9cqBwpKrYyBf3HA1f+bWNv2452CFkIvcrqwr9s6V4PvbqsNeQ9Dm1N2hkKcl/PY5tjKAXorLKOMnzUkb6vuPbOgMbIhQ+rc2OM/8rAaTa2NJWE6Xw8e+CT040uxGm/TtiR7vE/liA6fVHlME8KNazPyq3WrKC3bhDKf0w9le+Cah+LVNXcRun/XpxtBDIEqmPfZABIpYOll6TzdGIxnxXPokpcF1Xj0hOn6XsCNipxeAri9RKQFsGhGSRxWytU3U7TD6313po3nz4sAGMpDbZA944+OhYc9KNAIPWeYo9oGQbzpfSz8E42QZbdfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbZtrSEnCsNDsOxhOs54O6h0CcThQ3vbPYmkv6Szh90=;
 b=ahHzvPQZT+IqnjnYCZG+njMxJSVlQi7I+0V52VIuWRGY5L/vn/558yrXCwbbIGJGSynsRVRsfm0Sg5/cnRsGEVNNRnS4ui1sqvxi3k9dR/VURsWydjlzsU7CfhwuatCzGJgoIGh5H90mTNxsVzf/AtyDIJAeBBk5KNBucLMlvNQ/fgtqoGKgCSzO891XWr8T4tJPlu2QhMwgPzs/2rclSAUiUzZUl0EtESSBF77EV2ZSiFolhVUATSaNMqm/Kw0aQGgmWzw/ZruXl0p213H9TMnCPCV8LIvb09tI/rEojcKHYBozf/5Ot5ShwFCo8EmMPjseMOssMbfW0fupN4OFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbZtrSEnCsNDsOxhOs54O6h0CcThQ3vbPYmkv6Szh90=;
 b=BGbtemhn35dk2nMeraBlRJn7yUXH23Mh6Y1mqT+CWtivDkKYMGkDUFDPpqOYnRx8jwwRjbibTi2/8q+o/5xIFqwXw9B2onXpRgIRrloOjMgQtWp6y0RJOW03fkju0TZ5x2VbCO20IcGJdwy+hOvib1+1+cY72xUmWv36F1LIZxHvgXSHveqAdXyiwe+Es47I+KcBGUWpByxyLA4gRVGiVstFfYW1CX/o3idz6mvWoODGeWqkTeIbcVv1oms88wZxwLCssHooDOri3A5rKD/C3LLW8kQjaEIHVcy0W3ePAMGUQsGKRnyyItUVxoeEHtNnzSS5/IdarkWFqLkCBDcgTA==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by DB8PR09MB4059.eurprd09.prod.outlook.com (2603:10a6:10:128::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 10:36:55 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4e53:2ec:7793:b8b]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4e53:2ec:7793:b8b%5]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 10:36:55 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] recipetool: limit added checksums
Date: Sun,  3 Dec 2023 10:36:14 +0000
Message-ID: <PR2PR09MB3100441110E563C11000C461A887A@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [JVzawH2sjStcYPsFSWKPfgHiIiRLejQQdiU2/kBpWq2f9fEd56cTz2nJni0oFW4n]
X-ClientProxiedBy: PA7P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::6) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: <20231203103614.948253-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR2PR09MB3100:EE_|DB8PR09MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 878fb0b5-a4e9-4a31-c9cd-08dbf3ebc504
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WMMdbOUNV5cq4UgMLJU+msw30Qlm/G6WEM5axdL6YGeG3x19cy31SLQMCuk1d2BhdLu3+5mWoEqAQX+a35ZeWmsglAKv1r43ZKUQzA9PPwVdSbaD8+0J9xX0e0Yw/QHT/AUypCcHSV2W1wJyFXpFY10dO6s9ZNYl30PMWE7bdICAVKlLkp+bMuiaUMiUORt7FJzq+0YgIOJJhpdy+e9PgsDuL1C/O0cZC9vxjn2yvuR5R0fMHegGoLOWw96LDxYH/jF8fm+EpQb8Hzlm5P7l5O2hjZjtRvxcZ9/kksaSE0T9RviCS5KVk2rLMiH/EXYyBtcg8O1vfgSx/+rDCqnP/CCpDud6vAPJx4aAkIMhXozPAOTQY7xLjhT2bk+R6sted6VmsrRtdGLOTPOUZvxRRJnyeLM+xK949WvNSAQJQfVnvRMrJvfe00XG+jrtSenpKCF1ze3M+z5wsUN9zs+IfOrKhMkI4jRk0zB4WMS+VGswhKFTG3mxhc/rwu8kifnCDatFP+gvWUicVzuPoQPIC9xsN18qWWGI7TNpulyEmkkCm+ufP4k9azIZeQHVW7raseWP96ycYK3KYaC6Ouz7WV07yDosmAVzhSpOenyVeLMSulkzKsewr/DGKXWUWmBh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1bKE8Pj61cb2kJp04x2/2/OpzKXM7FKUbWzP7yKNlh1APd5e/CRYeTQh2ahr?=
 =?us-ascii?Q?eGGDszWu99+kxzWcwBQJm24iz9T3TtUW0/2c7mCZp0vYr23e8+DtWe4oF5xH?=
 =?us-ascii?Q?PiQ56h8IkmcIBQDlBEBMQhypOmfiwE5UvMKwGtHt7QtXWyCo+Z1f7/suoffp?=
 =?us-ascii?Q?+0Os6PHLujfSMzIRMNR7EbR6U0MbG6fBuUhzoE3R4neVDa3bNd2/x1JpIOxG?=
 =?us-ascii?Q?1/QnbBjiZqLUJTkv+jItU3eAi7jBKLFp5EpdjLyO2XtpmFAEW/L4+v2sWs8w?=
 =?us-ascii?Q?tjU6rjg5L8+d25bV15DcZKqQVWWcZaqgBWtLRr4N52hcVUYS8eIunTKdWqhl?=
 =?us-ascii?Q?1Yq7zifxDZCHp5phGoeIGLbZ687WPsoEk2ljd3TIJP9MY3G2jXavtrfTNUE8?=
 =?us-ascii?Q?H/TinqF0tm1ugE6ARrJIC0PZ207hqpdV02mYkryCr/fcZVUPKH1aDUphTKUM?=
 =?us-ascii?Q?DB13U/LCsLKP+KecZKmgAcL2mZBc8hPV02sAlr1Af+R8lxXtdlpJlMCjbfQL?=
 =?us-ascii?Q?s+cHP0/9F44526spZslIacOt0Yq/p09/4NLnchYE2UPF49C93ZlkNFXp503x?=
 =?us-ascii?Q?QpJdeH5Frmgc1KO5HWwenz1Q8eCtMKlnJ0mQpeeaFvRW0hj1A4+JZiuuElb/?=
 =?us-ascii?Q?zDqppCQbl3/O+cb/62DYCfd0uH1Fz3NoZCebCdgnSo+WtsmuAV82P9ZJoZ5Q?=
 =?us-ascii?Q?JBpaumXtBkTS+FdfZJaigRE/PSN5FJv7iNFjvEgvDm6DKS1juIOmogM+vNe/?=
 =?us-ascii?Q?tZkY6hRxCHIpLhkXeRBqPWrL0R7XNbK2Eh18VSGqXJVU6P0w9AIMqtFeKOf6?=
 =?us-ascii?Q?0rE5Pw3hLs0JiCYKrtsbDLXOoEzX5gQQHNkIFrNYYEZ2Uj6HKH2sPPFaw/XV?=
 =?us-ascii?Q?XStgpQPy4yr7v0bnhOeJXxgANFj45pkiu7Lm8FQUn9dZ/RSdrlgEnVIhGOse?=
 =?us-ascii?Q?NUtug45aLp4GJ0qaRgpFPXUGg8+x+0QsnnDx2aTAvi+2Fwc/h3KC5M+P0lTj?=
 =?us-ascii?Q?JVpUMmvaKrSiKKDOh6y3OEIPIDT5NXpi1eRj6hCtFvVhbazJ0aQBqRqGOtaP?=
 =?us-ascii?Q?T0yshP0N0RSmQdTBybcYsgzjiSjk4dL4U4twl4gadyxj6DlXwyo5LqmlFhho?=
 =?us-ascii?Q?VLC4moAUvhB9e9McYfUHbHG80FfRf7ZbSqTf9L4whxvQ9rYPDWJKnvR12POF?=
 =?us-ascii?Q?Y17nqvkOAKET2PcQlK55p5TOqcylETNXdfx8nYgTBgKDxpOyTow5oxuz2m1V?=
 =?us-ascii?Q?JwUI4lG3gmuNGLinL5Pqc+jKf+0bNuFAT1BgdN4NOtUrK3SdO8uJBL+hmI/y?=
 =?us-ascii?Q?A+Q=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878fb0b5-a4e9-4a31-c9cd-08dbf3ebc504
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2023 10:36:55.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 10:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191708

to the same values that are used in bb.fetch.
Currently that would only add sha256sum to the created recipe,
which is the preferred choice over md5

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 scripts/lib/recipetool/create.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 293198d1c8..0016be3e7b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -677,7 +677,10 @@ def create_recipe(args):
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an ext=
ernal source tree was specified)')
     lines_before.append('SRC_URI =3D "%s"' % srcuri)
+    checksums_shown_list =3D ["%ssum" % x for x in bb.fetch2.SHOWN_CHECKSU=
M_LIST]
     for key, value in sorted(checksums.items()):
+        if key not in checksums_shown_list:
+            continue
         lines_before.append('SRC_URI[%s] =3D "%s"' % (key, value))
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
--=20
2.34.1


