Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B317BD3CCA6
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 02:19:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27090.1768443580378198388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 18:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M9hTabFu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54750d28e2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F1s6j62482569
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Q0ax874ShkDeoCHENKaw
	TyMJZBVmN2bPNcQzEe61IqU=; b=M9hTabFu7fqc+v6vsOTSqLHr1JIxdoDNd2Ql
	0GTcWA1bwF/ldej6fILCPtbg5m0A+dC7iLViVuzLEuosSSfrAvMOFcf0B17Idll2
	Dnhx3tb3o3brOfLtOGR4uA0r0kEJbOK/VEJPguo3aYlW64VhLff/npjUJ0Lv6aNC
	dzcpBGoRJrmGMR7H+VNxw0p6cC2pgmGWGQ85VyG6iEpQGkkptASC5fpkzNJDHG0J
	JH25Ve8NY7P2T8ulA9GTjCgIDWccm38fRUDDX60UKdUK82C/dqklOx+igiRRMls2
	LArtK7H5NmZ3TeXob3EHT4fTshwTKW/VPShl5TiYAKRHe7boXA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytnd9s-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj1nXzgW4I1dK8tA9C3lxHAsVpFSaHE1RvqFll5qYsjErv3MYJQyfHUiCyPuwm4tq6bphrmSgYBkKYILaHbfoB50dzeOJ7N8YLfXq1KDquiJ0KAltE6+0IPMTqHWXKq1lsuqsE5Lsy3dniZrNdGfddzw41lGKjzkHebBzIeH5+5XHduWipvA5TaykNYHFFiC2NRWav+b1hSKlP7/jR6VVGA0PZ4Nwt7Go4fu95VZqzsmiNMD4cD2KtZDqwQHHwb612SVJXfXYbmjc8uFVstuGODNPSlZmBj9BIGqZZDwSRhnaERpnnCKImB8BKpPRugGeukHHPSthdKt3PTmqs813A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0ax874ShkDeoCHENKawTyMJZBVmN2bPNcQzEe61IqU=;
 b=iX9wy3Qy2tT8DWbTozCmdAKkdu/Un2Tm7zCcIV1jKPXMH7BNnnSlEPWAyja/VCnTkM5O28H/rSyl/pEq6iDUYQioqiDPHccRcIxG+N1EiJCBv7aI20WrYYnhcU73TiTlVgmmYbdhUQsmcdK7ISh27upOJOIw2FnvtqC0eu/WPy3z35yOGhDhnTKab1sFPAbq9tuCEG+dT66/abRdqa8rsFTaaHHsgNXC1lHlt0kNyXkrmIso+JOrzTNYAx1Oi9zPaz19pqlLiOC4eRHHGzbIXYe8YFo7+Y7nyO7lhnnoKQWJ1KTqweq9ovrNGR5o9S8CG09sKQSHST+PQj+VUloW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 02:19:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 02:19:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] systemd: do not let do_fetch depend on PACKAGECONFIG
