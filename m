Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B619F8DFE3
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:30:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40138.1776414650179592587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AcU3zWDe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=856723d307=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H5bujT3172772
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 01:30:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gQkNNFbLYzQ3plK0nk2kflVQhGNOkTD04t98+lS+or0=; b=AcU3zWDeXgMN
	ypw5bBgnluyxyCKtBYIe2EtJXzS8pfFjwsJXFelOBCHjVw+3/KOxssxnHo42Bqfh
	lOo9ipHIyGb2byV9SHivO3kxa/DNEdy6RYjYh12bZaZF3fKBsBvIuA1/LQrvuda5
	SmPtkVYOmvyTMjFltwypNd8JlLouxB+7VJnhSoIddgFjAya1IJ1PFbcg2uZ4hjCQ
	fs3SNXKkG7A9RpXaehnZC2CT0g9Kvv3sdj5uSQqcW5B2jEs+PHf3wPmAMcwsOLor
	s868kGusOZh8FtcKNX/0Gyta/tZtZ/fKoL3UoWURN6MbVLJtyxg+E+79VZB60HBe
	mLfCUf70+g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86mcsfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 01:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD0c6sqe+AHVbEFdfeHpURKKjd+cX+78uiUf4t3+fqpj6AdXiUcCp7EDHPUof5Rb8n2Y2IyJvawztyUfaHAPq6/iQsuQN6Vqvi5zasAKUiqkUZzyEk2XfJnHjuWdeOY/SP/4+7GUVrKNfuSNV1KjC0QLSkXORVnG66cPCxNCY+i6/lr3/qNW6VzVdqEluwPMXsVmvJ/Q5HUpg5Z/DkTqaUbAFkxpkpVjHj7qK3FSWSLpNoXn18JksDSAxMRacvmiNT4TcQRQ6LdopczUy6IpnlBMsce+Ta6AwieIUMj1JWLVrW3eQr/Fh1Mbkp4btPYfq211kKBD71n/HxRcIdo96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQkNNFbLYzQ3plK0nk2kflVQhGNOkTD04t98+lS+or0=;
 b=iLQUp8rDfhr/P+K1B/lwsT3I8LiPM4HEfU7xfPCJloao5UB52o/CdN7jOYob3viemyRqBzE6moPnyXwZbKu1Trbl8Smr3QMeGWwpFye1NatSYhpN2MceJKBB1ecDQiZRh6Np8h2lFByuteUaXkTykkaPVw78JJGNGd3YTWGUJVS5zghLWug64iJybQxFo5L1mkslRR+/aUZmUOhj3DckOrlFG4fdtWrFQEP7XH29g5HRhalFgqahQGNQkiIbo+MCKU2FpS+7U6wxJ030cK+eH5AF7krT/0fLLyKX7gecr0eyXjKl8oZhc9L81qV5SQbKeOeBcefWNCgpQLjI58EXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:30:47 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 08:30:46 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH v3 08/11] hdf5: fix CVE-2025-2308
