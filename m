Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AD8C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 08:38:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25164.1704184694852875888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 00:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dD06zhlu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=173143555b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40287lHA025367
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 00:38:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=LLkODUe8Mq0gP3tzfK
	2hRVa3j3tyy+oIMjRuGrwE5/Q=; b=dD06zhlubSeCLn1HhYwqhe6HeyoKCE5ssA
	Hju2Au4pa3IkH6/OzSFclFu/wps1Demlaei1HUcDe7ucLLqBBwVEF/IZAd387zZq
	uiXOMHTFP/Amoy81K83SAfH/Sy/WLFqkWIkQFkSx8ZaNqqXzIAEGzoTXA8ysnrMI
	J/6wGIOFAa4wexIIn3QwIm46OGnkv0tW2wIxwaZnFg91TkkiH8YzNNDIsHW0yVDV
	PGGW2kz20MJIXvP7am6Qar3TNfCc+osk/TywmYuuFYwwUZc9G01W2ans0nMSGkOD
	GRGJgYDEjZhgDzoOaUaxVuZvRZiThXrGXwq4qWKOHUnGDHHj7P9A==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4adw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 00:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQvNYVUpBrVEXIMtrCZB8ixIDadgn/NBrcT2iCiH2LDV+Z2tGPCn0lX2FygTQxO0HlvI92pT/K1pi9ub8w2f/j+jQTgZK2U/sHMElY/wW1IAjF8o9ef1VmbOhv2qNLHquLW7J2dJ+ICooGGEksKUzB/A9XVET16ehK3kfZy7IxfMhrGIUDCWTHOt6DSnW+OtbcBB5qkhzevyORjCldc6lBdV6GqSVtkMNWpYMfkOeOOX4mRJEdnsj3uA5XjpU/+C0B5g3JXljo6ibtmRo1eptqxZPHPzywpQ+LKmDzsO5sObFE/A+3vZpmjcKj0QWYUspmHErsSp6qNnCcl/0Kux7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLkODUe8Mq0gP3tzfK2hRVa3j3tyy+oIMjRuGrwE5/Q=;
 b=QEnQeHWmFMC9zljOWvd0v+ZMxQSKQEAV39kzleKZjXefQjt9nYzUSyay5Zb6f+ZUy2ON3JsZ5KWgHE/O8xoJ+S6DIvGx0RzfQ4RX/sLCAwZWQvxNpR+OAUPk3ScEkkcRldTXldOX8itEVBJHEIejkv930OeYb/KugRRNfb7CJiSQ1KBRysfAjGYK+YwLOSle1vS/CWSzYNVjH2oYFgs8KjTBUgFm1hnmsN77Jku+Yv4Nrlg5cZgfRK7lhex+lJShNZEQhzmzDlX4VVrqD6g9/n/TIh1YhtxpauzMmPLfKalz2TEtBdXtfwGKsdY8umU3XFirXB7vhzHF6QGF2pxgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 08:38:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 08:38:09 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
