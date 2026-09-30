Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF32ACA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 04:27:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6150.1790742463144185794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 21:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z73WsB9q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1gsVN1950201
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 21:27:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7A5ewRoD8
	l1Evbw/JWxmxbgtMpHZWntd9JR98FzXk0o=; b=Z73WsB9q/fpglZiZLmlxq+cuG
	bI/9RbHOZILbFsN6/9RkQJ9NxaIWwHUTdKRoZetjC8wtWWa2ush577R0Ot9mi4aP
	zuNmmofc6Z1NmjzjmCPM8+WeyxeglW6ONEax/+SaSKmXz9+kN8M6TtYYwp19rToJ
	7mgJLPjbResBHP9eCZINPVzRwqT3AqwR5gqZzhHNeDw0ocKg39ouMHRwo+lJkzkU
	7kw93Kthe970wdH+82JHAdkdf82pxl604MwOhIdBjuKm32TfVsGvBwCZ3l+ksTi1
	BxejpFuAEoeLMxG7EQqLnl8P3kCi4sr1StMFJGvQSX/iLxYmyDgxyADwIM3Lg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020106.outbound.protection.outlook.com [40.93.198.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gxdjgwkyy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 21:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOLW1bGXG2w+5bLIZ8O3P9bUFi5nAelqxsoUbZ57ISEHd3A5Rc6J2cwAGiQAfp1K+I4YZXp6O76IHOGHnRbl51jz1KLEgQ+4vPVPb20xXO6ejTopZ6xVmSSFhkICgxfIDMvtSvffl2kNClwNKsRSxewk6hWI3wC128CVNYCWFuX83uvNiLS3uueNdJBlszvZGzdk3dq1o4C8T92YvAJZY/iAdcl9GTb2dmyq23BPf3C9QNhsNkg74eICqLX0uX8AgEPB8fk/Jt7+ByBIalHJlKRmFmIAWgisQ418zheAP34Quc7uUmWDpXevlctRWXacJdoHO1Sqb6WzaIcYcvSP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A5ewRoD8l1Evbw/JWxmxbgtMpHZWntd9JR98FzXk0o=;
 b=amaHQAViGFSji8tnXl9Rr4QctKVPzmLMycHHKKJvEobD8Xzf5HER88IL5UZljmoPBIC4ca0tG/qpL0w/4zxCRvIZ4o1XalAHSk/wgEmgTSakbs3bvyi6lNTNfrNE6i9XVrEwD9603ZrdeN9IBZpkGtcG+070ODIA/fT6r+09CROqk6tDi9lXcC4kBHW2dPjyvQp9yAmoSbE9eRTK4JQlAudDyGYTmnwZktfyJjdcAq+1vkvcpwft4XTSxmQnYISbE4GgUC5hGVhwygpXxmQoD7+yXBbamLYCD1Qgj2+LwmmLjcwmljInmHf/JLls866PcTsUJAoNjxZGHrDO+wurKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Wed, 30 Sep 2026 04:27:39 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 04:27:39 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [wrynose][PATCH v2] glibc: stable 2.43 branch updates to 9cda6fc96ab
Date: Tue, 29 Sep 2026 21:27:25 -0700
Message-ID: <20260930042725.1329282-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0044.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::10) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d01919b-6d0e-4f84-dc3c-08df1eab292a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|11063799006|56012099006|10067099003|3023799007|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oK6b2zc/Zhcr+9vMOwTkkny6HZDOoO1CeUJeCe2X5gS5ZYDyQIlkTYkV95ipjzOvccP8Ec+J4GvoHNMLNklmoZU6uC4DCWLgA/8LtjHlwg3yhDfgK/mp4zYBcgbOO147EUqjEbhJtsFJUuXxcObsJY05kYzsxNmHI7VBz0exBIbq9C5mbck+qL81I/x1z373CMsF32UrcFSSHJgccf5gaJ5DzOiiRQ6t2dOYRCW8JtJUfPlshHRUAe9IAY+SEZxi3+fE4HT5KFvmItmQj7nlL+OUMkwIwuDmclu1Q/HH2dBkbOzcZpfbUv7CQn/iAgVkkIV9XXAigT6hUgHmQ5X2cR1tfWfMEELVvEA43+Vdh9Zbg0cYbc5raXByretYdR9X8FCmPKIVV1epHGbkwvazedXnIuZ1SvDvGD1UmW3AQNevKVszWEUP8h57PM7V5u2GR2n39KZG9zGBsSg0mw7nGEG83Hd+Ls6r5I/WrpoaxB/QmoIt8eX5RrmJC36vF0Z7SKRpISd6g7GsthM0LuWrR9gZPI4BnafOY63kXOZxc1mLTUil6xScqpigONnBXTHZ4IArnBOc7IpM8XuSZNn8eYCK0DIsXgINAcmlcFi1SacVjVAhFp2ruxbMLn2i+CBAicaid/Dmr4Itn2PsiruYnmxobdDUC0BNCGeVS3zVKqhabOAW+wb6tvcpjGWAvrLuho7XzYVv3TigMFQ4LwrN03Ua/Fztcy8ojY2e3rgSSIU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(38350700014)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cXBPAfZMn6oo24NM+t9xi3GTnTWePcal40fSxustiQ3U/hWna2qP4+i/6uRr?=
 =?us-ascii?Q?JOKneb06O3tSMztpuCRsA+sxbxeC6HaCzu1tLnuvayE28PdEk0iKH+ycDmje?=
 =?us-ascii?Q?i4C/yAFqS0zc0pTrRxY0L8/LZgBEqqWEz6qY2eES3XHHc1KYPiMDf7Iop++q?=
 =?us-ascii?Q?/Et40fUKFsn48KAPs5gqZEncgF8duILgSEOIc6ZW508Uy1mp0N2J782KRIGX?=
 =?us-ascii?Q?K3EsLs7t7Mv2/GeMIO4xKjPyHsZStxnbQMXnnLeewsy9cgG7BkO4tFlRNuGd?=
 =?us-ascii?Q?pUQuOZXtrvxaQg98Ei6wirrNarn6SiRiz7/NS7/SsSwJdyveWi0HWpN3NFNi?=
 =?us-ascii?Q?CwJvy9VGHpqIGSXX67pIYX3l+RlujE7S8aKcDY7IpfwoYhq+ELlWymmGMqON?=
 =?us-ascii?Q?e75zXrFUZtH7XkuLrjdMFSFUBHGtTwrxjraujWT9gi6qBkjCjPh37eNvQh9V?=
 =?us-ascii?Q?9McHwO9THvRX30VMC8OhWsVUk/LqBDa3e3DdMqDAmHP5kaAxdh6w6DbhWRTX?=
 =?us-ascii?Q?viRd9yqQ3qUQ5N6EKJe2SqR+2o3D3NCEwjDIJjxQNUGuiyz7l25ps8jj/i7j?=
 =?us-ascii?Q?2IhXLFrkrHTkbf7+GEjpec8HpNdRdcskTbfka8ha/Vm+W9gVdSJMrwIcYef+?=
 =?us-ascii?Q?1VphjFXms9GyGyiHL7sQSIQ3dXk+0nODeqWqonsfsI9aT3gK0ObABzA/xcoI?=
 =?us-ascii?Q?GH3tzjQYtii9XOTxiLXnUOvj8znNF+FNNNiwF3KPzU89PJytd14RUw+F2rW/?=
 =?us-ascii?Q?D78xUXG94h5R8yROCBTzdrXYz7H2PAKKLuQe9Mv2VI95OL9CNDGT0bvF4yYC?=
 =?us-ascii?Q?jVKDzRfWuK/ZqLVEyH2wqN4UWiE0im9qwviafVxDzsw+MtI2qNy3tikhCnhB?=
 =?us-ascii?Q?XfNYkfY3gYhTv+S22kxQzSm8MNVISQOOsFwPpa5fBq0AumDYoxV2rMlrIptl?=
 =?us-ascii?Q?6q8gRm+UDDXyJEgrr7P+xJxR5B9ZSwhqbfyMJF8zSkzkYKNN3udCbOOZ6+84?=
 =?us-ascii?Q?1/ah7iHQLcVLTXOb0uNakNT+NUKakPjVrqaCUhPTS1Om7WwjfYjolhS+0krj?=
 =?us-ascii?Q?nym74ZJtDvWs8kTvffsaFuE2y3eHcUk2wBqtSVjcEDk2/789yosJswhIQU7D?=
 =?us-ascii?Q?Qvrc7EH9UOiE5GBNMwC7Tw78FAumfaFz4IMi10QSnASzogBLgXjuxyd2irY/?=
 =?us-ascii?Q?ygyeS5gsYpm/jLWkT/UAeX6lGdrjgT3FkekxQqtFHj/OExmsKPSfV5evyRFW?=
 =?us-ascii?Q?gQhXeCRpTdqZzGS63RUVuGh00RISrqHze8pdk5kvEQG3UTt4fzEWsvnIPEsg?=
 =?us-ascii?Q?oE2/3i0jLBCqU+/7uImDCpo/oMmgBzQ9BKn3sBSA00RihIn1I0NuoziVscEc?=
 =?us-ascii?Q?+urUJIe2GKsugSh/Z2WtHJFmb9W2IEAYtB0wD2DfeFZSEcrLqBkrMXgIGw88?=
 =?us-ascii?Q?cBEMHcb80t2uZtuLN7kB2gYgFIkaDG57a9rBRlfSRTb+2weKvews/raEkHi7?=
 =?us-ascii?Q?z3jeu/9h/K1DR33Y09yOHJVfj2X3MxHBzCV2QvYrt/Do+y3qsGShmJ16Bxye?=
 =?us-ascii?Q?pB3mqssrGUqZ02k6aVQurUf9/wtom2+q+GFdv+9OCHZXeKVS/9lr8PAd45BJ?=
 =?us-ascii?Q?aXOWJqx8NY0RXCMFWfS2/Mm4X79fN8pyK+0kH+2E3/Ufvq8fDscdBLMvjS62?=
 =?us-ascii?Q?UCI+Oy1awe8KnmIAeSyJwglp6fZOzvVgL64m7h/vXWEXs03y/zEzaNYgaTbq?=
 =?us-ascii?Q?UDLipQyWMV9/prtU3gNylZZEyxenX/gyr+0TlQgdiRWsBcyvAHs0?=
