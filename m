Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E7EFD4F16
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:45:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1394.1773164700898136538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PlrWtrUx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75297c066b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5MmD8337102
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:45:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tjgn2YCk5jLzsfQ6fgjIT5W1Z6GownvfdJCs1EcWpDM=; b=
	PlrWtrUx4lII3gP1XkA9Yqgptfmy5NV0JtZMS7IBFIoQnD3AcTPUap7eGXRMngiP
	YqcniamlBQqe4zOCnhz7Eawuu0l98IpZWVtunNPe9p3sWrLJ0clrbV42aEP+ILyp
	t7WPIlLoYItzajpT1hoLwrlO1A6uAiPfWoFutF9UJ6uBojLf8s/5lAu0Z4i7Re3j
	ZiTfCB5vQN5qz0L60oP9pYaczvKLFOJ+FFSbWH1oztfs+h/SKam3j7iEQWm9kQ3G
	1a+br6/3A33MMYhD1G7dEOJvHWD0anW/danWO4KwpE3r/K/ZLYr2RduEjjhaHGti
	Ru40iLMC7tiVEvcOC8/KJA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62khay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsAahfQXl4BXwyMWAV0z3VUU2+HXcldGo9QYjOnWQe+Bdf/XFOs9gVSePiB0ydfVU5O2vtiJ/dlccuTbdZRBb2Wxd1M203zpK9g/qVf/sNnYhpdRx8pcPfd+WxLKwL8KD0F2gI5tC026qu4NLInEDhi5tiAsUWsL3nERMEuzFtUtnRGTJ39cZ6GnwtzPeOTSv381hhmdMhgw8yfZY5UOGC9uUYVDmB2DtNnb7/TBqEhRviTx+Q8wGf7XbNSpUnLWdFZgaUKuAWUBPyqIGARJD+v0SJbAB8nUSRQPnevHhLb0u3paNCHxvLKPz+XrAJw8a3gfx3Mgf8/cP2ZibYipxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjgn2YCk5jLzsfQ6fgjIT5W1Z6GownvfdJCs1EcWpDM=;
 b=Oalt14kyUQ8aIzj0190uvm9pH3fyfo/Tfgj0YrqDFAr6fHSG+IynBMOStzPAapPD7TBaCvFyM+JzxAv8PBLsKmqqdfXGUV/wzPpzvgBqNGgavPBiZZB4+q5QjceJkYDcgDmaFtLgVaB3oLIaBLqKaeJHEQ5B2z+8fuZu9WXLxiRphEZoCpbmzuBKRsl/Wq53hP3PRIQhoAxaEaazsBnZ8dfYCMz1MZ8FErGJdg5FZhmwMmvB0zA8iZ+5hTyOi1ikrRSJtF3jH6TuvOy3+yUXQe32pqedq6iRJZALTTmqFxka2C05vFz+uccqtuiW1WMuhU5a5+t3q/cA3rzRLHXFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:44:58 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:44:58 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v3 6/6] ltp: workaround openat2 build failure with glibc 2.43
