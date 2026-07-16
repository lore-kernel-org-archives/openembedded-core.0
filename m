Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EEC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 14:25:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14157.1784211920589578835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 07:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E9OvXPIB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1657a5b283=enoch.ng@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKgGw3048689
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7CHEDBLFZns6IOSaK218
	xCsVnMqzeyeIgESqw1q1i9A=; b=E9OvXPIBmzXu5dtTcMbavtlbnXZYvBs3cjXg
	g84+C5Uk4rCkwKdhly3gNY7P1xDXgO/jCkk/xb3OlSWlQIcA6GmIQNySKe+nKPVp
	oAiLTxNz0CF9+Y09dxC7sMoErbfStfDyIupbwxDkzLgwVKlH8/4iYUUET0FhLxnL
	/hvqG+M3fYQXcyXKy7B2CjioJ3EHe1agjHJrx/D0Dv1p4GR2p/Razu0zZfGxIEyg
	DJtmyZbNeVoR92jXZjcv7Pr72z6fPsKKjYjhkS9fCUCprPYz5wM3DzSRasq7AHKS
	Sk/dDQXqWjysrIHXTmWtgvUQWQFZItfv8QoL3OEICLs1lCNewA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbcpn89t8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:25:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZnzB55BZkLnXNPjbHMsFDvD7Lzt8DXWrUuMXze51kXJQ5s9/HuftwgDy3xPcdXjTvPqwH3F++4eClYJcBYv0XamYGO/23sOmuYyd5mSYK5jl84ltcZ6Dvlb5Mk+0krf5dvKHlBkWl/g+ZglRND7iKba7qsz5Md58sYrp4ZyTm4k7pXO0rbLs+q5A5VxOGWPyymFEXJyEWOlGmwG7JZCqiPxWv8mhDvYpWtvRnNh9xkPMVubJye43W0mWuWTCoQEMAi9tqPLZGLc21QEpXa4itiMKl7O+HQPoegJqpeyntxlpM56V7LbohWkJS9NYGQAbZjCfZ/EbV54oSTmlWnMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CHEDBLFZns6IOSaK218xCsVnMqzeyeIgESqw1q1i9A=;
 b=Dnhio5ufDNkmSuiSDwQr1cIxAFMObJ3Eb1iWMWnhiENlW6tAJbdvGVVSGk/LbHzEtvauUurn2jsnVi+guwleQBxnsDYO/PEPySYoO0Hq9Hmn/PogWpDBD4zN4Y0ngLkGpH0pibosLcIKgG6zHnIiHmI5C59SjJV2pYea9c2778r2bULEoNuCgGLFYXtZHnwCggPh+xLfLUgvA2DMw6gOc9QZm1hDwpI0iDQlCQc64JPFLjYkyUp6/ZBNT/fpXXnLUrsvuVzJn6JC0WJ2E/NbAT6oOqgbqNWkbtjgryzXlUCXOCmbN5LWBbL1w5QRXwOl7GWKv9FpslZik2jlCtK2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by CHXPR11MB9627.namprd11.prod.outlook.com (2603:10b6:610:2f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:25:16 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:25:16 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] libxpm: upgrade 3.5.17 -> 3.5.19
