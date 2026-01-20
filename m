Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282BCCA5FC4
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12550.1768931655863282293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JU1wsSLk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5TJXu1083235
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	JU1wsSLk73eAdmVi/D1iIn7qXLNqzrb66uyMn6BqxQP/r9y84A+W+2ZLN+V3ger6
	DgdOayYpyFj8eXvnSHatCgQewtzfePv7WXwSPVdUt57BsKm/26BYeQUsuSUtvCH/
	lO7+tTkrCrOUb01xFPUNknZDvEVEABpYccddvIn9nO8AGGLJQ7YgTjo5weFZWoXY
	yArysENe0yPFA6nv8ebZH60KpC9lKoAQVityVxyg6vvyRMHpXDlK6UHM8/r5oNRo
	+sMykoStR1pQRTfyu9DWuRsXFsj0DymyeMcVWp24XQgBUCDoXcUBWfW+rMcQhaEc
	LSLmklbh8427/UjvTQ31cg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcpx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6RBb3JOmyvSHRjvWYhEb/S+yavRfCoxQNAck5uFFD3kncc8W0NSUtMXf7sQWz8SB2wS7kmZhLKbwX4mnJL4XEPVyR9CPXOZ+eqNxqHIRFlViwJLrh9HUl2vkGvVYNbnnuv3Wu1exE6BaHuSDlmIwf7yw2QUQdKMmCSseEyj2Ww/nOLzOX/PtGgYSGhtW37jV14Z9RjF/EYli0Uv6X+aQ+a+hUKLmENRo5rj4qES5JSRKMKicvg0Md8/5tOaYygrEiC+HRR4r7mh1AUV/b+RMi9KbWCexZ7J+Vn3HwzdgWefao6z9r9/tb5BgD5akg0IcVx0sZhkRf1nOHgy0icl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=goqEeA0u+FoVTvCV3T7vO4P7aZdBrmVblAWNZhAxSLDFw5bd4bQXuEJHrLwWFrNfVe4ZbzrhdcxeXIthfNed+0LwwwAr1pSIlvUQ0VIxA51EVjT2r5aQBFuaU41rfeuFGB9/oeehNIiOsxyEqRS/2ZcuwC5tgB5I0SMc791TUYjiKPR4XL0gyIYbRJ+eYvSVilqey0B5PpAwuhKxdSkr/PoFY2xl+jQpXtvX1Kyrd5FsmBoYW3/eFIMi39d/SlTLQHJoNHVKt/AqkphnE0no1jJbc98DHEL4Q7EDOsiglHZZDMuKByyT3fr76ajS3ldKtOVqrRozyJsrPONmtKgkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 17:54:10 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:10 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 01/16] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Tue, 20 Jan 2026 09:52:31 -0800
