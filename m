Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB277CA5FDC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13441.1768933884032992427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cA4yxGUu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6EmWd3752498
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wZvRrk8ftaKTs37vRqm1VevUsv/mshMUbODQnbkr7MQ=; b=
	cA4yxGUugZ+oOhGvsKT8KrXBWy77Fu5Su9R6Kp6WOajSr3s5QwTrl1CCWv9S67RX
	Y+E3qoq74ZiDM93iDX/DSwA99YvLFqAjV3JPFrH/Yt4nxT3wEnAmIgaqjxSilFGQ
	YhHcqDmCxdGMAyk3zLUivh6QAeQs6dmInjVmPHszgXKZCEv1rUt0SS3NelaWBOZ2
	99BDZrrdVydAhzgwDIEFqdIhVjUlR5RvbdNiuGJi4cHDtFwww1hnWBlFuSs+DIdG
	Qn/IfvHPyH+U8dL9nBlb7pkuVZvA7I5XGeAdy5uJimfwCi0heiHkAy6XmUvH2Yaa
	w1o2pWkCPPVhiuN0eKvvqA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4hv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLjf3gfOjGAE2IlJovv2KzRZrwiV7zJ4AIT8fsMGbkdpVRc/MzrrbGzlZ6sykqtzX4AYRsmGfxGjXRnCXeo3ktLl9kTYc8DITucven5WwVqN0lbphhJIVAM0/Vc1uNJjR2VP5rLSohX6m3eHIJRIZuueZDElxuoFuEIV65vHAwNBS0F1j3+m3vJ3C3I6xJ6lGuGtMgxIctYuMZ1PXvCwtWbyFS4d3L5EVNodzpUVjOsGEqYoMKDYTNzY+jYeJSIocob/SjBurxvdSkdOgZqJM6XsCVnl7HUo4ebFHdw/8yuadw/z2Lf4qrF38Q/hKQW7ENotvZLDlijBpNGGQz6IcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZvRrk8ftaKTs37vRqm1VevUsv/mshMUbODQnbkr7MQ=;
 b=VumHi0o0QokruWhyv4TVfV1WvZhwWBJ7/d4PBCU/FVjoqo5rLF+R5nbt/wonXwQAXI2AcOx5zzY3wAkHfmiKLqmC0A2gRXfghRBeMVXeIsuOd9F7XNNDzcyQgPPChPnPMjUEgl5CL0qeo129cTx9Nsc0Af0vlT+Mf4+ChvGGw6eATNW2MdSd6D1p+M/LwaUXNRk5h+ZNev2TEBxCVO6Es4CtqR8jCOa3afD5WXUxQvrEHRMiz7py018BroIvqS4L+K2EdYDshecFqr66A0LgW2qHzLEBDUknfp2o2fnPVgjN1j35CKDQuRgP1SOGYAf1+tMlI8Z8T/cYR/vNA3wKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 18:31:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:20 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 02/16] rust: Install the Rust source
