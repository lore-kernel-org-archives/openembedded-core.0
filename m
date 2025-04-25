Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0ADC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:38:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1875.1745566700629262582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210502670=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7TFpH030448
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:38:20 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd3ed6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFmphqGvqITzQn3OzrGPv19Y+LEqg4lCQEx1yRXdBrqX/nBp+Cy3t9WYKvzMJINU/Qbxkw+1QvePNEqjV1U3+RrCKEKBSsQFwfh6aykQJNIQu5+PCoxaED+/FVkijG/18GV921IfBJ4jlwn0H8HABFyTDKVeEkU3yxogFripykoLb05yiJjZuwEWSWrViCJtH3qVAQjUorO3Xp9JjtGuK6enxlvvdbO/0H1yKNE8ybPK3ny5SmUoz0tNQAu3Xa05P/lLFrWm1hJgNi2yBGxv2xd5TQ+vigV3Wve/SN8SYJ8Xyjr2VEaBCRyW/ZsaIfNIsL/UY+3itNwiV5Nn0W9cBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9w2Dw/fg3c3GNWYBW1NNTd6oOUUco96ohAfy/nScJo=;
 b=JSqwFF9Jcx/SYCJIdBbOGCqfjv02zEoEqAj2bNIDTqPA4AKAszE0A+LqzMl7O3g+twOyM1UM+9iMjVKKth0CjJvsM2itbMMJew8WPSvot3iO3Xikzj5OYBp6AxERp3JWQXM4zqalCjygY6V+SmymwPI1gsIveSL3e2uCyV0NQM1VoDhVtigBdmZu5Nu3bmwbjb3C+E4wfFIW8xVsulS/R5LCylUYhabxtPzqSZWNwIfy+PYrhT1pf/93CMp7uW6QlNbqj3VBFQq9+J3Y/U2fzP3qsAADCKpxve5m2GNiJBwuB4SfHi192Al4PAXz9C7xvvllQRRnKodzTKQvEZ/few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Fri, 25 Apr 2025 07:38:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 07:38:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v3] sassc: fix runtime version
