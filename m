Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75737E9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:40:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8615.1771407589306767638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 01:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J3W0m+tb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9HKVZ1361619
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 01:39:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Rakw3ix/TC4xAVJfEZKaFr2PbFnjUqiZ0T0FxD/TcVw=; b=J3W0m+tbAKcb
	5X00kWouuaKR5TciU94s7tFcArlHOaEZPJ977yEYsjDz4BzgXDKavY9MIf33vPru
	DYuI+PnFfh6UhNJcKn7jdobAq72FtxMyEx56N3O8m8hN2WIJS4o9OMzi1MWCovwp
	HNqQDzSnVXPBKgW1Jl+8NHlCWqYuwtGRT4nMRQ0crprOQXMjOvRM1z3zyNL2DzZi
	QdtjNRgtR5Q7MUafp6+1zh4j+sHq1bthhFIevBha2tslEBlfK5i7OlPF9Saq8sQi
	bixiI58xBTxh+LLC0+M0741n8CS66v3x+9Kf4d8IQnrZ9MQnHw4xzr9jFHC0dn5G
	yU6tWEwtXQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbam229s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 01:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAPHWqxn8G38qTtTHrc2tzB75E/GTfC0wPK1RaY4CYTun2OOg3LoAi6FQkvm0zNLOvwXecYKVEKfpbEzHXsoTGB5kpXR6cBYUf6TMEp2tGgZNtOvsYXXRPx7m/06W/EUUx09sROGu9Udq9oQ0QFCNg+20YRNYwWuVdD1XGyv4bk50ywZTs59WHT3irzmsKdQhzNEpX5l8Wly0ZaDca0NYRppGQpj3XMG/B2pwjFpgFXjyCiXSdTRAlzjaRZ7D04i35gqpEwjvZgD8tDoCzzFFQ5jKh0SEbHvXbdlBZ+vxAvT8FRY03Kym5sGZpiAD68Ov14xkfcGOuWld2m3KjB8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rakw3ix/TC4xAVJfEZKaFr2PbFnjUqiZ0T0FxD/TcVw=;
 b=jmM7/OY4a1azqSfsAjPjoJs3j3uDnEY4KyusADcqrcm6ev357xRFnQsEA9sOaM3hjek/WXC2qxdJ+s/OOKdR2nRq7cm7fT/6CsdTG1Q3UglT+O1l5sMo2i/LVxeDp4R6e9KvC+VxCeM2sFcEspManq/riPzwUFMn0Ho2bDZAxxcFyhsKfiM2RfKG+SiSpi6yCkX09F4kQWo7O9WmHySLqXcuPxQUFdE2moslMedw2Q9F/zd+XkNTD8jMxxfbdb5oCmI7g2RDhp0Az8yhVO1gtLTBC3W3fxn80nFFWhXVEyHJBTWgSXcQqeS+EBHIQHaxgNve7ZvpjDyAgox0r3XxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:39:46 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 09:39:46 +0000
