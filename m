Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624FFD68BDA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:39:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33181.1766029144698921899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cIToYseN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Gv1U3177379
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KAlTsW0JMpR0rGYb5VHtSoRF3EJ3TNeAiolRAcSsQqE=; b=cIToYseNKDdU
	KZRklVjz+41BtJRhBTk4nYazeCG3CHXF03zWhv5W60AjQIX55dFvydHKRDqQtfcw
	yKEB2F8H6KAMALKQ5ZUNoMy/tNvKfSNX1OxIw+YGFHjBRQShfgt+YQUHtI0tLgwA
	9FSKfrMBw707Irnfr+KpyfQVgcWyF7EaZf493iCIqVHHEHSmAhKlen8fE39UnuVS
	SqWrbeGS3sNaRbDfnCOEQO+THM4bRxRmBSt7WyrFqc68wXic/mzGvfjPVBAGk0Xv
	xN24EgF0ek6cpHdQ7Lmj0w8PPT1JA4Ke0kF2OUOJHAHJpEYPHbsAC3leLm/xWBDB
	TPNfb22U2Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j1euv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfYANIuRtjBo3k4aqfmvLkIDbejgv1o+l3sMhRT0cCBgMFgWInScHJ56xLh2Qif+kAsTETAWnM7WFQswci2pJcMmp3XhlkEHSBOAngrgm9jr9J5VpVNXMR0YeVvYxCNw+U/a5SffrdJMzgVPMnulA3GvuO5coI7yHTOmNdtYbtMzL9XIHSLEd4zo9aV0a0HAIawj7hF+9J4iS8pBSqOcuCohx3sgKn+Kw4zjA4j7282FCvoifven6JE/rj5naFAntcmFwvji4Y0yRdxmjyG/95sAv3h57tp8Djlkj3Zo0slhzpLm1HQVULp2K7HomHjufi/7tEIPwtLqq8GTkUwBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAlTsW0JMpR0rGYb5VHtSoRF3EJ3TNeAiolRAcSsQqE=;
 b=jO1lL7Nt5GAuvloYUEtnfyJNQJi8oej4jPido/JgscS/wSWwGxaDpr4OeKKhI+rBBp/386KPX/TLCmQet/ZiJxeC5KLgHg5djHFymY1w8GHCbRNaIobnt2LuY2fYBNiNZ9rvaoEJbnoYIZe1aJ45BUYF93CXw0vqSH52+QmlwfF0xH3q2OlEHVPzIlQ3SGQTq8pTBClmmGg3cIagBML2I8A36Slc9DsvY4iEN9m3eIq0hNrjdPDv+kjxYJZrGgK+xDaGFyvEACPYH0lIfmtjyCp3diYNchNJjqxT8/dXHKVaZCWRGouSLwPZlWsnn+GZL6wt7PqGoDb1qnYi+ZDSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.7; Thu, 18 Dec 2025 03:39:02 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 03:39:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] kea: replace keactrl with kea daemons in initscripts
