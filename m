Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6354CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 18:14:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1488.1780078441882678139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 11:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ptCz+6vK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0609d6bc0d=quan.sun@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64THSTTH382441
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 18:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XbV2z7YKk0uAWoxmgUfhbBBier7xzUd6tUEcPuwXGmo=; b=
	ptCz+6vKdFPUJEn1sbytReyhOQ9LmCEa/gl4De8oRycmWbyQ59c8JOCsln7EsA3K
	wxCRckTdplF9qI4Vsm5m5pmaWbMtsVkafmbnC5nGVO6/Z75zllYwoGgFATZ1Fyzy
	o24svfVgqA0SMLDqN2dRdHtmU+11qVRiUckrnf9by6J7PiE9NPnhrURug/xPXBVn
	pmADlqg4a+Pmd/gizBQOEXPhUNTo2/Iw0Rf1vbL9aXUl301TcgxCYqtRK46P8D06
	cbFQ1UWUsvYFMflDjw/upANcp2YnR74H63oFf+zvbKE6R774OsF5p5+eXjvntQk7
	KYPU5cYTEAbWwhYtxDZjAw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8tvrc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 18:13:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN/HH5Nhk11J3j62wtWnJNztiYYCKseP6P+GVT3v/FyISqVOfp1wV1Vaa0HikwTToczvcLpcBCx+JvYvQCJh/7YxCM1vGUoGZXDEXMywna0ihnAnuMFC8jhXs6pjRYoCP1VVBZ77PRM1vWY03P4gE7GET+nooUior9+VGlsceQMUzJrxZqt9W93Nz6T76ULsDcz4j8tQV80ASrABhCPZTF1kw6sbYRfb5X6lizbozKjWvSagFFlxIosiIkaBJNKnCxTj9ZjVwbeWp+oJB6n2wOwv1j5kXbSmDyOW+Oe/X32LGOHmmZGYr3ni34YTcdbVGgLn1GPYsUDgPt+nRL26Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbV2z7YKk0uAWoxmgUfhbBBier7xzUd6tUEcPuwXGmo=;
 b=rhHY9xyNbv6gBHMnl7KSo1IT0/MCT3App1WHIwwJWWkjIGhl4qcdyTCZWofeR2Zsy0qTNKc+wrNFQjidSO38JbQJhuRROVftUNUHY1ajdSs7OH1LcHF4j9E9tKMT0tP/BgVjuFW38UKoAq3cB89Ph/fd1lEgTLOfMPhloa+h/ZDy1w+g/YVLUcCJWae4B7bXNohSIpQGNqGmPrP72/ARVBavI9EA/6vfCVTd4WiDOxkiIQWtWA2y08TzwGWh9Qr2TUyECzyVf613sw00pi6yk1jQP2FeUnhg1jPzebmkvQoG9smViV9aWAafpoOwlSevK+MA6cKkBVcbQvOtoB+p9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 18:13:57 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 18:13:57 +0000
