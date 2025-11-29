Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5D3D116F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 04:05:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9354.1764389127751879263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 20:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FtysVXVH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3K5ce582206
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 20:05:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=; b=FtysVXVHuX7f
	v5x79Db3AISfSfPDWhyT5WyTkPgoSB62dCeaTnKo8Ma2q4RCGNC6k4fDJieGs1yQ
	TJeKIA7iUTE3/RorPW4FEMLeLsb5Lwn/nfjU9xZ/cFQ+0ncj1rXJtAUDOUW8gzDF
	mrXTRbHBM0lS8sXyWxbjZXsuEHPV6sLOvXTxz1xqt0KjoHZ2Mvzt+Yc0vSZqKqzs
	BNXWC6iBW8mvW0URvB7EpSmWRPHNQzClF6g6v4r2bJ1Lv9ujON1FeJHvEtZto8oz
	7V6JJrm1obMspVsCAWiOFd0setd4wb0XlmHIHh5WrN1mEUwLiigvTMz3pBN+OPED
	2XgRaRXivw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5fbnt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 20:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaPzQGTmLYL6CofgewFvb0+Xc4Dhs1Y14JkFrgecoNU98GgdsxsP269ZTiuitN6mwtz/fcXSPzDqnAVv7ULFC3wf/M1qJ6CW1H/kmAokizVJr/1mIWgSZWLNvZURcfnRs4AYQwiEKXtsmJq9rbEibNKBzIULbadhYUFsj9HYf30wWSH/wftixgfJVWpCkHgFWVYHz2macjYNnGS6OOW+fN6ahM9B3wBNhr8hkRDXNWyVg/eNfH4aqP+TirPMHkAZPNPWqOZA1lZznhUdiogTfSBxaUuyD+BHp828x4PcYeYMWoyRAd3qw0DNedDhuOxAP34VQK2jj3mrL9HNd/9xGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=;
 b=j5GPkqtF1XXuju0oc9gVlxiyYnLFGlIcr74q57WHXDXe31VtkknfBJN3425LLX+UjGxa0pHcSmBbWD16rJw7ljVnBNqr26nN8tWMjfhX5eSToR4bR+fTBIeMPYYyHb+BqbmOecgX32K8S69JedVcqFjMtq9EONbP4eYB6WIm4X758AC+XMonv3SHuYuzZnaL6P6krjnLw0X3xkuYSaveIBAlLcDWVqhIhAzZGdNWmof4m9dZA6dGMMpXVFsvkkEpmuYFsNI/WFv1H3BzrYljnZcJ2yWz5+DJVnHoL/STVs70zd8F9b5qZgUA9tXftnjdvGAFFSkUuZ/6ySBHUAHdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Sat, 29 Nov
 2025 04:05:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 04:05:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V7 3/3] xserver-nodm-init: avoid race condition related to udev
