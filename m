Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1C2CAC5A0
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 06:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4708.1758349096206844742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 23:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=si4EHjqO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1358784b4f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58K6IFfc3142187;
	Sat, 20 Sep 2025 06:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=A6YFHTbabat1lLspf+cy
	qOND3k/IwT3p/uFRsGGQenM=; b=si4EHjqOSRYhRTh/7E8UK/8LWWxWgaqEJ0kq
	ASfeoRhuQSnekZngUY50yxs3H2PXbmE/krRmbZCS07FPceoYTVj2PuHs0tl7imG8
	nm3Qw5HbJdPhT75I6bH4vC+9+0O8NIM4zcguxAdUxMQgfp6VGMxk0Vxbf7nXQ483
	OIugRjFYaMk10U52VmU8JTs1xho1wFpjqAu8eXRdZw4YyObALYCYLfPlbq9UkWHf
	52g2D8lYHZLovPOhX9Fto5ritheLRT9Ox3lNs0QWlxQK1F8jyvgRw630M/w+V3yP
	kdOAknwxgq6nhRKflhstCK5RXphv145aCXlMf0nfAZn2jhTQkA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k8983h7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 06:18:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inbUyVnFJk9EQpvUdWv2NK5Kd+xbNi6IOSyJ9rXVkTqmKbiT05pa1MZPtDT6x5gYTNAxCkRgmFqON4ceYddJO1/6xGjod1TBM+NcYazeWcRmTf71PlXts8i58eaMV6S4qi/mmiLA1MRIvCGBTb1e6c+qH0FQh9czaKo3rwajAbUcLvw4h0NnE0Xjw89zg/gTgX3KNH4JlcvkcNBfPRhEBrYGvw8gXXhUexB+5qp4PIRZbXWXD1QUzAdDXa468njkGaAr2StTfKBKwZW9qctN0rXe+Rvkt2d+pnjPGWVzsfgmec2eGZhbx9FEJdjbIPcufP34HTn6nQ40fFDR+Zy7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6YFHTbabat1lLspf+cyqOND3k/IwT3p/uFRsGGQenM=;
 b=kraPUAqe4IyDQqD2MiN6zpwMJV1qx484DIZA/Z00UciWPQJuDJpYZCklk82tUnlG2bvPQ4Hu94BHxqIfG1nUqzdF/u2MfqxRKvt2AW+MmXp631zVol/+6Ve+r8hHvPfC0LR5xvRvSRCg8gaetisTbZoCCf4hB9PBdMKhDJKS95ZlUqO7P4iCQvkTOgL/iLn/KNjbiUCUzAX0/Rw7vT7XwyB0spcbThzZFWJ0CbbPX6aHl2qVKQxvg4eJlgZevojnMmWEXGfxmTg1XdqX0uYfuCBW9EDaTvqZKfMMC8dspkT7DAze8D+3fSbpQ6QHzfi/QKbH38fX1YkOwTp0YuCBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.16; Sat, 20 Sep 2025 06:18:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9137.015; Sat, 20 Sep 2025
 06:18:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] python3-setuptools: restore build_scripts.executable support
