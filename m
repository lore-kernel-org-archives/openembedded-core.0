Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51E2EEA846
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:13:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51816.1770920030422664213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lHed4lHQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHp0hK1400472
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1JQvXZEB2w0jOa3LsXCfZ75uvgrJd338r1ZBzxTzI6E=; b=
	lHed4lHQGVTCaR1x+9bVTn394Ltfciu7Lzw6Mtbq3S3xnnp0RJWLURGEEd9vm4My
	qVbGFPYXrfbRxbL/z9XUbiDvhfbNq7QYum5C2w8rx4haqs6+gKiw/Asn4HQpQMmJ
	DOxiw4wez8mBRFT13kJipd/RwIomth/pAzgiQFLYhVGRLMznYF/uMihXFRRr1Mpw
	/D4AubpiY2G5zQYhgPP8s23I5+RDkUBkOtNtTTKuJL84iZzQF/1dpzy9YPij0tvz
	c9jhSO7+HAX+HRIFF9mmBiQthe2fuWVRvV+6HPYvGB30AQTWagIkSgCfQUaDV4Wq
	AR8JIX+IvZ7ByOi6SSpSdg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5ef37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:13:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUAHgabxoIAgeQR8MipMpD93xdwxdT+IVX4l7QWCh3Kq/Xhm0Wb2dlzhFge70t1hwo0YPXY29WBeIb9vgKwrvPwJBZsYgihxci3RAN2R0CD7fUx/Ei9RlUaRDFEiU/ycQeYzIzQxZhZ9YbBvmgITrgd4CNyBqFTSRaxbAEurzxhx934ExS8Pa7tCXW+x/PyzxA0ESodpw+z1ba2VO3cbuJF9o92leh+V92tWyAFaVBuhwIWBM6dtMlLBXKxn2uqn9pQrVb3lipGn/7Tma4uj6/u9RPAlMYt/3B6Q5d6PmXqJxkD7H2Xy4W1hezThmCvWSDJ/mXG90v65oCr4bhdHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JQvXZEB2w0jOa3LsXCfZ75uvgrJd338r1ZBzxTzI6E=;
 b=DjYNKj0geqrLc1paNlx1MEocRm/UCzg5VuA9BvczxavP5+hHgklL6ImwFCz+xLbu9kF2cTQEt1q2vtExdNL0Bwtg2Ijll0Ypsc2bXT/6FPe2fqo5sxw9ndLV6Xp1yB9m4jmEreu9HBc2JHTQ65XnW1xEl3i9udVyucr2+KE/wkASyRYgN+s5MBAKzikUFqQ5yuMaQ4p5v3qd4dkqOeLwGkQfS4yURGHgm9kap+QP/S0WYg+VDb6hq2yTj0cStiAsQs1Nddu/auNoAYCHFbrb/Wvtjrq22xK1jFOkimza9zO8U/eLWsn0kWeXF5suPe3VvSVHliIrWjvMpIuKWynsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:13:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:13:44 +0000