Date: Tue, 10 Mar 2026 10:44:03 -0700
Message-ID: <20260310174403.2309825-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f03d25a-e659-41d3-cc9d-08de7eccbf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	kdRHIY5dGDP5lIgQjYTzMFFKiSRlgjH1WCyJgym58vcV9Hh59A44vQq+MiY8beSKkfDYFgCEZXW4C/X+fNJHDaazs6VHZ7NEah120hg569Z9BRX+9cJkMxBmYIXguwjG4hfvJs/CFKtcjpzTFO0MIOtRyrk/p7JsoIUdYbq2LcY5LeWfZjBgVXVcIZt+J8g5xkohWbzU1+FkyWz3MXqYP7kqPQp8fiqAaZ6b90wumJsA8yU/F3Mj52j87QyMwhyvcBk8LiV1xrDcBSUmJzOXUc4jftxSxV/HsNgejQf/DxNVd3s6tTboV+l5VXpOc8pQYEENd/t5pFM7Hc+CdYP3yVPlirz8ezP/IISi4+J32tQJxy+FsEVshh2MHUWcOEp6cUUEBdWn4RnukbZ9rDvmuzdG5kvikdiqSr44Dc7ejr0E9eZ+braLkFbLZzk7NwjufDacmuxImd+dHM18Y3YSdZPgRCN4Q7YqRPfqCZ3QyLeRehhQ625Xa3MGd4kW+zlH5Kt+f3CJeTjElvFKof2dTt7l7WE0FF8+i9sMgZ3KMq8RxyT6Og6sNKsk8oB/y3HBQrS5FfPG4wwsXDpJJZTu0xmaubEhFaIkbZaoJWgMespycN/WN1R+HDRqe2JHIKHvsq4k0OCue7w1QUt/Dilfc32sVJeT288dNhQNgFrKjK1xVxs464s4NYQDK94vgOaPnlFr7F3gGMjtCzSHR/gpWqN3/cyC9owp+NzbQYnlDf9OrUemiILMKHQam9BoUzvSotvXzcndElWN1by9cJOIYHpQCSsWrXL5zqmcLoN9eoQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xJg0SBCNDkR/EbW5WX2cpOHuTkwD2R6SEz6uFFLtGKnWmHk5pVXRhT38SmcR?=
 =?us-ascii?Q?503cMD6GQGXW2NT5zwSjdTu9feQFiTnCmoUBJwhQBI1/dHpt2ySkq153+5ra?=
 =?us-ascii?Q?4a8Ands3UOYvR747rpB3CBGieSdfXC9XDl/zYGGK0VytRhNtoBg7v2VZteWh?=
 =?us-ascii?Q?bXZAex2xUB3eiGOVFjCXJfMj7WdiB8BG7KV3xsR/jAcLWFPF0nOlQUHO+458?=
 =?us-ascii?Q?JL/dt9IfaXTqx5ysmr8pKtkCU+aCPrzYd/MSRYluM0UQzAV5N9b/3vXon9g+?=
 =?us-ascii?Q?dA8Wl5jnztqyjDaUjIkfVUCn+ucQzNjPrJ2gffrv34bmyoK3jmVzy42//fGT?=
 =?us-ascii?Q?La9KCBbKnlRk9E4Ss0l2de3eqzGWFoDn1iamjyv8ZdQ1qcnwxkQEbXZnJozL?=
 =?us-ascii?Q?tXGjpgS+AYfVtKAfLT8tiWNOe4IkiYblT3c5iD/9TpO037FgbQRTrA1t1/oC?=
 =?us-ascii?Q?ISji+rb/+9uD2Ns2hcaVgqH79HRk3E+8gavxi/MidrODZpUgfYJH0GkkSji5?=
 =?us-ascii?Q?x0b0cMX/rEVkZ4cg1mIYK8oLZru6Pr7H8XEoyMSae+URWMAIi4J9bZE/7wMR?=
 =?us-ascii?Q?We04Dkwc7NrqOvjs2IYUzAukZWu9iLpwLLfis2p7wzOGrdM6mk6J73+f7Zuu?=
 =?us-ascii?Q?QKVfDAFk6CxswoP5JSi7W1dH/N0qmFnWcGUexFOwBXFZ7rLDuMQ1pj8JWF7a?=
 =?us-ascii?Q?r+bxOB8IxzcRwZ5rSvMBF+oOFGFwJVEPVQvDdYDgvPPwFcc9bJ7gQQ4HX2st?=
 =?us-ascii?Q?q3swf9G9Ijs21cXdhgxLYXAglHQffDFXn95tA4M5YvvhcCfv74lHUsSPrRHn?=
 =?us-ascii?Q?WvT8AM0zPnYq+iR1sWxji7Apf0ivC8mWCXRhEtpOx7EOPbRFD0u/3acHAgCx?=
 =?us-ascii?Q?RYad9ADgU1Z+UJj7fu5FSPgXbima5dNeiMd3LENxPqekSrh9xeynAf4W/asc?=
 =?us-ascii?Q?P5hfbEWOWZCDDMT7GE5//f/Lx/UCNl8uibOZqoiem9ShGln6q9VRkwsbSBe5?=
 =?us-ascii?Q?pPbMq1A+xcF5JQkuKPQd7fr9tSg6MpMJX3hN6HSl+mtPQJUZQ2juqZpe9ya2?=
 =?us-ascii?Q?5hqNaNrA25gDhmjwK2YvfIIDw6SylA84etT9PUc/KIzVUSv6DdJ4iZe94MZv?=
 =?us-ascii?Q?7B1IE8y58anc04A68iUp7mYFdngUH801XN9n6OaDz4wiGMm66hBZHeusR5bV?=
 =?us-ascii?Q?azcgY2sFMs6xm2ijkt1yTkwCzhHSoo957hToqzFtyKyvVTrQ3FCCB69YnVLH?=
 =?us-ascii?Q?tF0EoSTVxuDpcu1vLsZe4cHT/LrVfQ/gq9hCMY1VgVNRmJPPkydfZZqGhAiu?=
 =?us-ascii?Q?oti/x8y7bUUwHMcRpyEIwzLQGBnj1RWgE1NgHd5/b1vbJxJ5p7sp0n4Cnuom?=
 =?us-ascii?Q?boYP8KZQ5LAiAVx3Euyqrbuz1y6g5bWtarVKwkwry0casyCFPLqkSuGznonj?=
 =?us-ascii?Q?vTL8v12B6VFnAG8Z5H4QfSwVdse/VJkBfpjNc7P6Y0gtmaY/abdk6PyVVEdx?=
 =?us-ascii?Q?s5bu6XK7WZaz2hZNhqbZkB381IjyO+1el28aMaHG6XlOGL+GrOV2RJO0ccrX?=
 =?us-ascii?Q?C8F0yBV9WY3hbyjFvNUzOuNJox3aTPpoAAPPgrBw0x/bh96ppIoH15FD2JA+?=
 =?us-ascii?Q?Xnpqsjyp2RrER5EGGhzRlRISOXY+TGsVkMmyOlG7/PdRCyy2ryfJ4Ai6GeSQ?=
 =?us-ascii?Q?kqxOwR+gxt3I2SsexcVbRhP0Ve857FtV2GMGjS+Kbr9OeLgv/G6RSxxb2zjd?=
 =?us-ascii?Q?xO9GQ2vKASGZKwnbfC6auL6UL8cjR94=3D?=
