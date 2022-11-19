Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A5C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:55:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15915.1668844496914267837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=832241a076=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AJ7pn8C004313
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 07:54:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj0588-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 07:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koieSg+yTSXUzcV2bPzj3LFomjo5/jLve6EprNGb7lF6N6SAcYfN+pzNyeB8oRripwHpGFTlIiXvHjdM5LDosNTgqKrSpmCJO1nWqZdFWEk4r3fiCct9zi2EG6c8j135QXUMDuY5pwzXhgK6Ze3dm/THUrj70L82T2IGb5We9r8Cs4eg21fkxnUbvgHvUCWKnoRrdhDSnVSJJzbKZq96J+4Xm1nrCVGmpx+tnFbicjR9BevbokN23L7Qx1ephTO5FX7l8B5hrRn9eVp4EMqv2qfq/UI7h0AX163e9nCfsLO89PFHF/eVrpQqBB4w0c4zuJbEnH7D+FlclV4krMhFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6IfU+lxPssaaq2cDd7kJ8YFCC2OKohjWbTIUeX2rL4=;
 b=mtJe7zN0az3g6JgOox/RPiViVazb1cQ9QOmxU0NCppwKqoydi1YEellO7/rJQnlnc+AF6WucpP+r/DoIxFFDeCs8fJ2VvepQvQWskfIXQb/RO41VkCztG62gMHZLNXxt1Uc6nxoahKZTAQuHyhACW167VAHwNpYbq8DcxhAi6wxS0Y9U2jX+yTFY+6+JReC30MFCR3jd3KI0Y0HKOC88cadYmQit+KKKFtwbwWgnx5aaMM/GAtv3RZfz0w3LnV9Dea11gcCOGJGqPYm+aHCR/Xrcc3rz/M4FHhOL8juAusZPHIoUAOobunbL7R2CLbjYNjlCiNIsq6PabFmoB03rYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Sat, 19 Nov
 2022 07:54:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 07:54:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][langdale][PATCH] sysstat: upgrade to 12.6.1