X-Exchange-RoutingPolicyChecked: 
	g0fLFOJwxMiHEDFtjD0/ffkpJXbVyCLKZWw+APozS8m1i6p/PKA5YKFiUch/C7KPIDTib0wQ5c1/X5WIDe0/AzArAF9sfK0e7GBSgvBLCAJ+ZRJ5la6aCdTGz0Yv58nJHvdo0FiIO4iwumGPhP36h3y/0ZYeArbwZaayiBREKpZRU42p7EwAdw5ZK0SIJJq4QLTV1Ceol01IcH1jiv/dmrA6zjCvN3CS0srbeyxIWbV1wiCfmKs8Q1w4rR8Xpu4jp6H6INuIWnPipXkd9q4hpH23c9zGn4lh6z856fLa9P9GU+FVD7tvpmxtCrwH0aud8S2DRPj+09nEoh/XFx8lwg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d01919b-6d0e-4f84-dc3c-08df1eab292a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:27:39.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoQbo3ehlJBcOPJLc5GJo2Pw7fRjhb7JA6Sl0Pyw48+EmLRYCYOGWjRr/zKkiyCRDzt8TTfFJI+dpoHOcV985LfXy2hme6XxwPevTogX7/dypCiD2W9u7yhdjwTZggCd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Authority-Analysis: v=2.4 cv=C/F8WgP+ c=1 sm=1 tr=0 ts=6abc8fbe cx=c_pps
 a=1AGwoMbQLPMkAc8tixWUIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=I5Ir2K9uQ77gZajUmnEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: uH0N3yQ7dHebvF99C2vtUjZ22PiZwy6Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxNyBTYWx0ZWRfX7LNWtfO1howp
 uiOcooSV67D6Vfla1ONXn/4al6EcbbDwDMdAgZBarPeRfAtwwIkG7G7otQr2ig1YCi75r0Sv4fN
 u+XwvGoOnAPgEPcsjZ3V7nh5WJ/TeRFrm+Fd0x4HduAd7GgbIFC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxNyBTYWx0ZWRfX03tTDKxJaKrQ
 9XBjA6YZPO79xQC4ld7hiO9w3i78W7HP/pOjZJDmHvORCChnbCSj0oG+9IasKd6hna3k7qeZF1g
 e0qFzYP3SQEHF0x7j+y4mVPSHKTDDy6B3QgZRQXHwJYYRGDIhRMJ6p0hBzXD7SDvN6Hbi+adMYy
 A7bFQNVGIZsKOpIZXrU//pzDV5jfdJM5M62eDUhkUlsv89DMUJEwy7VR+vMzvG/9ouI10BBIIue
 MPa3PwlocdX7RuM9MyODFkCksNf0rCJyqcIy2YGSCS59j4FOPrHBmoNFUs8nQLsYhy9eI54+aWo
 2JkLk2iGAkJnJrI+mgfEEFoKEt/xOh1zXsC2thwOJZSxM5jPFKZv5nPuXboHcmXNH3GMW3A6rLQ
 KaGyzz7aNPtGxhrgbVNGSf35bg5+Y4JepsKhezD2CTRRhx9ara6J9e4cCQD9YSRqzSm4oitduil
 k3yLnPGDUEvc+k1MVXg==
