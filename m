Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0457CD29C2A
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 13:15:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34878.1768828549255869028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 05:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DIylj3fN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5479ea25d4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBwZmX1882174
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 05:15:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BzqH/31nGrEypMMCT6sCad4bodVLH20UKWGNA3rVZvw=; b=
	DIylj3fNSipSEyUJbOTbU4nsP4UFLyFlvnssNVSQmHFIG5JFGN5+BFXwg5LKtD3o
	sQlcdXCEuKby2VWbLI0GFlTWcaguPUc0H5OQ/XfYoLLDHUqN0JqxVA30V8ayMKxY
	7XOBqFhIrgt40HuPtuR32z+zuAjGCDyOXCqtFBxjgOvAInWmovjIBorBkTlGYyaI
	Fb7fDBdBvGqPMIthFDTUq2dhIcOU+VnAAKxQF7lKf9YF9BJNpgg0uuT8dkN1DZrE
	mmUMuNHM8zKlESndzj4WFtHmf85DUzn153H33Etxc6jnROkjjjNJk+He/kPZGL5C
	q8ceWSpC1bLC+LlrrWnbww==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgsg7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 05:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vP4Ye7hP1PSAukn2j5qdxIFzjr3MnMK88XvE/he71KHtwRc9ZsprpsoKAIH5iPpCEhsljGcrpmJu1+PVJl5PARQA504CT6sNPFHUaJKSJ6rYL9zJEuMpFvnK+9ZA4e4MC/DduZ2rD9xDmp9YLbUPtyYVNYusNlxgfBEPsq9M+6tQdwtJJg9zs1BDXSWVav6y4EE3HYSLnMC4aDAmZxidbjhkLXuJngctQnqDynwMReYX6wSqutz1C1i3ppwJQ9PAyQtxTDBqJb4GObTnR1RXw/0g1It/eUS/w6PGa5fFHXPvrcf4E995WnuoRtw0qMfhWR1xvx3mQ2pFaGcYwbGugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzqH/31nGrEypMMCT6sCad4bodVLH20UKWGNA3rVZvw=;
 b=pX/JoERzc3t+7TvuP0niWlRG3xd3h8ixQFWCob+c3JF09qYI8FtmB2MgXLAwg2vMP8tjr+N5yi204DGKn3Ya5F79c3bADYFUP+Ln9at1DlefjZKPLOWNC2s0BfJCHWLPasCzAZar23xabrE4J+7yaTZoclxtjKh6Gfk+xM82HubWmWWDvGr7aqtVcu3VRExqm5GCYWStbZixsK9SP+Id4JYPqGiac1x+sFNqoL3bAsuxXWzgBNuiWpSxSXM7SAnpJs6yxH92vUgiPmU4sn2dZB6FjbXlgPi+L1qXnsSS5NNJAKC8rJBgTb5Fuf3d405WMOZebN1wGFaRPRAYlbvRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 13:15:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 13:15:44 +0000
