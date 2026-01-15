Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F13ED3CCAA
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 03:36:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28180.1768448209688738616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 19:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T02FlqYg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54755db660=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F2RVIc3952454
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 19:36:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kNTnrNd7IWl9nmvFe/lyfaGjpCju6JHJbeSAEnyLCfs=; b=T02FlqYgy6k5
	9pOTHVcaZO/946BEcMxDvRh8HuVVgrt9XY85DNdSFfviSFFXTwjwp+Q1/KYeqkyR
	QxPOaVItusZTYD84KC/8KdcesnwPfEcIBzm7GTspgmb6YywlqmS9CbKJ9Xb+Jh+b
	VQHE3L6wf5F+St2RiUR7qj4b4oKj8WEav3qqWcEIlj/bs1YZKXnLdkOeynL6Ef3Q
	+8jlCVRTj2+7XnFTwwhRXAnYT1WblX7/I/YZYAfEPPIlxtDz076z7YZRauoyANCd
	C/+4sZ58pggVYDRAUveW/1XjdcBy6Q6zIRzHjVPvRd8FCza1JwZRR2U0ZQVxO6+f
	PZM69Jm7PA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0w92q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 19:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LafRDMIoVF7BtiuIO6zh0Hvq+vHd9dcARYxH6jUqOtH+mmBU4U3KxLefNFwJw2v7+6RRLDDS8POS+JXq/P86FH4TXmk0mynvVaGxbR2oH30zEpknWPbuoA0nNNHgdr9cmOKBzshtWAkvw2p2r8Gx+6E5u2jvYeU00AfdUSAUJUkctIu+v9YoaMKAE+y7gPdadZHzU1gMbgyCVz6o/ggUO094iZhqR6qC7r3MDUs/f3/Pysgu66WWGqPYW4PbCM6mKwErV4Q6sDWQMNaQ9aTAe+GCUCJaZkyP2OHOivx+YylQISSGx3v8NsL3AZW2vPT/UM5oDVyAMEGlDXEiq0/dGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNTnrNd7IWl9nmvFe/lyfaGjpCju6JHJbeSAEnyLCfs=;
 b=xyE+Zd5kOPzZzOjSbrIqrjVQhpd7hQ9kBmZwViDyqkRnz8XXYdAIQOPjdy0/fA0k58+IDCkkDqKiakdUDmWz++Kc7CGOUJRpjJibpZZ/+nDZR6t0Ys+Pupt4CRIMfzVTrWvlsppzj65xbL0JnGK2ph9U80blM1kx6Tkjx6Hg0azePyfmhBDuyf3NpxvJbdUfy4pExO3GbYAlV9W6lrrFcDJXQ6flrls3KOMQUAxIAQG74QGRXU2s40rQfqPmsSTX1bZAKMA1mLSMLG3R+fVzK4+gNvirqiCjr3WM1J7b/l6T5bYJbSdZv78htvv6gXlHT/JVvg84ogv59uqe4FA9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:36:46 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 03:36:46 +0000
