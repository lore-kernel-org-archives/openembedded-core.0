Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47554C61DDB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23339.1787780772290920740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ll/KlbVW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKf6IY410014
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rASnXtSv83tBeSpEEtw+PTCzpnjlKrEmJiMXe1tMPIg=; b=
	Ll/KlbVW4MeNbw0D4dE5ev18TFSgnLxGPTSCvTdz0hrQzNK8aOYdLQuFnTSWntQd
	xEPglMwmBe2nuCTZuM1CpxX4gdXKDtasRd+rxRfELyumcFYCOQKi+NM604nSjTRO
	HfSC06QCCYsBP98OukVM3/+2oe8IrzMIv8TSEXV9NfOVDrsgoIimb1BrnyoCBD8u
	xPoFAfO3n0CPeV0uQBoCZNGfjrJxwRwWv0H14FRuRkAWerSKXIuCZXvmw6womBHR
	Dfbo4vpVr8u8OnX6Xw7biEkmPJI/Mas6Vyw4LjzLSbpZ0m8kBIjhEHWlwDzqXzGB
	oj3ie+wQsmz9CQaRBWigWg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RN8A2ybN+YnMgvQSS/J5IYlVaeTRQmn4WCMCTy6dBuRDu0kkDBkppiIjWj79IvTZBfjwmid2nit2TQWCX0rVrTWOKlILJfejiay7Fz7QtT+LwtEh3ekFj6JiNEfEizIqASWlt8OGsub7KLzVMc8M7gGrBqL/J0OtMJlYPz8M/RAnMzVODCWPhWM1oZeyqBDRzkvSeAN2eZ+JGxWaO+SwKACvTf482dDMeGF1huEAABbKh9C0SXjZtpqY/jhchHrgffV+S9I+qwJj5yYBpAxQub8ObQ/iSfdjLBuC7ZlI2Ldiw6+5i/YtzkNUEmF2otMxxk3j5KfqHTOn4dHqqYeQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rASnXtSv83tBeSpEEtw+PTCzpnjlKrEmJiMXe1tMPIg=;
 b=Xnx+wxbIedpfzb4TmwEraBoQRjILgSUY9bqkEvnKCsneHsizwNsHvvxL5y5ViBiVAKsz7Je9yCg7/JXVAqDRrIVKYxcmsnY7qF9/QW00+VQ/7XOgI+2bb4Q4fcefC2RIYNw4kVJJWfX1FAFr/Ho6w6Ky1bhAPi0JQ1vqektOuqSgLjrOGTFeZ7R7UI4pxLpQC3QoJRzN9gkFSsHVkluBwJXr21Si6WtLgTUuOeOiz5iIldFY4IUD5jfBbERMPyN1CEN6BaoPMS8S6h987+ojisvF48N4RGUUAQuw7dQXEiQLfPrABj5pCUgjjaRQELVReIN5YZztZvu7x6a6zGW5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:07 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:07 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 10/16] pkgconf: add /usr/bin/pkg-config to RPROVIDES
