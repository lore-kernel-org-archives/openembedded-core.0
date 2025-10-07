Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9690CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 14:52:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20797.1759848718218946157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 07:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W4tHxjEv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375fed434=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 597AEMnj3405382
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 14:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rS7OLyzOyYK6EcwVIXtw
	n22EcE2oYUh+HBfLapoTKfc=; b=W4tHxjEvYIn+pXzfPNWAM27iYFo5PqfFEPyh
	43AnFFXE9jBi7o81xxPhmjFObLAbpJX76tPxCpSl66z1LlN1DejXFL0z4oeWL6oV
	1Tky0b+t15eBPBZNxkvQ3dujSUX9m2JOL4aEZnuFIVUh0WP+n8mvsiVH9NCHUt2c
	wJsfnVrGni6rH0LPazcrTdx37e7edG/Mvf01ZWSBhVw1a1EtdRFN6o3ipeuFzZmY
	Z+CPnnI6wZbLRbTi2ni/3vnNRZIu/b1+Rtp7pVUJn5xxU8zOXAQ9wGK4oJDsWb7h
	GgK+URx6fVORw0hWp2eRlh1phkAxGGoaEEw0+GzSmY4tQ6vAKg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgu32b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 14:51:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtxbBH1gCYs6Um3T3FioUNFvSqZCCOfN0eos674zNB0vwQ1K9s+qFmBxeBSvAyjiSfnF5UAsehEy3k0UAkhjSb8iva2hbtslqHxw2kwBjQjojvapdey9gatMnjKu2MpnVnQT15SAAFftVvHNScz0jsknd3RNOVAKAdLac4FVJhsFKydwXkly2+wHCkDKv9hw/Aho20L+7lgSBFQiAEqhgEhU1bFaA7eiYlFO2HIE8dRZLbU46zk5jVUGe6TXAkKQaGHAijbBNZa4s3jbOZHIzamcoC8MYTMvG9Mx0dMUnr+Rc7Im9MUIEhykgzboZygF/M/w4GQCWXyNi5wJbksSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS7OLyzOyYK6EcwVIXtwn22EcE2oYUh+HBfLapoTKfc=;
 b=Psky23N4fhi2SBjqcB/Mgnq21hL1AwPcyzsK8nwyR8F0eOCyI7yJqg+KUUw7r5rwKG4ExTu0RZgyect2LIMjhqt+TVWl/9d6xff8jk6IpablGxBtomE8iEDki5eFfutICQfM/7u7/889Pe9ORjmAHArmcNmq0l96yNErZkBFVZebWL50mWkG6Go+8KJrTSRypFJb2JZDxObFL9Pulfw7MFv4yyg1v45LJxHRDAZxhxmn0Sx6rA2YtZcEvtPsn1kIXyoKZmn5Wd+nTk6aaaCRTti5ow4Wu0ZH5kONBm0AWqIPlMKeAFu3PSSW2rw5BOugArQyQNqTnAQluNk7tN0cWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Tue, 7 Oct 2025 14:51:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:51:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] tcl8: upgrade 8.6.16 -> 8.6.17
