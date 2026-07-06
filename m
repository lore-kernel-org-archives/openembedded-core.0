Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBCC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 05:17:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143942.1783315026347170090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 22:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bygHebUa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1647cec851=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6663jTHU2255790
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 05:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3OgjccZQJcNRLM6fQPw18LubWZOy/LCTvinN49TqVTo=; b=
	bygHebUaXKUz4ENSAOy4h5dU7ukxFMvnnxNV6MgHN1ALd8TbawLC6PGPRiqPEGg/
	FM+lW+K7BugTRTgTZGpMOoMWzpx2kG+ufLBfPIuwGzbtFkH3xPUGKMExUEu3Bv3z
	qC1II6ud6Xnoqrq1dqiK8/AFu+Qp7py+rPOBftPzq36ojtIN9iXaqVtenTuxHAPX
	xTITaASbxNb0rEdtHXe66h52tIOqRARIbYcLOq0n0TaOe4kcuI0SJWdTyUWuZUiv
	9eRT5f7cKKij7gb1ZMpT821N9RX3f3nkuawSnT9rejpZ+JTziC81PVPyWqdNJPjj
	+X5ZTlWxc2ZgWWvW5Vqp5A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s589pg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 05:17:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhxPeOOiZ1RKiWv+xfgTSyiy0uEbrPu9L6S6SPBSY2rLYCXQluQiZqTN2689awFPxBg24XJIhwD80G9UIoc5lj8MdBKJhjiBWEk+i6dfWr1hxIIDCwdLtqxfkcTWZP17lcArwoeIYLw1Bug1MdaLeYdKASFlMJC9oXfmlXdMhHBOHxipJqKefzejhizEGRYrGjkQrngxfwkQtf4afRGI1LCVssSz/T8ZSQ9ADF4hfY2+QaU1u5cgJKd8/uGG3QqDWF9DLQwYI1w+M3tHRbho5biK36MwSk7M4EJFdQRhLGfwJdC/peQNRwsd3tRPnzHwaP/jS8aEChObu3RoPwnlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OgjccZQJcNRLM6fQPw18LubWZOy/LCTvinN49TqVTo=;
 b=StNU2bKT44K1dZVeGa8ojPQasHjEWZP1/6x3HPsys61uc6HLJRDMjI0/BP4ctlt2Uc4yAlKqdEZ4VCCqo3gjjfaOgzqnJCrOy6iSQiA5gnGT4+6aMqxxCyJf3cUThhtsusjOrQdSzqmcgqUbufXG+6lnZEjUxHbAts7xnzdLqcTqd4k3xRLxUZvEuBlp84nIc5MNyRpQDYOHETWHUu0OIuwE57qCmfGRwGWDWrJjh4q2WhPm2CEFkPjswZoi0uWR672sp7VCakj8upTVUNhbKlSnjebUbTvyi3gHwaPgqUFMXN+O4FfSqv+DO+cgbNcq1YOT2lvgJ5qB8UykihjwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV0PR11MB9815.namprd11.prod.outlook.com (2603:10b6:408:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 05:17:01 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 05:17:01 +0000
Message-ID: <a56bc0e3-ecd7-4383-aabe-48b7a1f71536@windriver.com>
Date: Mon, 6 Jul 2026 10:46:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH V2] gdb: Upgrade 17.1 -> 17.2
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260630075003.1692482-1-Deepesh.Varatharajan@windriver.com>
 <DJQTD0V57D7M.2UJBWEZBMPTQP@smile.fr>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DJQTD0V57D7M.2UJBWEZBMPTQP@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BN9PR03CA0443.namprd03.prod.outlook.com
 (2603:10b6:408:113::28) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV0PR11MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 09762188-b7fa-4c19-d2be-08dedb1dcf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|3023799007|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	YniPuCBWBzaun806a0eZMh5iSK+MWEDgQaAw9dBH3vvKKjM5p2CVUUQilTun8AK3h/L7X8kzTf5PBpZxUlvORSSXS3TgZjR4d9wKXwDwGqnfJzXRKv8VQZKM6dZaNGRmguaGzDW7XcYccu5h5s3QQruu5nUZtA4janLdfW+Ow9C8JU6JzCnaHlDe0aV+vMw+2boLAg/nCxuyNLJSHgGPH/qSNhLvEhLsUc5cljae3e93UbeqyzPn4PKeShN8z/81LCVsqiCJ/xFqXRhe8Nuim0gDl0+E33ULriVjs4kqwnan6iBqHKFCid0zMk+zzycL1Z7l05Fisikb9f0W8egrP0Yj5dn1RZQ+iomNDjDLkmncIwH6DLEbsoEILFs9txDk8H8sOwu/JuR/GUnusEahZhW96QKuvV6j9aEj+N/6GqBKAetRJbOITNQcRSqjRe7Mh4Jr6i8vwDpCC7Uu+JY0dlDyGoIhzMxGfuSAF9x20gd9A0N8XgNIgsvAoOCnHIaCMlZwQ0XXJhUv8FfrlhWCRY5dAJW4PsZvoFcRZvTxY7QnDks9UsuyLUWibais2oQjiiKuA+0tqEs4Irx8IeVHCTNrI1norD/N382SbA95Tku0S7Id8+ElExyvhTg+gNXp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGQ4V2xzQ3FEaVVzbWZiZUJ6YkorMnl0R2x1TmJ1ZkNkS3Y4azFUd3c5V2o0?=
 =?utf-8?B?dWVveXl5K2gzYVJqSlRaSTRSTTFvTGduUEdWdW1aMUFJWnppSDVuVkovY1lK?=
 =?utf-8?B?Qm5NY1RJcjNmSW95TEN2U2lLQ3FFRHNqWTZnVTFZeEl4NGxxS2RzM2xFTVFy?=
 =?utf-8?B?ZERpRGE1WWh5aElZdXU1SUlaOUd2Vng0M08wamxMWEl0bDM3ZG5tV25IZVZN?=
 =?utf-8?B?cnphL096cCs0aTFXaGxJOG5oWFZvU082QStXUTlXQmllYzJXK0xIQjVySmpE?=
 =?utf-8?B?Uk1xVjV1VWdVcTlmZDZXWXFKT0Q0cDdwM21nQngyb0IrZjdCOWI0bjNxR2hX?=
 =?utf-8?B?cE1uV2s2ckhqaGRVNThGbUxLVzhGeWRKRnZreWR2c0xJR0xmaExTNnpnYnhN?=
 =?utf-8?B?OWdWRHREb21DaitSdUJyUDJ2SEw4WjJ5RmZ3cjVRM2ptcjlKQ1FKaWEwN1l5?=
 =?utf-8?B?eXExZ0t0bTVXS2liQmFqOEl5dGFHeEJDSzBMNXVkSkpRNlFlUTUwaGFaYkpt?=
 =?utf-8?B?V2gza2VGN3oxejEwUWxNNkdWRXpnaEIxQ0RQTDVock0rMkNkNmQ3WFo1UlVN?=
 =?utf-8?B?NGRVa2xEQmF3RDNtY3JVZTEySW9EZnZ3bXlZNTRzeVAzRTg4eFdpZm8rRDM1?=
 =?utf-8?B?UnN2WGZpTHdoa1hDSWFvM29RVzU2QWJzVS9qYnhoeVhGK1lTcGVmS0dhWGRQ?=
 =?utf-8?B?ZG9sZW5ydFRicW9vNFRmc2ErSVd0WURMclk3SC9PVnpMV3QrS1pLU2s2V1lL?=
 =?utf-8?B?YnliYmZQcVZ4RW1HTkVqTHRld3g0ZldOeXBPaCtta0J2RlNpTmdoQWw3L3hJ?=
 =?utf-8?B?eXpZVVZ6YlBLUWUzckY4eUllcFhza1lKU3Q5cUtPVDhtamZ4akl2ZDQzNGN4?=
 =?utf-8?B?YkxMRXFFTmViendraThUYzF0YjliWTdJc2pBdUNZQU9RM1FucktLb0JnRVN1?=
 =?utf-8?B?bjZxZ0x3VktFaG5uTWVVMW5neWlGU0ZaMkRxY1Nnc0hMbmR1SDc2TFpYd2Rs?=
 =?utf-8?B?RER4Nkdpa2JmT2hpMndxazArK2REUFVGQlJlcjBkdFRzV29oT0kra2FURjQ0?=
 =?utf-8?B?REM5RTIwRE43QjVWMStteDNlUTQwUEpEMjd5S2lWRHFhU29XbzgvNUlpeEJJ?=
 =?utf-8?B?NmNWUnFKaW9LYUhzdVREVmRxc3ZHc2g2dWtvMWhyd0FpOG5qVHQrSUQvZVI4?=
 =?utf-8?B?ck9ZaExKSFBiLzNIQ2ZtZEdkRHk5cmVnQWtzWko4Z051SkM0N2JHVjFXYjFz?=
 =?utf-8?B?OE1xNVNTdHRwYlBUeC93T1Q0VnFXMVFwTDdYd0VyZXBDNUZWQ2xTOGo4dTR6?=
 =?utf-8?B?QmVqMWUzZmxBa242b0RsRzFnNTBmZkNJUWdrWm9WcHlidmQ4YVVUM1c3RHlI?=
 =?utf-8?B?UTc2YXRUVGJiS01lR0hnTWo4SHB6d1gzTFNNVzBTaysyZUxiWC9oY3NTV0FE?=
 =?utf-8?B?SG1UVGl3TmdTMXNjL1BuSStHdjFYNWpOZUh4TS81QUlHS0lpYjBtaXJRRDhz?=
 =?utf-8?B?WlkvVkhBY2Y5ZXEzY2pZZkZTNmE1ZjE4WWlRa1VjMGxOaVJkS0JjUk1hSk1y?=
 =?utf-8?B?UUR0QnhjaCsvY2JoWWhHSDR4aUhzcXRVYmMyRWtnNnkyamxLckcwYk1IVm0v?=
 =?utf-8?B?emNoSGEweS9PYklDNTQxWDdaYWtqRnVSd3VoN1lSeDBuS3UwdXQxQUZob0pZ?=
 =?utf-8?B?Y0dIU1Q0a3hlK1JyNDY5YjBCOGQxTG9nVE9ZdFQwWDRvVUxFU0g2c3Y0OFV4?=
 =?utf-8?B?RVpITmc5UlBpMUVwRHZVZmNYU1FWNkhTL0U2YU5lSUFjbm4zTVZtYTNYY0Y4?=
 =?utf-8?B?K2dncmlEN2VBekpleXMwQ2lzQ1FTODBzN044S3ZMYTJEcDVOVG9XRTRFVUdN?=
 =?utf-8?B?NjBQZFlVaG9oeDFIQXczMnlHWk1XOWtjOFBHVkJCeVNKbS9jSzZBbjB4Vlho?=
 =?utf-8?B?bWlGeExSaDZ2dGpWdk1zVWZnb1dydGcvSGEzdllLYy9mRzYvZWNWbGh2Y1JM?=
 =?utf-8?B?RHZPVzViTldqL1g5Q0NpL2RMSjJvYlV6bHhpZExpSUtndSthTGhJemlzWit6?=
 =?utf-8?B?a2dDTHNCSE9uM3BxejR3NFd6Y3FFMVBLVEdiUVViSGZzZ05GTGd5cGNibW5V?=
 =?utf-8?B?bmdHUy9LTkI5R1Z0YUFJbWkwaHFNVm4rYmcrK0xSajUxRkRacFA0R1RsZEMr?=
 =?utf-8?B?TmU2V3BRNGhDY0RGTStoRUdoT2llR0NMMlQ2UDF1T2ovZENXdU5RRUx5Y1JS?=
 =?utf-8?B?c1R1SzBTUG5PaVJlYTZJR1lwU05FL2JMSVhBd2k3dXA0amllTHJ5RGdHZkNR?=
 =?utf-8?B?OWI4SlVWWmxaVzBGemtuVmxGNWUxU2JmN2RrQjgxSlVZZHAwdHJOaDJMOEpD?=
 =?utf-8?Q?ESn4hwrk5VKoV2LA7nOXsiP7Czyxosdntw+8w?=
