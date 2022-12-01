Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50490C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:09:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37612.1669882167098484078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 00:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pyr49z5P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=933431e351=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B17LZjO023604
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Dec 2022 08:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=KqqFB+UB5OwAtBRnqcF176m3q7vgtvSIO5hZJS1uID0=;
 b=Pyr49z5P2I22DuFPgyqaBDMj/nxsC1jNgCynXJU04g6ZQFNOXswTZp0v20F9rNzRu/lb
 F26NHcM3p5P205tB2Hjqu64VDZqM5OWDNPFJ4wjqUn2MZiB+RhL5CUFLzEylzkNEfDm/
 XB9S6q83pm0oM71iOskNP5bKAFk8UUS0aaB+i153QRm1XvME6R0kJOlavJFo7Cm6qU/K
 XU39ztWJv1Asf7CRicp+/UKLJMceeF6avmKr12C1xYkRDettZtVFxzAxSoK+LjI16lOS
 8SrKOQipjjX6BP1sLNTmZOfiv68rRDr7gcF9KY7xTCl4Q7ZXGzBTv9uGMqoF6tSvH+vu Ow== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381345dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 08:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoPCXxJ8mFBgiLtEEbjRLcUrOxWpQH6FLiwQ50MVUkdt3CziaGSwsIxIBHXLlj7Hka6DeNfeYyll0A2/3T0sTZTYHM5kte8EPWKzIkZE5q5hOsfURpjgk/1A8tzNEjfgzSc2q9bjPvMBa6XCLYKP5Jneg++PgFKaVWHCvjP8V7LTgao4KUzcxKLBPIskKKIl+vieQzpV7BMrbTW4k+gXOi2AHihUN0SIQF0DRN3zaM0PlUB1CTbw+QuOD9SHn0+tDBRIDEeddkVaRvlXUGnivVjRX9TxswBIlmYqcoDrsYGoNU/LX46ELE0ns2Zh1keNNJw58mAg25PbHQKJ4Hzcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqqFB+UB5OwAtBRnqcF176m3q7vgtvSIO5hZJS1uID0=;
 b=SPhsRT5R6ZVaXO06dwnyk3MU3LGnUp8yVj2abl8JqEImM+HB1xn9CSl+eUUTkPwhErGtH31c5uCZpoXKL9FPmyoRnbAIkrKxh3XhDxGzmXgNEYWS8ZCkQPTiws1Hmju4y2ElTaxDPPdIdHUeAO6vYXxKZhhQbpLeviNIVEepCiojOI8XLNsVmZh+BYYVcSb2jT44UYKP8uNC5i168X7fxPj8j3N3xIofCT7cL0+FMXtOTTWInhx7h0+NK19QPV8mLnQzU3fdE53n0WCOaYL3sMGZqJje3Y2u6b/KruS3cn1Xsvh1V74KAYENlA+LmeydEOcAH/rzsSz2TFaY5eejzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5368.namprd11.prod.outlook.com (2603:10b6:208:311::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 08:09:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 08:09:22 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] rm_work: add note about how to clean all built recipes' workdir