Date: Tue, 20 Jan 2026 10:29:33 -0800
Message-ID: <20260120182947.857242-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fb28c9-64f5-443f-1802-08de58521b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ezO95H3feLC5FvCFK0mUglsh3z2JKMpPA+NObhAb8PCyjjKIQnzr4IBLfEE2?=
 =?us-ascii?Q?/FW5lHOY8xgbw6c6MUfcxgJGy8QgP9v9bUQKRyiin0Ijc5qSyVmr5+8LSYZq?=
 =?us-ascii?Q?Ya2l11eu/jT7P+OvJn9uyUoITaj/CC9pehF+i8LkmyE9FANOfwfVAX1rSUNt?=
 =?us-ascii?Q?VmFgD0FApA4yQ1aGBPPiMW04CeDB8lnewXuO+jbjNYRO5BP7dBdLCkKZi9QV?=
 =?us-ascii?Q?b+fKCrpaAEdVfEiB5KVbomBfa/vZWyUKYnkBqeTgXck18NbQgq7jovdXjznk?=
 =?us-ascii?Q?qU8PDOhurWaQ6GgIdh1ELcwNTWBhYSFOLG6Db2Y75La58UD6GSUbuRz5E4tD?=
 =?us-ascii?Q?pPdLli8nytpnffBSAsAMnowaJ1en8ENJB0zdrW4WfasSdl3o67U7yzQu9EQ2?=
 =?us-ascii?Q?N4aiG6ZQ4j3/XHeQkCUaV964EBM0BHUck+tBMsCsov8+8NUM0Y2mwkvQre9t?=
 =?us-ascii?Q?oYTq/DBI2v0Ei+cDDSiIDn7Vvgm3oxF6yQKrFCcHoyO3j0GnJXmEmnN6T1gC?=
 =?us-ascii?Q?+6CBd7IBtaNRxiVipsFS948I0f1U/LtP3uORo/CCBmqfY6eX7i5XTtDYWq4M?=
 =?us-ascii?Q?0Zp2zGlTG4XsIXftVwDHWocvNX6QU92gpMzZPV79iNv85heAT9nbHK9BYbyb?=
 =?us-ascii?Q?qD8wlLRtZgbs1+6EeiBQvCCIxIhXDeYWFG9SD9Mq2s0QpHaUuoqjVBShwdDS?=
 =?us-ascii?Q?bGzO4LK7m8qzN5FS9Gp/9+fDU4ojSFnUci8GvT4yVDwm/xq+ePLikvBotyFQ?=
 =?us-ascii?Q?a77QOv8rHl1ZCN1WeK3ucg2NzU+NQ9fRT6xG/4/Mc/KiPJSmf6aP+eK7Xq39?=
 =?us-ascii?Q?xbajyX4XcMKkWAwBcPFfzLtE2xi4R7VIwCi0TGFr/V1S6thUEeJLb1LQA8lT?=
 =?us-ascii?Q?o6+AKUoOljsG+yVKpeQyyG8IOhjHIGKSO2kLITIpr73vwEMFe66UJqPyzSXc?=
 =?us-ascii?Q?0ubKYeC6kdisfjhMvttWX+Cbbij+9Uuq/XY6n5SNrUdm4nsXXXkgpQrY61kS?=
 =?us-ascii?Q?4TOWZ7xbFfGsLRRRfNKxmxHAEMUPTdzN3vFfzhW8CwvowYp4y8NPyEOVfWou?=
 =?us-ascii?Q?7PotH6GUnk7PtAUwayrGy6H2eQn7/11FdRAT2Q9cfdIxdAN9eDuO/2PjoKBV?=
 =?us-ascii?Q?ih+KMsXBjFkILVEwhdgm41w6TUZX/meU33J6PMMlcXd6VQDI9R9LD5e1bFeJ?=
 =?us-ascii?Q?Zpi2jMbLLgPRMmtzudeqLD9qlOhbHqQHA7BmrAW2ZwgR8VJz4vzXVQYKYN2A?=
 =?us-ascii?Q?7fHH5wKyaWm1BC+81o5FY4As+jeYef/6RiMfdV3PQYhHln6zPbzzNMTzrq8D?=
 =?us-ascii?Q?EQviKiexLmYDLACmlfJwm6Q4y61vlh/m+Ldc7xhUbt2j109jWNJW2jVl8LQA?=
 =?us-ascii?Q?t3bAUPGM3Cajc9ApD8bWr2MFnkLZRIJy04vizbaUuXR3xNZj57vr9JODg6zs?=
 =?us-ascii?Q?RwPqj2omLiD4+hEbyRZYVRRRtOvTSphPFb9l8aarmZsRfChMDF6/Hl+tquXR?=
 =?us-ascii?Q?nY8umPCPEaA/wvot/rMXQydwKe+btEo7PWnzSemAEmppU5Igpg1PgzdEnTxd?=
 =?us-ascii?Q?wh35pjSd0NondC+lc3iUGZxidBDWiTzjjMXqXtKQaGrHvCNdy6FJyUnrqQr0?=
 =?us-ascii?Q?E0+qBOnsleEGDyXIbu+mFIk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F69nvxi9RDc35x9ztmAm5hEq9nqbHh6Op+gMqnUZuPWcvatt3TFyvmq6wq+p?=
 =?us-ascii?Q?TH78s5Jpdp7FinTcuu6adD0QTBKLvmTwJ78+t0UeKVPyfTcb66qQ6ALA2Zp0?=
 =?us-ascii?Q?PRZon61j67M8iuUKzu+XY5J8+GdBEZWPIUtHwSlND9Si0ZfwG3p4Zbav6tXt?=
 =?us-ascii?Q?AZl5URKy3/pJI0slhUDijEu7o7gHpiWnQOaND8YYBD/i3+zVfVLB+m3VYKzw?=
 =?us-ascii?Q?YpdebIxbwpJSkFOE7ie1XcNtY9a8LcMCOGoxAYMhxEsxsmD0ga5DUqclpXlJ?=
 =?us-ascii?Q?MbPIeAJNeEzwWdiISE3x4Urnq/Vadikc/oqLS7W7lzhZaceJXkZayZUch8+8?=
 =?us-ascii?Q?dxoV0aJSir9kEnsV6p9CJ6Wx/Z+swWKqlTARQoQtNYpQQ8IQqfltV5pAjFVS?=
 =?us-ascii?Q?2MWeXl7Du5OcoV13NwUP9+ewgdBsTkCIVJuR3EwLSl1DS/k98wA+Tuhj51on?=
 =?us-ascii?Q?3VpqvugTE8UMr1gdQlk1F5z5ARtKgfjpH7nPGKVpdaAtykTDbIzryRaIbwON?=
 =?us-ascii?Q?l6UKMRHYVmWj5J2+RjRiGCdC3XdSbSzjg7f/B7rQF89QpRbKqpsUrOPW6Qes?=
 =?us-ascii?Q?48OZWy4IMfxniiq2vzTRtvYiwtblgOGdwlNzqI4L4ZOZuBoRRyLmZ60RJ+MJ?=
 =?us-ascii?Q?5c73vRy4IreLj3l9FelG5sgRA1fe0Ct2KjlDlG8H4TeCoMxEY+NnPniOQxkK?=
 =?us-ascii?Q?lwJiwmJSku/SNxoRdCaEpJXIbYMvPckD+iWrKLbWk4N1UmTd8OjT6/9PhvAH?=
 =?us-ascii?Q?IsN2PNCvxRnGDFcLw4K+0mafQ9GrDU4JyOxUMuQocGOaGBHm6Lm8iXQjqJ2f?=
 =?us-ascii?Q?nXVENuNtbyvY1syfoadCT5dXkZDJyiWxYQriHjhUbWr52CqRz3AFuPz47wIv?=
 =?us-ascii?Q?jFNXjPfDc282n4Bko+XGkg4x/FE/m6fUwkBnTMpU8YZfwEwDX7hw+atVdwCn?=
 =?us-ascii?Q?aAsUSoiSj5riKQxiZto68mVp+QExokNNRYBuNrJQ9lj0If8OmyTxT2kYuOIZ?=
 =?us-ascii?Q?Kyf9UoTz93ENy4cTfPw+IKvQJfGqjMhkj42LckCdrK10zvGqhD14t/bsILeC?=
 =?us-ascii?Q?db82YLv6YcIDnGozSBK+fLKSyHnaXBCUv7xa5bCeDEEXI7NGx5MX069R9sVv?=
 =?us-ascii?Q?7yCRugemBlnjo7TjHQVv7L+UBoiF0OPkgZ7wrzA86Pa7qXWYtkdumaV/XTty?=
 =?us-ascii?Q?LF+hsyU+JouuXlbKKDtP35jDwWc458UBaZQ1hReyjK82gDlt2SmzkhftJcV3?=
 =?us-ascii?Q?eTzKXQpI17ZgWbTapdewy4RuLnVqX126SliXpZjLxohD9QXh5o+/BUyiYo7H?=
 =?us-ascii?Q?W4RhIelbBANOlgB50//s0Z0Y/QCHhZ2HV2dpkSWUEnsnunvQqrICuaDoMUh4?=
 =?us-ascii?Q?jH8e1BTa9jsZwWfqyBkvbyKV5uZ/2LrmXSu68pid2w3oO9jouAgbmVpkfXPf?=
 =?us-ascii?Q?j8uiYfcrXPK4NRcyE8q+MKOA3DKr5RgS/xQPQl44Luh/mFBYEOF7+pEp5yn0?=
 =?us-ascii?Q?DWchmdHrsDMLQm/b26DzqTelbYsBVu5l+smUwnUUxtRMfiqMZ8CH6kxI8vXZ?=
 =?us-ascii?Q?Y8vfObbI/h90PI3kOQQ+fLfBwmcZuFmhe2oasRxgsnuTN/urCJgMJLwvMKU8?=
 =?us-ascii?Q?ro1nljP47NeCqenlYiBGaxuH5CGTnrCJlv8cISdVjmZs1xfiWRAnx+L17A3K?=
 =?us-ascii?Q?mFne/TSew9eRz0EM+cZmoEKzghroAgh68avMXSHc+LwPXSuBi6+gRfpUvv5M?=
 =?us-ascii?Q?SpIECAzujp3zhCl+5p3+8ejCiBn7UZ0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fb28c9-64f5-443f-1802-08de58521b73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:20.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zFskz0OCbdv7UtIKp7YU+BUZhRNlr207PC6B3PU+oOXnl77XDwBarRJHgr6UrY3G+Kj3frgGdOHrmgZE+R6Og2PUT1hXpCc9f14FO+6OJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: oDYJJHAAC5BMbDefrWqWTVQCCcJNfF4v
