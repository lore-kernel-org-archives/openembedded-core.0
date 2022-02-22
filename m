Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525FAC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:45:46 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.1033.1645573545367895451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=PR/LljYD;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=9052ae2634=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21MGPQD1001701
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:45:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=NEDzhauG/1mkOl2a48g5C08KGG/1YFwTLKjypqmYjuI=;
 b=PR/LljYDP8/p8jYJCFO6y35EkagwBLuzMmAYtSszky1Ccm9iG6qKf8TQsQNPV+Tx3orr
 pUhfMeyidFy/AsojKao5YcvCf+l73riX55fQxmY2uUiajTYADae0W1M9XW6IzKaZg/M5
 fursJxsSeQWzZWLx5dtIxYePsqULf1nsoHZS2x/KQU4YyKdY7MZmrK43Fdnzbg7Y6xJX
 c/SAY5nxTx3iSbY5X1abca4hXq+BAN1dD+mJxAwFC0kVxGy8XSjJk4aaBgScDXJIN6Hm
 Mt1A8UXMz4bTgnyXuTA9S8RIPWsSBk1OhvNYJYmIuDLv+OsuYm6XypOZqgdKFDrdfO/0 Fg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3ecafdb7pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:45:44 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhZ9YnkkmjaGJ7PQgn9bggfBLdfZUhcAC/Y1recEeenHIzg5jz4r52+dh7q8H8ek2nvr1fMjPMLI9Nq6JMWa/9VYmdiUVN2E1GM44vJ30cQQe5PL+K58LcXXM8yO6sEWh13ERyhrgbEGWG8EU6mqjh8hfcWF52JtkkYoQ0Il4BH0VC4Hh2Za16YDsI6i7IEleZyyKWe65bpGgHJlIpRuxP6aVkrAk6Maz/WDyaE/o3RrJBADYqJ8vFUD6TqGuo6OGEBhdk35dG84mHLTRAlHcxc8Ptv573L9kXKSI5jNVSKL+G8GrJZcspguC1bhC7oHlg11fYMBGrvHqPJ/+3C8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEDzhauG/1mkOl2a48g5C08KGG/1YFwTLKjypqmYjuI=;
 b=W6CWV3RlqVaCZeOY7pGe3GynglhXW2LBcGxKxvgGlIrEiw2Xu0xrxQANgXHAWfiyraNb/IDKFP7s0rV+K9kcaKP1w78z5CFS7SOcmCnfIg2dCwCZNZ4N6gE8BnFSekVaz8cRXOtr0sD71eNJjCPkrhM9SJ0Z11jMzJFyhnn27Rmjvw73CM3mzrnUokvqqL6/SE4MmInKjCLzQsCl0DmJLMFlcZhhj8eSwdw8z67AZb+PUVO6uV2cU8pgcG+8VPnglgSgTLefbbrstrTEA2O6bDNjYZwZkJK+irOLjnTHqfj0xyRL1JI54U3L91sYjPRCv+4n/yktUj+I896+cP95SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEDzhauG/1mkOl2a48g5C08KGG/1YFwTLKjypqmYjuI=;
 b=tH5AnQD9TLfIUaBiKAi3JRxjQcDJwtmYTISvbYX41gfdJvjQ4SIlUIplbYwEbzVBiqAyw1AJW98IbOfnwu5XJD9FhsFNLidLqSR1A2+kDpyfdmrf244Iyi/42QF4s1q9FLE3a2c9MCXVsTwUzwv728AA1tkkVE5JKreWIBV3mc8=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB3855.namprd04.prod.outlook.com (2603:10b6:805:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 23:45:41 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7559:6ad6:d575:963b]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7559:6ad6:d575:963b%3]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 23:45:41 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH] sudo: add /etc/sudoers to sudo-lib conffiles
Date: Tue, 22 Feb 2022 17:44:57 -0600
Message-Id: <20220222234457.2211495-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0084.namprd12.prod.outlook.com
 (2603:10b6:802:21::19) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3565d2-5707-4c2f-f11f-08d9f65d6f17
