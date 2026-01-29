Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938E1D6B096
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19180.1769704770449459645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A0NAM3BQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAQnNt936661
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	A0NAM3BQGbXXuSwMllPkRvkS3BBRNYCHn9p+b2n0G+livvcLbdC47xYlJT/EJJCf
	UJpcTg+1ql3oCUohvWK9+yJPYay7lMJoMWWOAdEqNYrjSo1Fc6G37OSPlW6I6A/y
	n61W4WE8gLHaTGwV/qEXGy1XqKm/MfEKszyDIED5/SBrhpVagcGsB7MXXqU2yf8I
	WBhWoJhSIrmZSzTYZeIT92jSaOP10kTMRBi/gwhBP+RTbNkKlz5qIspbOJy0tuTH
	IRjKuTDJhPJs548Wkpw8sduTesKxmwlHR+5MtyABm7hFnKQ1b51acvoXK13cAQHW
	tzdn1F0rjYJEj9UIu8DXzg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx148sr5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzOZ/6XjOIXTCrxBNrmRPoahHDblg0IJmeXqYKeicNEoVGxio8BLNZ716Jb5HSXJD1PRa98S/KTMVDDbAf7OjHKUNdy9qN7O/PmuqybiAef6hVTay1a/arrRtKPtbJY9hoDibbO/yW0gfLePHLTalELKdq/WZRCrJFMFgHraO4r3OwsCjvmwTKW/SBH2oJAD30HVR02EMaeJTnzQPZmYhVqZp9cmsR5RIRuXcTdFGJJ0LRZe7cAbjbcFmdNYFJxv1rA+qoKvhEuC5Dr9qz6sj6+kkltvKNVxu42RUEwsC5KSiwMwa0YWVxwm4z04WhbUh6d2GwZLXcPI7FoBEdVhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=UkIY2wM6w4sXLT3OvSyZWd+q0ODmTbtZbJ3sGjE76qzEyRoxJjwJpaL3NgenDs2cGwDeNSR9EgwscqKzyrKRuoVf2alEfVbC4nAXGnyXtOLBhwzcvHcpexjYa0aLDdnjMXXO1SHU2wbPqnSm2CNTZ1rO0pLkHm21EjCVo53xTfWlV4TkYHChvb9YOA436WYS6FklBAW3+MuXDsFt0FzUqAdmJutv8peS2cnn5lmYCfgly8tnkBtzk4xweDeYDUtQiTk4Xw8QKIuFw6nDas3I1P5YWeGD3/8zVqIp/osEV1sKBSupj35GSDiM8TaQjlHfoAK1gwXogwSkrPMRcxjW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 01/15] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Thu, 29 Jan 2026 08:38:56 -0800
