Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3168C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 08:10:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43975.1752739801626550052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 01:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92935aa50c=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H5t3SD154494
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:10:00 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxjtuf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:10:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb8hzslQYq/bqZ+Sz2k6eHP2jmuI7ownq08D6Eg3Dk8wJ9SzW7ghajTjtGDYZqJ5K1wEidWcRoZowICYxhP/pfjYv1ZyiNIJY8lj24SrW3iKlMZRLeS5PRYQsaKgcx9AMqpZlDJaNWNEPVMZ4n4paW3ncJddIZAD5z4x2OuXzV1LIT1rKoDWHd07ivtvdHBrvrOsfdKgT4eIK2O7E+LKVqDrEwqrpEXHZTJzApGZCpKJbkv8ORAueiFUtx0aJ0gy03D14oBLTX6FIyXBImNh9ag1YAbKnp84ptVdHs+756Gaylki9HULKrTSadGFN6IvcXC1GSUrTO1Xke6w/HxtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee/V3fk4vZxiniKv2iP/dIzJeY1lzaM++YcbGcxxui4=;
 b=V2hwRyypYRdHciIX6zZa4uRelNj/lJrKavsErkJCVDHUqMFCDNEqozKiSz/Sw54cuxFtHYDakUbX3SHquWblan2mDvfGpEz2US6B1PXHcCvDG1G+L1kt8tBhmgZolkpqM+i6xZJ2JGNLrlLqtYeAUFYRQTkILvyaCIIX6ejKWr2DY+CZL2HqA6BOO/jegXugfUbpm/kClpsuJhnuVSOb1JBgunABI2y2YAve0etFaACnXOqt/tw+yo/4ZtG1f3/rcjAg6PnKPrBRXRRVmgR8FLO3v3kJCPdr0T5taIGKEa2zSEShuEeMfqhAo+wGNLAoo4YkBT0G8+Jzkmr4kWC23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Thu, 17 Jul
 2025 08:09:57 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 08:09:56 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] runqemu: fix special characters bug
