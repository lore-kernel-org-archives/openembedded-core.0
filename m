Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ABAE92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6442.1766835228815914014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l2f8jWOu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUlFw3818684
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4thEGpRVAoRh4gsgznZl3JSW67EqqWZ0kAoU8S/Vwy4=; b=
	l2f8jWOufFnJi4zxrM95Z4xCWzqTLRfMb014QiaxjOeXylRJKI+zaztE4l45jXno
	ysH6toqoN1FhAw/0Uv5sp3hUbupUDRb5Ifr8BUSJiv0dzj4DSm2Zn4aGZ08MZ0fD
	dJVv8zkqR6y4InL1sFkldYnqdN1ZXYKJIFUmgmXwlLLEERWckuBcgCwz+stRzn0L
	E/5nI93snwKY8R7DVl4+bAlKw1nVv4U9i0LoTjIGRqge53uoPn3yq2ynSxJrzcgt
	e18TILBpEtWtM1sTLVZhmYeW/Kb67LS//pqib7tpEGkQaBHZtPDxH9JWhRySnv9K
	NREjDj1mjJbOp8jzytyd6g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8m8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyQJeFfR0A00FXnvb0PPPrwcDX/C3fxSPjY6eiJ7gOxUQ2yORdkan+9/0a8/7SJ377YpsBCW1ebN8z8oW0cryRd+34iUrwYNyp7w//TM1wV8IpEfFZJHCHVhrfSSP/Kcr0eR8eVly3jP6Qf/rL+4WtC7RqJZ2DJsgN8+QP50aRIaJqwS6gVmagMZahO+lZ/yGXU55/0Yfu+M663Q++Irl0wIbmlp9U07quGMwTZXWUaYjQbSaFFKTibOWY26P/HJUJdDtZnYxa0qz3nEBF5OwsxTldWv+ZjPD9LFNgQFQAB2b0ZeJWZvz9VbP4/xLIUi1kxRHFJLEhAlA2FwQGUbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4thEGpRVAoRh4gsgznZl3JSW67EqqWZ0kAoU8S/Vwy4=;
 b=Q+8NvWFvrgERo2bfGrcgnY+K2vn4HjBmV4ck4Gbdv15+GnVvMw/glU8IsEIX0eiE8hjfx4VVBr5FCEeGVQgW/ie8lctYEr9yebaDz5rm37kx/lvna1YDYVpX2PYdV8AjGyoS29SYL2/F+iveh8doobxlllpFFo9TXWfCSUTZhrOWQ6NPsK/wTvLM2woZGFsphMvE8jVVuq61YykQ2J+UUoDKYEaV/g9HFVTBhPgDnah15KpqHwt/aVfzAcEBAfb8oTC9hY3vtb90YB1QcyYLEgYBE1HeKKuBkNfXeRfg4L01RJp9sboQYVkukWime8/v4Z04bKXm3ZJlB2ojAdeHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 08/16] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Sat, 27 Dec 2025 03:32:43 -0800
