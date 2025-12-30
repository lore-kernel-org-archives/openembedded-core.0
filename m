Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D348EE01FA
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64841.1767104187850312190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cflSVtCI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDdTMg3659508
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=; b=
	cflSVtCIciLJJeEFAoyVrZzU5OsM0/DPSaB8r5ftG5HRJhOQds+5oYsZ7lE+inZ8
	ZCcawTFM3T7uHLtWUiKh/JUln3IF5ARE6NcISq5uDSEghA0r+5ILP+Y396BG44GU
	zxnXsANcVCg8V8I/bvd6FIX++uOOpp+c3FcrwWZyu4ek0iy9c3+KMLj/ztqLE01U
	IyBX/vf8tH/frpokOd3n9TNf4XpFbnC4oxezDEscOA9Q8WBUyrynYYR2HGTvVHY4
	gi8f9KiQ/BP0DinZoPIEsSA/fSIzt6TY+Ja4ox5zjFSuJHGXJyYLp+RrK0m6TfXj
	licdIWbCSjJs4TlMvSLTVg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukamq1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkFm8hRZeqMQ5O5GyLTfeX7OPdZfVxeV1aW4aRjql0YcHKAOPnBY/DJf+ECGnN+fUSpn32kIItLvR6DMFbqCp47iToon1NTnCJHGfxpWbZqnDZTMYG3B3e7E2F7VhubT3WYOB1Yf9HyrIdyHudgh6XmknEibMJXTjvV3FEMN7Hr+OP9Id1+KWhaVzK+dw4c/EmuVMmj73B8Ri4hHo7oOxxVBTLQoHZ6G/LpknvPC22sEO//KLiXUi4W57uyjZ1yCB6BqQuiu6gXj/jpllbosZggbV+u4DXi/aIceh0HleL/h8qQLc5SjHTXNODotZr4srCOaQpQoob68bR5N/FMJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=;
 b=q7cUSULohaC/BTGyZaPH36f21r3q8crVjq26iwe5vsbinpSEKUpx5RNhD1QpQMeLrZFAqa307zH7vqGHCa0b+lkM+E3ePhYinDBtz+Fd3fzI/C46kzOQ1p0DiJSTkBvkHR9xyvQhWzcNnlP7AXTzgRpYt2PgmSolB7lcvH/AYGCI6rn0TZFfGQgdOx9Vt8vNlCdNCzb38ByzHNdSYlmhGABf4twl+bJP3GF/jvewuv6wCbS+jJKWkZgmdk8WPb46ClBZaqyVgWTS5ZDcHK872GOaRWQBrYLfTZ5N03pDlJ6AZe0YVv4ldHqUcbFvNHnJPYe7yaaS5YGQKYpxqlUJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:25 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 03/15] rust: install Rust library sources for 'make rustavailable' support
