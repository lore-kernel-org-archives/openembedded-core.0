Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB62D31A06
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 02:16:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1712.1768356950837501346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 18:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NJbLfY4u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54747d19e8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E1d9Yj2378587
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xZRAtLIRDTpbfw3BLu3G/JRrvVBlKSZO8uJFvsj2GBo=; b=
	NJbLfY4u+kBZHQe2+mN2yrmeg4HW34ahdKd56IYfyuZR9urXiEUEmFqEqUmU5lx/
	FHOB3rzzUF/gg48kjYf9cCcHsaj/4kVJqUNVnwf8tCz2Nxdc6oWpXWHi0Wh0IKRJ
	LroPSLC3XZcQW30Ud4kO0rP4hwVJaiLcsXHvhwZz4PO1iWE0k5M6O4lng/cyDzrW
	C5X2lO37SxNLpwq5zCy4WnrKNqNQHwTli7/yHFtZvNnnK9uwt7zX2mvQYJDSODOF
	Q1XbTNSO2qvIhUtKkJnqvYo2DlT6GZhTy5SY2Cw+PF32AMoRQULqf/Co01ktRfIo
	qwvQVo51+cpBbVwqXv1ddA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2kwdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 02:15:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V96xpSPPAwSe4awqCSNVsc+xAobMy+wxotjo0oQXoP87AoBNUzW3SEnqQCnLd9hTGbWK5pySYKXu3RoTjXcaxQ6i689tJdncYpc8wph3fyUuKwEV3hKFbGFf2E5etazjVwOQ6/oA+xoYKCvHcYyxWdmpEojhhm/eZAuMvVXE0wJ/HeN+0auid7wvZAVmK88sFVfIKHO4cdouL5e+0f/pvXwIzVeRbTcSVNd00r7GcwJoCuX3mKtufqleFS1IROpuIhvI/cyAcesJ9E17ttYLpmxiui8B/49lR0efrJE1RH4zf1iUueZW4FDyPua19KocGq9AfPg0M4pX3eX2Ar6vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZRAtLIRDTpbfw3BLu3G/JRrvVBlKSZO8uJFvsj2GBo=;
 b=UuxKKKZwPz0l7DwPb9rcahXd+m3/eVYSuUPKna/toS39DYKYKwmWQX6k3RYMqr9hOPppQltbIMc0byiGHutiTMCcAiRjpKzJxP++akROcBkWECXoiSIYNzQaUCgAPmBfIKWgeOOB8h23IO6RioX0mt5VEYjdEVR8pEF9WOKHWJonmFLI6Fpm1YIB/lY7c3Sxa6aAXjrRBLDnQa4NItMw+8Csg2nsmKlCpsRTZAWkKvCJAaWBQWLIFpWeOTaaUvBjb5MDkOTHXsk3jzn2fP+s8/2qYYyL/pfFpf5s9NkLrgR+5uvkQ2y6Ukv1d0M/E8FxDB0oNNBQECOzSSRDdZv1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 02:15:46 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 02:15:46 +0000
Message-ID: <5b22574b-eef1-4d93-9fe8-de0d1e61dcee@windriver.com>
Date: Wed, 14 Jan 2026 10:15:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] webkitgtk: upgrade 2.50.0 -> 2.50.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de,
        mathieu.dubois-briand@bootlin.com
