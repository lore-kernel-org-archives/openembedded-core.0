Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FFC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24329.1789481953067230899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EoPYn6ZV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0KYs3537205
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:19:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q7TCjJ4bvtHnXCavAKhxz74erPb4m80R5bOAzQn7uhA=; b=
	EoPYn6ZVk3krqpS8Bf4zYW59f4i4VtfrRL3JUe676oiJMxIL4yqjKUjed3/zDLbr
	3ZK3UR8PpZAhQFCUbmSWW4VmxJcJXJHmh0wwvwJZ8XuE9GAvAbaVVYlwVmD/tsYx
	fpQpCGXrSCTeev9pqp6lr0p43GxbFpJGkfVfSQCUVUKbkh6bQeuGelMIv/2YYkkn
	KW9LY+hg9P44Zm/fga1idN9TRgju41k95IW8sj1rvv56uI/ZDWjBSxlaTUStAjhI
	xBWgZv+KhVzVSpx6TSP+oCfUUIFTlM5SNw2lYwLS94kRYcdWKzrtlTyJM42UqgXA
	kIjrnF2kh90qxvRi2LiwIQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022123.outbound.protection.outlook.com [40.107.209.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn68g5a77-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbF/SLiK71CWbpYdCxVLnM9LIAxAyG7LDdcfi9H1It47nquPsJuD/pRv5LhO1hXZqi4R7C765C9QOMUc0102Pt1ElGViYfzppXULyE+aICh9ijJb+vJX/wacFNcMAgefbdqSI4UxX6YfPkAv0VsUKYI5Ja98MTi6fJmJ+JhiMjgNgtlKkgoxEqFoMdu4XlnxH6HMyCljv7V92K+61c2Bfv4hYJiAA/B/ylAMSTm/TSHVhaAHATWqsM7vy4Vm32VwP8j3rBKbSys8JoDohReEDTVt/h4L4Oxtado8u4Bgq9EebkUUcek7m/JI6usyr+Hi0/CtP6CS+l2R0k9FUQg/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7TCjJ4bvtHnXCavAKhxz74erPb4m80R5bOAzQn7uhA=;
 b=rDEHzrD3I0ID5aMDxGBclKsoA3bmpVox+pyyb0R+E9QpaNmUgvohN+6Ps6bQ8dRIMuL2liMNxWr4SVsvliy14Z7EHHX91aKh86FGdqjNsTVGK+0PcQANjCnMcZQnYaTlf2phCuG2iS7W7ZeL/bNiyJzmokK7/ahUEu7H8DA9Tvs8PXcD3noa9AL3p1dFBj7ZFTxUYgccNcon1PCk13cTxLrQg3vUmEC8nYs76hw44vBaBabadgZXXTmGvVyvN6tuQvH4/ZoHN0axRoUEFEIl7nQ3DsCQqfPHC66O0lkyt0/q2ZRXe1OzUvwhbEB0IXXejAIxIr0ncR8stkIjvuqdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 14:19:08 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:19:08 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 5/5] rust: sort hygiene data before it is encoded