Date: Thu, 17 Jul 2025 16:09:29 +0800
Message-Id: <20250717080929.3619031-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::8) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ece303-0584-4338-c6c7-08ddc50950b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SehOpvzxClU8vYd63NPT9ILrNFy+7rVBYXjiOpUN+NyMzfzYPdc0TvbkwlOp?=
 =?us-ascii?Q?oKok+/e7xdz/cAcJmY7JU9k6WFuvEAYLt2CSY+JPaQsPo+mgs6GngYYu2HUI?=
 =?us-ascii?Q?5e1qNLYMbqBioyGMkuf9Spge+ka9qSA1IKXhiZ8pmJgtDYBHiMx0JIYG7iuQ?=
 =?us-ascii?Q?jKaC4g8gWIwRNoC+Wl3tRcsSJ/LXnJVPAddpj/w5nXemBUaWIYfT6J9QA993?=
 =?us-ascii?Q?noNM8YQC625XWpx9AO1PryBno/u31gFn9uDujSOGIrJStHiHlRPsZoLZLBZY?=
 =?us-ascii?Q?nNAGdjd1j0SoxICuP7uGTp7UFTBMa0mfxIPUL2lnKNGDP5O9LHGqYQBzF+19?=
 =?us-ascii?Q?cr6EM/tNccabW2XCXnSq9jSLgPWpCdtSNLbmgJds/YlAKLA6pN7q+WTzxlZc?=
 =?us-ascii?Q?VaZ9fJgoZmb27JNFphSDMvGF/FP+S4ljr8wLpGYAw7MbzWv8U/2+QoIphTnI?=
 =?us-ascii?Q?eMGIgF7hgN2JEM0/BpIk5Y7fGFPdQBnz36759BQs+U7Eje9a09mVHIN+dpa3?=
 =?us-ascii?Q?l9YuedqIEss8Lb4FK7li4dMdrYoc1z1ySA2UKUslWT8BknXYJik0P61mMtVX?=
 =?us-ascii?Q?IB7ObRyA3SPMP1P8rCZPrr8+dZrlLVWtxxwFdMiIhxiy691iIVG50gkmrzoH?=
 =?us-ascii?Q?KXKwYljQiCPoIoXMrdqLNJRoGFkqEwd2HRdHIPnBLXS+uI/nljRGCbh0zLW2?=
 =?us-ascii?Q?xLoWSmY/EUjFeWjMnnymAqpmIwP7Y2RgH2Izz7AcfJ4Bo08q5o8Ye6OMjkQV?=
 =?us-ascii?Q?dOMWLVU+3DyDD6PYd9PS53taaHBeAs2iF+wprWmZrAyiICb4OgslgKLn0/6D?=
 =?us-ascii?Q?ou+b/CyQ8sELXBFQbNhsiQE2FsEKmd5uuiBfqPjVmg+FWrZ/UOjh1J8kdi5a?=
 =?us-ascii?Q?ZoY+Hlq/uvaMCdxrrqnQbuJu5TGrA+iA52NA6SndPWOWm0KFRGcdKRcD9AJv?=
 =?us-ascii?Q?cl8Al7PqY7AJcxzbXB/Ay2B796rMebL4hUXBxA03aDGTSu6QILCeu0qoJnAM?=
 =?us-ascii?Q?msUdDQyEQ4sGl98VhDZ491ixH6lHggYJYulwFj2+bzPSCeCGCBSXrVtMituj?=
 =?us-ascii?Q?tT5RP2VyC8KBWDGkEbvG7CKHzx4qXAA2bSYt9fh9Kisv2T/X/lt/wMv3+lQR?=
 =?us-ascii?Q?hAauURP7P5Zoe0Iy71gn0LTMmZ4V2lpPTcWl1F4vLouFM+beq2rtHu9J3LM9?=
 =?us-ascii?Q?IyxzDwczpbsM50jNkPGc+jT3sjUOv3HKGwVtnLpa64l1jaS8LkXEZWvpCnOn?=
 =?us-ascii?Q?fpXs3N1NQocg0g+AjE1Fc9rRjVF3A7CF4cHexEHcGjzIzIE3QtbVKDMrBKQd?=
 =?us-ascii?Q?VLexL5/ut/Ks9ToKfrV5rIMF1Qsc1/hvckIt9aPHN6aKDi9s49Gd+NzgFYF0?=
 =?us-ascii?Q?mn+VHYgAfKV0AX93SuRoQdqA3qOMyfLGd6bYcbkfkiBfE+VQnrJHkSnlzSzd?=
 =?us-ascii?Q?iTOcDvLn4NNvZNLJsSLlH1X19FdF7Jbt4Dmmzs+aDo/o8M8zDLp++w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8+h31gnT4aWb3GdVxRtB+M+hlh24Jqw+mNhOH99G4Wv+ofQxaGJtRMG9dbp6?=
 =?us-ascii?Q?tsj2lUN+14FXuhIadxmcXbi4u+Qml12fqZjTPPG6FFVnPwgCGcaAXbKquCPU?=
 =?us-ascii?Q?md/7qgoCg5ssFR4Y8tfhNHJwOcGdiv2LYNIStxv6/leKj5HIikNmGwbXmlqT?=
 =?us-ascii?Q?SbUQkmWSnPihiY2H1ZQwzJLSU5nEwVi/VUVqluCF++9aWHU/feAU2lO1CSam?=
 =?us-ascii?Q?ptMh+RoHGDSZp4GSwH3KbdEIcnYAMzWtwL6TLDRDnnZBUET1ZsRWWJRkldP9?=
 =?us-ascii?Q?pI3G2jLh/PS9naa1h3lKHD/la1Jo7Hc4o2o/NhpXoLCWxHN9Lxkv2xrKzvPi?=
 =?us-ascii?Q?mk8sX2w1pwWxQ0C1c/jwjJgPEsloLkGPJ7ECFPQze6RHJvFQFx8D3SfeTNn9?=
 =?us-ascii?Q?ju6LQYOEP2fzBMS7EDrmhY9ba08jL8s0wlUdArWLhhRxtjObJzNaa/Xz8sgX?=
 =?us-ascii?Q?eCIG7pEsKTtG8v5hoGJa6NNMCbRTvbAFCqi+iF3jXxrSCh0SfLsvCNMl4lDP?=
 =?us-ascii?Q?Ns+AWS0U5kPOWHyZskWd9PCA9YLgauh81XbMEIDfPPnl5QR7aYGG7GUfLzIz?=
 =?us-ascii?Q?0Q21L9M4QHZ3HZZvQJGbySVuETEosyOTtmCMPwNvYegLCy/csrO+XY10elts?=
 =?us-ascii?Q?M0pK6WUZhcpHK/N+ELlnUPx8JyjqbJ3X0Cb2Xz5XJdVzim1+QP3iLUebv+Jm?=
 =?us-ascii?Q?CpdjLV8u+wEu9WRiZF34ovwIko0BJJwJC9I/6RGJg3jCnZirNFBAL7e72nQL?=
 =?us-ascii?Q?28ng1H9KwUMFpDGaZoWw9BeY+7Rr4afgdCrwcLE3RnYUdTQry3MdrDGUvdJE?=
 =?us-ascii?Q?FzbeJ+PcqFSbgIJyzkqHI8R3LVRpPeb4+MzeKO1SCsb0HCp1oFj5Y01XGwBd?=
 =?us-ascii?Q?gvVYYb0g2c9dhFQGfygL2Ke5J1JoNTM3Eb6inr0uRgHerG7gXmIGys2rNC+m?=
 =?us-ascii?Q?iXuItdLV99OhBuDmUsxG1lt2na8luALaFsvmOBvFfQe+Rl5emeMzZQyq+fq5?=
 =?us-ascii?Q?wa1NBCASdJd50lwV3ZrtLFr82mePu8TwQw8HYDFvSabxf1BWddJZdkWyk4Qc?=
 =?us-ascii?Q?eImx60oUO3gRgUjK1fYw0hCfA0OlN+qqx+CXbnOkpM8iYAZZIxjMVyDUsi6J?=
 =?us-ascii?Q?5VJ5Kta/6h0EeA3yP3RcTwjaMqFjnAdIUz1dHs7GwJyWzZGfxN6Gp+11KenA?=
 =?us-ascii?Q?cG/DwXfo921u+Qry4fLrzO4Kk1oMxe2GToIG4Y8B4Ae2CLjFbZNeOfooFhjv?=
 =?us-ascii?Q?9WTERdgKGX/5u8UpGWxepkv09+lCRV3ZraF0rQ7X0XGgHdoM0KYB2n3VNSwe?=
 =?us-ascii?Q?z9o++q32nUw9ueky8Q1W0uXXkxgnb9OjfqUs/0Zqq2ercclgh/wbbBj9x9HF?=
 =?us-ascii?Q?MtrxMuktjDG//MpnuGYhMTgXbDZ45LKvnjMld8kFLcOjLbFkUN+ga9WIVIoK?=
 =?us-ascii?Q?OrVU2uGY8vL6GC61725jukZQqyyfxLh47+5VJL6jJK+fB6Erl4zzNnJg2Lmq?=
 =?us-ascii?Q?dhbWLbpnqYu7KQfYlrJrILDZ8DVFkb4PURlY99dpXjD/1PpsSnIvrV7fAiZ3?=
 =?us-ascii?Q?q/Q+LSwvNJE9zPI2Y93xco4p0RJGrBEz+Ixq9hm3tZxpDROhH5rd1D7+78hY?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ece303-0584-4338-c6c7-08ddc50950b7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:09:56.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBRdQKjiRpyomQEp5rkA9EjCbG9uLQSUC9LfFMz7Ih+QDz4u80wL2zAlyNPpQ7rX1H2VpT72L98WesfxYXpgWZ1sc1r3r8hbaMuw+w6aL18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
