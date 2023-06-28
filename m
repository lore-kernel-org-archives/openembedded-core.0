Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5FAEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 13:41:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16748.1687959698029903984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 06:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f9Ob3e9y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=654386a0a9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35SDQJeI024464
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:41:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=GfQF2rOKZBz4JB2GIf
	aKCpQp0s0RpYIK+lme6rLlcak=; b=f9Ob3e9yxE4E3vttuA+jTJE8rvTjXwu/W9
	3gK3K64meLxhw52WEueBW+Y/fuJm9YEWTZp+nvT5m2ywQxheD6n7QzKWie3ko8iV
	RoUZTJHIkLeAqr8mxGDJMN+CcuXmTv89lLMuh4EYWqLLJe9QxXnrCQrisiwVuLAf
	i/3eRszQa6sp6FDwHVFPu4q1U1Aokhm6z4gX7eZdM32vUX4mywrAhdaiV6PwG1JM
	XJyGGdkEUCmeu7uFOjMgruTVDvGdgStUP7C+VMY8nmRflQ6hh144KvwFLSqKoQ+U
	/T6ZSdyL58mPP17Y0OHJGnn0QgQL30jOu1wWOh01BnqYKuQLKfNg==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb32mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 06:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgnKibyPtZFVEEIn0zqJyT+hpwipdCixxHoncphFsHOoTViStG+Eqa8tkkzIsGxfVZitFa5TZBGbYahaCcS+QgBMcNIr/KwnMMjs44xsqNse1q3BqS1dijR9VZUu/Wt3ebzKxB63L2Qo+hUZyYOC4pVc5Ya/7C0Tu9N03Wb6ZCBplEQrzN34tadtLhE7IfwkVXVq1dUIU41Ez3EY6o7syZGNCF2mfgdw/IOY/ufAqzFuLQp99Sujo9MUIWt8WOiICziOUdL81/Eu2IfOPlLkveUI6J8MSfMHgW0P6l5VXsSXakzIwA/oH3PbP+sP8+t4MfkkgjqEvatFFAwB7zjJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfQF2rOKZBz4JB2GIfaKCpQp0s0RpYIK+lme6rLlcak=;
 b=hCkG4dtSzo2EcK3tMEeCBSb5AefEKNxJhA3Q+GFxl1liUMzfaeaq5hEA6gO4dZOG4m5OnXUAulJQ/ybrEea2Hq+oTbr/ihd0Cc6oyqlCIsWTry8/aDOCWjF0FkgxpeHm33r+JKfjP59ZNoZ0Rp/OVg5W6BeitEuFCvFf0CxvbZ9hm7vCSkvsbIIJMmUCUr1Ca741hFpnt5MZVMVnh8g7QbBEQruIX3iqelMIYBIDFoFWHpRx7V0ibOwS7u0uUhROWagCZ9HsjV0aUDd27aEDMnxBr6jF0vMx3RukwdN6kAFEBAYeSVsjcmR2B9LtP0wk/YwzzNKcWu68gxUbUpgvMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 13:41:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6544.012; Wed, 28 Jun 2023
 13:41:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ifupdown: install missing directories