Date: Thu, 15 Jan 2026 10:19:17 +0800
Message-Id: <20260115021918.1926514-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: da12d59d-0644-40d1-b739-08de53dc86d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jZeR8b28BQZ1ElxoF9CN+TszIpP4O/tZJEVbkVvtSDzDBvUIWqSmUeTAbQ6/?=
 =?us-ascii?Q?EDuh/B8n1eZTh4jBcucPFN9wV2LoozDJPOsxZBPjGaKqBQPPW8xK6ka6ZwWZ?=
 =?us-ascii?Q?OX0NLZT64bdjLGOZZw/umuVouRIk83sScFpuDVw54A3ewGjfD0LdULdkmBh2?=
 =?us-ascii?Q?+oUiQPFRTpX5kJl/RDWxiugJSHt7iRHgAK2Cx3J8rcvXDYvTVieKrW36ACJA?=
 =?us-ascii?Q?PEf3KDYufaK9TOd83k26DpCir1yFcP159jxi2O9Q5jj/yZZDss8GtESGErZo?=
 =?us-ascii?Q?kNuooHR7B9zi9+pvaiE7wmGTkrE/nDrKOXW976bxp9hZ/xBf8uHLo2Emmzu0?=
 =?us-ascii?Q?QUmuVjcVpkZo0agwdiKCtbqTd+1WzF+VY/GY+GY1m3/6snX6SOH6rkgJE4KU?=
 =?us-ascii?Q?9+vQmCms9B40xPn8WgEff5TQG2C9a81KNxj5DIR5OgoGP3H25b3tYn6tIHv6?=
 =?us-ascii?Q?9ARRrd+oNjb22ovVvenSwx2u0OwSLeI0XDHcxg1r44Oqb1Ltyg9UuoHQDUwV?=
 =?us-ascii?Q?7KW9XoLjYOfevNPX6/zTrtAnHJNtpPxcQgWVLWCDFVPMZyC3Qzwepiv6sfWm?=
 =?us-ascii?Q?ZQ6OgVT6x/udwxXLMSnl4j2YanLNZ+KYGg51R13GVjmUI2kvJc/z7wxt7uS6?=
 =?us-ascii?Q?CuRZChWP4FvR/LHQ3XdY1H8l4bcWGrXXGhZjX7IiEbEKFhli6e4JAmnab/0p?=
 =?us-ascii?Q?D8scgZB/PR5onCaKqRFx9bQP+MTNflBMpFxpbRPbPZ8PdjKitJm1z+e7sFqd?=
 =?us-ascii?Q?B8L5HYxqj4HMl21qcgbOIRNON/yrAbRfv9VPav9jxKiqVqAMdtAYeahf5+BF?=
 =?us-ascii?Q?K7+fqaI2ZkOLMchL3GnybUNRibPW95NXoSkdeB7aNFZEN3ntQ8Xm3l9UUVKm?=
 =?us-ascii?Q?R1/zYvdqPwFsgHMCLCFoD8InRdDtTIbObOldQ/OZtqQoszgLHn4c/ju8+D+i?=
 =?us-ascii?Q?hrIl4mPWnvFXERUFKhRZx19kmYSSa8IUgXn0Ez4QSBi9FD0JvtQU2Ho3kWxY?=
 =?us-ascii?Q?vprxtP8jZ7p6MQX2tVIZucHTnDSCLQFlssxIlkBzvb3K9PzYh6wKupcoKS79?=
 =?us-ascii?Q?+vIT33G7UXuLTRWamjGobmkW/HW8n/ATxRt+8jlda/mB18sAMVai7PXKYYxu?=
 =?us-ascii?Q?6xF9tBXvj+Lof+oyP9ZIp9BsmaEug3hLXXYKQJKVXGnsTd71W3d2AxmiS4FJ?=
 =?us-ascii?Q?PpJ6gOEnjp0zxnX0/MB/sIoAAwjEYsgQsEul9RMCxYaB6EK1xDhkVbDTYkUs?=
 =?us-ascii?Q?O41gtXcUtAylht4+8kVXSCwaBFU4ihc2QysaRyQUMUUoSMAIq9uUjqAWV49h?=
 =?us-ascii?Q?nS/NNCPHRlC3xAjM0R/iKoJLPjzOyCcWgIBzIL4VKG5diaTbKhBTsnzX8W5L?=
 =?us-ascii?Q?ll8BKAJwcbToKyIll4VknQP0WXsK2eUF9gnDzpOkbcHyiYcYtmadZc9dqf+v?=
 =?us-ascii?Q?sXh0JrPLXaApzTG17IUxAFi8cn5ADKdouhcZ8HvLi0Fguffje9YOWKZlmSAp?=
 =?us-ascii?Q?r08y1RhkYpyan0lP62XWLW8W7ChBsQPGm1ehDmyBzsRvNs+fX7AceIiU1kZp?=
 =?us-ascii?Q?v3fIp2OBbb/Jmy0zMsGTCKrryebGLLbq3ivpWiZmBr7ObF0Eb4OnUlQeCH2t?=
 =?us-ascii?Q?RcUru6eAy1pDQHeFrwJ0StA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MgOJ7lI72GmQmaCdQmwm9rcvVWzu1aTY8hku1hZVARIcGaBSJ7W/eHmy6UNI?=
 =?us-ascii?Q?YLicdoShzzDZCAR/gnEJsc+dMcP23B9Xn/21i49i7gAGs09+RgxnA/KnPIo1?=
 =?us-ascii?Q?QSonCEI4S4P66p+/upyzu+3GAcTMAzKufjGC1/TGm7Gup/Fx9VDS2yTUOjrt?=
 =?us-ascii?Q?Naeaoptjo8/aQ5vo8btuz3+eqP6NTGl9uqDVbQgtSJtZNgo8H2bnhiJy358/?=
 =?us-ascii?Q?thHWbFRMpoLWpDnkg41g4oqEazYmIRLeG9ClnIiZILaPKdBWFBy5CcWiHC0d?=
 =?us-ascii?Q?Gnj6NaJtpYk7gCB0dU+oReOfjrcWeQrN4AADXoCnpXp6uFW4cCX/KbdmSd28?=
 =?us-ascii?Q?MuOWXpkWrqWMiLA/cwTxxJJMOi+iF55jKWW4iPAWHv3qt6YEPsEFWzBP/UmN?=
 =?us-ascii?Q?Yom1snsJc4MY4smJWzT68rwgoia+aIZ8qhN92trY7j9r78cTdfvzxLLj7Zd4?=
 =?us-ascii?Q?mJvnQtLWcI/1RxdtAdz7hbhBGWbjCkdz/8nyUPme9gjHXjpceLgLC3+QdT97?=
 =?us-ascii?Q?8Avpyc0I8Qagr8/9aJ08jy10T11hYlsXmbdPTPXhgXDCqiktb4ZDoOCF7sBb?=
 =?us-ascii?Q?RvNdJ9w/v/2xj7Wp1HGTofuOOsXfbn7eypeDFV+vYoX+75hyA13GB3mjt158?=
 =?us-ascii?Q?Dp3eApaqRLrP++AKGesPpPcCohOKxhbJ7+ff3ZaJYsAmZbYr31ZBvBrxL9wx?=
 =?us-ascii?Q?HxbhqnP9q4VmUU958J6WLtgq5dEag2mk2FU3visn4wyDo4iXUgVSwZt1I6Kw?=
 =?us-ascii?Q?lknvEa2DVqXTQ5dmNKh48yv/ZPt2bNysI27vj4NyK0HvvzZ5jEMw3MafYCqt?=
 =?us-ascii?Q?7uYnH+ohw2Yz3E9tdUdan0cWzx2sywzBZ0fCBUclZUQ3tXqEoL/y8C1kIGiA?=
 =?us-ascii?Q?e3+LqNM8/SmaXOrAWU+43jdq8mZrnQ2RvHBo+/spX+mFXG76/jS3ft/EyBFP?=
 =?us-ascii?Q?Xhz9UGs+pPhnTO50HkfJwPjX15nPmzYqnCml1bj0Q3CVuFCTpipImvpIwJJM?=
 =?us-ascii?Q?Piz8o/2vIqwMxaDX8HEXYOkdEF1SYbIdg7whnfm0DtgzUg26vT7E+J5Afk77?=
 =?us-ascii?Q?rMFoCb6x0+Wqfcg36kCtHpbNvqNvSrx7whMQTSk6D+h+KWPwIMXrOLc84niX?=
 =?us-ascii?Q?zsHwnZuKGqTR4Em+L8Vq7n+MTe2pr25bhOVplluXQaqlQneKaOETN6uQJZq0?=
 =?us-ascii?Q?fBGgRl3eWIcbiF6Qps/e81QJuyNBU/jlL05fxIONDa6IYkkj1Xk+fahbmhoP?=
 =?us-ascii?Q?td4ZCunpyXzCg/XH5M9t0V+BoZVkD3G2xwlEyHCUlxjfJjD3BV3iEQMKoM6R?=
 =?us-ascii?Q?fDLpz+V2CJdp+5O6NOHCpiA7lef9z1OYU7kSvSRSQhE/h4j3bRvPLDu9MDwt?=
 =?us-ascii?Q?X53EmwMhQ5HBg3wxaLSaz5cogvGaWOOy7ByFP/q8tl5Iu5Z6clTP67k4zXCS?=
 =?us-ascii?Q?8nPsJkLbVfH57T1wyp07qpu2TSIRI96YLcI/fllTCZl9o6W43CZG0Q3dE65W?=
 =?us-ascii?Q?VWBChOAIaFlyoDex9mlU7TuNZn9f1qTN6WElCHSUe0lhlUmL8hoccgaSE1B2?=
 =?us-ascii?Q?tEdfLUAlaNKcgn2m01w9UkFuJxc6O6M9LNEBzuJ890CLR4qCJHSt+SxWBPin?=
 =?us-ascii?Q?6bvGD+X1NcbHr90XuVk/iM2D91t0WvBNLIKZJA0SRFKh1P/F5JiZO0+CCy2w?=
 =?us-ascii?Q?UBp6a2DelKyvPv8+dnlM2+UxwajqjxJ2nZPq+DPMFqi7SHwJ3NSFJiAYm+BI?=
 =?us-ascii?Q?27d5HK2hOA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da12d59d-0644-40d1-b739-08de53dc86d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:19:35.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFDK7rPTrfNhF5fzZI6GhxNKptcHPtKjG9zhbj3s1l6iSnK4gT2A+eBmHKnlo3qV+VRw2LzsqndTzm8dwPhnvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