Message-ID: <9360d6df-8c9e-4480-b5e0-151336fb8eb6@windriver.com>
Date: Thu, 12 Feb 2026 23:43:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 00/15] Enable rust support for linux kernel
To: Paul Barker <paul@pbarker.dev>
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
 <30102f29586e11b8f44d2af5c22a5cf89b95cf97.camel@pbarker.dev>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <30102f29586e11b8f44d2af5c22a5cf89b95cf97.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a40a25-9c8a-4522-bf16-08de6a6275ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WTFnQS9nOWVKV05uTHNhWXN1TkZETUtSS0srYlhtUlVDRXBhbVVPV3JJaGxE?=
 =?utf-8?B?V0ZNSkVOY0libGxxWENNVHhVK1dXWGRSdEZEc1JKam1YR3JuRVl6Mjh0OTc2?=
 =?utf-8?B?b2loQlZjWUU1RmtLZWNBaElHN2tBbE40bWk1NHRvK3A0cUFIVlFhNUVTTmds?=
 =?utf-8?B?WHV4MGdYOUl0ODN2cEw2Nzl3bHB2eG9GMGFYUE0rcmFtWnRQSW05T1U4Tk9n?=
 =?utf-8?B?cFBVMlkzNjBTQWZFTHVuRUZ5NVExSDhZdDVzaEtMOElTLzF1S0ZnYkZoZENF?=
 =?utf-8?B?Mkk2UDZzRFY1eFUzY2FkTjM5YmdER1huc0g2QkNRWE44U1lxOERmVitENG9R?=
 =?utf-8?B?R2pnRGhvVTl0NlU0dFpRdktWcU5MZmRNMmtZbkRSMmIrRXZ5OGVaMUozdW1v?=
 =?utf-8?B?RHllclVqcGloZkR1aE5zYmQ2Z2kzRU1Ea2d4QjBuWER4NCtKTUI4MUdiSTRM?=
 =?utf-8?B?MktpMkN5MWVjVkVFLzhVWWg1U253Z2FiRnQrQ3J5bHRqNXIyTlp1a0ljck1R?=
 =?utf-8?B?YXZLZEJOdHk5anh3KzdEQ0U3SGEvbDJ0eG5yQXNiM3FoWTlib2h4czkwZDNL?=
 =?utf-8?B?V2VqZU51cDQwdEtrS1ZTVnU1QTRWdFhSUGRMVHJlUi95dzJuelRyYW1Zdkhl?=
 =?utf-8?B?Q0s5aHQrU3Bqc1h4Q2tLcWhjT0NhMFRJcjZCa0dMY21sYW1uRVpZVGZyNEVC?=
 =?utf-8?B?TmVPOWZGMitkcDk4VnJwWUh6V3hrWlVhcUMwMzAxMXE0aERaOGRGWGx3SXUr?=
 =?utf-8?B?VTcvU3VJSHp3dFR4QWRJZldVVVpmNFhHaWhJanE2alU1aTNRYUlpcHRhR3Fv?=
 =?utf-8?B?Qkx6R0IwNzBidkN2c29jNkNVek9KSjgrSEo3aThrNk9CV212dTV2MUZsUG9Z?=
 =?utf-8?B?VjQra0EwSWU1YUliSVpLWGN2Zmk1bWo4OVZKYlJZQ2g0MDJESUh3S3JSWUIz?=
 =?utf-8?B?Y2E0a3dLZzZYTE4ydXpkYTh6Z2owY3RwSHBUTEVLRmdkMVp0dVJXYk5JVVA5?=
 =?utf-8?B?dm5XbFhGTzJnNFdRNDBGVjlHdkVrelpPaTNrLzRJbGljOXJRSVE0eWdRQzRW?=
 =?utf-8?B?WHFWRkNrQlBkNVluUUVxeUJyNTZzSUlmbTNobG5SblAzWEdPS0VhZXJjZEU5?=
 =?utf-8?B?VFJsNGt1VG9PUC9PaC9Jc3hKVWNpNEFJQlBqMlp5UDE5a0x3T1FJSCtlZWIx?=
 =?utf-8?B?bmVWTVZUeGxpWXpaMUU4OFVQTDlHbGtMOSt6Q21NU2hCMlpkSzBkaisvb0tt?=
 =?utf-8?B?UVFONXBuNzZjQkRFZ1hBZHlFaVR3NW1xK053azhwSzlJY2VzQjJXZU44RHdv?=
 =?utf-8?B?dmRPTW1YTC9kT3lKSk1vY3kySDlmNVJoUkxZWStiYlkxUkw1WU9ubXZEaytl?=
 =?utf-8?B?eGxibnJ3VCtsQzAwMXdoQVd0NHdJSDlhcEdWOVZMbnZPT3QzNmVOZHVFNW52?=
 =?utf-8?B?ME9weFB4cE1qNUdnZ3k5Ty9wd3JvV2lzekZnR3UxbnF2Nnh4ODJ2QUUrOVFU?=
 =?utf-8?B?dVVmMEtodTlVamhKZEp6Mk8rcWMxcEZsclgyeFQrNSt4bG5EbkFRWW5nSHYw?=
 =?utf-8?B?S3U1Um1GZ0I2YWhTdERVT0V2dzJPd3IwTXQ3WTQ4WG1OMkI4Qm40S2xNOHpD?=
 =?utf-8?B?NGgyUmRhZTlUL2xNRkIwVmxtWFd0RFYwVGsyaXF5V01QNU5UblZJQVB1STJ2?=
 =?utf-8?B?QW5hKzdUK2UrMUwvN2dDYVpTWWNYRTJRQjZMNk42VmdrMU5KaEtneXdudzZk?=
 =?utf-8?B?TkthMGdBQjYvVzJ5QTYyRkZEQmswR0xOb1FYckJXRnNaS3RUb1dKYzYvYUVR?=
 =?utf-8?B?NXkrTTUrZS9ESXc2K01VT0NmRGMwNmRrbVYrUzNoL0dUN1pFVnE5UjFXc1Zn?=
 =?utf-8?B?RWdIeUprMHV2YXcwZU4vQkIyUFBhdVc0SzdwcXlJWFI2Z2JMK0pwTU9pNjdi?=
 =?utf-8?B?aDBjN2lQVStwRk1JOUl1R1VTd0xDWmpUL2tBbmcyZWVHczhBaUg1TGhPblRo?=
 =?utf-8?B?RmJDZWM3ZUpUUWZYZlI0ZG9IV1NTbnhwcDdTU1FQdElzMFd4dHk5eFRKSTcx?=
 =?utf-8?B?Z3lsK0JKaTdjdjNON21FSnNvdVdYK051OUo5dENldS85WWdWUVlJeThzOVBh?=
 =?utf-8?B?RDRJQ0Ywd0N6anJEZG91Q05xOTRJZlNBRGVBNUY4RjVUeW5DZ3RTMEFjTTBo?=
 =?utf-8?Q?HMVPtKYdtITm5VsmMS1U9CKCxDjwNmcUe9bMk7egisZm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWk5T3piOGdGNy9DU25qdG1yZmxOVDFtQ05WWUlKcm1JbjlyK2R4QkNjYXVn?=
 =?utf-8?B?bTByZllCdmlmNG1Mdmp5RXZYZzI4bTZKYlc5MzZteGY1NDJCMGRKaFR6R2hh?=
 =?utf-8?B?V2MwY2JoSWE4K09lbWM2bW9ueUZJVEJ2aDJQT2dWUktSb1Jnb0cvR0RFNWRP?=
 =?utf-8?B?WnZpN0JPWFFvd2ZNbWswa0N5bEFPV0wwaDBWZ0k3OGJucVRWL3J4V2VpaUZN?=
 =?utf-8?B?aktGYTRKNnFoT1l5R0FpeGd4VmovOU9QaHgrWitScjdDemYyMytrWXpES0Jj?=
 =?utf-8?B?SFZTckl2bWtySzRERFVVdnhtakN6dm1SVXRla3VjTzJQS3RYcGlhVFJmcmFF?=
 =?utf-8?B?QmdqVXZxWjBoZ1h3eGg2Smd0Q2lRaVpraXBRM0I3citkaU5JanpzSXI4QnQ2?=
 =?utf-8?B?L0hhOUE3a3JXWkFOTTRtV1c3YWoyM2dxUGRSMXlxbXZ0WnF2VHlaMFVCK01k?=
 =?utf-8?B?bzZ4K2RqbVc5Z0liVDR5L1ZoRFhRYlJGTWkwQ1ltSHJXK0I1RG9KUkZFdDk1?=
 =?utf-8?B?Z2RuN1A4RnNaeGFHalNvUjRhbzdTTWpFYkJQbXRQWEQxUGRySStzSGNCKzBD?=
 =?utf-8?B?U0hIUWdnZGNjNHdtTkxpWnk3aE43MGc0eWFIUVYyOTN6MFpHN0U0L0k1cGln?=
 =?utf-8?B?NEVVS210TFo3Q2RJbVpFN3luM0FvYjZlTTErb1dMbytGYXprNjlXZktWYVNW?=
 =?utf-8?B?SmJHdWx0bHBrYTBvVUhmVWxQZlBramQxeStMek5adGVOWExyZTRGUkJBdURV?=
 =?utf-8?B?NU1JNXZkeVBCdGtuWHBDaUw4cG43MURZRGZSVGFBT3RDZUtucEkraHVKSUZM?=
 =?utf-8?B?UjNTNHlRNURKdkswSWRRb3kwTHI3cmx4TFAwa29SQUhVNzZtL1BPWHIzS2JT?=
 =?utf-8?B?OEFFaG9EMnRFYXBKQnl2dHFUWDdwTDdWVnRKUnpUcXErUlgzWnFYSnZuQXUw?=
 =?utf-8?B?ZjRhejZYSnZ3RGhnTkF6b0hoaHNKK3E1VUZEZ3hLeG5UcTZTOFkwSVd0NkJx?=
 =?utf-8?B?aGdrNEorL1VRSlErc3BLUVA2R1ZqRW9aajRoRGluZnlqWWZQRkUzQzBVNHBD?=
 =?utf-8?B?TFg1UmgzQmxZbk9neWNhcUJkNUZsYmNNZC9va0p4amlyTmpIbmN5ODBNdXB0?=
 =?utf-8?B?bllubmVlL3k0UkszUXpGa2U2WlMwZXdpTkQxT043cmVWbmhNNEg4aUxNcFRs?=
 =?utf-8?B?NFlJeG9QU0RoRjlkdW04QU5nVWcwZmN2ZmZvOTk1emxvOG9xRURNaW1scTds?=
 =?utf-8?B?K0dYS3BKVFFia0I3RmVaSCtBdEpxZXJqWXN0Q1N4SExYTGNHS0pqR3Q5T1FC?=
 =?utf-8?B?S1lBSDlyVVhyZ2NlbkVrQ3JDbGY5YnZNMUJYSFdUVnJKYW1SMDlqVzFjMFpQ?=
 =?utf-8?B?byswQmx6QnRMRW44Y3h6SVhZeThqenRqY1hWLytVZFFZcmdITFVsYnZkSDBY?=
 =?utf-8?B?RUczTGp0OE9TY0RUOG01eDJpK01Ec3JVVC93d0NuZUxuc3dMbE9ERkI2ZEJB?=
 =?utf-8?B?a1lBNXJTUjA0NG1xc1V1QUVFOUhBWkt1RUM2NDU1bStLVUg2UU9RalFtNXFh?=
 =?utf-8?B?bVovTVVQUmhCcHY0QTVLUWNGUmpjUDg0RWQ2QktqbUh5anJSTjBPMnZXZkNj?=
 =?utf-8?B?Rzk1UE1OUVAwRUIvZ2oxMlNBZXQzRVA4ZEZBQzgzTlF5Y3lDSUthRHloWCtX?=
 =?utf-8?B?cnJpTUMvN0lWMUNEK2I1UGNFdVVLOTMxeDlpUlUzT1N6Zk5uaUUxNHgrNDhq?=
 =?utf-8?B?dlFlK05tSHNWQzE3ZlFPaDNTb2RBM0tHNFU1NTgvWDFsVWNUbnEzVGFrWlpU?=
 =?utf-8?B?Z1p5dnZnWmVFUDFSOFl3TDhDRCsxeXFjK3pPMkRDNVpOTG41ZkFvYU95Sll6?=
 =?utf-8?B?Q3AxY0V2S2huRUp3d1VXMUNEclBhUGY0R25ocUZWbkpGalRHMEN1TEEwbnox?=
 =?utf-8?B?VlNlbTZQMVY0eFJLOFZuaHZBQkdjMTZGbEtBaFFrdnoxOXFHeWZzM3pJaW93?=
 =?utf-8?B?Y25yNGM2SnpRTmFINmZyWWMrYVFuMFkxdCtCSTNraVNjYnBqM2dYUlhtVmFK?=
 =?utf-8?B?akJHVnlyUFdkQVBRSm1TYWxuay92aWIxa0M0eW5jK09VS3JVS1V3MlBBZjc1?=
 =?utf-8?B?eGJPc3BWbURLSzlUSzVCbHc1NUhaWGRnOFJJeHl5cjhranB6L1krV0VoQ01p?=
 =?utf-8?B?Y2gwOHUyTmhoN2w0Zy9FeHYzUC9rZGYxUEk1WTJpTkpyN0JmNkRneUNrMnY2?=
 =?utf-8?B?SXJQME04V1FqcDRBSWlqUGV6QzRWWDNHZDBDcHdML0IvaXZtSVV6VmZBT0Ns?=
 =?utf-8?B?czRtVXZCSlRLMVRUOFhiZWZSTjU0cnlVS3ZYd3A2ZTU1N1ZrL25maVljaU9i?=
 =?utf-8?Q?hTkcZajdwFkA1Jt8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a40a25-9c8a-4522-bf16-08de6a6275ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:13:44.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe51m8RXAa4Stu9WvNCT049hpJ54cL7QXJ6KIYYfvdhjNEtoLB6V0jlsCQdGqshzffEwg9nWswk54UXjKqOuve333iFpubU2cLWEluVopTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698e185c cx=c_pps
 a=6F5B6RZBoOcbxKr4+OQwLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Q4-j1AaZAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=6lWKW6hxWZQEX1MmPKkA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MSBTYWx0ZWRfX2+rwrYxT3UtS
 NF1/BAqRwiK+Jvm4O5poKrF1ZrF5IWIfAfp1uIwM/4cPVZHGJtin+eJVvzbBQctkhDJkgBr7+GC
 ce3v7Kw89+bmp3ZAQpppV3bUHyYP9vue3EMCorYWVNQF6r5PxBww4p/ImjEYB54nvkrdeVf/POq
 Ft9qRHaI1SDRoozNoNZTDEFqBD8g+zTNBjD8dGMKerDEmEfcaKTIlBkSCR+7JNAfkq7hYS9DMSX
 tVdfKtvar/GB93pD99U+OCLdMj+6xLcUOzzyuPkKUtkppAeCePGThK8GQ5nI34zbh7PKyc/2sST
 TtIeQbVQ2G8s6P8QS89t+mwbPwLftAlR+otnhKByf1/VgqIvuDPWNoP0POP7TVFqpNYTH8uUUXC
 yVLeV0ifrMXEY6C1WpTQBWGa+3CyrbQNfu8SsZ4/I0txEkXXbIw2DehCH4bxs5yuelRD6VSiJnh
 L+bolHThQs15t6XjnjQ==
