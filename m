Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CFEEDF059
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51758.1770919895229054759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZWuiSpoP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C4p4Bx2144042
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zevnLnsNvxE/9xsKNQqv9HE+2P20VZdZXG9kLJjMmu8=; b=
	ZWuiSpoPSMWiLdV2wya7d6KbOuIjPHjhVqd6Cb3Frs8EobzYuEXWDcAHgTttLioP
	Em4snwCf3w3t/G6cKL1LReTROD3qOr5zpTqgg69PHidm39aPFwcEUxL5Dbrjx0H4
	hy7B4tVN1rniFhI2iY+uMqrXDNHPZ8daG7QTIpv8NqvOIQuMlPxjCvwZXRbJSrI2
	0fw1vtoPw+Cic8gfS7iWK80Rko6PPQWzRz57Cq9ebB3aJ0FNMH/ucvGGFkNKApdl
	VW9d7C9z0ekZQUQy7aLZ1qpNXQ2hRMO12tfXSEObCh0DF8EFXJ4DNfBW9+CpElFi
	0y570u/FTdZWERcsfV4TxA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwphh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:11:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXFjUfaAdtO25kSW054XS2SgS5hbVchhrFRNqR+7PuFh6y9RTVIR5AHbajq8N0/04ymIKSDaTSxo3qflGsxWxnkv/uJsSQEQxI9mzsSqteZXNGj6oEIumb7mlMDqkP/i26rSAXXNV/Tvjgbr4SFL23ew3wnWIAEQf7aDO8pt+aK7vBQeqVY27v7VBI4ZFAvPHvNB2ASSYhFUD0fB72IwcW9W/7qChYE7/EgB5jaw3T9xEucu4cUnYwTFRryvwJqZBN7rolLvwF3F+XpVOBiopD7t2uooyilYFW/tp0CaOK9pDly2mBgkDTlQeXanC+j95AuMp0nbBP4fdajSMf9t/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zevnLnsNvxE/9xsKNQqv9HE+2P20VZdZXG9kLJjMmu8=;
 b=cl0ntEghckgvuZT4VsvK20wuypiN1x7uotzZRBUUbUUzGTMWFeYB8B0sEq2ZaBkMevx3A7cdKHwhfMq8y0YXgIAfhRBxdEz8hKXqgJ5Acmes9hhVKZvC9rrkI3OcEgu8Gl59rOUw3Nxw0DBQLjVr8VZo+VkGGGXDDItR7BeNBVDhOsrz75DjeOswpolibck4clb2kApNcdqbG3fP+FvmI6EJDkIwnVETA6AzP0VzhXslnTtTciWGZZh4H8vAUdtwO73N/AgSH2EAb0doRDKzN1/DuB1vcddFyntFPwI9u9OPMEPa64lY4FutO423vGRByk7i2Vj0CFk1nLztZflBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:31 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 11/14] module-rust.bbclass: Prepare out-of-tree rust module compilation