Message-ID: <2b8473e9-931c-4a4d-92e5-f4c462650a5d@windriver.com>
Date: Fri, 29 May 2026 14:13:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
 <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <f43b9715-1735-4e16-96b7-963daa162c90@windriver.com>
 <CANNYZj-tR_2rPGBpkX_UymmaqpDpBvMs0dr1xBbn6vyJm5f2zA@mail.gmail.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <CANNYZj-tR_2rPGBpkX_UymmaqpDpBvMs0dr1xBbn6vyJm5f2zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::43) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|SA1PR11MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 518e365f-40f9-4a80-ef78-08debdae0cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|56012099006|6133799003|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zBCAseF42IdPHVa8igWvVIgxlWfaSL3SZC2OvR+h39Sojyd1NQ78RGq1ZXUUQh1fXPPqpPq3CCD8r1SHOZBjEP3sa9EqaLkfzrVsYyw/8UgPJ951Rb9gmMRU4AaS8O0JfhBKs3Tqf2hmzsVYx+umCrHIAAPON10+DHieO8MwKFji2+PYbQfzmilLkL4Ili9vNH9ouuDwEY8YGeZJ/+tvgWv3f/F+Zr/xiGpgiQKU+grKyYJo8c3+MlOZRA4IYwG0y796wLDXBMFeMz8QL+kP/ogaRv8v4iZSR/Cbjiz8xNh012fJv0NCetjEaL/liB+kfJJxardmzLSBoduPhzttvhd97uyIdHcCqfe4jX9oYOZcuM7PkXUTxoSPrK9edOIsnQM6INgyHStBT2WIZIlnTMPTcFh0/Uf+H8WDBKmjT2FLTyFktesyC6yKbCv6FR1ZuhKRT8ROaDYNtS8d7mChodh8Dt1gkJA3HEMZfd2Cnd4vQui7HSUIRmXNIVQoSc36QZS+q/VeFmMaZOPe/MVwftAUSh/ZjVdOu6ItscjuODPu5lYqa4axz8kF+ayTWVeKugzNTYHrcIru6BZ+7LXXubhFIRLqCQi8ww4ysWA0WSoEUDSw52liDV47cRLW3XWBF6pB5SreUpHvaR3UuU9QbgouIDISGl8lYkYc3Xsk3mbaJtGuOxgjfMQnxW78XqbYd0cB6DphDVDgs+5YPwIwkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3JFTFFnTjZGUXRsZFp6VjJReXBNUnlsNUQrdmhnWm9pU2ZQbE5YcVkxamlK?=
 =?utf-8?B?UlNxaWVCbTF5U1dSZjAvT1h5bWpOOWI1RlhDT0doRlVtLy8vdlpCbmtxcUVK?=
 =?utf-8?B?QUxHMUVtVUI2NEp4bGdjakpPd3Z2SU44NDhLL1QzOGZuWFFBVTZWQ3Exd0VO?=
 =?utf-8?B?MUYxTVVUU281eDBLTWpIRzlwa0k5Q295MHRzZ0xsRW5ESWdRbHArWWtFNFVJ?=
 =?utf-8?B?ZlJYbnQvU0FiWVllNHlQOFIyeWtianV1cGhXZTBOUVZwaE50Z0t6bTI4L08x?=
 =?utf-8?B?bkpicUZIRlFTbmtWMW84cmhrbnRwK2Rhcms5UnprcXZ4TkkzSjNXTFhYQnl5?=
 =?utf-8?B?aEtIVDNxZGVTMGJEYmEyeDk3VmVXU21keWd6SmlKcXhYTkl1RmJRV25EbURy?=
 =?utf-8?B?YXI5NUJRSFNJMHgzY2xsV2xiT0dKSkhhOENBemVMTHJiYktWYmxWUnJxMVly?=
 =?utf-8?B?TnhoSVF0ZG1LZTZXcVdhZi9TNDYrOGxCVURRSkZDMHVieHl5dEI1aHZqS00v?=
 =?utf-8?B?MmJEdC90eGQzekYvdVFuR3Jaam04eUU1UmN2TVRqYzhHZzdiUXpIYkFpczdo?=
 =?utf-8?B?TlBUbzRqcHFXWlI1N0pQVVdCcXR5S1ViL2RwYnp2RFh4ajFJN3BieEg1RWxC?=
 =?utf-8?B?TXdOV1A2bGhnbDlVWUNhR1B6UUNSb3lrVHZ0QTUvcUVvMmhUc2hlVnVNZm9R?=
 =?utf-8?B?V29rNWZOZzhxUFdlOWxkY0lpdFAzODF3UElDZktGN1NwYlpMK1JicFEwd3lV?=
 =?utf-8?B?QkZWalVvWGoxTnlPK1JDVWxud2tPTEMvN0REZys4REgySHI2RWxuZWx4a25u?=
 =?utf-8?B?TXZuY0Z6aTZvQnIrTm1PYVIzdk9sMGtmTm5OcVlSSzBHSGdBNnNIRlhnUWM5?=
 =?utf-8?B?V3kyRnFZY3E0cEtCVzJhWGpoMWNyUU1Yd3crWXRHbm5YTHI0WXJ2YVpQWWJF?=
 =?utf-8?B?YnA4dFphRitNekpvNXZPa2hndzFuWlk0TlJ1REg5QllTT0I5cG5hY3VJYnNT?=
 =?utf-8?B?VWg3TUxsWENuOWpiMGFZa2FFNjBETjAwNjA4dC96SHErazdjTUNqSmxoNjM2?=
 =?utf-8?B?WmRzK1h6NzVyQkZBMHl3R0xJWnVwWXNtdUdVRWZwM0huZ1Bpd21sWkN5cWVG?=
 =?utf-8?B?UEQ5WEVqczBZdXV2ejVjRFR5b0NQak9wT0xmQ1grMlBmU3lObktIdkpmU0VH?=
 =?utf-8?B?SFV0eUFEZVd2cXNJTkVhQ2Jkcnd1bXZQWFBWK0FUZmJ0NDFiZkZqeTZPY2xr?=
 =?utf-8?B?S2FKMXJ4TXVlSXlUZmtQR2RqUmp6YmFVL3BQZHlYWkcwT3YwNDNQT29PVHE1?=
 =?utf-8?B?MXl3QlN4Y2s4TDBFSkxTZmNNaXgyZDVKelV6TG9IQ01ISnhsMDk3OVMya2RW?=
 =?utf-8?B?MWIra3BXZEJxelZYWXRXK2lMbnBycVRBdzlqNzFDRTNuMlQ4bit0UXJYcExF?=
 =?utf-8?B?WjRPVXFta3MveW15UGR3Uy9UTmlrRjU5L1F4bGpsS3NKUmFMTmN0KzRneldU?=
 =?utf-8?B?eFk5OFBwSzJHYzMxNTRyaENJOEhyMGp6RzZaY1EyUXdEcXR4TmlTZU5FZjNV?=
 =?utf-8?B?L2xJRkJCTjlnUmN2QmFCZW1jcWFzbUhSNlViSHhPdkpZSG1HM2ZhbmRVN1RY?=
 =?utf-8?B?M2tPR2hXOWdHMWtyL2Y1NkNldUEyeGNoQ2N2UUtlbklzckZsMG9UMy9pdGRz?=
 =?utf-8?B?RDE3L0c4bE1WbUYrdHU4UHpwZjJWbitMaWgyb1k3Vm9XODdvWUhXWkxSMUhu?=
 =?utf-8?B?SEJEVWEzNHNvd1dYVExXdnNVN0NFQkJscTMvTHVHQjZGemY4WE1iKytXR2tM?=
 =?utf-8?B?YmZjMEtYRWJXVURzNEMzVnRLNlNOV3g5eFBzWXdqSit4ZGZRNXMrck1FUGtw?=
 =?utf-8?B?UVNhYUdmaGxKKzNDbGorOGlLVlJtdllSNEdNVzdiOEhEK2w1NFE3cThYRnFC?=
 =?utf-8?B?emM2VlprUmptdUcrc0dnVUxLaEpnek0zMlI4S2FuZDBhS3F3ZkZucDVSM1NV?=
 =?utf-8?B?K1ROSFVzZDNMcnA0R1NkUms0YVhja3Jzbm1URU5vZXBVNmZFVHF4NTQ1QlV0?=
 =?utf-8?B?aFlTSUluVmx3OUtMem82K0tPZDNyem1SN3Zlb0FZSWxMMVo2NmVEenhmeDVD?=
 =?utf-8?B?VUZYbGtVb0d1a2VrS0JEUjNZazYzRHhFL1REbFlzQnpsM3k0cVJBdHlQbTJr?=
 =?utf-8?B?TVYwTGpUbGNQYVFWcUExVVVwNi8wc0hDaDRnaFRxZ2RjUk05ZVZuUjliYU9V?=
 =?utf-8?B?NEM3ekF1Z1R1VlF1M3NQdEFaNURKNGp2cjdXbWF0Rllpc1FpVmxOSy9OczBh?=
 =?utf-8?B?WVdFSWxSMFdSRE8vbFBIaWlqTHdjdUR2RW5CMGo3VldCWWowNnUzQT09?=
