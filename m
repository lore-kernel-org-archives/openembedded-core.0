Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8192AC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 02:20:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.595.1749781215944129899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 19:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82599761d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D1lMGT031731
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 19:20:15 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq469ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 19:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC1EiAv1d/tMXXZEwkSdXlWKynfupPmj3UJz75BZyBtkaty2w0wVUDczGxRou6uQPoB1QjVTURmXwr5ospsJKryzldkuGmX/MGptYtroRH1SARenZ8mxTLgMlFqvXwOy10UDG+6aHEyBRi/9QVvPOYtwEIePlCceC05DCYJD8HkX47U3/nyx6vlCM0alsYg31yK8rsdA1HWs6RH3RJFk78Pgy35kUYOagBuPrXPo9fCz8BIkNMKAbUhumcEqRgnSNOmsbDvwxVu7/ywkDpMVV+6oR6IrDpWPnq62GojCpLgCcyU2ieW/NB/mRCmmEnE7zKLcsBhUDGPOKa6Ehp5Vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGs3+sz0QagINtEaAy7gFJHZ+xfFoYuMILp/ZlwvVvg=;
 b=AWFnAfugcxiacVb3fpuUfrR5LWwoJmpazaPBXzOkUz8uHPlSoOCkIsaRN087oM0L6giUEy9ql15d6dpzxJlhqqbiZM/ZxaDKqrUxnzG3/6Bo3/5zJgmEYcI6iQmlXmhrqb4j1wt/LrxYEeMwQoDCwzUyF9ClK0M+etLdwbqJWkYzMgX5WAhBy46iiRe+VLKC4y9enFuGLfiqsZg3pjLSSRK6uC2fR2vDCDm+pME1XV8q14jhXT0r+WIyU2oZTOzVtQcZRHCaioFlOcwhUGPdPIZ+sTbMHQgOjlPMXYpT03VgGiIi3kd6TO+2sZa8p5i/iM7uySsA4Vnuf0Lf16uChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA3PR11MB9135.namprd11.prod.outlook.com (2603:10b6:208:579::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.23; Fri, 13 Jun 2025 02:20:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 02:20:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] kea: upgrade 2.6.1 -> 2.6.3
