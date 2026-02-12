Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669D9EB491C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 12:44:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44184.1770900277684828781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 04:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SJH67rdQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5dOmc2224909
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 12:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nOym1MGIyPDj2w2qOjZ5w7NJz8OdinoQ5I0p7iEs0iI=; b=
	SJH67rdQyq1Z6B+dPnyqExy4kNLAn/LkjlfwuHXp9oxvVIBYCh6/5Sz0i9YDKeli
	JBx3E1qty8KNc3l4q2clhCYKo/wk0WLip690gxn58ag5h7P8SOhYB8znG82Ne3Kq
	gg6Q60Mhlx9eGEoyg1Ml4QsEen8unLI6RzXkW/MBsDJyMNQrvWBlQQ45s6XvUaIt
	sp+Ufrn+4mvKSQ6pYVJKWQ+m6oDFhGIkQ2sLa93AZ/gzti4pxGNyyYHjLRq59N99
	3H9dpv9tossQJO/3k8gzmeJndhJDlN5TWEQQ8QEwhfe5LZEYZBfKhVNnA26aZtzP
	oLoI2yFLLPkeT4Qe0Bx1Kg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwp49d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 12:44:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udhN/i920qEYKNW7AhXyu2ODI9ureiMRki5gn/n+xnH9sfmExHMUzBP2r58U3btO61Hd7vK6G5MeSOvnjB8A6s92j5grdkG2ZMqaLPghTK4uuUfrd7xCydwGR/GGVolsYtiqxL/v8w3ERc5rf/6ka9OrDRjc92g55RIw+2tqZGOjA3iFRsYhYfkKttlapPjkkixzvG7wvXbf3Y5G+fWnRamr7qt1WNdlxgq6cFqR5grnqRolWgBcQ+BLYS3+E5FffJyH7+bRTXtVQ0pn0GfE3aZ7JgJe07eqnzkrJMvknv+HIwsIdcGQE2US96uOFk3GJPWKzOVkLTgZr3kHztATmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOym1MGIyPDj2w2qOjZ5w7NJz8OdinoQ5I0p7iEs0iI=;
 b=GcVqCW5wLb12n3ioKnAAwuFjnSZHGjeL6sTIg+nE7iIN32ZhXOx650J97LDoADWqvhsw5c4ADZOWIK2ljWTnl2Yny2T2lN9LizVoP77gUQncQnF6jqVeLCEJWmdU4g9Ax7ORiEr3oYAXCVOSLuZGFauK8pXp5uTQ9GEK7at9UqkxWjb6yW+PcJSpi2lNSovdr1UL0sKIDehOfRUGai5KtSTDvcPMhGRbRcxz5N+1PjpihwmjHZxI96UjFO6eVuHrwkLsOI47X+Bhf9Epct7YplstLnb1vrc1GWrTRWynuLVTopLylcvIbAsKZtYR1bn8r70PEFcVk5u+3JtDmw7jKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB8828.namprd11.prod.outlook.com (2603:10b6:8:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 12:44:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 12:44:30 +0000
Message-ID: <71953bd5-0631-4a30-bb48-7e7448d2facd@windriver.com>
Date: Thu, 12 Feb 2026 18:14:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 11/15] kernel.bbclass: Export artifacts
 needed for out-of-tree Rust compilation
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        elmehdi.younes@smile.fr, richard.purdie@linuxfoundation.org
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <188F412032A5A3F8.3408700@lists.openembedded.org>
 <e191dda3-0c66-4cc6-93be-c09152173138@windriver.com>
 <DGCY2H440Y82.34J28P87KRA06@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DGCY2H440Y82.34J28P87KRA06@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0230.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b672191-3871-4931-4857-08de6a347691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eExXSzNJTHB4T0FQOEFDdTBVN21yTTc0MjhwTk5UQVVOYk9yeXlUeXdtOUxP?=
 =?utf-8?B?N3l0dTZJME1rVUIvZlRnclhSUDhpK1JHelBDSThSOWRiTXhlWG9HcEFCOXVu?=
 =?utf-8?B?cDRXZlJJbXBNZjY5dklqUUluSDV1TVpBS25icUdydHUzQzd4bFFQWE15eUZ5?=
 =?utf-8?B?c25KaVozdHFBV2xNLzRSSk5OV0NEdnlBQ2l2emRidWtTUG5ZdlBXV05xOFE2?=
 =?utf-8?B?MWhqTDZTeW1ranFHOGdOSFFHRG81QUVFN2N5TWcxVFRQYkJJb0RzQitxMHl5?=
 =?utf-8?B?SVdJdHpjL2lCdDcyYlNFOHZrY0xsM2hZRkhKWkZuRHRJRzJOdVAxSWlDbzZu?=
 =?utf-8?B?MFNBWWFWSC9zdWMwa0VObklnRlAvZ2l6ZkNsUU90MnRJdGVTMXA2YkFFQlhM?=
 =?utf-8?B?cHJVKzMrOHhycmJJY1BVMEoraVFwSmpqOU55NlFiRHc3bC9SQVFkbi9DNU5O?=
 =?utf-8?B?NXFUTVRLR0x3M2tnaWxLL1VFK0xTRms0SThaN1dOUGoxTWRNb1hWdmlYd3ZG?=
 =?utf-8?B?WWxqRFVzNlZLRnJLY1NGMk1OTXpWc1loYTZUMWhUWlRyNTVFajJTWUQvc0c2?=
 =?utf-8?B?bU1FZVFIdEJUZ0Y1NVJmSTRBS2hHdHIzWk8xNFFYbHl1QkdBaTN0SitPeXY1?=
 =?utf-8?B?UEZNekZoc3QrKzRFKzVjODVFbmY3Uk9wdDE0b1pXNVh4Q2RBUUJ4Y2lNWkNJ?=
 =?utf-8?B?SUxyM3lJYjc2bjEzNndYNEVWNVAyc3JkVVhZNWg5dkhNMmgyNmRLemsvUGVY?=
 =?utf-8?B?N05rYk92UElhSnQ1amRpazBaWmU1dWNpV1NFcGZreXZMeVNqNnY2cmQ5N29t?=
 =?utf-8?B?RVFjRThoa0xMNVlPMjRoUzIrNHNnV2dFaXY5eURhKzR0WXNYWkFVdDlybHN4?=
 =?utf-8?B?MUVoeHV4K3pkTVc3U0VEcjBDOU81N09JMklwS0IwcU10UXBSZXZpaHpFaGlF?=
 =?utf-8?B?YTk3YVpiVzhrNVpTbEE3S0I1Y0pPS2Z3OHBTNDhrTCt5djlMRXJNVkhaMFl0?=
 =?utf-8?B?aTJBSkgvUFIwQzdzanNZVGFxMWF4UGo3MDFVU09vcGo2Q3AwbEROeTVrR1Zm?=
 =?utf-8?B?ZzBSOU14M3hETUx4Q0RueWZoMjJrQmthWlFzZ2MveEpRMnJDVkQ5Z3ZQSTk1?=
 =?utf-8?B?am8xaXBlSHdtc3RNaWpVdDZYT2Zjak90T056b1FNVThRSkl0akQzWk1ScURB?=
 =?utf-8?B?Y2F5Ynd5dDRjVS9pYTFmNVNleVgydy82RkphMEo5UzdvZGpzN3lqdWJNNXcx?=
 =?utf-8?B?WTROTlIxNFdYdlNqTnhtOStQckxoRlpNN3ZtKzBqdXJTWDNmL3hxYSt4bmdx?=
 =?utf-8?B?Vk1vN0dmL0dqRW1rUjRKTXNaYUJMQmxBTTQ5MWN1cmFzckhqQXNHOFMvYUdT?=
 =?utf-8?B?aWFGV3gyU09NTm9TR3A0Nk9kYWltbDdOeTlhZXBqcHJKT1lob21ZZFBjUmtN?=
 =?utf-8?B?WjNCbWl4M2k0N0N0NVVxVnF5U2pheURYdnFXR21PcTFyNUZlcFdmRVl4RUJM?=
 =?utf-8?B?YWJRTlp0c2VIK01SMGhoSXREazJ5UU9ITDk3QUMxRHdmM2pUUHArdlJtRUxL?=
 =?utf-8?B?WC9rd3MzckJmZ1FrL3VMVW5zclJxT20vQmtodFRBN2hKSHp0a0cwYmxPbEUr?=
 =?utf-8?B?ck5xbi9CUmNMY0tsanBRZXdsQVR3NHN3cWZYQ0pBUlBwM1ptVWM0RUs2TVBL?=
 =?utf-8?B?SXZ2aUpwenZaTWM5OXFSbFBxM0t1SWwrS05VV2kyaWIrVlVWazlCa3M0R2RR?=
 =?utf-8?B?V0Nac0NBeEFtL2ZaNUlSbGZGdEUzMnNya1pxeXF5WHN4SG1ZdUFpTTNxWG1S?=
 =?utf-8?B?N0VwdEZPWHJ4d3pOVWRUejZ3Q2JwblYxdmdPWUtYYXg4Z2oyYnpMSVNTL2xv?=
 =?utf-8?B?dFFzbE1HREpHbTFKY0dKQkVLblY0SU54ZzAvUk8xZG1TbmRVNVptS2JLZ0Ur?=
 =?utf-8?B?dGxGZk82cW5IN0dDckg1Zmx2dE1MTWkzcjlVUzVCMm5NdDh3WWVlbFl0bnJx?=
 =?utf-8?B?TEZqa0lEQTBzM2dJOXZFU1pqNFBCdkROZUNzOFNRbFAwNGtBWFBkVExHWnBw?=
 =?utf-8?B?TURncjJTVkhnVFFHT0RENDkzSmhZRk9rZG12bnRxc01GZmt4Y3BhRkFvTnpx?=
 =?utf-8?Q?74N3o7zeX4rTkeO9x2DAgqyKr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejFwWkVnQTBRWHhXZWdmYVQ3SGdCUWxPSVp1R0VFNDhhVTE2dFZMdStGNVA2?=
 =?utf-8?B?MHRRd0xHNEEwa2xQby8rb05RVkk3QkZrTElMOG9jdGR5dmNLWG9vdThiNHFv?=
 =?utf-8?B?VEYwaTcyMWhUSlRsSGhXQlRLZTRnTXFoaStIZmcrVjgvdEVMWE5xcTN3anNM?=
 =?utf-8?B?aG9sSkh0V3lpb0lGUDVyNUlJTzVmRXpPUnJUMERzQytJNlMzVnJ1ZHJuYit6?=
 =?utf-8?B?M2xrWVJLUXdrUSs2NTZaVVdpbFh4WGk2eXR4dmJydENteTltdjNkQ3B2MXE3?=
 =?utf-8?B?TDZDUm9YeGxMRnR0UmJTYlpHWVlzc2t0RmRGWUtrL0s3OEgzaHNueW8wVXlS?=
 =?utf-8?B?YkJ5OXE3eFJhaTVUM0l5TGtmRnRIMEZua3VKdENoMGMyY3JVSlZBRExvMjRN?=
 =?utf-8?B?OTdDcHdOdGFrdGl3RFBVaGxmdENWczlzVCsxL0JQM0kxMHdiWE02ZjdmZ1Nm?=
 =?utf-8?B?RFlZMTUyRW0xMkVvN01iQlppTkNXcC9OTXV1ZWZ4QUN1UHphSGRzQS9EaUtM?=
 =?utf-8?B?VlJybnFKOVFBQlRLcXkyUHY3RGpSSnZ6TW50eGdKWXVMV3lBZFlsQTl3b3Bj?=
 =?utf-8?B?VHp5cTk2N0ZOZVFiL3RnZnFEbGdMS3dHZUVaU29wZVdMUVZ3TWo2dmo3YXVw?=
 =?utf-8?B?eDRwN0krQkllWFRsY2E3b2Y4Qm9BRTFlaXp1dzVWTnptejlSenZ6c093cHVm?=
 =?utf-8?B?eGswOWNyVHZKUjJQZVpiNDZxYURZeTdTUUZ3S1AwSm00MTVUUXRNbDF5OVl4?=
 =?utf-8?B?M0prSkgyQm5FSnZqdkVFM1NUd205SWE0Q2Zhdm9JbWYxSXg5NnJpZjVpR1I5?=
 =?utf-8?B?NnFQOUROUzlINzl4eXNjcXpLOFJQOUQ1RTFWNXV4anFOR1p0c0FrZ0tzNC80?=
 =?utf-8?B?RVgyN0haL1JWY29NbUVXejkxS0Z3eE5EMDlrOXJ4RmxCMm1heEp5SW96Nysy?=
 =?utf-8?B?RGZ1TFV6V3ZBOXVkZXBSSjVteENEVk9DRWxEdkVLcGs1NFV6MkZudEF3dnNl?=
 =?utf-8?B?YTNxeXc0MDFTSWoyRXNiazhxSGpoM3dyY1hld2xPOFNmaHIwR0xjRmxValN5?=
 =?utf-8?B?Y3dMWE1JTU1WZmxBV1dwRTdReU9yRmwvTTZqeDdReUhCdkJHY1FtYVdkZ1FK?=
 =?utf-8?B?TEpIMjdNVk8yMjdOc3ZEZUpOd2tPK2lIT0ZHTlJCSC8rTnBKVFAxaTU3SVVs?=
 =?utf-8?B?L3FXSWJRQ1N5STF1dW1lLy80dzRGTHQyL3JXOVZELy9rOXdjOW1PaU1PdjEr?=
 =?utf-8?B?YVh6bkNQWlFoSzJaVEhEQVpUaFU3a3dIUHk0OGN1WW1HdjBOUzdlUEJwY2lm?=
 =?utf-8?B?aGtvV0MvRTBEeDJsNUtVTGx3dnJvdTVXUFpaaUR4VDAxN3dvUUI4a045S1R1?=
 =?utf-8?B?VEZybGdRN2E4SnlKcFVHb1YydTFoSHZVdDBOaFpUekkwU1dFK3dpdnE4czUx?=
 =?utf-8?B?RXlMODNRR1dxVVFlc3VRRmJJb2hRMk9WYkpaaldPNEpHNXJEL2FXVDIxekc0?=
 =?utf-8?B?a0hPUXZnRmhacHdBTlUvZEJWS25mcmc4b09Zakk2VVZoVVJUUEN6QjBXRlZ4?=
 =?utf-8?B?Y1BUMVYwVWJXMGlqSEh2cnhwTjl2ZUhqbVNNUlZSeXphelgrandhYVh1VjVy?=
 =?utf-8?B?c3UwdGM2RVVTZXF3ODJxcVVZV0VyeHFKMlZNeFByRG9xeEZmN1hLN2tBc0dC?=
 =?utf-8?B?bmpIRUdMQjh1NHF0cmNOVm1BWjNpS29KZkpoQWM0dTZOLzFMWnVjTUU0RElX?=
 =?utf-8?B?ZzBlRkRWN2FVMFhuRHhoRGZ4Y2VpT3NSTEFWRjN3dU5FMGxLQ1RZTG1sMnlX?=
 =?utf-8?B?ckc1TUhvQTNQUG9iNmVMWFJRSzNzWHBLN1dyTWIreDFiY3BHM3NWc3JkblVs?=
 =?utf-8?B?QkQ4M0ZFTzMzZi9ocnhnN3dtT0ZjKzlmVFM1THBpNXBoTXBvSTJZd1NjM1dr?=
 =?utf-8?B?SVRjQ25DVlBxSHhvV1VYQUFZVXJtSDcycDMvWE8zd2JrN2MxUTdWNVhDZEYv?=
 =?utf-8?B?YTYvTzRPWXdkMStmKzZDenNZZXZpaWV1UDFtdzZzeHdmL2ZXL3JMNG9lcU9m?=
 =?utf-8?B?SEtqUHRZNXRwVWtPcnhQbXJvN0lJSzV0OEZ6WndJbk9MVmVnbUtpQi95emZI?=
 =?utf-8?B?clJqdDMwRk5zOTdUTEE0c1c2dEJIT3ZldW1yR0Yrd05iOXFMTTJleHVoeWE0?=
 =?utf-8?B?emNXUkNwQzZYbXovV3NEVDFUS0F2cE1NR3d2SVQxRnhGN0RYbWNxMjFPeWNp?=
 =?utf-8?B?Z3ZGcUtqN3hsVmlsdjc3TmJ5cDdnQytiR3Q0R3hxcWdMcm41N2txL21lNVJI?=
 =?utf-8?B?VTNlcFBBTFp3bVlSRzl2TmlNc1RWVE9RWVFYYjc0K1BHdWlETXBhKy82c3Za?=
 =?utf-8?Q?evaCdRRbXgKqS1Q0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b672191-3871-4931-4857-08de6a347691
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 12:44:29.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEkEeZeN0KeDuGALpWkJZ6sJvdizIbXpEAJBhFa4dS5IDDI3md85Ww1vcw0szvMZanYpACqziCHvpq4LNXiNGGwTJ4fWm56V/FX0oFa6dtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8828
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698dcb34 cx=c_pps
 a=Yf+1g9CPtaneS6NJHGTLjg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=KqfXm_aS5in76TVW6pgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: P7DLkEzg1vw9GKNhcjJVUgDdGMOKUeIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5NiBTYWx0ZWRfXwZ2rP1r3z4JM
 ORIYjViJuykYNM+umyHjsPmiBj1J6824TwcjvwCcFZcgRzVCsn7/iWTvVZkX4nXOLFqflvA65//
 zyjeYDY2DZvFGWSmjIQ5lpXbYpQEXNRYIQrNodCw4wNUN8B0oTaSHIoGKxYF/36fGCDTNFYqQVK
 ijshgvT6VpVV7HiQAILKSiUs/1YtuKv5CBSQnijyRCBBnOzg11duU8cC7BnvvNfZ5Ut+xGrQwGt
 TS/qwsgDErKhQL8WvE6+Y/ymWCC33FAgzHa1jFF5NAtUBfrdRxf3c8a+LbUpXLXFA3JPYpxKq0q
 pMY/jnGbQfRCxFui7MaNWl38ZBgFka8qEBWIwJzSMiDaQVZv0+YhIbvvTH2YxB+hakSL9SWbvI4
 h562YfRigZSs0WaA93fv9Hee8T277y6P/P4v6Nmn/R7nvg+6PnUMgvT+bxwEdh2PrrqGWJ4qpXT
 fi/y1s32YAqw0Vzloqg==