Message-ID: <20260129163910.2612040-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0168b855-2505-4efb-a67c-08de5f54f7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RYZX8SqIdt9m7giYZCDVklik7W4ZIPgdUYHTt5td5l9QRN3hrM31HW2snUak?=
 =?us-ascii?Q?XinJu4Um+uwVKMQen1YsV/REZwoTCSx+7T3JljiuexO/SIhPYDSKOnvZyGk+?=
 =?us-ascii?Q?y0grIcrsIokBULi6EXUHBeDLPKino9gZK+lZf7alElwwZHxsIrqgZ6VcnDMq?=
 =?us-ascii?Q?t/fTDhour8dPUpnRslD6khwMrVImJF4JzEYQD1Rg3rnbSRGlYhicGoEeH6Na?=
 =?us-ascii?Q?SZ2fUDf8Rd2TWu3VlOJRqw56yIGLfijUycDAx3RWmxOtwn0TDTw7LX5dNIb3?=
 =?us-ascii?Q?DEz2IapAjFroPJgOLlbxEdkx4miIRlmfBXbomQo56ITtpwBYR2CF7PYj0NZe?=
 =?us-ascii?Q?TTV54KPM0E945W5OdnDRLu7Xu8R5pmr4L9KG2BLDd9vyoTO9q7iIBa4gLp+o?=
 =?us-ascii?Q?SChwGgkKA+c6GU1XvY99v0tMFH/+Vusdy7YXpDGZkCs0d1dIKjv1kK9+lcWo?=
 =?us-ascii?Q?GUFxJ0+YTInsY1e0fJpBfno4Yo3npQsrQqwKZ+cJC7mJtQgbOJxEbCjJ0Hlt?=
 =?us-ascii?Q?DqYC7G6lmbyp0oH6xENBtyr6sEKDLtyqlQNqWIhmmS21XuuYmPUepnRnYgTp?=
 =?us-ascii?Q?bWwxwJ6Vd2/HjQdwnTsMfCrFnJu0DfxGg1xxQJvYRiEUrilDGOYeogl2m/33?=
 =?us-ascii?Q?wIpGNDdA4g59JKS8FFlkeSJQaEutBXYVDvnZt0GXkB87QIpPuJUSL4rMqJi1?=
 =?us-ascii?Q?clw910QA0wyanZxPly8yeMH/NQY9pvpl3i5PfqoCNCiMeUbidHzw3qkBb7CX?=
 =?us-ascii?Q?HIH5QvhQRjN5s+l9Khw4pezevTCMuQXWbEFCo0LmS4g0oKeJsV0GP4Zu73QL?=
 =?us-ascii?Q?5D8asf0RxrVtB1Vq6JsmpmF+rHVgJMkIhnBuoNkVenSbYTF8Y/4jvrEvVQsa?=
 =?us-ascii?Q?w4O+IvGep29RXJiQFtfq0SiwmjI6ahq/xp+BZHITZ1pjCm2GDgnfyTtPFr/y?=
 =?us-ascii?Q?OYB1k1tQChEt87lGPvxkZr3Hksg1Rvx/cXiCPRB39q7hMzTrCLYAZLNZnWyU?=
 =?us-ascii?Q?t95OLfXi/cr1HiodkfVN7Zr7x2ii8arEFyX3dsVH7KzKSNCQiqySvmTKZbTZ?=
 =?us-ascii?Q?BEDE+ZkxXxvI4/vEWL9f4GoWxYbd34qx2txQNmhUN8j3kWh6yRE+9YMqLPHX?=
 =?us-ascii?Q?MAYAj9kBQFdKqQILO5TdhMsfqh5kuMTYF+UZd/cZ3GZ4ud+LTWQ9R3OoxJ8B?=
 =?us-ascii?Q?gZORiGKrofSiiPdZixS7yj/ALhR6nzXMdpYFAO0J3Ld0j5K2O5PXO0Ht3S9t?=
 =?us-ascii?Q?g1q3IT0+vpS1VjbSfyGdL7sWs07yEJEpP0aXdbjn+96fifRRuKjSxiywoXOJ?=
 =?us-ascii?Q?VoJhQyn6TH/KOjLMiTqn8quaiWriBZUjnanA2f/ZGH3Uwp5cguvBFQEFxVRt?=
 =?us-ascii?Q?s2eNCUdIjXaS2bNCcFnIIv6owLGs5kcxwE4wgYfA2XJqVxW33G/iEMLgPTbV?=
 =?us-ascii?Q?8uW5KNDY1CM74eqjCl2e6ae80OUKFlAWvcKxX3C2n/GgKI0d0ommxqvOktlF?=
 =?us-ascii?Q?99+HNkcN5HKSZ6K78tSX7UhHxpnSHys0rWgZrYpcqNZKc8qsUp0hpZEn4VJ4?=
 =?us-ascii?Q?MPsuTuFWEUV3qiUO41vsp0fkkyPpAO/vje4dEyPStTqBp/4D6ipPCL3psbcN?=
 =?us-ascii?Q?9jseIZ99mKhOEcyzx5rBCQU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sg639ub9UHoQxXsxYrO6DF/WSyOLuh1TWnWHlt/U9uqnZtWm0LjnyLri+gak?=
 =?us-ascii?Q?WnywLECNvAqsMqDvnALr3txxQIyrRe2lUfReQ76it0DXlA/wJhTj2Zfmtp8B?=
 =?us-ascii?Q?In2yn5gR75J7MZ65bOR8QBnhqsfms4FYU2tp2ayYgPR5GMIhYJ80Wck99dmR?=
 =?us-ascii?Q?0HZnKzoQ0v8ewEgb9IyWOkJtDihDckc6/LhyIWklhZnZCGt+lidukmA/2iE8?=
 =?us-ascii?Q?G1tASRKqssysv03TietJKeFJLYHZDLo5SzpzB7bLO0QIXRH16b1nJ+/4bW9i?=
 =?us-ascii?Q?WCdIfPS7rKhYum/Bt7sAStOX+hTxw3qseolj6ZYGnaBEIYI3DGfztItPKd33?=
 =?us-ascii?Q?Rh+yX1Qv47JJs/7v1gWBLvH9lkbaulDniABujuSy4/bD2kdJ0ioAlrGWMuTW?=
 =?us-ascii?Q?4lkxowj/je/fxRhRp2zFDAsYkMHGw9umNCenxJd4aOlakDm28bcXKQE+IbjS?=
 =?us-ascii?Q?2ammCqLEZtrezYGQQpM/dkczyD4w1kbmpS+kC6AgHEx14rKKOQb4ZzrQOvOD?=
 =?us-ascii?Q?ddhipI8j8FSX3ZDZ/9OBmQq3cjX3s0wiIFQyo7oiKV/UGDkPiwpcniow06rN?=
 =?us-ascii?Q?bxnPi/7pUIJ++FGWwjZ4h4wwkX7o4nWyYRRvp5jKzEmQiGuRDwiwiXP/pUqA?=
 =?us-ascii?Q?/bTdy5wYZY+rWcjXZyPK5ARk0n56Q4L9jkWYSicceL+rqF7UThEqOG9aFO7r?=
 =?us-ascii?Q?0DwuKUYjnOdg4Ko2ehdfNCrqvw0Nhdq/YfAngfty7zl2oXB6O8za1XxBnElp?=
 =?us-ascii?Q?fZA3CF5GrjqIJW9EOXb+gIKOQeBsG0OW6A4NCG35mCx4fsG00wypaq9Yugai?=
 =?us-ascii?Q?VCtnXcvrn//k1A/gL2aQY5DU1gb0lLncsRIxDasSIQi7+EjICLPUhdpH4LeK?=
 =?us-ascii?Q?55ju8lQWooti3RtVLdT2I5iH4KPdHT9ojhtLx1s3bFyvbjC7V+uuhPpHytvN?=
 =?us-ascii?Q?KDYqdnoXclv61Z152XzLNDMaCvrlK/fDAT5idoPkwVvH0PDGAMqE0pprtNne?=
 =?us-ascii?Q?QrHbJpVgQKzAc4qAhGyrGSk/d438bBtNzHAWArf8xdz1ywANwbxxUu5ppj8T?=
 =?us-ascii?Q?MbJP8RyGv2TcV8VgtLDDjlG7IzUcbO7ffF/USX3FtiDorC9JYM7O6FFpqiZW?=
 =?us-ascii?Q?gZY4VrE7iz8+kzmokpi4nXwJGM2S92a7Pd2UQ1sBLVb+en5lZ1kuqOigladq?=
 =?us-ascii?Q?018DYa1Ex3YrFQtKaussPT2M5rZDn0Mpie4S+9NL0mJb0bp80HRmEbHh/TvD?=
 =?us-ascii?Q?o2VxQNqRCbgW4j9CGYau39INeWF7FYjxnJCcEL26R+WL2AnsDcakbqmz29ZW?=
 =?us-ascii?Q?1Ws5GIwfrYWHiytJhqnMPK4RUoSWp1CQA6/ePdeUWzskPbelLHXej0dwZgSl?=
 =?us-ascii?Q?7saFZH1UPGZ+lJ/SFe4KelduZEqbgstlItbyVRTqAUZMq5ekm1bQYmPhjTD0?=
 =?us-ascii?Q?Av0sQZOhlfefjRtJrhrEb+YQ6FeOE1TYhWTETWrT/ikPLlB/40iLC+a8AHQr?=
 =?us-ascii?Q?igcEgOX/KOEmOGAylONf43sfEH+mxit+ADAX6IV4m/ViuYs9QrTVGMt2wdWS?=
 =?us-ascii?Q?a9c0iuIk9oZ2MKHNRMYgDItJZcqdQAu30f0/WsvZqaqkhgJZWOked5Q+O8SV?=
 =?us-ascii?Q?YixiezK3hc0bB7F64HvkJUuKBYwvC/dMRvrSsY7PaNarYhwL4esTZpUUnMX0?=
 =?us-ascii?Q?MYcVEzUgGdlDxYF08cUR012EaZI597s+OpQBFeYGYk69F5NLsHhGybb1i/u7?=
 =?us-ascii?Q?e2l665ptyugkAMrVdrOp2bYRR6ClDn0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0168b855-2505-4efb-a67c-08de5f54f7a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:27.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQBW8MShq8ijL/nJjDpAxXybv8bVgsdPgs5ogyUVhXOe7C4I56hj4n7bde/yscN77Q0q4PtCp22Gp464kp7d4sE4AE2rl3/ZqJGYYEa9Thk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: omATN5pBEyQrqAl8T8nvlYxWrNr-K5FJ
