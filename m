Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A3DCE7AEE
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.119])
 by mx.groups.io with SMTP id smtpd.web11.30525.1725613362147603825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=YWlI7l9I;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nge/a1mzkxVaULbUm9MqbigPQkdAb92X04pdIC4v2THilXDRrwOi9ebZLPGTSWDXpQExjIyFzCm0+Ap/7CusatNGl4Llh9CCnd33BTMwGpJh8IdFqaIxTfvzHKYHl8dVhGZM9af/4BFmmvxqNpJPlT7hsQUEqleMvEZz6o2lohVuTCl/7th5wRS3OCQOH0gGmB/iU+tuDHgql3DOcDuiKd08tWahbjy/Wq/oZPqAi99/ZeaRAZKCuGDBFr9jKAHJTqchsttU9wOaDSCNAQ9ZUDsL3XXdpONurlPnno7M9OGaUI4ebd4kdiAEONUGSfpI5GnkTQAwHaAKqd7LBfomrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onHp32GUpfsxjxChoo1Psww+XKFMUVe7TLDOeS2IiyA=;
 b=OfS33PcIvcE+gioI0jgdiJm/+zm8xuerE/jNuNdcAsk35cSXycp8Mr9ny0D5I+oH0R2yG7996Fot7ofrJCZ9fWQuKW5dZvFeTgSnoSXXfC2QaEAL3qbtgtcRYRnjND8ZkADQMjUM4go7qvV2KZkIfiIj0bDbSfT9DOaALNmArpuJV1D98J1llRu7ofNbV9c0dJbTftVyiLQu8W1skvwDXvjgpYfWmUzBdQYGDQq25eGq3ArG1cPEvyTqsti2qh0PiZsl4oe2JKKWe66quKSZfz/B7AZZ3SpgUPDed4niNQJYTC4M4K2ejDQ2rNY7EdvNkHjXuZrMI594E+OuLQnQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onHp32GUpfsxjxChoo1Psww+XKFMUVe7TLDOeS2IiyA=;
 b=YWlI7l9IMXMSjOXreyd3QUCApHOSmRagncvBZBcVUfnADP0wI3BdI/Warn0tYgBy/O/7/RQGDEREi33uGXGIK300WKi/qnB+Fw65p24i33vE4IyaGA7jSujswWycpmLWnGv5LweAfhLyDlY6dj8H3m6WzKqmvInDt10llzvhDLMNp+nvWCjp7L6WxEdy2/MlmCEy6ImedkaOyHKieFfzTJTFnwp2qAly0g1s6bPZiXP3oNdOLuR3Ny7U1cZWqKyxH0NWnTSns/2WKGvyqs/r2O41ufrbY+xRZ8dqJNadyW175BFOjk4ju5Tda2mS41oweq1WGX/w1pZGXPHgKY5qvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6780.eurprd06.prod.outlook.com (2603:10a6:102:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:02:38 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/7] unzip: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:47 +0000
