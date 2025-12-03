Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03002D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 06:43:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9076.1764744209553860406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 22:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VgBFWhU6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4432ecb496=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34ef412485594
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 06:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5WInTJtzs
	D2ZWyCa4wsqMz7lYtGMna1C0N44cBUzBTM=; b=VgBFWhU6px/C14OCoSBlU5lCs
	quwB38fNlePcGbJXN+er+UugxLztERUpInQter+yUgcQEbd2sIKHeu0xcGVgFgCd
	rOqToX7zaWQbGvG8JqK9ZPwR8orH+XVLJyVllSB0h5ZYxmHRDclltI+iSEkVBea4
	8UKUcVQq/N48wDKKBJnDxhc23K0LneA7wOwGNnmo1t9nibWFJhwgZHIFPVK95T6p
	NjiJVaRQftg7eCvVRtXe4VMBHxi1g+kdh3cw59UXAFtHgahzUcCNcVaANGBaHJvc
	nDfjMSmq0lSX0bwygkqV8qon446Tpsb7RICnENe6MrF2Z8kDS7fXDtEUfzViA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6cfav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:43:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7nwpn+i0pX2jUjceZRFgPFx218eD8lghref354CjMLdUxOqIRuYZ/bBcHUzd321L2stF5hxM4B9lKJnaLER1s1crSAAuinWqSCJGPHqVLRpuRtJkOhfd/15GO0ZjTr9tvgIJ5Pn0X52q8j5EaM51sNZ5Hnxhm/HZWrIdCrF9E6iRJ2BxJELa4cFeUenUIAfbkZ3k/8Ee8UayyAi/hsIriXmzpHmeDg2x86almSR4AyYW1CCFC259hrcMuWz6SjJ3iQoQORF4Fus+Wa0zhWIt1Gz8LrX8zVV4cgr7HoF/HT3i4kHkZIzSmkyqQna6ydDqKcvZTk+AuVaJSxvvjjO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WInTJtzsD2ZWyCa4wsqMz7lYtGMna1C0N44cBUzBTM=;
 b=ymGDshIy3MKHIOjUwN+FbJxGeGFlHA6KhsqPAWtyDxSjGIbgEEDt+gSsSJdqu1ggEU5EAhMJMgOTw7BnABFPTU+MV1TqBbaH7XM33n3n3I8iREpDk9OpatPPKQQrFS2UbBN8Lrz4bH9DDoCRGg5apUfGfOPaSnujK+fqSm05xndyWwCHcmnrUjc0OWkUiQhrsxtaBC9TN+aO0TEja7zPpoTfEdt89IPlY5EKsT0cA25Fv9F8OuYFbepAHuwx53M0SJU429Lr8dqfW29t0WtaOvaE0VWT70+Fk0/XBBIJD/OyZtx4f4nzSKFEpEghvv3ZJ+Wg+GpL/kGoIdq+KynNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 06:43:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 06:43:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] glibc: fix gprof lookup during gmon tests