Date: Sat, 20 Sep 2025 14:17:52 +0800
Message-Id: <20250920061752.1132596-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: b8642eb8-075e-4a15-ae75-08ddf80d7703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tyn2VjMt+GdO2ajMBR7zgLXfu0DuGCKnwawP8tjLKE2CrsG9j9KczQOLfTTk?=
 =?us-ascii?Q?eIMSUZmaA90hustRkinM8KZQ23Ivvu9JlnoZgt4FIdhtOsXBoX6SvoYQsbMH?=
 =?us-ascii?Q?Gx/8ixdsCtgurTpa1lSOuUiJCCypW724ko4o7jRi3f2Tiu8wbI2vQ49PRZ+b?=
 =?us-ascii?Q?WldxM0KDXCEvNBJa21EkBF3i5RjtmK/kf3fYs97PWF3W9e/eDhKulI/MxZH7?=
 =?us-ascii?Q?ihAubLQSvWs2FHYMDwwPf4mdoJ/EWGdGZygW17xOKpCQdQeBi9pIWJa4Kt7N?=
 =?us-ascii?Q?G6QOJt0lZsFkgz9gFpSICA/8AzIORIcYnto42ZnTxD+d3LmTW2A6/6DDdKqw?=
 =?us-ascii?Q?tl/ZJimph0jmbnkPWDbKV+JVjp2CdW/7TGQaur+evtGcW/jBmQpXcbAO+5Aw?=
 =?us-ascii?Q?Nz+D9wQda2WAfaBDftz6mKrcCMPMybci+b+Vm9kNbD0l0dsCckGTDtm0VhFH?=
 =?us-ascii?Q?3o6+bDMDjYgiTwLzs4ETjqnuYqUJA6PvQBDmqA+U1KFkxojdLHtjAafchNRQ?=
 =?us-ascii?Q?hs6JzZYC1+46crZog6fQkkc+zsCPvRpYVveOjyyyGBWmNOukKUxgY1qWWmSt?=
 =?us-ascii?Q?um9vsXAJB5aMJ7GNL4/pYtm+M/XvRus9388sp8MFtVSGEx2SaPIJiuJIgcud?=
 =?us-ascii?Q?qw6mXt0IzrxQ2oku4/JsFHBmqxByGSfgm3RNb15ejVT5f9OH2cSmcIXeqYWg?=
 =?us-ascii?Q?hS5ORbtA05sQIw6TVk9IPnebbPeviYxrVb1PF89Rq4MGzFOOejcRfZUtG2VB?=
 =?us-ascii?Q?kKF7d6MmqvKTAUTJMKcEXb91LuimaCWW1k6o1MAtRsF02XJjyMEXA5xDT4Je?=
 =?us-ascii?Q?UwZTZxoTfDPkeagqK8NaW+cDuHxE3npir37C8qs3MjmgRML3USxL1lswxUX3?=
 =?us-ascii?Q?/xuNwqrZQlhXFawXkMraXTrz7eHG75JP5fu00WQWxbw5MmCRX7edLrxP0jLL?=
 =?us-ascii?Q?eFsImNsv9PO6ab9K+9S5XoJf40Rxvval/GqT31e3UBblxkRB+1hdR5rjydp4?=
 =?us-ascii?Q?89e+hQkvfabTUTQUo/aQS87fKLYJHZU3S55LS4hArM/OJKrCk3OwWUQll9Ul?=
 =?us-ascii?Q?HUaZ1jZ2ISDpQL5cfXTCJil/xiIZXpGkTSK5t7Do8dqx8vjuWsaFY+u5uGf9?=
 =?us-ascii?Q?wZgC18OG36vqaGkDPBg6opxSboJi/Lj1Wz9xS3bo12smQlY2GaoewtliW246?=
 =?us-ascii?Q?ojO9w1Z7TBlXuJc0eXA6B9nBsk+Th8aWuwzla4UneDJ8CGvRPon7Wvy2zK4r?=
 =?us-ascii?Q?w2eXMPzV1QqIWJoyd43zqesI0NIjkZeaWi6jOFCKj42/HkL1gVK11CFGYzzq?=
 =?us-ascii?Q?33PP+HqCBwczF3OVTdao2a9KiYpqHZILXQfduCas1NOEkOnfJDlU0M4lIL/a?=
 =?us-ascii?Q?yYvqa+DUKaf4e6K9Ai3+B9oY4nn/6249+EvV2fDkSBjE0yF4nTmejR8r/SeU?=
 =?us-ascii?Q?bxKcn9+TGQ7supgoQppH4cT51JJNSn65hSfoRTmma6ksn+9BKEcsIeLSOL9G?=
 =?us-ascii?Q?30qMO8l7B42dMZI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EhKMmC5gvJ/DcmzALrfYHl+tLDAi5k/ujH7+OUYkRiGUFvV1BWC6qRmigLmi?=
 =?us-ascii?Q?fAEU1psRH6597i3gXav5X4j0ywvdL6rUoJf091H4SJQLIi2WV2zNXGWg+G3a?=
 =?us-ascii?Q?AHfeH+4kqDVu7p1jVXOegpvyEYU7n4JF5fhGcG/muP4fib7Zpm5RXxPWtXUi?=
 =?us-ascii?Q?v5VSVQLNbQSqGTJr2d1FOOrzasoo7GmnNXlDl1kX3hVxCeF0pxwc2+7P48QU?=
 =?us-ascii?Q?GKKqcW5/eyV/bOU2+jIxsY521GXOuH+qnok4l2xNH/Q0qnRjX6Bfro1JXVFC?=
 =?us-ascii?Q?YKbpHzY5D8V6v5i8Gu4e3AAB97sbdvs+gKRtY7HUpTsHHC71+ingx/v/2dkw?=
 =?us-ascii?Q?Edi5eaAzQPIcfw9Yq7mQP6PwAYJ5Ms/Ens7plh6VmThp68+Mg74jnxzqddu9?=
 =?us-ascii?Q?gIxw9z87cnOsNhP9RkUXEeRzwRwwpc4HGmszjLE6xapCFHaDJIIHHiR/oj9e?=
 =?us-ascii?Q?tJsEKgBeHws7j13tW/0IT5htkAbpIexjgmqp7KxUdr6kAxqcc/DpCOdvuQUr?=
 =?us-ascii?Q?wkYQYtqy55pGCe1Jw2SO8ZJESauL2XVKZBVhnEc2OnJ8xbdNR8FzkzgM1K0E?=
 =?us-ascii?Q?vqD24fIwRgVyKo6uk2wrbZQsJRHymqKGfTXqEPL81+bKuM/fLc93ltVOzbc2?=
 =?us-ascii?Q?17ME7ZGqawW7QarIK8LDPfZbXAiq29Bacv+Qgz9xaqFz2EHZCSjjUeg/Z2fD?=
 =?us-ascii?Q?+7pKhTBecc2BN6kaXFiC2f/ZyyH0vHapMIfSqa5FkqDhl0E834kdXDtp0+jF?=
 =?us-ascii?Q?jgAMI+DzHScDokd0ikVN33AqX1yRlLnpsu3kTjrkkF0wyZUsqpDNflZoKuvT?=
 =?us-ascii?Q?DHrMb5njzwvejbL/MsIXeT7lqXLb0xTOrCB3TL8WyQMQzBsdFzFhGYB9xG1N?=
 =?us-ascii?Q?8JyM6XkcGFTzKyE1lVUmilnG4a2/BPw4vs+CEVlUuHvrb6qs7/4iO9k7jIXV?=
 =?us-ascii?Q?t1IpzQA0m5uoFTCKKSko0TPpzz/lrIlXrsTkqtIMUjj8GpjW7WvgsLpeUanJ?=
 =?us-ascii?Q?sDwxxWi2E5gbU2NlzgFZcX7+yLKkJJQiQwEIJJ13XkbwDduuBrxLMCm5res8?=
 =?us-ascii?Q?FYn/kmeV1H9ldn+lucnRBfzT43rhy/cd6WlKf3Wr0I2eaZRR7I8EboqJ7mqK?=
 =?us-ascii?Q?ARH7V6187WnHxOaPCLXR0XFPmM9cM7q1OAs2yW6nV7jd4y0R/7W4aBciNqVm?=
 =?us-ascii?Q?BvrwWBAS3I4F63QuRjO8rEWmWciahM6N1BvJNMnb0HNmsS2liR1tzHplFS71?=
 =?us-ascii?Q?vEqjgydboLYu5664douHwAW13TgXJuxw8EhmzWwiPYCuQ2TFXWeOoysM8WKx?=
 =?us-ascii?Q?rLDJRaxZ2qOuPz6WOQYFUS3xqId5Ll4QJCAsMYsbZ+K5yCH84UMEEkM1E8FM?=
 =?us-ascii?Q?fUNgghQxBwLMO350i6KEpNzBzMDGJ3wYjNYSwu2BJ+NRvktoSLUpJxCWbWhz?=
 =?us-ascii?Q?tvk8dZNAVE/jntNJ31Af91gk3T2xNfie1n4SoIYZ6lr55jrnF7j0381mMhFr?=
 =?us-ascii?Q?L4IlPLo+cJP/KFPBNm+/lHmd6Z56khC203XpfsBBHWRkKr0jKKJiysK75r/j?=
 =?us-ascii?Q?7deCVktoff3VDdNwdtdS/YDnG8RlBhbwuuOfBFW9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8642eb8-075e-4a15-ae75-08ddf80d7703
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 06:18:07.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSCkK/CZHmE9gqc79826aggLRaqC7cJtSEhf9Zn9LYUnh/Irv3ZPFp8ST0rpv0lzBBtNP4QnFxIdvbfMmN0e+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA1OSBTYWx0ZWRfX/48/zgKA/K3c
 +0I9B/iv5/dEnsqIpUYXEdb49FKQl085G43ZBedX4KRSjeog7Jpd7cnA0/0pyvFT56Qpsp4jpqC
 1zA/JgCCW/EwMb+u6QE4ewQyIV8NPG4Kvo8JDBfJDOKvU5DDzDx7KLaqa6Xu4GkwvN7K8DBnz6s
 LornpxCTZwbtt5679R/unC63NfFazMPW9HcslcT54MmOrxQufQEZ8VjJXv/brMnAkJI4RcnxIpR
 dIyY3c8hZxufB3J5V1bUl+wY4/C1GEbse0TGzr60nFfW1M5GjKJMCVCoTJ7Wnkvp+bmd1tb+A+J
 48uAu+HANZVkuo0jevRWwDBNn6ngL29X8FWM8aAWpNCQhlb89oeRy/tvLGXsMQ=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68ce4727 cx=c_pps
 a=qH/fS2hzlQnCJHG7LpbWtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=0DMlDUsRAAAA:8 a=WP5zsaevAAAA:8 a=JBkUMxbRj7tb86v7Vy8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22 a=t8Kx07QrZZTALmIZmm-o:22
