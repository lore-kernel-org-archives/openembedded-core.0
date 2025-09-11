Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96E2CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:59:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44680.1757591942923379047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YVy3onUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134958df65=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B6upaf2424893
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 04:59:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=6QXAHbt1T
	2vTRGQ8qXIxfwF3k9R1r1XollB2FpdLkWE=; b=YVy3onUjwYAQ//hfFdPpFAs4Q
	bWoNu6+oDFINDwYFxoB5+VEn6DsdABb3L4JSjJIemMXItz0OlYJfr81XvUYfSaAE
	vkrl2aV6OqpE5gZlO5CCJwmCv6LRifzFH7vd/NOuJcEpLV2xKVpX8UHbwVmrA9Ki
	174rLx6rxzNt+/Np8DwgIpHiFfaM6xC7d9b2HzznvYgnEoHFclCjPB3CfsesBDE2
	yQOBdX+bfQecIpMnS5/e6htKM7KgPsewmNmQUsgyaEnK0i0vqek/OfqbHl8Q8q56
	i88hBWZKUhvbic52YvUmr0dUgh1fqsy15pem7W2SSsYkJoZhzSAfkpn2vlYsA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg5ghx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 04:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9FMUlQK8I8+3aOLYFZFtGJPD3Cos/V+WlF3U36LqXNUQabSGzoRu46H8adxfubGxw2gOlIW30WbFr7XILRTYLdhynbUv+QFT6Ar6morUVOOu0J57hmgUE5AO83k8ApXbNTBv4cUzCSRVyvCHKi4IvB7Po0wznO6yzSQCWBZttkuHcE+qGV3J48fxYiG7XRcec68FjORvCPWRXRSKUq8iRewySzOFvSY/wWzarUGXK6/qeizdYXdcwl3kuW0RknqHdKebKQyZX5Xg2wFl/bv4Xh6zBuqFFCpoon+wsKmwCdeK7/JNti3DWC0GPzb3ngCrsKG2IuAHMM8/QpVcOQHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QXAHbt1T2vTRGQ8qXIxfwF3k9R1r1XollB2FpdLkWE=;
 b=P6tPks3mhZWkJqSFwpli4odpcBB4u03D7ZYkLAqVzIEaUdIZAppN6piHtAYdbavb1FQ55S/Qj303rjZSDWveupwQTTyRP6loL1019YB5nMiJg9CUph2eF0oOcF3/Uca6SscHCJ5J24axFum9BeRGUGcPs7E/m93jFwPC+X8sqUggnKCv6ZuxqL1bUfgQkuk8e3kcWFuwJaOzTp9qYKYsmeyd+MrxV+e8dbn2J7AIQnvug2mWN6HowOdopx076YKY3Zoii2+Fer/xjQL6aXnmnVjrViYqH4ff8Lb9JZhEf4odckHht7KfuExI3FRHpFKqjMI5gyoF/ZqxEtpaz9gOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 11:58:58 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:58:58 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH] clang: drop obsolete patch D144514
