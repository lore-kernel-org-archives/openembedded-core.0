Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDC2C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.736.1785369148178106722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d64ckHeZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TN0P3B2429668
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=; b=
	d64ckHeZuSDqP2yx9OgSyW1S5wUlhnBOQqSMAncvEMXF/10tgXZizUrtV0Zr4zpd
	7m5YRIc31ckjCygXQxlvngqoG+AGCIy/6pN3pQlWUS5HH0xYhCPxqE3G/OtQKzIN
	6ud2w6gQ/Yfzb9jM8/AIh2qgDMmiWs/hH31l9vF2Xnm29CdaxBM+P5cF19WqAQXK
	IHN30Wg7NR2Xp3aHvyfu8X/aa4yCNvKjnIqmgUFjy6pV5kNYZJPXmMpwodocmZv5
	YneaWt2CPoevjG4fvS+F8XMW9MXzco7zIkpSIBh2ViQkoQkbT/D5NFFF0td8LAO6
	fRohi9wjNy7vTo96ZA5NHQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqtbsr2br-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 23:52:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KblEYkHqD5a7KdtrFPz9qOGpQyoT++ks6mPDk/Qlm0BsnF+gFG0LPPDZNsfZttNg3HziqqSNz3BICNV/HWhAsPngX6hXaFpfkL3ZDPDMdjVfwAbwJ6ToijPrpgqv/c/daqqQOMj0nU2oEs9ZfCW0Eum9rUsTvrADlmAEb41Q1HEIkd8XhN3xQLeGrEP9OAFGjl2P1A9tulzQXUxYyaaHybgluFXBiVHgnS4io6a2zk0b/rU7NqaFMWvi7BQVAida9mQx9swGtI4YAE47VOx4tDWz7j7xzH2G+D/D3atdDxXTI6HH2eBuL4YNwaWiUNv9eplI0UoKzdDLg2/6VSc4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=;
 b=uWJTUQy4yKjUKue7g3PWM64MT6nYVzFk/2SW7wjV6tlPRMfjXZCVNN5E7M3nWvEIOFYboFbkWlYlQORNXiutIOvHQz66PwXLHtXfqLS4l8EiAZrcwe4AxSB36+XaZgfqO0bVVDVULqVWW2B/YSR6jMR2S/iIan1rlrmpzhUyXVmfJH05FC3CDlP02CHt5tZRzApzDmSdSCrxYVC6QY16LPENR9GSh0JGyFLwVLopJ5UK7TSRLKqkFOk03A86MFUlKmMKQP5q2QrnDmaMbXxKsoFV001E56LOuOnC+FWq7znATBop0ftO3gzGgyl66knzyk0JIzfXrlnW76/vXmKrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:52:02 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:52:02 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 9/9] rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires
Date: Wed, 29 Jul 2026 16:51:40 -0700
Message-ID: <20260729235141.1067679-10-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c5d3d1-d806-4018-4f26-08deedcc62f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|6133799003|5023799004|11063799006|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0xV32qJUEQU6nL0RdqzaeQdYaSEP0viyiPj9Iwd99VNUDVWf9XOLG/W9NLcTIub15G6emmg7H8uknhwPtdB6gp0CFpYy975K50ouFI+qVzHIfAPCDtHRTdCqp9ax3mWCjOAC/Rj8UGCq0xmK8vtQup21jhKi/vocwrCq/DuRJyYVu0vaipFAdzYYNR28i0QuWZL6Z0P3EW9Qyij54ugKKUqm9nPXZRutd+64YWI53U7qNwPqeb+FFnNzuCRpJOv6ixluI+SVw7RMt3p4AofnKs9RhxkQVYRbSrfBnVN33xByiuPpIX99k5JUjjNdtstvb7w4dplX0SjYwHvE8n4O0DCVBFG1SqawscXy62OwpHJ05LcjJo7EOhHEenw3mtknpTVJWS4D2DLxOj8PuJgX+wfaN4okmxl0dP9BY6NuVTMEMBqT/Sp4cQHgEfIMjPI1KtOSpwQ7JrX8bQDxoa6/GmJN7Ls3zgaeM1J8DLEFCGxvZg52nZMXv7VCIEGtJcHkBmrRq5h31z+hJBwNUqYClHPqfy5tHhPKmziEwrQsw7pxTUIgRCZJTGi7A456yGeuy75osCQDAb5e+0pw4Oi0H142p4uQ9gZMo3A6+f4Ja6CRuvxXjs0C3rY+AgKXEaMWpRuuMImF5whLpWBQnnaMzJbse3X8z8kTUyEc6SnYOSZdz0lEa5yTR4ceIPxOJS/CQxjklgAh0lqUcVZx6E/Lps6UN9+4o+3bDfPjgkOlvuw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6vJokwASzZq7hSfnSY39gyL6jwS8IPFwUiJcDNzRU+QhIGPTazOk2JrORNnZ?=
 =?us-ascii?Q?ARFQ6DeYv1p+trSrea6/pK2BA7b3lCKBhn2d+dEmmTqQCGev35HrxBnkW9xo?=
 =?us-ascii?Q?tIszvAIY9EwHNseiUJNQ6Jsx6QI1jFxdt3qK4swOdBcg+SRaMmJNKAz2WbLW?=
 =?us-ascii?Q?StA+e2Rh1fOc03XT4JdmXQL8qSXfx6VgsMlnl9IPff8YpfOUqnRRGkeZxyoH?=
 =?us-ascii?Q?IqFNQrSfYYB6JoZhjvHq0RjlUnSKG0tjU3wWdv2q+L7coZUgCqwYfUlKF8tK?=
 =?us-ascii?Q?v8YH5h5AQ6rsHZ7Akfaq4tbNviUT0iT1vYcVEUHjGH1cGjFdY4T2BRxBl1mT?=
 =?us-ascii?Q?p7CE13dn151fh4q072z0JJOuLtqJEoRbc8FDYSICy2rErWBn7SIqejXfb47k?=
 =?us-ascii?Q?rOwczdezEEmziotU+zM3fK7jLL5MQZKT+HBUjoF0LX0ED3cBRitqtP28qimN?=
 =?us-ascii?Q?nn9IePh6chu5bcvQyykQZv53Qqebj7IacS3nKe+3miI7ro16as6bPdXekcM0?=
 =?us-ascii?Q?/5aDjx4VRJewQBulLHXlD60xzvs4yHt2A+QDBS9kaSV3lVzeGycovzpvj2wt?=
 =?us-ascii?Q?lfzBaEglWyspyxzRw+s9h0L4qCMF8W7aIWrqP8KbsqWghznKFVYiCgBDfoZy?=
 =?us-ascii?Q?F/DTod+6nPpgcUiD8uUv7HYepcL7RLH142O1v6XMGZsxZBWy9GurGdMOfmmC?=
 =?us-ascii?Q?pTiJPtDO1D4aum6KXSLVu9wzwUmedNlBwuGUFFO2rxqbq1YvkLQ8rEy4sXxO?=
 =?us-ascii?Q?qzTgo8kHBsHB3iZZTtwVLsm1h1F9HfAy0Hsw0dGJ6h24jMRsz8oOQhUv63dj?=
 =?us-ascii?Q?E231ea5XseZPSezUfSmAZoWTixr4J/6wXNRedrrFB8Q0/9WhLxWQDZXncpZT?=
 =?us-ascii?Q?tXFgGn7C0Z8x+ckK9YI6kOwaHCfF8e0BK6srBTksCzB5vIGvUftT0fDgPBBj?=
 =?us-ascii?Q?73LwJEWacrwLVtp5rDzosXw723c5KqOwSjYur4Brn2JSuAUXod7NsMaiF330?=
 =?us-ascii?Q?DmTlAFLy2ESAviWmRk5jCrx8ZndKzsKoXR7cyMUkcnwHNBXlARKq8pGQcYBX?=
 =?us-ascii?Q?eHJw3ybJhxz+odpz6dywvy1aUuPkbQ1ENpCjbllhCsAug0uejC1DqRqG/D71?=
 =?us-ascii?Q?bkuLcf64UUkd5s78bUg+bqkCHF9l6TpLx36xZMwfNFN9U5B/T6exJ0h3W5VL?=
 =?us-ascii?Q?rE8f31SX9DS6r/ngljTSZLIWWLMoh+kyMYm/tHjtLzITAZABumg2RFGjQTBb?=
 =?us-ascii?Q?xa7yTBUZslutN9iZUKhOAtIKM/FjAqTUDSW+rAs+TtK3O91em9SCVXMMsJ0d?=
 =?us-ascii?Q?wJlGkslHvz6maAmX7lH8Hwkc5rg2vC54xfVKeFrPHyb/5p6eo69dNlsIQJrt?=
 =?us-ascii?Q?lJDp5/MnpQh4sSm6Gzrj0mIk4SYgQBeJbs0g3ju+xOUym3ZxdC0ltPQNnKRh?=
 =?us-ascii?Q?NIDf1w/iw1fibYYPrJ8wW+iziGoE0Tt6KTBq7VCaN4zalEvd+8MGPsRQZmFo?=
 =?us-ascii?Q?THMtx8Dr46vyM7vCH9EcA63gTtNQAIXAgCjcMU7JAR8XzBjcO10g4aku9whW?=
 =?us-ascii?Q?EaqdZ/xOScAJyDZiEeqAR7U0K6nfadRsxCqrP5HlM6dVZImLzyIUwIXQ8dZo?=
 =?us-ascii?Q?6jE0TVrk12dD3s8YUqp23Nr8sBcvcBdCcFN0XN3EOpdIemxaBSoy/5a5kqir?=
 =?us-ascii?Q?6sjfsnjASanxOtUJxdk0RC1uNWc8jA9LgErA8YGK2ec7TVTEEv6KQf6DDflz?=
 =?us-ascii?Q?Gw6Y8+dWUeg4yFBGXVbpFfWHOrPr4KI=3D?=