References: <20260113124504.961856-1-hongxu.jia@windriver.com>
 <20260113124504.961856-2-hongxu.jia@windriver.com>
 <CANNYZj9VBv_G3phFkW_mosnZ5hvzXxP4OJ=nJ3G_oExV+FtNrw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj9VBv_G3phFkW_mosnZ5hvzXxP4OJ=nJ3G_oExV+FtNrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fec3dd-29ab-496e-af50-08de5312d39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q1dXS1FwNzVLR3ROYUJHSWJLTXh4M3hWbzNjNUtBSnhJWWVMYXFacE50SXEr?=
 =?utf-8?B?eGxtR0FITzV1a3pDR29mSlNvQ3MvNC9XVjgzcFhlOW9ROXJldlBpQUhqenRq?=
 =?utf-8?B?UHBZai9ycVQzTVlmOVdXbXBIYjVoM3FQNlRJYjRENVVIVjl0dE1uUDlGRjVE?=
 =?utf-8?B?Tk5yaWkxaU9NbXlPbm5YTVJhU1F4ZXJ0Q3lVWG9EY2xwYllDUWZuQVF4S1pD?=
 =?utf-8?B?NWovTTNqcFFMSk5EMHNleGdWMndFS1ovTTRZV1VMd0twemx0cHVWREtwcDF6?=
 =?utf-8?B?elRkZDI5dlVnQ3BKaTFzZ1dteXRTWElpbWVZYlBJVk43TWVvdmx2S1NzRkZO?=
 =?utf-8?B?OWJZTE4xQnVaSCsvRFpKdDVlUithS1J4K0p5cGZXVjZQQXB6VVhNdTVHbFBH?=
 =?utf-8?B?dzI0c3h5OVZEUU9ML0JiZnAxUUpFQXFuQTJ4VXQ1YTJ4WG1mWURVdURGbXBr?=
 =?utf-8?B?QjE4WGd5cVFJaEZoUzhQd29qeVNVbmU2UnQ4WU5DOFpydUJnN2lpNGhwMitQ?=
 =?utf-8?B?L2F4WWtucXBkdVZERWdlenRDT1JlRkY3eVZwbzN5Q29Gb25VTEpCczRnS1di?=
 =?utf-8?B?STE2VkdVeVovNmU0RkVjc3BEMjZOS2cyZXBuZGUyWGRtbnVQbTZyMkxkdi9M?=
 =?utf-8?B?dm5xUVdoYWNERFhVOXFjREdZb0ttWWh3QnlmZmpvVFFGVHJvMGtvZXRVN0px?=
 =?utf-8?B?bkh5eTVRd3hJT2c1S0FGUEYwbys2dGNZNWNOajkxVUZjbmRvMjVCYWVqMDFW?=
 =?utf-8?B?THdTeUU0cXVVdEdycFlGTGl5Vllmd3NnZmFMZ2llWloyK1p6bHFoMkdlSVcz?=
 =?utf-8?B?WU14QTE3MUQweHRQZ1hDWkR6anp2RUtpbTBSK1E0SjByUHhVb09PazJNTFVN?=
 =?utf-8?B?U2tQUUlwNzh3ajVnOWZkTVVjK3FId0J3VG1NSFJoWjhPUlJwNjUvRTF0SGxv?=
 =?utf-8?B?d1hjeVdEMG5oTGE2YkF6TDJxb3NlOW4wdlRqV3ViQzE3RHV1MXVPa3NjbXdQ?=
 =?utf-8?B?S1g2THpiKzZlVmpxSUpnTTV1T3lPbzFRc241VmRKL1lPbWdwb0hPN2hXcEc0?=
 =?utf-8?B?b3QzYm80Z3lnWDQxaUNrcGlUY1RYRlNUNTNBY0JQUGloTTY3R2xpamE5eURN?=
 =?utf-8?B?aHZLYXE0aVVHdDE0czNPNlE4bWZRTWpWaWNhZm5lQ3JER01HeEhzU3p2UHpG?=
 =?utf-8?B?T3R5SXhTQ3l2YXRraFdlZ1VBMk1DcENBU0taWkx2SjA2WGptUU90cEhCNE1W?=
 =?utf-8?B?YTdzQVJ6SEhIc2lGWGU2MHVwLzhrWXg2Tnc3UjdpNHg2Ym5IZHRFZE5YS1pV?=
 =?utf-8?B?enR5eFdXV0RtM2hYVmlHN3o3ZTYxR2dGYUFpR0VRam16WmFXcmowUjlqTVFG?=
 =?utf-8?B?a3FUdjhpdmpxYlNnUW1tdkUzaGoxbmRaN1dQVjBPNjVHeUt1N1piWTZGWkdR?=
 =?utf-8?B?QmhoRnNSQ1U1NUVmSWFGazc4dTZBeGZHWXBpbWJTcWdVSFRnRitXdzJ0bzlH?=
 =?utf-8?B?dlNLOUlUSEVOMTJaZEVOdzhkZW1CV3pQM3U0L0ZxVy8xL29YUis5Vml5TlhG?=
 =?utf-8?B?WkFieVNVSUgybWpDeHgralpkR3I3SzRKL1lhcVE3ZHVoVTBlMnVCUXZuTXFV?=
 =?utf-8?B?UUlDbU50ZFpEeTRnVk9UM3BFbDZnc0lVcEpjMWpFNk4wdHFCV1dpd3I2dGJJ?=
 =?utf-8?B?Y3BFdEpMZjFIQjl4bE05azR5ZWhPQ1RwU0NjSW0wMWt4bGxGRFhVeDhjOFNk?=
 =?utf-8?B?bW9xZVBoZzVlUVB2QzlHam5qd2tYaGxVeTZxemNFa244UjlIeXFsR011Z0xN?=
 =?utf-8?B?ZEt3OXE3Z2Y3cDVTVVVTQ0FUZWtscEpZVmdnbEF6aTQxTW1lNXBGdWRSUE13?=
 =?utf-8?B?YVYwdGlqWjdxcHBzdHJ1Y0ZoRGNCZWE4U0c2MjlTbzB3cEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVVnMzB2Qlh5bkRSeUMxUzNKci9XQWRCOVBGRllVUHNEU292WVVaZWl6b1Bi?=
 =?utf-8?B?N0Q4ZTdDYlBGVEZqd1o3RktWTjExaTFndlVDZ3h5blM2UzhnV2lTQm85WnZU?=
 =?utf-8?B?WU8za2tNUFBiWkEwL1E1dGxDSFlENHl2ZEV6LzFBejlzMGwwbFVYR2JJcEFW?=
 =?utf-8?B?bGpQRlJuSTdFR2pyWFZGaWYwUTlrMW0vRzV0akhIWElMODJIVmd1R2QzSHpD?=
 =?utf-8?B?SnZLMyt3aEtLcVdBT2ZlSGJWQW80UDQ5UEk0eFA5Q0FuaEMvMWcyNHFKRjVj?=
 =?utf-8?B?L2NBWDdtTUhrWmxaSTZlYXVDZWtjRk9qNU94VWVuL3BzTUlKWlBsc0ticVpv?=
 =?utf-8?B?NGxHakkxREhVNjVlOWs4VDV5UXdneTVBUmdVVU1Zamx5dEJXWVI3b2lEYkxG?=
 =?utf-8?B?d1lERCtYSjRTU3gzTis0dDRIaHFSNW1DYVptMU9HM21heEl1c3BTdHB3c00z?=
 =?utf-8?B?dmtmMUZHR1BvZVZpRFdiaFoya2lRNkpYWFdQNUVJMG5sRG9uTUNQZCtyNTdI?=
 =?utf-8?B?N0w3MlRnSXBoU1d1V01KRURrRWsrckNua2FLdlpLcTJESlYydE9HemMveTEz?=
 =?utf-8?B?VjRuVjJhenRVKy9IMzRPMGpIclJaNnBYdno4WUxNdzhTUEROR2lNOHNlejJ1?=
 =?utf-8?B?Yi81dW1yWER6bWRIVDZZZmQ1ZGJVRkZINXhDeGN2UkY4b2NkQUhsbzdLTlFy?=
 =?utf-8?B?SXJ1K011WXdVeUhjckF6T3g5UkR5TUYzWS84OHdGaDROeHIzU0htN0wvSGoy?=
 =?utf-8?B?MVNLSktQRjNiUE5waTA3ZmtlRXVuaHpMMUdCNDQrOTlIQTlqODVMaklwYUcv?=
 =?utf-8?B?TkYvRjlRU3hpeHIrbkJ2NEFONW4zSzc1TGI1V0ZtUGZMTG5jNjd3a0MwN1Nz?=
 =?utf-8?B?L3JJTVpzZlNWWjVsR1BUbExoTGIrUDcrVGY0RWprWk45Q08zbDZsOWlQOTFF?=
 =?utf-8?B?MW4veUZRSGpoTTR2S0lraTRnbUZacjlIaUx4Q2FEZW9wMjc0MS9WSDVrQlFP?=
 =?utf-8?B?QnhDekNZTGNTOUx3bWtiZk80aUk3STdoYXRhRDN4RjVCWVBLSDF6NDRxd2hn?=
 =?utf-8?B?MHp1aFpOU2FjWlZaM2x1VkNET2hXbjNkMk5iV0U4R3ZxYTdlQm1HbHQrRGRz?=
 =?utf-8?B?cDBaSWllN0JlNTZURXBSQml1WlQ4V09kcG1kT0F6M1FKMkdEV2ZrelB3QlJv?=
 =?utf-8?B?ZFNheDdEUW9DZ25JUXpVY3BUQjNuMzE0Q08zZjVoTi8wVHJxcXZ2Yld2U015?=
 =?utf-8?B?THkwODlTVmlqVTRCOHpUU3hjRUNRcGIyNm8rNW9NbFFkeHJZTFNoYU1SUDhS?=
 =?utf-8?B?aElMSDE1dnVZdWFCRVNZUEV2aXJKY003dTdjYWM2bWlXOVhqNWt6bVJSbkhS?=
 =?utf-8?B?amlSM1NNWGlNMUs3NUp6c3pDTTErWm1tM05CS2o3R2RiRCtRQTVmd2Rmdjk2?=
 =?utf-8?B?OHlCZWRyMjZjVFhMVUJWUTdSeE1jeUxkck82MHlYMERvbnFmM2J1VllPWkJ5?=
 =?utf-8?B?dVIwOUdVRTdVdDdUeW9veEg3ZS9ud3RJeG01MW9sYzBDc1Z3dURrQlliVUYw?=
 =?utf-8?B?NnJJakZrTktoTjRZR3lNWVQvSGJ6YnFnRDdxWmdUY0pKN0FicVE1UjNrM2JV?=
 =?utf-8?B?STkyVzVERTRwTkdhQnoxejc3QW1UUmQ1anZUU0lhbUJxSlVZem8rd21MaGdl?=
 =?utf-8?B?cUhDczN0M3pHUGpaejg4cnBvaUlGbGQ0T3JET0dyZHc0RlZsZmZESThBM0dU?=
 =?utf-8?B?dHM5Q3ZEa21jY1lEQVFBY1pya216MS90NVJUS3I5NlkvY2pHeS9CaVJMWWpr?=
 =?utf-8?B?dWJIN0hhaWhBUE5Uc2JQM0FWeU9sZElvUzNwYSthZm9MREI5YUs3bi9XN0F4?=
 =?utf-8?B?OVdVcFBHYTltbktVY0xDcjlTa29Kd1FqdGV6YVR0RXdtSHJQRXpYcFVpeXcw?=
 =?utf-8?B?K1ZnZGE3VUxmNEdyc0Exdk5ORjlHdHZVMjRDOTlEczZaNlluYStuZWZvTTlh?=
 =?utf-8?B?UmNMcG8zRjc2V1BkUzhMV2FPSkcvbVZwcE5zYkovWjYvTGtKUmJiY1VxWEtO?=
 =?utf-8?B?ekwxa295NG1sOERaSWhueEZXU1psNU4xb2ExOWJYaUlKQ2d4VmhZaUtRS2t3?=
 =?utf-8?B?MnA5U291cnN4MWpiVGg3dEo4dFpqZ3hGQXh2K29vaHZGMzlGWi9WcjN3MmhG?=
 =?utf-8?B?QWgwYTJURXlucDNPOURCYjkxV293b0V5NWE0WWFpb2FxVElKT3RlalZLalcr?=
 =?utf-8?B?Wmt0MmE4T1BSTytQK0NMamNGcnNNclZZTm1DSTVlVDYzUVA1ZXNlZzdyL1VN?=
 =?utf-8?B?NlpGNmdnNDlPRktWS0lUVmZLQjhaR0p5RFhDVGdnL0FMSW93MDVqdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fec3dd-29ab-496e-af50-08de5312d39a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:15:46.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubdJEfjZ5O60h9clfclkp2Npx/OBtXj6azSAgxOwvWSirgg8NrgqEZT0FO1fuBj+9aqMLSef4czuvqfhU0U5YzJ41x+TDAFCYHq5FoABVhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: mK08zTA4x1TacSz_qhkqxRtw_6hWBYX5
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6966fc55 cx=c_pps
 a=56tib/hgGBcemyuyLZC9AQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=AsROf96hUzpKfm4K1loA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qDIHRbBkzRMv7sN8-vpvh0kTRRUQEawJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxNCBTYWx0ZWRfX9IYBZW6jxQE+
 trN9om6iNU91/+oOswYk3cHEn0VwIvSukloBf32X0mMQc+eL1ttstIYmXFtxuZpJgWwdXcSFWg4
 bdG13npogkbnyxVXCuYYLQVjYLaBXBRk/rOx1X0fmQOqqVmB/DexEI6F3EdoYSPx8xik/Z7fmoA
 c2F0Z41/IJzCazKUwHd1qZyByyQY/cTS/5HpCIXDlEJjB8/Uw807gjzB+T6gzpEMJ2vGc5NUAWg
 eM9aatXXis8JZdrRyHgirNDGmXsan/2Dx6ahma8Khy9Hm9X0O3Y4V6tkJOEx+h/misi9FLpaYom
 8/+IxAovZBAaqL/wlAIGN+jIRVJWRaivEl5cU07xB5+oXIYoLfrdcaARy/QTgbzvr6NzNkHBdKY
 +hatGUQqiFuhqz1JTikxX9HDmx1c9SZUG8ZCABh4oS0VjBIiE3JsQDk6kuF8Ci9l06kwekUHjWH
 EMezQReUDGK9WV4/18g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229301