Message-ID: <1584f3c8-2e31-430e-a84b-0d734bcd5136@windriver.com>
Date: Wed, 18 Feb 2026 17:39:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1770779786.git.liezhi.yang@windriver.com>
 <c68679d7733198d00209107564aeba2d4fc7301e.1770779786.git.liezhi.yang@windriver.com>
 <DGCRSK0PMVJ1.8YL67O3XYVR7@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGCRSK0PMVJ1.8YL67O3XYVR7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5738a3-5755-4ff8-37af-08de6ed1a6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rm1wNEQ2dUcxTC95WWtyZmhkV29MMitGQnpqQk50UVJmQVV4Qkk0WGd3Sk5k?=
 =?utf-8?B?bW9OY21oTHpvKzE1MUE2ZXp2aEVtQkJHcXM5QitjWjZLeWdZLzNmUFZEMDZD?=
 =?utf-8?B?QWNPVWYwYkc0UkMzdmpPbkl2MWgwcjd6VExEYTBoYjB6NXNSVmVST0FzQUhh?=
 =?utf-8?B?QkphdVpvZlJMUGM3N1FmNjd1WDJzdnc3SlYrVXpBRU52bDNBOHhJMWV4c0V4?=
 =?utf-8?B?VkVQUUc1bjl5dW4wYVdmdGFiT0hiM2NjK0ZwcUVoWDR0UlVENlJRTG1ra0F3?=
 =?utf-8?B?d2hQc0lIWUhlajJqRFhJNERBZ0hMZ3VXZE1OS2tzNWtla3c4Qi8yVFFkMEN2?=
 =?utf-8?B?clUyaXVnZEc1TkkxNFA2VW1GTmxMMmsxTCtTQWVPaTRWUUpadlNaN2JDbU15?=
 =?utf-8?B?KzdtQ3NwTXp4SEZYNjZSM1R2ZTNsMGJHOTJuTlkzOCtyY2U4c3BHZklnMkEr?=
 =?utf-8?B?L2FYdERzdzRFRldBWkhUd1NrY3BNUWV6eFRicGxzKys4ZnVSSmlubytkZS8w?=
 =?utf-8?B?eVIxNkhncENJRVZDVUU4UmxlU1RlVWZ3aDRlRUNBektvak00SXhWSTZKazVE?=
 =?utf-8?B?cE9YUFJhaVpMYkNsZXV1d3dJV0E0UTBiNmdZK1JCOHcwdDVBUnVnVzRHcjF3?=
 =?utf-8?B?Vk51QlZkZlovMlJXb0c5VCtqSWVHSHJWaFFiVkZTR2g1RW12dUdxYXFKR2F1?=
 =?utf-8?B?c3h3RXc0SHRXM2wwRXFlWEwzMGR3TkFpTWpDS0RrdVFVNW1lQVJKbEgyVkJv?=
 =?utf-8?B?dWJiS2tGNmVlYmtoL3M1TVlRNlBZWTNENHdjb1ErYktnRUwvMHV0eU1WMGll?=
 =?utf-8?B?bGptbHZXWmxzUkQrS2dDaXhJUnFRVFIxRkMxd0ErYzlpNWlPbXppUUFmdFpQ?=
 =?utf-8?B?S1pYYzRaQ0JLYUZJYjVsc1ZzY3J0UExTd3JiZzFDWVM4UnZGUjV5N2svZ2N6?=
 =?utf-8?B?SWRLRFJUMGNZeGZqbG1KQ0xVdHBLVXoxeS9UeVBWYms4Ulkyb2VnQVlPd1A3?=
 =?utf-8?B?WGsxa29nRWRDSU5EVy9uU1NDamlMMEd3eE1saXJOSmtoWDA4dytPbGZmN0lW?=
 =?utf-8?B?VFl2eTRDc1ZRUmdOQlFpNXI0ZkRSZndKSkc1RUxENlVYKzZqR3VHY0tUUzJ3?=
 =?utf-8?B?ZHZGMEF2OUsxZzl1WmlPZVJNSEMza3cyYmM2RC9NTmFZRzB4bVBsWkNKcTR0?=
 =?utf-8?B?M1RiY2VSUFZZY2pIdXhXZ0k2QThIU0JIN1FXQS9vVEJDRk1LaENuWU5YQmZO?=
 =?utf-8?B?YUd0UlZKZUowcWNBMVlkaDNwZDdSd093LzBmNWZBMlc4SEtBU2ljTzVscktX?=
 =?utf-8?B?T0s1STlTL29PYUVRY0tud1JmQmU3SjFGV0RmMW1vSFVzcDJxV0swK29FZkdM?=
 =?utf-8?B?T1pUNndMRlZ3MlYwMkVCaENtdDl6TDlmOUFuWUVlZFY1cGVRTnVxQkZXblpt?=
 =?utf-8?B?M1g0U3RJRmRoSTFDNGtCNVRiTFZzTyszUzNkazlyeHV4OTUxSy9OMTFrNlpI?=
 =?utf-8?B?ZXZJZDZlUDdxaU9XSnhPaHZDRUd6Y001RlhTY0FKQks5dzhLNmhIVnV2azRN?=
 =?utf-8?B?NzVJMllicFo0SVB1MklYbXdhdzVVVG4rNVIzWml0cUY2SjE2N3N6blpZYzFw?=
 =?utf-8?B?V0JOOXBvd1duT0hPMnA1cCtueXViTjJxZW1kcmxvcFhsY0lWZ0F2aXYzbDVo?=
 =?utf-8?B?NTdkUjdkRFhIQStGSVU3ZzloVElSTFgzYjNjblU4NlBxN1QvYkljYW9IS0NB?=
 =?utf-8?B?eXNKTW1xTERLRzdvSC9mRHJ5SHFQQ29RTVFBdCtlaitidUM4UStuQkJIbHlz?=
 =?utf-8?B?aCt0b1RQVkRCSkt2SjRDeTBwc0k2OEtPQnYveHo5VTBmbERQRzVDWTBtTGRH?=
 =?utf-8?B?eVcvUEFIb0djM1hqbnhiYTBhUjVWZzVrOEVuVDBwSlpYTHFBS2FySUNVZFNG?=
 =?utf-8?B?TWtTckswcWM3U2ZTaTFQSU1RS3JTdnRibGdkR2t2U0NsWGRkQjF2dHBWemY5?=
 =?utf-8?B?UUJTQ2psYlpRNWNnWktUVVVqMVppeFBwR2hhNVVDUmVVczRhMkxmb1VrUFBQ?=
 =?utf-8?Q?eyJbDa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUQ3UFVSVGQyUzlwRkY1N2RtV2hmZ0N6UmZSQmFHTm1PcnlESGNPZms2LzY2?=
 =?utf-8?B?Wll0YzYvTmN4bkp1S0Y1T3dpdXMwYm0rWFJEc0V6Y2ZjN0tIY0FmbWhid1Rq?=
 =?utf-8?B?YkJMQnQ0OGMrcWJXR0ppdUZmV0krdHlrbGpJcE5nVjQ0dGxDWTdjNFdqblli?=
 =?utf-8?B?VXlDV0YxMitSNUc3QkNtcHFBT0cyTXpmUXJjdGtZemtQdWJxZ2VzNmhDSUQz?=
 =?utf-8?B?MEZhaEZ3a3JZOWwzd0NuMUJ2SlNzNjRFb2hvSlhEazlVWG94NHFLR3pjb2Vx?=
 =?utf-8?B?SGlzaktKVHM1OWNKVEVsczdCeEZXbEQraDhtOTNmQ3ArdmZuelB2MkwvaHJQ?=
 =?utf-8?B?U2JYMUVHc2IySHlEMlg0SkVHakdWQzhEZ0xWRmlDMW5ySDcrcHYzaHpQSGN1?=
 =?utf-8?B?V0RYTmJUcGQ3L2p6RGdsNkVTUHB3UXMrSkJLTVdpblVROVQ2LzZVY2UwZEN2?=
 =?utf-8?B?TFpGeko5ZzdJaGVqWTBYckZwZlllWFg5Y3IzVEtTL0xHT0NFVUZ5ajJSQVZw?=
 =?utf-8?B?TTBHZkF4MzY4Vnkva1BrbnpFZ3MrTzZSSGtBeHU4UzR6TlFTRzZZT1N5UUNJ?=
 =?utf-8?B?c1dHNktSSEpDTGtUdjNjeUZrc3BmaVQ3cmYxSmFOb1MwWlMyUFhjQVJGcDNL?=
 =?utf-8?B?TkxsYWVQTFIyOVhNTXd5ekZSc2lrazg4d2xyNHZLUjlIdWV5WGZrNVE2aXpp?=
 =?utf-8?B?QXFCVTBXeDNHVWJuZk1Jdmp4clJ5c1JFVTFyV2hGdmRXeHMzVVlIYjduOEpt?=
 =?utf-8?B?WTRLeUZhWnVzY0FwMmpUOGVUZUx1b2swaUFzKzhHMnkxNGlkVFFOQ2NpZC9n?=
 =?utf-8?B?b0R1VWlZbkhLTHVQQm15bEFBUjVVVjU2NzRrY3pYMjFRT1ppYllMYUhYck1Z?=
 =?utf-8?B?SGNRTndXYXpiemZpQlpETDV4VjNtUnBUanUxYzFNLzVqZkFzOTRzREtQSkF0?=
 =?utf-8?B?bVE1bHNaejRwMytMT0RFbjg5T1I1Z3ZHVjlmUHhDa3JFWlR0R1JoYTViYzUr?=
 =?utf-8?B?dFJSUWxiS1BHdWRHYmlrMEpYUzdYRTNnMkxEbkFrbGtGSkN1dVN3YllETEEv?=
 =?utf-8?B?UjVNQjlwa0drcEFNZndCMkNZbzRPWWx4aTJZakNWQ3pWZmVReGw4N0NjUVpw?=
 =?utf-8?B?dVJXWGNMbTQwSW1jNW5hZGp3dE15eXlsNjNWSzZJMHdEcXl3L3I5OU8vNENm?=
 =?utf-8?B?QVYvWFZoTjc5Vi9xdjBsYnNyRUFiSXVFRUVWcUdYOW9oR0luVGpwYXQ1aGFO?=
 =?utf-8?B?TWZwZlozeFRCdTM5N0krd2FaZWo2UnlNVkIwR2V0eXZxUmhJNCtUaElOMDNh?=
 =?utf-8?B?RUpqdW9CMVNTMTI5ZkxJclNrQ3F3U1l2UHg5TXIrZ21MWUhPdzJHU0d1WTlq?=
 =?utf-8?B?MG9lZEFmZW9pRXo2LzBUTGMyZE5KWnpTK0lBeWh4QXh2S0FPajVLeE5GdlFx?=
 =?utf-8?B?RklFK1YvRUJWRFdkcks4Vng3RkZWa2M2NDVEaHBVRXhESk82aXF2T0tJdXMr?=
 =?utf-8?B?RTgvNjViTlRFdWw0STEyc2pIeDJDVFJ0aENQajFHS0lmcVZFeldLQVpnbXR3?=
 =?utf-8?B?MHV0WTUvY0NWcWFpQnBuNUhEOWV6WWFuMytjek5tWnpHREJMOHREaEtLZ2xx?=
 =?utf-8?B?OU9aQXlqMnBEZ0E0bUlBNEtlcDdmRURMc05QdUhNRHJGbWJueDlTOUtmTitl?=
 =?utf-8?B?SUFiWGJUQVdqaU1yRlFyYmxwU0FmcU5YUVdrdGVTSTA0RlRWbnJlZ2ZyczZ3?=
 =?utf-8?B?QzQ4M1VKYjdBbDM3Und6L3NpYkRnUFFETWlNQlpocmN2Q2NVdXNnV3l2OTJu?=
 =?utf-8?B?Znl0K1ZkSG00YjBDMXZWaDZabGx5aXJSbkI4WFdhb0JSOFBOdzFyZ3pkMG13?=
 =?utf-8?B?bVV1ODZJZ3NmalpvcWRYL2tHN3dEV3RITXZTWjFkalNOaWFnTUduYjN0SnR1?=
 =?utf-8?B?MGlzQ213MFVlU3hnMmtwVkN2bkwyQWM1ekRnVVNHdE8vbFZuNzh5cVlVZDhS?=
 =?utf-8?B?YlZTakZsZWlZL3BLQmpPMVRRVFpLRWZoMU9MaGJ5K1ZldTV3V0hEZ1U5MkNI?=
 =?utf-8?B?clVoeUh1cFhRU2NZRXEydDhFaDVJZWxPV215WmF1TzdhVFRmOVVEWGhrcUtp?=
 =?utf-8?B?MGRWQkkrVHlYL1doTWx3UmtIbXBkL3g1aFlWZUd5Z3htTHZacXlFRmxJNlBz?=
 =?utf-8?B?ODg3VHY1V3RNS2pyMDdCOFU1MkFkcDA1N1BLL1F6TWlicjFsaml0ZmZQQUw2?=
 =?utf-8?B?OE0ybzFnTGZBRVpiZnNtL0I4WVhta2FDV1QrNHFoSkFEWjJxQ29TMk0xalVP?=
 =?utf-8?B?QXZrdnBmL3NIRGtscmwzamduTEZCZktQL2RZK3FwQlRyUjZlWFpIS1BwTUV1?=
 =?utf-8?Q?xsXpk5/gvKPobcsoMoYi28TOx06o9CGC/XjKLPgdWINQb?=
