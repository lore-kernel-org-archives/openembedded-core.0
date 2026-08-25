Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4810C5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12508.1787621611412918867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JLL9MYIJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0xJYK300661
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	JLL9MYIJtMXPoXPTGpGmQpAdpZnzlBbVJWV9usPcGYHaowj1FVeZ0GUYm2iQzJue
	q/rE/mhU1LGadJUmx4jlnJfq1Cy2tzzrccCqYY/DojQtf/ZRiNJpLtozsww2pvDc
	v2ZAPMi1lCcO70rZgLbdl/qu6QiWJJqLaywrPqB+8kQm9rA6N+oByIIs1ZdV2D+T
	q2uKdJLrnpcYuZaBN+PwUByUWi+beIzI0hkutrMRmpmMm/DF4WKpozkbqcsTMKw4
	H1Vzc4CJVkDcKZ6RvaLSYzx9M2sX32a+begUj8sh2gWwmlQs9UkQMNJ0krUUcJmI
	2923kwRcKR7Q2y7IhVzcMg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbmczwdaErbjSB6eFuhr8D7hVMtKw4azGGigpbSc4aDYbsyZsCxGjvSNGgybScMnmXuzGABqvb0zJpucSPoRRW09ruyVkX/pCwRi2k8vfWKkkiAEg0s935lxzXR47WuNGXKrwzoAhGyvOmbhojkhWmbBgyfKyGCvbxmf1ZMB7GJr+6T0SsX2IimgEdSVhJz0MkAHCfjrMEJyvOCUXPFY7L+RlZYqUpSG8FmP8UO1qr5KMjmRyAr5zGpFiQ5/VPPFkDJW7lsgt1wFDSIpgPyq9olIlhQGtm7KhCTLKnxlo2NgW8KCpv2hQs5RiV6yOcmIP17OHqOQTQbdFT656Zu7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=Vkw5BFtMOk+fbDtyIrM3I9wjV3IjQ/6XhBcsB2sH086uyxGTyeADo3/qXij+FHPfuNFY4PxvxHkjndMCSos9+qkHDDlI447V4BTHcqWF9R049sBeHLi6u5JY7nTCoGBMi8r2zy33EzTg3asd/XuFyMbkx+XLFxAfi3ElVY/NUNn760DJHXXYK+Bo6ibta6xTTeyri1YwgSgVRzCupVnjQ+q3Oc1ddvU4lW6gZYEhAir1Uj+irIVX2m4AJnJEtvB9ijpFkap5enVptvEotPI+FqvPJtXCghksHBk5o5m+yd4sSbmUQhqFWcLuOrUBhzDkC4v0euZ3IGQDQP5/3CChRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:25 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:25 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 01/14] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Mon, 24 Aug 2026 18:32:59 -0700