Message-ID: <4a276d8b-aedc-4925-8246-a5b09a0a8b59@windriver.com>
Date: Mon, 19 Jan 2026 21:15:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2 v2] blueprint-compiler: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>, antonin.godard@bootlin.com
Cc: openembedded-core@lists.openembedded.org, liuyd.fnst@fujitsu.com
References: <20260116090121.2432867-1-yi.zhao@windriver.com>
 <DFSFM1N0VE78.3VSI0XQ6PSXXJ@bootlin.com>
 <CANNYZj_bBj+btrm79ZJ9wsdCFSX-8K_ns8hhz5D3jz9YRLv0uQ@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj_bBj+btrm79ZJ9wsdCFSX-8K_ns8hhz5D3jz9YRLv0uQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f840675-849d-4db2-f0ae-08de575cda5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3RsRitJaXZEQXZmODFSZHJVd3J5VXRiOGg1ei81MTVCalROaTJ0MERBNEVS?=
 =?utf-8?B?NktPZGo5OW9hODd2RFhiSGVzUGJzUWJtTGorSUN4NmNTRW9sbGwwNFZmWkZ3?=
 =?utf-8?B?VDcxQ2JHMXp3RmpmQ2xsK3BwWmc3cDhnUXE5UHVhdCtORFVEcnpRbGlsWGI4?=
 =?utf-8?B?eTI5VXNQdzUrNHBsU1AwdjlFM1FiN3grdkhzeEh4ZGNDTlVrUXlyUkZPb3Vh?=
 =?utf-8?B?ckZLcGRyRCtoekN2MlRFYlAxQ0diSm10OGk4WDFoUzN3dXUrMHdBcVBjbTRM?=
 =?utf-8?B?Z3VLT3BkQ0d1dVFyU0QyV2FHUk1ZOWZVazdwVFI1L1dUZXB4bGY1SGNVYWlt?=
 =?utf-8?B?bjYwTlRodHU2V0xUcVYzenVScmxRUFJxZVkvdDBxTzR3UlRyUXBkWmhVSXhU?=
 =?utf-8?B?dE1QaHExY1VYNys0MndOaXhLWkJwTTNBTDJFNkpZNWtFcE01S0dEbHNtZlVV?=
 =?utf-8?B?cmFGVktGMDVEcFBoT1pMcnlncHhaNnZFd0kxa2pFYi84aHFrKzh6cnRhYlFC?=
 =?utf-8?B?TjRKMENkbjJzV1gvRm1iN3BMa29SSlN0SnliSWx1eDJwUys4c0MxLzJOSkh4?=
 =?utf-8?B?cHdLNURCbG9iVHdoMERTb1VXL203TmdiZzk5OEl4bXRWTmtpTEpKTHdabCth?=
 =?utf-8?B?RTg0dDhzYlZIVzRESE5aaitWc0QvQmZKL0I0WHFXNkhXTFUwUjNXanM1ZzYz?=
 =?utf-8?B?S1psQTh4QzVXMitHY2Z6czFEMXk3b2lQaEtrSlVqcHhPb1FmSlgzbGhWUkxl?=
 =?utf-8?B?ME9UQ2tOblIwRTlQUTlac3JBTjF5NUNxNVN6bUZDNUt3RWxhdElFU1JQQWQx?=
 =?utf-8?B?b3FIZWNNckN2V3NNd1VyUWo4QVdSd0tCNHNhK3lXY0lBZmhGQUdFNHg2ditG?=
 =?utf-8?B?THhWa0owOFBGRkppZ2NFTVpBMThLN2tMdHczWFN4c1ZjeHpGNi80MWxtd25L?=
 =?utf-8?B?em41bWozQkorMEVpeXpCQWFqOEZkZXREMW5vQklnNXo5b1ZWVzBzaGZjL3dO?=
 =?utf-8?B?T01vREpWWlJmZXovTVVQaTBsblRrNCtKZDQvS0Rya3RzSlNqeER6L09iM05s?=
 =?utf-8?B?QkQ4SnB0K0xiNHZLRWZFeTBVTnpOa0JKYkJjZTlra3NoUVdnZE1SZG9xallj?=
 =?utf-8?B?YXNtbmlNS3ZDMUZ1Nk1mN09UckQ0aS91bE1UNzVUa282YTVOR2hqck5hdjE0?=
 =?utf-8?B?Z2grNGJkck1IazcwU3pPcVJRMHlaeUloU0toR2JrOExuOFVoRk5CcFlSV2Ez?=
 =?utf-8?B?TGlyWFFjQUNqTy9tTEhBVnp4SWVhcGV4M0xJTVBHSXRFRVhaZm1xLzBJR1Zk?=
 =?utf-8?B?NlZUdGFkdkdEN0I2M3ZFMExjK2R4RjB5VFp3K2IwSWE1c3k3Nk12Tk1HY3hi?=
 =?utf-8?B?VWYxM2lXdTFhakp0MXIrS0dFZjhZUGVTTVU5NEd6OHEzME82dzF0aGQ3N3h1?=
 =?utf-8?B?STV1cGtyeWxWOWMrb1ZuMmZVdFN5WXR0MDkyWURiRXlyTko1d2QzTWVqRmFD?=
 =?utf-8?B?QXJVWmxHWStsUTF6aVhvWWxMbHB4cytMSGkxNmdFQ2VlalBCNnpHcFExbTk4?=
 =?utf-8?B?SURkZWVXa0JlNktQUnY5aW1yRTBQa1IxWUVRR2lFeWVBeHF5ZjdtRTRVa3Vh?=
 =?utf-8?B?OTRaaGdaZDZ1RHRaYlV3MEJQZ1JkRmx3aGE0enlMNUVNVk8zVzhCdER1THdS?=
 =?utf-8?B?cGx3aFYzUDVGMjNoQ29DVmpVbjVWRkwvVnFDMzNzdUVOZnFPcnJzaDcyeE5o?=
 =?utf-8?B?YlFDeWg0WkE1Z01IalFSQjF1YlpsekgzTG1tTWQyZ3dMMURLNUF2V2xJMnVk?=
 =?utf-8?B?YjQ4NUNSSzErRVJ0aFBDRkkxeVhpZ2tXaGdRNW5jVnQ0WUVSdlRXeFp1VHJH?=
 =?utf-8?B?UUpvN2FrMXBuV2Z1cmhScmk5Q2RaM1BCUjJNcWl2UWxtblRZYkpKc3JSaVRa?=
 =?utf-8?B?U3FrUWYwL2Z4eHhQNzB0azlXM2pvbUxGQ3pWKzZPT3RieDB4ekhZQlVoL2FL?=
 =?utf-8?B?bFJxTTRQWDQ1UUtJNkJuc05yVzFsYXFRbXpnVy9QcFNTTlRUcVJSME00eldE?=
 =?utf-8?Q?OWG7u1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkhKSkZYVnY5VlB5OCtIaytBcGVhYjVHWS91OVdNdzRMb2pTbHczRXpUdmpj?=
 =?utf-8?B?TmVCb1JnQ1hxUFFIMkhJaE5aVWQ0Mi9LbGE3ZUpic3djbzRzSncxcjMyWGpG?=
 =?utf-8?B?UDE0SitnRWs4RDRHN1N5REF6WjhySndRZXNPV1VJSXVxRUFPNzQ1QlQwckp4?=
 =?utf-8?B?UFJGeDN4SWhESUtKUjhrcWg4SlVZcVVZVjkyeWZ5RHhoK3c3ajZxOFFvdkRK?=
 =?utf-8?B?MEVxaFNnR2NhQmp2KzNwTVlNQkRiY2RiYWtYdS82Mis1SFlEbkl0dU1aWVEv?=
 =?utf-8?B?aXZSVlJ6TzlqV1I3c3YxWmtrVERvU1o1RytldHJaek9LdXNjaXpmcWNhRmdU?=
 =?utf-8?B?WndSMTZHeGcvUnB3bnh3L2V6ZmQzVVpWemVoQjFsSnJOcklqNUVSR1l5R25u?=
 =?utf-8?B?WnVtRStnQzVnWG12L0VPeWxQMUl6ZlVvVFRLZE9DeG56Y0tzbkxTK09vWnF0?=
 =?utf-8?B?VExBZ0EwVDRzclNudWRaeUlkaGpHUlJYY3ZTWEtseVJ5VEhyYUQ3c1ZsMXdI?=
 =?utf-8?B?RERsdTNjZkxJN3VrQzVlTWtjeTFibHl5UEtOTjhEN051Q0U1REQxSzBlRS9x?=
 =?utf-8?B?aTJLai9JUVFZbkFVMjJhcGt0V3krVXp3aENqMTlnK0srT1RjMGVXajZBZFdP?=
 =?utf-8?B?eXgyYkwyNWM5Z0wwMlkyMmFMVlQxdFU1MFU0MmhVOVUvVWp3YjMxR2o2Qmhr?=
 =?utf-8?B?NitwOWVic3FjUWZPeG9vc01HeVJqeU9CUDhheWZjM1VtbnhOMEtUNjJVN2tO?=
 =?utf-8?B?TDBVclI4UlErbkI0VGtwN1o2eUxVb0lYSG43ZHdPZGo4VTBWRUZTNDhUaUtZ?=
 =?utf-8?B?Y2UydmJtd1d5TnFuOG1za0xRZ0N6eElmU2xjcExZV3hpaXVNNmFZOUo1cmxU?=
 =?utf-8?B?dHhGdmNnQjExN3N1NHNNbW52T0U0K3FYeXlscWliMmNiZXQyZ3JQZGdsQUl5?=
 =?utf-8?B?SFdMQUVhR2x0aVA1aDU4TDdUNnMzS0k4endmSVFoc1VKWjdIbkFELzlhaFlm?=
 =?utf-8?B?QjVPVkRBRU1sWUlvTlV0eXYva21uVHBJZlk5SGpQa2V1MXBuZFJMMksxU2Zx?=
 =?utf-8?B?bnVKL3gzMmRMZk9JYUpzOGRRTWFybGYvbjRlV3BGRTc4NTllb1V2NzhIYXY5?=
 =?utf-8?B?VFhGZWRmS1c3TWltWHk5WjZkVDdDN0JRY0l2K2JEbzUvaUlpcVpwNUkzVitV?=
 =?utf-8?B?N0ZjT2U5K1kzN0QrYmpuVTlUNFFKOGxjTXRWNnBmNVFKakRxOW9rS3BEbzNM?=
 =?utf-8?B?U2xnUWt1VWd3bHFxS05hakJZNTZCNWpQWVFUVnhZMVF2ZGpYbUlLS1pmcUFz?=
 =?utf-8?B?TzMzZkhQMFE2U3I0VHgxM0xsM3BZV0ZhUCtuVGU1RVRqUmVwdEpxcDZlcGZQ?=
 =?utf-8?B?YWZ0TE9QdDRHWHRHbVhTamRDbGszaUx4OFk2am5rbWo4YzZoZk9mU09aakdo?=
 =?utf-8?B?ajc3WlBBNzNyWEppRlFWd1lxU3hWL3FHMUNteURYeDFicWpKditNNS9TaFJw?=
 =?utf-8?B?YU0wK1kxNXV3bWcxWWprVmQzemh3RmEwSjNOZUhpczIycFlPbHNKUW9ydTRL?=
 =?utf-8?B?REdRNWdRZkV2c1pnMkJ2RUFVMUxiakY3eHRGQmJqSUViSGpjRnJXODdPQWRv?=
 =?utf-8?B?MFBiblo5aEtNNHdHRzl5a1B4eWF4d2tiL2VYNFVJTmEyei9ZNDd4Mkw2V3BJ?=
 =?utf-8?B?Q0NXeTQ1Rk5GUFNoUlBvUlFRTUNGYlBLeUVzMnR5OVlPMTlJUmphWVA1Ykty?=
 =?utf-8?B?WUdjMzhlZTNvUGFNUjFZamlnQzNNa3oyMkp4QWdFSFZZTzZtUnVzWllvRGRO?=
 =?utf-8?B?THg3Ky9xekVsWVQrbW5jcEdVNG1ieUhZbWoyODEwUmZjMEl3T202WGpXaWVm?=
 =?utf-8?B?YUpLNCt3eGtTTEpFUnhqR0RLQXpxNGYwRjhvdVlNTFlHZm5MbjVkd2pRK3Bh?=
 =?utf-8?B?Vnl5TDdMUlhCWWY3UlJyV2NxK1BsdnZpenBUVCtlU2JCNGZTMDNwcHB2dTVE?=
 =?utf-8?B?NmxqM3YyTC9CZERHQTkrN3FuL0ZSY0NZb0RDWlBJNnVpVkJlY0FEeStOK3JF?=
 =?utf-8?B?eitMTE9ndUt4L0dVUTVhdGhoUmRSZkljUnBySGFuQUdnSk1hZGhEWm9xeEtT?=
 =?utf-8?B?NUJhVzVpS3JFbG5ORVdqcm1EendjZlBPTzdIbGJ1YTQxeHV2N043TWFScTY2?=
 =?utf-8?B?aEtxbmx1S0RvZWM1TEFUdWRJb2pub2dXM3d0aVhaODU3Y1VtTkhBWU9hYlJx?=
 =?utf-8?B?ZXVWeWV1a0hWQktQbUZ2SytDQ3pTYUQvcXlmL1Y0RmZEaW0wN3NTZDVKRTJH?=
 =?utf-8?B?Ni94ckJyTGxoYzBHLzRpa1JwRWo2Skt1b2N0NmVrbCttTGpPWlJHdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f840675-849d-4db2-f0ae-08de575cda5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:15:44.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLk+f7Ch5ArOzKIVWFvm74RUsRAIbDSDBp1kPaE2+tVG1PrRcikVqr7zrsNNyiA3iTg/qrloOxEyOybTruu4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: l8evvjnLmoNA76j-U9IsdO2yRZ8HoEM4