X-Proofpoint-GUID: 6S7XRiV_RRqiaacctf-DW1_y2WbvXIqm
X-Proofpoint-ORIG-GUID: 6S7XRiV_RRqiaacctf-DW1_y2WbvXIqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 06:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223778

We encountered an issue when running python scripts provided by
python3-fail2ban. The shebang '#!/usr/bin/env python3' was replaced by
'#!python', which caused these scripts to fail to run.

For example:
$ head -n 1 /usr/bin/fail2ban-testcases
 #!python
$ /usr/bin/fail2ban-testcases
-sh: /usr/bin/fail2ban-testcases: cannot execute: required file not found

This issue was introduced by commit[1] in python3-setuptools 75.3.2. See
the upstream issue report[2] for more information.

Backport patches from [3] to fix this issue.

[1] https://github.com/pypa/setuptools/commit/c71266345c64fd662b5f95bbbc6e4536172f496d
[2] https://github.com/pypa/setuptools/issues/4934
[3] https://github.com/pypa/distutils/pull/358

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...l-request-pypa-distutils-332-from-py.patch | 63 +++++++++++++++++++
 ...or-special-executable-under-a-Python.patch | 59 +++++++++++++++++
 .../python/python3-setuptools_76.0.0.bb       |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
new file mode 100644
index 0000000000..e3329246b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch
@@ -0,0 +1,63 @@
+From a8d07038ec4813a743bdc0313556c9b0fd65ba88 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 2 May 2025 20:01:23 -0400
+Subject: [PATCH] Revert "Merge pull request pypa/distutils#332 from
+ pypa/debt/unify-shebang"
+
+This reverts commit 5589d7527044a75ff681ceb4e1e97641578a0c87, reversing
+changes made to 250c300096abbf4147be62a428bd25a98abc487e.
+
+Closes pypa/setuptools#4934
+
+Upstream-Status: Backport
+[https://github.com/pypa/setuptools/commit/3f94782c5ede0689cfc216693ddb9a79087d6c91]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ setuptools/_distutils/command/build_scripts.py | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/setuptools/_distutils/command/build_scripts.py b/setuptools/_distutils/command/build_scripts.py
+index 127c51d..3f7aae0 100644
+--- a/setuptools/_distutils/command/build_scripts.py
++++ b/setuptools/_distutils/command/build_scripts.py
+@@ -5,6 +5,7 @@ Implements the Distutils 'build_scripts' command."""
+ import os
+ import re
+ import tokenize
++from distutils import sysconfig
+ from distutils._log import log
+ from stat import ST_MODE
+ from typing import ClassVar
+@@ -75,7 +76,7 @@ class build_scripts(Command):
+ 
+         return outfiles, updated_files
+ 
+-    def _copy_script(self, script, outfiles, updated_files):
++    def _copy_script(self, script, outfiles, updated_files):  # noqa: C901
+         shebang_match = None
+         script = convert_path(script)
+         outfile = os.path.join(self.build_dir, os.path.basename(script))
+@@ -105,8 +106,18 @@ class build_scripts(Command):
+         if shebang_match:
+             log.info("copying and adjusting %s -> %s", script, self.build_dir)
+             if not self.dry_run:
++                if not sysconfig.python_build:
++                    executable = self.executable
++                else:
++                    executable = os.path.join(
++                        sysconfig.get_config_var("BINDIR"),
++                        "python{}{}".format(
++                            sysconfig.get_config_var("VERSION"),
++                            sysconfig.get_config_var("EXE"),
++                        ),
++                    )
+                 post_interp = shebang_match.group(1) or ''
+-                shebang = f"#!python{post_interp}\n"
++                shebang = "#!" + executable + post_interp + "\n"
+                 self._validate_shebang(shebang, f.encoding)
+                 with open(outfile, "w", encoding=f.encoding) as outf:
+                     outf.write(shebang)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch b/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch
new file mode 100644
index 0000000000..ea3fd22331
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0002-Remove-support-for-special-executable-under-a-Python.patch
@@ -0,0 +1,59 @@
+From 3b2944f3d9f83129500571f9e44fb0779bf0987b Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 2 May 2025 20:07:13 -0400
+Subject: [PATCH] Remove support for special executable under a Python build.
+
+As far as I can tell, no one has complained about loss of this functionality.
+
+Upstream-Status: Backport
+[https://github.com/pypa/setuptools/commit/575445c672d78fcce22df1e459b7baf0304a38b9]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ setuptools/_distutils/command/build_scripts.py | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/setuptools/_distutils/command/build_scripts.py b/setuptools/_distutils/command/build_scripts.py
+index 3f7aae0..b86ee6e 100644
+--- a/setuptools/_distutils/command/build_scripts.py
++++ b/setuptools/_distutils/command/build_scripts.py
+@@ -5,7 +5,6 @@ Implements the Distutils 'build_scripts' command."""
+ import os
+ import re
+ import tokenize
+-from distutils import sysconfig
+ from distutils._log import log
+ from stat import ST_MODE
+ from typing import ClassVar
+@@ -76,7 +75,7 @@ class build_scripts(Command):
+ 
+         return outfiles, updated_files
+ 
+-    def _copy_script(self, script, outfiles, updated_files):  # noqa: C901
++    def _copy_script(self, script, outfiles, updated_files):
+         shebang_match = None
+         script = convert_path(script)
+         outfile = os.path.join(self.build_dir, os.path.basename(script))
+@@ -106,18 +105,8 @@ class build_scripts(Command):
+         if shebang_match:
+             log.info("copying and adjusting %s -> %s", script, self.build_dir)
+             if not self.dry_run:
+-                if not sysconfig.python_build:
+-                    executable = self.executable
+-                else:
+-                    executable = os.path.join(
+-                        sysconfig.get_config_var("BINDIR"),
+-                        "python{}{}".format(
+-                            sysconfig.get_config_var("VERSION"),
+-                            sysconfig.get_config_var("EXE"),
+-                        ),
+-                    )
+                 post_interp = shebang_match.group(1) or ''
+-                shebang = "#!" + executable + post_interp + "\n"
++                shebang = "#!" + self.executable + post_interp + "\n"
+                 self._validate_shebang(shebang, f.encoding)
+                 with open(outfile, "w", encoding=f.encoding) as outf:
+                     outf.write(shebang)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
index 91d8fdd73b..9f330ec54e 100644
--- a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
@@ -14,6 +14,8 @@ SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
             file://CVE-2025-47273-pre1.patch \
             file://CVE-2025-47273.patch \
+            file://0001-Revert-Merge-pull-request-pypa-distutils-332-from-py.patch \
+            file://0002-Remove-support-for-special-executable-under-a-Python.patch \
 "
 
 SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
-- 
2.34.1