Date: Fri, 25 Apr 2025 15:37:57 +0800
Message-Id: <20250425073757.498411-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425073757.498411-1-yi.zhao@windriver.com>
References: <20250425073757.498411-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0014.jpnprd01.prod.outlook.com (2603:1096:405::26)
 To IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: badc3c8b-5803-45a6-d4f8-08dd83cc249f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SzGTnpxHQtOr308TEwCmL61gDOEu+VXaPVq4ibDes58ewJlmceCR+MCyvZEw?=
 =?us-ascii?Q?EGD9FRMQqRylo+anytsNn/THO8lO/a+C4R+2aOErVNspBqoGiVn78MVyGz5q?=
 =?us-ascii?Q?KL4tWaJDm6smIz3V9qYGAQDd65oMCSZe4vLUGsndZ0gMNyu/HZL0Dxv1X/7+?=
 =?us-ascii?Q?XxoRV/h9C81bN2cDFFbt8E/gqmwuBsdBhfXamJjUtvL9dgh42sw3VyFbUHVK?=
 =?us-ascii?Q?gk499mBv/JkrLiOuc2LbeiEV9MfPnMX1gr2LBEnc1W2wSbVhMPJEwW9u5AP8?=
 =?us-ascii?Q?TIJGYL2a6ABlx7SGqhU19oEg+Sp5rrvZmgnOMaDrsmZm6FQutVBWcT3NyBfH?=
 =?us-ascii?Q?QNvb7TseG5hTuVxO7cIoG5RzbAThQwbzqjrnX2ABWEDE0R1mtevQ8LJ+2SeY?=
 =?us-ascii?Q?NFZHrSZ/uOGLc28Anzcq22yObHp3Uj9EP9RSh/stNiId353/63Nv2lTxfCL0?=
 =?us-ascii?Q?XTNUeCVhQ8rI50W3cuTwl8JPFdKpyDGxfeXKyjK9RLgYiQIxKJMnBCewHoxV?=
 =?us-ascii?Q?1TfYJrdgw+1ib8JU/sWC7ZdQUtJ7DH53m3sTKAXoNPNWVjW7lvJfC99+HGgV?=
 =?us-ascii?Q?ovE8igoV2cXPj5ldZa3xNt3V5auoEESyxWj6KGiCJgcqxramdJl8G0SKVIKz?=
 =?us-ascii?Q?8WZjtizr1UhI55lpEEugrM6TS+hhysEq6drOTaAEj4gZ9LWnzmJ/auvwllNs?=
 =?us-ascii?Q?x6zb8w+GN2E2g8P/TkBNUQqLuLH5jcp6713ltYD9MfUYrPy3UgDzoc2MLgFr?=
 =?us-ascii?Q?v1hWTYqxYwExJs11pZPBMx2tUmoEZvbBYXZktpLyeGCccoeUyI9xdK5Pjjpm?=
 =?us-ascii?Q?+DhgCj3iCbYpY0htWp1YUlpnQxarITQ2i2jq2zf6xnlL2gIPQCYVJhwsR6+c?=
 =?us-ascii?Q?OKdP72sd6BtWG60C84zeiFWEjqYUcx4QI4sYGlBpVskqUJuOb4BsFE9VhBbf?=
 =?us-ascii?Q?sF9kW6kJBjyvRB3yqxvH/5sMnSihVFmZXbSKcyWwkqEUjUENcJp8nyyZPSUB?=
 =?us-ascii?Q?F32X/RSkY45GTwX3JbRkZY2quYNCjo0O5n+6FVx9iTQoChKwY9UF+VGvU9H5?=
 =?us-ascii?Q?L9oi65Mc/xjo3qcEbBgwnjNHXsx3V0aCzKOM3RfsnNUB4FC4gcIKlJlwuoTb?=
 =?us-ascii?Q?nnJ1peN9IgX6DDYttP+6rlT7JlhcfnOJ6CAU78XbD+fUln8B7f0PHB6SSMke?=
 =?us-ascii?Q?yPIsJr0ZFXl0Ie6Uv8qYzPC6SKZ357iVTDP2RopjXC9ohTbYyQLCWuYnViea?=
 =?us-ascii?Q?WAZ6+bL9rEb8B1GUHIAJfvrzp76PPV020aX7bmF6XmSdDvmU1ubUsZGpmSlp?=
 =?us-ascii?Q?mf/oBZFRe8+0eNODnZnG+fHQWURPg19/Fh0ZFkaJ+WwtBCEwGFtaz0od8umS?=
 =?us-ascii?Q?3RagFa1JPvMvWVVoifYgOn0czx27kZ4sbALmvmEzcAtPh67kjYrTjlsQlIfo?=
 =?us-ascii?Q?91L39BvxFvifThDpEe/cRc5DBNMts/ZwxxHy1amO3xglhOXU1For9Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2FGHjDsmGbmQO1UfzeDpmboCzKHNDmjSsGYy9NYmhjqq42+4rKaqhzaOf+6C?=
 =?us-ascii?Q?34b/ujiFRlTdCFuPHhat/kN03RW48VmvSPsMD+9BA3dm4tqp3WRyLFbMlZII?=
 =?us-ascii?Q?jky/VXUlILHLbxeYdssYVBgDCEsriAtFmJff7zFmA4YPXEmncfC4G1yX+Zk4?=
 =?us-ascii?Q?x8niqfJSqkJFpUAmMgGgfmG8kv2jct4AvweJ+auVMS+x/q4kPM39bsFU3ZO4?=
 =?us-ascii?Q?mUWTvdVf/K7oAYh8pqnoK9t6Y+9HRXQhR3KzJmIqaT+i+Qdna8Y54m92l1PJ?=
 =?us-ascii?Q?FOQUhABuI+03iYBmm63rXP7kNYj6ABxl9Z49Y2paU8ttLpRH+1xB1ApNeKvi?=
 =?us-ascii?Q?cNDHojeMk3U4WQ11G6hYaJEWXJeQ1dC24Gzjv72mk4Ue8Xq+oSwNNEdZb2An?=
 =?us-ascii?Q?5aB0H83lm1jij+thTZl2uiBPMKi25E4rbxWbA/KFgsx3QbDqQOhb/IgC1hPZ?=
 =?us-ascii?Q?0jQitQInIXgyM5l8IUIt31S6wNAMz0G0vHLBjmHgdvq6T/ooYPcjpVdcm0pw?=
 =?us-ascii?Q?xedTJvcKBpZBGXYsD6LCFd2AWtcVqkpIL/NeG7b7ZQxCbw8EzNJCJkSk/ULe?=
 =?us-ascii?Q?s0DqZ78HvCEMmR976bQqKi2ibGZn1AFFg5xJCQhfu3tmQ5tRB4RcjPxd6pcX?=
 =?us-ascii?Q?s9Hk1CyEGlulbisZK5Cqq3iI40CulkYqX7JXi+M6zhd2ZYv9AgMVj1jiYvTZ?=
 =?us-ascii?Q?23vLEITpLffTgoxNV7v0IYCQuwZ5Wdod6uZlp+akblSRbRBg2LI+9YV3RLCg?=
 =?us-ascii?Q?eQDLN9lnv/Nx0eG5Jf9xKXHfgh0WAy57Xlxq6CI3qT4GRKjSMRUk7Sr7qrz3?=
 =?us-ascii?Q?F4ih3ww2Mr7o+oUK4q6VVfZ/qAhKovSJV0dpvyQtYLaZzDvqmESysWxVf5WT?=
 =?us-ascii?Q?/nFdvLym+wFM7IPG+BR/cM8vxHF6vGAqTfq7MUB7mPS9oX5Dv7rQs9tgniUU?=
 =?us-ascii?Q?+GpI3uSE/l6SuKZ+JXUvkOwwcWeJMQTyqS7YNCFJ2CQjleSFCoAhLybNVsJu?=
 =?us-ascii?Q?JIdVtzH73fThtEFna3oQAfrz264UtmzJ7q70TJGAYFc0O6i5wQIOCpxeXSVz?=
 =?us-ascii?Q?dn8Q01bHBaIRU67El3a26bcQgct/ENl3V0MmhfaxVx36il2Pvyo/nEv9dVUG?=
 =?us-ascii?Q?rhX7KuusXG10i5i1ogMDBReJC5TyypO0vyEzQzF+iW5y0qEgXXyfRTk9Hv7R?=
 =?us-ascii?Q?YL1OACnrIhiyISnEPo5qEMWN1P5AaPlBmP9bhvibyRLcU9oDsfrkZz3nnhzh?=
 =?us-ascii?Q?qERnZEHCJ1j2V8GjsG2AC8Q4LkzY0F4Bgh81YtAD9mJZcCO4LPrAbFuAZ+FD?=
 =?us-ascii?Q?B57XX+wAVPH0BPAYYdQIGYCaexjEuAKi736Gd0IObzWnAl0F4X+4ndPYMCT6?=
 =?us-ascii?Q?awT8dqT15Angi2L8Eb/vQXI37oW+ESDIomzYl1AcWLjono1ndgh2Ht8wR43N?=
 =?us-ascii?Q?AF4BDlY8fxr5tnf1QHFVByteAGKRHYCu+f9U6M/8HcW3/Lwpsl145K4Q5d2r?=
 =?us-ascii?Q?QMVYfGMtJTSQCItWdf08shUwdaeQWlOlFyn8I47ZnprgbVmPeyhpRuNSZGaT?=
 =?us-ascii?Q?HOQfy0hplZJ0YESiDEKHjiJ3v7COhjb7d5jWbMwu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: badc3c8b-5803-45a6-d4f8-08dd83cc249f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 07:38:17.3186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWmTmN4vuXlp7e9V5/oOuz1QTSwp1mr3h33GBvS8pSF1Aggc+0SNfylaNCzQwA5hWCBnNUuIf8V9dcZX9LT/Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680b3beb cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=yiAupTA_kx3k_-Ck1uwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1ir2e78WlWFRjgtX_5jsIF8WDNKN5RNt
