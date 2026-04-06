Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9522EEF4EB8
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 07:06:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49934.1775459163878467733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 00:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dZx+rmY3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8556cc1aa0=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6364pTgN359242
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Apr 2026 07:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=OhZwdoxL7
	7fVECVzaSPOj4v8QphkQZP8cqljJ4A93YI=; b=dZx+rmY3Whoh+Dayg+vCb12l1
	Saf+BLktOlO2+M+5Ssu3sEhGsUO2h/qjQHCgZ53+fDsWiH6Rj7oFtuGNkxO/qZ8L
	Lv1WaqoHtKXWXt6PI6Xm3MCR+Jsad8aYFsblK4x9tXTU0tFJ+q3N2cloufQoD4Wf
	oQSkxcFBcXyL7exNnTnICcEeYNxVgKq4Hn2qeKQftkjCOvpYkh0slcyB74c+KI3C
	HN49Zz4JwOOB2a/ZI+qluowCoCRmKiqYXWuQmCFSuJS+47Fjgq4nBTHBOwMT/gQQ
	Rms9qPQO3bO6nPcb4Lw12zDFC1wVlNhjK70/vMPBf84Ua0A1TLN6aftwQCrJA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dat2dhc5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 07:06:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkOnETxDnLsrO2CE651PhkTG8ZvutKzCoqtmDyJEHgLBc62a1MkEaQj/IFhbIcNunolDvDeFPbK5fZ1WpV/D02dY5Hx1gdXr1mYDdTJdJlNDA3Uw+JUWI/ijtXOxOE+GyKBR78zbjWT/2DdYZZ6eCqEXJB8woYvd/JAjk767eZwToJm2nF1GT4TgaebhLEa2zKq1ylCTl8iUG2+uTHsTv9o1zBSVSZTMirBQobeF6sbk+PzVlb0u3AODorrWgwR5+1ZXglNS9yms7R0kC1zI440Qq/mbz7f3cIfmd5LLSF+q8NpRv7ANnB13r1pb3To2F/OBoE7aFLAixqvgtX1N4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhZwdoxL77fVECVzaSPOj4v8QphkQZP8cqljJ4A93YI=;
 b=MLythhyl/L4tt2/y9zL4Vr37A2HlxkZS4tNRkYOnvsRcyu2sDZEfv2st7/U5aFMrJs4ve0QC+gQ36IPcdbBr4HEIDV8eafBpSIp6JeGH2Fc1BdcA0SW7Gxy4LCq8gzvCpAHYY2JDi+PKyI31mQI5PeljC5YpWTW9Tuf2ehFiVoAzIfUe7Z5dfQzYGy7SxPGWzE5enLSP1SwkQrUgJUHVM6UFRTlkq+JsprMio8WCSdmn762apC62Anae11sxGBEXv8HvEB/JmZY4DL1UVok8gg1Y/UYhBQA8ibDgpv844nyHGK+riSFyOQ0voF3FPPKv6wLBhzlWTXrKdXK0cetmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8692.namprd11.prod.outlook.com (2603:10b6:930:e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 07:05:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 07:05:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Set status for CVE-2025-69646 & CVE-2025-69649
Date: Mon,  6 Apr 2026 00:05:06 -0700
Message-ID: <20260406070506.3779367-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: da212a7e-257b-40cf-3adb-08de93aaf4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	hFzN9kDB5sg/G3HHl9aGe8PD7EnkPTgV1Y3m5P9EqMRyY3p8B5OHYOYuYnP8VSC+ke6xYWi0C+/K3KwviJBRzOPt7GCULyHd/zqJ/gwY7kuzzfpYAl5DLeaCfPIe7u86A/qJnTS6ayxC1RGwEarWBRjcKU9PQpr8gsdWmmWA8/eYL/GRBV47XPNjI3V4Zg7vyUArHg3gJaBcGratUaiEvMkTpD9/tHTNbfuqMKXuLkJkyLp+pN6uuTp65+c96iK1ED1BsqpOcDAr6lWgyaLPAujtNC4m1LmZzAUjamFbLlTV1VcS2qJa1kx23er1F7ydbfdRhYuLUtQ9jqAU2xpl4v/KgF2u0u+gmriB0UaCpVmHfp7Xb0traRSsLI+NfgY8F0XWCon5+cEfcfKHe6NX1cq1Cf6MxnEyjUaSuoNljZPCFrbgZVCRvMPA8+WqEtusFUDIHNoY0pwgsKDkAkoFVsgYFyKJj1XmxSNEaji5gLpucFo6DN9EiTnIdKeILtHC4sPDWtGRlLeJA5cJM6KLzFVbpJxD5vX3qNjJ9OimygOZ3BTtpFwHCd6vgPB7eyiwI4jJhcDw4ScwtHMqTlilvKi3FoaXo8XxrXkjF0EZB+CUi1X5UIhq1Ac4iQ0jGMRervN3PwP+rHMNK/ZQuo40pYyGZUMAinleIBYBKz/ubFA4EE/0/u37Wqn9omG1VCnVNn/tckApPF2YwPuNu0imnphRoPiGanR8+UjZwSg145cx9EaNKJn99MmNTlaisCu0JP+T0w6RRmbfkMFSkrW7spcr8OvskFwFBs2AZXRHrzI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rdnvQL3RZv4TiDDfgtNgcLu1lPRizbY7MIRpfYqGlJJ9EzRlLTISAbPGyXUE?=
 =?us-ascii?Q?cAlsV0Sj4NN+wa6nzE7RXzHwyR6AFhIkq7Xa1e71vy6podZg2d82pxW45IpN?=
 =?us-ascii?Q?ECRhbijaSFwLMzd4hnPyF+k+Ykd2HyWNpJyPe2Z1PrOfN6NuCBi4rzx6Q2Iv?=
 =?us-ascii?Q?hbnx3/0okGVbv8rCbNxX1G4ZynOQIpq3IIn69yjANvDJhI70j9ScVPIUGI4N?=
 =?us-ascii?Q?hEwp8zx5JXgqD0TBrodouxyGahPuPWUYHdVXKJgvCpSOwv6nYPmtSyT6jZnU?=
 =?us-ascii?Q?KxUJDMkANHMtAvyy+v/RGo7mjrh6LgeddJ3ilhcUAE/cbNlhxQgUsa5QI4FD?=
 =?us-ascii?Q?PAsaNyvppYl88xmtYDpNxBD4W1EcXl2qwuH30nxEvj3Xrn+EOd1rNNR58KR+?=
 =?us-ascii?Q?fD+ynWn+jXFBx4Dxtqq+88C95rDmoA06VQtb8OvmFwP57Xr13YiP4XhlX5HI?=
 =?us-ascii?Q?DkihKAjI4xW/KCbJ69BVqYbgQzp5Sxcmi54E6M2mdN/PESNqOuyucy/AQLux?=
 =?us-ascii?Q?nTW22ArIvGRyIt7qcP0Y3DgXIbqbWzVnBWiRXpD4mgrgi+yV0AP1MOtsD9Oz?=
 =?us-ascii?Q?dzgkwPD/M3FCxPVAbcQUfe313g6aHGjxCnQ6B3A+HnzpxN6KKJ8zV76TdPXK?=
 =?us-ascii?Q?1fIETIsYOTTemNrRofJ+aoGiO3uBLtuUIy20H8lnBNL/PdGlyMy7C+V00Rq+?=
 =?us-ascii?Q?B8kVk1mLOlLcqCvbuSd0d2JYFk/5nCVjV1VaZ3z0xpDE0OLSUu3xfew7i0+i?=
 =?us-ascii?Q?QiyS/J9almX46+zWGCL+z8fM7CJqM7a6KRh2spVplVu2ISDDTGLA8TPSUMgj?=
 =?us-ascii?Q?Ry3nM8fxWlYJUKWfkIr8HfQKPi90/bSbsidspzSdn6wPhFrtv8BEHAvLrUDP?=
 =?us-ascii?Q?CMoEGbS6o+jm3v+CshMGvYECRU5FmjpZTbsHOG9AecmtbkJZiJWciH8eTrGn?=
 =?us-ascii?Q?1ocpB3B3YHDoHiMCRVW0qkFvPrN72XtQA10EMVtXw/mxT/bQJebGml8nYylP?=
 =?us-ascii?Q?xV2P4i6h7gDNFdyjTjHX+CJNAS/z1E0V7uBHNnnQX5I70t0iuwXriXN1gwcT?=
 =?us-ascii?Q?7mL+kU9axVuP84m346c3xsGPTOtVFXZvyGJoTA7+lKVgAn63LIP4fdBj+Se+?=
 =?us-ascii?Q?4/fPZCrFzCIj7UBucLi6oswCb1kY9JJKTsH7IzssIZIz6SM704uyqBhnc4Jw?=
 =?us-ascii?Q?bbGb01B1rDo8BH7cSmSgDfe2Z6Jix5Y5FAP2k3N99fXiIsGBhy1Eb9UqPMl/?=
 =?us-ascii?Q?kr21dnrcWSuT7UdOYSgPL2nAQ1sZWXuh15uh7csG2mxXzjAwJV9ttohzPrAT?=
 =?us-ascii?Q?CbXBfisjtKouzUqXauQL5XHNKVCZlkdTwO1xWZm3/gTbg12WMX1BgI5Sl/Ow?=
 =?us-ascii?Q?XEZGCVyXTGeaQlfGD4vIZYVDGSsj0XUUJ3fQmatuemkPM6DB//poj99KNR/I?=
 =?us-ascii?Q?lMSR53wsuN/vC2EfSao4mGktLRjEzUMj+JIyAithMFwuQ9/mtATXiJyI/E+r?=
 =?us-ascii?Q?2LXTkuFKebYA8QiavBjlzZZknmVI9EdW5QH0IE24D+XqJccab2EFQs91A476?=
 =?us-ascii?Q?DHgNoaxL+Ba9bAnJ34a2qwH8Gp0h8eb0m8Ej4iQTLp1xAlp390pY9aFq43Pi?=
 =?us-ascii?Q?hKdkO6aUOJ2GFIvg1GICmL99lKVh56xl5EW9+MZJaTEdQj6eUlBAS/8B3/eu?=
 =?us-ascii?Q?xlDS7aczMzFy3GsekLmuuI1SHLQ/TZOJrXftARJTzbTNwmrjt1rMfM8c5HvW?=
 =?us-ascii?Q?6wV1ti+m6MJJnhWN8CaQ8CrsAnTlZh0=3D?=
X-Exchange-RoutingPolicyChecked: 
	dI+eJFDKbUOPKsCvPDne74ZFKKKjZrdGMNoQKnEB0hjSIED67O/W6PjsIUgurtyteTF20B9/7iPA3rJQz5mdiDntNdlcgVslgXuRXYrIE2oJqy6iySyEDZxZFbtrAjscvtDdTR+XqVdBR6coVRe38J53OHo/UtnrM05udGjKPdwl1kt/gnrKE55e4stQYZYkf65HdghmPPHH4vmA+Uo+Td78O6Aq5WHeUrcdWj5+vm7HVEiT0Ldn9+lxrX07iv0S9Jvtxh7ax9YmOipuiGnf2muVsaMNz2U6rCaUuS2LrcQJ688fY2cei9XOfPlCK/qgC0khm/2c7xXXPFtHXmfvqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da212a7e-257b-40cf-3adb-08de93aaf4bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 07:05:59.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgfsyT6QvEft+zHeoO00uRTgEfGvXER/aJq7PjUDFeXPnHI2N8s1Erw3mmWI3Q53rEZgkHsuLc7wXt6YW34fdcC6pUVONDKxN+td5xqLTXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8692
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2NyBTYWx0ZWRfX9Qdr5YRbYJPz
 8vIjjNMOEOeAXueCmrxKuqbm7txgxb/fO3MFLV7tEzbV8s8WeDX37tG7kbgXkzgXcz5rcDwpHVe
 IHs2YD74do3Cq9EeY84zIZ481nrz8iA8LeZmbyawl76o5SGrVvhUD09K9OZHnEgJojxSNDkcgGX
 T1+oVQX75VMmy+jOgYoUl+m+JYu//xF4nV3NGdX2nS295JD5xBH3dBmCBN6uesO8338od+bfdEl
 vrkttWdlICJmAABkpXqzKdjz+zLuLs3RtRsG9y9uLM5f2WpeWdid2sfyL+Wbn4ThSVvn1wPxloK
 x4l7iAF/lfrp5fhP1YxsDOEcWmns60/A5gnQamYzHk60NRqy/acunz2zURJnxc6EaVqQMaA2gZg
 pmup7NCOqcG1XVLqUqTa8H67r+1IcQZO6ViF5N9zq2Kk2dg4M1b00u7WnEEjulh4VFE+6b+5krw
 JWBXD8N4HV/+SGSk3BQ==
X-Proofpoint-ORIG-GUID: DtZZB5Ivmzs5yxGXKg3PWJL3G_hNcnwC
X-Authority-Analysis: v=2.4 cv=Ms9fKmae c=1 sm=1 tr=0 ts=69d35b5a cx=c_pps
 a=RGFq7D/WLd/IouGP2/vkQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=wfesOtY98Z3IwDECQDgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DtZZB5Ivmzs5yxGXKg3PWJL3G_hNcnwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 07:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234667

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Set CVE_STATUS for CVE-2025-69646 and CVE-2025-69649, as both CVES are already resolved
in the latest binutils 2.46 version upgrade.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index ff10050dd9..dc8b6be03e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -34,3 +34,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
 "
+
+CVE_STATUS[CVE-2025-69646] = "fixed-version: Fixed from version 2.46"
+CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
-- 
2.49.0