Date: Tue,  2 Jan 2024 16:37:55 +0800
Message-Id: <20240102083755.316126-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0160.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 5480e2c0-1d2b-4cb9-3172-08dc0b6e263d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rwYbKjPsbY8bseUr6/nZMPfF+SrwNTDMeza7lyeDgms+pEQAguMcElvN8iJTgMVRtT106e8k0phsWd78VcENzbfRssAzdRygR1axQN+7ol8O07q0nLeRD5HfDkvWFRjxrD3Mtw3PYKOzXpiq22gCJszYTDcJrIvgMOqezjJmltBO6Le9hb97QdTOsuH9foT7JOTL+dZc1VSf11mUeBcVxZ8dEJvLj7bRAv+TGUWELm8UlJf4qA9O9IvOdyhrolyG0AJuWjkVe3CDq4Xe/hPimxr9fgsxpeLH249Z9eYAi13yVEO3hw+PL6BtgA0HHK7RUNYa2s82KrrvRFy/R57E4opizCzq8FwHr8U5Dr4Y4tYUQjoX64Utc+42PX1KPu3aD3dLcnjFclpi2dQG0ZFFajnoQOeAf66k15xbMFfSPafRKXu96lBWziDG/EzyiVVToqDxiYbwZ0A+XN9311zUY7jbXtvgLOGXI57vts1+eCAWtUPJ11/fV3idPmmhfRafw2lJl09vj8TnON6zNFRtk3xkO7J2PNAZMmbaDUru1BNAcj+bvcESgVtDamgc1LRpcfp6kjsDp+S2+ntVRot9X1RNwtWziHAkjUasd6tWnGo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39850400004)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38100700002)(86362001)(38350700005)(36756003)(6512007)(9686003)(1076003)(26005)(2616005)(52116002)(6486002)(478600001)(6666004)(4744005)(2906002)(6916009)(66556008)(316002)(66946007)(66476007)(6506007)(5660300002)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7y2CL+0iptTdy5jrQTvLcYqfrlqM5x3+QNo88Cb/O1jqQmYZttLTmLBsM30+?=
 =?us-ascii?Q?GJ/aH2cxW8FxFqV2mXzSldNiLDCSOGAOTZ1azqonurQZA4FFpDaT/BtfMkJo?=
 =?us-ascii?Q?vu/h7Q0tapRDxxOmIvy+RlnQrUjyXD+fAZHewvXlv749ZjlDXxIFgXhbJDxt?=
 =?us-ascii?Q?W+ocQAPy7k5qjfc75PAyNubkVKSwoRrsKdlCWBzwPAkED8h6H8+EkPHJh9Cg?=
 =?us-ascii?Q?cmQlP62aWlAgLykCoFe+qj8e2CVUPzcxF9oC5mT3RWTrtAvS4gNiEoWF2YtH?=
 =?us-ascii?Q?wPv9UMeQnO5l551TtF6v16wy1MKt22hjw02m+1hs4S6JYaEtpLHqQh6TmRTB?=
 =?us-ascii?Q?v8qN3XLOaiJr6npfGcP4II35cVT5ttc689EXkJ8E12qBxofLuE2oPGMgDn14?=
 =?us-ascii?Q?DB9Fu8uXJ032BnTfubSeu3wU3Oxb4gwWVH2a2R6/7rcE4L0uu7E0Zg5FlLOe?=
 =?us-ascii?Q?Bwf+BykVnXuK8Q/fNpChNnWY6zR2M5j85UNrYdNJXUDrtghrneTGS+AUTFCx?=
 =?us-ascii?Q?Q/KJ30FGwjgggPT7BOQLksXR+74tPfOxG5GyelGsrvj2ewTLqx+7B7v0Hrkv?=
 =?us-ascii?Q?kEfAhf3lGD5No3uTAkViZe0D5uny27dZp/gMcYVkIDHL9LHUGOOEOGYkUrHA?=
 =?us-ascii?Q?5+6qkES1OFoCX4+TGI7ZpqC6uMyYNFl4n2V4MR2L2pKWKDMn4AET3vUBRZn4?=
 =?us-ascii?Q?YdpslvS2cxua+nuVER+FpGEF50B8NEaLN7HfV/leMev9qXM3IKq1WNkiPuUY?=
 =?us-ascii?Q?zgnjxU6gZRtCOAOyVoJBptf5fkUSYiVC2oJsOi4w9vzMOvasxYG+7If3i4JM?=
 =?us-ascii?Q?Ud1d4/86E93iyDWY6F/fWHRItBaOepTJKYeOGpRE1SJvEdx26oZ0qHRkniQV?=
 =?us-ascii?Q?36e+HUNETz6No3pHhbkaE1UMhBi+4moRv41x2efftBOGz39swbiFFZqDe6FI?=
 =?us-ascii?Q?7DV8UrGDPUITlhNfPnuf8BDGu3S59KXLpyWxokQa+N4LPaJBg8HGfHhDgARF?=
 =?us-ascii?Q?aui/Ob3O45oCy00CaCm1PFDOBnt/PnnwNLaadIqhzLExKBkOfYlqmgMUEwv9?=
 =?us-ascii?Q?DTHedsylcN5mCE/24y7flZtLFZWx2pMJykSZTHwzRSCjtFPIiWDAkXzsiZJq?=
 =?us-ascii?Q?dFTEQ71zUthxqN5ZBTvRApcV+G/Y2fIc9KPQaObpB0puo3zk+4Az5ujeH+ly?=
 =?us-ascii?Q?QcPtLVCbtg9uTRaCkDS5EO1/gG/sj0RtSYJXx7vsa7gRWqm84Y8NoGodmvgN?=
 =?us-ascii?Q?SUOdbkgLwGW7O69BKxNr2hV0Eyy2QzKRFDykcGAqCccq2TWTRTSGoHOjrUv0?=
 =?us-ascii?Q?0buqq2nzqylnEJTQ+125TFOQSxDPh32vpkd6L4nIH+dI2Dl1WQrUTvk4TZSt?=
 =?us-ascii?Q?2ME2+YTiJY6xakdwb79vgXFX5cmeQWk5hx7f6k2R8RS5J2kifVGiG9YbK758?=
 =?us-ascii?Q?t8487FMrgNS18G2JvLTEXkqRSC1QsUI0L7NggBpeP/rFn9dmlZdFblw+nev6?=
 =?us-ascii?Q?tcu9rR2eEfgDTqyZlzSth0jGVNqyvtWMeI7qjuM3h+fPcQ7LLBXKMSEMXeap?=
 =?us-ascii?Q?fuAm+6lMS0mN4hUTy8DsWuQzJW73LDKsXUog3zKF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5480e2c0-1d2b-4cb9-3172-08dc0b6e263d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 08:38:09.8618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZInDQ7qTTNA3dNsJqsILHKUOuFMN2hl6PfeHYlMbuJQ60JDEciUuDln2JheIyEOhp+twKS0dKJroLrdJ4PLSxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-Proofpoint-GUID: X3dKNI-J2CE1lW0hf4rVY4IluYrG59ud
X-Proofpoint-ORIG-GUID: X3dKNI-J2CE1lW0hf4rVY4IluYrG59ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=839
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193220

From: Chen Qi <Qi.Chen@windriver.com>

Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases
for debugedit recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/debugedit/debugedit_5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
index 63ad7babd9..3a596f5fea 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
+UPSTREAM_CHECK_URI = "https://sourceware.org/ftp/debugedit/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>(\d\.\d))/"
+
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
 
 SRC_URI:append:libc-musl = "\
-- 
2.34.1