Date: Thu, 11 Sep 2025 04:58:35 -0700
Message-ID: <20250911115835.1885519-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 865a699b-ee77-41fd-d92f-08ddf12a9745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H21kQX7igNUinKvKx8AKcuCfDqqQ7uZd+rDGUXNOgxoAN5JY/DA/Xb7rdRK1?=
 =?us-ascii?Q?RN7oYsrjdR3OmsCjOiQYgsqD880/FBK1uYhhI9pEs84KNhgdKK9aVhXA2i4f?=
 =?us-ascii?Q?bRLAkZDq4cBDIJIfEHV42V81PWGQ7zWlfkhu3gf4ejjLKeQiF7w2BlYkXnIj?=
 =?us-ascii?Q?UQwb98IVbH8/SHtmai81hhpZ6NTTCsN+dV/JO3vx41wNpaUdGI/NT2xrplFc?=
 =?us-ascii?Q?OsKD/cx+W3WHAGePCpgxEHPoy5sIoeblM6DEfE1VE7MzxB40b/jSeMiolBB8?=
 =?us-ascii?Q?CaN+PYR+9mjYLHlB7rOb7ap2ct0+0xz75aEDnRhARG4MKSHtCHe/hQzvzllS?=
 =?us-ascii?Q?XzKbSojmYDqUser2CibSBSwS5t8JOe0r05VErYZqf2oDrPTnHuq+3mp8Vspy?=
 =?us-ascii?Q?WJRitVr+xIkjoIc+1ZKXllbKzkuoMAk2B4FXX6MnyDjbg1wgAm6SdoXQbY2R?=
 =?us-ascii?Q?wX5vhCTKykVfspDz+z6QCdyv5Fulb5kyaZK+RmZNcOkM7IybDbw3SCjP4lZw?=
 =?us-ascii?Q?S4TVsgDuVEWqO8ZkfbSu5fGgTr49EoWufQ5EHcmh89FwP5xv3OktEEqG+Qgt?=
 =?us-ascii?Q?pXceam2P0/keOO2OSV3lx4p2R0mym9tNkRnJzEZtIXHbgqNjono7P86c3R1B?=
 =?us-ascii?Q?cq/CJMt22t5EA9un5peK2ZqF7Ptv1oPBpp//ITOA9eqwbihAsrGCRm0bPuLx?=
 =?us-ascii?Q?/PD8nnGSqbrBp38487VsuT7fmWYKh5Afz6JUPN8tdHI67tyWW5zG5TdTPl61?=
 =?us-ascii?Q?fROUWwGGMa8VkQC1fajYAMgbqNcag2GPwjjP7BBUm3NTVdNWz2Wc1T/xew9Q?=
 =?us-ascii?Q?C6y+FiB9qvy9vD/ozAntMajnQJSH+jfnVGFPqE2DtVxQg1wCRS78wdTzWQzD?=
 =?us-ascii?Q?TWFPCjd5SPvNItd0E5UIKX2Y68eUzJNh6wKGtwJRwNG/oxByh0dh0lyzeUes?=
 =?us-ascii?Q?F73T9bcWTu8W/WSBYclGjCUInO9uKTxyK19It4CW81RehsMvmO0ubXE74Tqa?=
 =?us-ascii?Q?sYWJsg/WokHlo2J8taDYYnp2UkI6DsvLtiajnRl7GGrvYc5yb5tf/9CsqHkH?=
 =?us-ascii?Q?jGdF7ukRYzGG1cNSAUEJX2fX7H72BkxG6E27uw0Kx/4+7k/I5QtOYiVmtUPF?=
 =?us-ascii?Q?CqBZngorhaZh/QqzNAyeFYXSHuIZh8XbxB2HlSePswsPMmgTuGXRYIUZyP8K?=
 =?us-ascii?Q?Xowy5V6xoYJclXLye0lruS+kzxBIROxGTnpRc8jAwe3XyfQm2/sV/n3120tO?=
 =?us-ascii?Q?PwlPpY0aqxx4Q4VkRJJsfwpl89vo7/FdY+8HqVLZtdtXIbxaZ/RQIUlC6+rN?=
 =?us-ascii?Q?o0zvSkQPibfLrHdbRW9tWtXiOy5B3b+aCaoa8PqIXh1SKQK3B3cxKLpG+/jN?=
 =?us-ascii?Q?dlFKtX91QuveOeShWU9TSdw3kfcfcOa2068hzYU/bbGXQFonmbDdZV5vgWZR?=
 =?us-ascii?Q?tZ48B1J4iwI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOVbpaNdGHM3bfPotZVvy69RvkCaaF9QBG0vRAdpHC1WaWbrBoTOwSI4T80J?=
 =?us-ascii?Q?VuhWNe6sMneLUbJN0xHnkbJkRMpBGWO5QONDe1RQdQlyrcF2SO6SQhcpjIk7?=
 =?us-ascii?Q?GjUjgnClMRtplb4v0j8kBHxgyMzzWofdiGg1IcOFAPJtteivhJ9j51Lgxt33?=
 =?us-ascii?Q?Cg4cB2x2j5Q2lt+bO7g0BAEkoYKCsaKygcTaCISQ8RXB81o80/aBhaZAozum?=
 =?us-ascii?Q?gHEez++VSaam4Qsv3DXCJS76iEIrH204l5Hew1ZtYh+c0LWoyveyid0YtWMo?=
 =?us-ascii?Q?zbb/PVNDalp2qSiTwu77xhpsPmCNKohhqypfJAPJZ6GsKg9VRASl3XYxtTbD?=
 =?us-ascii?Q?Kdon+E+B/Zj4t50ACibTyhPzcJPC8Wn0olJle2w+7FB7io+CwrCkDrbOMCNd?=
 =?us-ascii?Q?XvVGmiuKrqoWcjcyHEC4jURMFcB6boggnWODBQfeJucADAFLGlr2IS8ULx/R?=
 =?us-ascii?Q?CG9VmhYfawEh4Yq03o/jVG0wxcpNRssYA6ESne8zGfv4dQL+vsSIfGBFnMNj?=
 =?us-ascii?Q?QqaKl0g3GbBDlIjLoU+/q/l7+XC5YwpwygnZtnvkqZC+kRcuyOD01SjMJ+88?=
 =?us-ascii?Q?MC+mAvHWXa4x1CoDGIPMoFMu5Y2grcS3+CgnU96dtRUM8AoV+ikx+2i05Dxg?=
 =?us-ascii?Q?oON52mDF6KXUp/0ZjVu5by3Q2CYyJn5PZF4VPfJebTLusxjnFGSOKlk2ot3l?=
 =?us-ascii?Q?FfUVnAg3/uPZbjMfuONxtkDSmFjS+zBBAMCVdCB26RxhcxZe9offP2Zk/4l7?=
 =?us-ascii?Q?zCaknX5z9Dlqk5LojLP9E7+gd+Zg6AJ1lblLEr0GGiq2B4r1/LF5lrl/1VJA?=
 =?us-ascii?Q?o2PvXmUWSc9YfxpZeI1CaU9rhk7Q3/83BEiJ8+lXlS2lqWWVFef+n16JilkP?=
 =?us-ascii?Q?nE4e0AKgMozhMYVxm7/mvAuuLgvdY8HjMncI7fRP4By7u70bmgXiUe1Zxbs3?=
 =?us-ascii?Q?7VM6wkRtjdwgkDYPfZK76JYrKuq13XpExVKmetbI/6QHw1QhtyCchP+kGsbL?=
 =?us-ascii?Q?kgvD21tnGl5Y0muLI87Dx0dqx4WZow1OgaJF6MGKh+VI6CcrWDM99BdRBe5A?=
 =?us-ascii?Q?pmjphv8E+uHwx8Z58CZQwTZQ8QoKgNJgKTTLcrpOmZbJJSbUAoSnSoC0Swop?=
 =?us-ascii?Q?XCkHkvRT1nctUwdAvSQomBfhv7T4KCHd1A33LSuFHi0knMR15xBirTUKiOhW?=
 =?us-ascii?Q?SFpCXVKonCTaXXKCcskPXUBHVa2yRO+4TE2MNh9BIh/XIahNE8IEjOEtm7HY?=
 =?us-ascii?Q?zSj/n+1rQDcgwpKbB5LoC5CMNN+h/d5H892DQqy6kJtB0AGnw4tKN1lCd0Kk?=
 =?us-ascii?Q?g5782AoX4QNgXILgrKG92uFk0gsvwh57LE6Jj9UeWprcv/hBpKlD2F2vzOkF?=
 =?us-ascii?Q?oWrB4Yvpd64WZ90J8tu/6oU2vTrHmmNj+6rGaiPCaHRgYbNKeNpiA/1JNMSu?=
 =?us-ascii?Q?DNYWJ8YzpY/iroFOmwweY7t623/WRwsqo80nqQQmyMQSlhh8Vh1K9bc0Lrzq?=
 =?us-ascii?Q?Xaf5G3qv+cl3zfIeiFV4WCcWf3bwRfVwQxwnGTZ+wHk2nZgNUwb4BD5ZA7u+?=
 =?us-ascii?Q?wkfHbjUIUwhJctXrnlLzGmlY2Aq+6p8TuVmzoIotqHAOPivri5CtqzUjY3c3?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865a699b-ee77-41fd-d92f-08ddf12a9745
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:58:58.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZDkaSVCYY8KWyesJuHEr7LM6xSe1hx17kRJsh9ghq1b/41iKI201IJ+H74bCNgGRgnUd9cM1spx0lx7C2ZH0kRz4DtctFWh/StGHE2iFwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ejItmR9tKhwGdPdgQ_VjxHFGeDMXHgCB
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68c2b986 cx=c_pps
 a=2ZhrVSxr2Z0TF++ySTjl1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8
 a=L8c3rYF_AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xkwFmjEnc8sS4PPqdsEA:9
 a=-74SuR6ZdpOK_LpdRCUo:22 a=fIG3WuezDERHtS0lkNdW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEwOCBTYWx0ZWRfXzR5GdveoXdVY
 vRbkYhzFExQq/aOjWxFBDH6NCRjHIi4u3dGeZHhnU1lgtdhQ+VGYGoWxrWJFM+Pg2JTv2BFc4Ho
 6w5Tlnl1r5u6ptAa7YEimitgAjvrPxNhDZc4jOM3vYw5KcCVTze8UQUBQZZE5cgZKd5sF/xxAJc
 hITOY2KPeXvuMzTN+OlrNDyTxkiOXaRyMb5UyyKzeJgu6TzZNNRSibb7p90WsyFR3RPm3euTuyG
 kD62Wz0VmFDWrqa1eNMBIyOAN2FHVhB8CyIG+R+///vBllfQmfxDaSMMF6nNo8MfRvVfr+5FjV7
 AYOeyGVVtYLUYAZwoyVYWb9kJh8ObTH249Nagw18I+DfM67DESlBBJ3XLMD1dk=
