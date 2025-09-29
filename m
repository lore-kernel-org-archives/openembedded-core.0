Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2014CAC5BB
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 03:03:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45542.1759114973497464489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 20:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sf5YMgSk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2367bb7401=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T1UZ3D3255993
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 20:02:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ltjt9O803Y2rSYn7KOPKc6C2wDFLNqMuELp3lIk861s=; b=
	sf5YMgSkCz6EOXHzW9MkDCJ4ZxNu75Z7cH+w68zgL+qSZ6/MI/rXc08FG9eqNnAi
	iUky0m/7sWFMYNq457Q3RLtGjq+KlNgsnoeaKclqPGT7A6SXRQ+djOr3IibD7aPT
	9MOg1oWuMdjhsczWeu7tsBU8SJtjFR24dlppK3c2Mkgl3oEuMtPcyOQkg0mtoeDs
	KOQZEJOGmaoiVLy9oYuibauobT6JCznaegw+tRCuZei9VPhCM+jCjGM3i31hrZwk
	axyskd00iDKXt28oqKNHEv1fo8AHyZUsHD6Ce3b0MGLeTNM5j/ccPtDLNleuS+au
	znfEKJiYLt9l0B9uixew/w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49efeg9575-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 20:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiQ/l7rlVUQGvzTr6cR8FifsIWhzBbi9Oo7DW4aZJttGN7b5ZUKLmrzvOZXQcYyzD8XJNUJ7ruNZ6HOPJfKFtd1u/1y0Xs/wJHSVfLpzaXa1A/U7e0W8Lt/uh7pzAzB5D27mNTT3/jCt+1uS0e8INlsjxjNtzI4j2Y+RzjpWMqPn1Neghya2xxsgg+P3VqbQ2AeBiwCSktjFsrumiUFCeZsSi8EaqOc/k+2lY/JuvpNpKtgwJfHX/biaaRvJGpco5KEdpleeq5g9bMF9GvOjAsw2hgAbAxEh+Jmy0SvzM9C0WTIVdTrDaFUN1eRachnNZMI6HU09D9MB8M5aiDGSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltjt9O803Y2rSYn7KOPKc6C2wDFLNqMuELp3lIk861s=;
 b=mLcDnHf8aOMZ8qgHm2C4I4JFHRLswwTDQFGjgDEKbij15W8vmZDtN1xRR+sDJW9WqZStfl9BQAqo+zx2WrSS0dvX8OTlendiSOPCp7NhGh79fYjnu92ZY6E9vJkO56eMkz8X/81gxLAtIercKqLVBE6BNUOGmwhOWnuUYwqhusQOJwm3BrvlPo62xSQcFlMdY1KVKSxfW93vrMqeu7uOJtcPe5JCEujJK5nKwXcNlMARQJGBmUhwnYlTiq2IkkMEzn3ogVOWdqY+uOEGqAEG7by0XtM5y7mPx1WpPRv2AvvDDLgkoIVysAYvei9tb206kCM5hk4s7DQVdG2Y8oLvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 03:02:51 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 03:02:51 +0000
