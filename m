Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972A8C8303F
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18040.1751441358435794638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625QxPF028073
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:18 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTTwUc/OyafkG23dbWcdlmQhpO+A0zc9Z/rxIBqx3o81Aw1wmo7eYir4h474m9dG5HyT59zrDjfe57jkzR/So7Crjv7FyQXsbrZu++MUZJCmLKkK2QVjVZnLNagQXugwZtcpDGT26Jktgs7sWf8U1wyqCtdGOSRPfVsxpNrToOe07PrAOiFk8N1UpTWMygJg+b7odWQklPfN5yOa88nR8IQ+iQLvsEYtO2N3AA7lBGMN0/2RB1ZgMb4Mz98abA8/4z77Ebf8+O5yloAnZj9zKENhnPC4K5/Dn/XBNQzk/og6bNWYtTKM3Cd83gB+EV3H5kXQFr5VQSf9aIq4ToVfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOA35UrtETMwMkdoc0kJLH/4yn3begSIudYuMoPJPeQ=;
 b=SqHbBxFx7jDpFX2jH83MBO9Qv8+cBd1tFHSECyrjIV6jAINhD3HQnyzEE29ugklX+u/GJz/pnkUV65BLdJvT3oJnTbgucxRRY6aiGWmS1hJOQqe/stsujd8gSP7gmtEfmMzadxqOWeQEGJxYrRqrkGM+vIjfFkNtTN1C6vrFeAV4K693/vINVF1hC5cdqa8T740wkB6ZDv/PCINasGcV/AifdGc/pKcEB7aWyIuuLVNqkGApAXqw2K4BCMemrjTybudwFBeXyLg6l1p+snp+YconeoYGxztF5y9d6nX1KXnDF/9Ab6/zPPo+GEudNWmNjfd5mN1PUQ9GgP7TPIYv5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] pinentry: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:54 +0800
