Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6916CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 14:34:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48530.1757601274740432746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 07:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IbhBA/4d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134958df65=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B8GwJI2631441
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 14:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=X32/GteNjBk6feNvIyIXg/
	DItS1MZADa+WJknSwr2ws=; b=IbhBA/4dD4lLinS0bXERCH3WI5QNLzqOvaPREJ
	Ucdw+qbSkHmi8nO18CYPcrHVSMR/CtuUXTGx5OCfhFvh13ZS2w8UlKu93moPOXVk
	XBqFfUYZS88drSyCB44RBUlWahOoaLH+mlwyFRqqxrPtO6bw96xIi2uvOIQQ6DgQ
	VUtPzb9H5OAZSkKQHUi88w+1AV2KIbrIDX9Sq5iC6sbASfEupMOWZjlJc0UvaWXj
	npQsNBoClSBNt/e5hZzAM/+SgWRtadMfQ95GCfd5KauSQaPcKHHC4MKrZEshTZT1
	LRQCaAfiesAsQStTMdonEpXm3YTIZtqo0JL3BKTiC8skws4Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve34d7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:34:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmYikYofO+xNNezz2OuTdIekzF+2zjV2XJOqiqUSDZzK+MvoRaXkuT4rWT9kyqr155FiAMpT04LkFeqezgh0FquqMsVAWFh6QfZ00Sj8ra7u9FAIub+zoPnZxSdXe5Nz5GhmP08jtMuy24eha6DEOLzhJf654SXgIZ1FjcBKBV7pawxNYHstZ32s74Ar99p+LuM4FPAlNf+c5t3sL9rbn8OzRIyRQ89qeUks4iX5L+GIJjaiQqOfHndi9LYGG4Ki7gqYwAO/MZqdHkIayCHae2nGbxnOmyncwT69hbZilokRnhordr5knA+c9I4pe883z62D+W5mhHBYQ61xe/jY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X32/GteNjBk6feNvIyIXg/DItS1MZADa+WJknSwr2ws=;
 b=Jh7gQ24QFTZghZ7GUgCjXNEvXrfcz/Ui+EI5FvYZr1FoB40eHLuvSdwf5z2rYyiNV5n0mmeGeYi8qQjAg+xmk7ICYjiAzofY0M3ROn0e9umwT5s3Xvgcd+zACvzhPRv9QP9l2z1xQsCiC4LBnp3e9gR8kuqZzaPfG+gHNzAHt63z+PDxPwXaKnE2kMDvTQoxkihT3tLaI76q/zujmmWRAuTOpiUTTGBH/Gccg2A/OIflt5EWkkU728T/V28BOR5SPUOobIR+zttqrlt7LwxGi+exFPg80/WPeAx8ayfLyIXu+zfm8+iJ072rFVHWVZCpXvNR1YclYf5BrLRLHLa6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:34:29 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:34:28 +0000
Content-Type: multipart/alternative;
 boundary="------------inBZOSyfE6006a86bAuPu056"
Message-ID: <9be69885-8838-4aa3-a17a-1698c957f72f@windriver.com>
Date: Thu, 11 Sep 2025 20:04:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clang: drop obsolete patch D144514
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250911115835.1885519-1-sunilkumar.dora@windriver.com>
 <CAMKF1srSVUXocCkkGUW6F0uou2NOY+2xABJo2QSP_iPdfO=3xg@mail.gmail.com>