Date: Fri, 17 Apr 2026 16:30:32 +0800
Message-Id: <20260417083032.3462824-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
References: <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::6) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b25e28b-8f8b-4811-8282-08de9c5b9f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	auehpULo27xGs/1j4F2iFv/oF/G6udk+W1m49otNLamqsIF6TtcXb176Av4dVLgvCdxVTsO7FwCg6oBTbsgxXulzeluz6l7+Zg/9wTCz9zt0RFq8s2mw3PSTbW/ThHOLnjIxoYPyw7Mm4Gxt7RWJ6S3F1z+xmBRiE0jeS0cydszFAZGM8quNMGkma3a2xhnmgUBX3GmQDjTP3gXYo3LUFaqbm+E/vLYnLNmcRCstqIEW2AA1i5PPPLNg+i75tdcJ/xo0OKhCY/bxM6zNhZrT08t0BE4C2kx04hHWUxGo4p9xCumtzmhKm3lmDw5Z55jlCG4I2A0HoQ29M2VXSEMGtWmStzzufNVYnpI4afh9Xy+H6vQ0JZUv/kSikCq5knsRKY/vDw0zE00YGEtp2SY7M9vpk2LVZS2X/qClvovn91K1G0ZVJnFMdRrlLgVea9K/3jzua8CG1LZhwXU+u9RIgWv6HLIS3DjgPQnLBgWAH1dtrMjl4xryzwU2snfmdCu6fu3YhQc4EyskGQgXlt3PJGPAkn1urkcbNYHM78/USO8NXyqVn5ybgzBe11Vie6tATAZ/As4D4784SRsethafL+4xEaNp7HB3apECzcJ+w+OHUzpfIYCOJTJABGWI/QE/JXC0v+bMvecNwHFf1G7ZHNopilxirB6OtREk7GT0omAa7DLVvhQJkOSUb/sTVVMBqQtWnInulYab8/F3EHZCMif+C7TrDbUClOCNa1Bc5SeF9RfT+JVK8B78rdZ6alzrbAmobWVY09fL6ehwhSjQWkXYszZKl2QtRrx/b7WjgQ/wg1o4EqUkZs5jfZpYi4SW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tjb+eZLG659rJKNNb9HSqLIF5FHgVSNCJRukWzZxXHP0nbEOgciTLa2Wf+F6?=
 =?us-ascii?Q?zjLBBOA438T9153yd9aW1cRSWDLMDZ3A+dP6im/ez8pF9ryJlqOcYmaNscwf?=
 =?us-ascii?Q?buMtTme9A3iYHmRrOZZtQBXEJRKTkHfRkgIHwQJZw98Ec7H2FwN53Ae9GwRQ?=
 =?us-ascii?Q?hKIGZ3URR0ejUxe3bK4J0yaUaKj7AKHnkoOX1Td3sOH8KYQtvUbACbowKcka?=
 =?us-ascii?Q?CLZxfChXFXYCEqUBePVsVenMvusrTLha4cjdJx6iLpCpP7DVfrk/9ozmi2HF?=
 =?us-ascii?Q?1QQj/5pv7Xd3QykXHaQUx0zVvOfWzIvTUsFQAugKKoM9+SaSR2apqOoL/lZ5?=
 =?us-ascii?Q?mUQwPYqW5gPTGnrATXWTdrZhY5hy3mQaPR7sHTrTwcErDetpJo3D8woIk59K?=
 =?us-ascii?Q?SzQBBmVCkhNsMS8kYEDGdcG119KUoVVOqLo1cSeEHCNT4s52F4a8LEmdhn8R?=
 =?us-ascii?Q?shL6TlY/FL3as6aNGKeb6GWqLcIaRB/R0VyQL2yEedDZ8rJtHj3HKsgyPzcI?=
 =?us-ascii?Q?+JXIHfU7NITk6q4i0yxZnCDRV3hiygbPzehZzmIxKX7lJz9fCOHOZMEOUeCS?=
 =?us-ascii?Q?bhV2gqhYhrubSa0EjvWDIbL2akBe6UDI7hiqa4LAr0Iy5XqMNl0tVehzk5qM?=
 =?us-ascii?Q?qZK0Z3JkzM5K9ERWFwann1/ku3IZfXr/CY6rn8E6qzYP5YGDb5buuledO9cs?=
 =?us-ascii?Q?PudrtCGOi2zc6wsYgtDRMvHqjBiv0DaTn19cUxW29cbEDX7H8OWf5+Kpx7/h?=
 =?us-ascii?Q?gKJlJ07s6cqaxpbLFGjnMUWyD76oEZ7IhCKGi2tz2kSrDdJ61jVr+JFQmSR1?=
 =?us-ascii?Q?zz/+uN1k+JIRk3VSoS+4ieJ1EiVSZu3Joa0cQYhy4V8C2MVGzSnNkRyOWCgl?=
 =?us-ascii?Q?90TryHzrl9IUljshuYcxq9/LXhrsw6yYX7BjG8WvYTvj1KeaJfXgvqlTHXB4?=
 =?us-ascii?Q?sUkbW+HI/Da3EnxI5IbLsKvU1hxjGn229GYYWYjCY5GiFhHjoEnodDAkJ6OY?=
 =?us-ascii?Q?F7EoLJP+oe4ixNFBWYuJTuaN5igucFTMWbCDKp9FR7HgrxUPbmFGPoi2+T2H?=
 =?us-ascii?Q?WIRt4ywLYehVjvVg4DexvnCSethsSynjZcBUPZUIBWp2hGD+V+QqXLOmRzUS?=
 =?us-ascii?Q?+FaIEMGhO5W9M+Rcq/fTKiTC2z2LALPag0bAfm1/pw4y6rCvokZRlU0yr2jx?=
 =?us-ascii?Q?CF4c+tz1ZQvGHNmq7oeWm5y2RSFmI1nbm2XTLwSivTtGgjYxO2Wwp5R0mM85?=
 =?us-ascii?Q?8hjrECorQPJZ7UXsdMPOOdigBOLFlY1F72pnGT7z5KY1MPlKV4Mo+vnuEmHD?=
 =?us-ascii?Q?md4m/gZ1YtHCvsvt9ZuHjwvv/j8oXY+SINiHfL9SBxY8GJy/IARi4bzkwmp0?=
 =?us-ascii?Q?EcU90YX4TmRSkQo3lGk4bnMahLv9Dy61MTnQ2DCkoN365+QTCXfE0fjYolHQ?=
 =?us-ascii?Q?4zb+fS30H+dWUQ5ZwTeAukQiIUcsUvgGI0YfNUc4jCDSBHkGP2+nRiUSHgLS?=
 =?us-ascii?Q?9+JHwmSgL+BagkSXuYoKagznZ8r2UoBdD7NoIcDIyTKgmf3HuGKvyGm0Fmxk?=
 =?us-ascii?Q?94mzPEWg42o2wd+cteD/7TboQ2dSwW/Wffg3aclVAn5rzSfT55b0+PfMYWww?=
 =?us-ascii?Q?p/ZPwNOLCEavX3+2NRVzqvnzCJLGWXfkNcQj+EoWI8gGBUF9HiEUmx3oiWnb?=
 =?us-ascii?Q?7eoNsr4R7SbPJhqWlBg6G5xAxPFbV6vNNPsQ6ttIGwl7OMufMHQWLYXzc4oG?=
 =?us-ascii?Q?u2/3dTzx1tBQV9GFRZXG9GNW80SgJ4I=3D?=
