Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AA0C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:42:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35136.1753083756641619245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92970f4c5c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L59Fmx1158582
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 00:42:36 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 480avgsbfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 00:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qayicvdbH4NXlvjmHRB+TxiSiKOW+jiGoAzdNuEhY507JPhjsAnRtXEIDpjgXRSSch9FsutpX5E8vPD8rguePRtVFPtDIHEgT9IVWkyFO8jzNb8HoZBalP3ClTi1M8gMbTYHu2c4unUw4R2Avkr0HdDXI6VrBZisFwF9i6Ew8XSdWWhGQ+h6No7fqdnjpHweOwvM9ypV/4/erSltwskELGCRT1MBW2ntvhrnz1V/CBh9r4F4efkHbwGE4zm57vOy+Z7WgylopzrVk7d3Af73LAcu3L2lcT7zQpkOY87cDgJXHZYZ/mDV791pmTPZJof+ueKC2IRCgSNgOguV+Ci6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXZrEXCZ5l4jJvNefVwfbRPKQbItRXEuus2ymthMl+E=;
 b=rhNXIaQbTqb2fjKA/yX4cOZ0q6lR097yUtCqBbDfXZx1oGyPUgfuQ0SyBGLaDS44tuISH7bMhmClMuxxZYpD0zoqEfOiJu3BJRDzwXX00X7uh2tX5SY1sJIXAaiAfyChVAF2NaHpWodiEi8G/a9zpMbdgWn9xg/NWk8fJ7pJoAD1KhQoggaHOmhDcrifLNgn9OEZJktDCzJLk+x/9r04DXVeflW9YKL+MSiY9nZoEz11jxy2/IoIyxbQbcZzkElyKkVX+hq2Jqk1Q7O1FeVh3kKInuaTDesHwkwz7gRK8V2O6aLnr4aZELXjYxI1gV62gK+qpAX2NUJMLtvWKpmkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 07:42:34 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 07:42:34 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2] glibc: stable 2.41 branch updates