X-MS-Exchange-AntiSpam-MessageData-1: VPhAEkS7kPo/pEEasPcRwXZtDx6SccQjm50=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5738a3-5755-4ff8-37af-08de6ed1a6ad
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:39:45.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynw+Rob1w8t/oFY3VPNLwmiU4wsxKuUw676a8Z1tnalzBJTn0XevhbHDosjMqjY+rdnCsXJsyNNsG8UbQnEO0fshRAaXTp3/n6p2L060t4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=JauxbEKV c=1 sm=1 tr=0 ts=699588e4 cx=c_pps
 a=vzv6YJZFwQv9rWyERtU3yg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EGHGb5Q3nwi1NZwhFZ0A:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA4NSBTYWx0ZWRfX4+pwisReqdyc
 Ll9ZC5HZa57nRvrUo3AncOxtErIyEVwKqONCxJ0UEGIrkXiyHQuWuOfWp2VqKKzdOpUflaSZixo
 5I70Jym49EN8WZNvNVnSi9z2Ct5YY8LUI/j7Un0xh9V2WoyZm6wSKySn4RrUi4YMGGousLpto1X
 6Q0+BP9sCrv2SgeVA+jlqXhdFujUS0wuxSqhqTbx9cHXqyhkD2xrZjCR2hHIWKFNHj1vfzJD7X2
 8ouPxE0Taoa3ryjUalMzuR+6lal1ykPqR6zVTO71Gvkv4dBFnWp1/KAJFP8JNEEoscho0Sya4yq
 JAXpMOL+cdGBo4llU1nnf0UM0HH9njU+F3iblALmWg4Y/L8ptF+u8YA/yLpeNwZ03clxLeopfHv
 EbMqlulKS7PdDH8yclOd4yDyLMAONeAQ/ppE/7zHBcPMKCZBqoksUeyK/uPPz02Zvozg9mgGdm1
 BtDSS55H5RsXIASLAkg==