Date: Sat, 29 Nov 2025 12:05:03 +0800
Message-Id: <20251129040503.3958950-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251129040503.3958950-1-Qi.Chen@windriver.com>
References: <20251129040503.3958950-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 605c94df-1993-4bf0-1e8f-08de2efc845b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9WycfiO+1ymO/ThQakTHAOOLI3Y4i++zq/2/t9PVzy/C5pqxzgFwQsBid51c?=
 =?us-ascii?Q?ESTvhOXgD+apD97noBrvXHu2kgwdznwtuz/Jeb7P5ipKF34DAbVmXIEODUom?=
 =?us-ascii?Q?XjXl+teyV1zeTIlK4CmcmIlCxri2voKjkE5eqPmrrrBLkXeR484TVXRI/Ukk?=
 =?us-ascii?Q?CWDTlrYXvUBbe2f7rb7dblUFR8iG7pYYy2pGnoiTlDeeqDCTOr1IW3LE3h6k?=
 =?us-ascii?Q?4xeSrOuBMgtC7l2qSO9fnMfZPFvaLo7Jfj9O/6ZC90BYsP8naQvMMrqHJacj?=
 =?us-ascii?Q?0u3h/T3EcmtN1MvqpsdGEhM9HHx2Nk6UakrRUik+PSE/zBWbS1sfCEYFmapl?=
 =?us-ascii?Q?WNU0mVB8vMkMzipZ6C+lxCrK3d1kqeSn0f7IlgrPeWO4VSx5QAi7IFOYc7Fn?=
 =?us-ascii?Q?nBWZBsHSnROpqZs7TZAi5aFvgxLGDFnz+xi6dyPe6KEmA5/os81Ikh26weBk?=
 =?us-ascii?Q?ypsZ6xfGD2+Lux7csgkmgn/7rWzGvQw/fQkrNHR+2Q5JmEdCdb96O7DmQNLV?=
 =?us-ascii?Q?fdRRDeOCd07S8WN1RwzhY6th17+RjruX+c9LqCrDDSescV7L+h7SIYYf/IDW?=
 =?us-ascii?Q?SXo2Bu0bwGdwwG1O5dNqhWiveNJm1xlxGpkg5k/g6h7HJaZhEuoHF8ASe/cw?=
 =?us-ascii?Q?J55EWtpXFiKwOsT6Eqnv9F2x4ohZHcZAXj4qbDWqH3wSYuyKTktua+6Ct6+2?=
 =?us-ascii?Q?CtaAX8WMdUvPZxa59+Bkwfclgr0ozWX8zHjZhJiBuVcDUSKIsaWK1+s+5tEt?=
 =?us-ascii?Q?+kzU3gIu4GsI7p5CreQgArmXNCNCFE1EWaFE678T+hhvEcrUEF4/BPQ5XOh5?=
 =?us-ascii?Q?9rD38mLeYMwJ6ehqD/pJQ7TJ/yq6oTkxYSfmFNPT80Dulh4lFIXL2oSol7Qz?=
 =?us-ascii?Q?7Ujbx0STLPbqHwajz8/j0WhnM3eIhnecdUWjPGPHEOem70grOYFo6dkZCNLO?=
 =?us-ascii?Q?FDG7Y2aySfclWrez5zIzYfC++rw0cuzu7eZhu6sSX/wzhl5ZnqCE5sag8yNw?=
 =?us-ascii?Q?ZgMPsxcwoB6lHj6dRR2XX/wvgA1AYFhx57tgjqEkZqmc8351u/PFZAlfc3et?=
 =?us-ascii?Q?L8RPUXBYhmKGttPznostkGSr/jUbSC1jaWQ+Rz9X8BXK4it1JHNP2hG1mT18?=
 =?us-ascii?Q?8Qqm4NjmZOG63XCWcEdg0TUTtI38QNvHQscDbhDV4FX1XQlv8tht2hCpxVCf?=
 =?us-ascii?Q?3eM1AiWUNoaFQMFZrJ/CsMMdUtDFqns0obfpd1xwf0ALMUtKXCu3ncckCXH5?=
 =?us-ascii?Q?3tQtZZeWkMGjKn+IXiRj+9Mkly507Lvo+ZydcXphp36apMcfhiZpC4O2jLX4?=
 =?us-ascii?Q?ot/uz0Cv6XXk2xbPSZjg0wVtO2rQ1a5jc/xtsmmsApv30mujQYqa5AOzBcOy?=
 =?us-ascii?Q?+RcQxoMpyezAZ1pMFiv41oChLGNIr85TYdlOT8CcBHZ6qkhJY5ZAr5PuUsMA?=
 =?us-ascii?Q?rXMKuDLvXZyWsgU6CdLHmrZNhhylYQ/xWxyUrU1EyGmfPmC1jIAqvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1UzICKmY/dW2zoHsIbwYr7X78l2ydwhBpfK17Y9ulTNG9pNscjkL+qoXiRL3?=
 =?us-ascii?Q?Kx3VbrOjNgF7fahRAPDIxXodebIcq2wsFVoIIpMPCTDfeKoN7WkobbyZdyTF?=
 =?us-ascii?Q?yMKS+xkgrB8868OH7QnIvNvvvSGuf/9hjT0F+azvjWP/7jSF9V//3CO34P0x?=
 =?us-ascii?Q?KbZfMfjfESysTPzmrgMTEVISuVicCgcObmR73J3ROD+alpNc8X4wYyabaRv+?=
 =?us-ascii?Q?BEz4wZ9m7RVW0PFAnHK1EHhA/MBNT82GYAWV5PDPM7acCvlD1/Q3vu9bFz8A?=
 =?us-ascii?Q?cGHfLlMF4Uo4wMumv4GND0FdunPWXwkkqFa5XJKIdA4b/gNYg9Y47T8pN85i?=
 =?us-ascii?Q?jpCwRuNJGKugibZyh/215xHuZ5d3qwGq1v9l/i9tlAPuJjsKfF+RW7BQ9f7a?=
 =?us-ascii?Q?VGRhLdzUFAio2R8wRrrETQ2uevgtrjQkoTGG1tvclIjf+n3bS0MaQMiKC8UX?=
 =?us-ascii?Q?X6LDIG4PxZJlVWz8GC0y9tZtmhMh2F+MEnAE9OslPZ7Xk+JKQ/iMS7KpPLBY?=
 =?us-ascii?Q?kMnruXJWYmQwNFrDG2QXsAM9RmpzBqkDIcJmpOxZv9zlHxkeGEwW1HheXXVG?=
 =?us-ascii?Q?ccJIRiC/Yd9rg6Q6GaiAyc/2EaG7vTVOudgLFF0DCIImIS3HrYbILCr3sO0e?=
 =?us-ascii?Q?0pJ6YDNYE/HPM3iPD0pD1Nc0YWyjDPIi2pZHlJ2EGG4WQE+aO3bcZWaq/IYa?=
 =?us-ascii?Q?QGopRowz1QSGXK2Zu/M/XaNSBlIXXcJ8cJ+q7hoTyHegUkvyLpBwPfsxo9aE?=
 =?us-ascii?Q?T3HpCtZRZ2SUCAM8PCH3c9b1kwV9hIltyGKihb7/X1hJkv8hGC0mKHisaehb?=
 =?us-ascii?Q?/fR1xajKAqGwx7CdqY7FzkjId0k62ghpAd3p2BjQ2rmDNCE27dgZHRccg9fQ?=
 =?us-ascii?Q?kapQ3mF7vfMBrkLZWIbaq7CItQWMQs2fNU+K3H42RVE9wQJWq2VkpWEL28+m?=
 =?us-ascii?Q?BVFpZH8ehLUSNSkJ9rjm2hxBqasGx1mTgTWo/UzFce2NjQC0ca5KjCsRyp+x?=
 =?us-ascii?Q?76mLxLefVR0YQbqZUylvMxUnVDmBpDVoZtQfoKGx6Y5CLhV3U3Vpu+7eRvFx?=
 =?us-ascii?Q?lrfukBdVhLUMu0NKioI5LKZ3MyJam5AgDA/AnPpoXfSct+nyzBwik/s0Z+ea?=
 =?us-ascii?Q?GdSQS+dHycUzwJmyZzuTUUPMW4hrgi4QMHCo4/ysFoEz8z/k/RdQTihrDpiu?=
 =?us-ascii?Q?UdZ6OWvUngP0jM/uUh92MzIfOysBx77Lu6fSc1GHv2rMn4CWZ6egbe3dOvUf?=
 =?us-ascii?Q?aVZRPTIs9M5EPyHg8i5ulFXKfcJ6zymbk75VPbE4ze/7KC7NGjW80WTDsH+y?=
 =?us-ascii?Q?1xCOxmm2wdB5MmDxdCmHVO+eVLYM+xTXcFG5zK7FFgRqMOzOMIActqJraAe5?=
 =?us-ascii?Q?NmVauHOT+38q3RYrwgEkRv8MvJMgse2XiLSTfPgmceqc+I5OQAKM9WlYWeDI?=
 =?us-ascii?Q?RPwZB2V7mWuZX4Af8+KByADDfCRH+q6WNVZwFvCV9IDhAw9Qz293JYEmE3Gy?=
 =?us-ascii?Q?5d0nqzmNB1SqNR66aTGhckDYikZljwXaCfFuXFizeq0OVBM83pSuyqMEisji?=
 =?us-ascii?Q?asZciW8O5ClRlANhBmnmuzvgztW2/6Uu3wS4Xs4i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605c94df-1993-4bf0-1e8f-08de2efc845b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 04:05:22.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fBKhB6v1hXM8dNPY6AypQaOLEbHjw3v9t1g3zCdFvkiqnqr7fua9PSqOzTEyXaItmr+iWFiDp9X9Gf5aL/2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=692a7107 cx=c_pps
 a=e4reWzpetjGbn3OykFohnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=et4UR6atNtKrrsjGgL8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyOCBTYWx0ZWRfXyUqoFwkN5Pr+
 ZhcKTKyRiE4uebNEExUNBfOACQnDFwOkHJPaRu5SVF0pjWqT4UaGmZXwXHrlU2iwQhnvKD4gM0Y
 enA/3kDjsIjabTkgRNFG2h1lZlYY14eFgHhwW2R1ou4PCfjjsCy1ZuxwSMeqAjcdoT3684yYKNi
 OgYW/LsKVXmOTYZqe3OqPvuom/YsjI/zgFWV8U4dsxZp7eElvsd1vAjptAwrhNXzeN0Gmgf03EV
 FsQlzeCzUz5WtWIPwUWpg7G7ys2mcZTVrT0M/ku1ziaoVT3/vLsic67LlfRqAN3uMzGG8R59h58
 jIzvFKaJA8WkEetuIBg2e06BziS+3get0vcL2fWQaSYYBtlaZUzTd+Lea8Wfs//JGIDj9AEZYSZ
 USqxLIYtCZ8RHorwf9qWKujOKvuImw==
X-Proofpoint-GUID: Kf_JUQ0Dx3ERbZo3C19KKDMEaKx4HMyK
X-Proofpoint-ORIG-GUID: Kf_JUQ0Dx3ERbZo3C19KKDMEaKx4HMyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 04:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226929

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to 258+, there's a race condition error found
on qemuarm:

  failed to find screen to remove

This error is likely to be introduced by the following systemd commit:
https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

However, I think the commit cannot be reverted, not only because
there are a bunch of changes based on this one, but also because
the change look like a reasonable one.

Before xserver is able to handle such issue inside its codes, this service
need wait for udev to settle things before it starts. This can avoid the
above race condition error.

Fixes [YOCTO #16045]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm.service.in        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 87dc4f8fcd..43aaa84c0f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=Xserver startup without a display manager
+After=systemd-udev-settle.service
+Wants=systemd-udev-settle.service
 
 [Service]
 EnvironmentFile=/etc/default/xserver-nodm
-- 
2.34.1