Date: Tue,  2 Dec 2025 22:42:49 -0800
Message-ID: <20251203064249.1495565-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d22c1c-60ae-4b61-64a0-08de323741ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ozw4/2XDog0n6IcRGw5QLJfLzttyYSL1JETYlz1WtdC6vrYErutjf9DPCnnV?=
 =?us-ascii?Q?AO7vl3u8jwXtKjF8wVFeetSyRvlVXgXuUathN2210wgLfoEbGFBr7Agh7jQ0?=
 =?us-ascii?Q?aORF/MT5sSBNJ3QVVATl18wZoobdQaBnpyV+pfWOQJ8IlAWn9QROBBOlVNGC?=
 =?us-ascii?Q?OYLkMQXAtpk6vv6AaysjjxFrMoNnMdAJKpIQ64yzGKBq71+sIyG9bDHSy6EE?=
 =?us-ascii?Q?OQzESUh3sM2Njw+LjlIp0141eObkuAyPX6PRFKf1rPTTnIAFUcrH/SEF6Hgz?=
 =?us-ascii?Q?8T8rq3MW+vmD2atWribx/fnts7jCfOr1EjcOxbrXYTHm0LZzmOyCdiuiWacu?=
 =?us-ascii?Q?nZKEAx+wje19gkHPlUVsvXh0aAJYlSvAC/p0Jhyy4rLGjDdK1XGrb+3LKGWd?=
 =?us-ascii?Q?MJppgpYl8kEFcizkdpoe3T0gH6CWMURj4obUm99vVVhN3lL/U0syBai7mXeE?=
 =?us-ascii?Q?WO4oQUonK/32pWWnpVTNCFH6q+XMd2Ux/QehCTdLIge41x25CG27X2bDzeU4?=
 =?us-ascii?Q?gNFocFqI0xPU2TzfuSfMV2PTTcmQhbLZUCCcqAhN9tRUTneoK+xoSYPuJ/n3?=
 =?us-ascii?Q?pQntsMIIcoN+kTs4m8HeWvlnPLcbahZFAuzVJP3bvAWMj5y25dnx3jCj60gu?=
 =?us-ascii?Q?ml8kf2lDIYZBM+1fLbRkejlwTdS43RndOC56WH0kg5GrJV0Ehvpnr5uAol09?=
 =?us-ascii?Q?xLKtUEPBiIJE4hxhqgKtQY/Jo93peZgftaH9tXuXdMUUpL/VefUbd2WOjtxY?=
 =?us-ascii?Q?LQhSUBmUPO6+t8hne+a0S3F5DpMsRpxQ6vg9NXM1h8mblHvXQ8r5MaUMNBRS?=
 =?us-ascii?Q?+PUd/96PFwNxmdGyDdS0x+WRzqnoRPG5yv19AWiFY+AzAQRNDHQmpdU2DAlI?=
 =?us-ascii?Q?UFkqdMftB1IHsCjEDu3/xX9mDHziR4Idq7cXft51S1+eOODdBFMxW4fjjkVX?=
 =?us-ascii?Q?c0hwYceCoK+u39UlVRCEqZnYi3PTQe2mXY1CqtFlGQDkZzSV/XGWCuq89vBn?=
 =?us-ascii?Q?TYlohu68jELE/spXHtIul7oOJNAgmXAB21xnAZCpCX1CPvdKNyQ0yx1FlXlu?=
 =?us-ascii?Q?og9Okub5mPLuK6m4t3YdNo9Jqhq9UI3S+xGXQ/tvkKiyoet+l/ekQ3C9LtAD?=
 =?us-ascii?Q?E0ZVoK5k0d4yJDlXMIaOSKZpCby3yaJyVmd7mVMDCtEa6M/8KpTRxMbmr+IJ?=
 =?us-ascii?Q?hE8kA8MRbLDh9t/iYbbwZ9KXZf7EsBafSX6YMnrQZEjbznLCsXQBggeVutP5?=
 =?us-ascii?Q?HMvs4xJmkFyx1+OicWTNy6m1r+1bVjurkMB98eJxONlzmi+ppwqW6o/c0omZ?=
 =?us-ascii?Q?BMZgmxqzC+4lqeQttlaRjJni4zmejkGqMm5boX8YRGGnNE3OOm/MFUF8t8os?=
 =?us-ascii?Q?glH1Lx26au8U1cj+V+AtbwAbsrBGURno0bDiciaC8OqiW1KEZUD16cpbNERO?=
 =?us-ascii?Q?4Qj1j0Uhmc7rLkPbHn+b+RHiZsXSeazzfAMmKES6Wp15ILln0dP45lxrG4LB?=
 =?us-ascii?Q?Ge+Ff7AKb+NudetpsuJ12bTx9et4pHCIRN8C?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qL2bcBUF9mMLa3EmPuaaBVoO4NCVa6wFjNdJVN7cuRqyCRib/ylVuVkfB4BS?=
 =?us-ascii?Q?KY7/VlEEvxLs2qCEXDq83uN2Kpqbf9hidgSOzXqeQfhLMOPG4aoF3AThgjiK?=
 =?us-ascii?Q?9CZOhoZkg2yMPJdzPUCUWm6Aof8dK8TEScLfQE/074PV0DmC5EpqAWq6scT+?=
 =?us-ascii?Q?gRHo45YX6gZvHLwG5z+XuNw9l3g+mSmFsdFenA9MYbpP9GjsNl21d4rSVLuj?=
 =?us-ascii?Q?Wtz5hRArtQtsrCGGqfquwMDsceD3G6RVyHuQ+5AlZicXjxfHPxeIa3YT5Eff?=
 =?us-ascii?Q?xjDv9Uin8fupRnHP8ATdFupgjwykKUbLrXe0HyL7TQ/dWXsxYbnV3KDSc8UN?=
 =?us-ascii?Q?EpdmXRCrAyum8MsgZb3kcjzOYrkagMhz4gsXrTD8w/ZQJBWPnWeDrbiY44GN?=
 =?us-ascii?Q?57exLf5v7pPpHwvzBzyChfvN2hHHRV1MGiU39Qr+gm5Os+UDT+ZvNfxDR3ED?=
 =?us-ascii?Q?ZmnhWn62ZMdCFfIc6E/y6lycVcOAVeNisT9+REhaTqlw+xQTUYYUnR+6dVlf?=
 =?us-ascii?Q?W4OuMya8nOmX3xtCIIv4NL+ijuLdsNuA+BQQR+asnb4fYkaIvVBL4so6+WHO?=
 =?us-ascii?Q?X/tuuLB3QNpUgodYVkpoZntHgkXt09LA63uvfCdUly6lajSa7U7iRoM8tBXe?=
 =?us-ascii?Q?RP5RzB/hmA7XwOWqjgxRG18W1y4t9Qyodk7UILlDfTy1jVVVNEYhXYrWX5b5?=
 =?us-ascii?Q?NAyLhbwNVlQvcE/6zwNIxj8ifAkg4NWmwCYw0AmbQXNZoyVJ4qBrGaAslk4K?=
 =?us-ascii?Q?yi/zPQcUg++1Ykaw7GhG7w7xCPnJ4YkeDHSyd7fQFg9x3Daidv5/JPjjHONH?=
 =?us-ascii?Q?8W8ov6RBbpg1zhGJKazI1lGxWu0BfGn4UhGleNm/pRQEvQ+zV62T8j2vLkrt?=
 =?us-ascii?Q?l/uxU4izZs09tmamLezy2kKpJzmbv+AkATVcjQMN8QS7Vukmgkrf4iDxyfuE?=
 =?us-ascii?Q?/u8Q/A4onlTq+Ti3Iigy7MYpJR2+CkBJzmmAdg8TTG8+8ZqeY0JeWrRRqho2?=
 =?us-ascii?Q?R758itCOlEMbygF81Xw9yCVbnASspc2TVxZoxWJNbPdupuVijskcOYHBa0Ur?=
 =?us-ascii?Q?1ZYL+7Umg1lAcE5MvhI3pT8IbBQmphGBSD5p94NaiEUrozm3EU8X3byq4Yol?=
 =?us-ascii?Q?PMfXETVbWeFMJzFSqhbgwTW/obBi62iR4uVQKCIfNOBexaNIp4cjLkufF7XV?=
 =?us-ascii?Q?Cu8njyakfONIMrghrqW2qFAl0OS2jhicmBz/j/3GRQSbglaXNSLnKkCq1+J4?=
 =?us-ascii?Q?8ecX3IaW5DK4/SsPl/RrVccYC6aMbZGNYwqRtbp3TNr9C8vE5/q0hzHb8fIx?=
 =?us-ascii?Q?6FpazEWxepy3jZKpIQAEMbiEYdQIVIjLdTK35NAY9gUXw24RDi6KdqZg71X2?=
 =?us-ascii?Q?4ZWRrvfi/kHPWWYFJ/se3MIA6E9M1RQOfktSz+dMjkGDb4vkW1zzJ3GI54pl?=
 =?us-ascii?Q?5BFnMuPp1KlINUcLIpD9xCaEtiDsuVPvnpdByvgJnKPp4hqfS0vqqdNzKwqw?=
 =?us-ascii?Q?UGcGUYqVTSNZ0vDYkwPTHWBdC+owhylnkWyMvQ4ra2zVYNR/GbgqN3F2rdNf?=
 =?us-ascii?Q?Mj5/ID9EtZRXmPhHX1RlBeVvm+k9TsuI4xPahm0mhJuBU2deoMCuiMd0lfQV?=
 =?us-ascii?Q?qrB1EIUBu6ovCKJQJ2suXmE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d22c1c-60ae-4b61-64a0-08de323741ca
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:43:24.4101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbQ8NSZlkvGtn1XnYlapv2DLEuL6AtNvDp6flbsm/mnYT4T07FB9kYFxv8ZziYwu+LodG6NK8z7skTdmxJ0fRTaLCchzgmZSGeYbhjnE4Hjw+ECxjokJFBDimaeDXy6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA1MCBTYWx0ZWRfXw+2z/IobHRhP
 t7FdYb1tmSbbRM7wkMdSHx9tOg84HqGYm6bzN8wv4Rl0Qnho/c1hMucdizEyA/juMTLyZYeptB2
 Hhzo0aOl4+9unkLdw4pI7r5MTkXhEDj7NGWzRbhvcrcYBus8kCA/N6B3WAWUxZpUZSAZf6M6jN6
 ZhZLoQIu1Ucmv4T0ewNKznTkYMBN9/cDOR9+oRLqY4KKKj+O+QNNGuxuAqjsZvpNiPvZfYRixxu
 vIY95VCeULOcpYS7LABExQoYNKHM9A/DRPrZ/2F7mILuu4FAx/cR8xzDGW6HviNr//8U0GfH47Y
 8OFofMsPKM1BEV6YVZ9C0R6g7tkuKmerVN2fTScSrW6dCmSuyYFVDhWcO7C6r1QkLvEzas8/bDs
 icDkS297BKhPEHxSjcXKokKGFJDFIQ==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692fdc10 cx=c_pps
 a=yA2OuHN0nunLSqluPLsRVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=_M5JSNstxim3Tc8EpLUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nsi3FEIXVq-7TWM3SoJF6qoxr1Rgq9dw