Message-ID: <20251227113251.773795-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a675495-a21c-4104-b756-08de453bcbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EW+VZB9bXw2TLQw7b2sesSDNO1tIU/MSbIK7z0E/UIXRHIr+glYRgHgEvtjT?=
 =?us-ascii?Q?zTwwU5sMBQHyqxmNdJ/N2Ln7zyH1gNXtSA7Oa37gd/IJ4EDRx+aJwpoIcK/4?=
 =?us-ascii?Q?yaZQodXHTpIYbMQQ18iYJs7xRa9AHGnx4UCb2b2eWbNHqZKGgfiu0eiyByrK?=
 =?us-ascii?Q?tUuPgXO2w8XRKkWLDAzsuqttN++pI8CBSGJDiETkF/ntBtDwBEaAV0kLXcVX?=
 =?us-ascii?Q?Wn4Dxwu30n1dy+QPt1HW+iZy3QoI1l4u8IJYxrkvsFjiggr0bcwcNO18bjjz?=
 =?us-ascii?Q?rMv2gjZn2ilrpf7bDPq92csocq/9U+T4yl8ZfiSnSGiSotvrWPwRK9o6kl3Z?=
 =?us-ascii?Q?59iPl6AJYzbwrtnxA4xkrnlN9PunQ9TQNPBqEMtCbRBDcz2gUQvlnElv3/TU?=
 =?us-ascii?Q?ctlNM/REJsjkDt+Z8ouxuXSAYhdi0//xM/GEqCk3PPCydbZhujZQo/BrBga5?=
 =?us-ascii?Q?Qr7i/JE6xluq5aaXN60PRehLznqfOGggK0EMajmMB6/bDDvukVCMcfXFmtC2?=
 =?us-ascii?Q?4hxbuIBNDscPSYpmetkvpI9TvDEVdTyCTakFJAAMqjOS+BHf52XWsidf7KMa?=
 =?us-ascii?Q?r4mGzVXyJYTxXjw/8VDOK90txsm0Bc2APLTjxzRKENd+shzAHBujwP0C2sCq?=
 =?us-ascii?Q?xvWBLikf8KKiNhuMRvRpSaUXtrQpCyv+6UHNur+Y40BOkitC/CH2GW7vCVhs?=
 =?us-ascii?Q?ixKN382Nd8BZVnVdDSOWB/txTyjcslKXS7w2C+zhKx+yDZtc5rkCYbxnjGdi?=
 =?us-ascii?Q?3mS9A6F/TxbRQPJKQPrhKBj6LTats4zLNnkWncIPVwgckaiozDte+7KmFBBa?=
 =?us-ascii?Q?zh1trJrskLmwQnXpeFzZQZCSsaoPyxTPMmjPQyB6t6IAB3vYQJpJ2O2svq41?=
 =?us-ascii?Q?CJ47pyJRh8K8hXjC2x6bLaQe311PyvO98fQjiSpICeZntW+SxhPvTOUqhQjC?=
 =?us-ascii?Q?ZKzNPmCyB0GIfIkvqY1ccE0S4pz0/790IEEUFtZMkA1V44bwENrIndvH9T4C?=
 =?us-ascii?Q?Yk0/5S3Z1owqc0aBg0Vh6cKvdWI8pgwfsgu8QqxFZaSOQyfHdPaOJhgcBvB6?=
 =?us-ascii?Q?7kfp9mINHjCIYgxYtiNTPBoMYbh00/TLDYrMwIqi6ubGi2wK+JVAvzhZWyCM?=
 =?us-ascii?Q?wbScRXxSSugPAo6fU4ewnC2rkPiGFokUStN4xJ990+CW3Rt/ffkCejHWfgGY?=
 =?us-ascii?Q?aOAe8UczbdQcMCZhGMRo2z8xx3cfbEYgisJfCzB3s63pgtGhDppPRhv2MgfN?=
 =?us-ascii?Q?vqLRuG02iHYPsPw3OsF9R5z8YLoXkOc60hgPxusj6qvOUi8mmb0SkgIWQ0xS?=
 =?us-ascii?Q?Ndd+cP+Bf6EJwtfZljQ5ZGN4eiZlLdhwqKRrB2NmMVRjnRBTJZUQLZ8tqxmw?=
 =?us-ascii?Q?EF+6PvGhLbrWI0NsVDSmaMv2wUWBGltOx1sZOOKQhdZt9Txt0ZKIkGrUBv0S?=
 =?us-ascii?Q?nYys90Zy4t5dUa2NcyVISYaSILGDyUsAQwk1O1ez6hvlLgl7HiU8IWZFFSko?=
 =?us-ascii?Q?EkDdayZFzHQwWjJw7y3cFtxEXgRWzr6rGdut?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lHPCd3qDZqGvG8pt3l4PXpZpdbCYE/UoD4EQEbQpVhf8Xl1ZDnuBqL2thaXy?=
 =?us-ascii?Q?s2iLL72XemwwU1m/bFaZWUQKUsXa63Taz8KmASIHiUJ+xMRGmfO1HbwbUtiI?=
 =?us-ascii?Q?nTeA3WxM7/iskE9jq1plxxB37JV8bOAgpDZCvMl7tvEt2Ss2Ctv/jjdakbbY?=
 =?us-ascii?Q?9Xsl+mmk6JjRQHmaQzVGX7FdurkMSlLMRNolBhBLJkyIfGU/zZFPqRLbhWm9?=
 =?us-ascii?Q?Tonh5WH0i322wZBG0o3B8u9W/bz55hYLp0lDVyZitwlBjiVRnGss0Q2JhANU?=
 =?us-ascii?Q?2mDr1XKkC9SbQy7rzFPRjOx60Yv5W/iTvbTw76GQewvUUc6tga5tIDgRFaEQ?=
 =?us-ascii?Q?alZVYLf7yFWgzGrQuOsZ+b91WHHXFo7KgevmXPT9g3Fn99S7IV5kbMCuYxTf?=
 =?us-ascii?Q?kWbympCyUPRkIPYwtgjnJSkfRhm8rqF6L5kM2N/z4+KBy5iDMV3jmGKj8hr3?=
 =?us-ascii?Q?11C4Y+H6bgfVpq1nZ5qgOfmeczIajgr5OcvRQK7s5QFFQMnTe7lZay6KulSM?=
 =?us-ascii?Q?ewy6vQRb43QPiCbBZW3I3nejrMhaIUUIJVre21fMquyASowLkEElGqft2owu?=
 =?us-ascii?Q?KZjIin/WyPKJiVvdli+Xc6E7hbB4dcKSG9queRSN99uyjpnfnXucSfYbctxS?=
 =?us-ascii?Q?J25pcwa+HGmcJam4BeCCJBm4aJLROlJ/mWzd2hqf6reELoiM0YVz7je/znyK?=
 =?us-ascii?Q?b0hjGAwQ+WBvDPVYS6OYxRdMpJ0h9qUC67KsvLrhUjdj6ksllNoB5WLzKWvB?=
 =?us-ascii?Q?34v1ioVzT/ob0jYdQNUXgT5RNobB+g6NnmLjxwBomIg6kfggxoRqQjni8p2e?=
 =?us-ascii?Q?ZdUVPU6Q+6cd60oQ6f0tABkHBDVtvcJ0TQTbpdarOJ8RdCzJ1DYi9e71AXva?=
 =?us-ascii?Q?4193Y5iqs12VKmfyXHzxjVPql/ylcUyY9qJ4rCUCyslbBTVDd2Zhn8HpdCi/?=
 =?us-ascii?Q?xVAFqsXMldnu1chKt7LfJ61i5oc5kpOXWvxO+v0jjMIPJRwhO52xQxmjlZHH?=
 =?us-ascii?Q?7OLbRUkZoY51+X87VJFVbRXJs38tbLZE3S9E1ASz8r9RtuqSq8o6BiFuBhTR?=
 =?us-ascii?Q?xkzJtOqagrdFY2cvCvgEQv4IC3FPrBCqVc66mA1x+eGnoHptjzrsytCZcOUh?=
 =?us-ascii?Q?6Onpa2ElGPo4Sf6eec77yfVpIEvv0hx0+RnT4vgjvU8rTB/NirqR84HUhhDu?=
 =?us-ascii?Q?AtnbsUodxxGKn7VsH5lyzjNCTdNLT4SYX4LtiqAcSxTgMkD/uPuospbduFi2?=
 =?us-ascii?Q?AfbG4gP19OV+bYBvbsvFwyMK85jg+xhMBJOEuGr9j3BheebSlZTHjoO4ZDTC?=
 =?us-ascii?Q?u0Qe9veZ5soaA7wxwpB5Y/tfgsp3bImop3hRTROUpQzlg/Ii7IFIrvsfD55r?=
 =?us-ascii?Q?vNNQ4X1U/0GuEMKAuSwGjJORaIc1ofk0ldBnRMB1F6xKTO/yEYSyuTlAgOTG?=
 =?us-ascii?Q?q/usdxseZ3+Dk/jazfbVl8A+5BGmf1qcN0TV+kckJpwJOUNmbW1tKEW9sVKb?=
 =?us-ascii?Q?Q4kH65a3IAoOt9pCVvp7KZdMk5lPlg8RwuHEySH8hUQkDM0E6VP6lRXsFZer?=
 =?us-ascii?Q?Qu8QIw/h8PnqssADB5VDQedw1cWVGddbaXvyQqjzyAZLq4aXjcZi4GUU0znp?=
 =?us-ascii?Q?dkWE8i9fwA8Zpc04q77HGE8phtzjpfWaKeo/Xfneck+r/9MHHhQNOBNj4sRV?=
 =?us-ascii?Q?/w1UpPlSMtSdozhgjP4A2E3EpuIqB7WZO3x+7CkaNw0czVuzd27yryAKiGCr?=
 =?us-ascii?Q?ogSjICa0hzXxgB5Ash/8HcwAzKws58M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a675495-a21c-4104-b756-08de453bcbca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:45.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFfmRqzGH5/5Dd79bdnixKmSdI5ViunK/xODuk+gPJk6/VORfWDRD7q/LePlaJuTDAfSDYnJv+VXskDUU0fg5EMudy274bBvBfEezNJj/ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX1IUUKw6+qjpT
 +2HZN6Fc/widiiEBZoF/hZAmVop3Gk3AxERc+8/n6SOlu45Sgf0e3PqM9TOUOWcZR+naDswEqJK
 AFoXBTIaoWDqxAqN+SZpTqQN1g/aRGzzIMTzaYEYdVustfmeQcmMzsWh4DZRhufnpkpA70deekz
 8aIow4X5hbDhuq5Z3L0pH1MmIEnzBfJ7u7SkUOFWyWvoUbzGiN58VwR9+/S2Kc1RNDWeis36jI2
 90UqmAGcmwLfOKitmKPqFLVsqaJE/3ECwGLKB8bwCDvyvHzqtDiXOHT+YfftO0GWP/SPZ3PkeHH
 2lS33vuY0h+NX1NCIKqAXmGGpPaEfsw+QXi6/SAA4yLeC69S9PBCy+vHRWwFiDCl698WERHX8U7
 ugm4PsfmEaYigBB0Zwu7kWy6qxD24K4z05CR7p5rpUQsvNhNt54dSFYaV4rpDQHpCUO5CfhtMGK
 ZRsjcdW26MTnp8QZcXg==
X-Proofpoint-GUID: j5_aQPMPoQ5I3ohXzoxYBj_Sb7cyiaCj
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc41b cx=c_pps
 a=NYwhZoOBzU3e7w62/nBhxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=55ZEtGYZoXhfP4VNr9YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: C76G2iaV3hoAmBTkQDHOmit8UiUk4t3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228562

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after  enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index dda235d4d0..c3e1137200 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 KMETA_CONFIG_FEATURES ?= ""
 
+RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