X-Exchange-RoutingPolicyChecked: 
	oNSAnY2SdnxSvNklxG2OcDcoRSNcVLZ6msKiVUNSLwyEvI3Z8XdPNPBuCda4TgT39M8e1JCuTyV8aWDIQw5KokMDa2SLX13NLruVsL8VUJtg1M6OFEPiMAP88tujUjI2z095E2V9Puy3DNyo2mZdN3HFgCeQaYRyu8ku9/96z5MkxNKp9IIpG92GE9kKQ2xT9Dl9av1ezjxH6rJhGh5Ky0nVBkVD2Vmm/Lre+AGRtbUSe4KRMBaH/HEwgp+qFfoU6zJuaYMY5syu7+mbS3AEqM+QUKX6JXpqrFjmZtjarPp3gULjGxr3KdhfX0SY8MeYeacD/iKeHk8op4Xx+G5+AA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518e365f-40f9-4a80-ef78-08debdae0cd9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:13:57.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ93vQGFLJaOj31rJaZpYQyXvu2U5mQ+J+a9kVCNdpX+dADxwNJQTtEkwyyFofJxKXTDeqsexwi5Ls41JKtiLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Zm3YVL3NmQO28svtbmDkKB5Qqj2Q2y0k
X-Proofpoint-GUID: 7awV6DJeuoJw1w6HFDjjynI8PZR5Ua8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4MSBTYWx0ZWRfXwWsJhQMWZzgD
 lTfmWBxR+Xw26bEKT2RV1mYwBthB1ko07+uAWIFrmxHjlSTrrnIVLZ8hsu8mZedn5uq9eXkl3Rc
 LCONBTGmfwp2A0eyPCWYp5CARpQSC5SAxMhy0AtWUxSBKj2Tgw/YHW9O1OSMK4B+GQw3aaYeHJM
 bYGsVzaLV6wc5Obl17F+zfyPluVk5YwsmLa1UtHto696n6/KHJYH0+Nu3ssuZyFUOoPFVIfq7h7
 3zrIEnmIZNAv4NmkZ8Fyeemh00vwX7szrNvpVOJHmVXH9TQlWyzFRYwFTt+CfraYuA1je9OQXbX
 JMaoWgkyYUq8egaobbvgcl2x0Ct0eVvgzv+tsiFKxZ/xwYAqsUfUHW3ilDJtLWn+CLo6jeuCvtz
 fvl6bZW970IZiXi+DSr9DS+9Yp0otsJo/nn1W6lpJDeEvw9u8+u+mGBQH852y7sOAtJOuGjCDK3
 G9YdamG5ZbX2ZemOQiw==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a19d768 cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=1z7kNMUVIDmgN9zAtDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290181
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64THSTTH382441
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 18:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237772