X-Proofpoint-GUID: tCHIczffAszBGeXjN48IZ0JQz29piwKn
X-Proofpoint-ORIG-GUID: c_ejUwkB2wqy2PmId-C3rtsjs4XOafnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231071


On 2/4/2026 5:54 PM, Paul Barker wrote:
> On Wed, 2026-02-04 at 12:00 +0000, Paul Barker wrote:
>> On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via
>> lists.openembedded.org wrote:
>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>
>>> v5:
>>> - Regression in autobuilder with v4 series is due to applying v4 series together with following patch
>>>    "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
>>>    is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
>>> - Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install
>>>    rust standard library sources for rust-native.
>>>
>>> v4:
>>> - Resolved patchtest failures.
>>>
>>> v3:
>>> - Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
>>> - Extended support for on target rust kernel module developmet by installing Rust library sources and
>>>    introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
>>> - Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
>>>    that uses the Rust bootstrap tool to install Rust library sources for rust-native.
>>> - Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
>>> - Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
>>>    module recipes.
>>> - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
>>>    nativesdk, as it has been merged into oe-core.
>>>
>>> v2:
>>> - Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
>>> - Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
>>>    rust-kernel source to $kerneldir/build"
>>>
>>> [0] https://lists.openembedded.org/g/openembedded-core/message/228559
>>> [1] https://lists.openembedded.org/g/openembedded-core/message/228560
>>>
>>> v1:
>>> The previous series was RFC v4, "Enable Rust support for Linux kernel"
>>> (https://lists.openembedded.org/g/openembedded-core/message/226623).
>>>
>>> In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
>>> (https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.
>>>
>>> The current patch series is a unified version that combines both efforts.
>>> Compared to the earlier series, the main changes are:
>>>
>>> -Kernel configuration fragments have been moved to yocto-kernel-cache.
>>> -The kernel fragments have been removed from SRC_URI and from the files
>>>   directory previously stored underrecipes-kernel/linux/files.
>>> -Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
>>>   by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
>>>   instead of adding this directly in the linux-yocto recipe.
>>>
>>>
>>> This patch series introduces Rust support into the linux-yocto kernel recipe and
>>> related build infrastructure in the Yocto Project. The goal is to enable building
>>> the Linux kernel with Rust components and provide support for building kernel module
>>> which is written in rust and also provide support to build rust kernel modules in sdk.
>>>
>>> And this series adds test for Linux Rust sample and also added support
>>> for out-of-tree kernel module written in Rust as well as associated test.
>>>
>>> Summary of patches:
>>>
>>> - Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
>>> - Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
>>> - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
>>> - Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
>>> - Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
>>> - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
>>> - Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
>>> - Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
>>> - Patch 09: Added oe-selftest case for the Linux Rust sample.
>>> - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
>>> - patch 11: Export artifacts needed for out-of-tree Rust compilation
>>> - patch 12: Prepare out-of-tree rust module compilation
>>> - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton layer
>>> - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
>>> - patch 15: Added rust-out-of-tree selftest
>>>
>>> Patches have been build-tested successfully on:
>>> - qemuarm64
>>> - qemux86-64
>>>
>>> Benchmark test-result for x86-64:
>>> +-------------------------------+------------+-----------+-----------+-----------+
>>>> DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
>>> +-------------------------------+------------+-----------+-----------+-----------+
>>>> rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
>>>> rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
>>> +-------------------------------+------------+-----------+-----------+-----------+
>> We discussed these patches on Monday and have some feedback on the
>> design. Things are nearly correct, we do want to ensure that the user
>> experience is good before merging this though as people will quickly
>> start to depend on it.
>>
>> We think it would be better if Rust support was controlled by
>> KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impacts
>> the kernel and any kernel module recipes. It also may need to change
>> depending on MACHINE which makes it not a good fit for DISTRO_FEATURES -
>> e.g. one BSP may use an older LTS kernel with no required Rust code and
>> a different BSP may use a newer kernel and need a driver written in Rust
>> for the board to function.
>>
>> We should add a new module-rust.bbclass instead of extending
>> module.bbclass with conditional logic. This can be included by any
>> modules which use Rust and handle any common setup. It can also check
>> for the presence of required files (scripts/target.json & rust/*) in the
>> kernel's shared workdir, and perhaps the kernel config so that we can
>> give a sensible error message if they are missing. This means that
>> module-rust.bbclass doesn't need to check KERNEL_FEATURES for
>> rust-kernel, it can just look at the shared workdir (probably in
>> do_configure) to make sure that we're ready to build a Rust module.
> After I sent this, I spotted a patch for module.bbclass to check that
> CONFIG_MODULES is enabled [1]. Doing the same thing in a new
> module-rust.bbclass to check for CONFIG_RUST may be exactly what we
> need.
>
> [1]: https://lore.kernel.org/openembedded-core/20260204020908.864912-1-kai.kang@windriver.com/T/#u

Hi Paul,

I have incorporated the suggested changes and sent v6 of the series.

Thanks,
Harish

>> If we can't use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT
>> variable would work. In either case, this should only be checked in the
>> kernel recipe itself.
>>
>> Bruce - what do you think about KERNEL_FEATURES being used in this way?
>>
>> Best regards,
>>