X-Proofpoint-GUID: uH0N3yQ7dHebvF99C2vtUjZ22PiZwy6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246907

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

CVE-2026-6368 CVE-2026-19499 CVE-2026-77117
CVE-2026-80489 CVE-2026-18374 CVE-2026-8674

Commits between the old SRCREV (1c9988e5254) and the new SRCREV (9cda6fc96ab):

9cda6fc96a stdlib: Don't call clearenv from __libc_setenv_freemem
d6c6dd71c6 resolv: Fix assertion failure on search list truncation [BZ 31026, CVE-2026-8674]
65f2295a98 zic: keep needed last transition to new type (bug 34618)
f8f3d451ba nptl: Skip pretty-printer tests without python3 [BZ #34507]
d9a8ff5c01 hesiod: use booleans in parser macro calls
1c1f5103a9 hesiod: fix swapped arguments in service parser
049168237f nss_files: use booleans in parser macro calls
0770e8b07c nss_files: fix swapped arguments in service parser
20b3e87176 libio: Add test for fopen with an empty ", ccs=" value [BZ #34574]
72351055c6 libio: Fix CVE-2026-18374 heap buffer overflow in ccs= handling
8dad0ee453 alpha: expect test-float32x-float64-div to fail
f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
c4dac931ab alpha: Fix stack alignment in makecontext
76115597fe alpha: fix setrlimit compat symbol for negative rlim values besides -1
c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
7d26579873 malloc: Show hugetlb tunable default in --list-tunables
8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6592   | 6598   | +6   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 127    | 125    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in testcases:                     Before   After
malloc/tst-malloc-too-large-malloc-check   FAIL     PASS
malloc/tst-malloc-too-large-mcheck         FAIL     PASS
iconvdata/tst-jisx0213-progress(NEW)         -      PASS
libio/tst-fopen-ccs-empty      (NEW)         -      PASS
posix/tst-wordexp-append       (NEW)         -      PASS
stdlib/tst-strfmon-bug34510    (NEW)         -      PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index cf5a444095..5f6863df16 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
+SRCREV_glibc ?= "9cda6fc96abd035d9cbe68482138d4a78a51a7d5"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0..104d6b4067 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -20,6 +20,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
+    CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
-- 
2.49.0


