Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17FACCD193
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 01:11:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2566.1760577086845697310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 18:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s2cftS9S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2384cafde6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G0KKQY2523989
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:11:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=QidgOSR25DoBU6Dw93Rl7vgHsyFba/yZxMuqKzCI5To=; b=s2cftS9Sm+P+
	0rcAI2WwF/+iTHaukpr/f0GstZ85E2BL3EuEQaRj1sCnGppxS2XN6p8RcB0y9RxB
	+8yjtMvZxkToZj7pLG1nNcdfbizKvK1GpqA/ub6wBn5Q4X3w/N9zKXaCLb91FNd4
	Un5yYiEcFhsc64pX19rKtCm3DwakZmNO7Q44SrhlMY543I+HsSC1n8CpztppBKi8
	Hpc86SHE8lkc+mRIAZEIE17kPQHtY1ALzNoO8LadkUlsFt40Z76gRn/pUQMmEhSt
	0ibFIxGb6KFRLfAzfaEvPD/nNLa65zp0LNnzLc0wDYvQXbBuIFRmNXiPv8apo+Fk
	u13klJFmLQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdwan9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipH7Sx3UVKmelrai31jWMebyxoXPyyULvRInC0/719Ozjn0spNR2qam/RUI2TWJuOnmPIeq6oH7UZf04rcLwUAr1Hg50Hrthxr6dxNxix6L/ZnqQT0j7EB4VmmyQy1OLjcosd0hpdn1TlmH4Af+X5q81QU41L4X31SXKK0pNUS+KYJo4qaVHHY3i2u8jIZLJA0qFj5Vc6sqIbrjGG/bAeyj2tDwgdOmxJ6q3zE0KuQmm8WO8vuA+QkQhORhzssID8BW8nb7cVFms/9YhRDVbsAm1S7d/oVRdu/etZRnNe4o5qXFxXzhCtz4+zpp5QwE6UwT/AtJi2jaHP3IOUXj7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QidgOSR25DoBU6Dw93Rl7vgHsyFba/yZxMuqKzCI5To=;
 b=VgC42JcoqLJkuvMfcIv/tClrputq6lYgDp3jKAAu6B/6Qu16iDmXrQmZL3NhRogVNluRyEyFiCM+WriO3lvJxhmMHnS3w93u6VL+eJ6M9ba+7cK9pQ4/Q4wGccnFD1cOvAUHgG75uqAhUjXw1ScO7z3rGhqsSKKTM5D5pYeti+uKdWKPNi1+CjHq60KL/sS/mUS0zxyfAM7Gasyv0oFsyKpkss3qJb2JMZZgL/Nl5s/Vr1M6b4pH4sU0wXNDyW4l8xXK6mm5t4o7IYtqWN+A1zTFUkxVk3G7rjrZKTpQPJYqNDKBXKqQP+N3O7ABNi9qJJTDjNz+UwKj3dvbYuOIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.15; Thu, 16 Oct
 2025 01:11:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 01:11:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 2/3] base-passwd: add clock group