X-Proofpoint-ORIG-GUID: o8PVKmy9ANr6BweSIXpdEqsnp-BBYags
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61C5dOmc2224909
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231028


On 2/12/2026 4:55 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed Feb 11, 2026 at 5:19 PM CET, Harish Sadineni wrote:
>> On 1/29/2026 10:09 PM, Sadineni, Harish via lists.openembedded.org wro=
te:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> Publish artifacts from kernel compilation to allow out-of-tree Rust
>>> compilation:
>>> * scripts/target.json: target definition: architecture, ABI, compiler
>>>     options, ...
>>> * rust/: the crates compiled by the kernel available to
>>>     out-of-tree-modules
>> Hi Yoann,
>>
>> I am dropping this patch =E2=80=9Ckernel.bbclass: Export artifacts nee=
ded for
>> out-of-tree Rust compilation=E2=80=9D from my v6 patch series.
>>
>> Without this patch, target.json and the rust/ directory were already
>> getting published for x86_64. On arm64, target.json will not be create=
d,
>> yet the module is still generated and works fine.
>>
>> When building rust-out-f-tree-module for arm64 with this patch applied=
,
>> it emits a warning that Out-of-tree rust modules build will fail due t=
o
>> a missing target.json in kernel. However, in practice, the build
>> completes successfully.
>>
>> I have tested without this patch on both arm64 and x86_64, both tests
>> were successful.
>>
>> So, this patch does not appear to be necessary. Are you OK with droppi=
ng
>> this patch?
> Yes, as long as it builds without warnings and test succesfully, I'm fi=
ne with it.
>
>> I have pushed the updated changes to the below oe-contrib branch:
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddeepes=
h/rust-in-kernel-v6
>>
>> Additionally, I have extended the ccache disabling to make-mod-scripts
>> (as part of "kernel: Disable ccache when kernel rust support is enable=
d"
>> patch) and updated "meta-skeleton: Add rust-out-of-tree-module recipe"
>> to align with the new changes.
> Shouldn't the KERNEL_RUST_SUPPORT check in
> rust-out-of-tree-module_git.bb be moved to the module-rust class?
Yes, that should be doable. Moving the 'KERNEL_RUST_SUPPORT' check to=20
the 'module-rust' class makes sense to centralize the logic.
I'll update that change.
>
> Generally, If you think that you rewrote some patches, I'm OK with you
> taking authorship (leaving me as Co-developed-by). That should allow yo=
u
> to edit patches more freely.

