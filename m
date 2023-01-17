Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557B8C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 12:14:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.194472.1673957640672656102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 04:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hi5RCZng;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=038157a73e=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HBrYPQ003079
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=6YG1slF9UcVyTTTBBGYtlh9Wv6Ex1irry0LN5jcF2jE=;
 b=Hi5RCZngrXQkfXY+nLSCWWovnOhQajYNj7CFbP2CqXzPa7p/4A5YXcUVHIx4wsQOjrjj
 LBI0wm8jGdbDkqxa/ocAMwfKBiy/iaHbwSJ1w6L6PP3Cu4YK2r+LzlP19Wspq/YRizgB
 O08D3ziTpQemU3DVtFthYT/Fmwkw8jv9v//uozWS9n9OHF4dpG/n4pd4y/twx5ASijio
 KBURH9/IDkA77gWn9gjeSH31B/wxSUmj963GdGYNjv7EdETu/8641SfQigHO8yup3grW
 R8pyV3LWEE6OpM367+fKfnPHOBLRzVplo5BswDH4NqxvUo1bAy7GuVr97uErd/vFRR6t 9w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc8avff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke+eCNdyuf9Vy8njulUnULjcHxm4hwUHYUv6fqUQ9x+W9cKDJDe5GyalGeQqC/UO0IIccUfPPAbFPqe9rw0FGOxmQy4l7lEUdLv7RPc9c5EL059rZ0Hs0w3+e2oONTH/ie3KyJSq7k7toHbXnTo/5cJplrXtdHsvRTWyWnEoTvfZIDN6QZ3eDaZrGSZd3aWtQIn1qZaRsrpqI2kfr+wM1/IPzCkfHYqwYvKURAM7FUewQWJRiDNnJTsBhy3VE+/D27MxyLFgogso9UfGrnsUaJ7692jROv5/JAj5Uc2ZrwiqqbJnbCDmTHAZLKq+GdMd8m3D5ryFdPzf+ySXEhFN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YG1slF9UcVyTTTBBGYtlh9Wv6Ex1irry0LN5jcF2jE=;
 b=cxLM4Z73gaktPxnC1Souty4WBCqAdhX42075ToVz8/PPq01bVSUvYtTB0wPsR487g2RVhnnqzCx4HTwqXaCbZhRh1+onk903b5OeitEcAttbAAeCR8lUWFVuNYamQFZVSbolRGyfj8QH/eWxNh7+2Ww6RwZx0U4kDgBZgNUri0v0wINOaad7014s07PLPiuTAw1s9Dy96UTgJ1gFfDj1aUCEE82aArcuOaPcwVIVKcyhEUjnkVcVyLb3xX6lC3Vler8sHg9rMyFa2wIvNTPpyBjtLPIjEKdGnlwAgXJrE5M7n+wgXsYJ6YPK1rx0s3Y3aEHQ4PG+YMiPldzaoX5few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:58 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50%7]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 12:13:58 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] lttng-modules: update 2.13.7 -> 2.13.8
