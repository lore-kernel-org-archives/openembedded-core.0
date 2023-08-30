Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8384DC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 05:02:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7329.1693371746661008303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 22:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AvdY3Nl6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=760630e6d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U4p7Sv024210
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 22:02:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=uSgCbFvat2g7icHSut
	XobVpLpW/KgmBZohbtVqB/5bA=; b=AvdY3Nl64NlS1nbo6Ma/F+8s1uhvSh/Fl4
	fheH8WDyH85HSKhwIDSkS/+hpoeFfLbiWMeklE077UJ109W9KTmbE5y+WBOcZDFK
	s58tEQNRjWqzMIlzvM5XBYv7WYWfqEQBigCPndEhVfNLFcpDTEuUhmh4WHG/TqXB
	XM4TSgKwPqflfqM47SzmiMVtUV+fQ7t5oWs9NxsA76DIHWmZd1JQbNqVmew2kvlF
	F1Nm/EfYOYwbYXwrTu2c1XIsuvXKI05k7xk6cvTEdPTupHqkATQRx4xt1Iuhkb+J
	rIDf+Ky0PIGai/xE4VbJdL51nzsvPsWLHyeDu6Pw0DSxYOjBK7/Q==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfk2yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 22:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LO3i3liEQj7eWd86ZJtnNXb1oGjc+xDYPBWIaK6kz1J3m1AN3XBNsurNJMbU8UsT9givio/2pRaoBpWY8xzJFrIeAtN4AVyPCgEbCiL/gcQRSFqHkmk+tLtCdMQ4mtNCuk/X++9Tgpn69NowYw1516ZTlDl/njyEfmdUDcdtSjMkG4lRAWqPqo2F4f8i9H6XwQMlG88RLwChXtFKKX8JODMXSK1kVUHIDN6i1jFKXzM3QRWPamlhoLaptJG0N/9ldSN4rI5Ru3JyX/rG0P201R8JwVJ23u9qzjTqtvrx3wbupGi3GeSiw92dxLN9WMl88fNJeHep52FB55nTJls4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSgCbFvat2g7icHSutXobVpLpW/KgmBZohbtVqB/5bA=;
 b=KNjR2XAkuhulVGVemyNvvS00Sc/Lr9rqvtvu5AfysmU0ypUZJmlYu6IAtYUhZdz/4G2bXuA1+Y8ECTD+RjKrFrD+XbXFdhoXnVdpE/+Rot9unCsAK6EvSHNnovdZ/srdl9P8P/EJiGX4Sd7Z47ZJT/C1MEcdUz9A3wsiuGVEVEbuyP4Jkblvl9rB1gjxpmnria9Bz141RGs5Mea9mLVVcfJcf4+PLzVvOVklwNGbOaD0Wd4/jgJoXFF/WMjY8HcqcTpXnau+qZVRnWt0/PAXLc8rBrcEWG06xngSjL0XibKEkum6JnHhVxFsqowmLsLz7a3kaIL4KmoEnwtEoln3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 04:48:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 04:48:17 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] stress-ng: disable DEBUG_BUILD