Date: Mon, 21 Jul 2025 00:42:16 -0700
Message-ID: <20250721074216.37537-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0035.apcprd06.prod.outlook.com
 (2603:1096:404:2e::23) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5faa8c-f977-48fd-09f4-08ddc82a27c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZrBYRdX9u5LPTc5D+FD0Vj3sylDWTydH9Yozis1x0fXYF+kf5i664dkTrDIE?=
 =?us-ascii?Q?8dKbV1puCvcbTKCZbbywt/e4NQUJGZRfRxv2dIbPudU2RAYVyewrKY5fYvsd?=
 =?us-ascii?Q?c+Y1CjPSExd6OntjbE/Uih+nBA5+d/4M9AmL8ASROR618MO68M0qA5lpXU/O?=
 =?us-ascii?Q?1dOSlRSTBPA/YaUVHRrjzI77hpWAUWo2Z7gS//t+ylrDMfGD/r9IHuPph8RL?=
 =?us-ascii?Q?oMCAPmAVGwiUs2qzBqAQ/e2vqd7WpJLecgQlVGjA+3pLEtQ6vfhHROQYPd/j?=
 =?us-ascii?Q?FgWUKHMBU4W/PpIepGAPaTZ640jIMC0ovwrxrFTAtt1XrgKwyLaaEkuX2tMK?=
 =?us-ascii?Q?tFxzBEVdq+Iz2Zy/7CYKN4lemFHzV9Qad8DpFcPU79EUC/d1Vxq5BuKlXvlR?=
 =?us-ascii?Q?R4CIQ/Beos3kev9aRuBSSv9LnAC/O+1ZsBvsYMh0e6nRimNJiKLO435X/cH3?=
 =?us-ascii?Q?QzPPHY0QN6b8+G0Dn35Jn/R0dn/heD2dosVnBlYKtxfhhoZv4AZ0V+mZhFWR?=
 =?us-ascii?Q?f0M+OUNMct/4dppu6JMynehFEnynoUeZmjVjdGacbxakXZkCFdWQwC/ubRiM?=
 =?us-ascii?Q?1rANzsMR0kaLNccZb6VwggS56rTCDTmlhmnovU0FVuO0t/f3WOn94gAJ6nai?=
 =?us-ascii?Q?0nOBmqCoUoljOGVfCXj0LoAjrue00/sOyIqc5Sw2EWKGycHU53xifJeoiYHu?=
 =?us-ascii?Q?qBMPcprq9yVOlGIzIX35fPlYHqBDHJnSz6je/Ee7j5Va+xMhvXFvo9ewgB15?=
 =?us-ascii?Q?27KNBYLhAXWlmhaBx6IvDCVnU73wH9bRa3Y1rG/oEmtuyg0CSfYozacbrgdi?=
 =?us-ascii?Q?DlE/l0gpK6zn0i3ZAk2t2HNRYJ0Gtl1cKzGkiMlXWEpEhBUZzxuRbPR3zo82?=
 =?us-ascii?Q?3sI0Bukxd1djKNuwx/FkGt9v2pfgnxldqdVzKOtjVcRWAdPHG/TaTkG13hs5?=
 =?us-ascii?Q?+lYiK3c+dhqIfV8lmxm22V0BaHV0vm1RFWz2yOlX1svNvGJJ6sLYU3ys8058?=
 =?us-ascii?Q?196SaVpq7hdiTdr9CnGGsPtaPJHarRsHRZFoLQmQQtjeSoOn2GPRxnW7TlbL?=
 =?us-ascii?Q?mfIAV6YLL2n9JMx2UjR/0Rm8m7UATd9DCfgHBydvGB7/ZAAXPpF22iznHbZj?=
 =?us-ascii?Q?01bOfePm/wev7s2FINNS2hj9IADM/jYzlIB4kwDE/1KiY4vef6MM8zh9t+uT?=
 =?us-ascii?Q?YwD2zolR8brCS95ykq0/XEoDT4v24pr1UhZjZMJvK7ZOYJz3DXsUXTt2xWBi?=
 =?us-ascii?Q?YHWjjn7I4SSmaQ95863IAcqyM8AHDrIOt4sUe8QbYRU51NZTXxEvA+U8NJgY?=
 =?us-ascii?Q?aNA88sJ732LAHuYSC0pGNlZ0ItZupSr5DZvsutnxL0s0KODQJxDEStMzvxxS?=
 =?us-ascii?Q?drHPgvNZE8cYML+Isom6Y+zMb+/RhgOu1xUzSx1xnE0t0EqB7hHzXHLUaGLM?=
 =?us-ascii?Q?ayrh0mEseeWT1zH/f4rO1xKDn5EpbpGTg6gYwvRNfsKaqeYcXYXzhA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hr8Ll+9o9Q1aKYQv6bHu69DHBRI34PBDS7kZI4ArO6KpbLyqBrnhELNEnptl?=
 =?us-ascii?Q?7vFk49Iq+Fn/8SHR++eTteXp6+7Z8EIgXzo09kfbfGkgjWKTbQpfQflK1HwD?=
 =?us-ascii?Q?Z2ATKwm53QkemxTgxi7huR6ys4lr5e6woSmStk3INkuhVv/Jl9G+Wrcdrhy0?=
 =?us-ascii?Q?TjGL1O+QBEnegOsScxhJrxXYHwIbU6aobnxkxat4xPnACf2Yq0AhZrF+NLFk?=
 =?us-ascii?Q?GZKK7VM9M/c8y8x2QrM3vGtdjJan6z0ZOUyTqyny3n+r2/v0EYHvOTHa4eqi?=
 =?us-ascii?Q?MwrwMOlD+BnG1DBHFg9v+KcHnMN4Ejya0kPWVznHvXWCEzSnQTnBz/bCKJEP?=
 =?us-ascii?Q?kdv0+nvMTSzGnaDaq9m3X8KrERbAzgVqAL67zy8kR0l8VCEVS6tMHgpqZk+C?=
 =?us-ascii?Q?za5PPVc3hcvUN4m64JItYFDTt8yxy2KgBGSxjy79bZ2nlARLUu5bFhOVzmea?=
 =?us-ascii?Q?79USiwZRqsf4XYb8wrO67Wthf/Vjk3gI80MO5nJtaeuxvtc2OFsv6lpWqOuT?=
 =?us-ascii?Q?KZw1PUAeZ8eWp6hGIjn6i4u2OV07c6DgP0tTh/jQBmrvdMV8uDUbBeFAJWUt?=
 =?us-ascii?Q?Qm5hJTkmisebInSwfsBZtBARmVRFaylyAB06Oz/vQtG+PscmbsWdlkR18XYx?=
 =?us-ascii?Q?wX6BNeo4DJ9qLRHh9JCqKPkvkwu5JgEd7SIV/aE9OXjIBlAguf/854fMl8kN?=
 =?us-ascii?Q?puy19ERvE4fN0qz2WcCDx3BNaOW6Jd74q9mOQsDhJYxGZRgERmEs4PDnqw7m?=
 =?us-ascii?Q?GfROFzY2eychGGaNH4jJN8jo7cECEsh9hqhJfcQiuJzQzr11kV1Y9FoyLt6M?=
 =?us-ascii?Q?TdnKXMOBki9YXojJyCn2HcY83H4GaCw6/v0HxMPhyqM6eN8OyQDcNtoH7AVy?=
 =?us-ascii?Q?WiLRFabGWiorHqOwMcQfrVXFMfASVh9JVH/jRg4omsfpd0n2pEOZ85dqIj5/?=
 =?us-ascii?Q?9L/zvTOHhA4iS9E/4LLHdBlEy9/nxqSiJgBshnRJMQ+kSScbvnwnuJMOJx6O?=
 =?us-ascii?Q?NXgW69mKZxr5t98vS1eNXi3HW2BrTb2ygDgoiLMFosBIOAnhiDKNg9BOT48n?=
 =?us-ascii?Q?w5AbPP1XG2EugzIro4n44fVc+MovOercCHf9Ur0QHykcewzp+GsqVB1wZqQm?=
 =?us-ascii?Q?f2J2X16FItu5kfwFVR1zgQpB0T/7Tg4CkpOciwnajK7bjztiMdMkoTxjd4sm?=
 =?us-ascii?Q?FB/r/XtAHe0u0I/dcO6MYfQ0/iiKdSG72EgDBH0FpmmNJS3GLLwExpEJTMHz?=
 =?us-ascii?Q?LVF11JSgoIwUSh5F8UWUhm2/RCPXvAj4Ni/+tzlO5RFhJYS0/GmEAu3h6YQ7?=
 =?us-ascii?Q?ULCVQ1oVe0eDrNIgVZt2hZXKqXUdTAVredwWBpk8Jl9SUHcmhu5tTFMp38HW?=
 =?us-ascii?Q?j1CNqfowuFYHmUUZCTc0eds30loxTmgOiBRD9yELipZon6krBuGT3Ah6nFMb?=
 =?us-ascii?Q?CnIpl9JxSNbFh6Dq95kUKvdSqJXHd/i6WpgTiX8H18mwLI9zhoNUsKXTqVRP?=
 =?us-ascii?Q?s+qGkBrlG/GCvYKsuXsHf2MdPKdW77ePr4C0GllNpf6CHIzZGOUC8Wwh/Ycn?=
 =?us-ascii?Q?4rnY7Tch1dMba62P5IE4gs/G/sH85UwwXLer8Om5LawKa110GyKEpZIpaPYW?=
 =?us-ascii?Q?FHRm6EFGIXu2yDxKgkrwDx0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5faa8c-f977-48fd-09f4-08ddc82a27c0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 07:42:33.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rn4O8TYy8z85Wx31kCgLX9JaFu3yDOElzbrJPz7fecFNcWD4uSrnsM/BWbYUTDPDPRaD6vOPa9Lu1Mpu/mPxAqiVcJpI26RUMv7+xydrXlbM1/lpAtuTbR80Nok63rSV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
