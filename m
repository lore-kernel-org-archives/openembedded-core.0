Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EAA1062882
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:18:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19630.1773231523239774395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lN/NfCNc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530fe02e0=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1p9Ax2435343
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:18:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RpLR6E8nOqhIdX1eiQ697zM6ZixAoglBHotPw1HLOPE=; b=
	lN/NfCNcM+7pAB/lfkTl55OV8TnqQM+caGn5d0oF6NpOwvkgGKmnEA2Z+J3Gyqf8
	o1RgQMTOnO3lsd1f6CMLM+INzg2JF4hl+9rD/X2dDUMB47TvJv7dkdIvO1zQKzDV
	3lKXB+07KX/+ruG3N5M/XYFcOk/5Mc2M0zw1kgi2TcomYbJrfO0O+avyPJSwg1jQ
	pXlv3fFe4R+z+mikpw1tNBMfuYWLYaIWEpW/GrZ2ba/+SbW9mX+bf3azZOH+ZVoe
	f38Uxyf/Z/AO4Wp9xkFMCD1ZG6PP4uKZ2lHx+coh3GWtcwXQhe86GqA5iaIk9iZn
	KTawYgQ+HyWM/BF80ovUUA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j0jrp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 05:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpXHBYJsPXKgm3QzPw7/dEASw+x12sbYiOjogagxdEBuO8z3cm/Mdb5G4FPo7S51bKvkfjz0BBlRbX22y9C7BcxOr0FavP7/S2mn+wCs8f8/5txggV+KxMl1RcJIfldd2YSx7pb/zo3Xny0pHdVhOp3EnwLusmLkGHcC56w1Ba/lxw9eJta27tYsx7PZb/0PMwUvL3S28QA2dNrCRjhLcuYQEnn+D/ys4E7m5NDX7pgCFm5v949lDa8a81xMyIFWP9VpzgqsqAhjsL+wImfwoXhLrQRXMLnBmljG4DUkrtYAN2+PrK6G5XXx0rNAkUJU+wa+znzjfklQLZEPunVHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpLR6E8nOqhIdX1eiQ697zM6ZixAoglBHotPw1HLOPE=;
 b=ZSYz8sUkhKC081QU0PLUEb9G5SCrdTedlLcGskDfgyXwvk4V24Wwt6I7GiTUYxl6RaTaexTpVviOpMjP/hG2jImFUtgDiY08XljsVkvPb0QYRT0P5087/IN+cz0OPFVgk8xqfDN6hCkJuwQs2/j/jMV28tHPT6zGLvYRlT4W6egJ1E4oXPQlYlHg5S4UfWjKNoNcoQ0//6MysYCEkuByv7kfSIfbtkJXaCzQ5dXpEd7miy8+OeBQ0uo2eVrjf/C+3b+StiK8TbQq2fHhYh+D/rn7mpm+r8CN1UruG92YRCh5asVMtEsqVAL9GLUIuM8uvp/Uk4lxvmExYlEBp8bHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 12:18:40 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:18:40 +0000