Date: Tue, 15 Sep 2026 19:48:34 +0530
Message-ID: <20260915141834.1212812-6-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: bc36a340-ac35-4530-96a9-08df13344e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003|29003799003|6133799003|12006099003|25016099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	xMNlETbCq6Z94fbiITYgIx54Sdt2cK4dtcrrLzivNKNbwG0TbOJUuziNJcutcN53mRYsoEVAz7zNOFhi8+F4GWV4a2Wo1sQLkcLFZfyDuMZoGHlUY0rt0Tiy6fNyJZGq9IAuMhjc26k3uI1kZsHfDgd2obI0ruvNQ/zY0p2ACdTNpoL92nTZ3XTmKlsyUtNdk7q3PBpON6GhUPuhgZF9z3XD/2qMoqQHsVX62Df3frpk/hdp2knrk+Ugmp9LgTChoghn1RGkxaKc02D3SFHQffTCIMm3bvV0354IcG34tWzKp6BFGirQDNLHYxCDPpcdxo2/YTTIcymiYGhhZbm1EMBNlfDWR2gseVE3I/pJA763iopyFBvHWxlGmUq0z/kI2dw/+J5uAAw4Sc4K0l57te81NS/9PtwYcf556IPMjsV0M+nNRk7k+EsPzi+nfYw3hdo1pw7mGMwQa/rDPBgUIarWxhjhsWSPDmJAv/ltqWPSLyztFPVLuD7jSNUNhw2gRo7KDlUPb+4UEDvTZWdrhV3lj/YW6htAKvVNAdXDZcLOfoSzq+1agJYD5rAoesDXaz45edjsXtgV2VL1QhAAXI2t1cCsdz06K7qf3ehcqjJreKb9/4ZoKIpB0ZC9w8tFQ2UIYyQ95suaYDWgSniBVy3y1b4ZX03zU3ObntkSFh8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(29003799003)(6133799003)(12006099003)(25016099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hKnGoliKjRlsCVmepcyb1AFYZb8NnC9GGutn5Pno9zXcKOY3YYRmki/iD1sQ?=
 =?us-ascii?Q?OqmxAInvlgsZugAV+EN6xLBlkMqBW6mIdTpF/8AeOYCBL7rMasootW40Yjb3?=
 =?us-ascii?Q?m8Z/PuIDZOWi2pyg6Hf3mi6QhmXHcNYXh6hQyCdSrjZUC4LF1Cha7IKOwPPc?=
 =?us-ascii?Q?LrhorP7RJytNIKwTF4EWso2nkNCXxNqsN0Ymx1i/WBgzmUGXA9gLBalVMmy6?=
 =?us-ascii?Q?d+2UPFmBhaWmTIEBnVrXTB1FVO9Ctthm0sizsAHIgLPLaF3BqiI64aoyXYaK?=
 =?us-ascii?Q?4QMv45gIMjvYZnDRY3+A1gEeq5a17AwiQyGFyN6PzjpPNCnEvcKfZHPuv3zQ?=
 =?us-ascii?Q?QpAwFPREMJNQ989xKOgPHyU+d5CVt7bC/sOgD4qLwug7jqUhSK5sifgXCx5m?=
 =?us-ascii?Q?pmWgAocHS4S47Bn345ju4xzdCEuNTkpiEEV1kA0Rj5jL/pabh+lNkkWtDVWF?=
 =?us-ascii?Q?Jyux+InQW5Tqs4v/2Rhbp85HElRXXZc3+oAqcbPmOOCylSQeXp6CGX2V4x+x?=
 =?us-ascii?Q?9BZqIevT+uy8dnytNJUFdrh/k086mi8UFPuRLyPOQf79fUlEPedEk8FQNK8E?=
 =?us-ascii?Q?IxCEZu4PKSL2rnnyLPCpF0My4enZSeuTch8jm9wDDJj/8AwVOBB9XbWCyiDJ?=
 =?us-ascii?Q?skv31cZYUKHWk7gyLTCymeOzLyUoxsivu1j9dEzuJbLbEZ99KJJU4na8lIz8?=
 =?us-ascii?Q?NNlpyXyOSkcQxu1m87EaFslLKaBeFUixpdW4N31SglKMy/2xay2bhsQp6JDT?=
 =?us-ascii?Q?rVJIZekmuMG5wiygrxmIUPFrvdns7+fkyqS/pcCkBvvRMIivBYGt+wRz14bv?=
 =?us-ascii?Q?5PYUzQJNcReY6+Pc7OUlCQ0AEYDhSJRNSFqhHbCPLkfQ14pDfhoMH3Bb9NgZ?=
 =?us-ascii?Q?olx/bSFQRbHJTMqiA7dTBTgHcF3j4uFeovjgfpGngtWqdQdh+bzUfEPrJWa0?=
 =?us-ascii?Q?v26vM4lMq9TUdDSD/oY7PR+55fFa4mlarxJ4s4IL0pTkwcT9dqsQcuDom0vn?=
 =?us-ascii?Q?kEnZj6qd3LJaF5m2UR82+ZXFI9LgIU/F67TXfhogkxXlFP8N/A7so8mv3Nvx?=
 =?us-ascii?Q?zpqZZzP+FLfedEYMrYQ5o1Vs0mNwum05t/ZtONKDBnJm7NDXZ3RUq7UR43Ru?=
 =?us-ascii?Q?AV/xjmrJW35QEC2at6rIx/hrmAKOxihs2DPg3STtXTpqpnU3ua8gQnNQGfoM?=
 =?us-ascii?Q?OsyZos6na25iexDWkvR7kJNJp/xBRuwqyqun9fqn4R5A28zFniTJ9WuWReJV?=
 =?us-ascii?Q?C2Xw3CO/AAg20MTaR1uGSIaWYXqCwJ7N6JwFOG9lxOnZsZPd0Yeeyl9cipD0?=
 =?us-ascii?Q?mbe/taI0oikS3gOAQ63s3YF7t0sHXbHSLxTXptKwTY9ubt6mJdWkKzTfAXXf?=
 =?us-ascii?Q?t42FyxSuE42Q27lq+oEs1ciZMh94cKZ175wkgf/vmGgkPwx1n2m21iTqI8su?=
 =?us-ascii?Q?rYvNHyowAPGfv8JkaHdNpi3SYeQJkh/zc+vB7GR4FDrF6XkPP2yLBJVgPkxI?=
 =?us-ascii?Q?KC6jariqRcnDm7PQ4ixeGL1TYMltZa0XZYBMITYeL+26aB4oWRbZXhrXXrpk?=
 =?us-ascii?Q?7QfA2lZcI6sIVxN3LHe+mDKyUWQqSZ9LG1vOk4Gb4AIlRdzmO1UH+d9qQPPq?=
 =?us-ascii?Q?p2ozc8i7y+WaPk5+6dDa1fRO39T8nqcHYKAkGIaOGyzCnfSHw+n6HoyiMeTX?=
 =?us-ascii?Q?iGRwlZzSqY32Wh8oZewwi5Fh7TxHi1YbG/yFIJiOR5Io4XpuayDZwpY9Vgvy?=
 =?us-ascii?Q?1Q/fvxEk7u3f3OhzjYM92irgwSSg0fs=3D?=
X-Exchange-RoutingPolicyChecked: 
	i7mOFdL8UWiHihY00yvno83D76nKHczyYBC+dFbWot7H5KJ7uFy0bSfUrT75uPlw3Uy4l4mm3B2C9qgQ81hCP5S/MER87RGlXst5wiT3H+HKEnnPod4aUfSwyFCIcJ2kCjKFke6GVYa2VNOaIY8PvOIignBHTws/BGkkSbC7royIxaIRH0HVuedBSs07ouaNEoXGGZZcgvS/KhD7tgf7Yx+4E0OJyyBZA/cPdmBK7nWJUDiBz4yTKxrfr2f8JqgpsoiYNvRM6eyTDU9eOWHjgu/yz8AlsgtPxdURMMbV45Fzu50x6t51BtK7nMT3mSKua3ozm4NuoKno92nHi7ZOrg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc36a340-ac35-4530-96a9-08df13344e5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:19:08.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMohTaDG7HZ5vd8MAT3BQ5kipZIyh6mxjpqzs5SGNOYMe+LQmLK9WfQKAOW93QDVYFWg9xEfPRydj7EKGXwK+9jiWwOUX2xFobj2N3wsIyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ojZMDP1tFKimvtkf8I2LA0O3N6Oj10sL
X-Authority-Analysis: v=2.4 cv=cswOAF4i c=1 sm=1 tr=0 ts=6aa953e0 cx=c_pps
 a=EEuUCq1UVZeKBjwkVe0TyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8
 a=m9gQ31FgLECOTNHg3yQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-GUID: ZaCGJX6_d_ULV8i80zzNw-DYC9WekVLs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfXy0fxvqO/Y8zL
 6xU/Oa8hKhu/TasZBiLYZg5rWngKDD0G71wU5khPeNoED8Xt6WIsIfmF1kVY+6hHDsEW/H3hpbQ
 956fbDfANAPvJrTZ03uXnYVqR6L7eo1vtMhapeV8fnCpyv4OLR1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX9DVHepH9zduF
 s1xFc8S0vgyjrJOZ7f7UX0JxLQ6pQDorI7op5nKavcdJHNaSxqPRSP1TfM5TEmpf12Op6DIy83U
 ZBN3DqHQq+fTTz420NIApIQDjxAiqUukI0OPNlu/8Csl2Wq8Ck+994YOPwkZTedxqu1hpby4zZr
 iYwmqAsUT87zZ2pPsHTpqHxNTtOMNidQzOPSxOm3/CCKeiOhSv0TwVt82yjEvDlNveZU79moegC
 +AopbLhP73d5Fs4Bwt2qIS9iARB4qUZVkzeO2omTNlW6sgY1yEYSjzru54NSOLoDNCaIma3PRMu
 HnJWhM2tnRnzpi8xkPNUDkGz3nsTaIOiPqPiOSFWv1tShcjpft4NVfrsbZqEnAxaR+WK0uGJlzV
 +9p68MfPeA1HmjmIhOqYGDwmSqy1A7hoylfQRN54XQBm6xhb+dPdhsa3AFTq1t6Wvp/SnnbRzxs
 xDBqdR71ch3GmF2IN7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245847

From: Sunil Dora <sunilkumar.dora@windriver.com>

HygieneEncodeContext::encode walks a hash set while it writes the syntax
context and expansion records into the rmeta, so the byte order of the
records follows the iteration order of the set and differs between
builds on the arm workers. The added patch sorts both sets before they
are written.

Upstream tracks this as rust-lang/rust issue 129094 and is fixing it
differently in pull request 161450, which is still open, so carry the
sort until that lands.

Patch from Alejandro Enedino Hernandez Samaniego's strict-version-hash
series:
https://lists.openembedded.org/g/openembedded-core/topic/120939810

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...hygiene-encoding-order-deterministic.patch | 58 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
new file mode 100644
index 0000000000..dddb1c99ba
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
@@ -0,0 +1,58 @@
+From 9c190d14f93bf27c7f1c94d400cda6f48f285a34 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] rust: sort syntax contexts and expansions before encoding
+
+HygieneEncodeContext encodes the pending syntax contexts and expansions in
+hash-map order, so the encoded rmeta depends on the build host. Sort both
+before encoding. Upstream is fixing the same problem with a different
+approach in https://github.com/rust-lang/rust/pull/161450, which is still
+open, so this is a local fix rather than a backport of it.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ compiler/rustc_span/src/hygiene.rs | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/compiler/rustc_span/src/hygiene.rs b/compiler/rustc_span/src/hygiene.rs
+index 1c74205..a464eca 100644
+--- a/compiler/rustc_span/src/hygiene.rs
++++ b/compiler/rustc_span/src/hygiene.rs
+@@ -1313,12 +1313,12 @@ impl HygieneEncodeContext {
+ 
+             // Consume the current round of syntax contexts.
+             // Drop the lock() temporary early.
+-            // It's fine to iterate over a HashMap, because the serialization of the table
+-            // that we insert data into doesn't depend on insertion order.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_ctxts = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter();
++            let mut latest_ctxts: Vec<_> = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter().collect();
++            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
+             let all_ctxt_data: Vec<_> = HygieneData::with(|data| {
+                 latest_ctxts
++                    .into_iter()
+                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 as usize].key()))
+                     .collect()
+             });
+@@ -1330,9 +1330,11 @@ impl HygieneEncodeContext {
+ 
+             // Same as above, but for expansions instead of syntax contexts.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_expns = { mem::take(&mut *self.latest_expns.lock()) }.into_iter();
++            let mut latest_expns: Vec<_> = { mem::take(&mut *self.latest_expns.lock()) }.into_iter().collect();
++            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id));
+             let all_expn_data: Vec<_> = HygieneData::with(|data| {
+                 latest_expns
++                    .into_iter()
+                     .map(|expn| (expn, data.expn_data(expn).clone(), data.expn_hash(expn)))
+                     .collect()
+             });
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a50a3fd001..562f4afb65 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
             file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
             file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} \
+            file://0009-rustc-span-make-hygiene-encoding-order-deterministic.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