Date: Thu, 16 Oct 2025 09:11:03 +0800
Message-Id: <20251016011104.145401-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016011104.145401-1-Qi.Chen@windriver.com>
References: <20251016011104.145401-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 7284436d-c64f-444b-85be-08de0c50ec0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MyFCYaMyVvbSm/cu8hp8AvHbtlHyyasl/lHfWJmc7cT9v13dEpy6JRAHftQQ?=
 =?us-ascii?Q?S5X1rAMy61Oc/exATG+h+OsHYF3y+l58xfDUStOqyk2S0tmc5FIXdJZsffgk?=
 =?us-ascii?Q?V4XxLp3xu2O5iDc7JPMYEIG8HImmj0ASlvcJcoXJxUFeMUNvKwN5xF0xvgQb?=
 =?us-ascii?Q?pT1x/5KIq4YkKoBkFuH16tqgJ/+YYZbTzKNm4sLGJ7cB3ICmuCRMQ+81dSQk?=
 =?us-ascii?Q?Twjp/COF8q+bUj5xyBJ9usD7Wy7Cqj3wTeC4ToDQijMX1/TIrQRDaQ4kXJAa?=
 =?us-ascii?Q?jxlo/9s3n2bI5hBYBg6u/Z83Tw0+6k0wsiPTH+j8Yeg+CZUPbZgARQ/Pqo/B?=
 =?us-ascii?Q?H1AjuTjUqrSh25+DWpsERmkjTTt+7JBIcGQC38jLVSlpPYaJfH04J4s2y53V?=
 =?us-ascii?Q?wt8KpFN0iHYXXhy5UA9A4t+g/ED9+URRBnbFnMmc4r3N3urrtfFTqhLB5+lo?=
 =?us-ascii?Q?S2dACZPONHYCupVFp+vmGtrdtINwLVdpHh3eo1sEaYBvibjMiU9/b7cyNCaz?=
 =?us-ascii?Q?PkKWLchQwWdRYYQ9XXdNuqx4BXqShu5Rq/TcxPlFWIOnH7J+QHKTqvesgomu?=
 =?us-ascii?Q?2bj38zWn8PPxaQfpga1L72ZXXIYL+LAIKreY9vnvSjRVkkFIQ61d65w3Eaef?=
 =?us-ascii?Q?WmLznlhuQYCm7IYJusTu5+UMAGDE2rv1pboUElknB7dC9VdcAO8LI8LG71YX?=
 =?us-ascii?Q?ScEPXWA8eBPVmGMb4D/0WaHi+e3qwO9G1TyVn9aFX7kPm2REhrsyjOMiHjYS?=
 =?us-ascii?Q?TyEtbB0Gqo41hVUKGtr7iNcVRyufhjPGzODxl12UY9nT/R7/1RTBueytUCF9?=
 =?us-ascii?Q?aHUgPT/yIZ7ehDSQt++CD30FsgX0W/n2xv/6JNJXj16xMp8GDusf33vgGMNh?=
 =?us-ascii?Q?PNtp32e0DeNr/cqcz39HsTgeqPAuYaKi/z3QVY0mR01jEoUhn2/YsueHuJuF?=
 =?us-ascii?Q?CA/TZ8qLDlh2RSJGMO+2FgRlAPU4vVw3eIJaP+4VJkcZE6SzXjvJwSp0AauS?=
 =?us-ascii?Q?u2irHfq8ES0iUfN5k9+gbH4RhnPDK7fTm8RTVjsBH2QUOoJD/wAl/Zucl1cN?=
 =?us-ascii?Q?QChd9MM5UVhhErZDBvhF0AazIV7gswf7o7waVhAenfilGdnXjUh1wBgYxU/i?=
 =?us-ascii?Q?Q5B2qiLcFUcc/gGYJWKWo4L3bweiNdKc15mcrKT/+qSJ3Rzkd9hTRwUSu5Nj?=
 =?us-ascii?Q?sNt4F9DGPBIAzS/gMHJsDFtnW4I6vCj2w42pKsnDHuEKn5WGDiRFI2lz6N8M?=
 =?us-ascii?Q?sO7/2HCqSv6UkTKf/pWt6AWFoCfJncoP0RpASGUfGEM2bDJ0KAuwLDpxfCYQ?=
 =?us-ascii?Q?la8yhD6+bD7fkQO5PSNSXoslc6oR5YXgoKrHEWVEVBFPcXafQdqmhtVMHCLM?=
 =?us-ascii?Q?7c/SVF40o1gt1XV0oclN+q8vA6IEfyBoHUcA2W1uvH05cXsE0oe5NMquY8i5?=
 =?us-ascii?Q?zDkfLwX5l63pE8k263Ssxh3lZzm0r8OR3GaEmxq9UOASsZGUAfrCTA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oi21qag0IwyWcywo9NgcYCA5NRzANIVEzhh3vwxJcGlfzzwDcD/7jrTVt4lF?=
 =?us-ascii?Q?Tm44NdOPkOh57l/PySUt0NmeTIg4byg7UyM13pCHBVTH+BX+2L0UUUE4uSoD?=
 =?us-ascii?Q?a7brkoplEjINQIh41Wc2gBrAtJ6Hce94CzCKX9iMJ/yKSg58nETZ2H036Mvg?=
 =?us-ascii?Q?86adG+Yp369cLc1KdL5AWDIZmGHd0mt/J1o5M3oPNfsUlhGtn8axFh1gGDr/?=
 =?us-ascii?Q?SdcP0GXo/8Ya0t08UniZe0+d7J4PLF8v7GHLS+vFtQDxmkSKqAXTH4tAC4vU?=
 =?us-ascii?Q?z//V2tO6lyEhkb60fgY4ayiSsZXYv3PrvZ16ZfuAzUj4AgNqVJDzwo1KCx5y?=
 =?us-ascii?Q?BS9wJZEOXvmK1bt9b4JgEeRfut9rfrPE3fG+Lkz9iG4eFc3NpjLbRA5Zfnn8?=
 =?us-ascii?Q?hmxivdxqMrLltF0cenmEDyjj6gcgmpvQKBxkF1swqkIK2z+grxd17KIm6D2C?=
 =?us-ascii?Q?tCTWxY3eO5Cmeo/Q9krtfJZjs4RT4oAlFlM/6DGxkQV0AzoklzKH4fzefkRP?=
 =?us-ascii?Q?u5zstica0dWbs3KSS2Oo1+SrtDVzS9rUl044y+StYJdJosfBT/uNSO+Z3pKE?=
 =?us-ascii?Q?z3XjWFWsMYqW6fsKgxlXY9OAHLqov582qY9CvErx1vjMSbjQqthFHTRanenj?=
 =?us-ascii?Q?XBjxVTinTjq0jZplU1Vvn9kEi2XbM2tBhgJzI+p7bdfX7PQ1cJdMWdNzAKGe?=
 =?us-ascii?Q?BBqnu2OnqWCvSo0mVfPEqXwXNIDlsiwdUz8ue8+hAAXzGmfDtp0N9VGCzDUB?=
 =?us-ascii?Q?PEjWlDR54IBuc5xFQQV7dVyfsc9TnlM1dWPBNd9UteAE6ydFXH6ZSi9YfN8m?=
 =?us-ascii?Q?nuX+2f4HOj+2fYHHW1/6IVTfMEmycM+v7eUf32fEjWjJ3C78eurTEIr4E0hY?=
 =?us-ascii?Q?H+qLW38HWlEMNAU4D6t+7f2RIgcP42KI7pMs4R3YCKNFjGTIukrYtKe4X403?=
 =?us-ascii?Q?u9nMfXe9xNEK2JvFG60+nrcV2y1bexeM0HsTaJVKKJioFNnvRMDrmxdELLha?=
 =?us-ascii?Q?cHw9XZvat4TY1QrRmD8cy//8UZlRdfYHNY0E1H2BLYI4q04QCANRegUcR7d6?=
 =?us-ascii?Q?wb4+UUuhd4BFVO1YBB+M36ey2vZIRs2qG4CxzbJPGKS4QgAxX/TWVBVC0XU+?=
 =?us-ascii?Q?cGH21uCxNV5cOX/X4lAuP1eymdZc8DaHjE+rw+YFZHpTJnaHY05/y3RAKWhh?=
 =?us-ascii?Q?aIeyekUz2gui3XbgGTqdd/tnj37QM8hlS0eGbrHYvM96YDsCZLSvg3ZOnhC0?=
 =?us-ascii?Q?QojtC9okcSR+3ZD5IkxU2fKQuEAtrnCzs0T7xXouFT0pCfU0IDXA6GO3ZoZN?=
 =?us-ascii?Q?iAd8xu6oFsgdk/LK6VajGBoYyoxpkwjyIYf+FmaOBccGi6NK92Ra6idhzUO2?=
 =?us-ascii?Q?QM6TnbtxzyF8Pl3cIqTBTBD8XgEpbVQgW/LTIHimbwIxv5iWyM3x11Pdu6Ln?=
 =?us-ascii?Q?Zy+OixVHMkYozUmsEKDcrPuioD72Eekeq0/Yt6bRrRcQtzrTODJrt92L2sJX?=
 =?us-ascii?Q?RISaJcCZQJlWihBinjSaMKUWKds3uynCuXRFCAMUBB22251VhHTQI+4ZLksO?=
 =?us-ascii?Q?Srh/HJkM0esrFtRzrmV00oWucu2BppiLi99hfSfX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7284436d-c64f-444b-85be-08de0c50ec0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:11:23.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqPH8QILSf4QDQ38N0FmUcYwQMnB7E7urxRIfKPhMNvMsdvqxfG4g5e2vLxZM32/ppkNQBj06nhbO6BlPDI5Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAwNyBTYWx0ZWRfX17hzApSGvyz9
 t/s+W91oxEeq0PSYsyr/wvLqwOo74zzivMvmUnaExpmf+f2I0SnAfT280pLaBTD8eXU+7diIfKh
 c+D2RJMQ0Rnw1pv4X5Kp4DzKhTwmF/Pvzgd73nK0jCP7eXRgyUmRUxZFzzF2xi15AcHmT1i6eC9
 bMKSubdGG5hjg0g9SzkVo2QcxMZlVDaRJcS/YoFOPoUrXuXgWHCjv4IMRHTlewAuXrl17RYYQm5
 pwFO13Zi8IglYI1kmElrNNyVgCiRCE1mVATkKcnJ1nazZmW73LgpyrI0IQKTPyfkrP8zOfRpoSm
 MiRKYwVBNsNbPCzwi4stIlCDvEAb43J9H6Vn214MN//J6TNZosFrngoPZ3/94MHizOGVqh9u+F+
 FjXORZ/JPiG2FYg4uc6himhcOdeFmw==
X-Proofpoint-GUID: z5dNkFDK9BeWyML6SbVSk_HREpyPwlC2
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f0463e cx=c_pps
 a=4YDC/s56AEiJKWlPnw2jOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=Pmu1SSgIpiWcXD3DtNAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: z5dNkFDK9BeWyML6SbVSk_HREpyPwlC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510160007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 01:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224910

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen. And as the patch to add wheel group
was not accepted by upstream, directly mark this one's upstream
status to be 'Inappropriate'.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..fe5a4bb210
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,34 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:80:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