Date: Wed, 26 Aug 2026 14:45:42 -0700
Message-ID: <20260826214548.3002838-11-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 008cebf8-791b-43a4-02f1-08df03bb6f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GSll6FoPXmyDSwTNiqxbVWnFKfeRC4wfa0B9sDLJ/JIz9vD+Vvfcx6uz0Vy6l7Rk0JihDQ2RnrKULKrlejdBv+jD2FN4xMOerVT53WYIoP1PGJ/Dsx+pt2i4YwCbmECgS2yFqFXugBKK38euhU0Z8HGah9VB0kpJKcM8IaL3Ka1dP/F60Vxco+rl5ogJgDbW4Q1StajpAak0UO7PDGL1dU2Sw4tU92J859z3yYt0KlZYw2fDJQIBvTWyFxmk4St9k84WzSma8uwikH+sKpCLFrnARq6ta8WYXEl4Jws9zr5IdpLBOpaL8wt0XNb/Jcu+9uG6q84WoaOc7JNQY7doNXrvPO9u5BFn6gDMDnjHG2ozPJJi2sS+EPSB0zsiJkbLvikJbh9ChNOdGPw+rLSFGHbC8sIivXyy9s4K4O9Gbr8ASyLzCywxPhCHt8OuTnL+I/DxbdDNjuw2tcJM/EYVdL9h8rRmi8rQvdNVDh/qElf+9mpIjM+HbPGUG/zGChuEb+5K87EsBUBb/sJ/d2y/Wpc44oJPOVw03nIWPEwkDadzPsnpE8NHNPaMoJ0ESRLaZXLwd3fgTBlfr9UeCwXCzzsW9kioLEhrJZ0g2ywMOEm7mKpdZkaR+58wa4zfFytl4EInA6av0YLQF8yykVLqiG19Kxy4Hovpn3L+4lhbcd8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2i0fcGEqLm+WRVhIvcHXuk+wgkn78IkbgMu0Bd6kq2Wr7rPNBaOKm5040p/D?=
 =?us-ascii?Q?UvporVS5UeTsVWBHx36tVdqfLaPWSpP4UVgIMDN+V0Cdz/lZxvppiouhm9Uh?=
 =?us-ascii?Q?qlpeay3/isQWZHBwSQrO793hzl8axd8uPVSAWYvLN7ilGYogYOiPpwBjrPrY?=
 =?us-ascii?Q?SFGMwvQIeUeMKhOPB1Zl4MpflycNmYSRNovLwVqVEimsz8d92hVOtWHzxzz7?=
 =?us-ascii?Q?x7cR4QrljYVZEw13WyS7XGWK4QLxk8tn6jjuw8ufGpYjbuxbWM/J9dr4lJCO?=
 =?us-ascii?Q?zeJExsJaJEbv3ZiYBZo1qbjVOw6NLp/qWOmfyEiVdLHntWKpMgYAahZ+xzuT?=
 =?us-ascii?Q?ICatqRUCnkXaRdIKMiTc+N3Oa2SLUoimyIPh2+Krr+OkecU8fhp3147+nAfP?=
 =?us-ascii?Q?HU/r/S2q/APZqYj1uj0RGVKp2utEa662vKN9g7+SSIpJKYoxC8TNj0CM2pG+?=
 =?us-ascii?Q?luy32cfHSRo6MBPJ80NmhlpCFM6FwWItJMBgDw/JwEbw91cJu8cZQit+jxtb?=
 =?us-ascii?Q?V5emVG8F8yYCZLPlV0wRwHycM3dgi/h+O+CVrr4RGVrCB4cLKaHwjXMMMCFW?=
 =?us-ascii?Q?T0gMv0hrsLhFz5McDnjF+XJunh1OiP17FgNIuxatQktkMerGlVm2arw0N268?=
 =?us-ascii?Q?FMild3klSixOKLTAmBOyzuPSslHQxzbHVBSYTu1gQMMTlFFOgnMixCB8mLXN?=
 =?us-ascii?Q?xwVOu5YNYe7bMkClskjKeOiV2oQTvz48k9APP8vOv/0hn/VhMMJpuLc6WAwn?=
 =?us-ascii?Q?41DDAug+/F9awCrO5HNpDTKheeShXzC9rIZsjV4goJsDuBh2e225H+H3shLe?=
 =?us-ascii?Q?l+/vvHQvPPnCTcXweJ2vvR8Zy3WTUrUPu7/svK3A5cUpINZ6tH6OR4z1FCEC?=
 =?us-ascii?Q?NgKFRuX6NvS4F9gri01WlA7SZtVW5U8r/cX0Z6ZEsFHAew4uQgAB6PWZ3Ljj?=
 =?us-ascii?Q?YC5Ml0OjCz9+luPF/0q3+XZyOQ3sGstkP5e0b8vMcZxLjb7bd4RcsJw/dc+i?=
 =?us-ascii?Q?/zg8FtpF3plb0Q6JozKRrtDv18DHhnsZ2KfGVvzxOYZNQJNOV+1ebdpDFhpl?=
 =?us-ascii?Q?0vWsUYNkzxTrRZTiJCwyH3dlBRcjn2lugc94j5rtkTfysMS8JPCGP28k5/Uh?=
 =?us-ascii?Q?/uqPuAe2IWeTHwJPP9VlzEZlEse/1sOFqFU7wkYjLaXTn5Hj3CQ7nPHcNIRD?=
 =?us-ascii?Q?bLwCbjITc1vsNt8PaeDvg3VM7lLfooYEhzWx2njSN2cpKBnYfcd25hStejES?=
 =?us-ascii?Q?e5GIB7cuyEaJKsbuxligv/9yoPuZaCklkUqF8eqRaN2gtaS1j5V2+oGmZj67?=
 =?us-ascii?Q?8TWJw7mJhgNVdeNhA2lOTYmMRsWQukhlDdIFJVy5WLsD/rUlS7XfOG0zMiD5?=
 =?us-ascii?Q?010eo+T89PGsqG17oygaetTp8HjMVWJOnsSzAMw5aZkhdblRxSEp6L1Qhy8i?=
 =?us-ascii?Q?7fMc4vYHjM41EDohBReI9odo0qW41DYGQKJxUjj6xdeRy4EbH/TqYLIUgTff?=
 =?us-ascii?Q?NkF2Fhipvd3+ic0j9Bt7FczJ/Bv+HDL1U6o7A8pg+HMywuMEikHkNrhD3rZ/?=
 =?us-ascii?Q?q/5pEn9svN+0A2XrwAimFugOa1AKZDoie88he7pHMu6rGHUDcEbSYbTdsLSO?=
 =?us-ascii?Q?ULw8dSjEdLsC3WAyErzzQwFesnor97BojCav/9Esy/A/1hoRbFw7RD2paI5P?=
 =?us-ascii?Q?u8JVsr5IQ4cW6Kg5LPCR2JEDLKa3dQ6HDCaX3dRB1+4sMIBOr/AfLD0rnM1n?=
 =?us-ascii?Q?PqTeDJEcVoOvezisl9Hgbr4t3+9x37o=3D?=