X-Proofpoint-ORIG-GUID: Nox-LDD7emm4Vg5LkGVhep2FXPjMozn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX2NHQ8MzVj9oD
 Eu9enIcBPa0ssb9rJ2WL+1eTP60/nxCZ0WhRhIxjjiTCe8prPg+oE8n+TVc0hFwNXRyce8CLJps
 hPQoZ8BnoFYr3xOmcCyqPgwnQLirGIy9uf4ldw5INXSt/i1B1+E/ogOCgjrFgnlsFYJKOq459Sn
 SGv2nKzNI01dTti33T+/Ysw1m5PCHXbWmyrElwfGBY3v960+HaQnxunqwb3gS8IqeO64SAQq4+j
 6aLbGEA66ShLZtCxehTk0VlPJfFZUufbx/BiEhu9tWNTvP+0MBunZ1xQVm43gq3PiHr6SY5Y0Hj
 iEtdEXc/iAUbKGIpMPFXhovXCDX5ecGp1hDdTEXr9o5W9ZV2eB7h/EMQ85pQJ9mffS++e7Vg991
 YpW75MG0IXD8JNTkr+ygAUsngaQ4vYR3AqRIKwMm9CuosKg+mkro3Sac895o6GoTibo8pKriz8t
 0hXvE7KMQBGZs/4qS7A==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc9fb cx=c_pps
 a=bMPlUhRHxnpMMWJsejB1Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=JF9118EUAAAA:8 a=t7CeM3EgAAAA:8
 a=ryPSEeu4gNSlMp8fOSAA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=xVlTc564ipvMDusKsbsT:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229769

