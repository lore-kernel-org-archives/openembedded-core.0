Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88063C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 02:23:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5497.1651198978847602444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 19:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IsJ1pKfF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2118eeebe8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23T2G9hF030004
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 02:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=hFQ5BI43Q3PvceQ4+k7gTb2IsIhzafhWrniofJMzy8Q=;
 b=IsJ1pKfFiVsBFQ/NwRF3ASRDKcuqs7obddWU+hAVGlzsE1l+YWYbc66Fc7fDFpDjwVu+
 Fw/TAPnjpWg9W3kKQUb8p9BjwR3EVCLlzPLsIModbDwGwDZS10pk+Q/BnwrSVfqbkHeP
 Jm0U4LmwCGUAOZINsY/o+ZsyST+kKTb+Qdct1HbtOqBbYW7WhGQ7jfhhJdX/CVXz7IoH
 +qPwXtRgCGvGSTjOOBdWHP/co/CUdGypgu94lsWAdN0vGI99Pw+ulNBR5p728iL4v4Jy
 XBEQwyJMaG4qmE469kfAHdqvxpL74YSZQTNLnJwlisYUKVPasXJPAvLUfEoDdGqnEjzY Ug==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fpske9vm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 02:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYKQ/GOjJXoteL9Pmx/UupwDtC6XXEZBKdc2o9LK53mphNcWQTsVDOlxHZ7wCcRcHYDdz4Y8kIjDZKz0su25K20F9+2afcX9ka4+P2gVlc6VPnBUIoW4g7Zjo/wbe5qspdRxLG+B5mWknFPV/xCkCi1BJOxm/Q+AUra0o89tbAAxga5CQqOTS34d6t/Wgi4CcSOj/TUIjWDkB9Qj72TTTVIRxyFkNoTr6Om730qvJ1NJzpn+2cgRc1XlQTGAuqeZknrgEFBY2xo7wfOlCURMqVneYyD/MzCNfNKS7VAwXfHpjxX//bUgUytSNaMyjYLJU/ul6Q6Xf8lOY5i7rE/Z0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFQ5BI43Q3PvceQ4+k7gTb2IsIhzafhWrniofJMzy8Q=;
 b=Dv1UjBMMER5fZC2soCCujyRpDkNOWhYUcvofdcKaqBZHRML3cZ0Yq39OcSAZ4O6dg2VqzlDs4gjww4qgXUQAz3TsMAgx8BCx3eJRp0zADgj5fnG2Nc7mn1uzRKYi5gnXVwhyOLLWZd8SdrP/udCoug7q98ECG/kBcTbN3DHhKXug05Zrl/+3cgiWIrEYU5nZsJIWikXX1UYh4dZttM/zvsZ/tzATu1yWaqxIoerwA9bTDXYVCfhB9eol4ISzK2a7t7fOoCP4uwUUpbMbpyObza2hvSBimXPuhxq2iAI5YO8s2Jzmoy8kjhpdi6TLpgtvaxGMCIugtncI8M4iJ4DIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN6PR11MB1748.namprd11.prod.outlook.com (2603:10b6:404:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 02:22:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 02:22:55 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] go-helloworld: remove unused GO_WORKDIR
