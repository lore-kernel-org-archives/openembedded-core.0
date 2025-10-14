Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D117CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:15:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17716.1760451299812938141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Fg10hOvF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23821c83a4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E6iptN2161760
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:14:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NLVyFB6SxLZxjb93h4OYslwYMNsd1avc6zdrceG0++I=; b=
	Fg10hOvFwDkm2Y+LxhNwEoFGFRycDfGPGSaetAVuszqfSEnc2IC4J1a96vDYZvrZ
	MFQM2K4/LwaBScwj8pltS/Y/hVEkxgu9P97XfavyzhbHwmo8FPnWzh+nZ6ahzmbx
	JJpxl9iYQwl8dCJnLUnCg0tN7vWFRviEiL3AHK8rDKrXM3p+3ICQ57b8bwb2Zoxs
	ELRkhMxQrtU5tAwimiHLt8tHVM3L+9iDLJMO6q4W0kzAkxBIaLGKidru3sjseS2O
	//1zCvJ9dfcNDByVlp4DqKIkkWi6ua1k5fQHkojHJNzh28nnsOXG05tMVPKscDAo
	9bkAt1Sdcm55zxdvMP09uQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdtwn4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 07:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlqF7KMzTmUNElm8P0U49RtKZ44ckwT1aAUBujJ2Oh09Q5sAxKAMVZAuTqlb6HWKotaxUuSYhTzlpZJJWaDu+m39vD5dsQX4uaPqgSCnZhfR6+48RcB0zS48B1VaoQ74XpGwbZrm2MD/UVmWa1T5JTMyeK5+V+IU8RtRkI7EjArRDrEquaSnUtaqybu79P8niADZlGgUlJKMtQ2JMSrILtvciuHaxSDTmwZ4j8cMQ7ZLtJq4CyR4dY8CgUUAzxoMcKfWOm2hpzOAkKAn/8/ZHcgAhogxJJ1fSCiQ68Y4k7Em309bBOMpyxaWpcHQ0rhfB9VsM4EB8l7Kwtsx7s4EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLVyFB6SxLZxjb93h4OYslwYMNsd1avc6zdrceG0++I=;
 b=I4XmPFhFO2FSMXN3Qj/Ow8hYa+tFCjpfndM58xAvPnEJKZm6RJUAr5pXYVWed7Lir2k+DSIqgIMG2U44C2LqafJiyrMM3GoR52G/8czUMgcgXlar1vQptsaA2w1hVIiURpapUNIiZMXy9PNRWr0EGKVE5dzFNIrG6rYsYcpszgiFuP1Ss3fo+e/pDX6KHvisBz9vu5i4ZzO+DZxebPJpakaSyOs/pwBW+Lfc5RvGqcx4Dg3yDlKd2oeb7B3ObfEXL6qI3+E/IzekO74pI2/bEM3wEmW0iE1icxjERz759mvWCNNu9Mms/p+TCgqwasdphzLZdcZCkcPW4+XUH/4ryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Tue, 14 Oct 2025 14:14:56 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:14:56 +0000