X-Exchange-RoutingPolicyChecked: 
	s0gB6Cg0bY3OZ2PMa1Vdr6NwgYFxuRkfNBb3+LfVhOGRQfzQYvd/XSD3/AsPffzvcekkNyzU/ZryLHsIx3VaE4NxqHpi/ArJbe2Ptc7ED3nes/j9lAPRBMupZkuS2rICITF5pUhNh8QAd1qjvED6B2ng/5CmD6gU6V/Zyin4jTJc5kLjH9CQVPTHbvsD/+Kw2LZzGvynR5wXrelkJiQHKc34cq0FSLcuqXPRBRbelUItffkjDhgMyi1RCDHkMYvobcE5fixGy33mTXT9EsGGZsqEITJ5/1sdGoPRTerObB8WVtYBdw1jiTp8yYIbLQDJJ2WOP9sh0rGq2MwzhCbFhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008cebf8-791b-43a4-02f1-08df03bb6f5c
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:07.2867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK/WbkzroZ4aH51oiA16wxu546yQ+OIZQv01iGyjMs7MHIGWxTLP1GLWU4eSmX1o+1g4TJ4zFmv8rOkwD8JkGG7ucejv+Qrx4AinBL/pLVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea3 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NzkYBEk6AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=tMC4LCHGnE-xarV19JAA:9
 a=zqED95DPWUTvcrp2mxve:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GaNAKV_TNLdFRYbMfvV1PmOfK8vSIO2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX9aFk5PAlg0AR
 xxbLIkVf+zZAl+MRoGW4BfBC99udGVQrT+KMImiwEK05+kcaA2Hv2A5mn9U3DXtAoaSaAtgeYAa
 tO0tNQLHWLycwIuaOxZgqNMFdWuY6e6LP076QpYIxAhSuRA3BXHi6lQWGA38wyBsFj5cXDf0+7B
 GCU5138B5vrs1vRfWLzn4+HNfI8R6NNKbu7Y5cpcuLojv7D6/xbodPqO9KukTXOALX2dfXvxfXt
 UwyRPX8Bi0w1AjUDK8LUHpJKAsC+409nlAnerWQK03WdEVsFfeNMqpPVPUPGsrtXzTMASdsw+nG
 CcvlGWDTfXWj9szpXHZC5OyqyrVlWS5xSiYKV8UmA1qOqhpCBpFBtAKZGfGE88f2jnuwnbRzCn8
 /ksrGHh+y1zXxod39D/k3j/rr7OfR2pso7HMUpdfRO7XrqMgVtGgWLp3YBtfLfemQ9zDPhABqSG
 CgxdEUeaRy8yJz1mRtQ==
X-Proofpoint-GUID: HAf0i4hnPNDJInUrN_D_ssKmg1eNsMBz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXxwkyUVquxfSG
 g2GNp+r8IVflo+5ZmW1e9gl0krcks7cjKvJDwzuylkxVJreaa6BpnT+8uZS5s9yffLTYA748E17
 M6IaU1In5Uucm+NnQic65g4Z+jGMOSa1p447MFiP2PXpj+YuHurg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244428

RPM 6's fileattr script generator produces Requires: /usr/bin/pkg-config
for packages that call pkg-config in their scriptlets. Add
/usr/bin/pkg-config as an explicit RPROVIDES in pkgconf so these
file-path dependencies resolve correctly.
Remove /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb since
pkgconf now provides it explicitly via RPROVIDES.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 -
 meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 6075770bf0..37dad54409 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,7 +11,6 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
index 471433e7b5..0249c87878 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
-RPROVIDES:${PN} += "pkgconfig"
+RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.

