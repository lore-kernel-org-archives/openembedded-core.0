Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF476D3942B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:50:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16106.1775137809493635677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WBzPfYDF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8552e98255=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324smWn2793224
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 13:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=BaNGwcI6e
	mvjFyByS15Ryetkwj8B8Qf1wwmPy97dKkc=; b=WBzPfYDFSxTkLJMaDTWOxV+c7
	1BnZVBI/rM6P5bGX8AfEfrkjeyHpDHn9qaJIsRRgeubY0jlsSohItuW7HCNXA5Ga
	W+vzV245zUybMNx4+n1Z8aC/aIq3OvIi6KxN5Equ8wew7syU89BlK1nWhXBVwwEk
	NKMEdNI8h17E9MWLDQzHr7bLlxYB0ZwQ+gjz0dBXbquQ8YHoCJbIdFXgan7uAa0+
	mVP6v1fWB/fTVFa4LYGn7s+fyARUBsdPV/QzwUcJAq1WPbtbV893VVB39c19CQOH
	FutFOA3dl0GRS2KUgR/NUhBLWsh3aRDnLLx6Q5SJCpI2j49BW9ynMIQ0XVVZA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646w00v1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:50:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d48pKoE4D7PJp548ys1p0ghK/BusjQ/mLcSyr8O7E/NRGHF9X1Fy1TR7vUd4xyU8kRZyjGJodL3o2ssdxLTpQR3mAlo5nXNkE7rydoRcGzK1wbp9TrnplrIFP5BJAvt5ctyXv/Lahisez7xfLEOdJIEll/0Cele0anISeI/59rzFz9BoNIk3WWYDpffEetkPbuERMJ7EGHWhR6/ZV5rmezsh/TH8OQnrWb5wJ5wys8aCbIuijXsy5SYAQ2bFpoJvJLt1ibCDzwfu9TLghsnTa6e9d/dcp83nNra7O1NRtQEo6WA6F8rklGx+T3+9Kb/TeIwHhtR6znc5LdE61mTOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaNGwcI6emvjFyByS15Ryetkwj8B8Qf1wwmPy97dKkc=;
 b=mbCJXqxwC03zlP0WaPKSNkTN7dVJUPcXakK5kY6xqt881bB7xga20+jKf2z5iq7HWOdZcOrGn4k74j1aZcMDVGVczINLaZEsEzbxsNu5rtxZTt22Y2zDOqlqePP47BS1gMcFzauLChvWBV4U7Zap6sVJMyUOK5M4Nf5f2M2WQWkscCBPgZ5OHdTjT6kdNvZFCZtAy7xFVVXKT3V3U2nndNNi9CtK6l/brIySdzG8+KRKa5CuFDxmDDYKGbnkTn2ZSF89h7Twd8W7DlmC421YIOZd9LJuxvLZ4kbkuTofaZ+vBiiKw4vuT/pTly0VzVzm5DxsNXYY3i2QlISOgoitTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 2 Apr 2026 13:50:05 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 13:50:05 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiao.zhang@windriver.com