On 1/13/26 23:25, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 13 Jan 2026 at 13:45, hongxu via lists.openembedded.org
> <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>> Drop backport fix-musl-compilation.patch which already exists
>> in 2.50.4
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>
>> - Fix compile failure on qemux86 [1] to
>> drop fix_op_instanceof_handler_for_32-bit_C-loop_build.patch,
>> which conflicts with upstream solution [2]
>>
>> - Fix compile failure on qemuriscv64
>> ...
>> Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71: error: cannot tail-call: tail call production failed
>>    810 |         DECLARE_STAGE(name, arg, [[clang::musttail]] return (*list.fn)(list, ctx, src, dst, \
>>        |                                                             ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>>    811 |                                                                        r, g, b, a, i))
>>        |                                                                        ~~~~~~~~~~~~~~
>> ...
>>
>> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2907
>> [2] https://github.com/WebKit/WebKit/commit/fcaa289f6015595a638eb96b9f728eaaa7b13ab8
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
>> +# error: cannot tail-call: tail call production failed
>> +CXXFLAGS:append:riscv64 = " -DSKCMS_HAS_MUSTTAIL=0"
> Thanks for completing the update. Perhaps this last risc-v tweak
> should be reported with an upstream ticket?

Sure, I will try it later

//Hongxu

> Alex