Thanks. I=E2=80=99ll take authorship for the rewritten patches and add yo=
u as=20
Co-developed-by.

Thanks,
Harish

>
> Regards,
>
>> Thanks,
>> Harish
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>> ---
>>>    meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe=
/kernel.bbclass
>>> index 30a10b0801..dfb8604a68 100644
>>> --- a/meta/classes-recipe/kernel.bbclass
>>> +++ b/meta/classes-recipe/kernel.bbclass
>>> @@ -632,6 +632,24 @@ do_shared_workdir () {
>>>               cp -r scripts/gcc-plugins ${kerneldir}/scripts
>>>       fi
>>>
>>> +    if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true"=
, "false", d)}; then
>>> +            # Copy target.json file needed for out-of-tree rust modu=
les
>>> +            if [ -e scripts/target.json ]; then
>>> +                    bbnote "Copying scripts/target.json"
>>> +                    mkdir -p ${kerneldir}/scripts
>>> +                    cp scripts/target.json ${kerneldir}/scripts
>>> +            else
>>> +                    bbwarn "scripts/target.json not found in compile=
d kernel. Out-of-tree rust modules will fail to build."
>>> +            fi
>>> +
>>> +            # Copy rust/ needed by out-of-tree module (firstly for t=
he core rust crate)
>>> +            if [ -e rust/ ]; then
>>> +                    bbnote "Copying rust/"
>>> +                    cp -r rust ${kerneldir}/
>>> +            else
>>> +                    bbwarn "rust/ not found in compiled kernel. Out-=
of-tree rust modules will fail to build."
>>> +            fi
>>> +    fi
>>>    }
>>>
>>>    # We don't need to stage anything, not the modules/firmware since =
those would clash with linux-firmware
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#230151): https://lists.openembedded.org/g/openemb=
edded-core/message/230151
>>> Mute This Topic: https://lists.openembedded.org/mt/117528980/8054390
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [Harish.Sadineni@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>
> --
> Yoann Congal
> Smile ECS
>