Date: Wed, 28 Jun 2023 21:41:25 +0800
Message-Id: <20230628134125.3735147-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: d02b614c-1386-4b2e-1970-08db77dd63b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H8c0Q9q0stkDUBdSvCL8Fci3xe5SaoD+GcMIW6t4cTU5nsL/h7/KMLccvNBdVE/bZMLbUwNqzNobZePeDUiGPHsG9RpCbDOpQJzDfur/N//SSpG9Lg+0QiCF0+8m1hY6GG7PNOnYVXl2eu7geBGScXIBl6ZanH9FKfXowG1iKOArz5x1kJtesXvrWmhe+uOq1SM3rlLHAAreLS8i8+AOcC8ZNypxn1la0Xb5m53dZMqZ9GeN1NIzVS2pEswuASvNCYyaEPsZs9JUqU//A9Jc0H9O1zuDKQagTXkaRS5IA3Cmd/j+H0ZuL4U2X1dXN65bmeXdihJD4vgOKgcfGXsiaNxb0fMzff2ZwZ45sPrmEqfT9wOWQuctnD2FFuq8rAI8rYjMQ1HogcOOzcD63LcbXy07gEnqY7FlvT/iLHZ8Wiq8VKvDwT0LTzf4anNN1QhCXJX3vJ986uu/YgkHP3slT3crmQW8l/XD+4Ucc/ASmRdvXZipg1e97LLGefGavbXcFILL6SQuYfLgVE+Tifw50UeWGESQqt08fcE5+it7j5rk1YvFccD77OIYCJWDzOCx+pxjkPHsdl46kQqsHMWvjhTwuRwaTTd0jDOo11DxKQv1IflxHka4cb5nuqNmm81W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(451199021)(38350700002)(38100700002)(36756003)(86362001)(2616005)(8936002)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(66476007)(8676002)(316002)(1076003)(6916009)(26005)(6512007)(186003)(6506007)(44832011)(478600001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c64UcrfR1u2P4CNSQAsDW0JWl9wGF3hO3Ej3X/1jrXj8SRocKo9qPm0qHdNH?=
 =?us-ascii?Q?BCayIRmODtGG4TwOgre81icwyWkMt3x0ucvzsyKwVEIifNYWLNY9RB3KVBgv?=
 =?us-ascii?Q?MpNJxUiEb/ucfxhNYSprEcZm25MbpxfbTHVYeuQtHwv6xWwALnQJUazekmyU?=
 =?us-ascii?Q?TnYKlJAupbwUSxVaHQ9QVQwcS0RQ3lvGinq7/riw6/3O5ME8HsUd84LmOabG?=
 =?us-ascii?Q?wHyc3fCQa1qLSqsz/SNt+qNyjRQq8okpWwyiF7Fg+EN1C528hJXgibleQbux?=
 =?us-ascii?Q?xw/JYFxyk1lmoO2pGd5IRjOr9nsKAniZNRkqmlvtiUCso0Tjxif1kJJVWVD9?=
 =?us-ascii?Q?ipzm1xy2falHpi7ilO2tONqgpVwZffTOkCr9Alms3IgFFv2Mp1ydSlo0Uts0?=
 =?us-ascii?Q?88Zohz2fuBJB3+nKSlcChG0N5Gn/tEI/s1F+JJxIDJbaWnFcuohrnmbpSLmW?=
 =?us-ascii?Q?MugHyI5HtJW42zlgTrHV5zlzCJdQLd5RnEifSC8Rv15T4iOlv2dCzPWc/138?=
 =?us-ascii?Q?NZLQSznL365ilwqZK4QPWSQMnNS1ZsuYFDnao8RddlNkRTuD8xLHfQ9Qdy4Q?=
 =?us-ascii?Q?qSV+LLbgvmK8M75OWOaYoUai4RZ+eZtJmUQM0LG1MLNTOVsEv1Ndd1xRyOa2?=
 =?us-ascii?Q?DuA++F22Upo54x1XNiz0slDcA+LT9Dft0h9E6JgGKpHW5L2JMXWRheIEMhEZ?=
 =?us-ascii?Q?I2JwWh7rv8dtTGJ27c7FSQoeFae6hC3dFwwIBgN9/o8pXt0lg9m8AaonXEVW?=
 =?us-ascii?Q?8H71UsFZ6MJe2iSOBftfEA8jGHyEhEjuv3jMjcp2eiqAUfEPo2z43gwvkjKj?=
 =?us-ascii?Q?IAJpF4BHZ0V7hX1tDFWptREdFkkrGszfuwaoUcx2E27Jc15EfZp+nc4PqRGa?=
 =?us-ascii?Q?pm8aJzUvm1jIHRzYK1p1KzOtM/7ZicAYMWPjpEsEbCqM6+uYiXUcaZNXmazY?=
 =?us-ascii?Q?6whBp5YWIeoLSCKoIjjWSagAfQcHIav86KjFehwxbJmgvypukC/9svmMImxZ?=
 =?us-ascii?Q?rv9VAvTCnymg5jXDhoB7mRqZ39lMB/IDD0OunsoGo+gUPLrPGtAp3p94108P?=
 =?us-ascii?Q?5Cw+PRIVUwz121X+5ORvYi8SPzVXotdPcGjHMzo7NTvtcqojUH5CLTq2K+ra?=
 =?us-ascii?Q?wqlnooR2/6tC/NJSxu/3sUpgoN93VV+ea4rPzcV9fRcHBEcYiye7YuCRfP7B?=
 =?us-ascii?Q?HGuCWFmZD5LtKa+5YuYN0IZgNcsyv+NotwLvGnrRZlvxqvZNiExU/KHZ+cwy?=
 =?us-ascii?Q?tOngoO9H/VonMFtX49ltWnltNv2P1ON81sc7OfOW7z+VP51W6NVFrpl7i6mH?=
 =?us-ascii?Q?7NMlJBJg+uwvoh51V7nKoW1Mvzry+RP9eWfn20tEvDXHtCT0SMM0vMlDtPuD?=
 =?us-ascii?Q?60dmCF8/f8I/3+9ex8pwocTvwN63+LAR2inAaQ1BsuAMK+oHOkBTTk0f08hF?=
 =?us-ascii?Q?pIN4jpHo+kcPLYXHSbGPpPpKhlve/FvWUs0UEmEdjy9SxhVYzw0dM7tHwAQ6?=
 =?us-ascii?Q?mObdZQAUiBZhjFYz45Lb+a9jTUKJ1R2rO6DvTXeicRiQhsJCyLyKh8tJiSpK?=
 =?us-ascii?Q?IfiSWAAfo9XTNbLlAwH9vdnzLC0TTqIdzc+76AfN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02b614c-1386-4b2e-1970-08db77dd63b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:41:34.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ukMV8QrhSxhov5+ZnYbuU42o88QrNIyYQ6vrNUs97uzZwhIb/MoZ1etJHqpis1lVAugS35WQu1dVcqZUYUkYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