Date: Tue, 30 Dec 2025 06:15:28 -0800
Message-ID: <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: d92bf983-86e3-4db1-3ea4-08de47ae0430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fljy3ZdCo2MO7ydwPt0ccFvqHcBcvRckKEuppqyaKLxIKmD6WoqME/Rr/kxd?=
 =?us-ascii?Q?2WHBLpOpTTvdxcp0HDZTM969lW2jM7fNafwkQr57gdhsl/haUWvFJsh2lHSA?=
 =?us-ascii?Q?ERTcFS7EH09Ip55mrpcBJyONIoMFKUIq+P8c+SgSB8U116GFnOHMy3PXrNG8?=
 =?us-ascii?Q?ho4z2oeMQRWnOxuNbqXVp46QsoyU0NFiXKHFH0o/PrsJE8dm3drvgb0RLlK0?=
 =?us-ascii?Q?DuTPhrVgpBzh3o8T1k/PfydRPNc3zUPYoKHaE/rf4tON/3hU317Am+kDJ1ed?=
 =?us-ascii?Q?0BoIvqw8Qsos5rdoYJ8Qbwvv2mJvdUdEK3ceWA5rZeEMtsZ+ZLagaUvDXsGx?=
 =?us-ascii?Q?VliAoSaF0dAZGbz8N4JF74pv4GDpVPBfPP9hT+a7eciQYaJ2paec73wrXY4U?=
 =?us-ascii?Q?LFmjugxxP/oPpxMGdsebgDqDvsl5zqrreU71m9JF9gywvXbWMSdceykzE3PQ?=
 =?us-ascii?Q?b/hgy0JpBrr+p80Pd5sFteeJw8uvvRyojaIbMv2BiS1Fha19HTgkPCgI8qq6?=
 =?us-ascii?Q?/1YlaMePXQ5QzX1Tm+bMySy+J7Y/PMWE9Y+K9QZAnK3baf2PbLHxJf9mxyxv?=
 =?us-ascii?Q?peCS9/4T3x1F7O0PXVZ67Zk5/IJEN3tOfK1ki1me/neA7NRloAPtmHjl898N?=
 =?us-ascii?Q?tUbh4qeIdjurRwmz5YSt+Oi6joPGpl/YkG7NlXts6TR7nQKwGix/txH51qwm?=
 =?us-ascii?Q?R2Hta0NIxgpaQiRVhuWL0O/9t+ZJXnwCQrmsZxxeHKuZbVPIwJSbIvaePHpS?=
 =?us-ascii?Q?7WaoLSejjkvqF9jYqcclk94K046HTQ5MyiREQvFWekeIozy52YDDa1l/ErKY?=
 =?us-ascii?Q?c8EnY/f12P13YAw5sOkFZ3ie7TovOqiYcrsgl2cSjUgz8z7AB/OXmdaFIEm+?=
 =?us-ascii?Q?RtEr0GOVGde6vICpOkuMZeTtwNdimfvmMSuJYAkRRc4fHqumWiW5P4FYae7U?=
 =?us-ascii?Q?k6ZafZQ03aQ12g7UUEV5Nh2GfEvcrugyyWjpRp2ylp7LlfF3CEJxFIDdIruM?=
 =?us-ascii?Q?ANPHqFv3E/v+BogeTuRHnvdUuWityhakl6Wd1NT6XlPgAdgP9SSKMBHnqdKm?=
 =?us-ascii?Q?xt8374feBTXznMY/y0bebLvry67YecqA6ZOh4yZTmlJxbS531FX0Eahh/deW?=
 =?us-ascii?Q?F6f9W+q8T9xo71M1Fb76xmL6tX6HAdNYuE+XV3VHMHedC4GMs1Gtr8A78rtW?=
 =?us-ascii?Q?MFjW4nYqIwqZEWwlQ34s366Wg8Z5Hewm7+UrY0hRvrZUCY3JexNa9HC4vILq?=
 =?us-ascii?Q?2AxmDHoVWLHWtQQ/fHZbeweo+jmo5ap6ifhtn5h/olj7SN5hNfZYWWMex94V?=
 =?us-ascii?Q?uoqDj6LOzWYtGBJ1yvTcebKwprGZIVdCo9fvapSftakG6J7V9ySnLaJ6yF69?=
 =?us-ascii?Q?Li2y4NLZO5Pj2QhduVXhOxfVsWLrkkuAIMTcq/6Ba1lNZ5aLCy+Oor2dhExF?=
 =?us-ascii?Q?Bbp6/5inzlThl1jl1F5jZsn4VcEU3fJtZcIAX3orgI56b8NsHlY9ibAzSg0S?=
 =?us-ascii?Q?Dz05SI2piuoMQZNoMsoDJWky6Fqm0oQC/Ry+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+RSgcmM1tMmTOvzf5LitCBvVYiWGYZsx2NQ9P7FeXDiRyvbWC13s50eiQFVC?=
 =?us-ascii?Q?Iviys7AlMOPYnKTelNiA1yiqazY6zoNyqDMyM1kF0v93GGKo0WOWBsfa06bD?=
 =?us-ascii?Q?GrUYcAhKuSrYVbPzpJGYqEPoCrCyCc93UM6p00uunvgShrbJubl3gvQi3Ecq?=
 =?us-ascii?Q?1IBCCm8SzQ8nTMb0GgzM7R5PQuO2GhMOH/q7kqHiYJLWCmAjd1YOutzIjRjL?=
 =?us-ascii?Q?1XJvP2U35eDSq39JlLqYo1AHQlvWQ95jtsn3uhyJTDoFwwXffaAYwHtCmVes?=
 =?us-ascii?Q?jhviaa/MEmDju+0UUzF7IHAY5aUztLk1yZK9FdFe5qSNBHEXlzknQp5pxenf?=
 =?us-ascii?Q?fNPtquygLJnyhDysPSZrQX5Ikuq82HAp6lhsNfXxdbJDApQB0ial82rcOs+Q?=
 =?us-ascii?Q?+/LsEzmRwHWvenHsGhk+b/AQaeoTGSkacbjMCnrLnusmb6k86f5Vz/RUs3bk?=
 =?us-ascii?Q?P2NV3ahrIBQs/Wb2GtaBLuFoO7lAMv3QiMdpKhJisrBUUOiHJ/aMhbKbiwhI?=
 =?us-ascii?Q?1VJaJbG3MzDnM9aXXUxEVTWlVx4J+2seNvTZIoMFxWZFeOdPKCc8ev5Yb4xp?=
 =?us-ascii?Q?c7DAwrNblysvQA440YuRKnXiC1joKbvnE2DF1OzIwroYZzn025i5rtVm8UlF?=
 =?us-ascii?Q?MLeAfWUHzVof00N/8WPrSSUe5eK/RwaA4Scra50ZnzL/6eLcwlZGt4tH4ibM?=
 =?us-ascii?Q?zCNxt4ZIfigCkCKUIJW9Hhh/piqyGtv1+1G7VHcZ3AzY6usCaVGt4q3wqnqh?=
 =?us-ascii?Q?ImvFFvHlpp1CuPNNqQwBil1PZ1sPE6gS/HXokx4xXDnLE6NRD5H8+xHQo9i1?=
 =?us-ascii?Q?HXFiQes3Fny8L2lBFzEWizRykD8pa5lh20s1rIzOxI1T068VEqhODdLqwb8I?=
 =?us-ascii?Q?Rib5TqhmW5sWBEcKENE9D/MMwPapPl7agzw8NizR67lKGGwOBIx/7nBtUlR/?=
 =?us-ascii?Q?k/YN7KSTg7K5k1y5j1yV2IvpzijmTpEZjDd2F+tCd2pA6d6d4euxNogQui/j?=
 =?us-ascii?Q?wteRnUXSqcOcsxbqMZCI3uIqgOADdapPMoksLfEwxrOv99htxqgByBjq1yS9?=
 =?us-ascii?Q?G67XIJm8Y/Dnhp6woevoJjzQuQYDRYCVQy7UTco/SM1d4lxjul8VSsfhiMv6?=
 =?us-ascii?Q?LhNKAvrER7gozgIgALBQJCMo/SPa9ryn7WFDjWmPly04vfjLyDuwCCdwpb4n?=
 =?us-ascii?Q?P13/NYQfjKvacfRc/NmElZJkZ4BDu2FWWiCqQOYhILx4wcCblNRC5x7m4juw?=
 =?us-ascii?Q?xVw4qMMSu0BwuRyqYIDjvFXt++M0+W0WDPV0RCZ0LWb/UCzBRSOyN0Qovbkp?=
 =?us-ascii?Q?YX+iSCcCHX82m6nAzFV4LFNcHJmIx3Adk+VMhufumRSaAXQADZOo2IKFIxZd?=
 =?us-ascii?Q?/qJzDlvWrD8sHUZoXtzu0tB2nTFdktUQN0JEy2YAxEPAPNPL4eoF5c5HNLou?=
 =?us-ascii?Q?/YU63l9Rjdf+zEoLo1TcYn2IsXLqQdOi/AZdblvuIHHrewNmaMC2nGNurIXm?=
 =?us-ascii?Q?sgI9w5IUGhSrogCAitecIYcffH9NVK19jBnRlYS5+rbCK0CZbA1A5P6TEpLi?=
 =?us-ascii?Q?3Mw6HmwcIUg3+nTTCy0PO4/iuatqJWhoWDN0n3QAV+TXBIn4PhXvOjqh7IPD?=
 =?us-ascii?Q?J2bfU42m70zfhqh5qNYQ+hMgtutG1MF9Yio5Dj0PszHqXClZ0aplku7LA0vx?=
 =?us-ascii?Q?s7sMDBDaBhnhi7TOQDAcWDA5oDwkIC6XW6brgMU6RqklM+1Z8Pv5H7mJEChc?=
 =?us-ascii?Q?iWTgtuaOpM2JPNpszGf10SfsxrmlCJA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92bf983-86e3-4db1-3ea4-08de47ae0430
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:25.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHwNXa7E7lfykcQAoqRZJX/xWHKVHNQihYQJdMUZS7MDm7qAVkMHANPKMonYfuVZQ9TolY80LCh1UH4hbr+91reU0UeQyyTXaTjE/ZM5710=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953debb cx=c_pps
 a=vt7ZpyDplQGd1SQmd2LaWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: X-iJx7miTm1fIcatcoyL52RPSUDDTps6