Message-ID: <5fef6cac-7c0d-4356-9253-5d9710193d4c@windriver.com>
Date: Thu, 15 Jan 2026 11:36:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] devtool: clean up debug build
To: Antonin Godard <antonin.godard@bootlin.com>,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com, adrian.freihofer@gmail.com
References: <18880B4F565039AF.2355985@lists.openembedded.org>
 <20260110075429.2119759-1-hongxu.jia@windriver.com>
 <DFMJM47EDV3L.2NZJ8NWYZQWCF@bootlin.com>
 <67f4730d-fd6c-42d6-a6be-267bbd6caa2b@windriver.com>
 <DFOC8AGS18O9.1ZYDSEZ54MXQZ@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DFOC8AGS18O9.1ZYDSEZ54MXQZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KUZPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::8) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5a1160-f8d9-4376-4df1-08de53e74f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjNSbjVBZHVLMTRjU2RDb0ZZc1BUK1R1WEdLN2dYK3hIclVYTTF2M0MzK2VL?=
 =?utf-8?B?bHFBcUVCTXJ6WVJkM0V4MUxrWUpGdGYxOTA2NlVZZDlWamlhWXFZcHpwSVZO?=
 =?utf-8?B?Q1J4bVBMRFhpelladkVPajBleW9MTHRIcEJYTDhta3JwSXJKbzBVMG8xOHVa?=
 =?utf-8?B?cTBkQ3FBdlV4ZnU4NmNkOXlrNk5YcXYxRG04ZWc1UUFkdGNiMFhwMWFNSDVX?=
 =?utf-8?B?Mm5FUjNNNGE0Q1k5TjdvbDBYM3RWMUNlcE1CK3RQY1UrY3NFdXN6U0Fwb3NQ?=
 =?utf-8?B?WXlKQS9HTlh0WVhxN0VjbjMyaDN5Q01oRnJFdHpBbldRRE00TnY2djE1OSto?=
 =?utf-8?B?MzA2N01udENSKytrTTh4QzNHR1NuN0ZSQk9pMlpRclFseFRPT3lsL0xUNmJu?=
 =?utf-8?B?aHhwQmFZTnBwVWF3OHIzelVvMFRuOUdJNk5BbFg4eHRvd2FPaEtHOGlEaVUy?=
 =?utf-8?B?OG1BOGhVOEF4ZnF3WnZPSUU3NnZKVUFqTmxsUmplaWJNSVJpOWFUek80Qi9y?=
 =?utf-8?B?dzlJOUdMc0VzMVdYN3huWE9IcGlDRm9FaUdkZDdzR1pCTWhmbnFvYXZ1ZEpO?=
 =?utf-8?B?Sm4rVTNaNFF2THlDeWRCTVdkZUJHV2hBd0srTmNTVlZ4MWJrcHl0T2R4Ujdu?=
 =?utf-8?B?Z2RERnlBT2IrYmNxbm1LZUZadjhpTFRHRU1yUmJ4VTdNcnpXVnlrUW9RMFkv?=
 =?utf-8?B?U0Q3UTZJZzlwVzJobmN1Z2wzTmJMSi81L1BpTnZSTHp1ZklUUG9GRllrNDQv?=
 =?utf-8?B?d3F1dnIrWlRFSUxZVDVmbUh1UDF6TXRjSzc4Y0ZkVzFIZTY1WkYyRjN2REVE?=
 =?utf-8?B?QVBITTVZblpybGwxenphcFhpYmlId041K0FDams0MUpORldydndCUnpQYWlx?=
 =?utf-8?B?UWErOUQ0MUpaMHJVNnd4bmh2MUgyT0hEUEFJMlFsTXowTmgyV3FIWVRieENX?=
 =?utf-8?B?bXAvWDFtcTREWjRaNzBBWjFpMkFXVlpWLzRWbVlVSnh1clpmc2JCaEFhTXk0?=
 =?utf-8?B?R0l4SjMzT3FaVXVSeW1Ic0pmdzhnNC8wNXJGb0xjLzdGTFRPL3hIZkpGd1pH?=
 =?utf-8?B?bExVMXRwWTBGWXVidVZ5ZVM5NmxPa0FTbzhSdUk5YmlKbDg3WnRUZ0RqcjE0?=
 =?utf-8?B?UGc1c0Z5QjgvNElPSXYzYUJMSlYxWlo3cWh0bjVlRXRXc2F5MFlOOHBDWk9k?=
 =?utf-8?B?cEw4bWFvam1WV2pXOUhqZWdXVFlZUi9UL3R1OWxDUlRkejVpKzRMZDQvNzdD?=
 =?utf-8?B?NVJmNURKSndocm45RjExMlA1TDlQbUFqbGt1UmlUQVU2clZaa2hKV3ZockNx?=
 =?utf-8?B?aklUYVVuVWZWSERoZXRRQ3Q2RmozZHB4M2xIQkRrRnY2S3lQbGhtVlhiY24w?=
 =?utf-8?B?MEpYMmdmbFVBZzJkSWRFT1QrakhqY25DdjN0VXN0WFd2RkhQRk9PT2xKVGVR?=
 =?utf-8?B?NDdTTGl5TmN6bFphL1l2VURUR3J1VHRoVmR0eEFXbzQ1Rms5WEVzZjlzY29O?=
 =?utf-8?B?V1VZeHdpZU51REZabnZCcGtobVBLUks5Zit6ZHRBcWM5OHNYVTVjQ0Y4dEZ3?=
 =?utf-8?B?b09sWXVmaWUzbEwzOVg5RS9yekt4UTljMTZ3NlFrMjVCdi84aEdldUVzUk1w?=
 =?utf-8?B?MnByTS9ySFlRREFURENURHNRenkyeU9xK3VZNzVjMlIvQXNucXEzYzVqVVc1?=
 =?utf-8?B?SzZ4WUVLcUh2dHRPN0p2OHM3NVozUTdBcnVzUXlDRlV6RWxtbTdSdzNLRnov?=
 =?utf-8?B?UGYvK1hLcWl3NDZ0dnloTG5iQSt5K0Q2WloyaG9LS3NYQzJ5cUtjTG9jZG9u?=
 =?utf-8?B?UlBYSVFuL1pNMEZoZVNhZnhNUWlRWEhmbVJDN2poTFZKZFFhNVVhSGVpNHM5?=
 =?utf-8?B?T1JvcFJwUVZseFZ5U0hKUzBENkFnMEdaT2EvK0d0M0RkdzlKOUsvUHFKakw1?=
 =?utf-8?B?VW5lRTI5c3krSG9jZXFDY2VQNTRLOFRqcXUxanNkR2FZeVBSWGRYcnowK1Jk?=
 =?utf-8?B?eG1XRjdPY2c3VnJWTU9aRjlvMUpSajQyQ3dyam5ucHROWVVQaERkWkp2Z3E0?=
 =?utf-8?Q?PY5mQs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXhsalZ5RXNvUzNiVVBvTHJpcUpPenlDV1RWZWVCS3htNWRRcmtIUFNYK2dC?=
 =?utf-8?B?clFDTlpDWnV2bFlEYlNUZ3Q2MU1UQjJ6UDU4VUNER2p1MUFsWTFONDJVQmdG?=
 =?utf-8?B?WlpDSmtrRGRBWmpxNEFJdzJ5SVU0TVUzZndiOWZsd2RDNjZibjZHNXJRYlp3?=
 =?utf-8?B?ZjBRZXdXQldLVmVwUkw5bkd4K2VZbGpQSFplalRST3czRlRZaUlFZ25MNjAz?=
 =?utf-8?B?TjRoTU9odjVGRFR0aDcvZ2pYUm9RSWlUNFVZOTQzam41WTVTa3dkQWMvVE5C?=
 =?utf-8?B?WitZZzJxSDErcENUeGRiNFIzalVZd2FOMHdkU01zUWhuc0VHOE83T00wYS9W?=
 =?utf-8?B?b1MwRWtLMytxWHRiUVFhZnpKQjRxcW9qTFVNS3p3VmJmODR6MnRaTzdRRkI2?=
 =?utf-8?B?SlRrVUZDQ1dMNFpzMDdnV0ZKMGN5WlZ0WHJHeCtpOGxDQ3ZHZkRaMk9XUmVE?=
 =?utf-8?B?OUJxcWcrOG1WYVVwVVczOEgrNFYxaUhUVmk4M2Z1K2JqL3NzcGJCM1NGUUNu?=
 =?utf-8?B?OWg2NFFyUktiem9BVU94YmNkdFBJeUN0bi9MenAzNEpxemhZWCtkZEpYUkZQ?=
 =?utf-8?B?clNHNnJZdys0WjIvWm1oc0ZzclJlTGo3cWJhcGpxc0c1K3ZRdGFndDBCWEJv?=
 =?utf-8?B?QlZJVjhxd1JCeGcxWTY1R05GdktzVnZtRXh3VzFSbW8wSGsvakdXMEsxZnlE?=
 =?utf-8?B?MTdZcW5LNmE4REhDdWZXdDU4L1lrWTQwZ29NY3JvMGc1Z2xPa3VEU3Byamgx?=
 =?utf-8?B?V0FLemRmYksyVUFVdmZaZkl5bkRubnU5a25FV0ZialVlQi9nK2ZsTDBLTDVL?=
 =?utf-8?B?WG1POTB5WEFoa2lRMmc4TUtJQXQxT2VPRHpWOC9MSnIzbGJRWmtuZW9yL3U4?=
 =?utf-8?B?ckxTbGhuWXk1UVgwTEloenJleDJudy9LR2w2TWFaZHVacEVtNmlLN0EwOHZT?=
 =?utf-8?B?bVhVUi9ydmdvV3hMYzd2bjZGU2xOd3pib2tsZGpQdjEzZDVJMVFFb2tmOG1Y?=
 =?utf-8?B?ZFoxZ29abHRMQ3FsV1VuMlRMSERWU3E0RkZmdjJQb0tNaHhkR3B5T2FSVXo2?=
 =?utf-8?B?MEFVOG9Tb3Y2aGNnQmlLYmx4Y0l2UVRUaVU1cFFPM2JMNjNoRUVTRUxUVVBj?=
 =?utf-8?B?RmlrQVMrYVVUb21Wc2VzQW85ZHJuV1haOXo3NUtJVW8vcFFrVEVxaXZBLzY5?=
 =?utf-8?B?R25ZbHZpRWI2UUJueGc3Q3YxcENyaEJjUUV4K0NGVTRuSGdQUFlYK3hmcHFB?=
 =?utf-8?B?S0MvalY4MDVLNlpYa2RObjJhenNxR0FWajRMbTBTelVJcUVPUDkwbVRtcUhY?=
 =?utf-8?B?K0FRRVJ5WDNhYlo2bEdleVluRHByYmh2TTN6WUlkbXdFdlhVSVpHUVZWRWZz?=
 =?utf-8?B?d1I2aFdxbk1iUmNDT2JIN0MxRmdneU9xd3I2Q21UNzFHZDRwL2dlZGswNnZU?=
 =?utf-8?B?dkxPSWVYQTRwd3pUSXN2K2xKcnY4a21jZXV2T3gyc2lZK0U0VFpGT29lMFB2?=
 =?utf-8?B?VzB1cEI1ZkhEeDZUdFdQY3RqY0dQZmVwUXNTRW9Zam1uanVTcTZRbEU0Y24z?=
 =?utf-8?B?cWl0SW1KM1g2UG9yVnRjY09vOGxVWUVqWXhwM2xsR3JqZ2QzYytBZlI4Ykp0?=
 =?utf-8?B?WWtxWC9kQUhBUmxEYzRXL3ozQmNRY2NwU3MyV0xKeW5IOEdnWEVIRnNCWlds?=
 =?utf-8?B?UzlNT1NwSFhyOGVDeWZZY0k3WnZObjNPNUFkWDgwQVQvWXRhMmNtY2RUdDJC?=
 =?utf-8?B?VFJGRGJlRGgwSTAyb1hRMEhQNHl2YXZBZzJOMDBBcHFkZklma1RDamJ1b01D?=
 =?utf-8?B?SFdRRmpTclhvSVFSRHRMb0RaUTQvL0NRYUdZRVBGdU9GTDRHQnRXTzNZc09M?=
 =?utf-8?B?N0dnLytlOCtuZDIzVk16cUQ3TFZIMnNtOGlBL1BGTzJUMFRPOGcxV3VzWjJw?=
 =?utf-8?B?c1lKNnR3bEpLSGZSL095cE9EdEQ3dW15ZmZnZ21jS28yTTc5THdwOS9RcFpj?=
 =?utf-8?B?V1VXMzlib1oxWEJLSzVEVEM0QUQydFFUWGwrcnpjbUtwQXB6RmRKNHAxeTJW?=
 =?utf-8?B?ZWlidnk5Q1dDeWhHa3prcXFzQTVUTWNjanY2WFlZbnFUQUhoaENUVGx0aDJC?=
 =?utf-8?B?VVFrYjdueGZBYzFLQlBIYnYrUkNzK2NaTTAwMlRwZHNvb05ndTVuMzhPdGJO?=
 =?utf-8?B?NFFZVmJIT1JzUmIrRkJ0U0IxMkFzQUVxSlhBMm51bFRjY3R3OU1VMWVZelBt?=
 =?utf-8?B?b0djcUhRSnVJU0ZDNEhtbmwrdHRTSEgwM1lwQzFEWGR1bDU3dWNUdzJ5UkUv?=
 =?utf-8?B?WHNHNmtqZ0ZsQ2hQc2c3YTczK2RsN0s0V0IrbkRZOXU1NmFPMmtvZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5a1160-f8d9-4376-4df1-08de53e74f15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:36:46.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZy7y/JtdsaKIZsV0NMiF70iyHINHWjIezAV5vGEKdcca8HHlXhNQvzbNC3ogQogN0sQsZ+oct6hqO5oU+JVxXaHKbBXSz6uD2AseBl4qsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: B9CUhuEyzu4Jb6eObFMJWpru3UfCaDar
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=696860d1 cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=vLFa3blsYtHUOw57Ui8A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAyMSBTYWx0ZWRfXyNfPyGPbqutx
 XJ6xn1697gFgjX7cioHNkRp+pB38Y3MW9119Al0/jRYDjPBvY6FVRl1sa70pQxgEE0kolnm1Hej
 KTsZdlmYcV2F/+5n8DyyKz0A+NXSpIraI+t3XhgWKkkF1QviVjLdke8fRjMvnQ25tPaoYckN+LB
 pZhMyIU6bg6myd1D2OkEAh7ObcfJ+BvjUPbHwfUi293HY8R00LE5dmgRaPDX48QfopO0rEE+Zj9
 PYnL3FUZQS2Br+wHoM6Wr1+HDWlpNifOfTBZRhmXQ3ihm9O3NwQqvQQzLPoz/ctop2KO5Zd47A2
 PE5r/tGL/NztVBo4HRhpx2otu7NWS7mgoQY/FbdGxEeZsY6Bf/TXJKweErjwF2yUkaAKxc43LIJ
 fh0B12LfVloG/dq3ajEvwLyJYxUlijdaA7deZpKc2Wk6nQj21BhzodUxEIO+2OsLWKptqKmJMif
 ht9eXiFfF+MHhnGZvEg==