X-Proofpoint-ORIG-GUID: 8kfSs0YMW7NXqf8TW17usUmQz5yOkluG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExMCBTYWx0ZWRfX/88w2gZIt02f
 eN//pzUsGV++pRMr+fXtcS8wmwI8HUuE0Nw5uwfdhn7/8ljD9J7tDA6LfC48eNU1yEL1dOoMf1c
 yuhrbIVstYN90Iq9+MKkznJe0E6ML5E5CXV/LKToFUxpL06WWm55eiDxk6Wg8mcm+coskUfazpJ
 aZy2BqWs8Vl+nPP4wY2H3/6yDEwQXcGSe9dLY/QFICVbjf4pe431N4+kVeL3aoIzgquxU8eMcWY
 nhdfE7Kpr/Q0EFdSyjQuiiBJ+aE6J6aTbmDLkb3xmur+Q9I6/xrKAACh4BN87rdsCa/Kvd9WUnO
 i+o+HDXEu8xRWQR4VyKCebJo+kAzKwAVpBH/uXvzD+yWw5PnrsEqi0YcNMNoVEZTdDCTR6R1103
 EQ7M99CiDJmPPHRdn7xxyRnmeyutSt8R7tpugIBN9Z/4N73WflWi7Rs7L6olXVcmKiqV1uUuL/m
 c5bcqNB+67unojaBW5Q==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696e2e84 cx=c_pps
 a=oox2QBUX2gBgMMQWkhdftA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=gloewRd824vcKyTCJfwA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 13:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229619