On 5/29/26 1:18 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 29 May 2026 at 18:47, Quan Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
>> The QEMU 11.0 changed its GL display initialization sequence. On
>> headless build hosts (no  Wayland, no proper GPU), QEMU 10.x would
>> silently fall through and start, while QEMU 11.0 now probes more
>> aggressively:
>>
>> 1. Tries GLX/DRI3 =E2=86=92 fails (glx: failed to create dri3 screen, =
failed to
>> load driver: vgem)
>> 2. Tries Wayland/EGL =E2=86=92 crashes (the segfault in eglInitialize =
=E2=86=92
>> wl_proxy_create_wrapper)
>>
>> It's not a race =E2=80=94 it's a deterministic crash because QEMU 11.0=
's new
>> init path tries
>> to call into Wayland client code on a host where Wayland isn't running=
,
>> and that code
>> path hits a NULL pointer or invalid state in wl_proxy_create_wrapper.
>>
>> Still, the upgrade itself may be fine =E2=80=94 all actual QEMU
>> functionality works (685/686 tests pass). The single failure is in
>> test_testimage_virgl_gtk_sdl, which tests hardware-accelerated GL
>> rendering into a GTK
>> /SDL window =E2=80=94 something that doesn't work on headless CI hosts
>> regardless, and QEMU
>> 11.0 just crashes harder than 10.x did when it fails. The test itself
>> may be a candidate
>> for removal/rework.
> qemu 10.x does not crash, or silently fail, and it is able to open sdl
> and gtk windows even on headless hosts without GPU. Yocto CI is
> specifically set up to support it: it's runing Tiger VNC server that X
> clients (such as qemu) can connect to, and qemu is using mesa's
> llvmpipe renderer which does not require a physical GPU.
>
> Are you using AI to write out argumentation here as well, or are these
> your own thoughts? Please be clear about this. I'd be happy to correct
> you, but I would not want to spend too much time time correcting AI,
> because I don't think it is going to provide sudden helpful insights.
> To get to the bottom of it, someone needs to set up a gdb session and
> step through the code of 11.x and 10.x initializations, finding out
> why one falls through to the crashing wayland step, and the other does
> not. AI is not capable of doing that kind of reproducing the issue,
> and then debugging it, not yet at least.
>
> Alex

Hi Alex,

Because I haven't got much info when it failed, and through these email=20
exchanges I know more and more about what's happening - you guys know=20
more, although AI was used in analyzing some of the behaviors, I'm not=20
blind to trust it - sorry that it bothered you. But apparently QEMU 11.0=20
changed its GL initialization and now tries Wayland/EGL paths before (or=20
instead of) the GLX/X11 path that worked with 10.x. On these CI hosts=20
there's no Wayland, so it crashes when it shouldn't be probing Wayland=20
at all. We'll investigate why this is the case.

Thanks,

Quan