X-MS-TrafficTypeDiagnostic: SN6PR04MB3855:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB38558983A22F43A93CFBF682FE3B9@SN6PR04MB3855.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	15KQwEFoFE9DnDifPNGVUX98t63I4boWIGdkkYcohlLmjElzJ1mnOclrNXDuksxFv3zWRKNtgdgSjcBRtOtteMiNU5aZbkt19Xik0+wiPHptyDLXZRbxcTtePzXaD/L7uYwtB9ef+y5FBcHhLbqZMc+gHqVCpeHg/ggqozQApcHltRIiV88uMwxhRWtg6bPeQ2v5rWWrryAZr3vhx4zAMdWnhpQYwpuTwHn3AmkUrDbmTl+Q6klonuIF9wAA/oYMVlA+KxhZfm0osvaoCZTPBB6UoLkIClwK0jPjlz00RadWxOCnilJNRMUasC4X+dHQOyXR1S2cl12vqw1mrVOkZu7TdczfNI5R3le2plSSPgIcnlQ9BqwvXhiAzXo0LlpGmcLtqkbOyilS+XknSL8WfC7pbeQz8hsDuJPBLzBMqSEAdA7wiiughqDXFqDOPuF1xt4o0YWfdlPXSNg0j1VAMcvvV8vUi3Gq5x4b/B/GxwljCZorYq3DAD57xPSn+KFrAdqk49J8qwD+xQDlKJbk0DrzW7ztc1fjzDEw8jvCB19d1UkmSYJttMgc5jfgGwzzuqNFsdzCuo+xzKc0nUfh68wnSfO261GpVdNr9vFJPTetaAgavkmI4qbjH7tAnpyv/96/UVR3O9aoZgDZtUHdpwjXIcQ20TlN4SFIsY4D3ecDxC1oeM3sPLpWs32++zn1ZK+wZxwMw0u5KXraDXLhEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(38100700002)(83380400001)(38350700002)(36756003)(44832011)(5660300002)(8936002)(2906002)(6506007)(2616005)(6486002)(52116002)(186003)(26005)(66556008)(66946007)(6512007)(1076003)(6666004)(86362001)(316002)(8676002)(66476007)(508600001)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Kj+HP72VMj6tQzpxWu0AtFMPwGwPd++dXpS8uZZi5wDBB518YcVhnlZfZmq?=
 =?us-ascii?Q?NPIWj4G9owMdcwUIQuAOPQ49WzDmXn5HIh6azxmakQxD1Zu1jT08Rd3qmdsq?=
 =?us-ascii?Q?HvtqT0k4gh1S3Wr4qh6ChUEpWNTPQi1dCglklHyK2/JyjGBw6ZmlarrLMduJ?=
 =?us-ascii?Q?tzDm2s5hiS32oNYRnlDH7cPhgkJLzezp05SapiQ8hwwmZMLT/zfUfch2Xdps?=
 =?us-ascii?Q?Gl8DO3qqkckVwZTYV6MhD9gadW7wl9Bh3/dD5KLowOg1kheJt98tuyIPiBdA?=
 =?us-ascii?Q?pjoz6BTE1g5ppSV3dTWyUZij0FiZXWOk3J/6kyhMeWdDRIG+tGNTM+KzjyQc?=
 =?us-ascii?Q?ewGo6rXoZUDRxG0wankLVCiaSCiRJlWjfx7ML646mDR18WkPRUsP1M7cF5VK?=
 =?us-ascii?Q?UvdpXr6Prpsr1EFsqpft5R9GuHCLAisvICvMJOx/LbViVEGAmFYuzhtVswpe?=
 =?us-ascii?Q?dwgC1CaqeHUTfBXwl3BIT7rdSXk+v3bS02uRE45H/zonAsa4E1gG1VJZhtwL?=
 =?us-ascii?Q?2PoduIT+QoBk82mQNR2l9gdio+Xt2S+QTzC42v+Ome+SYMq8N0FWF75kP+1X?=
 =?us-ascii?Q?FRV5liEeT23/xtg4ue1EVvQT88DjaHQ1cphKTIg/ehsk/gvx3eXTmKlFYNnL?=
 =?us-ascii?Q?iNdYe9zfsEOCvihwtCQmmT+mp/YiVF7JKuQdwsldC2G3SGVxXIAWGi5kGLv3?=
 =?us-ascii?Q?T2vtlyfvmB/ELct3QXdTX98MomIMc12zx68b1HlJHemn80InI52JZM359Xzj?=
 =?us-ascii?Q?wsUX9gFyTQFeQEFXWPCxTvh69tMOKMPEZ3tfFdhliq5BmsDzTOCHSUshZqg6?=
 =?us-ascii?Q?mS4KhpGfhsUrK4zU6jLNaQKwBq0jI2S6H2RHZ0O+y6cds6Yo8NMwxVXg77MS?=
 =?us-ascii?Q?a7pzK9Q/lGCKjyi5P1oPQjps7MiptLXeUnBvHQZFOxCk/kTE00IzvGJmF44C?=
 =?us-ascii?Q?Wsg+n+XhUWmj7dycibyQgykLzSLz4Ui76TPhYk0L8AfvleTl6Rd/88DoalMx?=
 =?us-ascii?Q?YnENoaRDN3hbpcCsIFnLE0KRLAadRxr60THHMpi8lVj5k0ri9SpiY5aUv36/?=
 =?us-ascii?Q?2+WF+LcLrpGk/r4tIrHMmqHio3nKGC7HD3jixzEyRvp8EKb5Jalxv02Fs6UJ?=
 =?us-ascii?Q?9ameobT6V4gxcqBnRGpbxthl9rH9OYvkW0Ikwb7jpybBMSYSlUmHRWf0vWSP?=
 =?us-ascii?Q?X/gz59EFrTI/UD502eIAst8gnNjfHHQ0waRmfuc9XgKJqFKwwklcAwELXyxJ?=
 =?us-ascii?Q?eVy3qkKUmyHzSEbkP6t9Ph/eumQLD6YlCqNQBwi7dvKHmnpplHBE8Yns6a3M?=
 =?us-ascii?Q?SdH2L+a14VTMMJvNt7o63xm0+LY//s+f34dHRSzRF38iwGzNPZVK2j06mLEq?=
 =?us-ascii?Q?P63/JFYL4saiJ+JCWyQkDIRm4/Z+OPnL+yU3SXAJzUF+wf4+Kz8PSCUrFRbk?=
 =?us-ascii?Q?k7ZeIGyuGA0IpkfqQNeO1rQI+k0ldHYOXYa1glrSUD8lX+1JYA2H7+WRVMBi?=
 =?us-ascii?Q?C5uvvcyew7sUH85DfQOIFQxcWqW343VcehzRPtozjzwKK7Ymt037I79tRRYH?=
 =?us-ascii?Q?N0GVRD56GutmZXW6L3eqfurNhbZ1MHSD18/UrMTIl4Gqo0t6bSMVKq+NVzR8?=
 =?us-ascii?Q?WeSft6xxUUVwHluDrSkn7vg=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa3565d2-5707-4c2f-f11f-08d9f65d6f17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 23:45:40.9773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QBcG0IyP1Ar3N8mxQQfbmTweNEtO/E/pG3zkEhJTHKCMjIimlRmIsm5N2d8SQZT7BXKqxFl0XWc2OrZQVGGOOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3855