Subject: [oe-core][PATCH] iptables: Use update alternatives for "ebtables"
Date: Thu,  2 Apr 2026 13:49:59 +0000
Message-ID: <20260402134959.2559444-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 6175914e-6a4f-413e-c3e9-08de90bebed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	727oFv9P427086jkVpv94MsvR7Blc7MCDY0D6q6OqINPPtMTAZKpkqabqr2HVoKmWPMnNYDPUI9d9PbZcoub3ZsoPzDlwfF6G/X+Hjsqd9AiJ2XcBzYBFhai/Bj0kqy+AvusFp9S/vn+xfFvr4OQpWTnPhG7210n96H1YVHYVgAiVeNimp6kRZibzaGWSa1gz9M0l5dNOl2RYX7MfE917n1yOgqWGzwOlE7apxlpelaQ/kAQI71F/svpiozwkyrvGxEi62VG2yajCctpVq1AUaYEb0CtrtNjqGPT/2nopqU9z9xyVwjP3qN26mgvATr91N0yjy0y1W/DWHCeqnNVFoG2rjDUxQWZZ2n1owtOH8M6+cGo84pKIK2aPl/yaKINYAeZh6swz7PVySli7nfCkcK3axO4XZQJjvoLas5Ho9WpyWEC8lIuaZDFfPRnf2ACgtF0Gg70U4E8pSzCEZTB3XPzVMg1x0PZL3zXdHZ0dyBdp2+RVtiSC7X/Yi3wPumNyGBGqwbVAsrf9+V0O6ufOErvoMyyfkB3R635HYHk7mRx+WGkKJxu2lhyBhAuvSMJHsG6emgqWFK0cR3oQt48L2X27LthEF3hTCaLTicWth4dKKfbr5wKZ/0OweVz6B0zpIekL/FvU8LIkpU/aNi8ZDIhd3N+YwfUM5O9iwndevwPfWHtR9CByf5DBBGrorFr1kdpKlbKBYJz/Am5CwMSy6J12ljipONIaCH2wKw4NIUrfp42cYCG0oE35LGwswf7aqcvsBWAwTFi3A24PMQuTnj9Dq0gYpVJkk4pMrBsOGk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+uoBsXM1nMp37pUk+xNpXw/lfv7IDtMw0IUVox7xTXm32gfjP36f63Gven6H?=
 =?us-ascii?Q?SYc3vkh+zaPRhE5eM64HqQmslFWtKSt4FFLgTqr1JdKcBwQJd8k0TX0gxn0J?=
 =?us-ascii?Q?nNzyFLzkkyB8p3FODR8wWHvLNOAp+h8C5xWPc5EzYUb1V2Bgl0Wq+VqBM5UH?=
 =?us-ascii?Q?e3m6ecbPE+o8w/2fIkxqygpt4xYZHPsnES3fd6pPAUKcFd8l0GdTdxd7lwRh?=
 =?us-ascii?Q?7Zhn0cnr2QqrPzzBSBDgbobH3d6yrtgFStMAuJiBbO8RHM6rLl1bwqknjqif?=
 =?us-ascii?Q?W2Kvek7ujXaoeVVyEXg7btmOVOdpzaPuIpDHvmQVAHO6odDFiJvvgRd7OB8H?=
 =?us-ascii?Q?f7L7+b5cVqfZ7iB8Wry/Zy6BZLow9O3dGI47ia80gRKWJ3eomAm4ohnmR8/p?=
 =?us-ascii?Q?b6WTGsl4T8Q2OzY8ycvIDPkmqi71FnwvL67n4HVx0L67IQrfYIvcU+FF/3pG?=
 =?us-ascii?Q?Rhfoqwr8TGZzl4uc+PsbF9gTbOSG4XwMjjVJG77uvFoRDurzgyEytUmeDkHg?=
 =?us-ascii?Q?D2bgjMK5fAqCPyjQ5AFlewbu72kpv9DritgQ8aIVdeqm1C/CVECzxioCtD6F?=
 =?us-ascii?Q?25hW8NP5JGSDlfkdtpZK8hagSV8yBhBahbIQtJm3hIem9nrG0x5JztbV7Hxx?=
 =?us-ascii?Q?k3usQW711mnMnWW3ouUClNJWXHAtFIuTLa7Lg8eYyxwuB0TeviF6IOCQlSU5?=
 =?us-ascii?Q?LBoYFyrEhF6htrgLsOzbGf1qw8PQ7qtX69mL3Isqs0DNOEPOLIf8bvvuEgV5?=
 =?us-ascii?Q?+vrHct+H924PLfiO4uLhTSNsoMlwULNi5c9hpOFrQbja/F2RI6tpjUcgtXTi?=
 =?us-ascii?Q?SO4pM/1HwhxjwUKJ970e6NMVb2XG5smbIYTSx0duiZXUcEYfSHZ5LGoWWGhq?=
 =?us-ascii?Q?5T/5sUtgN7FhaZgdYcu4REHt7spVulNMv56ICnIN/Y//FmkdJ3y82Pv9wQXX?=
 =?us-ascii?Q?eiOy2oF9ocxzlpqA9uwuOTkoDbyrz3uLHsb6klpEaCi/wzkuQU0IYNVKieKX?=
 =?us-ascii?Q?artpgw08vRzHbO7PmNsYe4MWUJJad2Ux4GImFXBnNRWzrQ9iOxONE6QWP3Ac?=
 =?us-ascii?Q?8zmJyCqv3aBHuvmvlpyazO8Mcup3TBSiopUPDpCKlOfjjGXV/E8pb5X2RCAf?=
 =?us-ascii?Q?ES/Ea720KhIGAqaHXWYTe317AMJRWv9lCIhYPlfxPrNIEfmn9QeSXTnMVMfH?=
 =?us-ascii?Q?Qd3+nuFoL/JbpKCBxZ3+Gw1P4pmh07PwAQ3qeZ4fBRq0rCOmp7pXdj+Ays76?=
 =?us-ascii?Q?Us1IuM2NTdGX0ugkU5pFUY00cdUk8FcQs1gjknJMWX8NJc90prlg+slm1R5q?=
 =?us-ascii?Q?atTi61MIRNH3ZHObKQxJBOQnc9Z+vJm0OtZrkMVtUcoZav+z5HvBG8RBFmaZ?=
 =?us-ascii?Q?rn6GMOlMdiYkc99HOAiz4yCY7MVBtzseZJvvQ8KtVqc83q7AmoN4+GobMcBq?=
 =?us-ascii?Q?LvrT2xSygyGdpwvEEEcJC/VwjwwP39lPF2SlGwFrMgT+gk8fowjRPlrPaZr9?=
 =?us-ascii?Q?T1a9tF3Via0RPkHgec7xMtyPvBTqQlJsO6gq3hoETzsNndChLwBRCA1FwqAS?=
 =?us-ascii?Q?PacbC5tRi0hUOW0B8U5ewGk8oLXsIFHLV0fbNtZEaSGOe18F6B3K9RwIjmXx?=
 =?us-ascii?Q?/pac+kjE2+CDs6yeNUhtzZQkzSIcJaF7p3O2UntTrWhGtqhWFNDp9cNgXcuc?=
 =?us-ascii?Q?G32xeHEKLVhGvM7sQuUSaXtCe3kcku44oLl9gVOTMvwVptpaVnIwGVpiX8iU?=
 =?us-ascii?Q?ETaVgYrhyCx7JBK1imKm/jng9KIV9Sc=3D?=
