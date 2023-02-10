Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CF1C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 15:33:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18349.1676043201493333489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 07:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=m4vTOb6a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1405ec2897=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ADI9fE013741
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:33:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4wuucl/vDegUJQGmzNuLyRyA5EBSjhN0mL37kzSU0Rc=;
 b=m4vTOb6aQvt20ovbhTmJCoOuY7QhIj/+aRutf+jVsLfTmEaOtqkmY52A+5oxzE+cvmtR
 c4SGdFNTjjq399kyr5R5ERiBXVGZA+CmK0EbxyqAqfqVvOyUyGkjjQl95QAyTnpdChR1
 Xk393gon9kzaS/pWWWeEoKDS+g4V5hbPpHe4FrxExeF/eyDiOg169fleqiedtaT3qfE/
 9S/KSDEAMxS4vMixkNI3TS0I1JYVEJUY7XsSA07aTCDG8wtv7fyBh3GxJ+F9R0o2SgAv
 HZxCteJ1Ph2hdVwAXsQRY9ezRDFzN27wB7Z8Wb1pjhQxGimuEzgkQ76IXEKIVJBLVZIa wQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhqrrp4kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:33:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhgavTTnZbBdZV+JwUPs7JHSpHxY3KdZzamZxjGhT5s9w2uvnYIWPpppSUviYcvVAtHEznI4gNH40GqkXGVMtKW97YERjFryfpap1r9bj32j+KCkec50Sx6VJ8PDJfPMA9p+V4nu3MLsmtNurRzhJynEHKII28oO0JBut48boDh99TJ90Lp+KFX9uA6+xRn2JD3NEW+4wxI+cU6vGcRV6yoaaI/5GMXo0TNgfEFsj3ZnEMnzQuZI1mA90xJk6V5gGKC8D9ouwqPLFaiplmINVtPLYDrAX54NWsYJKIVY7MtNIXuL0c+qA+C/sYUb/yyATX4/C452JXBuxnQl+8gRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wuucl/vDegUJQGmzNuLyRyA5EBSjhN0mL37kzSU0Rc=;
 b=TCTHdLa+H8PcVHCY5KpOsQo99AFuqJWlf3UO+xdEHhzYDq7Dc3aB+zVplLfEK65Tay8+wyy0k3pTeawJzLLGhzr2MdhYLo829Nv2NeAvW9MTcOp5KTN+CTIAiPQTrJUSxJhMcp3jtT3r/XXEnfjWZNsMSMnE3NBh30Zs5hFaUSUt1cr1/Oo23ra7djb2VT0m/Z3/C1RppDGQKp3++RomtfsRxNhdHpofsTP+SWOIZzshUvwMXgHG1G5X/cYjboSeC0vWvZk0/cBt/aIIaM3svGxiEY0buhxjZTT438App+cWWU9gFSIWJBDO4eAuOTmqAxeY9AajRixPAIyn4yCEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 15:33:17 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%3]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 15:33:16 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] busybox: Fix depmod patch