Date: Sat, 19 Nov 2022 15:54:23 +0800
Message-Id: <20221119075423.74098-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d663d4-f6fa-4bd9-83cd-08daca03581d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0qQzzK+kjgQu0Yum3QvQjvMbR2rvuHM8BY2AJX94PW9dcYlb9s7b3RXaMgZiDas9Llp3hP+iLE2FqBFMrBUV+4lHMv2QW6xgnjlg8HqYA1yhkWFPeAavGboHf5cHIr/1u47UcvdP09/40Hi+JmUi3q4SQaO3MsUEcH4Cg2RIQ7E305Llenq8mjOEyz6IqrhoSMe8q4zKShIPXQ6RCkI3ApaUpURksF3c6PNTKhsSR+BpNf5IdEc8aOF37TVWtmQ/6vCc5xr8ZU/1Fiwa7GUnZEcMZtfgzqbwdg4t71AYHztehFpM09SdpCLbeO5X00Wzqdjm1lDBvjbBTGt4qE+PabnqChccEgzJ1viZO7q/WVZmGW2genYocGWVQ6j/heANDIj7K2SCKivU2jQqp3hcRhhDXENMuDrswfiotda40TJok7zxBUrG6g3XpfHhzZGAOV2fOudpecI/1IJ9xgBFC2VPlRTvCdME2zOCAANI7d2trGcNzlaJAdm7Ij4Hs15/ppUPlKphZQJ3hepP5w2hdJArCnrTJJ0DAkZ1g6+mSGw5s2vhSEKcLwbx9KiPzdkFm1bmaIU1LsqcGNLD5rWQ4czdGF7MlBuXPT9vnkUNl39F4RI7VnMNvbif4FwBrWfu8wVBmCJsizlP+9/DZnWm7zgqHw/0iJBLH9z/eKzeG548EhMxZXU/f3udzcrU77nw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(451199015)(83380400001)(83170400001)(66946007)(38350700002)(8936002)(2906002)(44832011)(6916009)(26005)(66556008)(66476007)(38100700002)(6666004)(6506007)(52116002)(6512007)(2616005)(186003)(41300700001)(5660300002)(478600001)(316002)(6486002)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sgy2IHOUcbIKcmOqCJ7tYd8ugL7WmclmF5sRIcQ0ZJ4mpQQnxmhGceYntvyv?=
 =?us-ascii?Q?P23fByJcjh31zglzG0pmfuSjK23gAy0SNb7FJ9uVZ+wYwNyBCbLd87J9U2Kr?=
 =?us-ascii?Q?k8Dah/0w8fjLCfKIHzHCwBe65eem4wMPDfVRSjzlmRdScSifoiyWlxwt2i6A?=
 =?us-ascii?Q?zObonZSU1e/YcNsWZXTjq6umhD5OYnFgtngaQLzQX9+unAFF+bfniDr4KYKh?=
 =?us-ascii?Q?i0f3p9oFYuPq9Itm4Dy+rXhjWiGUTVIXKfpG1WWTe+YSLxumk9+E/7FntLgu?=
 =?us-ascii?Q?cCL11+MndR2h1P8DU8XbGxm+ba4QWjWD5RivlAyUAaWKwQdgM3oPPW710Qjv?=
 =?us-ascii?Q?RE5V83A5oPbufIw1d+UlKlZheiCj9kEQxGId0gcWvBg6PzbFhd51aYI/VYc0?=
 =?us-ascii?Q?9X56AZlgEdnn5vFmAkX5t7YX70loyVzmqoNQTW2QYTgLpSIuL3zoL5fNSsXI?=
 =?us-ascii?Q?JvaeC/4/gEUTf9lCEb6xe6PZQea4Ajv1bjj+JRdGIaLMYKZkWnEu2P7UPMJ+?=
 =?us-ascii?Q?E+XOVBwdMpbGap5s6Fb08Yx/4ue+jI3IO8k/imjKbKvfWdzrfaxQR89k1gP+?=
 =?us-ascii?Q?XyK5wYFtuJF7Ji1L9ro4XtmuBInrowihMBnX96ZQaA+qWViNwyaSCtfYlV0y?=
 =?us-ascii?Q?XtyhvUZUni4LXq2i7dJlh3keu3BeEF9Ifaw1YAiDxZmCvVQvFWxfdujPOTq2?=
 =?us-ascii?Q?Mpes2y4D6okP7JEhiKT8apMSy1kWVAXW7pYMq36DjdE5I7ReNPcOLhZ5TZSj?=
 =?us-ascii?Q?7/XWtc8pk4bz57o8ucauIsv3udVjdLWygqSTWnim4EjEDyYJ9XdCjSLsLJRf?=
 =?us-ascii?Q?bc73lEDoJyXiPmkW54JfkdI/sB/dyZ2SEOyR+VMLBAq8WL2twbv29ohVGEKt?=
 =?us-ascii?Q?49Mt7bgowpLeN5AydqgVNlmxEuvDmHLflDw7aUGMNEG640iNDBv8HjfJJgWV?=
 =?us-ascii?Q?x4oEOZSMHDwb8CdVLEm0bXBedqPj+XJ25S0lI7evd3AAyDPFGktQ51EeUSHP?=
 =?us-ascii?Q?bXYdjxx4o3PvkgJPSv7ZapRNcpyczWpVWlUBwRocHX88SvIoMaB9ff6ihj69?=
 =?us-ascii?Q?GZhijgXSWTFRrrK5OKdmrV1nHGEs3crV5wzQPTdx7Gvq8q/yzbGQbMQoWyCd?=
 =?us-ascii?Q?BPZG57uh+PJSAJDoJ3VzG9uTvztoi7hwcN9f05fVe+72vL8TxxvLb3xfU47M?=
 =?us-ascii?Q?Amt9hM8N87JDz6+Q4YJGoNCJoCrbY2pMLQla3SWacbnbw1QRgvwx8YuRHGM9?=
 =?us-ascii?Q?TVEKe1Hr98L6TiUOjhmlUO1Kebtsxg17260hQWKksvwdppZjxGIZCA+zhq4d?=
 =?us-ascii?Q?ORXU7S1pxhEsdR7URKB6fAJ1dsDk7p8UgojPcjjLHnnFYCqjxXffNxKgimZB?=
 =?us-ascii?Q?Y9CXVQcy9wQclzei+a08fqNfGzfVXLrMcQg4DboBj+ZDGsIOZCCoaaeyzy6D?=
 =?us-ascii?Q?tOJYoglZyKBJG/E6MVdu/aTA7poye5lhPp1+GR2tXY97+NQcrJnkR0j6uxZk?=
 =?us-ascii?Q?BfehXhjVlYSypmMRFNO7QV7t3wQdtdnD2MBBKnWRYxBSiF1n7aS7VJZilTg9?=
 =?us-ascii?Q?a5Trt+Fhj6QdHDM0pct0xoTqXfz+BP1bOvDHw6y0ObXjErgtp2IKR7TmRr07?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d663d4-f6fa-4bd9-83cd-08daca03581d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 07:54:54.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRT9Fmj43XTphhessc/3Na4cJrWzL3VnURwsC2Wd5R5XzdXRtsBBZNuHWehWyTrksc10ANL+3wtGQoJLLTO7v+Lb8ldvoSI6CxeY87sxSXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
X-Proofpoint-GUID: Kq3XbRGUjwAc0OKShkQgMLxgsrrrRh-9
X-Proofpoint-ORIG-GUID: Kq3XbRGUjwAc0OKShkQgMLxgsrrrRh-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=813
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 07:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173511

This small version fixes several bugs, one of which has been the object of a security advisory (CVE-2022-39377).

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.6.0.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.1.bb
index 273c5c1815..6df7bdbb83 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "699fd948836d77f9ad0541fd5dcf75cd2505f9da4ec14df669286ad047c23d97"
+SRC_URI[sha256sum] = "18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342"
-- 
2.34.1


