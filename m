Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEDACA5FC6
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12552.1768931658563062553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lm54qVGw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6TTi71185015
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=; b=
	Lm54qVGwf+8tHg/Y4v+JeHgS6Pk2LED3D+foq0tMzQFsLvF9EsvHBy8a6FDMA+sV
	GviynTb4QlJu6h8ccM4hOfzjGhIXZaZqt33zpPp4mvr23xBFwX66OaAkkoa1YrZM
	YN3WiLUxIbyjn6EgVwYK6RkF2d9hGBwHvGqnC4pCxBIXTxceO4NZBRGH1G1laB0A
	Bztp5hz3SezWmt3KOnOH9rqRsGI5hW+rFpfAobhIt7MwAGVcCCL/p3dDB9YumdRQ
	pWsY24TPXsvnkegOKhA2yl354QxCZE2gcba0HvvdGHUrkVwcVtlTbiGg8W+aRwBa
	7wlJTlSYrMFFby44uYaiXg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcq3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8H560o9oVbvROfWsoTWmMe4FiJdeqFTscfqC1s6rGcr7dc2sGgRIRRXxr1FwOqwf9NqfH9DOn4lDej7bMBqjP/ycE7uZBTxiUIl3LSWJn6X9a59noTutIAxS6L1CfcYr6PiMJ3ShKayD2mUZV1UV5JpCc0XoBn0gX3qltabNIoYlHCj+HISVglzI3A0PYGu3WjUWGAqupbS2d3PEG1UILBKFRTrcObhHdSuxLfUhPrD+QPXyJezF5I5LC7qnExdZ3XwgJ5H74FFPRuTYOalpMrr52SPGyOyy7dQcqLojiY+vhXFbg3q/JJ8NO3sfHW3Ae+AWW3ZwY6KEAxIh3FbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=;
 b=TR4ddQgjnaHj3lwjQAYUMmWfOTOKsv0Mf2CEFGtjKF/vJfMPpzMi0WII9aFULWJ14kIlpvhj0fFp60x2Hkv5DXza4ymxFeJtdGhOrovC2lnnFxUgSnO66INxUdSbu57Lsk8zUXu46tkf4DaOi7q7mkFRc6qepULjIsDhcZSkknldXUivKe+5+s1VIGX8K/L6bv7ywSoUivvgNFoGgWcC8ETUuuQTw8VHLmaA87FPV5sQvM8JiJPgA3tlKm2FTIZ8now+Ocd/8OsPfHLZf86X8bdfGMWhQ4UshXRgnASSSQOMPGiTdZfz/ntwBxVvmkowo/dJdVTJj7mXYCkLyWyW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 04/16] kernel-yocto: enable Rust kernel support via 'make rustavailable'.