X-Proofpoint-GUID: oEjUwsi1yax-_dq6wSimvya381J8d2tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX8Hm8rblB52mT
 Wz7mnNH0Tqj0IF0tGmMfaukTJDp2OX5QR6a1WC9+gytCkl4ju960R/MpaBaSdQ/vwg4upgVOhXl
 BOzifyeojGV98rNbbKJgHDofaXTFWi8GMHcT+vOpCOW9amv/gGhLzZYszzJ0Olw1bOc2eBDmHBj
 nzuxFRwBXzMcVQ2z6+S/ikBoobpooYiRU0lJ7/yk+vnGRsTQh0VuJPFSyXIv1fY9wzkbnASQh56
 8nIebPgvbtwDhk+/lBA1wdf2AaPUfYwQKOrcYVn2s/3psTFwZ+ercgJ0zBYWmfsK5mG0z5Jt/c1
 jpFS/DGt6tneIMwiFHIbpimX6CL/s11D7Nh5X+/YFpiZuypvotnZJOTSGOFJgtCu/1tIddCI0j/
 A95sEtTalgLS7+MHsGfZtNvpGZQTMhuXro7E06+fYaURicO6KIHE5X35G3yirsXC4v/DRmUQq2D
 cfauG1+viyfUYZV8M9A==
X-Authority-Analysis: v=2.4 cv=RLq+3oi+ c=1 sm=1 tr=0 ts=697b8d41 cx=c_pps
 a=FAljFvH9XqR9mTH/oaGbyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230142

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when rust-kernel distro feature is enabled to support Rust-based kernel modules or
features that require generating Rust FFI bindings using bindgen during the kernel
build process.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