Message-ID: <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com>
Date: Wed, 11 Mar 2026 20:18:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM 6 in Wrynose
To: "Matthew Ware (mattware)" <mattware@cisco.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Elliot Sparling (esparlin)" <esparlin@cisco.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ecb9c6-5d3f-4e53-dd9e-08de7f685413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|7053199007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CFa8qhLSW63zTkHjdam1oQeMpIo3Es8YxiTfBSKRlL/Ohpq9/N0ugezr+cVzUmRhJKgJSTGzkZAw5e5WClmB1hGzmlRXG6+gEsGd3UnXcXo63+IJNpH1gT4L27hJoA7YcUoOCLqN5d3TPh5coIkBpc9XHJUUcHNczXTxq0OC7YRWiomFfrRXmpE/KGkxoTy98MMwRGz0ewHZF6V4d6dJFZ4ayEpRcqbEzXfEhoyyS1tvCqQpceyTVkDvdSBy78tjLIfUCqQNzNFFObVHmdgd+Lghvhmc72ooMuR1dtUNiT3nFlP1/4ehubCa5A3IHIdB9odBXxSGvU1T7hPsfxajDLuxpJc2azzD7daYLONecLJpm4GbUIOm2ZEF8CMFiwDf6E5WIrv9yfX7OHAGb80hC0kcqHSp411zGnM7Xz3PQVeiX3AjvcYiRmpIlB2ke0ggwh6GYoeTByg1QmSK28LgXF9EyO49Hh/ZXRuUw9rSGzKPcc5w3z0dpO6d8py9CaYVrWO3j4Xws/g9o+ylcVpjRZjoDMLtK3biUP4cJxNuodYRusWsxL7F1zAnvhHJWmIzfq6fsBnuwxG6tvw6s4W/cdtcENCJMt1Q99612nSH4H7s3lUPe0eWHWTTeico7gg4csEOwdyKE+jx7EhjwwFchBtehGMd6+ikiKaG9J26NSpH/3RzA+wvLzz19wu9zV6v
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(7053199007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cG1uQUZ2ZGllZHpoM1IyY1RxcEM1YURYTFJrcm5qSUpOWGRnSTNOL3V5Um02?=
 =?utf-8?B?ZkNyNVMrUEVsTzduZi9nY0kxN3ErN0UwcmdkbWFEKzljQXhTOTYvRFZackF2?=
 =?utf-8?B?M1Uvc3BvM0tDNTQ3ejhEZWpmekRXZGEvV0ZTMG45clgzbUhNN3V2RFR1S2Ex?=
 =?utf-8?B?ZFJ4a08wZUl4Y1NSMkVqbFEyUDA0YnlSVjNKMGZNSmZSOFlqOHVmVXpnZzVY?=
 =?utf-8?B?QUQxdTQrUjNwaWVFKzZKLzgvU1VMclQxSm0ySVpnN1J4OHY0eTZHWWtkTEJy?=
 =?utf-8?B?dk5JUnpiaStvZjFwalhmWXZyeUcxblRXQjVmeFZ3Y3ZhcWwwRjBKMllqeHZi?=
 =?utf-8?B?UnhpcWk3R3IvdCtwOWVQdlZWUnRvUFRKRHBOa0MybzJSU0xLQWpQWllJOUFq?=
 =?utf-8?B?VnREd2NQUE5yR2ZWamxvV2VOR0xpZkxyLzdDTzFwak83NENTbXlKNzdlOHBz?=
 =?utf-8?B?c1grRWRaSjJ1cmFGVzN6dDZNMmR6OGVHWUxxZzcyeTF5REtmTGt4Y2VGY1FD?=
 =?utf-8?B?Zjl0aXRXNko2OSs0MDlady94RVBucXJBcytreHdHMS9lbFFONk1mYnBHWU83?=
 =?utf-8?B?K1JrOU9kY2hvYkFFYSs3MS9BU2phOUNzYjlZN01ZREdRaE1TcTc1bldWclAx?=
 =?utf-8?B?MTVVWDNtdXJYanJMZmdmOXRzOE1iUStUV09iOVB0RDUvTkpCbTA0SUExMWt1?=
 =?utf-8?B?Z1Uyc2tiNGR3VGxXdmZqejhyUU00M1N1YUJRSHpEL1dMQVd0SGVRR0lRSmRC?=
 =?utf-8?B?RXlpeG5zN1ZGd2JwZ1ZqOURNQjYvYmpud2RaTkhsVk8wRjFLdE8vQzlDUmhv?=
 =?utf-8?B?QzN4VzY5WkZGUFNDY2pMZkloTFNYNlozSFMyK0NoQUdvR1VTT1BENGhaQ2Y0?=
 =?utf-8?B?MUJPN1BYUTBxOTBnejR1ZnBtNVB6SnFYdFZ3TWFiUGxBWHp4WmRGMFBOVHR3?=
 =?utf-8?B?L1F5bGNWcnNvZGJNTkxqRlFtcDlobmtOajRBQ3QzSnRqK1Bjc0cwQ212QXo4?=
 =?utf-8?B?NFg2NXVid01oZ3ByWHdXT2tQVFFWSHgvVUlwVVRDWXFSaHgyYUEzaDI5UU1I?=
 =?utf-8?B?V2pETm9INDNIalp2eUR6VXJXT2cvV1drVHk0ZEcvdVl1TkZhb1Q4c3JhV0Rt?=
 =?utf-8?B?NjNvcmhERmRLLzJzZDZUcGVLTnJ2MUZwN2pDTGYxWkJnN2tkcGY0Z0RrL1dB?=
 =?utf-8?B?L3ROMU9Ja1FGRWlZaXdmeVYwR1o3SzA1cEN6RFdSVnlGZkpzVlY0Yk1yN2dF?=
 =?utf-8?B?WHdCSDJIUGl6aFkzOW8zSDBTT0xCR3pLckF1MmJFRXJGb29rQmNsRzhvU1Mv?=
 =?utf-8?B?aXUzYmRoeFJNVzZwdk05b01SVDZjSml0YjBrRFRNM1BIMGwvL0dHR29XOWRG?=
 =?utf-8?B?VVIvSk1KemRDWnpuMDIrbERyQUhjeUdDOUVmQzNHenRDdy8rMUhhTDhmT3VY?=
 =?utf-8?B?MCthWE5VUm5QUTdIOHlQSFQramVlK1c1SXdtdXpkZDkyYXJ2UFZES3I3bHN6?=
 =?utf-8?B?NFVJaHFtSGNSSWxiRms1aGJjelZGZHE3dEpWdWdENWIxSmlJYlpDQTlpdjNF?=
 =?utf-8?B?VmhVZndMTGxiVVUybVBmY3hUMjRZOWJpbFU3bDlqUnlLZi9GQnJpbGRFck5y?=
 =?utf-8?B?WjA4bHJMaVRHd3VBMGlZMEZHMGFIYUxmVy8wb2dXTnF2Y0VHQjhIeUpnRStw?=
 =?utf-8?B?Zzhwckc5ZEoyMXhxY2ltaFFiQnNydys5ZE16UTl3M3BQQ09FUVhqbWFoMmxS?=
 =?utf-8?B?TnkyYnhpdyszL0dsd2JFMHNRajFiOEZTMmxTR2ZuODFLeFU0TXVxRXZ2VGlP?=
 =?utf-8?B?S0ovQlZjNDcrTmxFM1k2SSt3czQrUkNGelVWQkdhNTQvQWJ2WlBIOUExYVJv?=
 =?utf-8?B?U2pRY2d1YmMxMGNRSk5TUUdDM3BET3NTQkFvYUdTRE8yQkFISDBiKzJGcko3?=
 =?utf-8?B?c3RpWXlmTDMrVjUxR1owaksyZkp2QUVGUW5VMUpFd2hTV3c1aEVOVXE2bVE0?=
 =?utf-8?B?TmRqRFJheEhDOU9aYkpGWmRDU1RLa1VBWFZzclVQb0NPRHZaWStMVTNYaWRN?=
 =?utf-8?B?MmY3bU14d0lQTmFUV2tzelo0Qkk2QmpBd216L0RsMk1UcWhEa2hqN3VaQ0Q1?=
 =?utf-8?B?cXlhODd6OFk4UHpUTzVSbUVvRktvVW5EOG10aVkzTWxKOTA2bHdkUWo2cWxT?=
 =?utf-8?B?Ukg4anpwZS96STRwdVVYS1JxeERncVFWeCtCdE5EOGorSC9xNG1NSVFmVHhD?=
 =?utf-8?B?ZmFaSlhNbkcvY2VYYzVMdVQ4ckFXV1dEWXhYZGQrV0ZtRlQySVRTMU1uajdi?=
 =?utf-8?B?RXE4VzAzWjFsQy9SeTQ4VkhZdkUwTGJNM2FmYUlUcHBMZ0hCLzVRUEdNR1BK?=
 =?utf-8?Q?nB6et4NLjSXyLVFU=3D?=
X-Exchange-RoutingPolicyChecked: 
	QqP9dmxhkENbiXBMbf95UxKFXy+B7S3SjOgjukLKTR3OdmdpMYVhDLw/u0EBa7vCroXNwz5U5Yb19nnYdxluzFaMikG1zlB0vDphUtBxbC+JEhnjylGCFt6c9H6e383M29ZupyfVo94zCLKF4SuP6d9hQT0mtY7Q2ELlOeqf4++3YhKsn2bZ9CPEaFPRs0KfgS4OWLCSCM6VQuDRhoVhc2sBML21T+bqxnh+F8D3XUOciQX+eJR1z+Y+K3z2AV0NiJur5qQyVdDxx0kFYnmRW8QPyhiNp9LgDcmQVLi7qWsIKedPT1C0qPar6gTbB6IAjs5nrOHCLGRApTH//d8k7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ecb9c6-5d3f-4e53-dd9e-08de7f685413
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:18:40.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axD/KSAA/bD7NloCn5zk/Exgc8+w0aWbPbWBV0BhwInOFZrNqMgTFqrrmfYO63BYyhDDWBMdC+4u4shAc53RgtaSbh+vXra3fPWM37OVmio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TQWYUbeJEYNnZQTjdukOBlbSQ-eBUrRP
X-Proofpoint-ORIG-GUID: R8ZaMz2sCpDuQ_397RV_QOK_1btd2OlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNCBTYWx0ZWRfX9EuX4cPte1lo
 mvepsnIZpPqhjoy1YL4L88zwetQ+ZHszPg0SeRL7hErPhlih6dMxar3Vr7S59oGZlrMRkii1PX1
 TSTy84JFVvRbpNrq53mni4mJ63MOjKZgHOhKxVaBCUDqb4G1ybqtPnxR5MdSF2YQNruaHDfVp7U
 AZmy5bkXN8uIWqrFdZqb0+tYLN8aTkj455KkZbhiBneZ6ho3/pNFBn1u6z11UogUnMAlctBqi4D
 9VFqnAth40Z+NzejVDOYEMdCzkozmD8kEmBdAj6E8AxWr2hsyYJIo8YAj0QeiTt3zygFrpsLso/
 vwSYKg/TLrp/wJyMJyduemuMANMrotIG0LevLoIKVMKiYKr6omjDmBD5F11fOKtuhnyu8aY91He
 h8ZzRKhXksOelvY6j9xIdbjtGmh0dI8FjPInYvZD8FQ0ecyh+/WizQCrgSrgJ4k//5el3ZSOdb7
 OFjA9Zi43b5XjyjYDGg==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b15da2 cx=c_pps
 a=e24IK3jsPB00aLvKg+wNHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=AUd_NHdVAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=iP-xVBlJAAAA:8 a=yWqK9NzTbaU18TdaXWUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B1p9Ax2435343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232870



On 3/11/26 20:00, Matthew Ware (mattware) wrote:
> Hi Alex,
>=20
> Fair question! My team are looking at using yocto 6.0 when it's release=
d, and=20
> rpm6 has some features we're interested in. If rpm 6 makes it into yoct=
o 6.0 we=20

I'm still working on upgrading to 6, here is the latest tmp code:

$ git fetch https://github.com/robertlinux/yocto rbt/rpm_tmp

Currently, it can't provides the pkgconfig files correctly when the pc fi=
les are
/usr/share/pkgconfig/, any help is appreciated, for example, help to do m=
ore
testing to find the corner cases.

// Robert

> can start taking advantage of those features, and I want to plan for th=
at :).=20
> Similar with dnf 5.
>=20
> Thanks,
> Matt
>=20
>=20
> -----------------------------------------------------------------------=
---------
> *From:*=C2=A0Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:*=C2=A0Tuesday, March 10, 2026 5:26 PM
> *To:*=C2=A0Matthew Ware (mattware) <mattware@cisco.com>
> *Cc:*=C2=A0openembedded-core@lists.openembedded.org <openembedded-=20
> core@lists.openembedded.org>; Elliot Sparling (esparlin) <esparlin@cisc=
o.com>;=20
> Robert Yang <liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu=
.dubois-=20
> briand@bootlin.com>; adam.duskett@amarulasolutions.com=20
> <adam.duskett@amarulasolutions.com>
> *Subject:*=C2=A0Re: [OE-core] RPM 6 in Wrynose
>=20
> On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
> <mattware@cisco.com> wrote:
>  > Also, since we're here: is there any plan to move to DNF 5? I see Wr=
ynose is=20
> staying on 4.x, but wondered if there was a plan/aim for DNF 5.
>=20
> Yes, there are WIP patches for it too. Adam is working on it.
>=20
> I have to ask: can you give us some context? What makes you interested
> in having these versions in Yocto?
>=20
> Alex