X-Exchange-RoutingPolicyChecked: 
	YDcO9C9INwbrK6V+TOLMzxcpd7qpZbuJBohETbDgyXDWQvBO+rby3Ph+M0OoGPl6gl9EjGIOLJkfplqxTKNNmKt8niTqQB5j4Lc066kc32Lk8I6r21h1fWW3kgGy/zjDgc3kPQMB9ZMWcPIJG924L5qWaZJxjQu36RvAHj1cAjwnQ+UbB8a+VWwzUw4av8wiSHVZNiMRy3yC50YktNNIRZpj61dXat9qntqcQ9c4/5VdUJVmG9HptB87tRaJNiqMECxgEeGjcgTlW9Zx/AO91EzRdnvZmls9Krzuw5SFulpy5WtAcJpd7pDWlXyDvTKduQaJRwwSS+GPu3RJd4mX4Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b25e28b-8f8b-4811-8282-08de9c5b9f93
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:30:46.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+vdn7f3ONcPPjEZnJimBk432tqGU8ioJHabRjATTKekeS2N0ps6OwMCub+2csXU9NR4vvJumz0AsKPYBjU08AzNahjUn8qc07OpZKHhJAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69e1efb9 cx=c_pps
 a=9z8yexD6E2gW5LInT/Y/IQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=inLRmMHjSyNTGiKv4Y8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: B-iTY4zG1d8noH1FAaqn8RuYPT4gHCR2