X-Proofpoint-GUID: nsi3FEIXVq-7TWM3SoJF6qoxr1Rgq9dw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227202

From: Hemanth Kumar M D <hemanth.250302@gmail.com>

A few gmon tests were failing with the following error:

    tst-gmon-gprof.sh: line 52: gprof: command not found

The test scripts look for 'gprof' binary, but the binaries are available
at target-prefixed directory with an appended prefix of ${TARGET_PREFIX}.
So, the binary should be ${TARGET_PREFIX}gprof

Testing results:

+--------------+---------+---------+-------+
| Result       | Before  | After   | Diff  |
+--------------+---------+---------+-------+
| PASS         |   6968  |   6972  |   +4  |
| XPASS        |      4  |      4  |    0  |
| FAIL         |     46  |     42  |   -4  |
| XFAIL        |     16  |     16  |    0  |
| UNSUPPORTED  |    103  |    103  |    0  |
+--------------+---------+---------+-------+

Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.42.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
index 3a2764e40b..6477612feb 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
@@ -21,6 +21,7 @@ do_check:append () {
     chmod 0755 ${UNPACKDIR}/check-test-wrapper
 
     oe_runmake -i \
+        GPROF="${TARGET_PREFIX}gprof" \
         QEMU_SYSROOT="${RECIPE_SYSROOT}" \
         QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
         SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
-- 
2.49.0