Message-ID: <20260825013312.2695028-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5af8a9-f541-4ce7-9410-08df0248db33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	vAYfDe2rY9AUf7CjVtiF1ordP6buPSgE8ndVPEia1Pgb40hr9uyBWkzHGpfyuXPrc87WKGm1N9ZJ1+mn/JJ2S1HbplDoD11koNlHL/2nIWVSo4RqvJxBqwRwZdv4Xeo4FPCDmaGAeBdL+LuTVT0VTtK0GJm48jX7iAjLlI4ysvgs97foXyCyrNIyy56a5m8y52ViwSiT6NCfld34kArRFrlGI2mp9r7uo56M8zi35I2fscuFlv/ksiDEy0zZz46KsvP/YJTa2mKSuKRonWQ3gtgjbdl7jrPcmCv2CftcdL9Y8Jt5Hi9hAM7sEp7eX7EUVR4czJWrlw8S2lhlBGNZI5G0v6umqflJ/JtD6/6Ij8cDmx0o/cghYRIKDbv9lUMf9odaxFAyD1XnpEEFr4jw+k2JVH471JL70KAeXl7aK8yNt5VdsqNYSk8ITDNcmy2hxvfoq1QjcDhAqnWy0TLeis6aepMySKNOgr5YkZAdl/Pn84LLSkBO+m9nGki7lxbLZ+VCDNyong/YrhGJZZ3P5+Ah6gpcj3x9IG0e2L32REXpX4yU/14+FsD4Zq5okarcqGHROFOCpASD1dqd2Y3z9V2cYFFC8OiOHK1E7FsyU37m1rhsmdkKNLrCCm8JnmLsdHKXW0wsslYo1F3NH5Y7Sg/OKSg97J2wMsgnaV46WkdpGNnKY0gxH6K4ei1D7KcsPHmK81A6NMTMDAL0r5pB5SdZBCzI8DCTpl7NGbzW7xQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WtSxIrGlfyhX5DGQJuMLQS6JMyaqV+2TByTHk2vA80BVsnGfZGfyRGb3RYGz?=
 =?us-ascii?Q?/Y3rLnEncHvIFHOh3E/o3r+HZPA9CIRIFZjFepu6JM9oOWBfFHNlzjcIaYdN?=
 =?us-ascii?Q?nPDrWnDQaSeI0iuJXrlFksS7Sa7t7NIoYRCNdq+L6MlDZEJ481DYT8Qz2aSL?=
 =?us-ascii?Q?RhqCnD7rPMaI0v0t9Wmx9cIGsGuMo/uOqH0fmgetG45N6R6AwEwObruLit4X?=
 =?us-ascii?Q?6nMpZRteGiYd8UKQMezaHEnEYEAd44vC+VRg6v/I+6rdDLNX6radDfwVuVoI?=
 =?us-ascii?Q?Igtqht7uOhGGv9+sDCYMlO/zkJck5Ly7eADIKX4jonMQjadLR64c9xTPzwNB?=
 =?us-ascii?Q?3Wx3Vxz2ZrJJlFBJimDw2AXaV9kl1XzQeIpmr1RqgcAMFGeH+OMP1EOcQut8?=
 =?us-ascii?Q?ViigcJawc0MTguauyo95mcqf7r0JlEr+IKQalHkpKLGZN8fx0dgyhnnsk38W?=
 =?us-ascii?Q?kputx0EjPPsAIzN9ZyYsA4XjBHfwp8zOV3VEBY9BEJUt8hXivteX6NE9bcLp?=
 =?us-ascii?Q?S8KHcwAZyjnFTx1dQSkVrhdZWH77Aa7PdQUP6LSOZIsM8mcvwa5FkdPgGnJy?=
 =?us-ascii?Q?Ys4UTCOO3owVmv2/antW1tS6ieJKQ5ZLschwilMROwfQJECTSEWajnUsMR9b?=
 =?us-ascii?Q?WS9qz5V6jEzaNfTS4vMatmMx/06qI+9Aw7W6G4SetpDcfLPg1cHokHwzYeuK?=
 =?us-ascii?Q?4yPlL+rpPZJuZUjrdO4rlvxbR3LH+FX7DTXL3eDVY+pWp1KkI9SMwa5jG3Va?=
 =?us-ascii?Q?0jTuB3lnSlkop0L+EOXNCy6UKWEYnAlPLFX8lyLhxbS1Mny4WXQOa/HNA/Mt?=
 =?us-ascii?Q?OFco1mUocbCLijcxZsFEiVHm78N6dCh+KiZY/CzuuqyQj1EdA3X/RSI/AXhk?=
 =?us-ascii?Q?FgtXzQBH4F1xlYMzuMBo9Sx1kVh+dAFq31J0X1tn30MjpEDSC5iqh0cPJuGB?=
 =?us-ascii?Q?yoiHEGKGH344rVDHU4mPwCcnBeTJRTHi18mbzjwDww22Sk0P2yJDjXEC5wKi?=
 =?us-ascii?Q?ieJvzuEdHAnlZsGRFCfh2f2r4afsMMSltw3fHBOnDr0QBtJ0oQptSyUnhDjJ?=
 =?us-ascii?Q?34NcRphkFum/NEgZJUHWzGgR16mw2ZxofndruNTmScWm2xAWMydWYNcukyFQ?=
 =?us-ascii?Q?buVmWsyYIi7cnItONzxf4iQ9PdkSGnwjGBZtEU92AeHZb1bGtGhH9/oHsY/D?=
 =?us-ascii?Q?JVlW3fMqdvo82GuxnMTo5mUGSTfgpXiefn5cFv6Tmf2cG4AqUWzH/4He+02x?=
 =?us-ascii?Q?8f5H4NQ385pDe9Ey25pVxAPFc1In0vRQHGzQnj33Yb6nqioyXQvui8MBwMZe?=
 =?us-ascii?Q?AaBWfbZZNVrr024Gda3ZFR+qoTx3RN0c1yir54/DQ7x4BeyKGViCBciiZJVz?=
 =?us-ascii?Q?tgRtNUWPjcIbvU7s59y75yHJxMEbuHrWiAcgdNrv+fpvui1bMH+/NZBu2JZn?=
 =?us-ascii?Q?qXdH2xql4iGFyKUKFKa+pi3y4ZElnTi5qZ3LyOugQtDdeXm9d59gNsP3ArrG?=
 =?us-ascii?Q?SZ1Yo1tHjznkwzs8Cs0Lt3Nyzd9ziCxTg8oUjXsH6JF6JFVbcn7MPDnad27T?=
 =?us-ascii?Q?+pl2jxJnkB2NmERv1/GGMl+CZ/TYkMnNAStlN1LhP289ASZLTmHFVBGpzf4n?=
 =?us-ascii?Q?tH5YPeyTkLz7tSfWW31HEobI9EX8imgPBLFCAaewEUVwssspMzsz8HuYFpkO?=
 =?us-ascii?Q?/WE45GOIa/Rg2KwPfQtY0ev92N+fxGK1g2pw7U4NEi7IFxXLqygPCl6rbDTo?=
 =?us-ascii?Q?mp1SlyJvXc7KxW1CZR0I2MiKAERQ30I=3D?=