X-Exchange-RoutingPolicyChecked: 
	TnL//xrCq+baw4OyTPdcNkPlxdr3cFT1DEO/1KSQgRhqXw+iCei+ZwOFq3je+r13pJsP/8Qe66f9M6oq/1HU9JXh0/1YC9wUKsPy7Xw/8qv7lHrCrDfXMdDTQ0BGGN5ba844Apa/vLjhrD/AIApwHfIEh6kVQ7ajwwfBtSTc0mD4yM0Bs+SCaUOe+dWfMVO7UvBM3brwhVl9vaMCU++z4GqRStORfkev+/Z7YvJbq4PiDCfBuFNHWqZFCghip5Im/0OMwR4inHcmAfa3H1BDppg4xy4GALHN+koNNA46pddJ0AXIu+K2FVyEFhk5B9f5oxgDMRyldJ8ETne80/Mggw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f03d25a-e659-41d3-cc9d-08de7eccbf59
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:44:58.4204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxRMAMqPQAwVzabs2ODur/tG7qu0mqS9Gt8smkdqlMm3sBYElbJHiIxxx+xXXZO1gPnU91dzk0JGlCBdJS8cK/1OgkKYGfuKXujbnzMBFcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69b0589c cx=c_pps
 a=eLvx4Fye0krSvKD/jKlmuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=owd1M3BGKQoo4v_bdmgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1MyBTYWx0ZWRfX2eEppTTS+FNa
 k9j5yY3RyQ32T3ghJ9Z7rojIAIZXhpB+OA3Ae1QbhC4UNbSJKay2xffFAztVojiAK0E0JTMdwCG
 6eMsv66lmYRJ3C7Ws0xi2wp2cUs7e7SqOUQgYIGCY0xoykwpErSBQCNJw1wAObs4hnIil3ftHGM
 XBcuEVN6P/H13Jz89Fb0+lz+2DGCMYSUMz5PS1LbA1TWEXBxZJ/RYqgP8xjjZ0m3865l+YLiii1
 g0NnMohhko9vckOeoWzFSTYjRyqyGB0MNmRpvmGIFmkxXlFngL/oKBNGXaphgnGqgsjodvAf+yy
 sk60xDYtSucexnixXghkdDbSvONRbtR5OD36PBDqdBQeK8Zpm4IYhRIuINe10P61yNN+IUUaFKV
 j+C8RmREymURKWD25BQsKdJWOcNXy8PtbUIeU6piHkJ/8WJDpaVnYG/L39fs4q30Vagp1y7XPZt
 PTpxuvDPmAS/PpRxV4A==
X-Proofpoint-ORIG-GUID: TD0YMl-zkziSShvFKztRLnvxM-zKQGDk
X-Proofpoint-GUID: TD0YMl-zkziSShvFKztRLnvxM-zKQGDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232806

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

glibc 2.43 added native openat2() support, causing LTP's configure to
set HAVE_OPENAT2=1 and skip its own internal definitions, resulting in
a build failure. Add a patch to undef HAVE_OPENAT2 in lapi/openat2.h
as a workaround until a proper fix is found.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...tp-fix-build-failure-with-glibc-2.43.patch | 33 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20260130.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..7c78660e3e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
@@ -0,0 +1,33 @@
+ltp: fix build failure with glibc 2.43
+
+glibc 2.43 added native openat2() support for the first time. This
+caused compatibility issues with LTP's internal openat2 definitions
+in lapi/openat2.h. LTP's configure detects glibc's openat2() and
+sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
+definitions of struct open_how, RESOLVE_* constants and the openat2()
+wrapper, resulting in a build failure.
+
+Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
+own internal definitions.this is a workaround until the fix is found.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
+index 03327bdb7..bd44573c9 100644
+--- a/include/lapi/openat2.h
++++ b/include/lapi/openat2.h
+@@ -14,6 +14,11 @@
+
+ #include "config.h"
+
++/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
++#ifdef HAVE_OPENAT2
++#undef HAVE_OPENAT2
++#endif
++
+ #ifndef HAVE_OPENAT2
+ /*
+  * Arguments for how openat2(2) should open the target path. If only @flags and
+
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260130.bb
index bb3b7e9ca3..75c5b8b7bd 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
+           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.49.0


