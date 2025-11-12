Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D71CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 02:54:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3620.1762916056216954612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 18:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ev7+up0b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411dc7477=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC2Cr981401800
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 18:54:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=mt1eIfRtX
	+Stx33oWagM8WMXY13M5rmFoonzq5HUl+I=; b=ev7+up0b7CC9EcGOvmIIE5GTD
	dDRjky8L6P1XGjwgJkYbyruN3ANn0DdMl69bg3aWpPCTmYFXPILQehwkoWveer3g
	lUpud1PU/QxlumUpRP3/CchF/z2RufNRYlMzWQJoGYMhxUK0JXZp5Onz/WNRuLrH
	BRXWQeWbzZuUnT+yYU/kFmeZw59g4ami8HIAw7J7xikp2oU1dYJe6zAbOvxizPOv
	RJRd3P13gkutZGwG390wgjPBxFiojfAPr0AUHhRk5NVHa2T/7lC38Kj4rf+oHFMC
	NjA/eeu0PPW3IPHJejw2fkZto2RRRlRwMponA9Pcrdfw69nvn3+dkg8Xnz/Dg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa21347wd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 18:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbPkULeP9E++DbFmvblOvMubNY4GZMQ9z7ynwjZ60O1DohV4wGqclG9VhzxViTFueRRFXPejT2ogFWUxKmrp3wssyrGq4TdJ72I84EnPpKT9OTIensGFJoVslvfUc/Lpde2ED8aVyajdrW/OeG9XQNtcEja2r0+BCGaZuRqQcc0pS/ay+zlnUAmzWfhHlr+wBMSo90ilrRgnABuhwGCeUYhk50Yr3pXb9K+mWMci35cjJt3LzCEVRGO5kGLJmaKCJ08K0JMfNkprcZkdm0uoe2ojyMdIYwHhEhLsB1RjAvOUTZmRBBYkkCdgWCgNasc8kYU9ejD732WPonsOEKwMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt1eIfRtX+Stx33oWagM8WMXY13M5rmFoonzq5HUl+I=;
 b=pVqWL1lyFasD+CS7RBealb4SFYmeCLwhCLMYTYcfxBCHwRcrr7UQybRfcvu1OS6ogZ4fXBSItj9QD6wrIUZ1dpv7zkow8sX17BrdTMJaA2iN92su+UNTWdBEEfglU7palbx7emWqGWFRBY23GZkWnqYDqQW9WlRF2fDRqR0RsWlz/9KOaSLanMjgliBn65fXYYQe0dflxBCPcgguuuzeQ9Gw0yst4iD5p01y0MtSOQmxoYzW++seVrFwxPzXN3s12Hc5cgloy3TNaK309FNB/amcTNPaauBWxnwHI73HBvYooTGjiuNuhNCqrqejRc9IxJe/iD//qK/4TbkyFGFOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 02:53:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 02:53:57 +0000