X-Exchange-RoutingPolicyChecked: 
	PcqEbTGjRUcTzdqq5MvHN3yGy8o/SJVydRSzVOpFpclCewuTbrM8DZOdlNGeuBPqr1YXEbfHRCtJlfR7n8/5+e4UrkEuMVn0d+Jm/kWJN2wRoZetEOMSTg5Ygv98wCIwsa4zFC5sHvYazpXIYqR4iUR8Vzo9WDC43aC1GSDXbzUZDXf9lEbLesnl7h7/4jZePns5h5JENxGdcjYqyHXRQUE76KaaJvlfLSns3ZNNPMyc+KZg41EUg4wfLp/jLYxaSFx/JJr1Tl+3He+eJTXOmseHKNMi87Kt8rEMfyQ++joyusNBi6nd7js8FHgRB99GtKwihKaDzyxxAgiXjXea9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09762188-b7fa-4c19-d2be-08dedb1dcf25
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 05:17:01.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZeeTZhVuJ0MGBtO84UE+3sZTcP7Okh5TctG2dPA/buqJKs1Kl6nEzTDCEDcnfJp75yW5ofAWO1ufsEG3xhF+O32l1fgcDwwxUC1KF95FBesL56b5hxOeqOPizveWN5y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9815
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfXxPBqSYNeQaxe
 fxnze+Py4dU43r3e708012nXNvsUxPG/6G97SLkfl+01LeW1wkuWAJi8CNIWdWrjbMPkw0ew+ME
 gVWEA6fabta7S20zyiohuuDEpm5HPYd9pOIpGFgLR2e/y7FPIFth