X-Exchange-RoutingPolicyChecked: 
	j4P2ZZeofefw2UK2JZ3VXvMk+z5MRmPbrXciSkodxkMl9OnTS0xato7+RuvQ6uR4Kmgmw8tD/nhoMjuZ72wdokAR/KAraFTY6OFTsujXewIhaol5p+ay5slYdTuMwu/8fSFZ3NhxjWFrKzC4/NaY5MwNyFimTcdrFR3/L6fwG21AtgK0XulTzlrtvWLreuwkWs/F2/4EAkJU7sh0gTrwTxRzyW7lIyFtmfjHyMI2nIptXx1ALMGD3RCoEqJMJixJr4xpmKXpyFEQkNkFBt3LCLpWB1Yb1xd25iCvYJoCw7mWxD2A5JMYeLHxn49NF01l4jWnXa0U8p/CFUsEaxscwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c5d3d1-d806-4018-4f26-08deedcc62f0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:52:02.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O03TIisFDAWFlwTu9tyJ01mFKSV/7YU5lIhRSm+VhqoM8gjV1HkMEpHm4Ca55XIWMRi0CfVDLOj9fBEsVZoVHFG5ckQ7HRjvv1plUuJwbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=JuvBas4C c=1 sm=1 tr=0 ts=6a6a923a cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=HWfS6c1Ke9pW_yr55HYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3OCBTYWx0ZWRfX3FetU5iv0OtZ
 mcATmeZRLgeq29iqxlBk7R4g+tZmL7/gLUttWNW3ltHys3mqE9yCWAO4wKUBHP5CXZpHlA0+QRJ
 +uxVCMJf1/k8Ry/6mMQGE/mANeSEFcxEGH5LbV7ZR3srLL5bY//g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3OCBTYWx0ZWRfX7RWxx4bJy++O
 ZyZT1BvApIP1bE3LEVAhRVkuS8LnuL5VPKi92YLMG6qT10khDungJ4K3CeOO+ZNP/ebqKSzrcix
 YTgiDukwHw26KIZbL02teBUeo8LJVO27QvytLIsGo72YBKuEAwvaOauXvQ7+zguwx5sTeOpfzVo
 aXRV+/fEzd8+2LLZA0OugnccMr2FiaWJTWtFN6uFjYSDLwh06NAy4ilYgmB0FWrnjDRuNZ97AB8
 5NMgV8TQaGVxlIpWch6rPCjoxYuxSWHqjJYIMNilOpJ9SWOG/lax1TYyLFWQEBH24AIce2B8+go
 nYOwbDiPOX9sPaJIj+JYxbl6OUeiB5sVVrkYlCB9Jn1ZWGM0OInl4CS7Ouf598OHAGTPfGvmXM1
 4R2RcLoVlDdPfWCuNjaDUVmY7k7Vo+br70wp/A9PzPsQBv1UKtMkPBZhmPw/dk1lWZ9DjcsUxGg
 1ALZ3K3aqTsOQQ602iQ==