Date: Tue, 20 Jan 2026 09:52:34 -0800
Message-ID: <20260120175246.2052341-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb1d5f1-2d3b-495e-28ad-08de584ced10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fg4W9PTuSMY8taiQrnsvuorGD3Wlsjl7k8C7Pl+ZXeXy9SM52ir1lUQXiJ5m?=
 =?us-ascii?Q?SZK74u/lrnpP/N1Fbk38VaMjRyT6JSiTWCWALeSvH0EWudq6ymNi5wLI2rvW?=
 =?us-ascii?Q?B6D1lTrOuuj4qJcAMRfU/zSvg5Oj3jlwkLf+mD2ixs4BNlnZipWqgDliYAOl?=
 =?us-ascii?Q?ij/gexo9l5m1MXiUDJnfDfCbMhbgMbrrE6wdpLY9sdfmtbMamRjLCEG9o2lS?=
 =?us-ascii?Q?ghH0ebWRII2YMY+aDg8qiEGqK59ZFBlpQDUsgbyWSVjSGUC/F6BC2vJDVCLP?=
 =?us-ascii?Q?00YZQlQfCSXyBxVkWZaqQcyTuKSs/s72w7+IK6qpYiPm2btvYMJB2shIbgx9?=
 =?us-ascii?Q?2hAUUed8c32Yx6t4oEbD3fREnoT98OIlko9xSpStk4XG563pTEiqKmiyqI35?=
 =?us-ascii?Q?sKoHRLiCIC51Bo7NCScyrq9+xdMHut4u6jLFhbF2WpHyiOLl2FL15z8JhSaf?=
 =?us-ascii?Q?R7mP/GTRTdM4lU1sxOLn3T5hEFuVs/MKASRYFmgOxwraV9ka2HbvDJIV/BFL?=
 =?us-ascii?Q?c/+IRcxsKnXTArE+Xg/hIDw6OQCG+I8PNLtxP6PDxcA9RtgkXJzsu9d/NBUk?=
 =?us-ascii?Q?oVhHc+wz7JhV+/RdadOfANtzofwScZqWSmikNlmnjO5tcVcjzM56sOFHENrC?=
 =?us-ascii?Q?npx5H2Xc4Mdjj+Ql3mlcKOaAjpN8tooDW4ZBHM2xXtLfUB3Hx48n3k48x45D?=
 =?us-ascii?Q?PgysnWWhsPlNpWcOJxAVHPiIFRYRxoUL+yilNqSGGc5t5vYeCFEKjrwrRnRs?=
 =?us-ascii?Q?Hsa+hqVYOY5ZayXy+wDC0hGHHiHSq+3C9HMChLlAVv6jSH/jKB2+iuP8V121?=
 =?us-ascii?Q?B1nB5bZb+QVjISP7qYlwtmt7+H5fBt1K6b1rQOa+PLtDJQAstpD8aYdaXlwB?=
 =?us-ascii?Q?JVOunGHr5IcAdfagLdn5p4CWE9J0m/JfxY2QniWTbkAt7T0ZsWdw7C7dIghh?=
 =?us-ascii?Q?0LMZnAw3w1BmfChxhFp9E/El0Sn7qCD7L2E6qfl0ojsd8CD/PEexRpDpedLb?=
 =?us-ascii?Q?TkoXq5RaNPf+EosgtUE15n3AafWIvFJR8IN+IMA/tk5kluXj4NKht+WmS6VP?=
 =?us-ascii?Q?rn+Wh1dANP9gfic3gQP5vFGec0GcL20UZGqniubqHmM+qDmNkC0UjKRJ4yYc?=
 =?us-ascii?Q?6UWe5sgqQ9sWtJ6MyzfteHufHZXccdShliIn7yCVN8pI7qiXNS0qBAtXTgWU?=
 =?us-ascii?Q?juN9+McCwqSgVnWe7k9vijgCdp/Wx3S/D2OMAYjcI68cunbqPSQ6ji5Sbh8A?=
 =?us-ascii?Q?nQ0ZiRghRQHgMbtGFngKTvSALTEH51TXgjJ97h5+skhX/MMLWlzLTYDYgUBI?=
 =?us-ascii?Q?ULqVeeOmIZr8kp30tXAIJ6neATJ1bEtUSSu0L1HM0OSbJ+wWV+bqulFl2Yn1?=
 =?us-ascii?Q?tRI9G0SCAuSai2Clat52BcVGM+U1x8dryD/xERxlhSjN6tk3wXHlmW099EYy?=
 =?us-ascii?Q?1Lno7Z3lk91XzFVdVFGsiJaSGhQRdxHLYrqPB5I0eJ01yZ/c47RIVpoZvn3O?=
 =?us-ascii?Q?vncfh8GhCfkoz8R7R7ea7a/4ZDj9X+kN1bfLCyZeaduK0azx54zBrguIIJIF?=
 =?us-ascii?Q?ahq0VqoVmeWwtTaWc4dI8PmqRNo3LeOFzyEbLGWWAMeFlyln0sdGXL2EORKB?=
 =?us-ascii?Q?B+3VMFBWtmYAr7cOCBLkEoo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FzcVqvqHFuR3g752XwaSr3XBKnlM+N3f5tKTt/sXZP9v2smRHi6z7iABjG6X?=
 =?us-ascii?Q?gSX9ADdgEkHPiqQpKRvK2na5vqIbhoxjVQik4sFjuopuZ6PxWLx6cPPyeowZ?=
 =?us-ascii?Q?uF3clZAmIfLwj2YuhKSxGUPLKSZBdXKq243c1jPqQc7l5mUELYbxUeIDzQV+?=
 =?us-ascii?Q?02ZZ70TaUE3iRvZ0x8xNxSEdhma0qgCFxdWIKcg7AIrjlnyeWT29jMETCpru?=
 =?us-ascii?Q?S9ms6SthzZPqU9Gfv9vGoHjyBKD8HCctmVebH9wbnUGZIs4tn12adkCL+Vfu?=
 =?us-ascii?Q?mf6rmlhT2kVhubUqkwgrhM7ZJN+aqPHszdS2a67mSOUUlRtcgs4+tgFlRsiE?=
 =?us-ascii?Q?vD2gpAN8rfoC2aFgr2LstC/3QdNxnuXikd39wUQUwNEI5QdLKwb6kQTti0fe?=
 =?us-ascii?Q?CrX0LdIWzkad0qG7F5Y2BiGateoE9vv02pnFUU4GU4xuyMU9i1D117CTqkQ2?=
 =?us-ascii?Q?QRJdPvXpxguuV7KLpPpk6e/bbu0RXGmRF32354yjVboRmlBCOM4bkfrnI/DI?=
 =?us-ascii?Q?l/R6j6DYtSWvRF/4LaxdclWvpnmk8GdBgjzPlJSWKr+O1Ijauo19ixJNjomz?=
 =?us-ascii?Q?kd7Nz62Q+bdXicaOzv9TOVpiYX2syce/28UzAcJzGvf7p/ePjEHUQpfR7Cir?=
 =?us-ascii?Q?ZeMi5KmRKIX9UntGx0mzvShyE6FfnVEtdFh1RBwnb2ozyRXqXjjU/majOfGN?=
 =?us-ascii?Q?E6CZ3AihUKNwjZn43TWkvKQYUW8O0dHlhKvw/NVEeRwtj6hArMSJWkQS0na1?=
 =?us-ascii?Q?9X+d7BOlMn3BEYyxfjY7jGL/jgyJG22Zo2cRcYLeG0zB4QPFm0DMBtv3UqU6?=
 =?us-ascii?Q?aW/sQbGFfKJpm930QYl0MNfWYrSZdQFLuU/LUn2pTQT4qoN9aSQUGA1WJ23i?=
 =?us-ascii?Q?IocUWpRErAePjWFNqX1BQvIUYMNdmW2i/HdUnFw51PBPf9GHO5M+ZLvD5KBU?=
 =?us-ascii?Q?952Fb8uvjiI9ieHswkhoThuF/8LZibWpkCJ7qDSMMBOLpYq0IaTzfo4lREqn?=
 =?us-ascii?Q?WV+DsWSbbi+iFiZjifI+Uf0Q7AQXGEBAsiCrkGL32xIb36aNKXyGnwBWMgbK?=
 =?us-ascii?Q?WbqAHQgR4D8ZsSsrl4LnhKTXTKHb1d2WjFlJilarGmlW7K6yd92fF7Z5EOOH?=
 =?us-ascii?Q?K52yctX1yCyrs32B3loElaVixvBsYzhfqklSVG9m44Jd95yp02A6BQxDPgIe?=
 =?us-ascii?Q?Fiv3YxQ7niFAvvh9II8irOH8qUbE+NTurUU7Gq+Le/DeRdNC4aFCWJJQqt5L?=
 =?us-ascii?Q?Dy5V211TvYIcTwdzkF9X5dJsQFXEWqCT474iOTQ2304n+xaHx4u7UM9URCW3?=
 =?us-ascii?Q?tBrenoa/OC4CJMvtYkb4WV18rNKAudfNgueBggodHt7ej6h9MnYew0Er6IDF?=
 =?us-ascii?Q?T8+WF9hJ+6y46Qd2KVkE/Pic417ETbPi2HZMtz2S8+C0UUOBIxRACcKBxAiq?=
 =?us-ascii?Q?Cpqac+mHFaUJDyD6l3ALKYw5x+0AphRnITaGBGzum+pmOpYDCn9Quxv/HhYp?=
 =?us-ascii?Q?V6HRrBAFFrouA275VMmevXSIDzvoAMz4xfcp7pftVdwnuWpYoVy22DON3Ph0?=
 =?us-ascii?Q?i7qZaSXpO0Jj1PBq7DHy10hxgXWcSjMEYb2+SNDO4aVLOaQmEBDaxRHMSTBn?=
 =?us-ascii?Q?pomhPJNcpPqWNnoYCqgLoY5VvTi93PN0ZKusX4tAePJIHdwFBxoJKmdk8V1K?=
 =?us-ascii?Q?gNUDcd4eIQ1n4b5UOw3Og1b6xtQJiq5nDGSD65tLspMU5WlZB9nz44pK0A+2?=
 =?us-ascii?Q?Jb2IWx9lUeWtSy0aRjOzE79p9lq11vw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb1d5f1-2d3b-495e-28ad-08de584ced10
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:15.2095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HRbB3GyvrE0MHCxxrNV4BL4ePOyHCqMZv+YFVNWUHxkgiDYjT0coAOFQWA+4zwPbi1b7ZuiGjcz4dtvQVtIFmtBVSRKc7t79HS6HNaQdvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: VIr_sYK4xmca5cqq0TJob_A3Ke6qnqQN
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc149 cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xaEl5sudIv5LnqM31SqvraEhFjrM-UKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX5TrRK6s7xFhP
 IffVDxAloI/pXHr66lCulGNFi4USttjr3/MAhu6Ia3/yYAcSorpbGWIVww8+Bl/W6Pg9pSgJyEj
 4fxOd58RPzu0FtawJEkkgMCkP3zURtNLGHqD7vtg1Oaa2gUZ1w2iz3zxx2YiVR4YNj7S0+eYwIr
 8V68DBBDJnmzxxNiXD3VJDQ93w9++vVVV9DNMcGvnZr4/69XRdS9rddw0VkPdoTlfrhLE6KA2Qi
 AexYiFRlAKOgCD+KzTDmjl9V1mkV+v6ooxMfZAoIRkaGJXiW7r1x+l1FjT0iaxB5icLWy3LAWIg
 C7uEago8qSMTLw4fQT1WDU5GoIo4FF0IlfIeQg4Kwn82WfEp4Zzk2LxCKqOUUqd7po4qnzNep1u
 quWf5jhqsHQFAb8v4/Ea8VQWiq/lueaCgaeNADxs3LWCQpD56wK1vI5y4ssELXe6PteHKTfu0jc
 5MqxhpmhV7Ql0Dxc7TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229751

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..4323c4c80a 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,8 +463,14 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
@@ -506,6 +512,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