X-Proofpoint-ORIG-GUID: 9lM6RV3sZ4Wd4xbR_q41jwU8u3s4L7MM
X-Authority-Analysis: v=2.4 cv=JPQ7s9Kb c=1 sm=1 tr=0 ts=687def6c cx=c_pps
 a=vbHG32UI4TNpVNWtFHfklA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=yh1250gtqQAN5CR8qEwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: 9lM6RV3sZ4Wd4xbR_q41jwU8u3s4L7MM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDExOCBTYWx0ZWRfX75GeAdbJBHRE
 qmNEA1xy7eLeDcm191dJYovbQYIbiGS1Ot+UiuGPBqcJgvFTRwHXCAk2oDD0do+sFywuqhn69Iz
 C5IgFo2ce6zD4HqphOcFz37sA75+ubqO2OwdC7pX4Vb7qk4VUrSDyQfTRwNd+JU2+B5ONkxY96k
 JzoSbKvU6HJLTRj7/bhfFbcLaa/bT2M0C8DAxmcWSMqRJimD6+T6YviVU6DzFeOIEvjUp/+Vmj3
 QlAWjtf9RaekJvpwQWOZC9ewFIGMkli7yb0QsA7Uw1a5l+mkuO9y5Pykj/rftM1ba92OBWcFKXl
 yNlg92rgXMXDuBBm2NtkMqMBoyR3L4hIdhNFG3Y1HmZfjF1yxEr9nQmHs//gu7b6ml/uFsNeUmE
 ZH4LH+Xj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507190118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 07:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220661

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
6e489c17f8 Fix error reporting (false negatives) in SGID tests
11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

Testing Results:
           Before     After   Diff
PASS         5801      5809     +8
XPASS        4         4         0
FAIL         266       261      -5
XFAIL        16        16        0
UNSUPPORTED  164       161      -3

6e489c17f8 Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates.

UNSUPPORTED tests changes
-UNSUPPORTED: stdlib/tst-secure-getenv
-UNSUPPORTED: elf/tst-env-setuid-static
-UNSUPPORTED: elf/tst-env-setuid-tunables

FAILed tests changes
-FAIL: stdio-common/bug22
-FAIL: stdio-common/tst-printf-format-f-char
-FAIL: stdio-common/tst-printf-format-v-uchar
-FAIL: stdio-common/tst-printf-format-v-ullong
-FAIL: stdio-common/tst-printf-format-vas-double-F

PASSed tests changes
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-env-setuid-static
+PASS: elf/tst-env-setuid-tunables
+PASS: stdio-common/bug22
+PASS: stdio-common/tst-printf-format-f-char
+PASS: stdio-common/tst-printf-format-v-uchar
+PASS: stdio-common/tst-printf-format-v-ullong
+PASS: stdio-common/tst-printf-format-vas-double-F

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