Date: Thu, 18 Dec 2025 11:38:45 +0800
Message-Id: <20251218033846.107161-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218033846.107161-1-yi.zhao@windriver.com>
References: <20251218033846.107161-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1a363b-1561-40a4-3a66-08de3de6fc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9qvv5NFIPTU86XS3iyq7ufgIl+h8X62GoqByhH70mUc2jWKC5+wfZ/5SGWBA?=
 =?us-ascii?Q?rvcd0wjwYy2VR+/IHhJs2icTaRWJMmYvIAlIRNJXj1hROG8KEjnuDOGHzb/T?=
 =?us-ascii?Q?oyasdPwmuwNQfcxBIYJlpqN96jVVC9UKfs6UvjCNLsBOn8MkMah9xim5a1go?=
 =?us-ascii?Q?p4M59EcEat4jq6R+wBQyF0lM7YUIAO1mIy5aci70f3acC1xeDiy07F2rrze7?=
 =?us-ascii?Q?usb8OCSEKKVuE0FYuAzM7s5xeLo+/dCxTBlLazlq1nqdsjvQ4CXwasUUMzY/?=
 =?us-ascii?Q?+ROctImMT6DFvzk8TAw4U2nDIFsD47+8v6BXTQWi/IjogbRAj2y+0NSOAyV9?=
 =?us-ascii?Q?As2eB6hk3ubOYJTJBAJ4JqlPw/7l9AnN2JhK571MfXbdcsfKlCPkZmW4ze8R?=
 =?us-ascii?Q?t/BO1osacqLPJo6nbQJdG2RGZJTEhPGEb5AIw811fbHGEVXYojPhW9T+jwYW?=
 =?us-ascii?Q?Jj3lZJpvdhBhTzKsPjLDTlt7N/wm8V2MXI6QS24P5hd1i4GuKbcnb8x9NQKa?=
 =?us-ascii?Q?kXE9o2bKXsq+xHsyQG7okEqs0KXwjYjUpy8Plp0IOG3xCl3cABqf/lJL2wZu?=
 =?us-ascii?Q?+IAigJKnVZgVAjve/tqoWqevBLhw6gGrPwaFyrqkK10Ec5muPVTw4JYdp0YP?=
 =?us-ascii?Q?FlcyEMvIgRU/3K02AbZrmWjJqiTHC/68LNF1Ax411IN+UIhgl+UoFDJt0oaf?=
 =?us-ascii?Q?qW8vjC+9a2EF0u82uruECZUmfEwRsPwO2k/5dPmQYFVz3hubNc2Hcv8JBzsw?=
 =?us-ascii?Q?0Ulk4Q5eiqvWoHCaPacS39ccLCg5xMcGO9sjVDYo9zXuLXI0QNonHyko3rSE?=
 =?us-ascii?Q?0lIUPvxS0BO2oWqJhkoHRwPbUytdCllLgIi2zB8F4I0eTaos9Hg4+oovBnBI?=
 =?us-ascii?Q?r5+aUUECDFhZrdTSLCRW7lqeK4sg1EaAz6nl8nS5EvAjDwGoQS16aoofFIpb?=
 =?us-ascii?Q?MDmsm24DUuTwZ7apTv5hN5QYGMzCgbW5t17oWEGmFWTSh/Al4ECwbvbOJtrE?=
 =?us-ascii?Q?PoogfK9NB2blkbCjfqwfPprSnLp9Y4v/wrDpC4rBar4vHPaZr/H6AVs/QmK1?=
 =?us-ascii?Q?9wJZh6Xh4pBCtLEtOU+WDwRv1n+QIIOesS+kK29A+4rzMuTq1iR9p8M3gFsb?=
 =?us-ascii?Q?IyGAnie3UNB7JKsVsSgEVhqqKgrxzs8fabFC/Sn/CaOxX+7uHrZ1BQhTI6S9?=
 =?us-ascii?Q?Cx93aLZL1ZfSgHXQN8fX+aO7IhtE8CV1Q3zovu5HazMqneICbMT5lMaWaFay?=
 =?us-ascii?Q?iXv6v3dUZ/rckd3q6jLi86aEyaf8qsu82Qqq90elXPZd309l9QqKTsnZcTG7?=
 =?us-ascii?Q?qXtTYmuJmjkjQpIHOtTBEiPeKhD78F345w1MulDV+23esQAVjpiOhGdRxqTb?=
 =?us-ascii?Q?uLb0tYPS3KZMW1F/IKjhpe9PvrykAK/EYGrtFtanCzWJAsZdMMHhG8RHv8ml?=
 =?us-ascii?Q?zSuJxk9Db/pAUG3P1UTc4ODx1tLGofuwuHVuiTKy7NOiH0S30sOHuA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nWeUNE0W9QPN9BMy6fDmqldikFaEuVGTpuAtiPOK/8ZUTZn32b5Xm9QzK4N+?=
 =?us-ascii?Q?H0PRxY973aa1g6jFUacmw5+MVUM0o91zcs6GRS5MBY5VbiaLgKNOkNvpC3y3?=
 =?us-ascii?Q?NWBUqvZmyicXsjThgPdZ0l11S2q/XLnwND8WfJMxnle2MsE9hcUFrH3XrElT?=
 =?us-ascii?Q?qn/vjy3waety9i0IN9dqwYYGeRIvP977nKURmK1pEPcWbfns4L4EorPZ3GJf?=
 =?us-ascii?Q?5hxjnD4TZK62HDnfSChYGOSQDp8q66hrveZLIhdhM0eEYfwbkD741aOKjKNL?=
 =?us-ascii?Q?X17OEhV9g4b/tujL8NwdlR/URO//y+4PpdrBpYgD0SU2y1cR2wOvJjB6Yr0G?=
 =?us-ascii?Q?gY4ZCfXuw4ZWwvM4yV9ydi0aPoaqX/WVHwkdnF3L8b2OkkMnLzCvGMki0hOW?=
 =?us-ascii?Q?hr24ckNpiMirF6ThYqEhIVloUWuJGJWCCpZsIf90SCkQR5d2dul7SrQXNjbQ?=
 =?us-ascii?Q?RCw2QWYGc9WpCIJRCP+U1LHQYTXiQ69mnk6UqzbWyyUvS/obn8UQrCGal+rQ?=
 =?us-ascii?Q?ztt89vGkKUYUcAp2wh3z/arp9iC2mIZY89nh41IcTfWH1UwWe+JFbb4O7lgp?=
 =?us-ascii?Q?LksfbxEil5KMUik1vp0fGJ5Ou05nUfH5WdqJ4/2VI6feUlb/FOvdBc5WwC6Y?=
 =?us-ascii?Q?rjq4XTWWBaRpmtjeY32Pp2NLaV8Qsn8r9tb4tpR8K0VbxlgEU6Xxhisg7mdN?=
 =?us-ascii?Q?XMgrVjHODZwLjvy7AZUloQUo4tv2T3alSEYRN+tpsyrEQM/OosZwECRRx/w5?=
 =?us-ascii?Q?IJzVxtU+rFrELZnj1jxWgyZmgRMrkJWGDjfg8TQkON0au+hQt29lgBr0ZCjH?=
 =?us-ascii?Q?GLAi5UolHf7IU4jd5ZkVIwRlah4uG2VmyRFn+IDX5oixivrsFHxhkc1FXGww?=
 =?us-ascii?Q?FrAPaCMP6JnWmajGg0SqCFbDUm4IA4nsC/a26Qqssm8uFNEQITpFc8iMDrgZ?=
 =?us-ascii?Q?145os4dP7LxxeRP1ug6me+x7weST9N/gOWBKrayPncTNSo+k1yIlXz0zJWl2?=
 =?us-ascii?Q?efY+o3YHgt/IK/80dNqhxG6g63TPQZgynfmPPnEAx+iTmj3LQzsjp5QTbmQ2?=
 =?us-ascii?Q?1X51/omxSKqinFW0ODrD2aG+viTL3mP3OFD1Ps8D6kC5bm05hmFv8bLu/gIZ?=
 =?us-ascii?Q?nofE53sMa1HYoZPhN9utghhH7vUR6j26HQokEAuB+rsGyTAcL3ceqx/Jq8Kp?=
 =?us-ascii?Q?HAu+RN3GnYr2cwjYdSyfY389oPGSxVo7ispTpQ875X5ILWMPb7JgfjptTCeT?=
 =?us-ascii?Q?bkcxnmzbeFNxgscvR9PScJI8cmcFrSbeZ3iwkpEFu4+jkDwsoRjyUCQrP5qI?=
 =?us-ascii?Q?oNsagoC4MF8tUrcVymB01tqRJfFncSDr9MQ88t+HD88GSM55EgJe+jMEdTCe?=
 =?us-ascii?Q?mI1CGUceuSEpqXtTsmkL5UbhV7n/mXu/OpgvM2XCMic5qxAGHwSg98LrWKXk?=
 =?us-ascii?Q?O1Nxwug20PJzt48qa7ZBDyU3YvKFQNgIRtvbB9Mr5LKa+ssMxsSG9kM1N8UA?=
 =?us-ascii?Q?P01wCsfu5bXU/XcYldMkfuetVv1V/wYD5itqjWl7pYRuYYTXUhSXIavLk1eV?=
 =?us-ascii?Q?Ayseb78iU0AkQHN/Tejn13OYgM/S2NleeTo79vUe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1a363b-1561-40a4-3a66-08de3de6fc89
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:39:02.3256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ku+uH2NzzXxRB9FePEQgvQWZhztxdIZ4k6tkg/gqwc6TZEyAAncefvh/QR6060sk+OMz6TcDFIzD5evX7PVK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69437758 cx=c_pps
 a=5ppPJOB7bB2hO4guNQQ//Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=3om1XbOCNqA7WYwrdzcA:9
 a=Hti1SrPgC-EA:10 a=nwb-CePKZZm3gL-ai9HY:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EchXHmf_tTs4sH6wHRQT_e1vhaikBD1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyOCBTYWx0ZWRfX13TTsjeNryeQ
 UQN63p9Y0rJ7oR8+kNXHW7Jw7C3FCXg789HTJohrX9eia9CN3n10sOfEMQ/CpPbVbIGTLT7KEqF
 tj8Ro0/3zMctR6gxoqXCdV6dch690bvjXnBZRyMwrMAwaDlCxpZGg9uATbUbh80aIV2uIfEmlVD
 tjGHmzrERRwRVS4o2nvmuk/GblUQM7sZxtnOO1sazEBgl8CvXs88h35oreKfWsY0c8EWHOFNVXu
 bTx30FPw0bT5dMS/WuOSwhryiW6O3AUSy8ysDl6IX9R+wW84KipcQ9GHmoqt6K5cBnKxnwodMwJ
 0ggj8LOt1v/exxmbAhdChq8XVOPKqt9rerHyXSaZ8qfrPbLEG3wr0lguBOh8dF5UXLxJw4eBMM3
 MJYnglqccI35M1BTccYIiqHE/+j5nA==