X-Proofpoint-ORIG-GUID: WktB1-dGHXmpfxNUHE707ko3ef5Bq_WF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX4zbm32Vdcd6w
 EciZG+WmGuRh2G5T6kWB3ODYxiUuYo67K3/9gAt7JNVGG9FYcOYVMrMUQEw8CgBoS4vK2tMU3kZ
 6/6S84uwQ0WwQCSztcKzijGdsjuCwQ3xR7vB/Rs6CM23Y7/sYiSbaIVp8oV7IVhJb4Xu2f7gB7o
 0Zyzfjyf68/cokwexvEx1Ov829sHjMpCKvPhY5TDRvThI/4DgpP0f79JRDyydY7ey2OG4IY+St7
 +LNS5aQtM+sHShcwrM6uXg17iNNuDiicXFM8NoNrMeQkpimCbG6kpbZeQqG6egp0ROYW4irHuf/
 Wi2yL/kG2tKCde+IeshC0Is9WH7u4tIXFDeJwOfhCqhSCHQxv4OY05dtysBIzhgpqg4dcCWtRBT
 TXZQisXvxMJmP2usn2vu0HK8kLP1wfDJ5udHcdzFlvQziwBPQCMa5cMt+Q7mUSLHKJl155MSqUM
 WQQGKbzflmzKEuCoxKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228669

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
index a25f65f674..7644ecf2d2 100644
--- a/meta/recipes-devtools/rust/rust_1.91.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