Message-Id: <20250702072857.1267224-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: ccca1b26-22f3-41ac-21e5-08ddb93a267c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fN2mwDXcDV7TY41sDwufT0OqI9Fi8Ytd5J/fG/gUquhy5iFfWeNDs/1YRV+O?=
 =?us-ascii?Q?7VzwiP7qENHSOcSDpWSJQGzdzhOYW5uCvIJHLXz1enVQes6PE/O18leXIVbJ?=
 =?us-ascii?Q?jtoJYq2O3Ii0z+KxKRXSyzuvO4aCkQOzIDgOyERzaEeDSlgarUxemeuV0S0P?=
 =?us-ascii?Q?pMkXYiUJHGZuGo66jRQEsbdlTCNJP8FTK6gAVWwHp4OTaoM6qNQFpydnuWR5?=
 =?us-ascii?Q?762q1GD05M60mxPKKHtXdb35XUJIvh7Ot5w612bxptRemu+9/0VA8CQpjdCD?=
 =?us-ascii?Q?YnrNDoP5hPfPlxNbypYBP8jBukZUz1An0J1+URQsVMWq0adM2lvmTKhVcJ64?=
 =?us-ascii?Q?kUdJUCoCSfKa6X6Jgglsyk0l+M9YGkM8i8pgB9KbUt7Tv9/r91cED4aeR03J?=
 =?us-ascii?Q?WaeopFJMBVkoLfnZhsAOVhe5pSahhP2TCcr8XtnXG3T7Q/B2VLtV+vj8r23R?=
 =?us-ascii?Q?F3OWRdsdzBMA3rDqh98KZRRk63mZklFJXl1it2IlrCabRlwj2KgmfxJymp3X?=
 =?us-ascii?Q?4yJ5cSr74YQi5BQRo8V6o4seZ8+j0q1Wy/2AYOytE+IlEy8TBdcXeK6dmPNz?=
 =?us-ascii?Q?y1w35kZEt+xMPdHf51Ui+BPFgr2I++GzRs0ZSQTdIIICcupNSAvJWwIV+Wy3?=
 =?us-ascii?Q?yBPyU0SIXsbESxrnCCAjgbWOMB6FrjPlbSlWucYqXGvx7J6YoeCnWlNB42ed?=
 =?us-ascii?Q?F8OmAxEfd6/Um1Yj99qeDcqtL1qNFeW+peKAYPOgsny+8cf4C/HN1cbqtSfZ?=
 =?us-ascii?Q?E01o0gDBf4f7RgLxNcNQqvJEgRNpDJ4rgjdHS5zlsqxU3JCqXUphJOLtGgx9?=
 =?us-ascii?Q?XS7Q0jmtmxSG1YSYG1Rwcrs1TzgR8/hRvN44VFegulJqSlf4KB23VgWQNgzc?=
 =?us-ascii?Q?+75C1QXwYH5xZVn1VOhZVsjjOORYDW7fC0XKmboO75ecArhInaTFRA7XOvVg?=
 =?us-ascii?Q?tQLAPIPX4J7Lwt565GcQEGirrsiLoDD1LYO8upliJZpKvVjqElvSKn5AsuqF?=
 =?us-ascii?Q?gwUROKbjmDb2pBtSDpJDqAYlriekWTRIDr0lZGz3RryXc4lH6XfERSVHSDSp?=
 =?us-ascii?Q?fN2gaczGhWE6JDhQ9wE9kFd4vBMQSeHJJH2UC4OR5xkwne3z2hU5wTUQrkh/?=
 =?us-ascii?Q?t2vSSfMPQDPB8TkRW+EMl+2FWxukvBPp8DwMMKU2sAuswxjqwuS4fIK4JtoS?=
 =?us-ascii?Q?E2smsaADiu5bGOb85bDMBuZ7MvoUQyUNfCeAFTTMM3OTih80PlFEhSasQsV1?=
 =?us-ascii?Q?2SoLJhcqSRiECN4vfhxKZKPMvrx5hK1A549hvhwrqc9/ATjRlusVh+U6jU8b?=
 =?us-ascii?Q?4yUukhPHjn/3bwqELL5vZssirX/nBro5Hw+4m1f9Pwi5kSWZ9G+VxuAHINzO?=
 =?us-ascii?Q?7mAnP9785rtXTyh82p6z1OfK8uwhMpiyUzQB41NiuB6DDlmbC9R8V4NT6ZZW?=
 =?us-ascii?Q?yFI4HtDnVAqbl+CY9oo1m6dKdkZeSZLslHUUFgzQXtjIezeBdCkS/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HIuwcBqzOHsTZgz70EklE9umFm8MQxhj5RxKF9fd4M5iSkSY4doMBfPoG40W?=
 =?us-ascii?Q?Cif3528l2mgvYjatClxC85uy7i927pcgkndrRWKwJSQeYnQemqvZQUN927nH?=
 =?us-ascii?Q?mOVEqmMuWcCBI7KDRpk2JhLCAihjW2mpQJyWtNgOwEiqkjcBTcghqDEdTOH+?=
 =?us-ascii?Q?nrnmoXd4dhie11BXKCvKm8B7/ozfMBL2uMMC1QBKiERcx9r/4BVYUV1g7IOp?=
 =?us-ascii?Q?vyLCbzmmOurB5wg6Yt21xKy9ARNOCfUspik7GrZoTq06Dp6q56V0jB0Hl8/E?=
 =?us-ascii?Q?wss4Puft155q74QIFJmA69YNMp8s0CNn2ldsg962jQYcJ4VCfTttUZ8+v/b8?=
 =?us-ascii?Q?G+TTKLnjwq7FcQTQ+RZxt/2/flQqk2rSbY0TMyAZjGoegAUdMQIiuUfU9jTr?=
 =?us-ascii?Q?5zy4giGAoR+MOmTAXoUAP24LLxXeahdxl0vq4opImuTCEagflCdILnvUaDfX?=
 =?us-ascii?Q?XTVo81Oq4Y5VYJyGUsmfcT5qKNYh+i66A3RkypY2BxIby6ecDw64GpR2ZSqX?=
 =?us-ascii?Q?N3rHtNUFI7fwVuR4FwYTbYFSW/TE3PhTE0OQJx5NekKQ9hyFqdDynOv/32sY?=
 =?us-ascii?Q?1/w8JvfmFTAokAV04F6CtQKnoozv9zJpv4HaSP+oQjeRJjJFj9NZHLohcKeL?=
 =?us-ascii?Q?lg0SDWl2Iyy8Fb96SxGfuy9isoov/lxuTf58lsWP/pd6qM9sOoq6wSvUHWgN?=
 =?us-ascii?Q?sPF6HGM4RAEnV22O4DFEPJcPvurPxQX4LORgRN/n9qokizR/i01PEVGu4TVD?=
 =?us-ascii?Q?LDYCMcZzEgYv7WocBRBnJ6q/FlJ0pjQOSP3uRheNgT85SyUVX7C7NLlN1hzP?=
 =?us-ascii?Q?jHreYfP/Va05qQWJgoRmFKp82AGNPZQKzmH3oSTB9jornjSMlgLL+tSOCtUu?=
 =?us-ascii?Q?YL/sfTllJY1rEE/fv2u34tvjR2a9bN4kHq8Kfl0/9Ppaw9BeBJsDpYfXpLul?=
 =?us-ascii?Q?f6NfztTvUEMoeEFLa4fIP9GivjGuZef78XW29ZRlLvV8zOmaEPmTgPQFz0CN?=
 =?us-ascii?Q?L2pL6Uy5AEv4/aAkzUbaMIvC4o77RVitc4QmVRiATpyRKqGnXEHTrZi4yXPx?=
 =?us-ascii?Q?gUw7WQQIZYEGZasD4DowKg9uLg2UPBTHEtr0dYZJlXeeXrXCcy/lJuDOb0yb?=
 =?us-ascii?Q?41R2fxc/LuAWVa/eNrRVZc2sS3oW7VNlUVVX3zErtkXeNSCVgy21TkTnw4MK?=
 =?us-ascii?Q?pkLzVfgDTYa9Ye6OVDOWXC15Pb3A4+DsRDLoUY4e0TfpJlkj7Ahz2iwQ8HCP?=
 =?us-ascii?Q?8rQbOl1Ys7McyZw+rCBq/2syNhAfdfXP15B5SkWfklgqEUNGnk8tlpGJDnSH?=
 =?us-ascii?Q?IQa/nKU/caTGBcBAQaZ+SUrs4DDrZK76ie8lXMug/8hkiB4oP+JMooWOH8kV?=
 =?us-ascii?Q?kO7siJeUiY7Kn2Bgi08v6A5lF+V//L3w85A+uNEOrdycJoORP16b5MGxFutd?=
 =?us-ascii?Q?PanElqj2e7XQoQ2kCi+PiyYkpNfacoldI8kcbvUYS20rmFzJ+/UbiGKJtHZR?=
 =?us-ascii?Q?DaEleqFolnVNdkcaGsP8QAvp6MeC0ODGA6ecjRTo4q4IssrOJri1moW9mkbD?=
 =?us-ascii?Q?WvWjDNxVWwbALAXClNpm9SrOG7T5rRl/3ZgquKQB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccca1b26-22f3-41ac-21e5-08ddb93a267c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:16.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2P5hast3QFzkfWYtD6F2nfB/pn/ScgjpzS1Aav7eCiwKo3Dbvhg8NMlqHGWpKUAR2Y+nshzQRpsNHlUyVHe0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfce cx=c_pps a=bXIISpLe4O+zW6xWAQB2QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=4L3uzlaPeZM0gTRjUikA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CEWNoD_IKLpStujp-WCMCdiQgfKHmmJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX+yEyu51uDWbb pId1r3DRODFX/HkJA22RP77h4Ro1da6M52LqbAo3HTuHtDsMVv5zcnrqpmElFycmy36/QsqhoxH DzAilJafSoATRMRI7ucEZzmMdHGsvBB/1rf3myZcH7hecKmnE8+10R9rwtzVAa1rvi2Ln4Wi3fS
 VKf7WTnJWhM9HIwH4zbj7UaIX8V/9FoFj+ey1HVgBAmoDqlwbvS3PNCu4ZGEwapV4wSM5cGIyug P9n2twSjSbKnMla/stK/c+oVnv03tlUJ1edtIQlHyGFiMeIggCiOIxTqx7WgFSgI89jnkr21dlW 7iJQnTMnKHhPH+EcONiov7xP+JO/0e1I75mTSip3q4c3Oxw5uMcjmJNax4gZXhMl0QGAHtALTP8
 ri9z9HlQqrEt9JmmUZYAGfVk0ZPquvEckjkA99SV40GsEH52U3Wezy4RxiM0isGLwsTKhX/e
X-Proofpoint-ORIG-GUID: CEWNoD_IKLpStujp-WCMCdiQgfKHmmJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=728
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219796

Include drop-unknown-suffix.inc to remove unknown suffix in runtime
version.

Befor the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1-unknown

After the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/pinentry/pinentry_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
index 14b368177c..0fc652cdba 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
@@ -20,6 +20,8 @@ SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902b
 
 inherit autotools pkgconfig
 
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
 PACKAGECONFIG ??= "ncurses"
 
 PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
-- 
2.34.1