X-Proofpoint-GUID: 6LzqnGVaFXCUAEhrvHtGe54t13l-P8Vc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAxMSBTYWx0ZWRfX7IgiNVbzBtYp
 D81+r9Lczd+hy3ihA8L6LHbLN8UUUt+/JeZCtQEo834XQkTXLVLTLGELvB2CmlH4MkL3wogsT/7
 7rdw5GHnNeTAPOMZ4Do2kttGeuYhuod2b5C7/H609MTm4nAdtEB3BQRyslus1nmA9YhbI5Bpegl
 TmpLQiAqVYtO1FYfkeMkGa5jpl6IhMu7MGnD2Nfeqbd1yq3XFfZWE2nW0cw68jwLz/LCkUEQjXi
 o8wLiVBSqBNtzP7EiLEwOBgyv+mmXsdWxlQ1exaMLEvWjY4Mq8FVK3kdS9E8DqXUSkPeQWg+Xq8
 Dp7mduEFLYMdPRBvw+36cueTzxXcImiDJXWdSEf4jiUP2we0WIyzqL5n79Qtd0iGloGL6Btoz9q
 XMvD6SpZdbDPn8INkS1REYLS+SZ3ZDh5/S203YkFUSE6KFR89IEf7otLJJogHYPuRsZ7pXyZR8C
 S1Ppf/LygVSufuIGfxA==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69684ebb cx=c_pps
 a=850PSMRYHTBgLER2XRwgFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=3MWJxF09eFegH3wm570A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6LzqnGVaFXCUAEhrvHtGe54t13l-P8Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229381

From: Chen Qi <Qi.Chen@windriver.com>

It's unnecessary to make SRC_URI contains something like:
${@bb.utils.contains('PACKAGECONFIG', 'xxx', 'file://xxx', '', d)}
This does not give us any benefit and it makes do_fetch depend
on PACKAGECONFIG, which means changing of PACKAGECONFIG will result
in rerunn of do_fetch.

Besides, the related codes in do_install already does the necessary
checks.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index 410396f308..41f1e756cb 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -21,8 +21,8 @@ REQUIRED_DISTRO_FEATURES += "systemd"
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-           ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
+           file://org.freedesktop.hostname1_no_polkit.conf \
+           file://00-hostnamed-network-user.conf \
            file://init \
            file://99-default.preset \
            file://systemd-pager.sh \
-- 
2.34.1