X-Proofpoint-ORIG-GUID: xfROkTScRperHQdk1z3pHSyzqMLd-c9s
X-Proofpoint-GUID: xfROkTScRperHQdk1z3pHSyzqMLd-c9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011
 mlxlogscore=957 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202220145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 23:45:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162231

When OE-core commit 788c95c3bb8ede0d3d6a8f125743ac47c0b3f00e created the
`sudo-lib` subpackage, /etc/sudoers was moved from `sudo` to `sudo-lib`.
The commit didn't update the `CONFFILES:${PN}` assignment in sudo.inc,
however. So the `sudo` base package continued to advertise conffile
ownership of /etc/sudoers, though it did not contain it.

Move the CONFFILES assignment to the sudo.bb file, since it is
packaging-related. Change the package owner to the `sudo-lib`
subpackage, since it is the rightful file-owner.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-extended/sudo/sudo.inc      | 2 --
 meta/recipes-extended/sudo/sudo_1.9.9.bb | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 05d030c2e9f176d63f3f5c5d44321db9729b7983..8947c46129f53e819f62ca6a27fba238babce88f 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -24,8 +24,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 PACKAGECONFIG[pam-wheel] = ",,,pam-plugin-wheel"
 
-CONFFILES:${PN} = "${sysconfdir}/sudoers"
-
 EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
diff --git a/meta/recipes-extended/sudo/sudo_1.9.9.bb b/meta/recipes-extended/sudo/sudo_1.9.9.bb
index f1c0339bb3be7fd48798ceb65a0dbcb0f2da63ea..d7d71bb3643ed94f5e4a5d2a2d9f4d2ff68a8f70 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.9.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.9.bb
@@ -48,6 +48,8 @@ do_install:append () {
 FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
                     ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
 
+CONFFILES:${PN}-lib = "${sysconfdir}/sudoers"
+
 SUDO_PACKAGES = "${PN}-sudo\
                  ${PN}-lib"
 
-- 
2.35.1