Date: Fri, 29 Apr 2022 10:22:38 +0800
Message-Id: <20220429022238.38588-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:100:55::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c6aefc6-ba11-4c83-816c-08da29872b49
X-MS-TrafficTypeDiagnostic: BN6PR11MB1748:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB17483302F73B1B218DF95D28EDFC9@BN6PR11MB1748.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WwkpRczQaj5VFAgG2H1d+FBW5+TxfZcUJD1Ra377AKA1MtZsiPnAQt/sEzP1Xu4zfb/jI6fgQmDm4qn0JnTIkAGqfZ/USSsKgifo760kiTZJIU4N/UKdB5CceduSeXp9DzYKopOZQ3orExIJBAhaQV3EU2MHQMakkAB40ust7CSdkxT0vZdvJqmIFMoieY0jz9nx4ukodHtKSeQsPG2QzSMyCGdOHv6wG+MHEByn8xjuGq0wU1wJgqsuZCNOAb3eBB/23neJH7ZHRaa3k0sRhZCmeifxw9TK0lYH6yzhMHK/1h8nY7RgU9fUtrq9E0Sb+7wrnmNj0mxY5aLewyMj2BypOApHNCgocl6V002hdxNK+cSbhzHQIHWJAEPvH5Pj40nDdX0ypA8vLyaWKHZVjry278P4vzoIvjvHOFBFiAq68br7rhRrI7VW6eHXvl7PnwhfN/1zWSirzyySzGN8g3Sak11rj0pKhX98cfqTqULpz3YJcuU544AYAgH3q0Zs0PAPxo8aibbuP2S4uaH3wrFM7ktvXNdvCW8dgXvymSKuUbg1JxASoYzcUtBfNrh+GVpnAb09l/RLoyfq2CLgDYO+O1Mycq/29uNrZckCwzgEbVTmNEu6e7Z5oA05wf6aqJnqe0vpdbGPMsoXut+wrbRERzUT/iXMxqM3hXWTOvHaI83ol0E8ToC+Qa4CpjQj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(66946007)(38350700002)(5660300002)(86362001)(38100700002)(8936002)(8676002)(66556008)(66476007)(36756003)(2616005)(6916009)(316002)(1076003)(508600001)(186003)(26005)(52116002)(6512007)(6506007)(6666004)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yVRIo4KXPRCHU6IwGnES5PNoGO6HEiO2HNlJYhcP3V/aEGOXSR91cyaxHbqf?=
 =?us-ascii?Q?uwcoDjASo/V+7jcfWqm2Uspe5Ml3RR7RTLr4rS/ygf7Zi6fKTaXQjOMn1k+N?=
 =?us-ascii?Q?hoICF1nB019dH2N4Zr7gygECJDsK++RiPNEvB57azl94JcCnthwdwvqJm5N0?=
 =?us-ascii?Q?Mi7rV6KgEWwBtYsTqpRxOnAkb2QC1rkxowk1gTrIGV1uqpVdrXnAM128Pzuo?=
 =?us-ascii?Q?CqlvS9NKLFcz4CwENNcx+4uH1gVvHd/T8fgBKTJ3n6+Hh5oBt5I5SVKL6WLh?=
 =?us-ascii?Q?Blk2qR7X3k3BgHU03kPCpt3ZAtIXGrrFmaNzc+9+klTpt8NQWWyn+GkN7FKb?=
 =?us-ascii?Q?4boSgEvFEyb6/ce/i8E9FEDnUmxsL9M3pZNPgvM5a7KXnjCDhb5qYCvDcOYz?=
 =?us-ascii?Q?GT0u3CuH4jYy+S4zQhNbNPetTQOMypx/1vatzcEFrFfrwjV6Ckl4YDh8fAKZ?=
 =?us-ascii?Q?NX0IOcCJacksbRQgVBAcN3dQjYrJ+cekJBzR6twfH22FlpsAGpFREEzzULIV?=
 =?us-ascii?Q?Pp2M2y0f08dLwO+P517EbVKgIgUV1jLtKroBUP7CuP36MNMymo/mmIJ3aSTT?=
 =?us-ascii?Q?r3LhXbI+Vq5/JzcwdY3pH+DLTOJSg7YKt3D2TROD/IvkhTKmj8ETtRUbZF07?=
 =?us-ascii?Q?BEw/ZUQFS6X6kPqDKahDQg2q1fkDJTxKy8qe3ghJfax57mXGmRybFpMxr4Mo?=
 =?us-ascii?Q?6B8xVSJuVf86uZKOvEtVNJwEongRbOEitBVD4fUJZaw172JBsoShvxA6b5UZ?=
 =?us-ascii?Q?oiCkwHlbEMVkBoQtqOOJvBMbJ4h90mmmuOj9GAYz05NhPQYoIQtTWoN8gg+l?=
 =?us-ascii?Q?TV6PBNg0zHQjo3DQqC7Z2nzLKC+ZpexCySGE0PKKDRsgTOZDwbuHrKkp5woG?=
 =?us-ascii?Q?MnvSqY17nZIDWZ4DyHMVr2SXZ2Ed7c/K2ZKjgqUj+w/pti4XIrmZf6oTxjIC?=
 =?us-ascii?Q?kqTaqqc/QJQGXjq8l5lgOqnx5m4U20p/PKR2x13mEacp2SVyJAlMIRBkx45x?=
 =?us-ascii?Q?b4Hi919HfnwqI7U7kntG8xBHg/iQj974GvI7BkxirLts6892LhiY82+zx/61?=
 =?us-ascii?Q?iMcnGichAuDFoHgfh9T+oeYRCps9KtHzks4DyRSyzrGZ1efhVpLRHRL68SIw?=
 =?us-ascii?Q?smqM42kMplTh6ehp5q2EGmNMabqCsrMJOWPP00/9OSZ5nc1RF58vP2avqo9A?=
 =?us-ascii?Q?Njiqa/vlacpzFH+AvoOYLX2+UUriE6zMsRuRIqRaehudhbsA3JN57oo0AtWY?=
 =?us-ascii?Q?XKfjs+1QJZscVWajCkFaQHPtRXwS35XxjsEJ6TNtEsZId1IhxMfOhtQYk2FR?=
 =?us-ascii?Q?yPTVj8kE+IcJCoEsRfKBuruTH4g1q16KmQzfmXtbTQPsErVu+gj7PXHuPgvb?=
 =?us-ascii?Q?S5916nGKy3nrhw8xH/+HPaRWfDESJoyX5jk+FXrFmMwaFweiVfMK9WD7dSOI?=
 =?us-ascii?Q?+ugg3qKWwL1Np7CBLztWL1XMTyUfOd6w/X9mVZXUK/wnUTgOyNOY/Q9ke6rC?=
 =?us-ascii?Q?LbMDdr0ltEvysEh8kkPPMOVGgXSdALrsXUz2FVBIyYh+9RQdUVtoa5dwSRSB?=
 =?us-ascii?Q?RzyPbm6uBpIB9LVt4/4ABAf0cFyw+b8YkC1jFo3wSD5ETLBLBieiIlINgX7w?=
 =?us-ascii?Q?dy3JhAb6OQpouuKFDzEioW1vuQlfNgxL3JgEzhXnWdapXGV9R9ZGOfND+HrN?=
 =?us-ascii?Q?zqQao7q/el3aQ08v+FzBPTaZ3AsT7BFQbozGh2qDANbvqCITmj1tRTUcCK65?=
 =?us-ascii?Q?oJ5b321m0g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c6aefc6-ba11-4c83-816c-08da29872b49
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 02:22:55.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +JC6/7A+trqfRZbJwnJ3dXD1vakfx7Nm+gW1Ae75LXHi696BXrQOJ07QToZ6gf+zzyyHzymebQbgImnM98ffNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1748
X-Proofpoint-ORIG-GUID: U1GRMdvXA94VNZYC0weZSVsMFvoNJDye
X-Proofpoint-GUID: U1GRMdvXA94VNZYC0weZSVsMFvoNJDye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_05,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=761
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 02:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164986

The GO_WORKDIR is used only in go-mod.bbclass. As this recipe does
not inherit go-mod.bbclass, this variable is useless here.

This go-helloworld recipe was made to inherit go-mod.bbclass and build
in module-aware mode. However, it was found that we need to build go
recipes in GOPATH mode in order to support offline build. As a result,
this recipe was changed back to only inherit go.bbclass. But the GO_WORKDIR
setting was not cleaned up.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 0faab39b66..d0de035921 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
-GO_WORKDIR = "${GO_INSTALL}"
+
 export GO111MODULE="off"
 
 inherit go
-- 
2.17.1


