Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDBCC71155
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 06:36:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12188.1750142168017766785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 23:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82636c72c0=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H4A79M019070
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 06:36:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jrxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 06:36:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4cH0drs3aCs0uuruVzTUQ9pyvfPFxIU4KwlaXQLALnaCvEmnjowWCIy30TKqfBJ2swWuKVhvZtuj7UHpAyqQnPTDNIbQ0JOp8nXnI0B3KcPbaUwHbvvNj+wxrBHWo21jF/wcJ4nPfkT6nn7lMm2gpLG6qubPObtjiROse+akduVeDMR/hVwMZq/XwIG9weABR4zcTkTg/y6Lb+lYpioWBQ36xvUq2MvsbG0s44QBpePAJBFP3S5ZBs6gjI/km+nvhmJ6CZLP/LaciNfoXq3IzKWIvThhUTUXjb8fxQbQ8SXYbAtzpZPe/oj5trgT2T6Gw/PMtbvQ8QoG55KF/l2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDtgCvkPETp54TtLT6ZGDAw2BzN5S1ADVwl0QOP34Go=;
 b=g16Da+jtewZqZsD9XqPs4FCcxps1d8SSdBofHmkP8TDsSccnpxeV9/QpjcnNPjZRr6QrYdyOXcB0irRkI7UpuUXI8/Pe0po64NGOdFZcOP8o917h5F8nk9WapQ99bKEqqql0quOHQ7zi6lyxGE+vdo6AVSriebW58tOds/kxpwex5WMq70/LUu8UH/HCPWRH3uPaavelPdAl9sW3sypZQb9E6miBICw6I4cFWb2ZooTfBn3MRoggYwbgklxyOjHz8t6o/cxzvGP9FG01aPQ2AgVoRr3zcy7a9Xsxa4kB9BgiKyXkQPhAhmHZK6tzYoNQhwgTXe20shjmdVUd/s72tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:36:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:36:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] coreutils: fix CVE-2025-5278