X-Exchange-RoutingPolicyChecked: 
	JbsooSgqCyCmxORXumGYVLHyz456sEJruxdGMQfPWEvZp0DSWx1vrM0iBewpSA97qQ9pbw60tV3rdfFHt+3u5Zz6x7NaMfNebcOF+lSdTIdSGnKXROKB6iLhgONP4G4E1vZFV+5NoBeQOWMeoDMvNKeeGsDOgttHkxXEkxSU59ChlMbOy5eNwjnTdZPJGwCWmIbqQep7GCzMxwd1CQIdv0/LPHKkjdHR89v58bjG2GiD4eB0XIoh6l22/EeX9D6Ui4TU+p/El4FQtJHlVvdUGJLjCVDBjGLTcvt6/r6PdNsxP/LtUZION+YICXJaJBqYjN20hLXEh83EHCYcnMOgjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5af8a9-f541-4ce7-9410-08df0248db33
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:25.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiNg8M1OrANRwKqfEHUBVS7Ko3EzprD2NcJNIym5/aGHyPEvCNfgJt9HqKHHVoSjZ7xk5vMrWYwtp9PsHXOv7uwEj1GkJbjTJ3yEkfjA3GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: rWGw8Pq14Xk3QJbYfdEyzPjoTNejk9Cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX1qkaXiJ9N1Om
 pG/O5M2Tav2eXDTiCXF58MJmYgArOQKyK2U2FbxAvX28nDNfgHQamY5GPVNiD90tHpRY3P1k0Sn
 IfJS6BBeBEIfP9+N9GusVpSO45JtSVik8DlL/mCClpsirAQRW4XhzuOfolcTXJS/HBQmaRj8fiM
 OoKwJHz9zvWl/hC4WdsnjVo77jfCeaPDWeCTR4/ANbSSk2rZzvWPxX2VAdQKM9lHU5/KTc6XbsJ
 plqhuq0d2UXHcFbVw3+kbwvTrwI/dZLRfqiFmsyZKfNa+WtWxFSzkKxlhVMM68nMzhyf4i1IGkB
 EdroAC8VaLqVgrkBU6p4y9d135Y51TL/SeqKD37tCjHAQtM3kaa46rSpgPVkcCGNVznNhj/laOt
 k17yGlXUKknofBrsaNgp2Z3SFQW/A6WrFUpMbDkdaKuHxRZnpZmYv6c5tAdFrOms8B6BE5JSJnM
 E7t/voG3UkIn6TiJPHg==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0ea cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vQR80dU9l3s4gjadoxBkGoveLyqxUomN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX9jb4xowB4kw0
 ajnoWaIyYFursjK+k6sWmYZLYRQIoNdDsFJt1D6XJBob2fGMoEuQzizD/lPe0xKF4nNMYnQemXg
 Py/qcEiEkCAjv46tDsU18tvQQMEgE7FsPLXEpfqe6rZ8REfpOaXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244172

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