Date: Thu,  1 Dec 2022 16:09:04 +0800
Message-Id: <20221201080904.6042-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0204.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5368:EE_
X-MS-Office365-Filtering-Correlation-Id: 220f6f35-e05e-4033-7b19-08dad37359ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	69iGuqxbrl7YfBcCLCQ/Y5l5JQYbXt3ze12Bk8diw/hqo52eKdh7JiFfyRP/A2GA73c3WUA6eJyrVPxk/CxGUfcbfDektTxPjm+SREDI4eWNdplWSx+E12fWPlrsQTSqBtu0kDJKMptzsAmnK4/u0D9CvayRLbLtZQi6U2ajjRi90dx6s6I3RapCc9jFKldLDSX8e1y4lUiVOLoyZ2n2VjLZ5Xh/mW4O+1QgadRm/3SQLnXi1Bbi2ONu/QZHFNrNhZPACTocvnAT6OcJbarkI1eU2CWIEjQ8gBsRy5/V3TDLomrWLBhA+2obUpljGBn8pcOFEz2pGGekM/Hi8CAPv/kIAQAIrzuZSdqhbGxljg/g4HTNNGQvN4pIpLUreKqV6kOKgZc5U45yJOKXJEFkAed+7Pi5BFapj4AmZDh4Ax7gmaFbkYsJUSX6fKdOBbjlumQRBK+vgSA0LCbuWJnguJomTZRfjemp2XsPOyCKsB/ElUS/5oa4dj0+bhZDmH7TUMcLEwYDvZjcZbuVqxnoF9zoh95QetpxIienQzRbCDQqNMBSw2+hGnxMfetybmTjfWeTFrd5aziJ3XataIDTZY7qiQ2Ib0THAAZidZfLwCayid+0PbLY5zrsERnMvE72ycCoY27VSnhFNI9uAQ8tprksXv2Bz0XjcGDFRLKWDQrbLFocCDmAfB/fVpec2IsAG9W2FH6n/lHmezKIehxInQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(451199015)(38100700002)(38350700002)(6486002)(478600001)(6916009)(316002)(83380400001)(26005)(41300700001)(2616005)(6512007)(66476007)(2906002)(8936002)(1076003)(66556008)(8676002)(52116002)(66946007)(186003)(86362001)(36756003)(6666004)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cu0yfjxQtnxG62T+tB8i4EvlQCjIBXizb0owY/Xh+fZYU2CohuTDnpO4TgOX?=
 =?us-ascii?Q?0BzPqR2hfadtLG6ByH/XznAZQXgvU8mZYDr7zLvEK6iPOE7g4ADrDhJYbrou?=
 =?us-ascii?Q?nVByckli29AHEgsXq6jtoxT7vNeIfPA7HQf4SR8ZXA2xR7ZSJlmdCCSfLgED?=
 =?us-ascii?Q?CAH5/NfJN4RNQNyxVzM2rXduLgDbo8zYKka/wy90yBcMBnHYlx6nqUE0p/fx?=
 =?us-ascii?Q?nsb2+X9bb5rlEq1n2cWdjp9JmMJrK+lvEIChAXa1teCP245Y7aym9CHkhkTm?=
 =?us-ascii?Q?/SvaxKMUC3rUva9pe+uXMNcxVVRimecHG0GYEzbgRTx49TtfwxYC/bckajPi?=
 =?us-ascii?Q?Vrncr9EEBStZAE5vjoJXKeOy3cueZZW9cFbgB9MDOF02/iquuxp+wRDmOJyp?=
 =?us-ascii?Q?isrdh0lrX415EB4lNNvwBRuLPjK13yILItNvH59kBi7D0NX9uNmbulxZVASu?=
 =?us-ascii?Q?wePx4K7tzd6A/UsoAXrHtkQqMjCjVR4zBIsWKfyBc1ZKw5/uo1TKobp47iRX?=
 =?us-ascii?Q?384hO0K83Pv39dV2CYYOtLwjupLLVgyzj5dCvIyASyjrjWM9rDi+Cqxd9DHb?=
 =?us-ascii?Q?s/plmBtBWBS17tOKzdbzeklrzUgqe/YxO7LfY6nGOYUIrt4wl+eXkPHn7mWB?=
 =?us-ascii?Q?7viZ7RkHP7laHd7ccw61lQArHY2vngEFmyMBeUbzeeww76uMYcwROn8F4uzJ?=
 =?us-ascii?Q?WEOX4CN0pP2pDeTM8CBSdyhmnAoEMEB+yPioybqD5xgV+G/moSImq+wKO3W6?=
 =?us-ascii?Q?4NNGTGOkcGcg0Zax3Co5c685PlCDc5rfrPVFJVcYmoVpjaVuwN73eUJgtg0k?=
 =?us-ascii?Q?UCyIsjkrYEQyz4+76SKtxwgz6rjuAxb81/s6nNuoi0yRAiN7QZE/zi7TRkMD?=
 =?us-ascii?Q?7ppKj1xWMLcJUZ07CVWG6fmgcToTKFIjmqyk321fgQzbbBluiFHUO76etKXX?=
 =?us-ascii?Q?9FfVSQlgzchy8xVxLXkXdlb/lWLzC3hBvfMPDikf3KA4zohBLTelXkx0+Ho0?=
 =?us-ascii?Q?n4xj+yRFHvPamMzcGZCyPiqiYjOF+UZPTnDSicgIsrS+WAtgQMVvZ+X4xv8z?=
 =?us-ascii?Q?m+yhjQetWP4MbXLtNu9RPHqzvOxf4BKwWUdM3da5sQEAVjkO3xwrSkTnK1aU?=
 =?us-ascii?Q?5qYb2D0TYAVYKaaGKYLc88gmOcNyhRMWIJlZbzPJli/fo+d1s4vA9zZRpsPH?=
 =?us-ascii?Q?a8cM/hlZYoJYyZn9YMa0VcUzoRnlvCDnlvKAh7QZeiqkWjuXP/gAbGqxLVFL?=
 =?us-ascii?Q?XLBXMH71Rk/a96TqrufNKet0wzlL8yYm/RMsAId8sCwp/N/EJhHuq+3jd7bd?=
 =?us-ascii?Q?OKWAVSYYXbvjkPcxyLoNSFAkGdTxtHgtWM43mHML6rgFfR90qJhBkvUmsBSQ?=
 =?us-ascii?Q?UflsDg+cySAosLhthrPfAW7Ccx0hsNi85FXoL9eswmA7jFSD4qksVwrebson?=
 =?us-ascii?Q?DlUwJGrY2vPyM97ollPLd+w0ayhUHRS3AvmoTiXc6nj9Qd+yTD7U75NxwyYR?=
 =?us-ascii?Q?9muJ1ORsNoR4IDB60jnjJD1ByeJFpXFtJrpoCGL86xuxOVeC03q7wVpq7CYa?=
 =?us-ascii?Q?6gBpQmZWvXmTVXEvZutJsiEpWbsrEuB5ph3rLjZ2oyNbc1YDgTDkHjQ3CBKw?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220f6f35-e05e-4033-7b19-08dad37359ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 08:09:22.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwh23ddfdzrKqFbO5gi2ASDQdKBpWz4RVeqUVJXbp+Pei/LZEBNCO8fnaAa6TMzWmNSbIYMDpLi3bWNFamEuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5368