Date: Fri, 13 Jun 2025 10:19:58 +0800
Message-Id: <20250613021958.22672-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA3PR11MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c636fa5-e2f0-4108-3d53-08ddaa20d3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W83sg51Gpz0m4e1tHqHJ8rXDzgKhM90S6vpwyaIMLiqSqbsyuBOSqffEXNkc?=
 =?us-ascii?Q?mcIek9ETHaMDouZh0WTWh4W5pTnHVvnI7QsgbT38g3NcYmtlLbK6VcP8eHbO?=
 =?us-ascii?Q?bsWq7ifN1Fw438QefsiJqlb+/zOOMSGgdP6RIepTkzwHjH+olAOFHyf2Zh5f?=
 =?us-ascii?Q?5SY2dlPjvnTgX0ylt1O8ybkj3vH/GWihyVtVnLpyDtA9ICJdvVPH/RBjQ5/b?=
 =?us-ascii?Q?hBDkUZHdoqiE61UGGfh68XT49F9ZBhZ1B/iV2IoA+i22IlKsfgeMOQbTL11h?=
 =?us-ascii?Q?nfewOiAMp7qSegqnSXsgyNZ/fv4dYXQEdbqivs0lESkLXoiyjPBE3qKe7Lnt?=
 =?us-ascii?Q?M+ZbDN3pP7D+51xYGr+xVCfif1hODJFQ0Z8AsnEk3UKouGVRpXQEM3/BzjGh?=
 =?us-ascii?Q?I+SzxPDFW5ChOHpkK86jG2i/a2yB7dcLd4KaJnO4Z3aVaGrQmFD522tERBwP?=
 =?us-ascii?Q?vG/R+EGNT2gDIDscIEWK8NyvttnPMoLjhxvJNOymksAGdLjn5bxu9+3GhP1E?=
 =?us-ascii?Q?/azDPcOE/tY/ZsQnnU9xHhvRU3KVt6HUgrV0fMi7gYnrXvYW+0jzDPNsAUX5?=
 =?us-ascii?Q?rymJOIAfG85TRYnEluyjc6Y8JCuYVf+qD4bJCoULCaUuubOmeegfClGzKgFb?=
 =?us-ascii?Q?DvHim6Y69ZHIfoOMlsk1FC/6O9ShX/w/6t1dY3f25bo/NtEX1Jp+FkQ/O2fM?=
 =?us-ascii?Q?MiRlryti7K2qJpimI0PlmjV1W9OjizOIOTfD1MWKKm7uzGPKCmunDO/uS7Oh?=
 =?us-ascii?Q?53/6xTghxFfQTzEOfcJUcv0sj3aXEtwVfDo5WN7BA6LhMUrtAsKjUfaHTyUj?=
 =?us-ascii?Q?jwbJJV7dGi+E/mBJ7y/32hz3HmIcbj4QRKpQUfhSQQJJUEv6RCG9iP4oI2Hs?=
 =?us-ascii?Q?asHFBBOrWbzbyb7FOdC0NxYT8CRO3pnLCHRgSvUNUKcQiai/3BQTKoE6FyQg?=
 =?us-ascii?Q?kteMBrszrj+IGpuva8V7fB5d8lqAcvrDWN0jvikkpVHiwBMothfXK7cAeUQB?=
 =?us-ascii?Q?S0qDacNnj1N4v/VryuB0BN1iztkUzi0h5KTYKVzdy5b29iP3APXkkBHBj0qP?=
 =?us-ascii?Q?Hu2XOnGuMyWi7PHE/R9Mu0zs/+UQ2kUCOko79CM4RBJZtUU9P7Rq8kNkGyfX?=
 =?us-ascii?Q?Z1JJfp9zUmiqo7YPmlUwZPm5c6CuXz/+PlYIIWy42K0NQBWHtG8Mn2IeAgiy?=
 =?us-ascii?Q?hA52yGieQvvQU9Fi+BQ7DJrs7670IHaJk7OWNJjwlG8eUUbuvmPpx4Fo3Vs8?=
 =?us-ascii?Q?eoQ4hZnaXteLGyPYniL2xdLEpqhiLuEJI2Qd+COdLNmDEy/YGaaGkjjYVr98?=
 =?us-ascii?Q?6e8d4mJP306L3K9QTuS3NvVkcXF9tDz6BQIw2Op6JIS89rEiEDfl6bCK8uNA?=
 =?us-ascii?Q?ZolJhToZVuzc2LZE63Ftc9fohw7Iaccg2TEg3hZgAkT5heOue6HlWHED4Tcq?=
 =?us-ascii?Q?OU71r9EnhD4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bA0KuYrzxKCAkY6Yle5ms0uzGKFaiTQFOCLqV+hcC2p0kLWzCWdLS+tMJ5OK?=
 =?us-ascii?Q?X1G3N3XRHKTECqvtj4CgPNpvszbbUkwQ5nGatOolH3FiQywLK4VcKlB+nGEr?=
 =?us-ascii?Q?x32xuWhlcTeW2mp07n6+pM3CbAdf9DnCxH/gQt2GYgkhOvcLkFVoBlV2drzd?=
 =?us-ascii?Q?HixDEJURam7WtGe3bcmDjlmbm/uS10R7yF6HRPfBgRp60HWHO7JmvdmVNG0D?=
 =?us-ascii?Q?1jou3sfmDyeV+6nq+YrR7UcGKlJ8BFUpX/1gFCkuo5jlgCz1HQU8wo22ybkx?=
 =?us-ascii?Q?GPbCTqe1i7EV8i9KsijnTaKqeYMk32WB8Y4M8FieQsUISUL3RPtLo0YT50RS?=
 =?us-ascii?Q?GlrYYauwgjmUd5prFuDL91VaS9KBl8Y7y/MksVMUSqa/WdWgtkyG1Vs17fIP?=
 =?us-ascii?Q?gO+JaRv8XjRgSzwfk7EMsWtlB6nGi6Lf33qtTv61b1mM9F7kmcynrpBsVtT8?=
 =?us-ascii?Q?mMxrCyv2bBbrwfqkfbmz7V+qhkYyTC15JUVsTMCvQfPJm7wue4FjftvTf7DC?=
 =?us-ascii?Q?9JPlPvR5HqRkqLa+8HBQ8MpG1yJEVSDCWddaVGqrw7J31NTrdZJGxycCPMwZ?=
 =?us-ascii?Q?Di/hqe4pB+hUTJfOoHGfmHnR1Fp8e6hLxFg+nVS0qZoEDODWuBp8W99INF7Y?=
 =?us-ascii?Q?CRhPgMSKyY/UJAwGyfgFDrovOjw6rPPSdASX0trXZU8JWKKNB1NwISf65DBv?=
 =?us-ascii?Q?iMsYwYiev9y+0k4cGyd0KoYvDk3hAg2iJ1Fr6hSAnbYkIDNdpnTxrV+E+fym?=
 =?us-ascii?Q?+9nU9ISjSC0bINYbpFOTGuvEiofOhqqSfi3AoP/wW+rhBgmM9dwC7WEBonD5?=
 =?us-ascii?Q?xLh3egnNsCL2YS7twGTNQrjyC1dPmnV4B5RkMw0HWdlvQnN67YFwequCdV+J?=
 =?us-ascii?Q?762Uw4ZbdmpgvKKqQvsU0t9t70eJ2MRg1YTcR/1iV+Gh5TNolHEcX9k5Vin6?=
 =?us-ascii?Q?rZ5O4b2SS7cclL57U/s5fPZFb1/KS1z41+uBiM6bogA+Gf2lgir9IAOGn616?=
 =?us-ascii?Q?x5CUIDVgNE+XQvFy3HxNT6x3ljHnI+gc48lZLBaIx6555EwLgwmgX+GSScb+?=
 =?us-ascii?Q?9w3Szby6yTCYyNTSrVIPzET52nNFwBX1rR2o4Es7bZjU4sbtmwgGvxNMTA3j?=
 =?us-ascii?Q?Zb9V9Z9X2oeo21SQgYkeodTAOy1xz+Ac1StEwHy1zxChTfVYmVFtxQqil2iR?=
 =?us-ascii?Q?aelXPlPWiPN65mzo0mgNKWn4dSrZEE3idLr1ARnv7c+j+cXphTEc7LkfHq5u?=
 =?us-ascii?Q?io7PYFRqquAqHyYL5zzpICkV9LDg9q/cyWzmEt3yPIDnxR4a9KIrhzxy0u+D?=
 =?us-ascii?Q?8yM2btSQPO3b673IVcxDooj17n2430HN/z4tE2YYOUqTg7hrL13C4h/4mgRf?=
 =?us-ascii?Q?R7dXqMNMrNMEVsg30/4+J5+QFjcwbUvhRGYVvBdN3ZqC7SgrK31h0IfoLJuP?=
 =?us-ascii?Q?dxn4MHwgd8u1IlGZVFPx/90N4skQP27jidyhSO5sp0Gfsc7sknG4aiBixGGL?=
 =?us-ascii?Q?tkQsDUOipGhQ0cFXpDqm49nJkQOafOdNi2pypPGC16oT/bu3wMDVRGwXvt1n?=
 =?us-ascii?Q?MiSfbUq0kvNp/s9tETSWf6ECBct133iLskdXk1f0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c636fa5-e2f0-4108-3d53-08ddaa20d3d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:20:12.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v0pP0cxw5JUrE1l/yH/G18QWjdnEBJS5+kq4LIdQt8AAI8tnw7ljzfCaTxqd3FrGPcR7EU0RMdt8afDgHjSPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9135
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684b8adf cx=c_pps a=XdZ3Z4l4en2e+C7y5TjdwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=B_YlW_nkAAAA:8 a=pGLkceISAAAA:8 a=PL3nF1HTAAAA:8 a=6VTrYQmLAAAA:8 a=NkzC6hKGOULBiRvHlfQA:9 a=MRoE3BUjVndMUDj3:21 a=nwb-CePKZZm3gL-ai9HY:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=7KSPILAQ4G6cOt27aCKk:22 a=qBetxeCKR0rUg-zYz_rJ:22 a=vOL4U82AISsg7I9yZoEB:22
X-Proofpoint-GUID: b4G9NcPtaD_t8BO9JGdspLgtHtsyrzUT
X-Proofpoint-ORIG-GUID: b4G9NcPtaD_t8BO9JGdspLgtHtsyrzUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAxNiBTYWx0ZWRfX2zd9f0HCyfZ/ 1/DZo9buaVBis1qYvuY1U8L2n0cv2nQHV1l74K7yv8p3Hx+IqqsvUJYcb8euRPdAfzcMCyUijRu gfZXi9HU5hkZwwhL+5Eg8ksURwzALuyhfU5yjNxc8XsdOPNwxJt/wN7MLfJtutm2hIi1OaP3GIU
 CFTl0EKtXKxuE3ND0umr1Q5/rnUCQRQRFGb8umV07XAID59ff/dZHs6PdZktlduljFmiJLvt3cq zRZRCCr5bJMSIMtsLr/IqcOTUWntaXTLrhhfClVCRbJ95LVt15pnIDXPU+8T2oK0NZiS+bCoXUS 2fVCE6pRi3czKjlWjjEAGOnG0gkrrt1014QbBhbRztfwqODHuBy92IO6k29VyCWLgt4JMb/m5Xx
 fYYAqB6ZTK3HIVCvZgnkoO4rQlzojEi/NmqT8iTBAVldFOGtkOy3gYGv4VQbyd9UKcFwfJma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218548