Date: Wed, 30 Aug 2023 12:48:00 +0800
Message-Id: <20230830044800.874927-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0ae4e7-30be-47a2-2479-08dba914536f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H0vzwZxaxLWYNbtagz6NKbQtNMBovhrGu6oDbkEmBEEaQ2Q51/rAY2PzrN/yTReYXryNgn6htUKd8OkmP8kdyyjD+feBt1gChV2/zL1D61D+WgvuKHR+lBePOKudmrY/2iIbwhmw2F6OnPFAV5LdGfmunRwdfnA2VBQ55kHdeoqVeu5YzT934W9ST+gMTtGM274N9aTGEQD39U2fkihiw9ferCvkxp7Qv0ujfa+B7iiaKo0d8Br1kn51l/tawAtvgqwwzY+fdXBIGueEnbe5J2YOvIqLa7w1w7FuW9+5lZTs1AN1AvsBAsvPRBHFW6SDRKtATz+/yOllFkVPm2wMP0YBMrOqVjCJw+CAQrYDSgaJIv+olv/N7cjEWGXKsxH/TCRmUfT3NJGuRhuUq0/slvRLUbegt9sAGA0o8fENA+GkpxV31cJsTmNyjYhbn6CLPnlpMJvqSX/tZzqhOzCMy1NLFhpPNhp6zptPq70AU+wnTS+Xp9LoDWg6iBDha4Kc19SVk3gL0m7bHvHPaqZ3s30ptY5ruA+Rerz4q4feeJbX0yghRluiEWMV7jTQTpFDAuHPC3IqmJ1/kEXftjYKUS+zWxAAswBli0LF7PUc0jk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(396003)(376002)(186009)(451199024)(1800799009)(6666004)(6512007)(52116002)(6506007)(2616005)(1076003)(9686003)(6486002)(66556008)(2906002)(5660300002)(8936002)(86362001)(36756003)(38350700002)(6916009)(66946007)(316002)(41300700001)(66476007)(38100700002)(8676002)(478600001)(966005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jiQgjI+ElYxHt6jW7tqhVfINTBTY088ooVVToiM2cIN/1EbEDPab9YWX26rx?=
 =?us-ascii?Q?U/yIqJbk2N213o4xw8A4A4uwpwTN1BUD2jhwlRTrg0eoYV/+nGTD9hfu8yV1?=
 =?us-ascii?Q?gSEBxCmOyVR6hBQtvFBF7cMxYnK0bF+/QZJdlayPzvBK3+gN6mH4MXyafiqq?=
 =?us-ascii?Q?K64AJx8f44mbnwA8WaldLLcjaRYsxV0izNY62K6XfHCjsNBhXhnMgCz2EgFc?=
 =?us-ascii?Q?xnIwgPsB3CTHl29V5Bz601oP8Vg4RqfnafJP4oL7LYKlW8d+0RrQ2eSR4cDB?=
 =?us-ascii?Q?RNbmaMK0GclzL0R0c1GZ84PKtKaaLjRSWD1WkE5FCh2qkNy13Gh14H/SSMy1?=
 =?us-ascii?Q?W08/M/VzgkFSPyq4ez3RsWBTtvU73Ik7N5H2cRmx5Qo3dP2M87W4H3rB4wib?=
 =?us-ascii?Q?0h+cNubIIpb9tsosfccroqyxhak/LjTYvLC0nGdmgGCQ7w7lvbZrbHkWfKJF?=
 =?us-ascii?Q?2FBriROeoEhic3ZSf1fJVqA3i+O9upHzyN7ZrsRP9/n3sIWyK8EKgwSJnraB?=
 =?us-ascii?Q?OgZ95Njq+kNd2+SA3jsTPqM9ONf55ImsgZkOkXEEt1MP+RBtm/8lrKVUgRGC?=
 =?us-ascii?Q?7N/RDrHdes3qfki4bHQgucT+hEnCUd2X7HGVIBcsfLg7EgYImtH7K6nEEmSI?=
 =?us-ascii?Q?tQAHSMWWuituS0V7qlW5pffrxW0BIozYw90gQGP7yrWztIl3QkQYbyXhL7sJ?=
 =?us-ascii?Q?sij78Zp8IOI5I7hKt8HgfY+fEYiQ5CX6Uv8zOuuFLUqTFyQYHYat2ZNLgEaR?=
 =?us-ascii?Q?M0zsZ27Ye8gnyePXrGGYhJ4MhHjQRmHTnIrMnok/uLZRSxFnsaQLiQ0bGm5E?=
 =?us-ascii?Q?YZimPiBTuYzEMJ51j29yCSJGJSC3LpSI8L+s+8gv7akvi8iE9fJNorysw/iR?=
 =?us-ascii?Q?ETOJ8JzPQ3azjQiEZEyrYi3VAh9RL+nQy9RsiVNAvxS2EwGolF6zd1gf7MZB?=
 =?us-ascii?Q?xEmi46FCGyx6cY1SvdtRrrXaXwitQuspS2wFKpOEtuzL/QE6LhxV7w4NM1Xw?=
 =?us-ascii?Q?mDutNEtXNeH4G8xJwpcGtrDTQQ74XQPY/Umk9n7qLp1AOOUYiIvzJXuL0/GE?=
 =?us-ascii?Q?QRs25XWIxoqWHQHQshZks0r9D3M7NI1nRZFy17TtpvAzSTTuw9pJ/bCqqd7K?=
 =?us-ascii?Q?yC/YcCai71gbHl28oQl8IXByEB4HcBAEnCh63H6/JBnJm1EDaftJwajeOXYV?=
 =?us-ascii?Q?eXhMuPMlwVcBcxbA2CZm6EoG6ppb7/T4kztNRSfopLhSjT3Y0yjQqxykeh/R?=
 =?us-ascii?Q?/XJrXrok/HqQVAc3n4fCqKRMtAXcASQ/Qz+vaqLNYVwrlVYqIaJjnAHsoVC2?=
 =?us-ascii?Q?9CK2EX/0xO5dA34aXkb5AGMx73BSO+XCRkjw2wb+5qIJwC6hVykSpz43NqcR?=
 =?us-ascii?Q?lqNb5YmqD+lpY/HhhWXo6ZU0Qct7YXclSHSmkJYeT9gHbT61cl/wsRLRSSg7?=
 =?us-ascii?Q?/HdDjt5ka/IAYPzDNwQ21wnXCh71e/5KJe50Lnz+aPwKC5soKgMqZjd2ZFC5?=
 =?us-ascii?Q?zjgNtXH2T/thyfHLrkUbFZ9Qdrrj1HW5iGj5MeaB6wppLbzcshaoyeSzDxbd?=
 =?us-ascii?Q?2fTC+W24l4+iYLg10wN0ikrWlI+S9QtAzpkbRE4f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0ae4e7-30be-47a2-2479-08dba914536f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 04:48:17.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhaX+2RCiMNZICgGg+D+NiTEnvsLNLMEum+frgGCqyWd6s90yYtvmiM8VkffXC6plwLZK5H9kHSWfwt862hlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
X-Proofpoint-GUID: Rx6jufBTFwUFn6hRVOvpYEE6yrHXAPa8
X-Proofpoint-ORIG-GUID: Rx6jufBTFwUFn6hRVOvpYEE6yrHXAPa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=516
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2308300046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 05:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186869

From: Chen Qi <Qi.Chen@windriver.com>

We get do_compile error when DEBUG_BUILD is enabled:

  error: inlining failed in call to 'always_inline' '_mm512_storeu_si512': target specific option mismatch

To reproduce the issue, set the following lines in local.conf
and then `bitbake stress-ng'.

  MACHINE = "qemux86-64"
  DEBUG_BUILD = "1"

A new issue is filed for stress-ng to track it:
https://github.com/ColinIanKing/stress-ng/issues/315

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
index 6e5665cc3b..af8433975b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
@@ -31,3 +31,6 @@ do_install() {
     oe_runmake DESTDIR=${D} BINDIR=${bindir} install
     ln -s stress-ng ${D}${bindir}/stress
 }
+
+# upstream issue: https://github.com/ColinIanKing/stress-ng/issues/315
+DEBUG_BUILD = "0"
-- 
2.34.1