Date: Tue, 17 Jan 2023 20:13:35 +0800
Message-Id: <20230117121335.29101-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SN7PR11MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 10060938-4395-40f1-9325-08daf8844ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aL2HVx3EB/3Gqfyh3QVoe+Kfzhn2diyxLyb25dnJndowolU6Nj03CxXAKCarT8BgAxxYDdNvNmVdnP2s18CnU7NtD5M44ASQD+S9cqr46p+fVpBS6K8Az3nyMVMCY6cDTG5NtyPembswfb9sC1IV5tWqcpK/H2Hq2MRoOQwtEDldlfWjtMjgzgDiJ5mUN2OEYWxX28ajJ4PGuHIhKaPLOekUPhH7dUv+TFyJpfOON0t9e7uwv4Tu45ynSya1PZevT5uRdWktFfXzXeHptZdaT127S/RFEKmt1EzBinz3uWLnSr/ZX1ODXPbEVTdGbY1IbDEQVNcjNq0mRO1QoUZWG/LUL4/EFx0Nh3Q0MDMIFJEgNwqGeywltEIFCZA128eY5GvD+cwH2I1pmOdpZLZoMwNx2tjDIom1yHA/a/D18EIstonXbz6sosoTQmikDs+70tpR/VVMe6t1XglWQkFEsZ8OvVn95RllLVSi9lJdUbaQoPpYxUWfXejcSzflY3Q7/heHFSEJzXb7pNIuywwJLRjMp+gR4bWWWTmgEuV6HHK9gy99Y69bMno8hJwnTvH76EYF6QtuTwtUHjGM4aR2cA7VCij1QGZD8h1EFfrs8ZjEnuno60xbY5c3FcdCG+LdUGv8OaQgaIbaq9Z5xqSxJAZFGA5TMByplVfNleyHaOl86jA5Cos41bDnMPC8Ypt5PtbfH2Uz7SvSBQJpgd/k5sExc7mL1HnQSfveZf8vxko=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199015)(83380400001)(38100700002)(38350700002)(2906002)(5660300002)(8676002)(6916009)(8936002)(66946007)(66556008)(66476007)(41300700001)(26005)(6506007)(186003)(1076003)(2616005)(6512007)(316002)(6666004)(6486002)(52116002)(86362001)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nMkiiQZemkv6kiT805e7Y5CQbaTbqIxaaEZWvDT0LLcv17AQam8sC1Z/anTA?=
 =?us-ascii?Q?eusep4PTq2VcBp9VpTNJv1wh8aFnq+ha19NcqI7sMV8qPZjcTbXQDZk/cXxP?=
 =?us-ascii?Q?MbjYM3kteY0ys0DYs+1a13cgjNNqIjeUfXryAEPNgIi3uHxVC2iQin3fHF4O?=
 =?us-ascii?Q?EI0ZY78sDqRSaDSDvS8WP8KWzLKfA9AYZQPdbr4o45Mi+Gc+X+kh6cVTtHez?=
 =?us-ascii?Q?qnYNgOy/N8BfV+zGmhhnA2p3kLxa8s8TQ/NBYM7fAVXRPNT6WxDMUYPPtvPk?=
 =?us-ascii?Q?cg6mvRGasFhuurIHv/6R92DqBGQBgMoIjFfrDo4TjwVo1S5IOFg1CHmoWvuv?=
 =?us-ascii?Q?CNfn4eneRaZUJVQI+6a1ffxEzKia3reluwi53hwag7Br/6tpTyc2dlXfxh8F?=
 =?us-ascii?Q?IXCuRYdS3t0o+ZC4E5lR9D3mHGV28AD1XtXT+K7k0vCBvPg0KAeNVX5JmtLS?=
 =?us-ascii?Q?HDvJUsFZZs7tl1foRCcAtMhgfxJDvfwPm4r9fHby0l9Ai8JIDSUgwm/EtVoI?=
 =?us-ascii?Q?kktLhwIq5lXxoazU/I0zCO83WHSL/5s+kRoa1Ax/kUCmkGPNosM/y/pBZJ4o?=
 =?us-ascii?Q?Ez4Ll8MgVWTrpNtf7PoNu2jDaq6pZShihxE2RjIykqRlAcqg2rL9yDu0jQBN?=
 =?us-ascii?Q?A9lKDETobDrrQPNSUzcChpAA7sG4OGJBSFFSUVmy4fRzoY1m8ZW2x+VMb6Tc?=
 =?us-ascii?Q?WbbDK6F+9ushrBVCKYtbpPjfdQcRUDNZnM0ZmC8tUNcyrJpwUH43y8UYlzZE?=
 =?us-ascii?Q?sDhR6noOZjnkl5pnn/eJbDWJ3WWw189VVwU55UfHCD5AXBoDcjsXIdkYw92d?=
 =?us-ascii?Q?gHXO92ZhcG/vBYDcO8DUExs2TtB09q9j4NtHtfLeTtg68fOKzLr80nmtj7k+?=
 =?us-ascii?Q?QdEMCxaxmHbcXGKfw/ruhBKB134LV4vUOgodi91/0OekYVCt0BGJUcCHNnpK?=
 =?us-ascii?Q?mUGTKjKon0Hvle7Hqdoiuz1G4e5vYD5UTN7RrLCo6EhGnaGNEa5oOe40vQqf?=
 =?us-ascii?Q?9gmN8cLWb1lmvw0TOF9bt3Ofp9OVfDtsXVJ04OiwWUepBOIQ3kUmZueskt9n?=
 =?us-ascii?Q?HgS4yhODT91ep9wQuo4iCCFmtXPqkZyxbrlQfJS11SHC7ojwrA0Ny4mU88nQ?=
 =?us-ascii?Q?Y8JYz1SQnzFrTemCmY03FQXoOR0Ph+Q9SBYxOC8hJgSwUQzSreygIkv+loJk?=
 =?us-ascii?Q?asQEmYNO7vR0JzaAJZmSKa79yeWhik+/dANYh4vb0+jA5xPwXUZcg7L82Cpf?=
 =?us-ascii?Q?vs98jdz+EiU5eEgkFvXwaJetGPVzK23Go9XxaTcrZalyOx0+ttGJBDXjlBLK?=
 =?us-ascii?Q?+AQwDSHfV4oqs1mOAloF19ES52U0O+lx34MDeAQX7I/xnusbDSq24Q9GbECw?=
 =?us-ascii?Q?RQhPA2wMrH8Bhd8tAldcZnKxAzsGpyVjGR9nKhEOznHxVEYAftTBz6cc5AdI?=
 =?us-ascii?Q?eEJ/8gCYCPVcsja+4zRrcaaLjYuc5gjPXNP/tW2lNny2ecV3XS6TvvK+fq+2?=
 =?us-ascii?Q?6XEELebubM8pK7np4sqpBzQGKi6ydwRdnMg3vjK9+nl47hjfKz8qQI6rdnUM?=
 =?us-ascii?Q?XpACjTSfuAIepx2H4ADdUJl3O0oDENvVJ8SYJTDq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10060938-4395-40f1-9325-08daf8844ed7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:58.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VF+Dzuiyt5Z4MSSUYJ19mcrJMslwtAnF1DqiWglWrsYy9Ef0TIbKkqYc92lDAX/llgi7uBJgVv5QBAnc1eKhvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
X-Proofpoint-GUID: cmj_W0UbGDnMbNNFnlyFI2Wel7pg9DN2
X-Proofpoint-ORIG-GUID: cmj_W0UbGDnMbNNFnlyFI2Wel7pg9DN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=579
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176034

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index 49c584dff4..542f42ae19 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
+SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