X-Proofpoint-ORIG-GUID: xcPXXAXPHpGOcpirUaTf3rf1qnTN4tlY
X-Proofpoint-GUID: w_vHCqhTOzxgj2eMu_Q7GamJQMsuv1up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfX80sc4hetix4D
 S2WegclsTRrSvVhyWuBXnIdLMPqfk7Xt+l3U4M8Uhi+v3dl+jM9ercAqJT0E+hHVU5/8dbtl+64
 Bk+eX6vl47Z5hOLvrRiy/O/s9x0MzmNgknBI9AVNAzao+fPY1msg8sAu2FMCtq3pP+YtsApymVj
 sAiiao5PJOygCNpowV5ECXzre9ueZM55vL8knC5/bvEObEfVRLd7fdyvc1z9B99nEuJEi9iF7XP
 n7nuV51BFMFB+Z/SoGtof9UHn4Bi+6a3pS87AEmH22FBpKHUm9O6q/rt2x4BzlMuzkVaPsNql/K
 RWAqcRzqlOWeSA+/On8khreiXU9XkZwwCwgNoZfOthcsGQh2cXuN/mk7ZN/CLEu02SmbSSFMH/T
 ZKwWaWcpjDvuHZEGekYAnwqRNlGaR3K6If9w/tj4vkKajE7ILiSCtKWbAekLuxzsns97wXdbMka
 todvBL1zT8mj1TaHoKg==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4b3a50 cx=c_pps
 a=uwUl5xS/OuIXHPkYzYKLCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=BcPKCTjPAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=SDzdZkTV1bJ9NBDC13UA:9
 a=HCINmKHFQ_U6d0ff:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=MNXww67FyIVnWKX2fotq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6663jTHU2255790
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 05:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240211