From: Alistair Francis <alistair.francis@wdc.com>

When building the Linux kernel with Rust support enabled the kernel
expects to find the Rust source as the kernel build system will cross
compile the core library.

This patch uses the Rust tooling to install the Rust source (of size ~50MB)
when we install the compiller as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.92.0.bb     |  2 +
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch

diff --git a/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
new file mode 100644
index 0000000000..e561266d70
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
@@ -0,0 +1,60 @@
+From 2e89bf7969ac6d77b7c6a38265b1eabc8ec6df7a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 9 Jan 2026 08:35:43 +1000
+Subject: [PATCH] bootstrap: Ensure host documentation is built before tarball
+ is created
+
+`run_default_doc_steps()` is called to ensure the documentation is built
+by `Docs::run()` and it should build the documentation if it isn't
+already built.
+
+When running the `install src` command I'm seeing failures as the
+`builder.doc_out(host)` directory does not exist. This is because
+`match_paths_to_steps_and_run()` doesn't actually build any
+documentation as the `paths.is_empty()` causes an early return. This
+results in install failures as the `*/doc` src directory doesn't exist.
+
+This patch passes the paths to `run_host_step_descriptions()` when building
+documentation to ensure it is correctly built.
+
+This fixes installing the Rust source code in OpenEmbedded.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/150845]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ src/bootstrap/src/core/build_steps/dist.rs | 2 +-
+ src/bootstrap/src/core/builder/mod.rs      | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootstrap/src/core/build_steps/dist.rs b/src/bootstrap/src/core/build_steps/dist.rs
+index f47b0c0b007..2fbb068632e 100644
+--- a/src/bootstrap/src/core/build_steps/dist.rs
++++ b/src/bootstrap/src/core/build_steps/dist.rs
+@@ -83,7 +83,7 @@ fn run(self, builder: &Builder<'_>) -> Option<GeneratedTarball> {
+         // FIXME: explicitly enumerate the steps that should be executed here, and gather their
+         // documentation, rather than running all default steps and then read their output
+         // from a shared directory.
+-        builder.run_default_doc_steps();
++        builder.run_host_default_doc_steps();
+ 
+         let dest = "share/doc/rust/html";
+ 
+diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/core/builder/mod.rs
+index 4a04b97c549..16c1c324be0 100644
+--- a/src/bootstrap/src/core/builder/mod.rs
++++ b/src/bootstrap/src/core/builder/mod.rs
+@@ -1117,6 +1117,11 @@ pub fn execute_cli(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(self.kind), &self.paths);
+     }
+ 
++    /// Run all default documentation steps to build documentation.
++    pub fn run_host_default_doc_steps(&self) {
++        self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &self.paths);
++    }
++
+     /// Run all default documentation steps to build documentation.
+     pub fn run_default_doc_steps(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &[]);
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..2c1caed858 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+	    file://0001-bootstrap-Ensure-host-documentation-is-built-before-.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
 
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..af739df88a 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 inherit rust
 inherit cargo_common
+inherit pkgconfig
 
 DEPENDS += "llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
@@ -282,6 +283,7 @@ do_install () {
 
 rust_do_install() {
     rust_runx install
+    rust_runx install src
 }
 
 rust_do_install:class-nativesdk() {
-- 
2.49.0