X-Proofpoint-GUID: rRF6qJyVezp7KOW_pXLa-NM2NlWeuzIn
X-Proofpoint-ORIG-GUID: rRF6qJyVezp7KOW_pXLa-NM2NlWeuzIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 08:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174043

The do_build recrdeptask dependencies are removed for a cleaner
dependency relationship. This, however, makes rm_work behave
differently than previous releases. Not all built recipes' ${WORKDIR}
are cleaned. This is because we use the 'depends' varflag to
specify some dependencies, and rm_work cannot handle such case.
e.g.
do_rootfs[depends] += " makedevs-native:do_populate_sysroot ..."

I really don't see an easy way to restore previous behavior, but
we can use `--runall build' to ensure all built recipes' ${WORKDIR}
are cleaned.
e.g.
bitbake core-image-minimal --runall build

It would be helpful to add such note in this bbclass, as people who
use rm_work might also want cleaning all workdirs.

The following testing is done to ensure that the extra tasks added by
specifying '--runall build' should be mostly do_build, do_rm_work_all
and do_rm_work.
'''
 1. bitbake -g core-image-minimal && grep label task-depends.dot > current
 2. bitbake -g core-image-minimal --runall build && grep label task-depends.dot > runall-build
 3. diff current runall-build | grep '^>' | grep -v do_rm_work_all | grep -v do_build | grep -v do_rm_work
'''
In my testing, the output is empty, which demonstrates that all extra
tasks introduced by '--runall build' are these three tasks.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rm_work.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 4121a13279..b54d949e46 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -23,6 +23,13 @@
 #     echo "bar" >${WORKDIR}/foo
 # }
 # RM_WORK_EXCLUDE_ITEMS += "foo"
+#
+# Note:
+# After removing the do_build recrdeptask dependencies, merely running
+# `bitbake recipeA' does not clean all built recipes' ${WORKDIR}.
+# To ensure all built recipes' ${WORKDIR} are cleaned up, run
+# `bitbake recipeA --runall build'
+#
 RM_WORK_EXCLUDE_ITEMS = "temp"
 
 # Use the completion scheduler by default when rm_work is active
-- 
2.17.1