X-Exchange-RoutingPolicyChecked: 
	NoZdbg7iLZF3qhkhDTUirF+VZVtOUvbJYiD++Y8V3LdcxwkQUR0reW4ckWvw6fToYIVFM8UNXjTddGZ2OvqI9t1YHfg0/rzkyJN1gqSI/OQIK4afRhDGVZY4qYRYB4RH4vJsC8233HVNe6Lzc1HV7WF+rOMeEx3X4ibgGuwzlrKll14CJczDJIcn82f3Soxa2fyjG8blzzn7RJK4IpLe920X8heB49u/9SYpANedr8tPknDu73ZII1ESG/Kjkc6UBMsWCLi13eeF5d1rbFnHEwRQFdF295Kh9s429jOu7ksK/N0JF1vAkUKnR4Rj2iAmNwme8Ze5GA0MydDKILWBkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6175914e-6a4f-413e-c3e9-08de90bebed5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:50:05.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Wj/CVOlyiwEuANx04tAE9uptEr7cHwshQeWB5+VDmjKC980waOZwR+UiliJN64iMWXBVz1pPWgmLYl3+0mDjJbp4X9YcBeD267XmhaK0UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69ce7410 cx=c_pps
 a=BzYQZFXHgS3DonsPiq/7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NbQ8Lc32ByzW4zsrGy8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ToBbL-08GmMFOjEk67jHsGNKsycKq04k
X-Proofpoint-GUID: ToBbL-08GmMFOjEk67jHsGNKsycKq04k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyNCBTYWx0ZWRfX4tTdy2oHaWsh
 HOJRqdhqEpBOKRKRUNFfQyse9jUtezlN8tCZhQuktZzZdkZWxZ5cBXgVfbfJp0f1+L5jjmDtPlb
 CPsVfwMyuPJyw961t4wTqae3IXAIOHwtZzCzevTjwrXemzrqwk5PTIXL3eLpp8/IWbns2Do5uT2
 AEq8vahWs5GEmhLk/Mub/5ifMw8CHgIYThGnz/Bh2Cw6FakfI+s3Px7oNsu72PR5l28Et5vhf7+
 2vAtDZPDwJQuy3qQ3aTcoWY6B39R0xnFr1uzD7Pm/xTFBUB/uyj99eEmceMcjTlKaSzQu25JrFz
 G2euBg0A8NrVfsjQCWBO+5A8vATX4OMSmHO2j7sDbpFzTikPFWB+KWGCyyUBILmPK78XPCDRtyu
 whrou520i1cGDpKTcsDcOs4BmZHRhNPB+eptfPJSyGHOsdHofXs5+4ESBLOwf5N7eRTCTnwwQaJ
 JEDol1JSfxnGJX9Kv4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234527

The ebtables utility can be provided by both ebtables and iptables
packages. Set higher priority for the version provided by iptables
to prefer it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/iptables/iptables_1.8.13.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..6319f3e520 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -21,7 +21,7 @@ SYSTEMD_SERVICE:${PN} = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'ip6tables.service', '', d)} \
 "
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd update-alternatives
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
 
@@ -122,3 +122,7 @@ ALLOW_EMPTY:${PN}-modules = "1"
 INSANE_SKIP:${PN}-module-xt-conntrack = "dev-so"
 INSANE_SKIP:${PN}-module-xt-ct = "dev-so"
 INSANE_SKIP:${PN}-module-xt-nat = "dev-so"
+
+ALTERNATIVE:${PN} = "ebtables"
+ALTERNATIVE_LINK_NAME[ebtables] = "${sbindir}/ebtables"
+ALTERNATIVE_PRIORITY[ebtables] = "100"
-- 
2.53.0