Message-ID: <308f273f-41d5-4be9-bb42-34919517ae65@windriver.com>
Date: Mon, 29 Sep 2025 11:02:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
 <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
 <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: cfacee34-8daf-4df0-bd45-08ddff04acfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGdiT1lxMERENXZIb0ZhVUtpaklBMWtYREpyNVdyOHFZYUZnd2J1dzNzMERV?=
 =?utf-8?B?Ly9lNlF2VlZKS0Q0SXpUUlQ4SFJiZDdHZzBRaU13SzZTaVAvUEh4UjRCeUNJ?=
 =?utf-8?B?WEVGQ2xSWmEra0QwWVdhd0QxWkZ5OE9iYWszcVZSOUpsdzZaOW96cVFBaFRa?=
 =?utf-8?B?YmlDdnNGK1JkL0NMSmRsZVVqZ092SzQ3V2JjSFRnRjQrMUJwRTNQSmE4N3lV?=
 =?utf-8?B?dWk5ME1XV05qSDl5UUc0SUZ4VU41Nmx4WFFxVnpkeGVQbExiTHN6bXgxbks1?=
 =?utf-8?B?bHlSbWlMY3IyQm9SUWM3ZmVXWVEzempZVmZiVVJGTVkvUDdIaDdBcmVEWmRH?=
 =?utf-8?B?Rm1nVDdVem4ydmtQV25KKzNqcUFFelRQaFFhYUw5SWFqOUVqME1VUkdGQjAy?=
 =?utf-8?B?MzliWE1SWXlhRk9MQnhlRTlGdXc4NVo3UFg4SlN5WDJtMFhYSGpKamkzUTVR?=
 =?utf-8?B?QzNBY2xWMDkvZXI0RHNaQndYOEUzdTBVTHNTRldaUklFMnF6SndDWHp3SlhS?=
 =?utf-8?B?NTl0a0l4WTdaaWFBYWN6RFViWjdZY044WGZRQzF2dFY5Nmc5c1FkL3Z2Q3Mr?=
 =?utf-8?B?bWE3bFZkZUQ3UE5uSFlXYlMwdk85TWNSS05ZMHM0N1ljRjhrMDNiTU9rU2V0?=
 =?utf-8?B?TlYrUm9BRHBHNElNRCtZZXVydXdJRUtZeDNlZnNqWVB1b0hXNTUvSlpGVzZV?=
 =?utf-8?B?NmVEcXNPODVIZVdMbVowcmI3MWxVd2l6T2tnOGJ1VFlHaHFzS0RwL29tcVVr?=
 =?utf-8?B?STF6Y25tb3RsazU3Z1kxMkR3YlNGOFJzQ2MzcFlJQVJXNFdXVjhSbTl6Kzkx?=
 =?utf-8?B?YUkrbUtXbm1lU2NnTzYzL3kydmNOTHVWRnZpRnhiczhxZ1Jmeng4d0ZEMXg5?=
 =?utf-8?B?MlVUdmlrblVBNWk3UlBRbG5zRGNRUWQ0ZStYUlVTWFJjNCtRenhFcjBWWjVB?=
 =?utf-8?B?WWFQUURCbEtYS0hoMEVmZTZXbmJ6YTRPUW95aWVmcmFZZ2ZsT0JhRGFieTRJ?=
 =?utf-8?B?VlFnZ2RHNW5jU283enA5QWpWMXYyN3ZTQXRqOTdCclRnZFhKaWZrNHBVdTZK?=
 =?utf-8?B?dzZpejdJSFlzMVd4RFpPYy9EQmJTU250Wkt5NmxaT1NMUW52cXR1RnRvYW1S?=
 =?utf-8?B?S2ZzTEFBOEdrVmhHTkVnRjhmMkhodkZxQUVCVDBHcTRnUUJkVXBxcWlTRmhW?=
 =?utf-8?B?WmM3c2xnWS95MHJlZWxWU2w5SVBmL2YzUXcrOFBSa2pzdXpyalFSZllxWFk5?=
 =?utf-8?B?TXg3VHRlNUkrcWNKK2FwNnZDK3VJMXRTdm1SdmtobkxrUmJlRXhtSW05SHZ4?=
 =?utf-8?B?Vk5VUmtNWkN2Mnl2eEV2dlp2MWZSbDhWOXFuVEVpTWdUZ041d0FyTERMZFRy?=
 =?utf-8?B?S1dLK2JIS3RVQ3kyTE9tYjBTaVlKN0hybHNhWjJ6NktNM3pLS3hNVWJKQWVZ?=
 =?utf-8?B?bzF6YWJ6Ni9RSjArRWVUWEVNekk5UklkVmtUSnZ2R0dEUGlwOXFJWEQyenFC?=
 =?utf-8?B?d1QzLzZnNTN2TjdZYkZ1ZzZyY1hWVXNEQ3hnZHl0c2ZQY3BpZ09PVytaTVBF?=
 =?utf-8?B?UWNMWk1yRlRMSDlXbWNzNUdlcWVEeGdHTzREZHhkU0w5dkFQdGJzeXpFQjl6?=
 =?utf-8?B?STA2RFJvUXA3dlc5OGVrUVZXV1VZN3JmZVROL3lRUlRrQU9ocE5LbXc1dnRv?=
 =?utf-8?B?cnI0eGEwOWNuL0tpcmVBR3NNM25kUHhxVmZ1TTB2Z2V6bHVCQk15V2lKeGFG?=
 =?utf-8?B?T2NQT2FGbCtYd2JSQXA1N0FQQ01XdDYrV2M0YVlMMnFFdGp1RGkvREhGMENX?=
 =?utf-8?B?VUhNaFRuc09TczVHYmdUSTdQbGd5ajZ3NytNT05rNE9UTFUycWVESmpqVVVx?=
 =?utf-8?B?b2pCMWhZbVRXa0JaT1JnN2RZbEtIU1FCTGQ2MHhWQWQ3S0xudnR6aFM0NW01?=
 =?utf-8?Q?wWXl3hsURZ0WddJFsZ6GkKnwr24vBNCT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3VUSmVIQ0Z6MUtIdzVRaHU3TkNXWGlzbU9lREVKSWYrMzZ3OGRlNzhKNjRj?=
 =?utf-8?B?TmlZcm1wUHJuMXV2VmtqcFJNRk40NEtoUjdwc1VXcmE0ekp4M0VYK2creU1V?=
 =?utf-8?B?aTNGNUlmRTVMcUtXOXo0ZXF0VHdCWS8ycnhwU1VuVU93Rkd3RDY3VkM0Uk5p?=
 =?utf-8?B?K0ZsR2RPTmFieE1tOWxqTEZqU0E5b3RtWWZ1Wnpqc2haa3M4REp2Ky9UTnQ5?=
 =?utf-8?B?ampuWUFjSXZwaVZ3bWpoa2I5VmpQRzQ4Q2xsa0pOYWExcG1YUHJYelg4NEVz?=
 =?utf-8?B?Q2llTXY5UnkzemJuTmxKMHd3YS9aU29DNFFsLytsRm1Td3RVc1hLQytiZGhy?=
 =?utf-8?B?Z3BHcS8wS0k3K0VEWkxJanl5cVlwK2k0UVJERmVEVmtZSmFwV1lyUlkxWWp4?=
 =?utf-8?B?SVdqVWU2OVFGQzA2YXhpTUNPLzhGOWF1N1RqSUM1RzBjTFhuKzlLRzJORk9k?=
 =?utf-8?B?KzU1WjhyWXJQVXRpdkNrNGw2Tk5XQnNsbWtnNVVDWFE0WE9aaWJpbzZMWkxT?=
 =?utf-8?B?RElBM0VpMmVra3J5S08rQkZwMytXSUpuUEdTK0NyRG1md0lDTGZReGNZbnZk?=
 =?utf-8?B?aktwS0Z1cTlXYTFFdFphOCtwT0V6RS9ud2FUdWtCMUVhYU5aNkdZdTZSOUZW?=
 =?utf-8?B?eDdKWVMxcHpiNUw0dlJxZzAyTUNQUXU4SnlMN1VkWkpTN0ltMGxMQWlmVUNB?=
 =?utf-8?B?UW9hWWpWK2VGb0UxMm0xK0tZTGttQlNYeTZ1Rmh4Yy84dFVRYzFOc0Z2cThr?=
 =?utf-8?B?Z1lFZDM4b0t3TGRPemxoMC9FdnJUVklVSWhLUXlWOTVsOXhwWWVvOWlXR2dJ?=
 =?utf-8?B?Q0dKeGNLci9wSFUwL1BXSVlReVBPeTU2dTUxbTVXTTYyN25FTWw2Yk9ETldV?=
 =?utf-8?B?eTZGZjhKb3orWndsTGNsaTBrN2FLeFdJSE55Z1d2N0Nub3JIL0FkemQwdkdr?=
 =?utf-8?B?OHdxdSs1RndtZFd1U0Nwb0FpK1ZrUnVvaDIvSXBhQS81bCtxbzBtcXM4d0ox?=
 =?utf-8?B?eEZCeVcyQXgwNDIzM1FnTXR2bW5VeGxRa3kwZWtGYmpEOFZ4Rjc4ekMwQzZm?=
 =?utf-8?B?TjZTbVpIRjNSNmNoZkpab0tZRDY3U1dJc210QXAxYVlKUll5eTJDOUxzMWJ4?=
 =?utf-8?B?ZHN4dkVsanFWYU1qZjZUTWV0SW1KWUN3WFludUVyVjVsTzZJdXlOeDZhRHdI?=
 =?utf-8?B?VnZJY3dDNlU0M3cva0NaRjEwZnNYalV5N3R3V3JhZDJhYUtsTmFsa3N1dEhN?=
 =?utf-8?B?c0RsNTVOcEtTM0FYYkMwYUUwSkpyRlU3Y2twenljZHk5bCtrR1o3WlpoOSt3?=
 =?utf-8?B?RkVvSFVYUXkxMkwyVnNqWVVrWjRhWUtMWlhUa2c0QS9INFNCSzVrYnNiNjFY?=
 =?utf-8?B?eVZmM0VJUHV5MlY5dmowbnREdFpSMkxjeG1seEtlWmhkbFNoSDFENGhKQ05x?=
 =?utf-8?B?cDJ0RXdhNitZWWVqUVYxSVBlV3FxcHpoQXlUZmRUT3pnc3V2NFlLZGFyZzFI?=
 =?utf-8?B?VUhhMzBzT3hYOE9VdnZzUWF6YW1HN25rd25ITytIUkRNMUFoMDErMlJTOENp?=
 =?utf-8?B?OFNYb3V6cTR3a05oT1Q2azVjRThsMmswbVVQTmt0TVo5bUhlajJrdnNIWVpo?=
 =?utf-8?B?a3MwRzFyMDNYYXFrYnFIV3dxQ1hmMkFkQWpFTk0vSzB5cHY3b2FhZmdDMzhJ?=
 =?utf-8?B?ajFJRi9uU0l5alFCVVExSkc0Qmxtb2tDWHVuVWNYaXJoc05kOG4yVytFZ292?=
 =?utf-8?B?eXhVclpWcnlEcjZiR3cwZTE2MWg1bzFLMjhtbER6TkMvbGp2VHZlZnpHTEJo?=
 =?utf-8?B?Z2pYVExGcmVPZkdQYU9VVlQyNDhQcVFVOE5wQS9idUVndlFPODBoTEppQXp4?=
 =?utf-8?B?TjduT3JGeE9UVXVDREVxME41YkNQSFM2cnlsMUJsaGZYdWQ5Y3NBT0pQMTk0?=
 =?utf-8?B?YXhIa2R6K3NocGNSWW41ZnI0emFNWGVJNUNIUWh6cjFtTE1haEM3NnYzeXF1?=
 =?utf-8?B?NDFFTjhPZ3FvVHBSclEyckdvVExsZzlkSk9RK1l0dzc4R2pkOUZRLzVIM25T?=
 =?utf-8?B?Q1Vlb3Y3TTRPVDhuU2Q3Q1BBZDJXZExUR3F4YVk2MDBvWVRYbU5hMkxGK2FY?=
 =?utf-8?B?MDJYTXZ2Kzl5WCtoMUc0SVBWQTlaT3ZIWHNYUGtGTWpBOHZjZ2lpT2Q3OXE2?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfacee34-8daf-4df0-bd45-08ddff04acfb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 03:02:51.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTMLtLcSEWBuiYfHUTP5EbNAZ9ul5ZMP+snVJvt7uOBtl2K2+d/UNgNgmKDIS3dE6tQJvkgWQxcLaayPHEGmWgopKMTEjyv2ut0nIYu8aDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: _AQsOMnwhPd493DZv6d2hzR6g9oYv_Q_