Message-ID: <20260120175246.2052341-2-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf79d40-799f-4c59-804f-08de584cea03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Atv6dqjL1qkGgnX4AbgMh0sewVqya9b9buDyF9ji1/drPz/dODGlGRJD17+s?=
 =?us-ascii?Q?TY5ZlVjE+xYpmlK/ri1ixxB2tcyDJuZu20eckUFlvFO135fjf86IRcFAA6s8?=
 =?us-ascii?Q?I1CQkCG+/B9Ls93++3RxiAC81cGHlJTM96T2WaxKDpFSS2DOhioyjWIKmW2S?=
 =?us-ascii?Q?cKOhGV4Ht9G7cvxGPNXiNNdlMC6xtUEYTDAZiTcfxOqfj93ze/N8bogqbqfv?=
 =?us-ascii?Q?chJsUauAjYWtcRCyqJBmHv6nNoX/bIVzNwEu1VSyIhVMgfkS9Ae1VEmLHDl5?=
 =?us-ascii?Q?AThaigRO6GpzpdmVTYuIwYnZARdfBj2eXguGFdQncTOTiuDaL/1skY5Tovfl?=
 =?us-ascii?Q?FZaXRNlmfo15IJhgR16xJNPy3AU6P/TSQYS+gnDtjIHy7IqntZKSbkaut5ZP?=
 =?us-ascii?Q?RjbJ5H6kxO+XAowCErjXO1/QpAQ7cEiuEM0qZOOl8um5lGd4hlflJcMWIbyW?=
 =?us-ascii?Q?jDSuDDevSfMyI6QclQ0mFjBpZKmy3kr060R2g05ngkuGn2lRfAS6BOXBWnMR?=
 =?us-ascii?Q?zox5rn77u4WynX7IxBt0xWG5A36JUdx4k6X9JJc6WdbE1wC/97wQW5HdaQP7?=
 =?us-ascii?Q?xtjBv312O3g9wwdBONDvepceaI1k5zLVhLzC4VLG1yu+cKxX/1jbpXd+dSg7?=
 =?us-ascii?Q?rp1IjE8aPzP3YUWtw5au1XrV3CvY0EnyhPhkx836S5v4ULHAC3gsirkfIUtY?=
 =?us-ascii?Q?xjJugqqyjJigW55pnErW+Y4pdacXHNVeSLxsaBFREF56w39HnZiu44ZqsQhJ?=
 =?us-ascii?Q?Y3oD2a8Z2tELAOqCqFwsVzLCqFtsEnGpnrPxNQRQKEXo2A+vQwceXCtSIHma?=
 =?us-ascii?Q?UuEikh5lUJllw+xy+taqdY1CkdexuEThZGGNeHq+7KarAyu8WfQzoej/tfhs?=
 =?us-ascii?Q?vGIIN0htqlMUfanfhpla1rCjhIKzgKQMH0AnaAkwXgfPb+Y6KccOfUVZI4JX?=
 =?us-ascii?Q?kPf4nWktkgyHhVJOEKJp46ZS1k9RfX2RDhNPPHU5XGJDtBHZtFA7Sg80qwuA?=
 =?us-ascii?Q?bXiNF/XvKmKNz59WGlNjAx9phwL5nKCtgW1LoTBr09tpwzNiEgkMhjpmgAyt?=
 =?us-ascii?Q?UwrVzEOxLvfAjK7Sd+N79WOYhTKQIKpaC99mlagstJil++GKz+lJ2sHwNlyT?=
 =?us-ascii?Q?3Rs53UextB98XNbUySXlpZUEvS+ngPA9rFnrSB9Mv7q+7po191dM4+69b9e5?=
 =?us-ascii?Q?RA/JGuz05yIHHP7lBRTHkRADXW2idrrB5NP6fkpVMQp16BBX1VCSIXD9AEMi?=
 =?us-ascii?Q?fS3yQgzVAe/UAbGMvIm+ItuPKBt7IoJSDtbv4cvTnVOUVjA/+QuZ4xi1qpaJ?=
 =?us-ascii?Q?EhTTaNXIXTK7CyOz7Cd95Ul3KNdIV+KCAXwa46rgO0OyqGwiyz+bhq94hHFf?=
 =?us-ascii?Q?/NiC6hTt/xr0f9t2cqMpX2mwiR7XhOpbsCFFxt0KWEx+caGMsxfOewfBXo84?=
 =?us-ascii?Q?PA11wpuvTvtQsPFR34sIjlIOZbpv3uCBwWhJLk7brZVzzzdBWMoBVCvMZJ9e?=
 =?us-ascii?Q?LQ8voT9qVXPKv01UdxHmlaIcHMxrQw0DwVU34lHnG1mVDxxRnjH3PhHtWJ5Z?=
 =?us-ascii?Q?9XvtMJzCfYaU15+kwHzCx4gaPwqj2yDGXy3/60d8X+dCx33ygdBqHEQkIKmM?=
 =?us-ascii?Q?qAJCPKAMf5KWo+2N0gN56xg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wRAZzuQOwcGKGeoxzwFpkkwkq3DzStDyVoJ9+tJGnMIkhH2s2GCseuskQN7u?=
 =?us-ascii?Q?lnN8FqiXKjl1WTNqaB4dVTsIC4Iq+6LJHs2KKJyQw19Yes6tYZJ3zViC2tNv?=
 =?us-ascii?Q?sl5TrdKXN4B52lErS6/S7qvxu/7HgsZk4j7PiTO7qDtVY05HRNad02Ufd0Ga?=
 =?us-ascii?Q?qI5WN7S5PXs5MDkf6/n8a5nhySKdJfQcejwNjAkQFaE06oU346OueFbF6bxp?=
 =?us-ascii?Q?/M8kWSUaBWnbdza0jHdfd7asbMIPIXqoaRciQj1WA16qsW+pN5GwiNPPoKi1?=
 =?us-ascii?Q?O2fE7oOl/NU9Qyu/oH956JuVG9rU9XeAHg1ia1DhXxVO7AJV9mCkRIzbZWut?=
 =?us-ascii?Q?3sLGNoa8M+KdUwhJdkIPGvTc5vpCpWpEK8XNL6tIfLQo5UaCBEbYGjDVoWOZ?=
 =?us-ascii?Q?TrjD4nnDk9YtwLobD+koYo5+XGSrBheAV9d2cayDtZyug5bGAPLbW/4Xz4Tf?=
 =?us-ascii?Q?CJHc9+Hb8o/+8QefftZFvW/JoX4iJSwAXmhGue8aWjeKdIFZju9Orz9ZgC1h?=
 =?us-ascii?Q?vzSZM8ywx3QQo9Cq1D6LCgiMYQi9rWnHFZAyXQUjUDpa562QfQnpoJ16YGUi?=
 =?us-ascii?Q?7Kz1cpahgOQ3i0nmUt0w4rhNlhnulia0UU84jjZH02XwGCENrurfnZt6/+61?=
 =?us-ascii?Q?Cb6R5xIJ3SOT6n8LN/zGKB+S0RZ53zblKTVSyJMrm7OBrbrCV7ivEHpd7evt?=
 =?us-ascii?Q?4IpI6MESSEJ0Pj7JCBY+V3OnIe7BI+elM0slux7Cszvkae7MRyyTv/XSrtj1?=
 =?us-ascii?Q?Stgt50fwWLO8CC+/EAh0rFl09w1qTlzqW7KrCrNeaykCTg+eiv2KHhiuYsBQ?=
 =?us-ascii?Q?KzM+ZdfCDDHyfMYbkQ9ahV7Qq3the3nPlKOzooSVdto4MhPBFJPm7WI/KZMQ?=
 =?us-ascii?Q?dvn7MiHrDQl3kNlixk09u9DX/TY6amN7ofaAfUDEBEBbmJ0yuXFgP+CTQ4A/?=
 =?us-ascii?Q?r7fNsVimPEuJ8+8RNWauXc/Bc8XsRuWJBuKW2WKAQW9Cn8oGS8D7EU4uETaP?=
 =?us-ascii?Q?ITm3cip6Hi+4mP5I1NOoiaN+VOgJI2BZKxKcszJsDZmY/Rb0zYzrGk6qZkKy?=
 =?us-ascii?Q?a2iJXCiyFL6Kz2XugeNm3RJs088KLkHZqDcRwZCBEPUVheG5Xsff7xI1a2Sw?=
 =?us-ascii?Q?B4IqTfSX+4Gay9EhH5b5zlwC/QAuDRz5w3PGyHWsEeU+TbNy2wtBRLblK/9I?=
 =?us-ascii?Q?sKrtw9W/nv1Oc4s0t9Kmf2vrUsFByLN/cpesIuSJhp31dLLgCpo9q4K2UiCp?=
 =?us-ascii?Q?E6723f0Cc8qbtFpFcdRNWffSBJ6ntAnwPDaIGEJaF/S/Q6uz2DsRj6etUO4q?=
 =?us-ascii?Q?M/ZPwWj90LJ5dyiiQiNvyWWkVThpWzBpdCZ6Wj7bXembbKyPeNXYzgnHfOnZ?=
 =?us-ascii?Q?iMG49FQ/LZvOeQVKnHJnEOthfBoiKfikyDA+eEgl0iF9AIKMzmZHvpQXdePI?=
 =?us-ascii?Q?oR8vMPp0IiMKMfd0CkkagNTuv6c8W/DzoPvCGeqbJFTo4Lwa2BWjudR9xtPF?=
 =?us-ascii?Q?b41TyvoRwRCDDHx1mpWgz0OdnUsQyKOeyrqnsEFvEEdqDcN9EtEMMr9ZZDT0?=
 =?us-ascii?Q?MXNBtXuLOg45j6w4smtp5lOiQeK7h316HHonDeUb4zH3e3JJUFD4Qp64GuFY?=
 =?us-ascii?Q?6BmdO7QdTYelVt9jnLzIzu7Rr1BpMBTOK+12ssYMqdvOaKNevsjQF9FsHZav?=
 =?us-ascii?Q?5Fh8eLsPLqdHV0Y0vh+7Nb/LVlD/KY4Ld8swujbSBwH8DoG+FzCqay32G+ED?=
 =?us-ascii?Q?GxfAo5VwfF8iF0CCJ2UxmC6dhrljbRU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf79d40-799f-4c59-804f-08de584cea03
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:10.1667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KxdUfrkhhQuc2yt0wwhKbr0f94gSx4jhkAMEt4aDv+0BVsh5uSJacowZfcerN2OjAmLYTf7gc29mQQCFUl4B/LO2+BHTFkijvK8BIMTYfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: n5HgzTCESeV5huNGh3VpjYxFAUP9_A69
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc146 cx=c_pps
 a=4FhRDsKUqNVV+vA+egT0Jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DpLV1ehfoLgvqKNcq2qTVs_fjxq1gc__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfXzya4DtXLQvq4
 p7Zk5ZIp7esAtKb/1HxIEEJvHCiyEwKdctW1FYHBi9TrMkAVd2/LamxsoZiOFEjVGmPaEBOkPq3
 9pO7aSRMDG6P/16+slsPCMED3hPfvINVKWZbdHwCnEzEH3lYLws3a9atNxXSOjO2q351sQCHV9g
 W2+1+QZvvUgGTVyvj3hnq5whs5uH65GgSEJAe1wTUWYB/WICGkN04e7P6cexWbjDnrqxqnoIjGC
 XCT/bEbqXSWEufG0JQQNOH7dEDgrxI4u1YFxkceQBMa2lFgaNHlKEyEvY75byLmxRawko1Z/nPD
 IK3jv+xPjq0+SSJ/V8ViSfPk5Bi99jaYkJcMBlhCY0l0dpUuYWVGSlR2UWQpleT2Skfet1EXN23
 hAW9BbPNb5w++DwxVbVo2cGmkEhlLboSuScaz1a3qvBf7eQR6HwAf9DO0xoHY3fK7CeBJ3B3VvD
 SZZcswy1ovh2qNDqqCA==
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
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229748

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