Date: Thu, 12 Feb 2026 10:10:36 -0800
Message-ID: <20260212181039.1826154-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f3ff46-3896-4e08-3cb8-08de6a622630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E2RavPWySYKjrs2JzzRv37X4IeYrIYeXtoojeDT2L0/V+Mmo6FD0QdNGTkoY?=
 =?us-ascii?Q?y2UqwmcEXcPcxKmc0xyl1PCAJ6vI93X8Qw7sfl2+n5LfMRxaGwFBOmSEwT7s?=
 =?us-ascii?Q?TBLmjB1NAmd6z3LzqLs5oG9KVTjIr1EM8fm+p7GhZyJXUJWVGcRsord1sz/m?=
 =?us-ascii?Q?2YclK4mNM4TDSq2Te1/Ap+N/sBdA5sa5pK2A9ndvLpxW8OkOfyzJPcjw1c7z?=
 =?us-ascii?Q?oXigfTl2pEB5i4AgCmA87EJus/rGo3HhRfpKlxPqmFe7XascoMmnVjXFXMcW?=
 =?us-ascii?Q?OrEATHbizpaTwb+6nl4LWIg2wBpo9tju7XruQ/639E2MDczPvbT2BHFbHRFk?=
 =?us-ascii?Q?Wh+0fsZnBOrHmR7lpE3HS8CP2gi0kGAL/IbeNEuiTa1RUc8DkBWwyPrnVNUM?=
 =?us-ascii?Q?wIuj8C0f9zDszMUjmre2iinGI4Oz1wE7AWKH06Wl1fNIa9O/zlBGW3GMbC50?=
 =?us-ascii?Q?V1ddwGo3846V4Liu0/lnmjJjaJAttW+MUFS9u1tPBbFyxU1rVBv0vTa0IBER?=
 =?us-ascii?Q?oQill9UXwbSrHF10PwGUB05PX1mG3Fcrej2uiQCYyKlLtC3zAHv8ciQtVDMQ?=
 =?us-ascii?Q?OJJ/oFSZy60eKbW6BzFjOkr9tMn5OfONX64G9KPA/T/ioOeCnbI3J3/qCGyu?=
 =?us-ascii?Q?bteyaOpITCYmaDLBI/2Meykg0odDmHkrmDnNmGXFz/mxIhkVYPvGEi3UFHbM?=
 =?us-ascii?Q?Wu+yANBD2ay8N5YB99hZ2yW3i7KAHxEc4q5hBMWYFa79AUao8IdobKLJ5fH5?=
 =?us-ascii?Q?SsEp7rIN0oohuz1yaGxyQHjY4Rg206SRw2QDjoTnaDqVAF/io2N45h9Q1leP?=
 =?us-ascii?Q?WVCal3yd4dYsBHjvBx62GP+QqkH+b4Ynr7JFIpffX4BpePiFPC9v5MzkbwLf?=
 =?us-ascii?Q?xT8vdrNcLZY2l27C++sLhq9zPFdKhGQ8eK4bmY1s1XGxXos3kCadi+XgKyB3?=
 =?us-ascii?Q?Nhhq7YiYAbxcTxdOKtvclmSCzBJALJez3A8tgVxTjbCzjJsQRpa2nZKYXkh/?=
 =?us-ascii?Q?7O5lTjJz4qKMfoFkUbXGHKhiyPiQHISypqLqheE0zRO+zhJ26VQcMcVOhSYX?=
 =?us-ascii?Q?m6nN84LvHD+VJRjD6SNFiiF0ruQ7yFGsD79C4CGbHkfgbiC4yG9GWGUrpph0?=
 =?us-ascii?Q?g7sW0fkPMIQACRID3sLFk+CZTAXqTJjY94vuP+dzbvgaS+g1WfL/h1Cc4q9T?=
 =?us-ascii?Q?gKQXKx6rKZGCZ3DAopntlQ42fjIu0NGJCbq3xqFrxxvUMDJEKMj8z4sqftTt?=
 =?us-ascii?Q?Ip5EkmR7+G7BMN+IVbKC2EY1GvaZ5ZaE/vrOmI47g7cHZKRpvrkX/+N+OFAi?=
 =?us-ascii?Q?HQGo/jVVj9v/33RUmeb7icH9uUoxljd7RDySecJnzLZmy8hu0KKlKkgAocGY?=
 =?us-ascii?Q?lWngVP5acujgiDEAzj9rKCz3DxflvBP/CapDpZnG/bRCiYr6gC93im3n1DKQ?=
 =?us-ascii?Q?LOhQvReK2kQGK4V7WAKTJtUOjUx4p2xH7qC1r+8b2YuKdMhXTvmcce+e167H?=
 =?us-ascii?Q?sUNh4RmX62fnsF2OSouQjcJvbn3F5PG76XjRkoDFkejHUE3U+Tefj+U9pczs?=
 =?us-ascii?Q?4bUbKMYOqKVdGepU9ANyBX18tn4hSoUL8Jva5eN7drmJ/cjSGXzlITDW2UOb?=
 =?us-ascii?Q?Ux0ym9MH3QXXGheJJLtfxao=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Rg4/7ApjOlMnIAsbAoJ3JlpEpXeQbRVDKFuVOUAIK2TD302IuBfXyFTKfAD?=
 =?us-ascii?Q?Bmiqtt9BEQBylD3q4k+j91QUBN0MhadFFmp/0ZxpFQSuHDlIrLwyr0VRz+Eb?=
 =?us-ascii?Q?erB1pUwu41OkyWWdxhj6JxQQfWcyV7YDogrQSRHG5V7eC9EkLE/zZ54KTq8u?=
 =?us-ascii?Q?bGdt/bqnIn96ZqVrk/CGzPgUItKhLwnkrGUUt7uM4+IvWaUYQdIbhjMN3bsR?=
 =?us-ascii?Q?hS8LbPifBxWKpuIp6TvVcOUhZ74hbkGIfWF0PomJJgrb7b8TpbfLQrIm5FHr?=
 =?us-ascii?Q?KqtL9DIK7X6Eyt4D4XyFRwKZwP4wh+AQn8SfVF/6kXtv8ixmOoNOl8qxbswN?=
 =?us-ascii?Q?wmGrFt8ubVpOTnoP8OcoVvCcN4bW9PYM4+YmmXIzn/mYdLTw99jHMM4TUmp+?=
 =?us-ascii?Q?qx1lLyzhYAyFKGYJsGxdzSBhtVeeMwF+7Sv8DxivevbJrnwUk+DQUplM966P?=
 =?us-ascii?Q?2Bv5JzbgV4v77anRe2Vsp6Sl2QIJBgAsHODHL1eDSvIb7WWra5On7qrNXPCS?=
 =?us-ascii?Q?RxX+V1taOXkz09ZDYW7//NI64JM8STtbEhoDgQzS2iyxyqM1ll6v5kD3LqAB?=
 =?us-ascii?Q?boclLrNeZ2+mYr1NpBu8veYRCl926J3lfAqgo4jnLgVvr437U59+pDf6sTJP?=
 =?us-ascii?Q?v5tseoV1tw4vZvPKUtIiPOrrc6eQPlYxcKV3K595YAeoj/ZUU2XgqUe0QDYZ?=
 =?us-ascii?Q?1U0OFpPGUNoPmlmMSyCq4WY1LTM2QNhgJOySxybbrYh+qLP8BFQfuVKsD23s?=
 =?us-ascii?Q?6LR6GrDNgWEG7kDhE2MPLn1Hp4e9no5xxY8RCV2IUnUppkaMzb0ckvfA/EvZ?=
 =?us-ascii?Q?7NXby6NY944g+bZb8pStjEOMzZ+xZ1t9/TAFWKOIL3qfgcvb1Z+9Zvrcsc39?=
 =?us-ascii?Q?q2kMDSNKXz5YwIacduEH8ZjbIXISu7nab4TW4RxXKTWwzKSFmbowriJjFEWi?=
 =?us-ascii?Q?umCdVzcYAa6ZgeJIFmfqfRL0pjnMTGfi5ZiPqRWLbALQWDX8vtvF06zVVCcb?=
 =?us-ascii?Q?WUe984nysZnz4IVqtRJmSP4DTGefyOLYEUk7/XlVcuxOpebTuz2B6G7Ylwyw?=
 =?us-ascii?Q?Hj/fn99aPjKCNa5bvWpi0beAEbXG9s/Y2NxbOth3jw6WoCyGS0wrn99y1tCR?=
 =?us-ascii?Q?VYLL18VWMOBWsKLWeqZO/eXe5EiGuozuzM2HrJS5jizjPRd3I7hOISJy/mnR?=
 =?us-ascii?Q?00zGQtci9dZroHhymvxDxMJTYzgnPZdxLCKNncB5ATBUOnLBk0Xxg00KS22c?=
 =?us-ascii?Q?cqqO0Uol7Vqz6saW70BhiufCZOozWLNNdO+FWEeX9x0sBELKz4Bo4z52GODP?=
 =?us-ascii?Q?eN4rgOtRSOiddVC/eynFY8S1j/rhmMYGU/z9b3AnlKUvBr/h3NvcXfXL8qBJ?=
 =?us-ascii?Q?Ut4xeeQBwyewlnudKXUW9OSked5ZFZeAJQDTg570diJRu1G8vlCEjZANH2uL?=
 =?us-ascii?Q?YKKMPQwbH27wzUBWUv/py7whZFg3eAl1Ols8aU5a7+dpIR7vDRFY8n4TNy+d?=
 =?us-ascii?Q?b4oG3u6148zcOYdxZb0RWMTzdLiVYApEn/TSz1EPjFwEc2V2b37w15Yrgkqw?=
 =?us-ascii?Q?2sCj/ChtUwFWvxR58P9FCi47UDoTupsXwGBU5EcYu0kxHVkHukC8ArN4do21?=
 =?us-ascii?Q?20llEn+dTHVBM574ynm2xPuK5EqZOoQ21sLk4emv77JjuNlVdgxfRL3Vuz59?=
 =?us-ascii?Q?2Kf6gdw+CZAdiyDLRAuWWgTm1irCus1tgYlqU1ThLPouhwVxCq4a0Uts4fad?=
 =?us-ascii?Q?bU9kD7OkS0tFz2tbj5TjtVjc7rhS+oo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f3ff46-3896-4e08-3cb8-08de6a622630
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:31.4261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIB4QelU0WnNSel0LU6v14+wmC76OLQu6uq6AbOx3e4dxC/dEMXBZl5V91rsplOX/KhZFBRXgBUgcJYAHUy/uwMJzBbpJLhO2T1uo58XkOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e17d6 cx=c_pps
 a=mniIB+Hk/8HPdz+5sH7poA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=7sZwceKTbfY-ewGMKEwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ooHx6ZBU6V_XjGAWk3MMg8o6HzVMn2_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfX0YExJp+OCIEN
 Al53i/QbmatBKh4lZPhS1/I2njhGgAuq8K3ou+ERVLTmw8ZtI38ubyAL4o6kZSujgnwWzBDBju0
 pw/PLuUntoRcJ7bZRu9HcbEj0LfWiJEXRjBTUjF/FJ+IBtmncPInJXJFpu1XKb+SMpZBQDUB434
 zl+9r3QLAKdfDCY4IPfGdL8oN/IqgCqrUff7INgt7RoBmw7pp4F+ceIeLawiNhTmVrW/L6SLpuK
 f3eFvjKbQLy96oWLEOuTL0fQ7otRdraLyUjazwEH/E/NxlPxIDQJiNr27Rb0t+mJZpnKD6YVfLD
 GKogSQE+6XhPUefMvA29M72x7kgJYcqDEKtDGmqy50YVOTzAaeBX8t2YE08DJGLbw7ha1DON/G3
 e0kwHhZrLeiUBzt3IwzwmnXrLdwQiA/a/IRimuz7TeYIJM4XqZQiFR8+TToNxgIGqCNWJ3qYnSF
 MJhV1iXvnlghn6IAmbg==
X-Proofpoint-ORIG-GUID: u2yLk8R0SOeAVr8bFzJD9hen_6JtBcHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231067

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for rust-out-of-tree module compilation:
- Add dependency to rust-native
- Remap ${S} in compiled output to avoid buildpath errors
- Added check to skip rust out-of-ree-module compilation,
  if rust kernel support is not enabled

Co-developed-by:Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module-rust.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/module-rust.bbclass

diff --git a/meta/classes-recipe/module-rust.bbclass b/meta/classes-recipe/module-rust.bbclass
new file mode 100644
index 0000000000..f9cee5e5bd
--- /dev/null
+++ b/meta/classes-recipe/module-rust.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit module
+
+DEPENDS += " rust-native"
+
+RUST_DEBUG_REMAP = "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR} "
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
+python __anonymous() {
+    features = (d.getVar('KERNEL_RUST_SUPPORT') or "").split()
+    if "True" not in features:
+        raise bb.parse.SkipRecipe(
+            "Skipping rust-out-of-tree-module: KERNEL_RUST_SUPPORT is not enabled"
+       )
+}
-- 
2.49.0