X-Authority-Analysis: v=2.4 cv=aKr9aL9m c=1 sm=1 tr=0 ts=68d9f6dd cx=c_pps
 a=Kac4Oh/pgoirBk7HbaAweA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8
 a=oq9HTL2HZ-Ju5J5Y4lAA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lu-FzZcgD2B_SI1jV3XdT4y0YORoKlNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDAyNyBTYWx0ZWRfX7cp+rJt07BwK
 MysRshl+pWbWI42L/zasCzvDGAn1R2M/QyZQ7/pnWgfPIDBWRhtBjzGGY+OexTijwpUwnGWA5mO
 RR4tjvCp76fVGWmL0dtUdus9whDZWrFJt2Q4cS5u5Eq6szx55buVOzw5XI7BDF5blqqKdcjCy4H
 ecSq7sgqh+2k/pqerv5axQ9CVOZzfhJR3eiwzzbT+KGYZWSw2Rt79LHh6DlLQxbMU7yEKgKKCB+
 s70aGdhQw+O8XiY4ZwtxQSwfxuAoIv2gQ/wUq6FS0+9ZNg3QBcs4Pr6EPezcMkr5UHF9j5V++rj
 V0t4NQBMejnt/HF5UNr6eSCo9I4Cu/F4+ltmblZk5Ko7XgT5ae3+elcwcoqJzGZ4JUAOlZkpRSM
 /mxMwePNFG3JpUpFszKpbBUzVvyhQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509290027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 03:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224111


On 9/26/2025 4:27 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 26 Sept 2025 at 10:03, Haixiao Yan <haixiao.yan.cn@windriver.com> wrote:
>
>> Executing `make clean` deletes all existing .o and .d files from the OBJ
>> directories, ensuring that zlib is rebuilt from scratch and preventing
>> stale dependencies from causing build errors.
> Thanks for the explanation. The next question I had was why the
> standard clean mechanism that is usually triggered in do_configure()
> isn't working, and indeed I am seeing this in the recipe:
>
> do_configure() {
>          oe_runmake firmware="bios" clean
> }
> ...
>
> do_configure:class-target() {
>          # No need to do anything as we're mostly shipping the
> precompiled binaries
>          :
> }
>
> Should this second function be removed instead, so that the standard
> one takes over and does the cleaning?

Yes, It works by removing the second function, patch v2 sent.

Thanks,

Haixiao

>
> Alex