X-Proofpoint-ORIG-GUID: EchXHmf_tTs4sH6wHRQT_e1vhaikBD1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228086

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. The initscripts should call kea
daemon directly, rather than through the keactrl script.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/kea-dhcp-ddns-server               | 16 ++++++++++------
 .../kea/files/kea-dhcp4-server                   | 16 ++++++++++------
 .../kea/files/kea-dhcp6-server                   | 16 ++++++++++------
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
index 50fe40d439..ebdf6f4dd6 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp-ddns-server"
 NAME=kea-dhcp-ddns
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp_ddns"
+DAEMON=/usr/sbin/kea-dhcp-ddns
+DAEMON_ARGS="-c /etc/kea/kea-dhcp-ddns.conf"
+PIDFILE=/var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
index e83e51025d..247f15d7fb 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp4-server"
 NAME=kea-dhcp4
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp4"
+DAEMON=/usr/sbin/kea-dhcp4
+DAEMON_ARGS="-c /etc/kea/kea-dhcp4.conf"
+PIDFILE=/var/run/kea/kea-dhcp4.kea-dhcp4.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
index 10f2d22641..c04393ddb8 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
@@ -12,8 +12,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp6-server"
 NAME=kea-dhcp6
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp6"
+DAEMON=/usr/sbin/kea-dhcp6
+DAEMON_ARGS="-c /etc/kea/kea-dhcp6.conf"
+PIDFILE=/var/run/kea/kea-dhcp6.kea-dhcp6.pid
 
 set -e
 
@@ -26,13 +27,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -40,8 +40,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
-- 
2.34.1