Date: Thu, 16 Jul 2026 09:25:29 -0500
Message-ID: <20260716142529.2686271-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|CHXPR11MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bedd8e3-0ca3-40cc-9546-08dee3460e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|10070799003|366016|23010399003|11063799006|56012099006|3023799007|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	fyjWZ8f/XFtVapwFsc6ObnfB2IPfzmvJu/btDLL1glylY5jVCrbWerTf5jt9RBX0IYSeiFLM6GQjarqq5nkX6DTMzyUm37O0guuuX3xlK2yEAu2yJVgWPAXq92BFU+FByVj7UthBpVtvf7eNCW9N97e6n36/l4Rm4dy/3SgQtWGuR9uv9PeeQT5FTDoWwMIGlS8EFtAS4V5VWbiwI/i1u/WvkliTsYKTKUuJkj9jh+Gl5V/6T1yhsOIhshMuhEnVUTnIwmybA28dBML7AQWcAmVxRyOSIS4iyGfyUH5JvtAX11bWefyvOEO0+gGZ2CmTOv3OMZaB/x1kolF3brpI8+Nk/ZI/rFDk4XdL0J1nCgbba3UpDyI6j8ex/TVPFFOczCY6Ut7sXaeGc8xwpHiY0gOvind0LvAPbxR4KHr6RByrJ2oopQO5PrQGEnkxOEs6ydrHiEHvEp65GWqVMcz+Mr8tfBc/wPOE5c88NJ8vbroF1fRUYbh3v3OufUkUbbmFJik2b1Con8UZRNvb9RcNN72J1bPYZevbkft3AwAATcGDhnrgcIJ2hfQuD9xdFH5qpDjC5xjZ7EJXr0Zug7owevriMJfPSGXf4zKQYIleeGkqrwjHKg1Id8Rov/w74fCX+ckYDcZh/qDOj5WU3N4GlRIkVCpMObZyaeq6Kx6wNF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(10070799003)(366016)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ihYGQJQLY3KWaMn1EuRJrlNtdcV8GTd4nLY6vcGoo9G04VM6hTjq57ZHGt5s?=
 =?us-ascii?Q?ocWdLKipyIm/zAcBmyxuXpD58gLls2GPI3AGqEJ3YywsQShRXIu6H1ZXc5qV?=
 =?us-ascii?Q?NQsHczgXdUxj6prvFe/UBheBk6Id6sWupQJF/RjVrtOj3Eq6X9rby3sTX21Z?=
 =?us-ascii?Q?wGTwTNnJLoWHEUKdvOhr9YRqHOQERT+PLSQnafLnUCGr9QoilHqpQcl4BW8L?=
 =?us-ascii?Q?trol4eR2vc2EYf/K+/iOPLitDtqRRQ4JuB76emzPV65PRo2ufbk/WT/8bhBY?=
 =?us-ascii?Q?1nDvm61PUgEnBbyaBXHFkiJvHAPJdGiYhV0nmyLCjjSW4JaGhF23/mMem3Q1?=
 =?us-ascii?Q?bIVKZqvvwyp4Pk3VYY2yS5ftnA4sWLipH2b3RaPaDE5LqjSxYlAfMuhVSSuM?=
 =?us-ascii?Q?l3cHF9cieX0GjM/j08i+C9IFCHrj+XQxGZb9Wfj7r7+8qqZIB4dpImbUh/0T?=
 =?us-ascii?Q?gfjVAL0SbEImZFymkwDbpaKSGLT6ekB0GlB5KAZ86bHNk4SG0z3sz0Ybbizz?=
 =?us-ascii?Q?dyfSYkxrZ2yqjpIdOxC6mKrTP8shIMCi4lb7AgGAz/bhCT2sg/PTPXzhlGZ7?=
 =?us-ascii?Q?kwFxbgyHLTdjwNFNLDYc6hqc9OGKzcfl9QkqAMp92Db6RRXmAkoCH/S6AARP?=
 =?us-ascii?Q?pNT58ecF8kk65bvr01qRFiXofRi6hZ2UYRWVIPoEt3Qe8EzlVD0XtNVXhKI1?=
 =?us-ascii?Q?+cDrNA1dr2uJyxGuGQPRMSvGnGlHAxooudeWTIzw6KJzwHeyc/S6sGC0wOWB?=
 =?us-ascii?Q?Ut46XI6rF5ujk8t64QYKAVXpJFZIvaKYyRl5ad1HAbJLhL5OeHKaZYfUrjj5?=
 =?us-ascii?Q?pz4UR2F2FW+g6cnOkZEL7ePWyfDPatOea7bz8pPzTdpDZ3DIg/dc0e4n2eB2?=
 =?us-ascii?Q?iLecLcoUCG8qgnFCkPtPFTnVEFvN+fHW64+0TjFxeLE4sA2a13imMFvq7EPZ?=
 =?us-ascii?Q?CZioTKjSKJaFuNTZaGHXazhzdWNoF8AY7jzBKwwwRczxflcrf+0YQv7ukKG3?=
 =?us-ascii?Q?kl5VzVmiBET0uzlx4sNFhIyzh3cgLOTGtzT5s/zHbDKp8v9HxkJ+t1QgZbAq?=
 =?us-ascii?Q?wjqRddbOXt9Y9Ahx1m2fAwd77sYxdDJOBxMFWioO09XDhuiTsTDzsrYndkGd?=
 =?us-ascii?Q?4SUvigZb3c8ne40DpKdj2dsNfGOp1kO2/sDsWxJhh6UBEqCFC8cGvr76QDcH?=
 =?us-ascii?Q?F0ooqTeF5XUdjUQ678wHb1cEXu/t2hoDfkdwdBgJqIvEVGRrSuxTPrncchaf?=
 =?us-ascii?Q?DKgZnAq0j++Q85hqY1QcVTVZ/2ktVE6ll4Adf5cXra6SOqaSZS+BqXUAqIkX?=
 =?us-ascii?Q?RXqgJGKAbH6GQ2MyZhODzCBafOACl4HErON7q6dJoBLXhz9noAIF/7HMDH5S?=
 =?us-ascii?Q?lsMoAt06uhiY0jCKmYHldoaLmuxf/F8mFhtxQ4Vy7KR3Yb2IYOtRQkiRNfBC?=
 =?us-ascii?Q?GhRAc70nQz7vb2qZ7wQRlPYm5Q1SbhrRtIdGze5NpTiNSjzS6o18CwjTbQbo?=
 =?us-ascii?Q?ZznxcTD/HUWtY6IjFgYkwkOm2pZ3ovNWEU9MucvnudtTvwHuJqWgmb/hcuRX?=
 =?us-ascii?Q?O2/BfyAOrUG7HcEppxuZoqnWIWv40C+hP/xaIfnfvyKsSSkt590tqnK+PaVZ?=
 =?us-ascii?Q?HIvfcDd+EqU5tvkrdMGSMxBigL/CQIJeNdsSUzk28dF5m0vxHYms6d/dF8mY?=
 =?us-ascii?Q?RpmrUinV8afC6ytIglavYfZoiXhLqF2gtkI0mabu7sbckeYRpdmD16bvuNIC?=
 =?us-ascii?Q?QHFOtrWqzao0/YwPsrOxEVus4Uv5OmlcNciLE6GAZUDWrER1+UjMdqrxe0UZ?=