Message-ID: <20240906090151.513160-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da47c45-8a06-4222-885a-08dcce52a7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PeMmSRGAas2nx+MIgR67D0EZiIJrjyAsHK/jlZFGBoXhS6mQmmS0mDk5gLtA?=
 =?us-ascii?Q?aE1ktrprpuZQdE2hGBpneMrYe/JBHiTbtlcXlsa4s7RwmMpvjzuyPxjG555V?=
 =?us-ascii?Q?Z1PubjAfc8oMqX7GFV00BS6/jOA5wS3Fcv1cltyBUl9OZ3r+H96J6+g9lhBb?=
 =?us-ascii?Q?gnuIS7aySvN3xhntPPdo/FbAk68bd3Azr1M9GDdgOia5e2TYMrIJGIfr7Bn7?=
 =?us-ascii?Q?b+okto2PrCCCvT/zix53O3Vv0pvD03Ncl5sKpd/cpok/C5gXcSRioucrAx05?=
 =?us-ascii?Q?zhWxBNApJ/3wcVAfHdmZ7iW+nA+DFBbQLUs8cBzLzrvqSUPwqk+3wEgFAJF6?=
 =?us-ascii?Q?ohAHuFsU38jaPVilzsIFGNnrUh9UBmmP77a7BfiS0pvSSezLjVExrbp/RHCf?=
 =?us-ascii?Q?gYkJUgxhuIIWmCQwmSzxqXPhCLkQK/hLukp6ycB9D10agx+08Fg9MWx9jNe8?=
 =?us-ascii?Q?SHP2aetbZOcfm6HGEPO2B1yJvc7NLEz4JcWDKNWmw8jH4zuM2/f/NJuZdwmI?=
 =?us-ascii?Q?vLGDOqG3p3bDNpWCVtAF+FgOPHGkPM4oM/Mdbc2jrCZvI7QGGfwgHJqLJt39?=
 =?us-ascii?Q?k6jQxRvwq36Crg3jJvGEKWyGzCzKZTpyBa01BGVBK+MTqJdu4U2Q8/2ixuEE?=
 =?us-ascii?Q?noMBnrFfjk2ctvsxdbSGY1nrFyMdMc1KMcIVWmi9LFCw6W1ilm4wgRBB4KZG?=
 =?us-ascii?Q?y24WEKlAODD9/3bSGXRdggLIpr+LtLw+n0tEMIqkzikzrqmaxznwMr1DGHIa?=
 =?us-ascii?Q?hirlScoXUImoJPJ7sJpsLpWm3AGclVA4aOuCN0iAwRpxrxTCt6gLiKdDSXqW?=
 =?us-ascii?Q?WfVCCG65IfgwGW9L//Ay6eenHEBUYwFTVXcZFbcpM6telp3d+98aT7rir7I1?=
 =?us-ascii?Q?U+FHWrSOB/DsLu74sscv1jFgVacVOrwXHkNt9dO4ecXLu48KDs0R2RGTcdZD?=
 =?us-ascii?Q?rU8wxcUOCYVK/P+0iJo8j1rVXCcxJzhd5xiNsXgNRHZh3W0KBVazAp5tdCP0?=
 =?us-ascii?Q?jqPqkaWUb5suoTXIPrWCPv8QZSbambyQ7mF75sfWL+1QAtTDBOsTGEgxyxUx?=
 =?us-ascii?Q?e27k6INBKkY2sHlo8ap3J1avV4hQUc2fcH9g4Bm7Zw81mf2PkyirNv4jmubs?=
 =?us-ascii?Q?o9gdM1cStMqRXmKmws/Kyt67IeECp9TyQXHrJLi2Jygb/kDJTqyLdVQ2ZRXx?=
 =?us-ascii?Q?PU/wgnBhByTlMQVO5muYVI2QaVpmlt8MgHEWE4d110lKXEvR5MyuoeTuc6Fo?=
 =?us-ascii?Q?Igo8ymd9nLAiXxsFiR/OErLpIm0gEMDpyS+wzdV5vmWAZCbwPRUEWP2TlJxq?=
 =?us-ascii?Q?ARszFpB4Z9/OJnsWIASfZW0mXf1b6II5k7ixNo5bd0mTj7t+VkMwDx7DX4Qh?=
 =?us-ascii?Q?1IrUmVc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DMZ1hynwjnmzvgVZqfVjAUUt1CTRVEonJnzYMweJaI6n87sKO8kUaA7QopIQ?=
 =?us-ascii?Q?NAn2Ys+UwYBKIRq9lEmz47miXdyzVlaDPqLYc9BPctPhVw+aZSvQ0Azni32H?=
 =?us-ascii?Q?MV+vfOlttM3mtBeb5cuPNwcj9oGVmHCTufzkYOxkVNthGF4cdhcGudvStmbP?=
 =?us-ascii?Q?PJIuqWIO9WzCt1PEMCu+QLMZ5FoNuwuS2z3kUjS+QfXvapc2iSzkg2neGUpa?=
 =?us-ascii?Q?RCA/41jB9gWJ827eL5gUUxt1qw5VuLqjULM4lAWtF/Mg1WsMWhDzkMWE7TFm?=
 =?us-ascii?Q?FtL3znzCPQpUtHlULFhIT0OwAjQqGg29vpxeLlYo2aGnWYU1uUK6LLjSnUsF?=
 =?us-ascii?Q?F36+WL001ALNxhgx6cGRC0sCMrf3swKIPOPlGrzXSuLaqxMH5SBxeEoJPPff?=
 =?us-ascii?Q?ZoFs2GT/iQ+3uNb3XBWPkmBFPz+OIwfq1yqhcQUjEgKom6+1t1cQGPg5D4S7?=
 =?us-ascii?Q?ZPlA2TYvv/3GkVG1eCgSmumLOCTBQLy/NRLUh1kPYGLImB9j+EJ4oYxxuqzf?=
 =?us-ascii?Q?bLQY3ljc3a5Ci9TT4xgbCU8mZroOBpu6rgEOsoYjVoL/URoEyAiv9IPBlEc/?=
 =?us-ascii?Q?iFNEPbjh+Si84Gbq8+O3dc2/PaEK+c2ReuVYkfyWLSp6YVBxOXCdB+a20oTR?=
 =?us-ascii?Q?/XQzQJ4GbjemhyOIzVKuV7jYgpZcfUv2ziHuHfDYtXHGd+BeEn3mU6hdv20I?=
 =?us-ascii?Q?LXpWWAXj7F1kC9c/HO/QIjbX7xE+6UsBtJEsRMrVz1VM4kO864j37GgE2HcX?=
 =?us-ascii?Q?8OZlejZnDAQSjbhlT1NnZu18+ykBmQ2FUb1Nt1zqwlN6d1o28DSJb/aNy4Vx?=
 =?us-ascii?Q?pfkGBzNuSxDZe3KVOzAHSiDIdaueov6D7Y6jsSJANtbbiXOmw4NXknuyXwQU?=
 =?us-ascii?Q?TFHB0cwyXQ0QqzI+9TpJLYaW5uHybkJc1QAKj4vMtoPxtmTtbaO+Q8Xv5ZFy?=
 =?us-ascii?Q?GTXYaK3R/ZRgLgfosUZJgat6WTS1fAqL5EPAwddM9xrUq2kuDs52MXmX743d?=
 =?us-ascii?Q?sJe6OX+hnMQ15wzR9CeH6q2j64ApY5ueDtFpjfVWUNPXJFUTpsz3Ija0TazC?=
 =?us-ascii?Q?qoqzpTiqcDDNbPJUXk7Tp80+p4m5D+a6h5ESG5qXPQFLWdt5P3LBtAEDsoTw?=
 =?us-ascii?Q?PwP9WHzXzH3kb351WyyfpeHeF2AOk/zpjBLvLJT4vtmFC7mr32KC6pgdz8re?=
 =?us-ascii?Q?TCi1XamJWhxLpMdw4buXOou2xiJNrY2id5MKpHbc04i8BWKW3mW7bz6ZqWj5?=
 =?us-ascii?Q?qu/efJISWtQeVvElzfEUHr6k6jDCQrdH0oYnGUkZuO0ZNbbqTbtTkEizJ/9A?=
 =?us-ascii?Q?NnOge77/W84838eUGxkvRAQrx+8HQeI6J3ZTsePagGnXSenCkHyMh6LKYkhL?=
 =?us-ascii?Q?0f7jL3t0ApMFVa7RvvhGcKZwwY7ORTJwO0eUC9JqGpDJViUjCCBT6lGqyYDU?=
 =?us-ascii?Q?4QWoMRCZjNIJcmf2It5RfNcFf5AoiZW48y/WVBY7Gs+2JZy7it6qBdzoA8CQ?=
 =?us-ascii?Q?MCD7VSE+DBj4MhgaRrDfB+zm106MuPV+bNdZDTUFk96Z30SDK9PxQOTmO7cJ?=
 =?us-ascii?Q?XYJVbcGuMS5yTIxP8K0QzlHr9z1rn3pAtPRHz+g7PxqgEmlY7B99AxMC2tvG?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da47c45-8a06-4222-885a-08dcce52a7d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:37.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltpHRo+9w++SqdeTRSQ5wpgoeIKArzNVM3leQpO5yA1ot+ZmkRGfTUNkfjGthbP4Bz47ytKKFPstiX1PY1tAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204254

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2009:

  This is version 2009-Jan-02 of the Info-ZIP license.

(From OE-Core rev: e7c9368e56a6ad90b4ffbba1b765e2b3a331c796)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extend=
ed/unzip/unzip_6.0.bb
index 27076d5d9b..c13e7a008e 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Utilities for extracting and viewing files in =
.zip archives"
 HOMEPAGE =3D "http://www.info-zip.org"
 DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-qua=
lity versions of the Zip and UnZip compressor-archiver utilities that are c=
ompatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION =3D "console/utils"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "Info-ZIP"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94caec5a51ef55ef711ee4e8b1c69e2=
9"
 PE =3D "1"
=20
--=20
2.39.2