Date: Tue,  7 Oct 2025 22:51:32 +0800
Message-Id: <20251007145132.1662971-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c61e38-bd25-4d1c-1ff1-08de05b10c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dlSqvAPfbSZKAT+zz0vHDv1fFEQKKIOGg/FMwCcfwAy25YWXYoF4jCE6JBRv?=
 =?us-ascii?Q?nEQcjMeW4rABu8M8Y0ZORSmzjn+Szj9WNR+ZhViq5QrBWohnfas31/aXk0RG?=
 =?us-ascii?Q?Qvwb8rFUUgruw+JYhkGPCuCsHXhTkYHkNjGg3ZvJdf6/jvqxmLFPctCOjJLR?=
 =?us-ascii?Q?50v7OZ90jed0JEAbBtegX4wPz4mtcxVE5AaiKFg0frMjKnvZWAk7kSLJzic7?=
 =?us-ascii?Q?mprViaJzF+M2DXaba9oJM4OYlLii9W/roCcekx4RQvQ+I8h3W7zd/la9ddiK?=
 =?us-ascii?Q?SRrvtM/uuG5GZT9UlDPPcS6ktHR+6RX3mVQ13Hm2CT8CBM2Xk6FAKalQV5zq?=
 =?us-ascii?Q?I2CeZe/Dz76dEv889tmWK699XQr/cKJxYhraOPpUkH3Ms3ApuIB54ZxUBUgc?=
 =?us-ascii?Q?wqV3m9GmRidgq39oQ3NFxiZs9W9WXxLJNdO6VpuofmwytOQ/bJ7m/LqO/4Kv?=
 =?us-ascii?Q?eKjpodvQsWGXGo12H5xx7kwf7tSx2XjbusZmMU2g4AqP6N0rBxJU1buJSdW2?=
 =?us-ascii?Q?E+0ZMlNao3GcAW347CJ7tPUTGtpXudwcZfKvJC9xJzVCe9sCq8JT8kqDrQn2?=
 =?us-ascii?Q?ejazN1EBd6ad0Blm4G1a8PoBpugRDXVZc7WoZt+Q/ZqX64RV8i5pIJjknEtp?=
 =?us-ascii?Q?l4o1a082gnnoQRoRNCtw2OI/4DzSq1bbSAFCZZSqqMSB5FJ8g7rrh4g1NCq/?=
 =?us-ascii?Q?faA2aqOjZaG74FmtkTlA496PINz0JYSA4JEcR+dU7rHqkihu/Z97Vr0B5YVX?=
 =?us-ascii?Q?idEvt0g5htuteHYmoI3saYT4C30Tgp/dcIyCwT5YZDKrCwHIUEKM1V3lxMhH?=
 =?us-ascii?Q?Tw1Gv4lu3hBaKfPoEvPrizs8fZQlHLqthrYJsSLtF1c1278vUWEYcOsWmUym?=
 =?us-ascii?Q?3Vvu+rIkueXmMhKlh+7pGvqhuZIGgcLPITUGbQM3r4ImCBGQpPj/zO/isWIv?=
 =?us-ascii?Q?pekPwv35riw08nW8DAxzh2byrWP6CrCVfaGg7cZnltkH3UDZcqWFwtNgp+zY?=
 =?us-ascii?Q?JXvzumOpnSAlImB5U8pQh3vnqVWSKuSzN2S3i0u5wOtTBzd5+9uiMw4UW4rE?=
 =?us-ascii?Q?XX3VU8oiYL1uRWPFM0AcrSryvLtwmp0p/YuhhaIdhRmy8TPtTp37zDo730sv?=
 =?us-ascii?Q?kqZuVnn/1gtOvp/nzkVDY7Vu5a+Afq18AweN7NljACyiORtNvGbp8AXs+95D?=
 =?us-ascii?Q?XVxCQmqzTOGmwwlyowxRAf/HgntnTxVSRukwRFpWqTIa3IuG7Ldnp8Q44nDk?=
 =?us-ascii?Q?QUwtVoAwR07OIE02/84WSxFRsNWlFuvBGbcpXCDsF3F1CCWe2pUzFj+DkU4V?=
 =?us-ascii?Q?EMwOpD8hr6/Gf6PERjJ0USXvmVDFvq+bSG9rT2+o8DgX+FznGPcG5pM9ddTu?=
 =?us-ascii?Q?U23Powj/f6i1lBIerlwmS6theK7ZpjoV8QcjNa5kE2XCt7WnHyXyOqHHV35A?=
 =?us-ascii?Q?obnBvIgQpdMMuqIZUkUdR8DtPcXuuK/iUJjfFR007u43SqYqyZQdZICsW2bv?=
 =?us-ascii?Q?YFiGCJwZz/Vgn3JJoEKQInvTb28gHtXF3SxD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SXhQXieCT3JBU8CDIc/kxV9p+PUvuhfK4nqvtzRY38eUlHtG25nzy5Tpl7dg?=
 =?us-ascii?Q?PGISglOsfWIZsvRTgNiHYyBx7vYAex8zWxRIP6tNdLnVuRfmDOQcL8RNLBc/?=
 =?us-ascii?Q?x5WJuDFCtC94rlakZ0/Z2bOE8vNF64sCKlmyQT1JDVrW44PRVIzk0dwuwPpN?=
 =?us-ascii?Q?oG2pvEXBfCcB76JgUFHvRpqO/hDmIefIRSAXlDpUF4EJ/KuKlhjbsRa92D/R?=
 =?us-ascii?Q?8ZFGZNo3X4cDyfXo0b8a1Ys9tVhilCA8KYHTo3klDKpw6SYYu7Rfa364Hx2K?=
 =?us-ascii?Q?n8ITh7tjYN7Gk3eXh0S8gaDxwB+mC/TgZyZxYDnS9Wx/KznX5vt6MkU+X+XJ?=
 =?us-ascii?Q?wdbKnleU1cR7nthSDsfvRcFjZybATGnv8oUAthBQl81CHKc9xIm/cCTjTPw9?=
 =?us-ascii?Q?WCBuYG6BEcCfbusPabGNIHmti2snjeVjuLpCsExK4K99bvm6XWn+8xkgWoxw?=
 =?us-ascii?Q?lAcybxoJ9cb+xyNz5EnHhPhycyHzIqsRW2uux5e4Zs0xDuEcOThrYLf5Y3HC?=
 =?us-ascii?Q?HmqIo44XH1OsHwCu965K/y1cAbI7RtNzjJJ6yW1H7DfBvUXdS/MHomLTsR+C?=
 =?us-ascii?Q?/4xo6nhOzxZTfQPuUlSFxhCPIvm8ab5orUS7J5To3XcTMLwBmdDpigGTQUIY?=
 =?us-ascii?Q?FK6Y0nIEcJH8XR3KsMdNtaqLbIQoMxf01y/vdZAlyFp6axBX1iELJUKPkbiz?=
 =?us-ascii?Q?N5q6b3P4PZR3jgmGR3kt3lrcXQxP3bybDnECzHdWe8GcP7gi7T3PAm4BqZAQ?=
 =?us-ascii?Q?uCUJO2M9xfc+JMpzD8ddWoSy5+5EJSiL44bqzqzP4OKvShaB2qqv/yM00yI2?=
 =?us-ascii?Q?sexfvi/Mwma5kTkwtOztVN2jEYdTx16tI+7VYEyg3NNYEJbvoJlwCNGmYHDy?=
 =?us-ascii?Q?XOnAni4ZQSc1UM1nrc11zeWprzxqILFBIMfqrtw6G/TD/wgdNIXSGjB3kUaQ?=
 =?us-ascii?Q?4SBGahraXDZW2m+R3VA+fGr9XC4Kq0UO7bNHGprJL6+dTY+Slh7tOpCCoejC?=
 =?us-ascii?Q?vr5dK5G3MqWI87ZyFzDBeQbjg7J+oJhcb946IxXBcFvKP108+GxTuy+hq9OZ?=
 =?us-ascii?Q?k6lKroAv9pz0nll6PxKeC+OOemKwTs2m2SsJ3s2m6XafefoiWbcWEuoUAZqd?=
 =?us-ascii?Q?QXaS+rA/SvjhEeGaNRH5LLTEnfHdD0Jfk4jGXCoFnv9VUmyd2JbkWe6BcvQi?=
 =?us-ascii?Q?95Ovx8Y1g8le9b/SgA7mEnLQPMbEaV4DVWmo+So50jfv9blEo2LgW7G8FZYV?=
 =?us-ascii?Q?ydCMLpQg+n+NhFLf3xCqt/8sD2zGIjcWM8k33QpdF0MIWVtDn4+eKzQZKWmI?=
 =?us-ascii?Q?2e/PRTNJbe07ckVWu8YY28yxekQqsPqP0Q5ZghtgF3CxTeivItIhEVz+hphk?=
 =?us-ascii?Q?4Zq0zDC8JjydcaSI0En9hEGGqEQemUnyiul9OIfqnFSLfmJWdoM3Li+vJkzQ?=
 =?us-ascii?Q?yN3QjUdPXXzanr7Jbb+urUM7yXvahRjY5EHsGh4rILKCLyV1AjWJMEUpVf7c?=
 =?us-ascii?Q?pBhW6CDZptTr9Wld0btH23k4eKyTY4UresyAVN3xy9wfMLYDvcG2Cz+mK/yO?=
 =?us-ascii?Q?/unoBTKguPjyqhKy9/dFa0hBxHU3gqvb1Iqzf4Oo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c61e38-bd25-4d1c-1ff1-08de05b10c09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:51:50.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAfAkc/inTyO57Bfw6UKAO5JuHyaOBL+ZfNe3gzgce3InV3VDGONOxi1kVysEHNJa01RX4Br1Ys/9NusRgnWFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-Proofpoint-GUID: D9MljrhfAPEWtPQrtz7jzF9Ccbx9RB4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX2uBQDWV3YmKR
 0ykeRtMDC4KFHRCCFaiEi/KvXTGzT3UoseUHgiWEYs8F139wksksJveCNubsx33khCCY/GdxIKZ
 2Awsrt4og0wr53yjj+7cSJDouTRLA8kb66Aou4uqkAkOPBptUVZOT7pcSrgyYWbk51MUBehFNBV
 XmDALqODYzY+rZcufaBJUH1h7Se75vcngSQLiR751FfYR6VBr5knlCu1pzKC3EQhr8S2umxr87Y
 buhs16dOF3qp+o7rl8igqnlun7gAp2v2RRIer29W7S//xsCLC/8XfPmKnlroDFYc7caidcSRNrd
 LetZB+CwylrYv9LDdQspPVkhvUIH3c7HPDpXe/Fi5Pv///tmWIeN1qx0lD2MX3/yzHgfoXsYOLo
 E25N7N/QbkPDRQPx0qtakBVstROprg==
