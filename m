Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AC5E9D401
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:19:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22855.1770218357580401311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YI98A1hp;
 spf=pass (domain: cherry.de, ip: 40.107.130.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygeoma7wJ8p+/Rfg7glNl2okkXX55dtLUR9LXw6PCVIhDC8iVVBBbCqoHL2wxooZxASLQKhkkFRJqEV/bnE5Ji5BY8jSEWPQwLfgItPXDPHdczTGJzYDNhlT3/vFr842JPJTX6EITwgzcVwsc6ZyU+eFKIRZxB4PIBIiPunfzq4Vr76KJ0wFfflTsvBe56bvxvmmriPKkhr5oRLLRNeCHIsdiecZyjFhkvWh/gtbuzlh52JAwT/UKaj/V6cLc0Tka7BGneOC2o87FzpNM3DpzztqldPzuPfghVk5MhC1FQXAQBlQv0FqCWG+S/vYSayLOy3CdkVMtTzQMBVkHkRzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8waPQD54BvNh++j7COC8BSkH1AIxkNw40WcnVfoiI4=;
 b=Zfiz4TLrqEYKg6Jp8vTvb3onXeVLSMv/ieg6JswVcFAzwxjzv2PkaOJtdzuWWxYFndBLZ+kML+swVJqiDeR8LvJbaiWb76josuOV6xtzp9zVLVht9dxQuezuJOHdZgmfXrF1lRdwmqxYEhC9/TchgXMLwXe/6wdKDf9JKMw9ZMJp583MeF+NkLFcTzUfcqokxZphvnLmhymXSezWO9pxTYc89HLUURL8Ij7AmPgRPlPF39CkX4QaRwie00QaksmtJIl9IJkk/xOCfCS8+3GrhiOfCnGbWvjfRdVRdTAAsbCsBVbEVeaQrQSRd+So9uugBYkEoYM/YIXcuFQhfQhBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8waPQD54BvNh++j7COC8BSkH1AIxkNw40WcnVfoiI4=;
 b=YI98A1hpKkF/jgM9FTMMFDAXIu2FvbDlERuaZuOkgFTtqPZAbXPIHWdV07zhaYQQLqKtCvOwRspUTMecp5VbXuEmsEzcA5Uix4PMKFKxWB2pW3dy8HMlsnVVbTDALC6bI/VAT7qMa2gw9OJg8MPPy3m78yDwWB1haeVh6uoXlm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by MRWPR04MB12071.eurprd04.prod.outlook.com (2603:10a6:501:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.17; Wed, 4 Feb
 2026 15:19:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:19:12 +0000
Message-ID: <c4196d57-6690-405f-9ecb-0d067fbcb6db@cherry.de>
Date: Wed, 4 Feb 2026 16:18:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
To: alex.kanavin@gmail.com, Pratik Farkase <pratik.farkase@est.tech>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
 <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
 <GV2P189MB3005D914A2CCB8FA282C3B44FE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|MRWPR04MB12071:EE_
X-MS-Office365-Filtering-Correlation-Id: b537a9dd-6358-4328-4206-08de6400c091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0F4ckJOVmRuellGeUZmZS90RDdqTFRLQU9rWnRuRHlRYkpOZlRubXdyUk5y?=
 =?utf-8?B?UU9GRXo5eXltdDdTS0NsM084VWFOL09ONFcxSmVYUWFVOGI2U3RPb3NxSHA2?=
 =?utf-8?B?WURtd29IVVBaWldvbmwwaE96c0w5UnNUckNBcVVpNFlnM1JoU0JGZkFrUkFq?=
 =?utf-8?B?NTZ6ekZFTE5GQTl3QTZocjJoN1U2RXpDcWNXVUFYbmhJa2hzR2NqU0VNcEtB?=
 =?utf-8?B?bXQ4aEJhMm1qSUk3TzhIQ1M1S1gxYVNoVVIraXhVYm9rLzhqVC82aWE4SEo3?=
 =?utf-8?B?ZjAyOTlITThkd0lDM2I2akxMQnFpRnFURFRTWkVRWmljS04wVE92OHJEZU9o?=
 =?utf-8?B?c29EZmZ0NFNhbmUzYkdCNzcyOGlSNGZhMTlneXZ1d3FyY2U3ME95R01lUjNt?=
 =?utf-8?B?Z08xL2JZcEs5M0RZVzNrQnBGcTBmcVBSYjFZbXp6eG95Y1dKNkJJeURXY0Ny?=
 =?utf-8?B?UVZUVkppME42bnNQMW9vNWNSdDY3RHFydGlidHJpbmE3MkRJUk9pUklNdkQ2?=
 =?utf-8?B?R2Qzbk9xRS8rczZjSzdscHVtTHBicFVwRmc2cU1DdllYYlZzdDAwS0JHUld5?=
 =?utf-8?B?blVUanV0RWc0dk1lWUQ4VjV5d0ZIdkVaU3ZuSkU3bW91MHdKT0ZQZ09OcU1x?=
 =?utf-8?B?Nm5aaVdpeFpSaENGT0p2a0F2ZWVaWTc4bmd2bFdMT25ReHo1TW16TWJaTjZF?=
 =?utf-8?B?WTErdlRjZDRuVXlIYmRrSldHaXZPTER3MThDa21lRzkrS0ZiUitBVHJwcmpL?=
 =?utf-8?B?RXlXZFB5cWhzdW9WMTVadm9WVTZOdG9GdzhFNGJ2SXdZOTBNV1AwanNLeDBt?=
 =?utf-8?B?RG4rUWI3QWpEMGV1Q0YvN3JKVmJxaWxLQkdKYUdZckUzY3RLSElHZWpVTzBR?=
 =?utf-8?B?eGtrZlZYeG10cEU3R08yMEVUSEg5a3N6WldGdnpUOGtMWStYRCtsUnBMR2Q0?=
 =?utf-8?B?Vmx4emJGVTNsY0tEbDhVT2s0N1V0a3puWnNnV25pN1RYZ1pIYWloVXNUOXcz?=
 =?utf-8?B?ZlBUd2xQSytMQmkxZ0ZMeHRrOW1kcmo0ZWcyaFg2UVpVZHBtMDdScDV5Q1A1?=
 =?utf-8?B?MENxcUd1ZW5jT3BRMTJVcXBqSWZnUmxmVWxpUjJRd1ZSbmhyMVlxSi8xVDBE?=
 =?utf-8?B?UmlzZnhwZlBqOVd6U2UydTZ6NUVabGJaZjRSVzlsRFZLQXowbU5EMTBlTWQx?=
 =?utf-8?B?OU16SXZFeUEyUzlUYnE1MElLb0NLVm91d25PVVpuSUg2WVJHZ2R6dTloaFl1?=
 =?utf-8?B?UGtBTWVUajdTMnVQWkVMeFhIWGpOeTBwdWM0bldsRS9XcjBLVnk0VG1EREtt?=
 =?utf-8?B?VldVWTNKK1A4WUlVazJQSzVvWHZ0RVZRL2UzRXpvcnFCUU1IR3dFYVhQekg5?=
 =?utf-8?B?b1ZFK3FNNU56dFhWKzNENzZOU2l0aytGMWRQY0pPcXZWN3FTaXZuMW43K0Zt?=
 =?utf-8?B?ZnMyaitDN0hsV0daS1A2QytIeGpHRVN1NEhMVExybjBncGh4YjBES1BtZVFx?=
 =?utf-8?B?QUdGUm5FR1hEWmNzY05talhocjkzbWdMd0pHeHJoYW55NzNWV2JSOTBNTVYy?=
 =?utf-8?B?alhXTkh2RzBYamN3aG9xYnIyaVFjUWF5OTYvWTMwZ2dWU3ZTZWFGeTV2dHQ0?=
 =?utf-8?B?eElEcnoyazdXMk5MY1o3V3pmZWNDdXFRTGE4OFE3TmdrbkVGTHpxUG9admtH?=
 =?utf-8?B?WmNobkFoOElML01KVUIyMktNVDJHdFBIN2tyWDhRKzUzbUcxbHVzckhzMjgx?=
 =?utf-8?B?S05CMUl6VVMvU2luTi9PWnpGaUJWT0VNMU91MjhERXNQQjJkNVlPSXcrM0tl?=
 =?utf-8?B?akpSUlhJSWErQkRaSVNrWVV2T2QvU2FkQnhIQk13MWxURTlSK3ZqWlc0NzY0?=
 =?utf-8?B?Nm1WOXJOdzlHWHVNTzJpaFozN0NYd2F6VG5ucUtHYnJqaWV4RmFRc21BZGRF?=
 =?utf-8?B?S3BUMXhDcmdSSWxJeXBSK3R0NnFDTThNeGdia3lUWXBZalQ4NkpSMklESHEw?=
 =?utf-8?B?bUtObG4ydmxaRFpXbFJJM0JpVGZnaktJbmR0VjdZdVlNVnREVXhjdXFxa3Jl?=
 =?utf-8?Q?rlsOxz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlF5Slhxd0poNVNocC9hYmpicDJUK3hUN29FQ2xpcjI3ZG1DaHFJYkxrQWVz?=
 =?utf-8?B?Y2VtQW84RkNtWkpOdHNGVklnQVJyK2oxUFNWUi9BU3BQZXJuVVR1TXdwNHdQ?=
 =?utf-8?B?WlBCRm1SWHlHekxqRXlPZjVESXhmUFBlTDJybFQrWlJuQkhGYlErcTFTTDVr?=
 =?utf-8?B?b3dpNGcya0x3dzNBQTFoVVVIVkN5aW5GcE1IRWkvUVZ3MHMveXB1MDJBL1lZ?=
 =?utf-8?B?Qms4b29wZXdiWXAzZTVlVEhCQjc5b1hGWDFqSUcwNDArcGZRRER1WHdqUWhy?=
 =?utf-8?B?a3NzcmZrb0lCeUpKdThPZUY0VkpNUXArOUZneS9UVEdDWmhxbi9kYXE5bG9k?=
 =?utf-8?B?bXNIc2FwUG5nSzdrWHgrZmU5L3FTVzQ0UHEvUDRucW8wcW16UHQ5dUZNeHlO?=
 =?utf-8?B?SGIxRXV5T0pPdVFRQytDRnJOSU90WTdIck1rS0gyUXB3WkMvb2diT1lic0R5?=
 =?utf-8?B?YkRBOWZGSEVTUExhWlVJckwxQ24xUmRXTEJXanNIUUZNSVpZNzFhSjRqU2lo?=
 =?utf-8?B?NDVuMWoybGwwMlpjNnhUYmJna3JNUzlyRzNPdXFYcHpKN0cwUFBUZFplSzNo?=
 =?utf-8?B?YVpnaFdDbUE5Qy9mWTN5bURORjl3eHI2SmM2cXEwYWJVanp0Qkxpajk1dk41?=
 =?utf-8?B?OHF4SlBIdThFWGJLT0tSazV1SWkrT3NNVjM3aTJ3TldRWFJPQjAvSlpwMElY?=
 =?utf-8?B?VS9pa0dIUFFteURpbFVDZ0ZlNXEyekJSMy9nOG9IZWczM2lkNDh0Y0J1ZFZW?=
 =?utf-8?B?OXk4bkxMK2VGZmUvb2pzSkdNSFVocEJ6SHRKQmU2bFF0SVBJaW1jUkhiMDVJ?=
 =?utf-8?B?UDE4SVU2MjlYcmFlS0x5dGpHVkZuNExlUytnaFprL0ROOTJvMWhpb1VtUmZM?=
 =?utf-8?B?ZHFyNjBmRFY5c3NXMGZrVExZUGJYR0E3UnMyTUtUYXU3dW1xT090U3hYbXVi?=
 =?utf-8?B?VTNjK0hleVU3TE9KTFFDd0l0YnZWRmNwcldZWnQweHNhV2tOSmJrSSt3NFhC?=
 =?utf-8?B?NENTWTNLOTlqVld4VHJqZjBGdmQ2aWNKOWE1bTBEUkQzbTd2Y04zNndCMUpq?=
 =?utf-8?B?bzRSMUQ0ZkVEMU50MU9ZUldhTkRXMHBlVC9xM3ZhMUpaZTczZGYyNnc2QUdn?=
 =?utf-8?B?SDl2M1dlU3Q0OU12eUxNRG14WWNxMERpZG5jbFZnQUNUWTZ4R3d1V29qeVhR?=
 =?utf-8?B?ZnQzNkpoNEVIVmgyOGsyYUlaN004Y3NVa0FQZUwwZGFLYjluWG40dVpjTTFk?=
 =?utf-8?B?dy9VeXNTNjZab0FOVjA3SWtsN1NvRU5oci9ONXZJY1ZyTzk4RmYwazgzT0NC?=
 =?utf-8?B?c2dPd1BPTjRTUy9vVjBTSWxoOVFJeDhudVZoeTF2ZXVVMTlBME5CNVpsM3VD?=
 =?utf-8?B?VlRIbWJBam1GNUJiN1ViSnRoZTRGZ25VTEhQdUNLaStKNjh2NG5vd25wMHcv?=
 =?utf-8?B?dzNCd2t6UnZIYU9GQ2JvSlRxakVYOGhWQTRlc1ZjbkhzVXovdU9XcE42UUNS?=
 =?utf-8?B?TGNmc2JBdGxmQmIxQTdlSXhaZjd2Q3ozeTF3TmJhRktIalA5emRHd2wxQ1hk?=
 =?utf-8?B?UlBJSDVyVEZMVThzVWhvdE1XNDROSTltV3JoQU1qODhJUUJUMUxnMlJCQ041?=
 =?utf-8?B?ZFBCNlp3N0lMSzBrNTZaWUdHM0NhcnNla0liRHN6M2ZsMjc2MHhDaHRzbXJl?=
 =?utf-8?B?bnM4WVJIMzF4a281VHFNZ0hHVHNuQ0ZNRGFxZnd6ZWVCTXh0T2Z2UmRsb0Yy?=
 =?utf-8?B?YTA5cjc2eTYzRjFHam5VWTJHdHBvRElYMTRlVGpnRWRqSkpZd2NESjJ1VXZ6?=
 =?utf-8?B?MmQ0R2tZMUQ5U0UyaFdYRmVZQ3VkRXpxVHplVWNIQ1lyRUh1S2w0cTlldy8z?=
 =?utf-8?B?UjRUeUNrcE1oYzdXZDl3SUo4dDV2VkZJQTRURzIzYU9MeEttOW5qQjBhQVpv?=
 =?utf-8?B?Sk5lOTh0NzgzU05obkI4OUcweE9MUTRjVkpzWWFLY0lZQ3lTbVpqcUtLOEVh?=
 =?utf-8?B?eTduL0p4ZmFSenAwWU9xcXFCYms4S1lTMCtaL3I3M3Z3WjM2a0ZTNEl2TEM1?=
 =?utf-8?B?Uk9vVVBhc3Q2ek90MlJEWUtNR0g0QTVrd3lXeGxhN3Z0ZHFDSEcwZndVdGVZ?=
 =?utf-8?B?Tys2a3Arb0c3THQ2K2JISkhpUmtxcHNTeWhLOGwwS0ZiempXWjVvcXFFZWlh?=
 =?utf-8?B?SEo4STZhL2NBMVk0eXlUU2htUnFxaFFIaUwxYnZsOG9vdVdBRjJ3alV4YUli?=
 =?utf-8?B?L0VaTW5uRW5jeWVLRmJ3SnhPLzFMcXNEc2tXbVB6N0J2SXJOaTBtdmlMWVlE?=
 =?utf-8?B?VDFCT1oxKzNVR3BBM3pmR2paODNkaUxuNU1SdmQwMGZtSDViRlNselFZZXc1?=
 =?utf-8?Q?BY5jHnyHZ/JNUDL0Gy+Ad90dseNXcpLNrEuau?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b537a9dd-6358-4328-4206-08de6400c091
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:19:12.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2nPjEm1euL5yusrntdAc55G3hlDVdbwpNA3I81kK9CZrtqhwB5BHguDBdxhHZOZveASB70217EvctYOTEW7vxy8fh6xQmFbcOGIuNxw+8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230546

Hi Alex,

On 2/4/26 4:14 PM, Alexander Kanavin via lists.openembedded.org wrote:
> I am struggling to see if there are any differences in v3 compared to
> v2 though. Can you point them out please?
> 

b4 may help you with that:

b4 diff -v 2 3 -- 
https://lore.kernel.org/openembedded-core/CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com/T/\#t

Cheers,
Quentin