ReleaseNotes:
https://downloads.isc.org/isc/kea/2.6.2/Kea-2.6.2-ReleaseNotes.txt
https://downloads.isc.org/isc/kea/2.6.3/Kea-2.6.3-ReleaseNotes.txt

Security fixes:
CVE-2025-32801
CVE-2025-32802
CVE-2025-32803

License-Update: Update copyright years

* Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Avoid-assert-on-empty-packet.patch   | 148 --------------
 ...me-NameString-with-vector-of-uint8_t.patch |  90 ---------
 .../0001-Update-asiolink-for-boost-1.87.patch | 190 ------------------
 ...po-in-Name-Name-append-to-ndata_-not.patch |  36 ----
 .../kea/{kea_2.6.1.bb => kea_2.6.3.bb}        |   8 +-
 5 files changed, 2 insertions(+), 470 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
 rename meta/recipes-connectivity/kea/{kea_2.6.1.bb => kea_2.6.3.bb} (87%)

diff --git a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch b/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
deleted file mode 100644
index 14f3424570..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 9cf3b6e8d705957927c2fbc9928318f4eda265c8 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 11 Feb 2025 18:52:41 +0000
-Subject: [PATCH 1/2] Avoid assert on empty packet
-
-/src/lib/dhcp/pkt_filter_lpf.cc
-    PktFilterLPF::receive() - throw if packet has no data
-
-/src/lib/util/buffer.h
-    InputBuffer::readVecotr() - avoid peek if read request length is 0
-
-/src/lib/util/tests/buffer_unittest.cc
-    Updated test
-
-Upstream-Status: Backport
-[https://gitlab.isc.org/isc-projects/kea/-/commit/0b98eae16d9b6ecdf57005624712b9b26fa05bc0]
-[https://gitlab.isc.org/isc-projects/kea/-/commit/16306026e37b32a2ce4b16fb5b78561ae153d570]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/lib/dhcp/pkt_filter_lpf.cc        | 10 +++++++---
- src/lib/util/buffer.h                 |  9 ++++++---
- src/lib/util/tests/buffer_unittest.cc |  8 +++++++-
- 3 files changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index 69bdecc0e1..b0c8f108d3 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -318,9 +318,14 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
-     decodeEthernetHeader(buf, dummy_pkt);
-     decodeIpUdpHeader(buf, dummy_pkt);
- 
-+    auto v4_len = buf.getLength() - buf.getPosition();
-+    if (v4_len <= 0) {
-+        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+    }
-+
-     // Read the DHCP data.
-     std::vector<uint8_t> dhcp_buf;
--    buf.readVector(dhcp_buf, buf.getLength() - buf.getPosition());
-+    buf.readVector(dhcp_buf, v4_len);
- 
-     // Decode DHCP data into the Pkt4 object.
-     Pkt4Ptr pkt = Pkt4Ptr(new Pkt4(&dhcp_buf[0], dhcp_buf.size()));
-@@ -344,8 +349,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
--            break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
-diff --git a/src/lib/util/buffer.h b/src/lib/util/buffer.h
-index 41ecdf3375..c426a14495 100644
---- a/src/lib/util/buffer.h
-+++ b/src/lib/util/buffer.h
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -233,7 +233,8 @@ public:
-     /// @details If specified buffer is too short, it will be expanded using
-     /// vector::resize() method. If the remaining length of the buffer
-     /// is smaller than the specified length, an exception of class
--    /// @c isc::OutOfRange will be thrown.
-+    /// @c isc::OutOfRange will be thrown.  Read length zero results
-+    /// in an empty vector.
-     ///
-     /// @param data Reference to a buffer (data will be stored there).
-     /// @param len Size specified number of bytes to read in a vector.
-@@ -244,7 +245,9 @@ public:
-         }
- 
-         data.resize(len);
--        peekData(&data[0], len);
-+        if (len) {
-+            peekData(&data[0], len);
-+        }
-     }
- 
-     /// @brief Read specified number of bytes as a vector.
-diff --git a/src/lib/util/tests/buffer_unittest.cc b/src/lib/util/tests/buffer_unittest.cc
-index 66c43e8f21..bae051dd16 100644
---- a/src/lib/util/tests/buffer_unittest.cc
-+++ b/src/lib/util/tests/buffer_unittest.cc
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -197,6 +197,12 @@ TEST_F(BufferTest, inputBufferRead) {
-     ASSERT_EQ(sizeof(vdata), datav.size());
-     ASSERT_EQ(0, memcmp(&vdata[0], testdata, sizeof(testdata)));
-     ASSERT_EQ(sizeof(vdata), ibuffer.getPosition());
-+
-+    // Verify that read len of zero results in an empty
-+    // vector without throwing.
-+    datav.resize(8);
-+    ASSERT_NO_THROW(ibuffer.readVector(datav, 0));
-+    ASSERT_EQ(datav.size(), 0);
- }
- 
- TEST_F(BufferTest, outputBufferReadAt) {
--- 
-2.25.1
-
-From 614a6c136fc20ee428b1c880889ef61253657499 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 18 Feb 2025 15:03:12 +0000
-Subject: [PATCH 2/2] Addressed review comments
-
-Couple of typos fixed.
----
- src/lib/dhcp/pkt_filter_lpf.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index b0c8f108d3..3642915cc1 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -320,7 +320,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-     auto v4_len = buf.getLength() - buf.getPosition();
-     if (v4_len <= 0) {
--        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+        isc_throw(SocketReadError, "Pkt4FilterLpf packet has no DHCPv4 data");
-     }
- 
-     // Read the DHCP data.
-@@ -349,7 +349,8 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
-+            break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch b/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
deleted file mode 100644
index a7deeca243..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 6b9fb56e3573aa65923df9a08201dd5321a1b1f1 Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@andric.com>
-Date: Sat, 3 Aug 2024 14:37:52 +0200
-Subject: [PATCH 1/2] Replace Name::NameString with vector of uint8_t
-
-As noted in the libc++ 19 release notes, it now only provides
-std::char_traits<> for types char, char8_t, char16_t, char32_t and
-wchar_t, and any instantiation for other types will fail.
-
-Name::NameString is defined as a std::basic_string<uint8_t>, so that
-will no longer work. Redefine it as a std::vector<uint8_t> instead.
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 12 ++++++------
- src/lib/dns/name.h  |  2 +-
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index ac48205..085229b 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -303,7 +303,7 @@ Name::Name(const std::string &namestring, bool downcase) {
-     // And get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- }
-@@ -336,7 +336,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-     // Get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- 
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.append(origin->ndata_);
-+        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -582,7 +582,7 @@ Name::concatenate(const Name& suffix) const {
- 
-     Name retname;
-     retname.ndata_.reserve(length);
--    retname.ndata_.assign(ndata_, 0, length_ - 1);
-+    retname.ndata_.assign(ndata_.data(), ndata_.data() + length_ - 1);
-     retname.ndata_.insert(retname.ndata_.end(),
-                           suffix.ndata_.begin(), suffix.ndata_.end());
-     isc_throw_assert(retname.ndata_.size() == length);
-@@ -622,7 +622,7 @@ Name::reverse() const {
-     NameString::const_iterator n0 = ndata_.begin();
-     retname.offsets_.push_back(0);
-     while (rit1 != offsets_.rend()) {
--        retname.ndata_.append(n0 + *rit1, n0 + *rit0);
-+        retname.ndata_.insert(retname.ndata_.end(), n0 + *rit1, n0 + *rit0);
-         retname.offsets_.push_back(retname.ndata_.size());
-         ++rit0;
-         ++rit1;
-@@ -662,7 +662,7 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_, offsets_[first], retname.offsets_.back());
-+    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
-diff --git a/src/lib/dns/name.h b/src/lib/dns/name.h
-index 37723e8..fac0036 100644
---- a/src/lib/dns/name.h
-+++ b/src/lib/dns/name.h
-@@ -228,7 +228,7 @@ class Name {
-     //@{
- private:
-     /// \brief Name data string
--    typedef std::basic_string<uint8_t> NameString;
-+    typedef std::vector<uint8_t> NameString;
-     /// \brief Name offsets type
-     typedef std::vector<uint8_t> NameOffsets;
- 
diff --git a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
deleted file mode 100644
index 794726f1f1..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From dab0f3daafb760ace0d4091f74ff90edb225ca02 Mon Sep 17 00:00:00 2001
-From: q66 <q66@chimera-linux.org>
-Date: Sun, 15 Dec 2024 03:04:53 +0100
-Subject: [PATCH] Update asiolink for boost 1.87
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2523]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/lib/asiolink/io_address.cc         |  4 ++--
- src/lib/asiolink/io_service.cc         |  8 ++++----
- src/lib/asiolink/tcp_endpoint.h        |  2 +-
- src/lib/asiolink/udp_endpoint.h        |  2 +-
- src/lib/asiolink/unix_domain_socket.cc | 16 ++++++++--------
- src/lib/dhcp/iface_mgr.cc              |  2 +-
- 6 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/src/lib/asiolink/io_address.cc b/src/lib/asiolink/io_address.cc
-index 43459bf..06b7d3d 100644
---- a/src/lib/asiolink/io_address.cc
-+++ b/src/lib/asiolink/io_address.cc
-@@ -37,7 +37,7 @@ IOAddress::Hash::operator()(const IOAddress &io_address) const {
- // because we'd like to throw our own exception on failure.
- IOAddress::IOAddress(const std::string& address_str) {
-     boost::system::error_code err;
--    asio_address_ = ip::address::from_string(address_str, err);
-+    asio_address_ = ip::make_address(address_str, err);
-     if (err) {
-         isc_throw(IOError, "Failed to convert string to address '"
-                   << address_str << "': " << err.message());
-@@ -116,7 +116,7 @@ IOAddress::isV6Multicast() const {
- uint32_t
- IOAddress::toUint32() const {
-     if (asio_address_.is_v4()) {
--        return (asio_address_.to_v4().to_ulong());
-+        return (asio_address_.to_v4().to_uint());
-     } else {
-         isc_throw(BadValue, "Can't convert " << toText()
-                   << " address to IPv4.");
-diff --git a/src/lib/asiolink/io_service.cc b/src/lib/asiolink/io_service.cc
-index 411de64..cc28d24 100644
---- a/src/lib/asiolink/io_service.cc
-+++ b/src/lib/asiolink/io_service.cc
-@@ -30,7 +30,7 @@ public:
-     /// @brief The constructor.
-     IOServiceImpl() :
-         io_service_(),
--        work_(new boost::asio::io_service::work(io_service_)) {
-+        work_(boost::asio::make_work_guard(io_service_)) {
-     };
- 
-     /// @brief The destructor.
-@@ -92,7 +92,7 @@ public:
- 
-     /// @brief Restarts the IOService in preparation for a subsequent @ref run() invocation.
-     void restart() {
--        io_service_.reset();
-+        io_service_.restart();
-     }
- 
-     /// @brief Removes IO service work object to let it finish running
-@@ -115,12 +115,12 @@ public:
-     ///
-     /// @param callback The callback to be run on the IO service.
-     void post(const std::function<void ()>& callback) {
--        io_service_.post(callback);
-+        boost::asio::post(io_service_, callback);
-     }
- 
- private:
-     boost::asio::io_service io_service_;
--    boost::shared_ptr<boost::asio::io_service::work> work_;
-+    boost::asio::executor_work_guard<boost::asio::io_service::executor_type> work_;
- };
- 
- IOService::IOService() : io_impl_(new IOServiceImpl()) {
-diff --git a/src/lib/asiolink/tcp_endpoint.h b/src/lib/asiolink/tcp_endpoint.h
-index 8ebd575..7c8cb35 100644
---- a/src/lib/asiolink/tcp_endpoint.h
-+++ b/src/lib/asiolink/tcp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The TCP port number of the endpoint.
-     TCPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::tcp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/udp_endpoint.h b/src/lib/asiolink/udp_endpoint.h
-index f960bf3..2a3da9f 100644
---- a/src/lib/asiolink/udp_endpoint.h
-+++ b/src/lib/asiolink/udp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The UDP port number of the endpoint.
-     UDPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::udp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
-index f43e1c9..43ff3c8 100644
---- a/src/lib/asiolink/unix_domain_socket.cc
-+++ b/src/lib/asiolink/unix_domain_socket.cc
-@@ -83,7 +83,7 @@ public:
-     /// @param buffer Buffers holding the data to be sent.
-     /// @param handler User supplied callback to be invoked when data have
-     /// been sent or sending error is signalled.
--    void doSend(const boost::asio::const_buffers_1& buffer,
-+    void doSend(const boost::asio::const_buffer& buffer,
-                 const UnixDomainSocket::Handler& handler);
- 
- 
-@@ -103,7 +103,7 @@ public:
-     /// @param ec Error code returned as a result of sending the data.
-     /// @param length Length of the data sent.
-     void sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                     const boost::asio::const_buffers_1& buffer,
-+                     const boost::asio::const_buffer& buffer,
-                      const boost::system::error_code& ec,
-                      size_t length);
- 
-@@ -127,7 +127,7 @@ public:
-     /// @param buffer A buffer into which the data should be received.
-     /// @param handler User supplied callback invoked when data have been
-     /// received on an error is signalled.
--    void doReceive(const boost::asio::mutable_buffers_1& buffer,
-+    void doReceive(const boost::asio::mutable_buffer& buffer,
-                    const UnixDomainSocket::Handler& handler);
- 
-     /// @brief Local handler invoked as a result of asynchronous receive.
-@@ -146,7 +146,7 @@ public:
-     /// @param ec Error code returned as a result of asynchronous receive.
-     /// @param length Size of the received data.
-     void receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                        const boost::asio::mutable_buffers_1& buffer,
-+                        const boost::asio::mutable_buffer& buffer,
-                         const boost::system::error_code& ec,
-                         size_t length);
- 
-@@ -197,7 +197,7 @@ UnixDomainSocketImpl::asyncSend(const void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
-+UnixDomainSocketImpl::doSend(const boost::asio::const_buffer& buffer,
-                              const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::sendHandler,
-                                    shared_from_this(),
-@@ -207,7 +207,7 @@ UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                                  const boost::asio::const_buffers_1& buffer,
-+                                  const boost::asio::const_buffer& buffer,
-                                   const boost::system::error_code& ec,
-                                   size_t length) {
-     // The asynchronous send may return EWOULDBLOCK or EAGAIN on some
-@@ -230,7 +230,7 @@ UnixDomainSocketImpl::asyncReceive(void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
-+UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffer& buffer,
-                                 const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::receiveHandler,
-                                    shared_from_this(),
-@@ -240,7 +240,7 @@ UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                                     const boost::asio::mutable_buffers_1& buffer,
-+                                     const boost::asio::mutable_buffer& buffer,
-                                      const boost::system::error_code& ec,
-                                      size_t length) {
-     // The asynchronous receive may return EWOULDBLOCK or EAGAIN on some
-diff --git a/src/lib/dhcp/iface_mgr.cc b/src/lib/dhcp/iface_mgr.cc
-index 01a1d63..419268b 100644
---- a/src/lib/dhcp/iface_mgr.cc
-+++ b/src/lib/dhcp/iface_mgr.cc
-@@ -1034,7 +1034,7 @@ IfaceMgr::getLocalAddress(const IOAddress& remote_addr, const uint16_t port) {
-     }
- 
-     // Create socket that will be used to connect to remote endpoint.
--    boost::asio::io_service io_service;
-+    boost::asio::io_context io_service;
-     boost::asio::ip::udp::socket sock(io_service);
- 
-     boost::system::error_code err_code;
diff --git a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch b/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
deleted file mode 100644
index a24a25f1c9..0000000000
--- a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b5f6cc6b3a2b2c35c9b9bb856861c502771079cc Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@unified-streaming.com>
-Date: Wed, 28 Aug 2024 22:32:44 +0200
-Subject: [PATCH 2/2] Fix unittests: * Typo in `Name::Name`: append to
- `ndata_`, not `ndata` * In `Name::split`, use the correct iterators for
- assigning
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index 085229b..47d9b8f 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
-+        ndata_.insert(ndata_.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -662,7 +662,8 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-+    auto it = ndata_.data() + offsets_[first];
-+    retname.ndata_.assign(it, it + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.3.bb
similarity index 87%
rename from meta/recipes-connectivity/kea/kea_2.6.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.3.bb
index ff7fb51fe0..45e98e516f 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -17,13 +17,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
-           file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
-           file://0001-Update-asiolink-for-boost-1.87.patch \
            file://0001-make-kea-environment-available-to-lfc.patch \
-           file://0001-Avoid-assert-on-empty-packet.patch \
            "
-SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
+SRC_URI[sha256sum] = "00241a5955ffd3d215a2c098c4527f9d7f4b203188b276f9a36250dd3d9dd612"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.1