X-Proofpoint-GUID: RgCIGoqACfSYSv2mk0UDEJyoLTL5HFUb
X-Proofpoint-ORIG-GUID: RgCIGoqACfSYSv2mk0UDEJyoLTL5HFUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_09,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=536 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 13:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183554

There are four directories in which scripts can be placed which will
always be run for any interface during certain phases of ifup and ifdown
commands:
/etc/network/if-pre-up.d/
/etc/network/if-up.d/
/etc/network/if-down.d/
/etc/network/if-post-down.d/

Even if there are no scripts in these directories, ifup and ifdown
commands will also search these directories by using run-parts command.

Install these directories to fix the following runtime errors:
$ cat /etc/network/interfaces
auto lo
iface lo inet loopback
$ ifdown lo
ifdown: interface lo not configured
$ ifup lo
run-parts: failed to open directory /etc/network/if-up.d: No such file or directory
ifup: failed to bring up lo

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.41.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
index 5dbd6193b8..16425ea9e4 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
@@ -42,6 +42,11 @@ do_install () {
 	install -m 0644 ifup.8 ${D}${mandir}/man8
 	install -m 0644 interfaces.5 ${D}${mandir}/man5
 	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
+
+	install -d ${D}${sysconfdir}/network/if-pre-up.d
+	install -d ${D}${sysconfdir}/network/if-up.d
+	install -d ${D}${sysconfdir}/network/if-down.d
+	install -d ${D}${sysconfdir}/network/if-post-down.d
 }
 
 do_install_ptest () {
-- 
2.25.1