X-Proofpoint-ORIG-GUID: D9MljrhfAPEWtPQrtz7jzF9Ccbx9RB4t
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e5290c cx=c_pps
 a=42Ag0VRmng1YD8CjqzuPTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=KyTmxEXph2kb3DKQyokA:9
 a=Q-E3qfwwIjgL0I3A:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224537

ChangeLog:
  2024-12-16 (bug) [63449c] [namespace children] doesn't match non-glob
             patterns below the global namespace
  2025-01-06 (bug) [fc3509] Better error-message than "interpreter uses
             an incompatible stubs mechanism"
  2025-01-19 tzdata updated to Olson's tzdata2025a
  2025-01-28 (bug) [4f0b57] Win: [exec] now works on App Execution
             Aliases.
  2025-01-28 (bug) [4e2c8b] Win: [auto_execok] handles larger set of
             shell commands.
  2025-03-06 (bug) [ba68d1] errorline from [interp eval], interp-26.9
  2025-03-23 tzdata updated to Olson's tzdata2025b
  2025-04-11 (bug) [fd8341] Tcl_InitStubs compatibility for 9.1, better
             error-handling
  2025-05-05 (bug) [42d14c] Fix scan with long mantissa. Ex.: scan
             "1.[string repeat 1 191]e-321" %g
  2025-06-18 (bug) [4f338b] add missing Tcl_CloseEx docs
  2025-06-24 (bug) [ecf35c] Correct nested handling of return option
             -options
  2025-06-25 (bug) [ecafd8] Euro/Tail-sign missing from cp864 encoding
  2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
             leading to broken floating point
  2025-07-16 (bug) [c9f052] prevent overflow crash in Tcl_SplitList().
  2025-07-21 (bug) [61c01e] Flawed ref counts in filesystem
             implementation for Windows led to use-after-free
  2025-08-12 (new) dde => 1.4.5
  2025-08-12 (bug) [992f94] avoid misaligned pointers in macOS file
             attribute functions