X-Proofpoint-GUID: 1ir2e78WlWFRjgtX_5jsIF8WDNKN5RNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1NSBTYWx0ZWRfX7yOt0I4BDOyO XCtOtac7tgDe7sxoJZkWna0fLPci1oWpPKbeOReRQ4yA1qatoGW4svHPRZUl4MVOuzEwGPJqs3F vFmVAwYn555Fv4i+ofrmiA7poBj5g3eTvmoijtlAGG1PETP+N3ypMmRC+mbsz5cnMa8GkZ5v7gs
 qlwGGzGCWDOjpYZKV7njN/hmll66qmjWjVTPug/MjbrjGw4SN4bdIsHShmFMpWAMCqDEbGZTxbn Agf4T0XuYWjKEIFZFbMSbrxNlAyEKxNRmAg1E+CyBnglcVQ8NOO9Owxz46XP6546Y1G3X/Djuze 3Z6isgsGw/qgcdfEfQf5IKO7JNNyVmB4L6k4VoXWql5TqOM0ZcFt9So55ZraewRQiRZrMI7YXob
 72f3b3Vf62KLbILAASUi1xpgnmAzpRoFEhD+i2NGVk4lCQEHMOkJ9w//lX9pUwIEqP2/iGNW
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215435

The sassc_version.h should be generated from sassc_version.h.in. But
there is already a sassc_version.h file in source directory. When ${S}
!= ${B}, the sassc_version.h is generated in build directory, and the
original sassc_version.h in source directory is not overwritten.
However, the latter is used during the build, resulting in a missing
runtime version. Remove sassc_version.h from source directory to ensure
that the one in build directory is used during the build.