Content-Language: en-US
From: Sunil Kumar Dora <sunilkumar.dora@windriver.com>
In-Reply-To: <CAMKF1srSVUXocCkkGUW6F0uou2NOY+2xABJo2QSP_iPdfO=3xg@mail.gmail.com>
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: c2138ec5-b215-4bbb-fad7-08ddf1405008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejBidkY0V3JtUS95K01iZ25RQloyMVR4clhzQmE4SjJ5N1VHTTVka2E2dGpn?=
 =?utf-8?B?c0FmSDBCYzcyNzJvdVJPT2t0Ui9DQzM0MlhSNDE1WUVwb0RKRUh5MFpoNUdw?=
 =?utf-8?B?eUIwU1NYU1poYi8xR3M2TTVDNGR2MXc2ZDllNkE5QjdHamJ0MEYvWXd1YWR4?=
 =?utf-8?B?WEp4Z2JBYzZneDFnSkhiTHA5S05VaVlpaDRnTFMrVXZ3YUZtaFBvYkNKM2gx?=
 =?utf-8?B?R2I0cGhnUFAvYlFxOGVDVTcxRk9DMGF3UUJZd1Ftd0JiN2kzR3lWTFdqajFa?=
 =?utf-8?B?b0dSc0tLRFRETGhOYTQ2VE11Wit3ZE44V29aME9qcXR0a0Z6clM1eWt6R1hv?=
 =?utf-8?B?NFRra01JcjRJTFhEYVFXTE5DanNBZVJJbnhDNS9BOGVXSm1RTGhHY3JJY3Z0?=
 =?utf-8?B?Ly9sRE5iUHZBRW1LZHdPZ1FhSnV6dkxZbGxOWkVYRk14WWVLMlloKzVLSExp?=
 =?utf-8?B?RUNUci9DMGUzY0phaU1WczliQnNWRDhRVFlRQUpXTlFRYXE2QWpHYlA2ZGF0?=
 =?utf-8?B?NHF1QWZCRlB4TTRwdlpmMmJYSjFUUzdtKzMrc0FPei9FVXdKOWhIaFVXblN3?=
 =?utf-8?B?Nm9DYTIvekJjUUdGc1o5K3V1NC95SURCNTVxeGYwNG9WTU9rVjBEa2lrYXpm?=
 =?utf-8?B?R1BaUVJHdVdoY1pLYXpubkcwVmRLRHBYeGJnb2JydFJ6cnY3NmI5c1RLaE1W?=
 =?utf-8?B?N2xkNkhnb05XZkNiS2JtODRBdnlxYk1mb0ZyN0krelBKNDVWUktqVHFIWmZ5?=
 =?utf-8?B?OVh5cDc5dGwzY1N1c1dwUk9IbVpWOGUrNDdtcW1xcHVGNHBNS0FiR0ZnR2J1?=
 =?utf-8?B?aVZMZHI5aFhaMlBFL2JRZkZ2Q3BFMU5aMkV3eDh2N1BOOUJuNjhZaEdNcU55?=
 =?utf-8?B?bXZPUVF0ZXdGQm1GV0YyeVo3ckt2bmVrU3hqRnRmMEhNNHFyVXg0bVgwbHBx?=
 =?utf-8?B?WDJSUTRwYjFFNkoxZjUxRGtrc1lhRXBHU3BWNnVJVnVtUE40QW9XSjVwU25v?=
 =?utf-8?B?VmN4TXQyM3lTdGx6aEozU29SSDA4N2EzZklUNW85RVV2RHgyemdZTUR1Z1dO?=
 =?utf-8?B?dm81cFl0M0JHZG8xSmJhSUhJcUVucE81R1NhbEpPK1l5MHlQZmtUaVYzVk9J?=
 =?utf-8?B?R2xBNWV2MVpsWm5uU0tyQTJsMlBxMjBkUTdtSzdTcFBpcmZXeTZhQThsd0NO?=
 =?utf-8?B?Znc2QTFzSWZGN2lrNFQ5NTdCY1BiOVRYbHdaK0ZZamRiTGRQOStQblBzajVr?=
 =?utf-8?B?bjRMS0Y5L3orZThsZ1RLcDlUbHcvcC9nQTZva2Jsc3haUTBPYkpRdU1DTTlu?=
 =?utf-8?B?cXFSUmlYSFBjS3k3RG9GTlk1cXNhQ0s5SnJDOVRLemNZNEh0RUMxQnFhVU00?=
 =?utf-8?B?K3lWL21ZSzlaNlZ4SmtNZ1lnVnljSllUL0NvS1JGb3dvS2dpbGNrQVBGSTlo?=
 =?utf-8?B?aXBVK1VqSC8rY21mSlg1UUZnRjlsZHhvTWkyYll2d1Z5Nm5ITGMzNVdINU8w?=
 =?utf-8?B?NTNmMkhIeUtSS040V1F1RkVKUzJ4TlhqcGFhZlhZUDBGbkNqNUFNR2RlTHJF?=
 =?utf-8?B?byt6cFFpWkJRYnZWY0lSTzNlcytiZDl5NTZTNUFtRlhhdVA1YmxBMWRVcXJW?=
 =?utf-8?B?R1FNYzgrVTVtUmdqYStQdklSSUY1MzNiejZ6TWZmTjJUenpxcE1oWVQ0UlJv?=
 =?utf-8?B?a1BmV09nQXhrZDhuRUNZMktDcUlSbTdHR3VGYVByWmFrZkhoTUdLUU9zcExV?=
 =?utf-8?B?VG5NY01NR3o5RlpoWHRpZnV0UWxKclI0TzhIMjNYR1c2OFZCQUkzdUFHamIw?=
 =?utf-8?Q?8y8kRsauDkjsimYVWP7ThTSo+HOybx2BXbHTo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUZlWnE1OEJhWTdzNmIraGlWUUdkSXN0NlRQU1pKRzd5ZFk2blR6cnV4OHBl?=
 =?utf-8?B?VExCeVVQZXhXSnRVMEFzdnU3Q3lEUTVIWkd0eWpnQnFlbFY2a3p3M1pSRFN0?=
 =?utf-8?B?UVNjcnVFWWxQR0VkeUg0MkppZnRXTmxLU3lNT3RCcVI1SW82Tk1IY2NSZGMz?=
 =?utf-8?B?THI3aGREdmlKQzRoc3NFNHJnTG1VbjZyYzIxQ1EvRDBSY2MxNG5YOHlNSlpr?=
 =?utf-8?B?R250TUFGaVF4RWhzZytzZVV2bFJWL00wY1F1dENsVGR1MVRkMjkraW1tQmpr?=
 =?utf-8?B?aXIyOW5VUXA1d0pxOE03OHRzNGFyaThhL3M4R25YRlorbE9lWUsyYmw1MUcz?=
 =?utf-8?B?aWFMazdsWGVCeTNUeHY5TTV5V0p4SHVhQmhsZS8vNWNFNkhLbG5QRGtwcEVC?=
 =?utf-8?B?UXdRMHVRb1NhT1dsODVGMGpqRmRyUUtHUUpWZnZPdGVqajBpbEEyY3lPeE1t?=
 =?utf-8?B?Zjd4dXRab0tBQ3VSOWFlc3R2b0o1WjJyUExtRUl5Y01GTkM3VnBuK0w5Zytw?=
 =?utf-8?B?c1dCdWM1eUtaNU1GQWNuWm5NcjI1ZXNEOHAvUnp3eUJjeERhYnBFR2QvWWMz?=
 =?utf-8?B?NGg1MGpZMGMxaUF4OXd1NENVcFRrbnZEck5RS29pWXk0ZnVTb0lzLzhJZjIw?=
 =?utf-8?B?M3pmaFpzdEgxTzYrQVd4RVY2cCtlS1FoNWRJZXc3RERFcDRGZ0ZZK2s4cklV?=
 =?utf-8?B?eldtZi9lK0M1MjZrUzltS0xMSTJ2S0duTnNQcSt1RTlCMUxJekYvbGxvbUJt?=
 =?utf-8?B?d3pydjgvM3dmZUgwQzU1VGd1K25yRUxwcnAxd3ZlYm1IMC92Z3FOQ0p2WFdQ?=
 =?utf-8?B?VU5ISzhzTjRjYjRlMVRXbUhCK2JzS2k0ckJjQjBNNitGVUpJSVkwTVhPRlNV?=
 =?utf-8?B?VVVPdFZWQ3g2SFlCd2xFZytCN2l0aTN4NStZaUkwT2dzTVo4M25INWhnMEdD?=
 =?utf-8?B?UXBucDRkWkZVdmU1Q3VadFNrVzFCSkhNc09mOEIrdG9UNFFIb1RBSWwrSDIx?=
 =?utf-8?B?cTVha0lIT3A2L2VEQUJ0MnQ4TFA5cFZQUDZZTEVjL1QxYU1CNmhRVFhydjNJ?=
 =?utf-8?B?WXlmYmloRkhic1dZelNHUU5vV3hPSVRlVGtTUmdTN2xwNWlwdFByNkVIL1RN?=
 =?utf-8?B?QzY0ei9pUG1QbzV3SGxUV01UbGZhbDIraFJKM3BvQUZJUE5NODI5REpJWlFp?=
 =?utf-8?B?NTFFNERFSVFRcXZxd0JGM2hzY0o4Q1M5UmxkeVhmRGg3cTc3a2pzTXhWSEQv?=
 =?utf-8?B?R0V3Mzl6Smw5Ty85Y2NMa3Y3VGR2YW43L0dKTlZvQ0tDZk1FaC9qYURYeUtH?=
 =?utf-8?B?d3RFL2J6czJHcmJZTFJacDZVM0hTTmZ5TnBYVHRmSzZWQ3VZN3dERkN1ZWZF?=
 =?utf-8?B?TFhObUFRS0k5aWloSXAranNmOVR3bDhJVE1rT3JUdnhpcHJaMnE5TjZGVk1K?=
 =?utf-8?B?aG5USW9jNWNsU1NMTFIybnpIRDZqbDZtWThOejE4YUVXT2JiMEwweEpITHBt?=
 =?utf-8?B?K2xMK25LREZ3eGV0YXhlck1QYVljL3prdXhiZ2tCZWZIL2VDN1I3QnVXTU15?=
 =?utf-8?B?SXo2SWk4aG9kcVVLNWZHYmUwNUQyUlNmZWJOOVFseElRZ2p6UytNZlVqUVhy?=
 =?utf-8?B?Y0ZGRTBQVlJwa3VqTmtyWGc5dlI2NjVwVXh1TTJrYlJRaGp2bU9zYkVISVBt?=
 =?utf-8?B?b1VLRXlNWU9GM1lPb0t4SkowZFNxaWdES1BBSzA5RTErc0VFbGtnZk5IUGxJ?=
 =?utf-8?B?ckxNc3J1NjZ4RFBydy9jM2VmWXpqR1Q1Mm9jQW9yZllVWjN1WDRPSkgrSlFV?=
 =?utf-8?B?MmtTcmlBRjl3cHBzbGIyd08rWlRSNFBqWHEvNHRuVVZUc0VkaEFDdmQ5SjVE?=
 =?utf-8?B?cVBUTHVMVG5vaFdwWUVYdU8rOUd2YWxxNzFMdEMrMWlieDlqQkU5N3h1OVdo?=
 =?utf-8?B?dW13MmF4d0wzNFNlbm1uRG1PcWVWTEM4a1JuSzRQZXFsOEtCM3BhV3ZzWTMy?=
 =?utf-8?B?T0lFMDNSNnV2L0VIdnl3aE40RTh2djYwRHJyMEk5MVRhQWVBTzVBYXF2NjZX?=
 =?utf-8?B?UnBEUnJjNXhwUTRodHg3UWJVRlNaZnpZakVhNkhVMkpjWnd5Z3RwWGFvSXFv?=
 =?utf-8?B?OXdiazUxRFZGcVlBRFBrZFFPU2hOUk9GV0lkUkcxZEQ5cjF1Q2duSHhucC9p?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2138ec5-b215-4bbb-fad7-08ddf1405008
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 14:34:28.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KhozD13G1nt9bCXEA4rXOwoD7oFOW2Nqs7VZYSb9Xr8+aYmJdCMuRnNc7eKb6low2Aqvi358LTBf2xO5vKDXhG1alUA/FjjwYBoXi/hZHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: INKRPhAyv2uHvarrDxWDN2IuZWbo2qot
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c2ddf9 cx=c_pps
 a=mTK3PmBKiS78iTy2M0NrJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=WyE4uyG4AAAA:8
 a=Twlkf-z8AAAA:8 a=L8c3rYF_AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=h6O7vShWVjrsc-Hy-gsA:9 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-IFqn2O1uhhDEchphYAA:9
 a=_V-uWoK_Q08DoX9x:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=JrsmBnAlpufYS2blrE39:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=fIG3WuezDERHtS0lkNdW:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vQFU16tWUFhDxVxMQW7d21YPKfZdV-1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyOCBTYWx0ZWRfX7bdNHRUc2V1c
 ykUen3bcGLjocvsNdW/BwWcm53qwaBuB+2NaYPpoH7x/bbcuAU3wgAsSggsd3mQInxyhWfRhX6o
 Dhtz1s75YCUUiOSD8OtvbKXy3/BR7gf4N3J047jhoLaguu+m02KcWe/28yWz2jvp3f0wzT8bPVf
 dTIj7RDs+1RGkCnINPZCyOL96vv93timA83verpnlw2tWdL7Sey4bUpAjylHfmMoamF9rxVGc6f
 WvboQ2b+lNHFkM55GV6p35CQ0jvN4ky1Tng7KHgS9uigNdYJTHBIu3l29IuDxlB1q1t9O4An6Oc
 980B12/w/dS7syEaW9/mGDvHvD8IfABqwHUwaE+etrws9Tu4jjvSCqg+PVBj8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 14:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223281