X-MS-Exchange-AntiSpam-MessageData-1: fT/daotNh/K7sQ==
X-Exchange-RoutingPolicyChecked: 
	UoEzS7j9Jp9A4tnfyh1ps7JMlFOivzcVhf+8nrFEgTR8yh4c6yVm+HKgQJyWAtBv+DOZznf74n19mCCSx/NtekBQuwQvzV2BjDvEoPubfyjecuUGjfK6f1N95BIVvHcaB3bnBhe07gG7Nh4+myPAhHEiGrL7JEJX+zjr7e8e/ylgSnTZ/bTKhTslbB4x9UmQryh2AQJ1ghYOUQc+8fjIBeriDnKMsOs2SB8gQeu8dZyNZ8gTUMtcFqlWze+d1UUnkS9fTcTAd8Wb9614uZttisGPJ7FVgItJ0O+AL6KqXN/6fqQmbZzzr0XzzxuT+JZ6/+G9PLbQYxPOmRMKFpl6Rg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bedd8e3-0ca3-40cc-9546-08dee3460e1c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:25:15.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbP8ipHSHMcAqbG94C8mG/MdpLUrxsj9XTxrOtKbfX1Ycx9yW5CNyN2fdYdMHLgEbv7t7zvoPWxp59Mqu7EV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9627
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXxxCAXYNAAKne
 fVHfUEB+h47uZxyiuhkhjELbMHkcE6uKTjfa3Ek2bbSXsgBbOS8xJzPK/meAHdqw4cXj+edbtCz
 02tRU1/n0hVeh+hi69+KU5NJGs3KScI4dJumBkOxG4TqY/xdbkaTuTbgXsG1ig8waP5NAbSgVOB
 dDAUQI+niJ9RQCwH4aqvNj0lh4NPzL1OjjQLmFYM8BJr9rJujTyn+myEGpFCRuk92xKJJuuXcj5
 IeRvn0WjrBkPUbPrnfzCIiAX0e1t3avpY7xozV3pLjLrKBZp++rKuoeYwja1izuknx0CQxn/9Ge
 oKUVj18vW/SqEfbA85MKJTgQkpE0rIFZKlezNyKO68w0rEOz3tuZWzjEajztmZxw0WgRHK/jAsp
 jfBkCpRpEHvbM9pYccdo9fvEHPRstwoTtT63gSTOd5SLYycmhZoqF+hXYRm9uHXejZnoBIbBwWj
 se+RR9SwldA4OlZIa3g==