Message-ID: <63cb0d09-2b76-4557-ae38-8ac2d1772cdc@windriver.com>
Date: Wed, 12 Nov 2025 10:53:52 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Subject: bitbake-setup feedback - long subpath + hardcoding machine and distro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: 06163792-a349-4601-79a9-08de2196b8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODJpdXQrZzdROEZSdkRGQVk4RE01TmE4Y1NRTU43NUpEUWN3K251VzUyeWxz?=
 =?utf-8?B?S2sxaGVadGZQTmNsMHpWWExFdUlqQm9OZktmdC9MMkFLNjlYWTQ1STBaYXcy?=
 =?utf-8?B?VnFOd29SQXE3V3lRV1plSlZYNDcveGJvZjhFc0QraUdSSzdtZG9keldBN0R4?=
 =?utf-8?B?NFpUZ0toQmlRRXNQQTYrZXBEVThSdWNCRENVSDNrakhCUXQvZitMRXBtNlpP?=
 =?utf-8?B?NE5XOTZPMmpZd0RMZHFkM2NNZ0tmK1ZmQUE4U2Z0VG9QTkxtRmZ6MXBRRjFo?=
 =?utf-8?B?REF2ZUpMZGp6eUJXc0tmZ3E1VlI5T3RMWWNoeUJnVFhwYjYzRHVIbHhnUFRN?=
 =?utf-8?B?MzMyLy94aTlydG5idHFwVXVQZjd1WUNhNTVGZ2RqdlZsa1drTSsyWm1vbFZw?=
 =?utf-8?B?dWQrQTlYa0c4SUlCZXpEQllhNHJGVzFXUVRTT3VXVXhpZHNDd2pad2prK0pn?=
 =?utf-8?B?cGNxeENsY1BaMU5iR3lHbzRLQmVCdGZ6eTRzNlZEZXFiK2h4OUFWZ1RTRS96?=
 =?utf-8?B?QU9GQkpUSUFYZmhFNHVFdEtKUWlBelFoc0FxeVFXdndVclFOT3NURjBnMDhS?=
 =?utf-8?B?VUNnVERaNDBUbjFTUlBsQ0k2SXNuQWd5Ull1eU50Z2t0dkt3WGxaekxQZElR?=
 =?utf-8?B?VDRodXlUNUN6eFUrZmxjdUtjUWhnSEgzYXQremRlMzBvNW5YY3NHcXg0bTln?=
 =?utf-8?B?M0RSbm1pMXdsRUI4WWkrdlcveUsvOGJud0tLczRSUkkxT0JZbmMyNWx3T3Nn?=
 =?utf-8?B?UnJ3RWJLQnlXS2tpMW5TQ1hCelcyYnlCTEt3Uk9wZXZWMEFiaGFTNzUrS0gz?=
 =?utf-8?B?dnZFY2tDV3FBRVVJZTZmbHZmcy95OVBLajVZN2RxRXhlWTVlWWR5NURIN2p0?=
 =?utf-8?B?TWIvZ3JOakRnUWtmTWdSYVNNOGNHaGh0cGlnZmFmRWNXYU5YU2dtNDlGcUEx?=
 =?utf-8?B?SVFUdXBiTHhZRmVON2syME9Wd2VIMGFDODBHSmlzYzJEdVFJWFg4N0FPZnVm?=
 =?utf-8?B?TXFkZkpiVlE1c1ZUUGVKSmpFTUpyOU42bWdkZGtUU25seEplVjhKVFQvaFhX?=
 =?utf-8?B?U0ZQWnhwaDNuRUxvYXhIeWp5K2hmTkpvR3JkSTlhNFUwcWJDL2hBRHlMeEVQ?=
 =?utf-8?B?YVp0TjJLMC9wK2hqUmpONXhBTWdpNVowRmwvY0xpbG9hdmZvV0tGN1o1Zkd5?=
 =?utf-8?B?QmxpWHFtaGxLZzlLZnhuTDlNeVl4WS9mdDFQTEN1eEVGT3IrdkFLK3lrRUhv?=
 =?utf-8?B?MEdvaWZhMXV5akorUzNvbVMzREl1b1BvaUo3djlKaTNvSnNxSkNiMjZleXVW?=
 =?utf-8?B?RmZLZVgxdXNKOEwrVWlSZzJYNm8vSVF3UXpTV2ZYcjV6WWZhWlRBMUpiU2FU?=
 =?utf-8?B?bjVPSUV1UHZ4WlU1TmI5d1RYanVsenhKcGZLMkoxL0N3SWJVMFlzanRIWTZH?=
 =?utf-8?B?dFpIVGhrUWVqd3FHWXYxc0xQQkRrbVA1VmVDVzlybmpzWCtDc1ZtSUZYTDd0?=
 =?utf-8?B?OEZiUmJQWU5yTHJHS1ViQm0vZ1V6NHJDN0diVytVM3dscTZlR201YTNZWDRy?=
 =?utf-8?B?bFRKQkRnQlFYQUxqZzBXOVB3ZUJqT2dqQXViVCtzZ01FRUlFMWRLU25BalE5?=
 =?utf-8?B?MnNxeGVjdWZnc0ZQWElZeGx6aXZYTnFBaW1nWlc0OVhya1JpOWxNcmYweWNk?=
 =?utf-8?B?TkwyTXFWaC9TSVAzUFA4UzJRME9BSmFsS2dpVU5rY0c0QnhmMElhTFU4aEs1?=
 =?utf-8?B?bFNYOG5CK1hzVktyZ25Pa1d1WEx1M0FlUWRwWVl3d1FUakVINVZxLzV0WjhY?=
 =?utf-8?B?MHlwQ1N5R2NUZ2svN2Rxa2N6RnBSWHgxb2pKdUQzUEhXWDdXc0Q3bnVHTW4y?=
 =?utf-8?B?S3lrSjhZMUxMbEcxV0tGa3RoZldtQVFFQTBjeVlwSmpKbmhoWmVReXpua1Z3?=
 =?utf-8?Q?5hI1jzcugIGodwRQ6KcLxoPBU0gwTqFe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTI1eTNadTZDTTJRRDByNmpMckM3Szg5R2dqamRZQ1ZMai9yZmFySW1zMGR2?=
 =?utf-8?B?OWlYWGxPYldmbFl3OU54OTIrbDlmYXNyVktpVnk4bzUwVmZwakRVbHYxRklo?=
 =?utf-8?B?N3VVRGtaVUgzdXlTQ3V0UzF4RTlvblgwR3BxZHdGQUFITVJIcCt0Z2RiQWcv?=
 =?utf-8?B?SndFcjl5bkkybDhJMVJ3K3RFMjZpcmZsVHBYOXhPZmVqcCtORHVTTVJwVWhi?=
 =?utf-8?B?cDltRXhINmFSSDJ0R2VqdkdhUVVoRStLaVRPN3Niczl0QmZhY3NvQlArbFY4?=
 =?utf-8?B?YjMwTzJLWGNLeFdYRHlNa0xaT1lyb0ZiL3hIcFlXdFlpdUJFVEU5V2RGOGs4?=
 =?utf-8?B?UjFIS3BMaTNlT0p3dndkNEVwS2NiU3hWVjMrR2g4VWFLRXg0ZDVpQnNrVTEy?=
 =?utf-8?B?Z3RTNVFFTys3YVpXYk1USjI2OHBoN1lHNGdaUUZ3WTFSTzdPRFh1eER2V3BI?=
 =?utf-8?B?aW1sT3I2N1dyT2ZGR3Njdy9NRExCT3VWc0RpUkNTOU1kcENyUDlNMUFaZnNi?=
 =?utf-8?B?NXNsR3JLYmo0cjlNd2E4eFJLRHl0b3dSRUl3UnhRTDFLYWk2Ymk2UU00Z2l6?=
 =?utf-8?B?d3ZPOEZESHRkUGhUMU9YaWhxdnAxUlIzeVkwMmF4WnRaY2xEVVpZWWJhQ0tq?=
 =?utf-8?B?K0dpRkNGQlJwcFZSUlkzdm5ZRVlIV3dQajBSV3ZIeWFHMkNES3k5L0RxTkEv?=
 =?utf-8?B?bjdpeUMrbUlqZlFvQ3lPekozbmp5VHFpM0Z2YkQ0NkdjYTltbFg0RDRQdGNE?=
 =?utf-8?B?V0ZDRUJDVmo4UWo4cWtTamoxdEhjYmI2SHVPUW8zQmNWY002NXY1WHN2VnlB?=
 =?utf-8?B?a0NQa1Yrc3U3TmJjcVFOZERRSEZOcHR2dXZiczh0ZmdsVzBoUGhSd1Q1aXZO?=
 =?utf-8?B?TzlHUTZqc1F4bXNQWWRhWVJIMDNtcWxmY24xczBMR2srUllGZmJQQjhBVm0v?=
 =?utf-8?B?YjFGcmpoaHJZUEFlb2hoeFJ0ZGdCaWYraWg0WUhlb25oaTYvNElIRWVzVCtx?=
 =?utf-8?B?cVNYelQwWGFFMVEvWXo5NzlKRjAxYW4wV0xFaGxXbnJwVVgzT1A5eXF3MUhR?=
 =?utf-8?B?L2JBNjZVdUxTTnVqM0RnWENSVHJ3OFpoSUlGbVZBa0pvVXN0aDVMTzY0U2d6?=
 =?utf-8?B?OHNtaGhGT3crZjMxUWJKWWpnM1lqTTd0ZmdJRndFVU8zNTFFVG51d2pUN0FJ?=
 =?utf-8?B?MjFtdS9rQ09UVnVpaUtuQytuTzdrNUR3ck1IblM2T2JiMGYzNzRQL2tITFZh?=
 =?utf-8?B?Rlp0eGJwQjhIdEhkU1BoMERLcENTa25iY01GMGRnWmRRL2o1SWtDZlFCK2Ez?=
 =?utf-8?B?Ymd1SVVYWDFpSGJ1T3R0VjlNODVOTnFKakc1dCtNODZISzRsa0UwQlhTcTJr?=
 =?utf-8?B?SGJrK0NIL1RMTFBRZEZ5R3ZhU2NCdUF4OEFJaWRGMzRxM01DU3htUHEvVUJV?=
 =?utf-8?B?VFVLYWtMeDF0dkoyZHdJSUp2azFmalpXV3NuemI5Tjh3RU1JaHpsQm40RzZ5?=
 =?utf-8?B?RFdRV2VSaXJzM0cycUlCNHRiVWVQcW5uQ0tWemQzV3RQdHVDMzV2aVVvcmZB?=
 =?utf-8?B?bWw0c0tmM1Q4SHdmelpsanQ4NnpqZ2FmYXlrTmVCUzUzTkVQaUJkalpPTTJT?=
 =?utf-8?B?VW03OG82OXlDbXRKVERKKzVPa1RvRUpsVG1Bamh4T1VTRVdqTzRzVzZWVUxX?=
 =?utf-8?B?azlVL3VFS05WQWMyZ21OU0RXYnRheEVSK05oUnR3TjFFSkdFcUViKzZRVE00?=
 =?utf-8?B?enViajMzK0pacmtaSTJrL1ZBRkN2T0lUMWlPaVVVUzYzbEpDZ0tlU1F6ZkpF?=
 =?utf-8?B?MzNSdDVzMG85eWIycUJ1ZUVkeUZuNlprTG5vQW1LSEpPMGJHb0R4QlduZHBC?=
 =?utf-8?B?MDkrcFFOa1J0V2JxbUZrZDdOenc4c0VodDYxOEVOK05TSmlUY0tkNThaejI2?=
 =?utf-8?B?ejg5UEoySWhMa2paZjBLa2svbDRiZDlBMHgzdCtrUlBnU0hOYSt4Z2JNOEd1?=
 =?utf-8?B?WWx2NE52NmF4QWlYNm5uRjExVklHZUFMb1lNOGsya3l6S2pNNzN0NzN2dFpr?=
 =?utf-8?B?VU03TGtIejJxSVZsZWs1L0pKNFZVUG5YM0JhbFA0K2pDeEtaWnZqMmJyVith?=
 =?utf-8?Q?FX/Y0GGm8p6vqHmledXElT6gj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06163792-a349-4601-79a9-08de2196b8f1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 02:53:57.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYl2S9UPZgkrvcZtomxGkpnFJnIatkogSLdWNnBaSZg78uNiheqsQtQmhe7Hf9fa105g9UwJnGbHej//U/miug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAyMSBTYWx0ZWRfXw8t5s+xzTeUV
 7N0dxzN4EFDlY2U8iYe7cs9UjjSvdg5ACJnKb+t73CC6AkIgKBj/JKLayuWAf9+6Nfdi4dVo19p
 OZXPDArcbvuyJPiN+aC0TETBmCuCUfewwmcGbuXw6gyAGwTaRe28sCMDVbYpFDSXAV7UTrg3djM
 QAGtuyrEHm80dGCZcDMOaaROmu6oApoeQljDQL34vrPl3wMDZZg99cXYcr0WKlB7GwKDExD6qXI
 IIplDK7ko3Axt/SSHzDW9H1ibVGHV3iY067EYUwN2nxabEOf7TZXaWMYK7g6Z5+7/oaUxx4Rjg4
 SjMQZcI8RjBTCag4W0hDJ/8dlcqNOX7d9WSiYSAFuuusOGGW06KEqcDCFQwPIQe0i1kIL7D4NPO
 PAPv0UqZRTctr02Xve4thbhaQfevTA==
X-Proofpoint-ORIG-GUID: O06M7_kZmkoO5NUcKPnXQPnDgTwK4YaC
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=6913f6d7 cx=c_pps
 a=cIeYbKhGSB7Na0nkMajj9Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SUmgjf1pU1Vtr4-1vBgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zjSCer9aJUnfUHd0MIp_RJzh8XyILaln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 02:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226192

Hi All,

I'd like to provide one feedback on bitbake-setup.

The subpath is unnecessarily long, e.g., 
poky-master-poky-distro_poky-machine_qemux86-64. And it's hardcoding 
machine and distro values.

Such design might be reasonable for testing infrastructure, but it's not 
good user experience for developers.

For example, what if I want to to build things for qemuarm64? I'm using 
layers under the a subpath with the name of 
poky-master-poky-distro_poky-machine_qemux86-64 but I'm building for 
qemuarm64. This feels a little weird.

Regards,
Qi