X-Proofpoint-ORIG-GUID: cTrdngyZWlqFX36fYxxF7CyHU3KwLbv4
X-Proofpoint-GUID: lfkaRqqxQz0SQhYNVsfG5PwzI11aSScY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242306

* Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
  - pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
    Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
    pkg-config is a host-only build tool not needed on the target rootfs,
    causing do_rootfs and do_populate_sdk failures with -dev packages.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
new file mode 100644
index 0000000000..4b9f1e1dac
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
@@ -0,0 +1,59 @@
+From f7d33d39e48d8b8c99af1e97bcb4740a9ba6204a Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Wed, 29 Jul 2026 09:10:47 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Do not emit /usr/bin/pkg-config as a
+ Requires dependency
+
+RPM upstream commit 67b68cbeb978 ("pkgconfig dependency script fixes")
+changed the --requires output to unconditionally emit
+/usr/bin/pkg-config
+as a hard Requires for every package that ships .pc files.
+
+This is appropriate for native RPM-based distributions (e.g., Fedora,
+RHEL) where pkg-config is a target package installed alongside -devel
+packages on the same development machine. In those environments,
+requiring
+pkg-config at runtime makes sense.
+
+However, in cross-compilation environments such as OpenEmbedded/Yocto,
+pkg-config is a host-side build tool used only at compile time to locate
+libraries and their compiler/linker flags via .pc files. The target
+rootfs
+is a cross-compiled embedded image where pkg-config is not installed and
+not needed - the software is already compiled, and the .pc files in -dev
+packages are intended for SDK/sysroot use on the build host, not for
+running pkg-config on the target device.
+
+With rpm 6 using its internal dependency generator (rpm 4.x allowed
+disabling it via _use_internal_dependency_generator=0, but rpm 6 makes
+that a hard failure for v6 format packages), this file-path dependency
+ends up in every -dev package's RPM metadata, causing do_rootfs and
+do_populate_sdk failures:
+
+  Error: nothing provides /usr/bin/pkg-config needed by
+  acl-dev-2.4.0-r0.x86_64_v3 from oe-repo
+
+Remove the emission of the /usr/bin/pkg-config file path from the
+--requires output. The pkgconfig(foo) virtual provides/requires
+(e.g., pkgconfig(glib-2.0)) are not affected and continue to work
+correctly for build-time dependency resolution between recipes.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index ef4581856..1cab58169 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -43,8 +43,6 @@ case $1 in
+     while read filename ; do
+     case "${filename}" in
+     *.pc)
+-	i="`expr $i + 1`"
+-	[ $i -eq 1 ] && echo "$pkgconfig"
+ 	DIR="`dirname ${filename}`"
+ 	export PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
+ 	$pkgconfig --print-requires --print-requires-private "$filename" 2> /dev/null | while read n r v ; do
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..32ddebe407 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch \
            "
 
 PE = "1"