Date: Fri, 10 Feb 2023 07:32:55 -0800
Message-Id: <20230210153255.2716448-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7406d9ad-9b19-4c46-a28f-08db0b7c212f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHKylOkLXrgDbkZcIkWoXhAYz19dQFe8Qxc2mAOPWC3qrwlslB/fqH8pgZkMaeTu4RkK2E6ZlOTe217hM+xWcx7R/KXjrgJJTxOqiMsg4OX1JN91d7iGZVL+Ts0NG0R9tURGOMHoD51VSzevXjzePo/mfburGy0jzqMWGKsq5jXsxMoNTRsCwAd7ToQMUNzmWaOPzt84L7E3Ql82rd9ruj39OEat5POLv37ctf7WNy2Hoh0XrQPRIxIVplisr27c8wgYxD+krcruZtrvhAQXQiIr8gbpuqsLgiZIgpMDVy2vrk22af0Cr4v4GUCWX5MEDn6Bytf7ARCgIP+7/4ogWFQZfYZzp/PuWL0X3X/qyhsGgkoVBRvExlchxb1rTPmM5RYFZTCKJLSV2uyuNx1uggvmsjumxd7rdnNcXoXTOMu3jle8kJUkwuzJ1yvuXQ027Yu7MOj/1/AZYNt6FgNpQMPIj9Z4FpvYxLrfn2JEx0eFhd/yQafyU9/l/NjvWXg0ZKsuROkVNuIrngw30HMyVBNQZ/3hEtGwAbY7E+1Cx/if76sECVHNMHW9+YXtiyny2bsepRx4hxDtYLXfsNwjdk4baeYw0oR00QsO15iZqRu6W60LBXxaWmiT3/oxkczVJhH4y3B95kvM0UvCdOMTMYTJh4J6DE5VnrLoH2oqyu81cArjZfClhGqU9oBaYSvXcnl1eqzkTm0KPjzjBp7Jkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(451199018)(38350700002)(107886003)(36756003)(38100700002)(86362001)(6512007)(186003)(26005)(83380400001)(2616005)(6666004)(6506007)(1076003)(2906002)(8676002)(66946007)(4326008)(6916009)(66556008)(66476007)(6486002)(52116002)(478600001)(44832011)(5660300002)(8936002)(41300700001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OnTVXHNWc7+kawICEwM5GoIlLH6nAmdVrheX9PYz8/8xJUq9JyrDKB25C3Ed?=
 =?us-ascii?Q?iqNU67YrQ+rP7B9Xby+laWM9UZSd960eBuXQ/mI/WXmCx7YDXyBpXoympJLw?=
 =?us-ascii?Q?KsT5u1PLmyFwwR53VG9KmajvPkg+jYw9dKdtWTVnjvf2RL7hNBe2tngZpK2Z?=
 =?us-ascii?Q?LzEPUzDJ5NsogB0UEb2OqLZm0qLhUL5SrvZlIT6tu7pGAKf/DvHvUY+wALFh?=
 =?us-ascii?Q?oIoTSWihNTPG8KcWBLJo36kLo2NJkfoxqCy1fFNOU5hIlxrcorMNQKm8/wRY?=
 =?us-ascii?Q?2T4dRFVGJRFBQClS0657TrRYJ1WpFTLcqrUbNjGu9Lj73TA/Dhw/C/Lbkj6N?=
 =?us-ascii?Q?XPsf1+9qoOgk0nnpP+1rCkBiUaeYpca73u2wc7zguKev/Cq2WqYClgiV9vwU?=
 =?us-ascii?Q?bDcZtG8vdlI7r9UjDkAR9mw7OXNESSEfPbxYMdgTHVrqv7n1HdDPgNGOGFnQ?=
 =?us-ascii?Q?opD+IzKdn8jVF552WIUIZgu1q2kNaW09Zg5jpzCYeBFHLtTggub2GVGq5Daa?=
 =?us-ascii?Q?Rr/NEusWjtX3JMlNA8W+DfaQz7oEQN+MpBz7YKdtYLMKZsyZ1gvqX1Y21zpn?=
 =?us-ascii?Q?1SaGsr5nisaokzM4tCBn4w9cnmfNpKcs5S92V9i3HstE3TG8nsqcBtMI42bH?=
 =?us-ascii?Q?V1+J3H3CGjE2ytXgFrbArZv+dBH1/xd3nc2om/F9PTk8GZ8Rd7Dkuldruq4s?=
 =?us-ascii?Q?nvXaLoRP4tpIXprv9V2eiTgZ8TYpVs/lPruIXzubVIQlMIKEF8iXgoa2ex5G?=
 =?us-ascii?Q?MYrC8i4MAT8hZs3hBFuKA5+DFLnq5XGui0THD5wtJ1MiOE+WSzatDM4RtX5g?=
 =?us-ascii?Q?hBEcJ+CTQpYMsFe8QP2RbqRbsOTvN2ievfXJBZz+J/5BZt3qfe5sTzWxCPp6?=
 =?us-ascii?Q?nljpIgQeMwKOIlAJ2Iy+AKna7wUqVvJlenaqkgAQYrZhIG0OahK/fQMhlMUo?=
 =?us-ascii?Q?e9rO6ECyDTwllM0W++LET0T5bh3pzK/ISNjUA7+j3YFR6t4KmrZyqA7ah7SC?=
 =?us-ascii?Q?VTRvwgrnY1aPAELKljNEZSB224HQLOgx4i+ojqkTvuv8j9WA2+rI9+cnVyBh?=
 =?us-ascii?Q?+vEP3iJv8DBppniQDQU8l0KpWZfRenZqE7sl98q6ZPY9EcZue+gsBvt/epYA?=
 =?us-ascii?Q?RtmskVX58ScunOB/zm6LWQEcAEe00jtKca6KO1y9YUjTHqd522a+JsSeHJ0R?=
 =?us-ascii?Q?TEQKWCVKjvo5c3zxQxJq9lJnAymIJ9rp7euM2z6e5H1yK8VdkKh82CCY11za?=
 =?us-ascii?Q?+PJ4oR8jPv3jwc0FDWGPq22bTncpS9+xXfYXf26PorG/rgV4twO+9c/uVAXE?=
 =?us-ascii?Q?NVi21OrMSlAJfbezrM6V99PleK0Ogv68SNnx+YkrdIiSLiw9AeiedP1bd8df?=
 =?us-ascii?Q?pX6qeD5bV3AK38CflgEWP2uo+ZPd1GeJ4Q0+rVomsERqaDrgkXrKEMuS1pEy?=
 =?us-ascii?Q?qxsod3AwFATa+SC6xt9KeHtoANpuiJPOYhZBxoufm8enRM2JtxCZHaEEcwE2?=
 =?us-ascii?Q?pogA+8V/hEKPzdHfqRSVxobOeN4Zcjk0xGCkZXJVBOPr74Zwz3w7ppRK4U+I?=
 =?us-ascii?Q?7OS5gEidxlb+jQwMCXiCCO8i0mNiTvW+saZdG1TuHhe4lcFuY8uAbMVb6JCC?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7406d9ad-9b19-4c46-a28f-08db0b7c212f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 15:33:16.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijLfyaHTeh6yvZaLce0APeY9QtDWEYNr1cy3z3KhQG4fELSAEo7E8xxQ3cvNkzDSGlxgmHUY6BkB7RThhf3btw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
X-Proofpoint-GUID: saUUxeeLB2O0N-peeQbgYWwjkiuP1Fnb
X-Proofpoint-ORIG-GUID: saUUxeeLB2O0N-peeQbgYWwjkiuP1Fnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 mlxlogscore=710 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 15:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176995

The original patch was actually allowing .debug modules
though which was in-correct. This change blocks the
parsing of .debug modules (which is correct). As noted in
[YOCTO #15022] this should address the empty modules.dep
when using the BusyBox depmod.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../busybox/busybox/0001-depmod-Ignore-.debug-directories.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
index 354f83a4a5f..d76118f85b2 100644
--- a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
+++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
@@ -21,7 +21,7 @@ index bb42bbe..aa5a2de 100644
  	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
  	size_t len = (64*1024*1024 - 4096);
  
-+	if (strstr(fname, ".debug") == NULL)
++	if (strstr(fname, ".debug") != NULL)
 +		return TRUE;
 +
  	if (strrstr(fname, ".ko") == NULL)
-- 
2.39.0