X-Proofpoint-GUID: si_xy4l59QFDe68NgAaE1C6g9rkJQ8pQ
X-Proofpoint-ORIG-GUID: si_xy4l59QFDe68NgAaE1C6g9rkJQ8pQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX7fqWjRskOWsY
 +Zpfj4IC0b3RG6MpxoqD4Yzq7PHxk5FMMTuU5GnDTKSY491KWSSCKVJeXKaSXDtvvgVMt3dW8mo
 w/NT9AFMVliSBNnSh5ljurs2+shN7+Fo/++O7PXD0kfbsjw/OET4
X-Authority-Analysis: v=2.4 cv=JNsLdcKb c=1 sm=1 tr=0 ts=6a58e9cf cx=c_pps
 a=6wX/tLcgNF/HagpTIcwFsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=omOdbC7AAAAA:8
 a=P-IC7800AAAA:8 a=7CQSdrXTAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=YQ1XnR2lMZ286m2He9QA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241092

From: Wang Mingyu <wangmy@fujitsu.com>

Squashed backport of two upgrades:
1fc25a668e libxpm: upgrade 3.5.18 -> 3.5.19
767f686226 libxpm: upgrade 3.5.17 -> 3.5.18

A vulnerability in the `xpmNextWord()` function could cause an
internal pointer to read beyond the file's end due to improper
validation of file boundaries. This issue was fixed in libXpm 3.5.19.

The changes between 3.5.17 and 3.5.19 contain the fix to
CVE-2026-4367 along with other changes that should be safe to
backport as shown here:

$ git log --oneline libXpm-3.5.17..libXpm-3.5.19
9a05472 (HEAD -> master, tag: libXpm-3.5.19, origin/master,
        origin/HEAD) libXpm 3.5.19
5448e1b Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
5b7e903 (tag: libXpm-3.5.18) libXpm 3.5.18
a5549ac gitlab CI: drop the ci-fairy check-mr job
10070a4 Strip trailing whitespace from source files
5679dd6 tests: poll for stable compressed output
7ce3959 man pages: adjust line breaks in source files
60ee362 man pages: remove .PP after .SH or .SS lines
3ba5d81 man pages: ensure .BR macro has multiple arguments
3aa8a1e man pages: make indentation arguments to .IP be numeric
854c23a XpmCreateBuffer.3: editorial changes for this man page
        [Debian bug #1102886]
b7309b4 Fix build with current Windows headers
2803929 Use _stricmp() instead of strcasecmp() on Windows
bdb6c75 Remove xpmstrdup fallback for strdup
73b69d7 Remove xpmstrcasecmp fallback for strcasecmp
b30fd09 Remove ancient port to 16-bit Windows without X11 libraries
0224b43 Remove ancient Amiga support
b72af4e unifdef VAX11C
02702c2 unifdef sequent
b4e2177 Remove outdated ifdef checks for including stdint.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
 .../xorg-lib/{libxpm_3.5.17.bb => libxpm_3.5.19.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb => libxpm_3.5.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 8e15ecc0d4..32e052fd42 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
+SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
 BBCLASSEXTEND = "native"