X-Proofpoint-GUID: 4q1g7XN-hOKLeAwjG-eLXozPjEnMrJxH
X-Proofpoint-ORIG-GUID: 3o-MAfcXLVmizScLdRzJFdYufqohxApu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602180085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 09:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231289

DQoNCk9uIDIvMTIvMjYgMTQ6MzAsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gT24g
V2VkIEZlYiAxMSwgMjAyNiBhdCA0OjIwIEFNIENFVCwgUm9iZXJ0IFlhbmcgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdA
d2luZHJpdmVyLmNvbT4NCj4+DQo+PiBUaGUgcnBtIDYgZG9lc24ndCBzdXBwb3J0IGV4dGVybmFs
IGRlcGVuZGVuY3kgZ2VuZXJhdG9yLiBPZS1jb3JlIHVzZWQgaXQgZm9yDQo+PiBwZXIgZmlsZSBk
ZXBlbmRlbmN5IHdoaWNoIHdhcyBzYXZlZCBpbnRvIHBuLnJlcXVpcmVzIGFuZCBwbi5wcm92aWRl
cywgYnV0IHRoYXQNCj4+IGhhc24ndCBiZWVuIHVzZWQgYW55IG1vcmUgc2luY2UgMjAxMiAocmV2
Og0KPj4gYmU0MGY2ZDBiYjgwMjc0MzY2YWYwMDQ2MTExMmFmNjU2ODdhNGRlOCksIGFuZCB0aGVy
ZSB3ZXJlIG5vIGNvbXBsYWlucyBvcg0KPj4gdXBkYXRlcyBpbiB0aGUgcGFzdCAxMyB5ZWFycywg
c28ganVzdCBkcm9wIGl0IHRvIHN1cHBvcnQgcnBtIDYuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Um9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+PiAtLS0NCj4gDQo+IEhp
IFJvYmVydCwNCj4gDQo+IEkndmUgZ290IHNldmVyYWwgYnVpbGQgZmFpbHVyZXMgd2hpbGUgcGlj
a2luZyB0aGlzIHBhdGNoLiBEaWZmZXJlbnQNCj4gZXJyb3JzLCBidXQgYmFzaWNhbGx5IGFsbCBh
Ym91dCBkZXBlbmRlbmN5IGlzc3VlcywgbGlrZToNCj4gDQo+IEVSUk9SOiBjb3JlLWltYWdlLXNh
dG8tMS4wLXIwIGRvX3BvcHVsYXRlX3NkazogQ291bGQgbm90IGludm9rZSBkbmYuIENvbW1hbmQg
Jy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2RuZiAtdiAtLXJwbXZlcmJvc2l0eT1pbmZvIC15IC1j
IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3Nkay9p
bWFnZS9ldGMvZG5mL2RuZi5jb25mIC0tc2V0b3B0PXJlcG9zZGlyPS9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODZf
NjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3Nkay9pbWFnZS9ldGMveXVtLnJlcG9z
LmQgLS1pbnN0YWxscm9vdD0vc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni02
NC9idWlsZC9idWlsZC90bXAvd29yay9nZW5lcmljeDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFn
ZS1zYXRvLzEuMC9zZGsvaW1hZ2UgLS1zZXRvcHQ9bG9nZGlyPS9zcnYvcG9reWJ1aWxkL3lvY3Rv
LXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODZfNjQt
cG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3RlbXAgLS1yZXBvZnJvbXBhdGg9b2UtcmVw
bywvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni02NC9idWlsZC9idWlsZC90
bXAvd29yay9nZW5lcmljeDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC9vZS1z
ZGstcmVwbyAtLW5vZ3BnY2hlY2sgaW5zdGFsbCBuYXRpdmVzZGstZ2xpYi0yLjAtdXRpbHMgbmF0
aXZlc2RrLWludGx0b29sIG5hdGl2ZXNkay1wYWNrYWdlZ3JvdXAtc2RrLWhvc3QgcGFja2FnZWdy
b3VwLWNyb3NzLWNhbmFkaWFuLWdlbmVyaWN4ODYtNjQgcGFja2FnZWdyb3VwLWdvLWNyb3NzLWNh
bmFkaWFuLWdlbmVyaWN4ODYtNjQgcGFja2FnZWdyb3VwLXJ1c3QtY3Jvc3MtY2FuYWRpYW4tZ2Vu
ZXJpY3g4Ni02NCcgcmV0dXJuZWQgMToNCj4gRE5GIHZlcnNpb246IDQuMjQuMA0KPiBjYWNoZWRp
cjogL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvZ2VuZXJpY3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvc2Rr
L2ltYWdlL3Zhci9jYWNoZS9kbmYNCj4gQWRkZWQgb2UtcmVwbyByZXBvIGZyb20gL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2Vu
ZXJpY3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvb2Utc2RrLXJlcG8NCj4g
VXNlci1BZ2VudDogY29uc3RydWN0ZWQ6ICdsaWJkbmYgKFVidW50dSAyMi4wNDsgZ2VuZXJpYzsg
TGludXgueDg2XzY0KScNCj4gcmVwbzogdXNpbmcgY2FjaGUgZm9yOiBvZS1yZXBvDQo+IG9lLXJl
cG86IHVzaW5nIG1ldGFkYXRhIGZyb20gV2VkIDExIEZlYiAyMDI2IDA0OjQ0OjA1IFBNIFVUQy4N
Cj4gLS0+IFN0YXJ0aW5nIGRlcGVuZGVuY3kgcmVzb2x1dGlvbg0KPiAtLT4gRmluaXNoZWQgZGVw
ZW5kZW5jeSByZXNvbHV0aW9uDQoNClNvcnJ5LCBJJ20gb24gdmFjYXRpb24uIEkgY2FuIHJlcHJv
ZHVjZSB0aGUgZXJyb3Igd2hlbiBESVNUUk8gPSAicG9reSIsIGFuZCB0aGUgDQpmaXggaXM6DQoN
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL25hdGl2ZXNkay1zZGstcHJvdmlk
ZXMtZHVtbXkuYmIgDQpiL21ldGEvcmVjaXBlcy1jb3JlL21ldGEvbmF0aXZlc2RrLXNkay1wcm92
aWRlcy1kdW1teS5iYg0KaW5kZXggMWQ3MWYzNzNhNC4uOWZkODEyMmQ3NyAxMDA2NDQNCi0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL21ldGEvbmF0aXZlc2RrLXNkay1wcm92aWRlcy1kdW1teS5iYg0K
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15
LmJiDQpAQCAtOCw2ICs4LDcgQEAgRFVNTVlQUk9WSURFUyA9ICJcDQogICAgICAvYmluL3NoIFwN
CiAgICAgIC9iaW4vYmFzaCBcDQogICAgICAvdXNyL2Jpbi9lbnYgXA0KKyAgICAvdXNyL2Jpbi9w
a2ctY29uZmlnIFwNCiAgICAgIGxpYkdMLnNvKCkoNjRiaXQpIFwNCiAgICAgIGxpYkdMLnNvIFwN
CiAgIg0KDQpJIHdpbGwgYWRkIHRoZSBwYXRjaCBpbnRvOg0KDQpbT0UtY29yZV0gW1BBVENIIHY1
IDYvN10gdGFyZ2V0LXNkay1wcm92aWRlcy1kdW1teTogQWRkIHBrZy1jb25maWcgdG8gRFVNTVlQ
Uk9WSURFUw0KDQpBbmQgc2VuZCB0aGUgdXBkYXRlZCBwYXRjaGVzLg0KDQovLyBSb2JlcnQNCg0K
PiBFcnJvcjoNCj4gICBQcm9ibGVtOiBwYWNrYWdlIG5hdGl2ZXNkay13YXlsYW5kLWRldi0xLjI0
LjAtcjAueDg2XzY0X25hdGl2ZXNkayBmcm9tIG9lLXJlcG8gcmVxdWlyZXMgL3Vzci9iaW4vcGtn
LWNvbmZpZywgYnV0IG5vbmUgb2YgdGhlIHByb3ZpZGVycyBjYW4gYmUgaW5zdGFsbGVkDQo+ICAg
IC0gcGFja2FnZSBuYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LTEuMC1yMC5zZGtfcHJvdmlk
ZXNfZHVtbXlfbmF0aXZlc2RrIGZyb20gb2UtcmVwbyBjb25mbGljdHMgd2l0aCAvYmluL3NoIHBy
b3ZpZGVkIGJ5IHRhcmdldC1zZGstcHJvdmlkZXMtZHVtbXktMS4wLXIwLnNka19wcm92aWRlc19k
dW1teV90YXJnZXQgZnJvbSBvZS1yZXBvDQo+ICAgIC0gcGFja2FnZSBuYXRpdmVzZGstc2RrLXBy
b3ZpZGVzLWR1bW15LTEuMC1yMC5zZGtfcHJvdmlkZXNfZHVtbXlfbmF0aXZlc2RrIGZyb20gb2Ut
cmVwbyBjb25mbGljdHMgd2l0aCAvdXNyL2Jpbi9lbnYgcHJvdmlkZWQgYnkgdGFyZ2V0LXNkay1w
cm92aWRlcy1kdW1teS0xLjAtcjAuc2RrX3Byb3ZpZGVzX2R1bW15X3RhcmdldCBmcm9tIG9lLXJl
cG8NCj4gICAgLSBwYWNrYWdlIG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXktMS4wLXIwLnNk
a19wcm92aWRlc19kdW1teV9uYXRpdmVzZGsgZnJvbSBvZS1yZXBvIGNvbmZsaWN0cyB3aXRoIC9i
aW4vYmFzaCBwcm92aWRlZCBieSB0YXJnZXQtc2RrLXByb3ZpZGVzLWR1bW15LTEuMC1yMC5zZGtf
cHJvdmlkZXNfZHVtbXlfdGFyZ2V0IGZyb20gb2UtcmVwbw0KPiAgICAtIHBhY2thZ2UgbmF0aXZl
c2RrLXNkay1wcm92aWRlcy1kdW1teS0xLjAtcjAuc2RrX3Byb3ZpZGVzX2R1bW15X25hdGl2ZXNk
ayBmcm9tIG9lLXJlcG8gY29uZmxpY3RzIHdpdGggcGtnY29uZmlnIHByb3ZpZGVkIGJ5IHRhcmdl
dC1zZGstcHJvdmlkZXMtZHVtbXktMS4wLXIwLnNka19wcm92aWRlc19kdW1teV90YXJnZXQgZnJv
bSBvZS1yZXBvDQo+ICAgIC0gcGFja2FnZSB0YXJnZXQtc2RrLXByb3ZpZGVzLWR1bW15LTEuMC1y
MC5zZGtfcHJvdmlkZXNfZHVtbXlfdGFyZ2V0IGZyb20gb2UtcmVwbyBjb25mbGljdHMgd2l0aCAv
YmluL3NoIHByb3ZpZGVkIGJ5IG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXktMS4wLXIwLnNk
a19wcm92aWRlc19kdW1teV9uYXRpdmVzZGsgZnJvbSBvZS1yZXBvDQo+ICAgIC0gcGFja2FnZSB0
YXJnZXQtc2RrLXByb3ZpZGVzLWR1bW15LTEuMC1yMC5zZGtfcHJvdmlkZXNfZHVtbXlfdGFyZ2V0
IGZyb20gb2UtcmVwbyBjb25mbGljdHMgd2l0aCAvdXNyL2Jpbi9lbnYgcHJvdmlkZWQgYnkgbmF0
aXZlc2RrLXNkay1wcm92aWRlcy1kdW1teS0xLjAtcjAuc2RrX3Byb3ZpZGVzX2R1bW15X25hdGl2
ZXNkayBmcm9tIG9lLXJlcG8NCj4gICAgLSBwYWNrYWdlIHRhcmdldC1zZGstcHJvdmlkZXMtZHVt
bXktMS4wLXIwLnNka19wcm92aWRlc19kdW1teV90YXJnZXQgZnJvbSBvZS1yZXBvIGNvbmZsaWN0
cyB3aXRoIC9iaW4vYmFzaCBwcm92aWRlZCBieSBuYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15
LTEuMC1yMC5zZGtfcHJvdmlkZXNfZHVtbXlfbmF0aXZlc2RrIGZyb20gb2UtcmVwbw0KPiAgICAt
IHBhY2thZ2UgdGFyZ2V0LXNkay1wcm92aWRlcy1kdW1teS0xLjAtcjAuc2RrX3Byb3ZpZGVzX2R1
bW15X3RhcmdldCBmcm9tIG9lLXJlcG8gY29uZmxpY3RzIHdpdGggcGtnY29uZmlnIHByb3ZpZGVk
IGJ5IG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXktMS4wLXIwLnNka19wcm92aWRlc19kdW1t
eV9uYXRpdmVzZGsgZnJvbSBvZS1yZXBvDQo+ICAgIC0gcGFja2FnZSBuYXRpdmVzZGstcGFja2Fn
ZWdyb3VwLXNkay1ob3N0LTEuMC1yMC54ODZfNjRfbmF0aXZlc2RrIGZyb20gb2UtcmVwbyByZXF1
aXJlcyBuYXRpdmVzZGstd2F5bGFuZC1kZXYsIGJ1dCBub25lIG9mIHRoZSBwcm92aWRlcnMgY2Fu
IGJlIGluc3RhbGxlZA0KPiAgICAtIHBhY2thZ2UgbmF0aXZlc2RrLXBhY2thZ2Vncm91cC1zZGst
aG9zdC0xLjAtcjAueDg2XzY0X25hdGl2ZXNkayBmcm9tIG9lLXJlcG8gcmVxdWlyZXMgbmF0aXZl
c2RrLXNkay1wcm92aWRlcy1kdW1teSwgYnV0IG5vbmUgb2YgdGhlIHByb3ZpZGVycyBjYW4gYmUg
aW5zdGFsbGVkDQo+ICAgIC0gY29uZmxpY3RpbmcgcmVxdWVzdHMNCj4gKHRyeSB0byBhZGQgJy0t
YWxsb3dlcmFzaW5nJyB0byBjb21tYW5kIGxpbmUgdG8gcmVwbGFjZSBjb25mbGljdGluZyBwYWNr
YWdlcyBvciAnLS1za2lwLWJyb2tlbicgdG8gc2tpcCB1bmluc3RhbGxhYmxlIHBhY2thZ2VzKQ0K
PiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvNC9idWlsZHMvMzE3NQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdmFsa3lyaWUvIy9idWlsZGVycy8xOS9idWlsZHMvMzE2NQ0KPiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8xNi9idWlsZHMvMzE5MQ0K
PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVy
cy8zMC9idWlsZHMvMzEzNA0KPiAuLi4NCj4gDQo+IENhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhl
c2U/DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQoNCg==