On 05-07-2026 22:59, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Jun 30, 2026 at 9:50 AM CEST, Deepesh via lists.openembedded.org=
 Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This is a corrective release over GDB 17.1, fixing the following issue=
s:
>>
>>   * PR dap/33228 ([gdb/dap] error while listing register children)
>>
>>   * PR gdb/33737 (gdb --help says 'For more information, type "stream"
>>     from within GDB', but "stream" is not a defined command)
>>
>>   * PR build/33747 (Incompatible with MUSL libc: no member named 'c_os=
peed'
>>     in 'termios')
>>
>>   * PR gdb/33748 (gdb17 regression with displaying ANSI colors)
>>
>>   * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
>>     and static data don't mix)
>>
>>   * PR cli/33761 (Setting style colors is broken on MS-Windows)
>>
>>   * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scrip=
ts fails)
>>
>>   * PR symtab/33775 ([gdb/symtab] data race in
>>     dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})
>>
>>   * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache res=
ult
>>     for dummy CU)
>>
>>   * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compr=
essed
>>     debug info (thousands of partial units))
>>
>>   * PR testsuite/33845 (gdb: There are 4 unexpected failures in
>>     breakpoint-in-ro-region.exp)
>>
>>   * PR gdb/33872 (`skip -gfile` has inverted logic)
>>
>>   * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on=
 musl)
>>
>>   * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for mat=
ches
>>     outside of `file` [reproducer attached])
>>
>> Drop patches merged upstream:
>>    * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
>>    * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> When looking at the commit log:
>     $ git log --format=3Doneline --abbrev-commit gdb-17.1-release..gdb-=
17.2-release |grep -v "Automatic date update in version.in"
>    7adf9fa6b1c Set GDB version number to 17.2.
>    063b0d3f0b3 [gdb/breakpoints] Don't ignore <file> in rbreak <file>:<=
regexp>
>    17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support =
for custom baud rates
>    56c4ba5d7b5 gdb/ser-unix: fix musl build failure when setting custom=
 baud rates
>    1ccc3f6a2e2 GDB: aarch64-linux: Fix build failure on musl systems
>    a4477520f93 gdb: Fix unexpected failures in breakpoint-in-ro-region.=
exp
>    eaf673ca75c gdb: Make test result accurate in breakpoint-in-ro-regio=
n.exp
>    91080fe0d50 Revert "skip -gfile: call fnmatch without FNM_FILE_NAME"
>    36356c77b89 [gdb/symtab] Fix slow symbol lookup with dwz
>    07e542a3bd0 gdb/
>    101b318a6a6 gdb: fix handling of raw ANSI escape sequences printed f=
rom Python
>    0ac91006f95 [gdb/symtab] Cache dw2_get_file_names result for dummy C=
U
>    32adc7212e4 gdb/dwarf: make dwarf2_per_cu size fields atomic
>    59ffbefc0ee [gdbsupport] Fix get_print_cell use in threads
>    0926b8b8339 gdb: fix loading compressed scripts from `.debug_gdb_scr=
ipts`-section
>    8e246f43277 Change handling of over-long DAP variables requests
>    4393da33773 Fix --help output
>    35880717849 Bump GDB's version number to 17.1.90.DATE-git.
>
> ... one commit stands out: "17d05df7da1 gdb/ser-unix: add POSIX cfsetis=
peed/cfsetospeed support for custom baud rates".
> This look like feature addition (e.g new config option). But, in this
> case, if I understood correctly, this is the merged version of the
> removed patch "0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-ba=
u.patch",
> so this should be okay to merge but I think the commit message must
> include this explanation.
Yes, you are right that feature/bug fix is already part of wrynose as a=20
local patch.
Will explain in commit message and send V3.
>
> I wonder why this particular change was not part of the changelog you
> added...
It's there in the commit message.

* PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
 =C2=A0 =C2=A0in 'termios')