X-Proofpoint-ORIG-GUID: D6iprqwdrwusYz4p5RLIkJw301h8bAPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 11:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223271

From: Sunil Dora <sunilkumar.dora@windriver.com>

The upstream fix for the TIMEBITS=64 error was committed in LLVM
D140812 (commit 26800a2) in sanitizer_platform_limits_posix.cpp,
which addresses the issue for Linux builds.

Our patch D144514 (#undef TIMEBITS in sanitizer_platform.h) is no
longer needed. Testing compiler-rt-sanitizers for arm32 also
succeeded without this patch, confirming it is safe to drop.

Upstream fix:
https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43 -------------------
 meta/recipes-devtools/clang/common.inc        |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch

diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
deleted file mode 100644
index e129aa245d..0000000000
--- a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Feb 2023 12:46:10 -0800
-Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BITS in
- sanitizers
-
-On 32bit systems using 64bit time_t build fails because
-_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
-
-Fixes
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris.cpp:17:
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:
-In file included from /usr/include/features.h:393:
-/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-    ^
-1 error generated.
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D144514]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-index 57966403c92a..efa83f30eca0 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-@@ -22,6 +22,15 @@
- // function declarations into a .S file which doesn't compile.
- // https://crbug.com/1162741
- #if __has_include(<features.h>) && !defined(__ANDROID__)
-+// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
-+// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems with
-+// 32-bit architectures using 64-bit time_t and users passing _TIME_BITS=64
-+// from build environment, therefore both _FILE_OFFSET_BITS and _TIME_BITS
-+// need to be undefined together since features.h will check for both being 64
-+// if one is set to 64.
-+#  if !defined(_FILE_OFFSET_BITS)
-+#    undef _TIME_BITS
-+#  endif
- #  include <features.h>
- #endif
- 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index cbcc4feded..9f8daad9f1 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -46,7 +46,6 @@ SRC_URI = "\
     file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
     file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
     file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
-    file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch \
     file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
     file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
     file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
-- 
2.49.0