On 1/19/26 20:56, Alexander Kanavin wrote:
> On Mon, 19 Jan 2026 at 09:44, Antonin Godard via
> lists.openembedded.org
> <antonin.godard=bootlin.com@lists.openembedded.org> wrote:
>> This failed to build:
>>
>> ERROR: blueprint-compiler-0.18.0-r0 do_package: QA Issue: blueprint-compiler: Files/directories were installed but not shipped in any package:
>>    /usr/lib
>>    /usr/lib/python3.14
>>    /usr/lib/python3.14/site-packages
>>    /usr/lib/python3.14/site-packages/blueprintcompiler
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/formatter.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/decompiler.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/interactive_port.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/__init__.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/errors.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/gir.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/main.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/ast_utils.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/utils.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/reference_docs.json
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/completions_utils.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/parse_tree.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/tokenizer.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/typelib.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/lsp_utils.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/parser.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/completions.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/xml_reader.py
>>    /usr/lib/python3.14/site-packages/blueprintcompiler/lsp.py
>>
>> Log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4986196/raw_inline
>> Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2884
>>
>> It only seemed to happen with the qemux86-64 builds.
>>
>> Can you have a look?
> I suspect the issue is in multilib setups, e.g. upstream is hardcoding
> '/usr/lib/' prefix instead of $libdir.


Yes, I think so too. I'll take a look.


//Yi


>
> Alex