X-Proofpoint-ORIG-GUID: B-iTY4zG1d8noH1FAaqn8RuYPT4gHCR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MyBTYWx0ZWRfX250sLHg/d2r8
 5bhhhB5C2Yf9gceZ7XJp3SVKloyK7Gt24bq3+9YJuaz03xqiCo2rUiZwX+Nhq7TxcnoeEXIMV7m
 b6K5tJbgtvR/9ZNeK8Ve1PMf0HtbyZLboy1aYfvqfuXtrSnuBjrVJd4JeJuEQ78YQJ+7Fkw3Ncf
 h3KTrXVuxYHx4nDlQBDHVIS15ePdZxtj23j1HKRA3QQcAtNGRhehOzXh9cwCxsskE3gmcnVzZGR
 R3MN0WEuDBU9LHk1zy+G2y8UQpuEKh9Kh5eMzlS0rkLhwly/XnW4TP5Ij+hunycMoGXOlelBbvq
 hy8wgOuDWA3TWD136jOa2JEnKZsQ7RACVuABVhJVI8RAgZ0WZGLLWLtu0WuLDr5PqvTRGYSh6RI
 Ujf5jspVdKlGDlh/p/4mwskmT3XDdvNFjkkbwG9x8pzA/0gFZJgxyqPxAxugir6331H5UOSEgHa
 kc2d6uLPZhv5V/9ov3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235489

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability, which was classified as critical, was
found in HDF5 1.14.6. This affects the function
H5Z__scaleoffset_decompress_one_byte of the component Scale-Offset Filter.
The manipulation leads to heap-based buffer overflow. An attack has to be
approached locally. The exploit has been disclosed to the public and may be
used. The vendor plans to fix this issue in an upcoming release.