X-Proofpoint-ORIG-GUID: X3nQ9Zkcg0TqL-6UbS8P18cP3P9YpDti
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=6878afd8 cx=c_pps
 a=AeNrB06FcPITeqP5zEka1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=nQNCM_iwqSZUGIDYJeAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: X3nQ9Zkcg0TqL-6UbS8P18cP3P9YpDti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX+eL+2nb23GfI
 TvVjwHB4IZZxnEo8h66jW2dN2pRHZUBFjQX/foI7plPp8VU8qAfRP7yyDn6rB5DcZAdwcBE6LQ9
 AobVl5W9hTF0sGvP/Jv42ReOzC3o/+T9ux/Trr/s1Up4kNxuaS4MZekLR2ePnnZ2CZSh4uHc6Xl
 SazL0W+Fe30Jz7UKSoY5DaXGDBeP98reWaC/CMqRHCqWaggn6O8UACr8fgam28fiicQjHMdDj7V
 5ojgvrYFxNwAYNjW914+MNbd2Nt47IuWUHubd6YvVeGj87RY+RqYDS3HkZo1c1eaJlxS5mA6ctx
 QxH2sNpYKaNcmnO5gd+BlFQc0tFHh+mowtbezT8+FDp/3ARySvlXypwyH3HoDtrsRPQ/pbiDWhu
 ejcPXo26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220518

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the following bug for runqemu with a file path which contains
vmlinux characters.

runqemu - ERROR - wic doesn't need kernel

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2ab36fd03d..f189dbfb60 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -368,12 +368,13 @@ class BaseConfig(object):
         - Check whether it is an NFS dir
         - Check whether it is an OVMF flash file
         """
+        n = os.path.basename(p)
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
-             re.search('zImage', p) or re.search('vmlinux', p) or \
-             re.search('fitImage', p) or re.search('uImage', p):
+        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
+             re.search('zImage', n) or re.search('vmlinux', n) or \
+             re.search('fitImage', n) or re.search('uImage', n):
             self.kernel =  p
         elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
-- 
2.34.1