--------------inBZOSyfE6006a86bAuPu056
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58B8GwJI2631441


On 9/11/2025 7:56 PM, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On Thu, Sep 11, 2025 at 4:59=E2=80=AFAM <sunilkumar.dora@windriver.com>=
 wrote:
>
>     From: Sunil Dora <sunilkumar.dora@windriver.com>
>
>     The upstream fix for the TIMEBITS=3D64 error was committed in LLVM
>     D140812 (commit 26800a2) in sanitizer_platform_limits_posix.cpp,
>     which addresses the issue for Linux builds.
>
>     Our patch D144514 (#undef TIMEBITS in sanitizer_platform.h) is no
>     longer needed. Testing compiler-rt-sanitizers for arm32 also
>     succeeded without this patch, confirming it is safe to drop.
>
>
> This is already squashed into 21.1.1 upgrade patch
Thank you for pointing this out. I had missed the upstream commit.
>
>
>
>     Upstream fix:
>     https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e9=
90dd5cca41c45e1a9
>     <https://urldefense.com/v3/__https://github.com/llvm/llvm-project/c=
ommit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9__;!!AjveYdw8EvQ!eH7j8lFciV=
tBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALlFnT=
hCUo$>
>
>     Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>     ---
>     =C2=A0...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43
>     -------------------
>     =C2=A0meta/recipes-devtools/clang/common.inc
>     <https://urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j=
8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5vi=
ALl54Mv2h0$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -
>     =C2=A02 files changed, 44 deletions(-)
>     =C2=A0delete mode 100644
>     meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS=
-along-with-_FILE_OFFSET.patch
>
>     diff --git
>     a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BI=
TS-along-with-_FILE_OFFSET.patch
>     b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BI=
TS-along-with-_FILE_OFFSET.patch
>     deleted file mode 100644
>     index e129aa245d..0000000000
>     ---
>     a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BI=
TS-along-with-_FILE_OFFSET.patch
>     +++ /dev/null
>     @@ -1,43 +0,0 @@
>     -From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00
>     2001
>     -From: Khem Raj <raj.khem@gmail.com>
>     -Date: Tue, 21 Feb 2023 12:46:10 -0800
>     -Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with
>     _FILE_OFFSET_BITS in
>     - sanitizers
>     -
>     -On 32bit systems using 64bit time_t build fails because
>     -_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to=
 64
>     -
>     -Fixes
>     -In file included from
>     compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris.cpp:17:
>     -In file included from
>     compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:
>     -In file included from /usr/include/features.h:393:
>     -/usr/include/features-time64.h:26:5: error: "_TIME_BITS=3D64 is
>     allowed only with _FILE_OFFSET_BITS=3D64"
>     -=C2=A0 =C2=A0 ^
>     -1 error generated.
>     -
>     -Upstream-Status: Submitted [https://reviews.llvm.org/D144514
>     <https://urldefense.com/v3/__https://reviews.llvm.org/D144514__;!!A=
jveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexD=
XqJIPJXbC63Z5viALlIvqlFpA$>]
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     ----
>     - compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++=
++
>     - 1 file changed, 9 insertions(+)
>     -
>     -diff --git
>     a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
>     b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
>     -index 57966403c92a..efa83f30eca0 100644
>     ---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
>     -+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
>     -@@ -22,6 +22,15 @@
>     - // function declarations into a .S file which doesn't compile.
>     - // https://crbug.com/1162741
>     <https://urldefense.com/v3/__https://crbug.com/1162741__;!!AjveYdw8=
EvQ!eH7j8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJX=
bC63Z5viALlPH0CaKY$>
>     - #if __has_include(<features.h>) && !defined(__ANDROID__)
>     -+// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
>     -+// sanitizer_procmaps_solaris.cpp. This is problematic on glibc
>     systems with
>     -+// 32-bit architectures using 64-bit time_t and users passing
>     _TIME_BITS=3D64
>     -+// from build environment, therefore both _FILE_OFFSET_BITS and
>     _TIME_BITS
>     -+// need to be undefined together since features.h will check for
>     both being 64
>     -+// if one is set to 64.
>     -+#=C2=A0 if !defined(_FILE_OFFSET_BITS)
>     -+#=C2=A0 =C2=A0 undef _TIME_BITS
>     -+#=C2=A0 endif
>     - #=C2=A0 include <features.h>
>     - #endif
>     -
>     diff --git a/meta/recipes-devtools/clang/common.inc
>     <https://urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j=
8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5vi=
ALl54Mv2h0$>
>     b/meta/recipes-devtools/clang/common.inc
>     <https://urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j=
8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5vi=
ALl54Mv2h0$>
>     index cbcc4feded..9f8daad9f1 100644
>     --- a/meta/recipes-devtools/clang/common.inc
>     <https://urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j=
8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5vi=
ALl54Mv2h0$>
>     +++ b/meta/recipes-devtools/clang/common.inc
>     <https://urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j=
8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5vi=
ALl54Mv2h0$>
>     @@ -46,7 +46,6 @@ SRC_URI =3D "\
>     file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
>     file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
>     file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
>     -
>     file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.pa=
tch
>     \
>     file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patc=
h \
>     file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch=
 \
>     file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch =
\
>     --=20
>     2.49.0
>
--------------inBZOSyfE6006a86bAuPu056
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58B8GwJI2631441

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/11/2025 7:56 PM, Khem Raj wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srSVUXocCkkGUW6F0uou2NOY+=
2xABJo2QSP_iPdfO=3D3xg@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div><br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 11, 2025 at
              4:59=E2=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windr=
iver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">sunilk=
umar.dora@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
              From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@wind=
river.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">sunilkumar.dora@windriver.com</a>&gt;<br>
              <br>
              The upstream fix for the TIMEBITS=3D64 error was committed
              in LLVM<br>
              D140812 (commit 26800a2) in
              sanitizer_platform_limits_posix.cpp,<br>
              which addresses the issue for Linux builds.<br>
              <br>
              Our patch D144514 (#undef TIMEBITS in
              sanitizer_platform.h) is no<br>
              longer needed. Testing compiler-rt-sanitizers for arm32
              also<br>
              succeeded without this patch, confirming it is safe to
              drop.</blockquote>
            <div dir=3D"auto"><br>
            </div>
            <div dir=3D"auto">This is already squashed into 21.1.1 upgrad=
e
              patch&nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    Thank you for pointing this out. I had missed the upstream commit.
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srSVUXocCkkGUW6F0uou2NOY+=
2xABJo2QSP_iPdfO=3D3xg@mail.gmail.com">
      <div>
        <div>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"auto"><br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
              <br>
              <br>
              Upstream fix:<br>
              <a href=3D"https://urldefense.com/v3/__https://github.com/l=
lvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9__;!!Ajve=
Ydw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJ=
IPJXbC63Z5viALlFnThCUo$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">https://github.com/llvm/llvm-project/commit/26800a2c7e7996d=
c773b4e990dd5cca41c45e1a9</a><br>
              <br>
              Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.=
dora@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">sunilkumar.dora@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43
              -------------------<br>
              &nbsp;meta/recipes-devtools/clang/<a href=3D"https://urldef=
ense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqh=
g2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALl54Mv2h0$" moz-do-n=
ot-send=3D"true">common.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 -<br=
>
              &nbsp;2 files changed, 44 deletions(-)<br>
              &nbsp;delete mode 100644
meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along=
-with-_FILE_OFFSET.patch<br>
              <br>
              diff --git
a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch
b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch<br>
              deleted file mode 100644<br>
              index e129aa245d..0000000000<br>
              ---
a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-alo=
ng-with-_FILE_OFFSET.patch<br>
              +++ /dev/null<br>
              @@ -1,43 +0,0 @@<br>
              -From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17
              00:00:00 2001<br>
              -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"=
>raj.khem@gmail.com</a>&gt;<br>
              -Date: Tue, 21 Feb 2023 12:46:10 -0800<br>
              -Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with
              _FILE_OFFSET_BITS in<br>
              - sanitizers<br>
              -<br>
              -On 32bit systems using 64bit time_t build fails because<br=
>
              -_FILE_OFFSET_BITS is undefined here but _TIME_BITS is
              still set to 64<br>
              -<br>
              -Fixes<br>
              -In file included from
              compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris=
.cpp:17:<br>
              -In file included from
              compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:<b=
r>
              -In file included from /usr/include/features.h:393:<br>
              -/usr/include/features-time64.h:26:5: error:
              &quot;_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BIT=
S=3D64&quot;<br>
              -&nbsp; &nbsp; ^<br>
              -1 error generated.<br>
              -<br>
              -Upstream-Status: Submitted [<a href=3D"https://urldefense.=
com/v3/__https://reviews.llvm.org/D144514__;!!AjveYdw8EvQ!eH7j8lFciVtBqvB=
rcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALlIvqlFpA$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://r=
eviews.llvm.org/D144514</a>]<br>
              -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">raj.khem@gmail.com</a>&gt;<br>
              ----<br>
              - compiler-rt/lib/sanitizer_common/sanitizer_platform.h |
              9 +++++++++<br>
              - 1 file changed, 9 insertions(+)<br>
              -<br>
              -diff --git
              a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
              b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
              -index 57966403c92a..efa83f30eca0 100644<br>
              ----
              a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
              -+++
              b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h<br>
              -@@ -22,6 +22,15 @@<br>
              - // function declarations into a .S file which doesn't
              compile.<br>
              - // <a href=3D"https://urldefense.com/v3/__https://crbug.c=
om/1162741__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqhg2-u8hxvOdA-U0Nwk7r6h=
HDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALlPH0CaKY$" rel=3D"noreferrer" target=3D"=
_blank" moz-do-not-send=3D"true">
                https://crbug.com/1162741</a><br>
              - #if __has_include(&lt;features.h&gt;) &amp;&amp;
              !defined(__ANDROID__)<br>
              -+// Some sources undefine _FILE_OFFSET_BITS deliberately
              e.g.<br>
              -+// sanitizer_procmaps_solaris.cpp. This is problematic
              on glibc systems with<br>
              -+// 32-bit architectures using 64-bit time_t and users
              passing _TIME_BITS=3D64<br>
              -+// from build environment, therefore both
              _FILE_OFFSET_BITS and _TIME_BITS<br>
              -+// need to be undefined together since features.h will
              check for both being 64<br>
              -+// if one is set to 64.<br>
              -+#&nbsp; if !defined(_FILE_OFFSET_BITS)<br>
              -+#&nbsp; &nbsp; undef _TIME_BITS<br>
              -+#&nbsp; endif<br>
              - #&nbsp; include &lt;features.h&gt;<br>
              - #endif<br>
              - <br>
              diff --git a/meta/recipes-devtools/clang/<a href=3D"https:/=
/urldefense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcv=
yjLNTqhg2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALl54Mv2h0$" m=
oz-do-not-send=3D"true">common.inc</a>
              b/meta/recipes-devtools/clang/<a href=3D"https://urldefense=
.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqhg2-u=
8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALl54Mv2h0$" moz-do-not-s=
end=3D"true">common.inc</a><br>
              index cbcc4feded..9f8daad9f1 100644<br>
              --- a/meta/recipes-devtools/clang/<a href=3D"https://urldef=
ense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqh=
g2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALl54Mv2h0$" moz-do-n=
ot-send=3D"true">common.inc</a><br>
              +++ b/meta/recipes-devtools/clang/<a href=3D"https://urldef=
ense.com/v3/__http://common.inc__;!!AjveYdw8EvQ!eH7j8lFciVtBqvBrcvyjLNTqh=
g2-u8hxvOdA-U0Nwk7r6hHDXmFOkNZ5A_aexDXqJIPJXbC63Z5viALl54Mv2h0$" moz-do-n=
ot-send=3D"true">common.inc</a><br>
              @@ -46,7 +46,6 @@ SRC_URI =3D &quot;\<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
3-compiler-rt-Enable-__int128-for-ppc32.patch">file://0023-compiler-rt-En=
able-__int128-for-ppc32.patch</a> \<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
4-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch">file://0024-llvm-D=
o-not-use-cmake-infra-to-detect-libzstd.patch</a>
              \<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
5-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch">file://0025-compi=
ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch</a>
              \<br>
              -&nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0026-comp=
iler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch">file://0026-compi=
ler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch</a>
              \<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
7-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch">file://0027-T=
oolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch</a>
              \<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
8-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch">file://0028-cl=
ang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch</a>
              \<br>
              &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://002=
9-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch">file://0029-llv=
m-Add-libunwind.pc.in-and-llvm-config-scripts.patch</a>
              \<br>
              -- <br>
              2.49.0<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------inBZOSyfE6006a86bAuPu056--