Backport patch [2] from upstream to fix CVE-2025-2308

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2308
[2] https://github.com/HDFGroup/hdf5/commit/2ce7fdc4cf147d280aa6d49686297faacc250e40

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-2308.patch            | 333 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 334 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
new file mode 100644
index 0000000000..336a0d2697
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
@@ -0,0 +1,333 @@
+From cbce4c2ecf6f5557605890eec125ecfaa4371131 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 16:43:04 +0800
+Subject: [PATCH] Fix CVE-2025-2308 (#5960)
+
+A malformed file can cause the scale-offset filter to have too little input data causing a heap buffer overflow. Additional checks on the maximum buffer length are required during the decompression.
+
+This PR fixes CVE-2025-2308.
+
+CVE: CVE-2025-2308
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/2ce7fdc4cf147d280aa6d49686297faacc250e40]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Zscaleoffset.c      |  177 ++--
+ src/H5Zscaleoffset.c.orig | 1781 +++++++++++++++++++++++++++++++++++++
+ 1 files changed, 105 insertions(+), 72 deletions(-)
+ create mode 100644 src/H5Zscaleoffset.c.orig
+
+diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
+index fbf12d6..8355b13 100644
+--- a/src/H5Zscaleoffset.c
++++ b/src/H5Zscaleoffset.c
+@@ -69,21 +69,22 @@ static herr_t H5Z__scaleoffset_precompress_fd(void *data, unsigned d_nelmts, enu
+ static herr_t H5Z__scaleoffset_postdecompress_fd(void *data, unsigned d_nelmts, enum H5Z_scaleoffset_t type,
+                                                  unsigned filavail, const unsigned cd_values[],
+                                                  uint32_t minbits, unsigned long long minval, double D_val);
+-static void   H5Z__scaleoffset_next_byte(size_t *j, unsigned *buf_len);
+-static void   H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
+-                                                   unsigned begin_i, const unsigned char *buffer, size_t *j,
+-                                                   unsigned *buf_len, parms_atomic p, unsigned dtype_len);
++static void   H5Z__scaleoffset_next_byte(size_t *j, unsigned *bits_to_fill);
++static herr_t H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
++                                                   unsigned begin_i, const unsigned char *buffer,
++                                                   size_t buf_size, size_t *j, unsigned *bits_to_fill,
++                                                   parms_atomic p, unsigned dtype_len);
+ static void   H5Z__scaleoffset_compress_one_byte(const unsigned char *data, size_t data_offset, unsigned k,
+                                                  unsigned begin_i, unsigned char *buffer, size_t *j,
+-                                                 unsigned *buf_len, parms_atomic p, unsigned dtype_len);
+-static void   H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+-                                                     unsigned char *buffer, size_t *j, unsigned *buf_len,
+-                                                     parms_atomic p);
++                                                 unsigned *bits_to_fill, parms_atomic p, unsigned dtype_len);
++static herr_t H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
++                                                     unsigned char *buffer, size_t buf_size, size_t *j,
++                                                     unsigned *bits_to_fill, parms_atomic p);
+ static void   H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset,
+-                                                   unsigned char *buffer, size_t *j, unsigned *buf_len,
++                                                   unsigned char *buffer, size_t *j, unsigned *bits_to_fill,
+                                                    parms_atomic p);
+-static void   H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
+-                                          parms_atomic p);
++static herr_t H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
++                                          size_t buf_size, parms_atomic p);
+ static void   H5Z__scaleoffset_compress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
+                                         size_t buffer_size, parms_atomic p);
+ 
+@@ -1261,8 +1262,11 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         }
+ 
+         /* decompress the buffer if minbits not equal to zero */
+-        if (minbits != 0)
+-            H5Z__scaleoffset_decompress(outbuf, d_nelmts, (unsigned char *)(*buf) + buf_offset, p);
++        if (minbits != 0) {
++            if (H5Z__scaleoffset_decompress(outbuf, d_nelmts, (unsigned char *)(*buf) + buf_offset,
++                                            *buf_size - buf_offset, p))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Scaleoffset decompression failed");
++        }
+         else {
+             /* fill value is not defined and all data elements have the same value */
+             for (i = 0; i < size_out; i++)
+@@ -1603,55 +1607,69 @@ done:
+ }
+ 
+ static void
+-H5Z__scaleoffset_next_byte(size_t *j, unsigned *buf_len)
++H5Z__scaleoffset_next_byte(size_t *j, unsigned *bits_to_fill)
+ {
+     ++(*j);
+-    *buf_len = 8 * sizeof(unsigned char);
++    *bits_to_fill = 8 * sizeof(unsigned char);
+ }
+ 
+-static void
++static herr_t
+ H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k, unsigned begin_i,
+-                                     const unsigned char *buffer, size_t *j, unsigned *buf_len,
+-                                     parms_atomic p, unsigned dtype_len)
++                                     const unsigned char *buffer, size_t buf_size, size_t *j,
++                                     unsigned *bits_to_fill, parms_atomic p, unsigned dtype_len)
+ {
+-    unsigned      dat_len; /* dat_len is the number of bits to be copied in each data byte */
+-    unsigned char val;     /* value to be copied in each data byte */
++    unsigned      bits_to_copy;        /* bits_to_copy is the number of bits to be copied in each data byte */
++    unsigned char val;                 /* value to be copied in each data byte */
++    herr_t        ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
++
++    if (*j >= buf_size)
++        HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Buffer too short");
+ 
+     /* initialize value and bits of unsigned char to be copied */
+     val = buffer[*j];
+     if (k == begin_i)
+-        dat_len = 8 - (dtype_len - p.minbits) % 8;
++        bits_to_copy = 8 - (dtype_len - p.minbits) % 8;
+     else
+-        dat_len = 8;
++        bits_to_copy = 8;
+ 
+-    if (*buf_len > dat_len) {
+-        data[data_offset + k] =
+-            (unsigned char)((unsigned)(val >> (*buf_len - dat_len)) & (unsigned)(~((unsigned)~0 << dat_len)));
+-        *buf_len -= dat_len;
++    if (*bits_to_fill > bits_to_copy) {
++        data[data_offset + k] = (unsigned char)((unsigned)(val >> (*bits_to_fill - bits_to_copy)) &
++                                                (unsigned)(~((unsigned)~0 << bits_to_copy)));
++        *bits_to_fill -= bits_to_copy;
+     } /* end if */
+     else {
+         data[data_offset + k] =
+-            (unsigned char)((val & ~((unsigned)(~0) << *buf_len)) << (dat_len - *buf_len));
+-        dat_len -= *buf_len;
+-        H5Z__scaleoffset_next_byte(j, buf_len);
+-        if (dat_len == 0)
+-            return;
++            (unsigned char)((val & ~((unsigned)(~0) << *bits_to_fill)) << (bits_to_copy - *bits_to_fill));
++        bits_to_copy -= *bits_to_fill;
++        H5Z__scaleoffset_next_byte(j, bits_to_fill);
++        if (bits_to_copy == 0)
++            goto done;
++        else if (*j >= buf_size)
++            HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Buffer too short");
+ 
+         val = buffer[*j];
+-        data[data_offset + k] |=
+-            (unsigned char)((unsigned)(val >> (*buf_len - dat_len)) & ~((unsigned)(~0) << dat_len));
+-        *buf_len -= dat_len;
++        data[data_offset + k] |= (unsigned char)((unsigned)(val >> (*bits_to_fill - bits_to_copy)) &
++                                                 ~((unsigned)(~0) << bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     } /* end else */
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+-static void
++static herr_t
+ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
+-                                       size_t *j, unsigned *buf_len, parms_atomic p)
++                                       size_t buf_size, size_t *j, unsigned *bits_to_fill, parms_atomic p)
+ {
+     /* begin_i: the index of byte having first significant bit */
+     unsigned begin_i;
+     unsigned dtype_len;
+     int      k;
++    herr_t   ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
+ 
+     assert(p.minbits > 0);
+ 
+@@ -1661,8 +1679,9 @@ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+         begin_i = p.size - 1 - (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k >= 0; k--)
+-            H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len,
+-                                                 p, dtype_len);
++            if (H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer,
++                                                     buf_size, j, bits_to_fill, p, dtype_len))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Atomic decompression failed");
+     }
+     else { /* big endian */
+         assert(p.mem_order == H5Z_SCALEOFFSET_ORDER_BE);
+@@ -1670,67 +1689,81 @@ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+         begin_i = (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k <= (int)(p.size - 1); k++)
+-            H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len,
+-                                                 p, dtype_len);
++            if (H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer,
++                                                     buf_size, j, bits_to_fill, p, dtype_len))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Atomic decompression failed");
+     }
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+-static void
+-H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, parms_atomic p)
++static herr_t
++H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, size_t buf_size,
++                            parms_atomic p)
+ {
+     /* i: index of data, j: index of buffer,
+-       buf_len: number of bits to be filled in current byte */
++       bits_to_fill: number of bits to be filled in current byte */
+     size_t   i, j;
+-    unsigned buf_len;
++    unsigned bits_to_fill;
++    herr_t   ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
+ 
+     /* must initialize to zeros */
+     for (i = 0; i < d_nelmts * (size_t)p.size; i++)
+         data[i] = 0;
+ 
+     /* initialization before the loop */
+-    j       = 0;
+-    buf_len = sizeof(unsigned char) * 8;
++    j            = 0;
++    bits_to_fill = sizeof(unsigned char) * 8;
+ 
+     /* decompress */
+     for (i = 0; i < d_nelmts; i++)
+-        H5Z__scaleoffset_decompress_one_atomic(data, i * p.size, buffer, &j, &buf_len, p);
++        if (H5Z__scaleoffset_decompress_one_atomic(data, i * p.size, buffer, buf_size, &j, &bits_to_fill, p))
++            HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Scaleoffset decompression failed");
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+ static void
+ H5Z__scaleoffset_compress_one_byte(const unsigned char *data, size_t data_offset, unsigned k,
+-                                   unsigned begin_i, unsigned char *buffer, size_t *j, unsigned *buf_len,
++                                   unsigned begin_i, unsigned char *buffer, size_t *j, unsigned *bits_to_fill,
+                                    parms_atomic p, unsigned dtype_len)
+ {
+-    unsigned      dat_len; /* dat_len is the number of bits to be copied in each data byte */
+-    unsigned char val;     /* value to be copied in each data byte */
++    unsigned      bits_to_copy; /* bits_to_copy is the number of bits to be copied in each data byte */
++    unsigned char val;          /* value to be copied in each data byte */
+ 
+     /* initialize value and bits of unsigned char to be copied */
+     val = data[data_offset + k];
+     if (k == begin_i)
+-        dat_len = 8 - (dtype_len - p.minbits) % 8;
++        bits_to_copy = 8 - (dtype_len - p.minbits) % 8;
+     else
+-        dat_len = 8;
++        bits_to_copy = 8;
+ 
+-    if (*buf_len > dat_len) {
+-        buffer[*j] |= (unsigned char)((val & ~((unsigned)(~0) << dat_len)) << (*buf_len - dat_len));
+-        *buf_len -= dat_len;
++    if (*bits_to_fill > bits_to_copy) {
++        buffer[*j] |=
++            (unsigned char)((val & ~((unsigned)(~0) << bits_to_copy)) << (*bits_to_fill - bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     }
+     else {
+-        buffer[*j] |=
+-            (unsigned char)((unsigned)(val >> (dat_len - *buf_len)) & ~((unsigned)(~0) << *buf_len));
+-        dat_len -= *buf_len;
+-        H5Z__scaleoffset_next_byte(j, buf_len);
+-        if (dat_len == 0)
++        buffer[*j] |= (unsigned char)((unsigned)(val >> (bits_to_copy - *bits_to_fill)) &
++                                      ~((unsigned)(~0) << *bits_to_fill));
++        bits_to_copy -= *bits_to_fill;
++        H5Z__scaleoffset_next_byte(j, bits_to_fill);
++        if (bits_to_copy == 0)
+             return;
+ 
+-        buffer[*j] = (unsigned char)((val & ~((unsigned)(~0) << dat_len)) << (*buf_len - dat_len));
+-        *buf_len -= dat_len;
++        buffer[*j] =
++            (unsigned char)((val & ~((unsigned)(~0) << bits_to_copy)) << (*bits_to_fill - bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     } /* end else */
+ }
+ 
+ static void
+ H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
+-                                     size_t *j, unsigned *buf_len, parms_atomic p)
++                                     size_t *j, unsigned *bits_to_fill, parms_atomic p)
+ {
+     /* begin_i: the index of byte having first significant bit */
+     unsigned begin_i;
+@@ -1745,16 +1778,16 @@ H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset, un
+         begin_i = p.size - 1 - (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k >= 0; k--)
+-            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len, p,
+-                                               dtype_len);
++            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j,
++                                               bits_to_fill, p, dtype_len);
+     }
+     else { /* big endian */
+         assert(p.mem_order == H5Z_SCALEOFFSET_ORDER_BE);
+         begin_i = (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k <= (int)(p.size - 1); k++)
+-            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len, p,
+-                                               dtype_len);
++            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j,
++                                               bits_to_fill, p, dtype_len);
+     }
+ }
+ 
+@@ -1763,19 +1796,19 @@ H5Z__scaleoffset_compress(unsigned char *data, unsigned d_nelmts, unsigned char
+                           parms_atomic p)
+ {
+     /* i: index of data, j: index of buffer,
+-       buf_len: number of bits to be filled in current byte */
++       bits_to_fill: number of bits to be filled in current byte */
+     size_t   i, j;
+-    unsigned buf_len;
++    unsigned bits_to_fill;
+ 
+     /* must initialize buffer to be zeros */
+     for (j = 0; j < buffer_size; j++)
+         buffer[j] = 0;
+ 
+     /* initialization before the loop */
+-    j       = 0;
+-    buf_len = sizeof(unsigned char) * 8;
++    j            = 0;
++    bits_to_fill = sizeof(unsigned char) * 8;
+ 
+     /* compress */
+     for (i = 0; i < d_nelmts; i++)
+-        H5Z__scaleoffset_compress_one_atomic(data, i * p.size, buffer, &j, &buf_len, p);
++        H5Z__scaleoffset_compress_one_atomic(data, i * p.size, buffer, &j, &bits_to_fill, p);
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index ca1e8d7076..b31a8d8cfa 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-2310.patch \
     file://CVE-2025-44905.patch \
     file://CVE-2025-2309.patch \
+    file://CVE-2025-2308.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