Date: Tue, 17 Jun 2025 14:35:48 +0800
Message-Id: <20250617063548.616087-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: af0043c1-99fc-4311-6d7d-08ddad693bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2Aw3Jg4RzyjPORLvXUsS8kJcQD/fXX0VBg9ckI1pkJc1POiIbgaWm/O7VA9N?=
 =?us-ascii?Q?ZSJy5t/TaYscpBiUd3GjrpnKTryt0jJFIRMuMNO69FDgudD25rdkjr1Jj7uh?=
 =?us-ascii?Q?OHisQbDNlp5wya3MIUp7XVFGUzhIQFq177TBxaVDHsMnJKB/yXnnWluCRA3+?=
 =?us-ascii?Q?KkvKTkXJ8N7SlHlaAqFnO1Y3b7fz/g9cQTJeKKlhexrwCXT+u2/tJxmv+2e0?=
 =?us-ascii?Q?u3A5jqFf2CXJ/bWq2aTntH9Txh7zJ28lKJPFEFcxIOpWaJwFmOpC1HjR6BMu?=
 =?us-ascii?Q?JWmCPk3KJR0NIZzJGNnrLurW+AnBxw89m0KVc3lfhIHqSHEF3+fZ4kQfhRBa?=
 =?us-ascii?Q?9IaWdsk6xMRw/3nNz/icfYo79l2vGCXjrm20RX+otWGjxPbOcAOBhcUV93ZU?=
 =?us-ascii?Q?JjGFA8zP0fWqgTdpCt3y3ystHsQSoqStUOj+4PWjlwAFjPkc9ZRGWEwYX5i/?=
 =?us-ascii?Q?i/5enUaWudZwlAKsrUOASQE/hg+Onhmlptpe665yimyVULVDZtKsISRKqBzZ?=
 =?us-ascii?Q?wFLOr19MT7v0JJW05lJNtg2OEe2BMDaRbYt2MVIOoG73b+N8yWHXlFsmiXCi?=
 =?us-ascii?Q?x2G//Syf2kQKnthtD0sPZZq8B57GYReXRTevywrEhhFn7QOrDuZ+YRZl9Cf6?=
 =?us-ascii?Q?PZVphmZKcWaYjT+tMngq4Zsd8f51f6kWUmC3X2vNlcEXEvQlyeyyN7146CPd?=
 =?us-ascii?Q?C2jsx49h2aeT3fjYa/tuyR7NYkadSl8PBtVTn+AwQ3fDKNg0YVKzhvLr2Uga?=
 =?us-ascii?Q?xlYWI50BQSPBT+wF9ia+UO0UbzuQtU3GFNnJP5MFKTRtWQeJZQWd+enY6AF0?=
 =?us-ascii?Q?r/qp6txOd4XsOAul7Mc+Wnb5uGSJEgSyNmDjA/eVLgXsIVHxyjGOPlGTr8t0?=
 =?us-ascii?Q?jQ6qOh2Zartg2mVe+YytuMT3Z4gSryljkYeUgINHjqVI4cML30Rr/gvbitfW?=
 =?us-ascii?Q?rcs5u/ZMFh/FDPAOWHtmJaS18nDn8G1FuAEpHvms6U4Hbc6DfeQF80ffKn6b?=
 =?us-ascii?Q?EIhIqeInhAanvKFtrJT6AHI+JytA9uUVndOexejUxOG9fNmDW0Gukcy5Cj+Y?=
 =?us-ascii?Q?F10AWJnOeJg+Qwz0VC0qql6Sv/jQ0OWSgnSnrOs2847T+o9vAnawp4cvmvdM?=
 =?us-ascii?Q?o9MMdR9+gP1nd8B0wdMcFG/Vb57ZfLCQaAOydbHZQF6ga1jY8EVMBMqXdO5y?=
 =?us-ascii?Q?6E4qwz+nHLV11WynUAORdlGE8vTtqU+bc4+QqKebrmcCv5Bn1eqW80cmrcPi?=
 =?us-ascii?Q?aoDs3bLWderUberkwthtxbl27z2ODjrOrnX7y32h/G2pNbj1VoMIcGCC5AKC?=
 =?us-ascii?Q?VIxUCg162qEbRMlppOy1F2l7GrY9wpBZam+3lDxfUe/Aqa3Cmw0KAMW3/0rb?=
 =?us-ascii?Q?BsZB6F07yKZ7YUSizaZrLb+aLQKKypsVs9trGjeHQb3EGXD4kIbWxAfQYJDK?=
 =?us-ascii?Q?jCaOUCtmQOj5KIZkrqDolwDL/qothoq7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M7Dq8wnCAhyZRWBkbfL0/nFnEPNrBXeW/sMGyrRRYHTGXaAHdFf7msPen4vN?=
 =?us-ascii?Q?Q3d8sp+QhYesAfZhqEOTZLyqkwGlEoGUrFy41iM1qSzGeyKvznEzKwUDHQYe?=
 =?us-ascii?Q?TwOb4eXRci43IqmJY0W5DqLiHoxHdTVEahplOcf4z5bF9pmWanbauI9gl6aF?=
 =?us-ascii?Q?nL7qF4+MIbprhX8iXDEHFSbdpojU5Iipwjwd3QmKGpKxffb57rv7KoxKRtzb?=
 =?us-ascii?Q?ewb66r2gToURgcD+ABVhuFbzyhXfXrvyBNP46xj2i2rRfyJNJVWSoQ8xJcyj?=
 =?us-ascii?Q?iwb0xy0gjsOybvk6w7ih1e3IzvH6fb2v/FQOCibkXqLrsJrLMWH11AelUJo2?=
 =?us-ascii?Q?VeQD04dhL+RfAvgb2jIOiqGyM5fIWC6keymh2UyFDE2xdvW295lyR0IPybim?=
 =?us-ascii?Q?4GfKm/mJSOjA7u4br2gDl7VihnY8uqpADWIdasL5eqbs6dp4EIAUhpGydYxD?=
 =?us-ascii?Q?O1iQhWHrMDrDVkd7cf6RO3sdClmEdX8N6zmuMJuKO+aGTy3RHgq8o8FLbHp7?=
 =?us-ascii?Q?hgIRh8Gq+lTikEr1AEm/mI6pZkEEgypNOC6tYqwMs5Pc6Q7xfQxFGQENa447?=
 =?us-ascii?Q?7GlwDUKkmIsnyTLaOgmJVATpHJSDhsSlqyo128A0jzAZAFBBQS9myrmSFjec?=
 =?us-ascii?Q?bfp7Phk9+9F2/spVw7Ei1Ja4nyx1hrtIt2bb/x/E1pqrEn91FMXne1YoyyA8?=
 =?us-ascii?Q?MIQAoVrKvq9uK5Qeo08VaWZQzAPF5Bq/9d7yuQXegExO/2XqZrraOgZ19jyM?=
 =?us-ascii?Q?YibabFMND03705sqwpdXMfpH+r7i1ONOmPgeLsW744UOxeKYRzc/u+9qnH5E?=
 =?us-ascii?Q?lg0xJqwVa+9X4BFg7JbVtD5W2Dj4AmG977OjThScOzw7sFQV1aplkbL0r/eZ?=
 =?us-ascii?Q?M8/81zOjT2geZP6jYWMU7TkYqF4aafcDpkHhOqaMvJ4q8PCBbGsM9/6YCgYv?=
 =?us-ascii?Q?wGzAanSkH19ASnIR4I648lXFE8DuA13ZWCjEnLR5o2TYYqaEVpXE82FA5Zf+?=
 =?us-ascii?Q?JHT42KbYc2Qhp1PdVCjxtXIaIZbrru8nDmrbQqscRLzSAPAxkpUv1IaFm/bM?=
 =?us-ascii?Q?ax4Xh17u8+jkC4Ov4MwjWfE7X5Ck0WVX+S8rreKGbYi6quNFrTuuc70mRubm?=
 =?us-ascii?Q?zrsZJ00YQmVS23xQMt57qVnyj0Y2gxGxZWsnM2sRz9nR655a6Mml5WiL1XPO?=
 =?us-ascii?Q?gQGphhojKXNLERllpjpN4OJ+F99D1AhQ+emO7pq4npwzDhaN2ntMgajKfPix?=
 =?us-ascii?Q?P6j0HHV4s5ucvp7NKLPhYEWPkIgqXRJtMk4gP19W9C7w3gXrf1LwLpYcdeZb?=
 =?us-ascii?Q?VcX+ZFQHwh3Ec0clCoidevFo/TKtf8DN/gk38npe7TWPR/O55n6zuIeWWCpo?=
 =?us-ascii?Q?5E32RLHDFGc8AHRIjsSPgQ0QMFf9xnPzwifJXrkfl3ps94roQsA3YHjSmRxf?=
 =?us-ascii?Q?Hd2OkUPt8S2OQK1Xo1b4/KRzLKR/oJOgA+xmdbKs2GXQV/vFTNK+wdmzWlOE?=
 =?us-ascii?Q?UulenlMTvIL1Iuc7I7JGVBVsxbeV1g07T+MvKn9O28X5EJbVPuAoji7NZn/1?=
 =?us-ascii?Q?1qd9d7LmW7SMT+C+0VfCMXGlsmriuCXP5Vw+kMb0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0043c1-99fc-4311-6d7d-08ddad693bb3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:36:04.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/lB7STLlOhvNOQuEr/qp1jKSX+wrRh3tMzBHBxZM2iNS1AmWffQFBRDxfJioJ35k+NU5uFkWxw4IVDwYef2Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68510cd6 cx=c_pps a=92PHl5qnuwHSguTGG2DABQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-ORIG-GUID: _gbTtAzeBs5Hzw1OjHik3SATBijC2eLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1MyBTYWx0ZWRfX6CmmsSzCYtR8 IGIwKgiWGIiXX9ab7O/y0hAJBafEiEKhZBHCEcZdOZm6+6w1jLj7WvRS6HHRP08Jzxw88uq9m7y jQ5JVU6jLawD1goeM11DQ2pUE5r3T357ASVIbzn/6yzTjxuYCx2g1qL2ms25sadgU0i3CrVQoZk
 Uh3//BgadKIiDQusHAR3aYypYgCHdnnR9z5JCOhmQhgutEZAMageEaaaK37DXQ58tMyPSgcviLW oDJgIEvfudKD6giFeytvyQaupqdN4yp+4uQw+eDcEQFoF9gHzCJcjTUFC21UAHDRXAYWy0gO9Vn 9Jrs56zaA+g43XGiN67tMypLC8E5+88hDxjkwIRYS8OthHoIRvv9xCyJvCO2hqbZtS1cG8BSdSt
 ZyKc0CQsDlzNJnmDwVHIB3Y92FF6S0flfBVVpzuTXrUAgej/t6LRLXGxm7+pFf0Q+GKacMOY
X-Proofpoint-GUID: _gbTtAzeBs5Hzw1OjHik3SATBijC2eLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 06:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218855

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
@@ -0,0 +1,112 @@
+From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/sort/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index b10183b6f..7af1a2512 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 4da6756ac..642d225fa 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -388,6 +388,7 @@ all_tests =					\
+   tests/sort/sort-debug-keys.sh			\
+   tests/sort/sort-debug-warn.sh			\
+   tests/sort/sort-discrim.sh			\
++  tests/sort/sort-field-limit.sh		\
+   tests/sort/sort-files0-from.pl		\
+   tests/sort/sort-float.sh			\
+   tests/sort/sort-h-thousands-sep.sh		\
+diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/sort/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..30507481f3 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://0001-ls-fix-crash-with-context.patch \
            file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
+           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
-- 
2.34.1