Set LC_ALL and LANG to en_US.UTF-8 when running ptest since the test
cases now include more encodings than just ASCII[1].
Also, add rdepends on locale-base-en-us and tzdata for ptest package,
as they are required for running ptest.

[1] https://github.com/tcltk/tcl/commit/aca3422d8b73ea8dbb26290c5ca10887161d42ca

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---

Changes:
  v2: Set LC_ALL and LANG to en_US.UTF-8 in run-test to fix ptest failure
  v3: Add rdepends on locale-base-en-us and tzdata for ptest package.
      Add more details in commit message.

 ...ric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch  | 8 ++++----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch          | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch            | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/run-ptest               | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch    | 4 ++--
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch   | 4 ++--
 .../tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb}             | 4 ++--
 8 files changed, 20 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} (96%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 1859992838..6ba7ff4340 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index 3a4622e..6204c57 100644
+index d8fd70a..ffff4b1 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
-@@ -1418,7 +1418,7 @@ typedef enum {
+@@ -1425,7 +1425,7 @@ typedef enum {
   */
  
  typedef struct Tcl_Time {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index 6ceb297cea..ad91b9ffb3 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
+From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index c3b75e3..60ed93e 100644
+index 45e7b76..5a46e6a 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index c3b75e3..60ed93e 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 8e6726b..2345689 100644
+index 50b3e03..8a33d0c 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
@@ -51,7 +51,7 @@ index 8e6726b..2345689 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -896,7 +896,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 61153878fe..07a1f4d040 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
+From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a2f9e21..c3b75e3 100644
+index ab2e7b5..45e7b76 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index aeebb038e3..c6412e7775 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
+From 2d959d1fdfbd7e020f5177b1a7ff6a08809536ca Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 24ffb1b..c6460ad 100644
+index d64fdd4..9931dd1 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index 687e06fa4b..12921d8cfd 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -4,6 +4,8 @@
 export TZ="Europe/London"
 export TCL_LIBRARY=@libdir@/tcl8/ptest/library
 export ERROR_ON_FAILURES=1
+export LC_ALL=en_US.UTF-8
+export LANG=en_US.UTF-8
 
 # Some tests are overly strict with timings and fail on loaded systems.
 SKIP=""
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 898e8241fc..0f8bd062ac 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
+From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index bc743b3..a2f9e21 100644
+index 3efdfec..ab2e7b5 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index f2a37add7d..12e1937aa1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
+From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index e88ec3c..8e6726b 100644
+index ed07ca5..50b3e03 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
similarity index 96%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index 225f04be48..b97b20abd5 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
+SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
@@ -74,7 +74,7 @@ FILES:${PN}-dev += "${libdir}/tcl8Config.sh ${libdir}/tcl8ooConfig.sh"
 
 # isn't getting picked up by shlibs code
 RDEPENDS:${PN} += "tcl8-lib"
-RDEPENDS:${PN}-ptest += "libgcc"
+RDEPENDS:${PN}-ptest += "libgcc locale-base-en-us tzdata"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