The above PR brings in the below commit.

17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support for=20
custom baud rates

Regards,
Deepesh

>
> Can you send a new version with all the above elements?
>
> Thanks!
>
>> ---
>>   ...ian_17.1.bb =3D> gdb-cross-canadian_17.2.bb} |   0
>>   .../{gdb-cross_17.1.bb =3D> gdb-cross_17.2.bb}  |   0
>>   meta/recipes-devtools/gdb/gdb.inc             |   4 +-
>>   ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ----------------=
--
>>   ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
>>   .../gdb/{gdb_17.1.bb =3D> gdb_17.2.bb}          |   0
>>   6 files changed, 1 insertion(+), 447 deletions(-)
>>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb =3D> gd=
b-cross-canadian_17.2.bb} (100%)
>>   rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb =3D> gdb-cross_1=
7.2.bb} (100%)
>>   delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-g=
db-ser-unix-modernize-Linux-custom-bau.patch
>>   delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-li=
nux-Fix-build-failure-on-musl-systems.patch
>>   rename meta/recipes-devtools/gdb/{gdb_17.1.bb =3D> gdb_17.2.bb} (100=
%)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/me=
ta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
>> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipe=
s-devtools/gdb/gdb-cross_17.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
>> rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
>> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools=
/gdb/gdb.inc
>> index d367486d02..cbb5885459 100644
>> --- a/meta/recipes-devtools/gdb/gdb.inc
>> +++ b/meta/recipes-devtools/gdb/gdb.inc
>> @@ -13,7 +13,5 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>>              file://0006-Fix-invalid-sigprocmask-call.patch \
>>              file://0007-Define-alignof-using-_Alignof-when-using-C11-=
or-newe.patch \
>>              file://0008-Add-fix-for-packages-that-are-not-compatible-=
with-C2.patch \
>> -           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-cust=
om-bau.patch \
>> -           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-sy=
stems.patch \
>>              "
>> -SRC_URI[sha256sum] =3D "14996f5f74c9f68f5a543fdc45bca7800207f91f92aee=
a6c2e791822c7c6d876"
>> +SRC_URI[sha256sum] =3D "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2=
ea793c12a9f19a3228c"
>> diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-u=
nix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009=
-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
>> deleted file mode 100644
>> index 30d22b21f9..0000000000
>> --- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-mod=
ernize-Linux-custom-bau.patch
>> +++ /dev/null
>> @@ -1,248 +0,0 @@
>> -From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 200=
1
>> -From: Sunil Dora <sunilkumar.dora@windriver.com>
>> -Date: Tue, 17 Mar 2026 01:58:55 -0700
>> -Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom b=
aud rate
>> - support
>> -
>> -The Linux custom baud rate implementation previously accessed the
>> -struct termios members c_ispeed and c_ospeed directly. These fields
>> -exist in glibc but are not exposed by musl, causing builds to fail on
>> -musl-based systems.
>> -
>> -Update set_custom_baudrate_linux to use a capability-based approach,
>> -with three distinct code paths:
>> -
>> -1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
>> -   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
>> -   speeds.
>> -
>> -2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
>> -   use it to support arbitrary baud rates.
>> -
>> -3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
>> -   the TCGETS/TCSETS fallback (primarily for glibc on older
>> -   architectures).
>> -
>> -4) Otherwise, emit an error indicating that custom baud rates are
>> -   unsupported on this platform.
>> -
>> -This preserves existing behavior on glibc systems while restoring
>> -build compatibility with musl and other libc implementations.
>> -
>> -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747
>> -
>> -Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patc=
hes/2026-March/225952.html]
>> -
>> -Suggested-by: Kevin Buettner <kevinb@redhat.com>
>> -Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>> ----
>> - gdb/config.in    |  6 ++++++
>> - gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
>> - gdb/configure.ac | 22 +++++++++++++++++++
>> - gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++------------=
--
>> - 4 files changed, 119 insertions(+), 16 deletions(-)
>> -
>> -diff --git a/gdb/config.in b/gdb/config.in
>> -index efc3100cb9e..b2469c8dabd 100644
>> ---- a/gdb/config.in
>> -+++ b/gdb/config.in
>> -@@ -110,6 +110,9 @@
>> -    the CoreFoundation framework. */
>> - #undef HAVE_CFPREFERENCESCOPYAPPVALUE
>> -
>> -+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
>> -+#undef HAVE_CFSETSPEED_ARBITRARY
>> -+
>> - /* Define if compiling support to gdb compile. */
>> - #undef HAVE_COMPILE
>> -
>> -@@ -517,6 +520,9 @@
>> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
>> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
>> -
>> -+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
>> -+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
>> -+
>> - /* Define to 1 if `td_pcb' is a member of `struct thread'. */
>> - #undef HAVE_STRUCT_THREAD_TD_PCB
>> -
>> -diff --git a/gdb/configure b/gdb/configure
>> -index d0bdba6eb36..8a0e2fa2771 100755
>> ---- a/gdb/configure
>> -+++ b/gdb/configure
>> -@@ -27336,6 +27336,58 @@ if test "$ac_res" !=3D no; then :
>> - fi
>> -
>> -
>> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
>> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispee=
d/cfsetospeed accept arbitrary baud rates" >&5
>> -+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrar=
y baud rates... " >&6; }
>> -+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
>> -+  $as_echo_n "(cached) " >&6
>> -+else
>> -+
>> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>> -+/* end confdefs.h.  */
>> -+#include <termios.h>
>> -+int
>> -+main ()
>> -+{
>> -+
>> -+       #if B9600 !=3D 9600
>> -+       #error B-constants are not numeric symbols
>> -+       #endif
>> -+
>> -+  ;
>> -+  return 0;
>> -+}
>> -+_ACEOF
>> -+if ac_fn_c_try_compile "$LINENO"; then :
>> -+  gdb_cv_cfsetspeed_arbitrary=3Dyes
>> -+else
>> -+  gdb_cv_cfsetspeed_arbitrary=3Dno
>> -+fi
>> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>> -+
>> -+fi
>> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_=
arbitrary" >&5
>> -+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
>> -+
>> -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
>> -+
>> -+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
>> -+
>> -+fi
>> -+
>> -+# Check for members required by the legacy Linux custom baud rate pa=
th.
>> -+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_me=
mber_struct_termios_c_ospeed" "#include <termios.h>
>> -+"
>> -+if test "x$ac_cv_member_struct_termios_c_ospeed" =3D xyes; then :
>> -+
>> -+cat >>confdefs.h <<_ACEOF
>> -+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
>> -+_ACEOF
>> -+
>> -+
>> -+fi
>> -+
>> -+
>> -
>> -
>> - # Check whether --with-jit-reader-dir was given.
>> -diff --git a/gdb/configure.ac b/gdb/configure.ac
>> -index 52924106bca..26e8d1ee276 100644
>> ---- a/gdb/configure.ac
>> -+++ b/gdb/configure.ac
>> -@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
>> -
>> - AC_SEARCH_LIBS(dlopen, dl)
>> -
>> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
>> -+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary bau=
d rates],
>> -+  [gdb_cv_cfsetspeed_arbitrary], [
>> -+  AC_COMPILE_IFELSE(
>> -+    [AC_LANG_PROGRAM([[#include <termios.h>]],
>> -+      [[
>> -+       #if B9600 !=3D 9600
>> -+       #error B-constants are not numeric symbols
>> -+       #endif
>> -+      ]])],
>> -+    [gdb_cv_cfsetspeed_arbitrary=3Dyes],
>> -+    [gdb_cv_cfsetspeed_arbitrary=3Dno])
>> -+])
>> -+
>> -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
>> -+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
>> -+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud =
rates])
>> -+fi
>> -+
>> -+# Check for members required by the legacy Linux custom baud rate pa=
th.
>> -+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <term=
ios.h>]])
>> -+
>> - GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
>> -                 [directory to load the JIT readers from],
>> -                 [${libdir}/gdb])
>> -diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
>> -index 6f2766518be..fbd73970dbb 100644
>> ---- a/gdb/ser-unix.c
>> -+++ b/gdb/ser-unix.c
>> -@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int =
baud_code)
>> -
>> - #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
>> -
>> --/* Set a custom baud rate using the termios BOTHER.  */
>> -+/* Set a custom baud rate.
>> -+
>> -+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accept=
s
>> -+   arbitrary baud rates.  Otherwise fall back to Linux-specific term=
ios2
>> -+   (BOTHER) or legacy termios interfaces.  */
>> -
>> - static void
>> - set_custom_baudrate_linux (int fd, int rate)
>> - {
>> --#ifdef TCGETS2
>> --  struct termios2 tio;
>> --  const unsigned long req_get =3D TCGETS2;
>> --  const unsigned long req_set =3D TCSETS2;
>> --#else
>> -+#if defined(HAVE_CFSETSPEED_ARBITRARY)
>> -   struct termios tio;
>> --  const unsigned long req_get =3D TCGETS;
>> --  const unsigned long req_set =3D TCSETS;
>> --#endif
>> -+  if (tcgetattr (fd, &tio) < 0)
>> -+    perror_with_name (_("Cannot get current baud rate"));
>> -+
>> -+  cfsetispeed (&tio, rate);
>> -+  cfsetospeed (&tio, rate);
>> -+
>> -+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
>> -+    perror_with_name (_("Cannot set custom baud rate"));
>> -+
>> -+#elif defined(TCGETS2)
>> -+  struct termios2 tio2;
>> -+  if (ioctl (fd, TCGETS2, &tio2) < 0)
>> -+    perror_with_name (_("Cannot get current baud rate"));
>> -+
>> -+  tio2.c_cflag &=3D ~CBAUD;
>> -+  tio2.c_cflag |=3D BOTHER;
>> -+  tio2.c_ospeed =3D rate;
>> -+  tio2.c_cflag &=3D ~(CBAUD << IBSHIFT);
>> -+  tio2.c_cflag |=3D BOTHER << IBSHIFT;
>> -+  tio2.c_ispeed =3D rate;
>> -
>> --  if (ioctl (fd, req_get, &tio) < 0)
>> --    perror_with_name (_("Can not get current baud rate"));
>> -+  if (ioctl (fd, TCSETS2, &tio2) < 0)
>> -+    perror_with_name (_("Cannot set custom baud rate"));
>> -+
>> -+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
>> -+  struct termios tio;
>> -+  if (ioctl (fd, TCGETS, &tio) < 0)
>> -+    perror_with_name (_("Cannot get current baud rate"));
>> -
>> --  /* Clear the current output baud rate and fill a new value.  */
>> -   tio.c_cflag &=3D ~CBAUD;
>> -   tio.c_cflag |=3D BOTHER;
>> -   tio.c_ospeed =3D rate;
>> --
>> --  /* Clear the current input baud rate and fill a new value.  */
>> -   tio.c_cflag &=3D ~(CBAUD << IBSHIFT);
>> -   tio.c_cflag |=3D BOTHER << IBSHIFT;
>> -   tio.c_ispeed =3D rate;
>> -
>> --  if (ioctl (fd, req_set, &tio) < 0)
>> --    perror_with_name (_("Can not set custom baud rate"));
>> -+  if (ioctl (fd, TCSETS, &tio) < 0)
>> -+    perror_with_name (_("Cannot set custom baud rate"));
>> -+
>> -+#else
>> -+  error (_("Custom baud rate not supported on this platform"));
>> -+#endif
>> - }
>> -
>> - #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
>> ---
>> -2.49.0
>> -
>> diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-=
build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-=
GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
>> deleted file mode 100644
>> index 2d91a351d2..0000000000
>> --- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-f=
ailure-on-musl-systems.patch
>> +++ /dev/null
>> @@ -1,196 +0,0 @@
>> -From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 200=
1
>> -From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
>> -Date: Tue, 17 Mar 2026 02:24:48 -0700
>> -Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl system=
s
>> -
>> -(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
>> -
>> -When building against musl (e.g. on Alpine Linux), the following erro=
r
>> -happens:
>> -
>> -    CXX    linux-aarch64-low.o
>> -  In file included from /home/bauermann/src/binutils-gdb/gdbserver/li=
nux-aarch64-low.cc:42:
>> -  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-=
linux.h:35:8: error: redefinition of 'struct user_gcs'
>> -     35 | struct user_gcs
>> -        |        ^~~~~~~~
>> -  In file included from /home/bauermann/src/binutils-gdb/gdbserver/li=
nux-aarch64-low.cc:35:
>> -  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'stru=
ct user_gcs'
>> -    329 | struct user_gcs {
>> -        |        ^~~~~~~~
>> -  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
>> -
>> -aarch64-linux-tdep.c fails to build in the same way.  This happens be=
cause
>> -aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
>> -have GCS-related definitions.  The problem is that GCS_MAGIC is defin=
ed in
>> -<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
>> -It's fine on glibc systems because in the set of system headers that
>> -linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontex=
t.h>
>> -ends up being included implicitly as well.  This doesn't happen when =
using
>> -musl's headers though.
>> -
>> -There isn't a macro in <asm/ptrace.h> whose presence is correlated wi=
th
>> -the presence of the struct user_gcs definition, so a configure check =
is
>> -needed to detect it and conditionally define the struct.
>> -
>> -Also, this change requires aarch64-linux-tdep.c to stop using
>> -struct user_gcs because target-dependent code can't include <asm/ptra=
ce.h>
>> -and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
>> -struct definition available. To fix this problem, also backport the
>> -definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
>> -
>> -Note that there's another build issue with musl, described in
>> -PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
>> -able to test this patch, I applied the patch in comment 11 there.
>> -
>> -Tested with a native build on an Alpine Linux aarch64 system, and als=
o
>> -verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
>> -
>> -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33926
>> -
>> -Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patc=
hes/2026-March/226049.html]
>> -
>> -Co-authored-by: Chris Packham <judge.packham@gmail.com>
>> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>> ----
>> - gdb/aarch64-linux-tdep.c     |  5 +++--
>> - gdb/arch/aarch64-gcs-linux.h |  8 +++++---
>> - gdbsupport/config.in         |  3 +++
>> - gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++=
++
>> - gdbsupport/configure.ac      | 19 +++++++++++++++++++
>> - 5 files changed, 66 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
>> -index 76bde85188b..6c402e7ecdd 100644
>> ---- a/gdb/aarch64-linux-tdep.c
>> -+++ b/gdb/aarch64-linux-tdep.c
>> -@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (str=
uct gdbarch *gdbarch,
>> -       gcs_regmap, regcache_supply_regset, regcache_collect_regset
>> -     };
>> -
>> --      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
>> --      &aarch64_linux_gcs_regset, "GCS registers", cb_data);
>> -+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
>> -+      AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
>> -+      "GCS registers", cb_data);
>> -     }
>> - }
>> -
>> -diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linu=
x.h
>> -index 018ca37a522..632823a8120 100644
>> ---- a/gdb/arch/aarch64-gcs-linux.h
>> -+++ b/gdb/arch/aarch64-gcs-linux.h
>> -@@ -27,8 +27,7 @@
>> - #define HWCAP_GCS (1ULL << 32)
>> - #endif
>> -
>> --/* Make sure we only define these if the kernel header doesn't.  */
>> --#ifndef GCS_MAGIC
>> -+#ifndef HAVE_STRUCT_USER_GCS
>> -
>> - /* GCS state (NT_ARM_GCS).  */
>> -
>> -@@ -39,6 +38,9 @@ struct user_gcs
>> -   uint64_t gcspr_el0;
>> - };
>> -
>> --#endif /* GCS_MAGIC */
>> -+#endif /* HAVE_STRUCT_USER_GCS */
>> -+
>> -+/* The GCS regset consists of 3 64-bit registers.  */
>> -+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
>> -
>> - #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
>> -diff --git a/gdbsupport/config.in b/gdbsupport/config.in
>> -index 0beacf22c05..2957ee0f030 100644
>> ---- a/gdbsupport/config.in
>> -+++ b/gdbsupport/config.in
>> -@@ -271,6 +271,9 @@
>> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
>> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
>> -
>> -+/* Define to 1 if your system has struct user_gcs. */
>> -+#undef HAVE_STRUCT_USER_GCS
>> -+
>> - /* Define to 1 if you have the <sys/param.h> header file. */
>> - #undef HAVE_SYS_PARAM_H
>> -
>> -diff --git a/gdbsupport/configure b/gdbsupport/configure
>> -index 133ddfa7f6c..66135791aa5 100755
>> ---- a/gdbsupport/configure
>> -+++ b/gdbsupport/configure
>> -@@ -14307,6 +14307,42 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
>> -
>> -
>> -
>> -+# Check for `struct user_gcs`
>> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gc=
s" >&5
>> -+$as_echo_n "checking for struct user_gcs... " >&6; }
>> -+if ${gdb_cv_struct_user_gcs+:} false; then :
>> -+  $as_echo_n "(cached) " >&6
>> -+else
>> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>> -+/* end confdefs.h.  */
>> -+#include <sys/ptrace.h>
>> -+     #include <asm/ptrace.h>
>> -+int
>> -+main ()
>> -+{
>> -+struct user_gcs u;
>> -+
>> -+  ;
>> -+  return 0;
>> -+}
>> -+_ACEOF
>> -+if ac_fn_c_try_compile "$LINENO"; then :
>> -+  gdb_cv_struct_user_gcs=3Dyes
>> -+else
>> -+  gdb_cv_struct_user_gcs=3Dno
>> -+
>> -+fi
>> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>> -+
>> -+fi
>> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user=
_gcs" >&5
>> -+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
>> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
>> -+
>> -+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
>> -+
>> -+fi
>> -+
>> - # Set the 'development' global.
>> - . $srcdir/../bfd/development.sh
>> -
>> -diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
>> -index b7ccfabd6c6..d3b4c05daeb 100644
>> ---- a/gdbsupport/configure.ac
>> -+++ b/gdbsupport/configure.ac
>> -@@ -68,6 +68,25 @@ GDB_AC_PTRACE
>> - AM_GDB_COMPILER_TYPE
>> - AM_GDB_WARNINGS
>> -
>> -+# Check for `struct user_gcs`
>> -+AC_CACHE_CHECK(
>> -+  [for struct user_gcs],
>> -+  [gdb_cv_struct_user_gcs],
>> -+  [AC_COMPILE_IFELSE(
>> -+     [AC_LANG_PROGRAM(
>> -+    [#include <sys/ptrace.h>
>> -+     #include <asm/ptrace.h>],
>> -+    [struct user_gcs u;]
>> -+      )],
>> -+     [gdb_cv_struct_user_gcs=3Dyes],
>> -+     [gdb_cv_struct_user_gcs=3Dno]
>> -+  )]
>> -+)
>> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
>> -+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
>> -+        [Define to 1 if your system has struct user_gcs.])
>> -+fi
>> -+
>> - # Set the 'development' global.
>> - . $srcdir/../bfd/development.sh
>> -
>> ---
>> -2.49.0
>> -
>> diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devt=
ools/gdb/gdb_17.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb_17.1.bb
>> rename to meta/recipes-devtools/gdb/gdb_17.2.bb
>
> --
> Yoann Congal
> Smile ECS
>