Message-ID: <d34dff4b-bb0d-40b6-ab19-dffea7f575c9@windriver.com>
Date: Tue, 14 Oct 2025 19:44:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 1/2] rust: Use llvm instead of rust-llvm
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
References: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
 <512B27D3-F57A-40D3-84D9-30E529FE631D@arm.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <512B27D3-F57A-40D3-84D9-30E529FE631D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a8ade9-5957-42e0-a2af-08de0b2c0cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHNKMG9aOWdUbURuSDRXUUhFOTg1TkVSYnBJc3JhUmd3VmRlRWNDTFZHeEhT?=
 =?utf-8?B?cEd4NENWcVNWMDF4M2pocFU0OGFlMm5lNnVCa2NUTE1McW1YVG1hOVpKa2E5?=
 =?utf-8?B?Q3N4Y1hGYjNQTS92citLNE1xS25WbmNuSE9SRDVMS0VUYy90SzZSaW1kaUc2?=
 =?utf-8?B?MG1sd0JqMlpXdHE4OG5IVGNwSi9hK2hHRGxjZzhCZmduREEwdlorci9qWk4w?=
 =?utf-8?B?cXJKS3IzMUR4L2p4bUZhOVo3OW02bzloZXV5Yy9LanF1c25rUzFxVEdSZG55?=
 =?utf-8?B?ZXYwUDk0b1R2WE1nRy93WmJwbXFRR0dzREMzMDdJbnN3bHliMlp6bU1jTGo3?=
 =?utf-8?B?dzR6M2NQblZCcmtzbGRpLzBmZnI1WkVzK1E0NmRZUjllblpvQkcrcGZtcDhY?=
 =?utf-8?B?blBrcWVTdkVmeGZQSmZoYW9zTDY3a3lzYXVVek9mSjRWK1FDSy85bTNaWi8v?=
 =?utf-8?B?ZEdyTHBIS0paK2hIdjJiNElzUDlyVmtaUlFoSW43dDAxZ1lNSmNZYTE2UlBj?=
 =?utf-8?B?VDU0b29vSWM1T0lPbTdiaTRXT2s2eTFud1ZDRGUyZitVbjZvVUEzMEF5MXI5?=
 =?utf-8?B?NmFocDFuemJVV09nV3dRalloZlg0b1Z5aGtYajZ5c1llbjVXZlJkVGxldWN6?=
 =?utf-8?B?NkduSHNWdFJGRm9NOW9uMWdJbVRsUVZnYnUrY241L0c5bVA5c1FLZW93YTVW?=
 =?utf-8?B?TE9YSmhxc1lkcDV1Y2NOZTNUSUpWQjl3QTF3NnJMWWhlak4wSDBDV1ZmUk5s?=
 =?utf-8?B?TTZPeXE3RncwdmJwdElPTk1DTEVtWHYwVEtSYm1vUnFDYVoxRzFoUFNFVjBq?=
 =?utf-8?B?TFF1S2xZaGFvdXlZb2EvMGhORWxQaFdSdnZCdzFDWFhiRVpWb1FIdUo4ZGEw?=
 =?utf-8?B?Q0F3OHBreGhYMy91YVZxcmZqRUtNRGdBb0NqTVVnaTlFTU5xdEZqYXdZVGF2?=
 =?utf-8?B?OHM4WUJpWkt2Nk9paElTekEvQllHS09zN2w1UFZHdjFITHZvS2I4K21PNGJJ?=
 =?utf-8?B?alkwRk1rcTJVZEt3NEtwYUZxK0F1RUZLeC9MemE1VExoNjNwNnVBN1h2MHA0?=
 =?utf-8?B?REtNRHNDa3Z0WEMxZUVPT3IyS0MxNEZ4RjZ1ZkI0Ni9SUHNMZFpEbXpHWUQ0?=
 =?utf-8?B?S1FSb0M4SERHcFVxdW9OSDhITEgrZHVRTFZ3Vkw3dlZWdTdmSU9vc1pjODRp?=
 =?utf-8?B?ZUZuM0ovbWpIOWJmdk95dHFMTG4wNXppYllhS2F4SUljK2ZYcEpQOW1FanVo?=
 =?utf-8?B?ZVdyOVdDcmdPbnB5QnE5V091ZXRjOUE2MEZxUWxBNEo4MHFGcm5aS3loZ2hq?=
 =?utf-8?B?cWc0LzRYVlVkMGwzNTZyVmRXR29ZVHFwR05oR0lCcVkrVVRveHY4aVpFb0tB?=
 =?utf-8?B?bzhGaDJWbS9leFhvTC9iWlFkSjVoaGkxREs5TXgrZHVtcVVvT0NtL2RmUWZi?=
 =?utf-8?B?d05vbzE2OHdxU1JiaGh5MU5Hb3k1d0FKU283Q3VYWUs2WTFpam95SWFkVDlw?=
 =?utf-8?B?MmtEWDBSVXN4dGFJN1hpczJlMlNzL3ZGUWxMQTgzdXRwRmtDMFBwY2s1Rkwx?=
 =?utf-8?B?bGE4cWtLWUxMOEFFV1N0ekdWVWlKb1RWOHJBa3p3OTNUUlVUK0F6TUJxOVZT?=
 =?utf-8?B?VGpWYk41Rnc1c21GZ2RWVENTUzIwSUxhNHR5OEpGRlpsWG81Sk5KQ3lzUVZ2?=
 =?utf-8?B?QUszbzVybHhkd09JK01Hb05MdFdXUGpHUlVUUkhuZHZYOUtjTXZKMnN6V3or?=
 =?utf-8?B?TGYxMjM2dUZsMk1Mc1hnVFlnUkRBekNZRTdMeWh0ajlTSDdCM25UUVZlMHZ4?=
 =?utf-8?B?bWxYMkJzNHQvamY3dWJqWnpsc0VlMnRHWVc0Vk5CcXB4VStFMis1M1I4bjZD?=
 =?utf-8?B?OFA2Tjh4Z3ViZ3RHNGxnRmdUOFExNU8xR0RSUjVYSVZxZU9COXd4cVJPb1NN?=
 =?utf-8?Q?nggh52+BGkuMPP8fby1AjjpOQgcbXSIY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlR2OU9hUm9hYm03Y1NtYi9mM2w1dUxBSUdndTVSbDlzc0tYMURWSDMydlB5?=
 =?utf-8?B?cEgrNVVvM3FTQkp5MG41QmVmM2lxRkZKVmZ6Z2VEMXFyZVowMlhJbzRaaHVw?=
 =?utf-8?B?QURFVmVVS3NucldvSE9OdmFNM2FpZU5sZTVPUTA4ZzBMNFcvdGlrdDBCeC95?=
 =?utf-8?B?bzEwUTlRS2h5TWszZmdYMERBRFJINnNSRy9JaFQwcG5BZm9jSDhjQ0ZSQW5o?=
 =?utf-8?B?NFRRM2FOR1llZlgraFpLd1ZFakx0VE9jSHQwN240RFhRSGMxOUZjN2tPTHVt?=
 =?utf-8?B?VnZ6NkVYTmxyMDB5cW95c2lnR0hHR1BLZWtkVkc3V1pvOUkrcmFFWnNnUkwx?=
 =?utf-8?B?a2lVekNQSkh3ZzdVSzQ5emk2WjZjQStWYjU0RkNrdW54LzlVWERJbElaZ3Vz?=
 =?utf-8?B?WmdDT0I4clVsS2x1cmtCdkQ5aXlyQW9heUorUGQwUnI0aHp6Y1hkaHZPaWRN?=
 =?utf-8?B?djZqU3dJTi9oSHV1S1ArQVV4a04yV3JtdlBxNjVVRDQxbGhLYzQrQ2VReFJN?=
 =?utf-8?B?OEtTcUxxMk04eXR6QmkrUzc5RG8vRHhJZFplbVhPQUZWMlpGcE8wNW55UHVh?=
 =?utf-8?B?OFRzTHV1ckF0RTBxa1VzT2JBMnhqM2Ztb1JMczVNcW5pZkdvZVgxNEc4NEtj?=
 =?utf-8?B?dWtMSWhDMGZLeUJNRlZIc2lsWTVoSGpJalAzVjBEWU9mMlREZTVkczZuY1Jp?=
 =?utf-8?B?cDRITlZQSWQ5MjUwWDlqa2NFWDFLdTI0VytZQkhUTFZ2bjg2SFF5YXVzUG54?=
 =?utf-8?B?RGhOZEdiYWR2OEVWNHN5Um1RbFd3U1pxQ2IzbytEY2tJS3pvWkg4Ukw1N1Ev?=
 =?utf-8?B?QThzbGxhV1hzcnJqa3FrSGg5VFM3VFkvU2pjMFlBSDNkVTNDRDZOblpvUlBL?=
 =?utf-8?B?ZHNmelVvMzREbGk4NmFZRnBJOU15cjg5UmZFaS9md25JWk5iNERkUFNIWkpo?=
 =?utf-8?B?Qlp4dU90SnYramlnbTM2SGZSL3VmSmx5aUcra3B4c2xUaGRuNGNka1lWQ1d1?=
 =?utf-8?B?QzZoaWRQQUJPVER0ZEMwNUppeVJaVGxFU3BWTHhvZkN5dzZRdXQvNGxkYTlr?=
 =?utf-8?B?MUhmaTB6cGxoWDdITFE1VXBSaHcvWmRSZ09BaVJHeHpaSC9xZVErVWtkRjJn?=
 =?utf-8?B?YmFrMW1tVk5zdWxtRjNyZXBJYjFmNVV3SDhhZ1BwcmhLYzBBQk1UWDVHcGkx?=
 =?utf-8?B?ZU5ZQVpYdU9XdEdBUnQxcWdBNU11L25ETmtSbG84K2o4VmhhaFpua0F4bDhS?=
 =?utf-8?B?WWpxSGh5alcyaDEzZ2ljM0hXUlhmTWRMYTNCUmJWM2tlajRlNDhraENpTU95?=
 =?utf-8?B?RVhVNmd0eVpBUDcwUzllVld2d2Fhb1dDSCs1cXhLdFFYMGJLUjQ2WDExMnd4?=
 =?utf-8?B?R1ozS1dieE1kbHFvVmxjbzhDeFVERnpwc0FsQ1V6T3cvNnYzU3hMMHRSaTdE?=
 =?utf-8?B?M3BRaHAwalFST0J0clk5VUd5QnIxdDlhSDI4dDZZVGtlcktNcEI0NkpZanVK?=
 =?utf-8?B?S3hqU0RCME5qcXJhaGtIeFpURDhOYzlidE1WWTVGRUd1NkRSeWJNMDY4Zis2?=
 =?utf-8?B?ZkxuMDZhVXE1V1daakV5RVV4VVoxYkhCeE9YdXd3NUxiR3k3ZGZYbTRNdFJm?=
 =?utf-8?B?OERvTmJzb3AzZnpnMmlsdG9taGtFZXFsMWFySXcvUVFSaWRHT2kxMkUxb0tM?=
 =?utf-8?B?ZDNoV0p4eXJBa3VNRUpCMWxPZVVqOHoraDJFZE5rYlM3OUo5SE84WUxMYkZ2?=
 =?utf-8?B?eWhWWlhXWjNnbjMwVkJibVdYeTRhRytjcm80azF1MENLSVZUMERIdzVJbEkz?=
 =?utf-8?B?UkdYckh1NjR2Q2hVNWYyREt2Z3IyTDBTekpyY1JKUUYzaVhVMnFQaFErUFlo?=
 =?utf-8?B?MmJuTktqQ1YxUGlNVU5UeWRzYXc5UHFNUWN6MmFtMVp5TDFiSkd2U0h5YWxD?=
 =?utf-8?B?NEFsSThPc2FiamhzOGh5T0JYUXlHMVVpc1MzSVpNSzV2dFovL1p2UU95ZlJM?=
 =?utf-8?B?anZmOCtrelB3V3I2OFE4NlppTVV2Mmx4bUdQRCtvYTNoeGN3eEcxYndNejc1?=
 =?utf-8?B?VXQwOEg4ekRmZzhTQjRjdFNyb1BTNG1aMGkwdmVzU1pIeFJPUzlndFNDckgz?=
 =?utf-8?B?U1R3SGNSczhsSDlsSStqcjg1TmNEeDJnYWhYZGYzNDVIbWp0SVBTWTkyWGI4?=
 =?utf-8?Q?+sXRejuxp5V2sL2NxN61uLE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a8ade9-5957-42e0-a2af-08de0b2c0cd1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:14:56.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/Etr5NoZARLYOTlyRhJaXuKtKs+geGuyObaoDNnPCnZTneB2sybuFaGx0yQchsh7SnJYtlk2Wjd+1baEcDjtWC4F3wNiszfHD/cqyGkY5Pm/+Qe/mO2/XREI8fQ9zlm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEwOCBTYWx0ZWRfX8efpjEe4LcP6
 7gqKY0NrrW9FzNgDpmTTY4a3ZelwGJ5agbws30cU+p8EOkm/07eN/Hnv4fL10GQY4QlhinqnYo/
 aOvUwGOvVojXhYpB0vE01RXmoBJ5hy5GXkLU9QNX8b8t9xP3ptMGZUDTDvoEIrRQhaK/GzAaLdh
 pMHL5QK/UdiwbLg9D+FUly3B9t30mM0Vs1f2qodLt6RSxLg2INrDTytc899gYAQG0IAHBydkZhV
 EWcPwC7xcg5g52YAUBZvuF7Ka6+gK4Hbpo6AilWuFeWCvNhPmKSTKwe1pyKsvQFlQBRt6hI2yNo
 /XGpLQ849W7oG4yWXaujiNV7eH1b21LMJG3VaEZLe9gga7znGSDxOofoGGcSYYo53oz/SBHZexe
 FTo1Ib0lrGn5qiclPXLb22948TbgVg==
X-Proofpoint-GUID: jkW7Kj8bXgDRBAdynq1Qqr9jNiJIBC7z
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee5ae3 cx=c_pps
 a=+iTzTTZpyf9i2pLb45wEOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=Xry2Hi-Vp82h5FH10-8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: qCqhYKMa5ZjvJc-UN_psQkUvvn6Al4rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140108
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59E6iptN2161760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224819


On 13-10-2025 18:40, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi Deepesh,
>
> On 10 Oct 2025, at 15:47, Varatharajan, Deepesh via lists.openembedded.=
org <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> +                  -DLLVM_INSTALL_UTILS=3DON \
> Can you document what utility is needed here?
Sure
>
> Also I=E2=80=99ve asked our LLVM team if they have any feedback on how =
we=E2=80=99re using llvm-config.
>
> Cheers,
> Ross