Before the fix:
$ sassc --version
sassc: [NA]
libsass: [NA]
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc  --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...assc_version.h-from-source-directory.patch | 61 +++++++++++++++++++
 meta/recipes-support/sass/sassc_git.bb        |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch

diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
new file mode 100644
index 0000000000..c6717995c5
--- /dev/null
+++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
@@ -0,0 +1,61 @@
+From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 24 Apr 2025 21:28:55 +0800
+Subject: [PATCH] Remove sassc_version.h from source directory
+
+The sassc_version.h should be generated from sassc_version.h.in. If the
+build directory is out of the source directory, the sassc_version.h is
+generated in build directory and the original sassc_version.h in source
+directory is not overwritten. However, the latter is used during the
+build, resulting in a missing runtime version:
+
+$ sassc --version
+sassc: [NA]
+libsass: [NA]
+sass2scss: 1.1.1
+sass: 3.5
+
+Remove sassc_version.h from source directory to ensure that the
+sassc_version.h in build directory is used during the build.
+
+Also remove '--dirty' option from 'git describe' command line in
+version.sh to get rid of '-dirty' suffix from version number that
+was introduced with this change.
+
+Upstream-Status: Submitted [https://github.com/sass/sassc/pull/283]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ sassc_version.h | 8 --------
+ version.sh      | 2 +-
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+ delete mode 100644 sassc_version.h
+
+diff --git a/sassc_version.h b/sassc_version.h
+deleted file mode 100644
+index 3ca12e3..0000000
+--- a/sassc_version.h
++++ /dev/null
+@@ -1,8 +0,0 @@
+-#ifndef SASSC_VERSION_H
+-#define SASSC_VERSION_H
+-
+-#ifndef SASSC_VERSION
+-#define SASSC_VERSION "[NA]"
+-#endif
+-
+-#endif
+diff --git a/version.sh b/version.sh
+index d56af99..cf97d82 100755
+--- a/version.sh
++++ b/version.sh
+@@ -1,5 +1,5 @@
+ if test "x$SASSC_VERSION" = "x"; then
+-  SASSC_VERSION=`git describe --abbrev=4 --dirty --always --tags 2>/dev/null`
++  SASSC_VERSION=`git describe --abbrev=4 --always --tags 2>/dev/null`
+ fi
+ if test "x$SASSC_VERSION" = "x"; then
+   SASSC_VERSION=`cat VERSION 2>/dev/null`
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-support/sass/sassc_git.bb
index b7f57ca244..64e92f48cf 100644
--- a/meta/recipes-support/sass/sassc_git.bb
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -7,7 +7,9 @@ DEPENDS = "libsass"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https \
+           file://0001-Remove-sassc_version.h-from-source-directory.patch"
+
 SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
-- 
2.34.1