X-Proofpoint-ORIG-GUID: 2r-nomqQyjrUUe1pW2tb-jZ4ZaH5V7f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 03:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229385

On 1/14/26 21:14, Antonin Godard wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi,
>
> On Tue Jan 13, 2026 at 3:56 AM CET, hongxu via lists.openembedded.org wrote:
>> On 1/12/26 18:36, Antonin Godard wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> Hi,
>>>
>>> On Sat Jan 10, 2026 at 8:54 AM CET, hongxu via lists.openembedded.org wrote:
>>>> Due to we rework debug friendly optimization, rename DEBUG_BUILD
>>>> to DEBUG_OPTIMIZE. Then:
>>>>
>>>> - s/DEBUG_BUILD/DEBUG_OPTIMIZE/g
>>>>
>>>> - s/debug-build/debug-optimize/g
>>>>
>>>> - s/debug_build/debug_optimize/g
>>>>
>>>> Note, for specific recipe, we do not use
>>>>     OE_FRAGMENTS += "core/yocto/debug-optimize"
>>>> in recipe
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>>>    meta/conf/fragments/yocto/devtool-ide-sdk.conf |  2 +-
>>>>    meta/lib/oeqa/selftest/cases/devtool.py        |  2 +-
>>>>    scripts/lib/devtool/ide_sdk.py                 | 10 +++++-----
>>>>    scripts/lib/devtool/standard.py                |  6 +++---
>>>>    4 files changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>>>> index ca0269543b..f451b47713 100644
>>>> --- a/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>>>> +++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>>> I can't apply this patch as this file does not exist on master. Does your patch
>>> depend on another one?
>> Based on master-next
> Sorry, but I can't find a commit on master-next that creates
> meta/conf/fragments/yocto/devtool-ide-sdk.conf. Can you please re-send the
> series based off master?

Oh, seems master-next is refreshed.

Please drop this v2, still using v1

//Hongxu

> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


