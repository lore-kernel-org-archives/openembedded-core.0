Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9460C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 11:54:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35541.1769082882453695341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 03:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=A9SKo6Kg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5482e5163f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8JZXW1996296
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 03:54:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MgRQzVcSvHnzH55O7X4gmDwrIKQRO5vWU/UoWDlHqb0=; b=
	A9SKo6Kg8XFh8sUQJ0d3ED84JI3jr7+3IpZx1yDjE1Ivq6aAVLjBTd4LwO1SsiQp
	gRuaP8+MhK+cCezPXeEKSCqZUyoP1QuH/ymDABG038nkg4gn/eTVR38kqStea7MH
	rvtaCwirDJu4Ww5M/ITdjGk1Ax8O4O6hjk+E0GQJacAYzkBWn4uMTOar3tgsTesm
	Tkvs7CQtUwI7IRan6Xjog6N/sFVQ1T7tOzGSbjeSP/QtAY0d7Qb9sHHy+XuAokQE
	eix6yJd5MPN9JRmF64GT02oVwYG8MW5H1qnrDP74z9Ke87/lAS3eZ3HpvoYpXYqn
	16/tmMFY0UQjG1D9FVrhOw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75tau2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 03:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0orcoscuddHZDe/JtWDXU/B+IZBfMZMS0+s4KqjZMazR4M/SBgCrgRtAtD7ItPOpnHNq0Usjh72fSeyG1uMdEIgX2UdUi9XSleIpw/BoHEbJL/0IZ8drgSi63IXaZszCzooRDjD0+/Xr0nrFFIVzT42cVPX/aQrUP3Kptd9ONTvVSm8aopHn+pGbU5eotZIeVmIzHbQCz8exrfmD/iO5Ad3m1vEo9PY4M6msPc4lDpC82AGPSGhBGajoNlJO2j8k7M27GNtRSXNf9ejGSRwlNLrGaJc1YRJTHcF4IXMbR6+sOnMysNDRtGE/MF5vffO1GFUNrs6a2TQBGEHx27TlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgRQzVcSvHnzH55O7X4gmDwrIKQRO5vWU/UoWDlHqb0=;
 b=YxoGVisCb1F5IvXw95ZmGczfRTYNXS6j5Zf1pyHNj03j9qgPlWNg2/W9lDw/ZZvIstefGP8COL0G9W65gYuqfn7rXcdASQ/5ETMGhC6RAOp/APDdJCKfkV0ndJncZ4wN+TyURMjecOFgFCAk6/LA0+QLkDpTuM/7K+kGJixAlgETGZz06bfHkLQlo26TopUuHNGtAXQZxh944dJjkpURVr9rCm3wN4iI66MiqKBQR2NiOcwRJEUMSUM/QVrMnXAQdHmx1EKZYBi9i5C3Ie2f4r4+2P3QeEWPQqbHB5SgwxARdFek1Eb9WGHGM7o97+1JCbTT2WyCrr1RGv/n/yK/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 11:54:38 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:54:38 +0000
Message-ID: <861537f9-f284-48a7-8fd7-8a0aeac02c8c@windriver.com>
Date: Thu, 22 Jan 2026 19:54:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rpm: 4.20.1 -> 6.0.1
From: Robert Yang <liezhi.yang@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1768802844.git.liezhi.yang@windriver.com>
 <c75310f8f8162bcca3c24dcaf9230cbbdec3f399.1768802844.git.liezhi.yang@windriver.com>
 <CANNYZj_pDx1bwBx4wphrnesESKUBJT3atpk5CWcgTQ_HwN0vgw@mail.gmail.com>
 <3a203618-fa59-4672-9f5b-995aa1e0f3b4@windriver.com>
Content-Language: en-US
In-Reply-To: <3a203618-fa59-4672-9f5b-995aa1e0f3b4@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1f058a-4430-4bc8-6e9b-08de59ad0502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEkxa29hNkVPZUZqcFA5RmROZ2FRQVBuSmJ3RktLTDlIMmdKMmZZb1pLYnhC?=
 =?utf-8?B?a3hlRlFlUUxYZC9hLzdsV0cxdXpOb0xOZ3QyMFVNM2oyQ211STFIeUt1RzBB?=
 =?utf-8?B?U1pjdXErVWRjUnZ0cFRjR1RsRkpkem1aR3VRNE5CekVzbkJwYXF0S3FtMW9O?=
 =?utf-8?B?Qm9oTFF5anhjdkFPU0dqMmVaSW4zYmJHZTl1dE92ZjAvR2ZlYUxzdFF0WXV1?=
 =?utf-8?B?ZjF5Ym0vamhXQ2hNNUxIUTFJSzRHelpZeTBicmg2UUl1NFNNRnZCWXpmRkhM?=
 =?utf-8?B?ekovWnExQXBLMnMxazdoUDJCUGJFZENqdHdKMWlDRFZveExuNitMSWFBN1Iz?=
 =?utf-8?B?QjRjU0VpSElSZjB1QlVmOG5MZVdSWk9QbFE5RGsyU1FjcnhBdU1wSE1weVRV?=
 =?utf-8?B?MDN3dEplYkNmNVcxdlZURVF3LytLcUdMZzh4OThsakpNcmgrSnFaNE4vSUFt?=
 =?utf-8?B?UW9UaTI4L0VITFgrWmZORjBpOUVUUFYwQlZ5Q1dwUDlHWHk1SEl3SVNRU0pP?=
 =?utf-8?B?WDlXd1daZWNiWG0xUkZ5c09yRTdHS1VnU3NUd04xN2pIMEJ2WGhsSnppR0hC?=
 =?utf-8?B?ZWdkWSswNVJWV1BFUzY2bmlOMDYzUzlhSTRoR2poTFNYSm9TMzAyVzFBZEZ6?=
 =?utf-8?B?Qkk0R2t4RnhKbnl2S2xCaGNCNTdFU1JqS0VQVVV5YmlwRmU3Q2NybitSUnR3?=
 =?utf-8?B?QWVWcjRXVC95TXE3S1RLa3pRY3RvQzhDbk1mYWtpc1ozcjV6alVPNkZkUkZ3?=
 =?utf-8?B?dVN0ZEdtNzZVK0V0NkdWQ05EQm5QaXFiMHlKdTFna3NYY0p5RnRycG55ZENE?=
 =?utf-8?B?QnFVaTQ0dVJTK0NrM0tjZ0toTEhTUkgrTGNwd0duS2pkRFpkM1pyNmIxbGpU?=
 =?utf-8?B?RkRvekQ3Z21mWWxyd3RUamQrK1pXNVByUTlGQUpxRmFHS21HYWYzTWdCdm9i?=
 =?utf-8?B?RVZBTnkvWkUwdGFkSUVIK0pqTDFydjJtRG54aHFGTHBwTzhVT3J2OHQ1N0p4?=
 =?utf-8?B?ak1aZTl5aENSdzUzdGZObkljeVFralNBMTQ1UFdQWU0zWG5meHlnNzVOVTFi?=
 =?utf-8?B?bG0rbmtiL0gwalFtK0ZRR3JlRmpWQ3dZNDNOdWtrUWxjeHg2dDlhREZPWGxN?=
 =?utf-8?B?UFl5U2daMFZKa1cxeUFwMVQzR3ZJN1pDbmo0K0xBL3FvWVBIV2plaEo3Y0xr?=
 =?utf-8?B?OWFLMGE0S0gvYndhOVJGMnlrZkpGcTFRZ2lkZ290S0ZINHhMMDBVcU5CaUdW?=
 =?utf-8?B?Wm5tK3RJSWVmR0R4S3pEdXdmZFh3VEJRWDZGLzBJUzVyVUU0aXNJS3k1SU4x?=
 =?utf-8?B?a1ZGblN0QlRkZUpGc0Fab2JNeVRnL2RwQU16azVsRC9SdWx1dEljemlqOEp1?=
 =?utf-8?B?MjhwVmpiQkdERTZMQlZ5RkdBT1VlT3JKT2pOWlVnWWJtU2tmY1RuS1N3Snhi?=
 =?utf-8?B?dWlMcENBN2VVdXpSUXBPUHFKWGk4T0dDaTEvL3JnYmtXVkxRdHM4cldWWjRD?=
 =?utf-8?B?SDc3T201aVFJcG5OUHBZNVMyQkhQS0pHTDd4bDRQdVRjSEFYUHZUNzg5YVFz?=
 =?utf-8?B?V3hIZ1NHZExqb2NPcWtFSFVWNEc1SjVDcDV0aS96eTJEYlhpMEtuRzZYY3FU?=
 =?utf-8?B?K1l6ZzZTTDZQOGJscHRhTGd3V2wzbjJLbnVVQ0FrUk5zSDdBanNKUnFHUjBG?=
 =?utf-8?B?cjd6NkpqcmZ2MDhlblU1elN0ODg3ZDFzeGhIZGhDZEU1OWhMbXBTd0hvcGsy?=
 =?utf-8?B?TGdrUEdPSElidnJaMzFBdndSVzdyVU03S245RmFqaHFiaWZBVUZKdUZGekxx?=
 =?utf-8?B?QzJjb25uSDRhYnN1eks5aTlPd3pIeTBwNHY5VGFSclVKL3YzbndtbklscFhO?=
 =?utf-8?B?M092NEVYajNvL3VWUk1Ma2N0b1kzVTg1MWJZWUY1anJGUkhHeklVaEVyREtN?=
 =?utf-8?B?OFBwMjcvSXJtMHk0aFdLWFZ6VFFuYTcyRzJ1VUNPcUtJRm0rUisybzhOWDJB?=
 =?utf-8?B?M0lRVzNJNHp4cGJPTk81OW5EbDZiQVJjVWJZYUFyLytEZjRqYVhhWnZxT1l2?=
 =?utf-8?B?OUUwaWtzSkl3ZGpnSkE1K2hWVVhscUw5VVlFajFMKzZsMEs5b3lZU3IxNUJH?=
 =?utf-8?Q?qf9s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a01vZXlHc09CSUlBYi9tL1BzZWh6T1lhSlozclFZM1pJMEVTQVpKclVBSFcr?=
 =?utf-8?B?VCszNW1VeUtLRy9HYnNSdUVPeGRaV0NXR1krNjBUSjdOQ0R4R3lEdWk1Y2hI?=
 =?utf-8?B?MFFjTEFNc01kbE5Gbmx3ZE9mQk9HbmI0VXZrL2VJWUMrSWVYRDBIWTJaRHdM?=
 =?utf-8?B?NEt4MFM3cENNeTNJc3N5NEIzSUttLy93dy92WnpWNUFkRG9lTDE0RnFlYUZM?=
 =?utf-8?B?WGR3aXRBL2h2WFZkUEpZaUV2Wk9kWnAvNm4wRmltN2Z6VmtnNkdFU2o4eG02?=
 =?utf-8?B?UHdMRk5HMVFwOVpWNGtKNk1XNmFLSW04MXJUUTJBekg3L3J6RFk3UWFkSWxR?=
 =?utf-8?B?NVc0WkE1TFcreXdFSUdNbXp0MUc3UHU4SW5pS215ZTNDTzdYU0VDaWVLRUZC?=
 =?utf-8?B?SDROY2FlMGNiTzcwTVNqWUJOQzZRc1RWdm1QRU93Y3ZmcUpxdEVrcnU0bHZB?=
 =?utf-8?B?TW1rcnlRRTFFSVhwYjZlb0RKYjBTVWRBc3NHeHJVZCtYSndvVVRrY254V2xw?=
 =?utf-8?B?VXN2Z1k2YzBycEFKSGtPejF2VTcvUHRtTE4reDFjcnlTRkRueDlCYWVvNDE2?=
 =?utf-8?B?KzhSSVFTRmtJOFpBMmtlV3I4aWMwOEpNUm0yTVVkYnhURWpvOFFJWW5FMGJM?=
 =?utf-8?B?OGIyaG5LYlVUUCtYQlprand5bVpnRHpVcU9kTkhkOWNnMko3ZkdEUXZ0T3Rm?=
 =?utf-8?B?TlErSzM0Z1BxcFl0V0JwcllJNURwSGFyZWNiN0JWT2d3U3lta0hnNGViemNR?=
 =?utf-8?B?cHcwMStNenZLbGNocnRjOE8rS0kwL2IwOVphU1llZnlNWDlhQXkzVG1KdnE5?=
 =?utf-8?B?T1gxaEROcWU4QWhta2lEODZ0RkdncnQxbi9Jczh2R2tmOEhJNGl2U3h2cDl0?=
 =?utf-8?B?YnhEUFNQS2Z3NXVGVFFXN1pKUnExcXEza05IbkNiT3p5SWFkTkl6Q1c1NmxW?=
 =?utf-8?B?YW9pcXk5bE1iY2JaZHdGYlduOXY1SWkwSUFRTFFoa3Rnd056bjFjVkh5Sk9J?=
 =?utf-8?B?ZFE1QkhoWk56TU81d2U5QjZmQVpKZGo5WDE5T1JVancweTNIalFzUXJ6U1N4?=
 =?utf-8?B?M3QzL2lRRjk2TmhUaFRLcUtlWUlVaW9SaXc0bGliL1ZVY3FSRC9MS2FFVWVr?=
 =?utf-8?B?VGFnNTM0QkdicHp6R05Sa0ViU2tUL2hsK1dTd0ZGVmVla2tGUU03U2IyaEEx?=
 =?utf-8?B?RDFCai9LOEVpLzBhdWk0SUVBSUh0RzVWQ01haU5hcitraWhReU0wR3I0enN3?=
 =?utf-8?B?a3ZPY09jTzBnQU1YenNVUk1wUitLNTY4ejJVdmF0ZUlEd1ZGVnpqM1lhN1Fz?=
 =?utf-8?B?WGF1Y0FWZE1mb1U4bjFFMXhSUWErNHg3ZXhLdDQ3d1ArZ0dvMWMwWm5mSjNk?=
 =?utf-8?B?Y2lSOHZlanB3UldPTGNVcEpSdmtXVVJudmQ3NWVqMmJ6T1hKYzQ5Y3VJQ0Ew?=
 =?utf-8?B?ZFk3Zm9QOWhzNk1CY3ViRFJONm0zam5WSkQxbW1CSlYwOWs0UllCTWc0dUlW?=
 =?utf-8?B?YTZxSWxoNU1vNXFEeGcycXdBeklkNTV1elRRbTVvSnRBbmYzUTVLZFhIRnQ0?=
 =?utf-8?B?bFlTTzNrOHdzdEpNdEkyTVlZTHhubG1GRXJCU05ySzd3LzZNa1BTcEFES1hF?=
 =?utf-8?B?c2pjNEZPL2lsK2FKSS9Dd2xRZTFkZlNTVHQvOHVUOGdjQ1lPaU00cUVzd1pU?=
 =?utf-8?B?OTR0aW4ybDNjL1VRVzRXZ3VYcXhaVWxxamZlNmFnZEM1bTVHWFVpb1F0RFgv?=
 =?utf-8?B?M1JlQTNsUkljZlhhdmNwLzRnWnZiRUF2bWo5THRza0VMcFlMekU1bHB3SWlC?=
 =?utf-8?B?TlZoWDVpS2hIQmhKNU9VMG1UL2tjQW5TN1lBNEp2TUlXQSs1Q3JxS1Z4Uk5H?=
 =?utf-8?B?ZzA4VHBpeXF0aGpUMWVOS1c3eXJ1VW1WQSthVytKb2ZVeFlUNTZxdEs4bWoz?=
 =?utf-8?B?M0RXTSs0amNDcDJkZmlVMHpZSTZ0NTdZZERVQ0UvT1lDLzg1bWY1UFNORXAx?=
 =?utf-8?B?dFlPR2JFQ0w5YlZrdlI2VCt4ME13UWlaK2RpemkyMkhta0grQmIzOEdRTjM0?=
 =?utf-8?B?NFRKN2pvU3pLNWg2bVRyMkt1VDduZDY0MTluUCsyVjJYTm9ZSjYvQW0rL01l?=
 =?utf-8?B?ZXkrSEVuaXhnNVBMVUFyWnhsL1VPb3VEWG54czhjVjdKT1JIWkJaZDJSTFFB?=
 =?utf-8?B?YjVTbXA4dXNza2tnZFRsSWYrR1JUeEJGbWRlS2tuVjRZZkZkYlFjenRjK0sy?=
 =?utf-8?B?aldoNUpzeTFZVUI2TWZ3TEYrek5HU01zdUQxQjlTcDV2Wll1ZWJNL2hpZC9O?=
 =?utf-8?B?WVBiSkRCeTFHNVpvUzNsWDdmZ2hTNGcySUJXaEpoZE05RlU1Qk9Ic3FodlNG?=
 =?utf-8?Q?s7aezAwPQ2WblhBU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1f058a-4430-4bc8-6e9b-08de59ad0502
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:54:38.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCSMud05lLTDHoygDH2oSaCM8aLM5SDU0AnCqXMaUuAGUc1z2yBF/o2cSkDcHNUAXd4EzF3efM7fgmd9eIpWJpNjmIfB1eA3GBX4U2G7pmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: LeF7SRp0Cf4Zub-NpiPLEMdp3vrOwZOy
X-Proofpoint-GUID: veVQTAQnsMs25vgXDp0JaCb5GJTWOTUa
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=69721001 cx=c_pps
 a=7APEvFnVlBjFtWv3F9ubqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8
 a=GBatldI0Jbjex0h5SIgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4NyBTYWx0ZWRfX9mOSjse4/Iiw
 eUaLzLYi6+1/iFcv/dmCumGMRPCRC5bbYM/qtapL6pNRas+ukSfHYzVta2neDlcNjh3ZFE6K73x
 ar1k6X4o8dHYV58XFn/yAt7/bjmuklCD/MHYG8wduRkIoFaWbPBPwelFWKLW83SwDuD67bE80N7
 vtT1SXYHgNO8NsqOT0+XXveypwLdwO1coQ0iAD7n/BZGI3E+MkT8UOfgrDhen3KCRlOzWdIFOT7
 bxjO8FF8M9bsvKI6Y0CqJC6mSxdRu7QW6mhNKvoVX1ybKbmS/zTmwSMKUEM+/TKpFFdawOvvuBh
 /Y69zOqM16sx59/B6hI4Ac9tktSqizjLNKdPHrZRCLHUqDbZrS+HeANjrW1HnLiSHawiK2/RRsj
 Zy0pNB1pY6C0ubYQWPYqzL1YYhJRFXFuWHU0dq4ZWcBI4xNsTtTLr9xdWRr3ZZZEm3GmkODePDN
 eTkv0ZClha34pLSLBfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60M8JZXW1996296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229840



On 1/20/26 21:04, Robert Yang wrote:
> Hi Alexender,
>=20
> On 1/19/26 20:54, Alexander Kanavin wrote:
>> On Mon, 19 Jan 2026 at 07:09, <liezhi.yang@windriver.com> wrote:
>>> =C2=A0=C2=A0 - 0001-macros.in-Set-_rpmformat-to-4.patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 error: External dependency generator is inco=
mpatible with v6 packages
>>
>> This one is creating technical debt. I can imagine support for v4
>> packages will be dropped at some not-too-distant point. We've had this
>> deprecation warning for a long time, but it looks like the matter is
>> becoming more pressing now. Can you look into it?
>=20
> OK, I will look into it.

I checked the history, the external dependency is for rpm per file depend=
ency,
but that function hasn't been used any more since 2012:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit be40f6d0bb80274366af00461112af65687a4de8
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Feb 9 09:51:10 2012 +0000

     package_rpm.bbclass: Optimise per file dependency handling

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

And back to 2010:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit 84f7f70308eed0ac96abeb5a762e9b7765e5db91
Author: Mark Hatle <mark.hatle@windriver.com>
Date:   Mon Aug 30 16:44:31 2010 -0500

     package_rpm: Enable per file dependencies
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The per file dependency was for creating the rpm, but Richard disabled th=
at
in 2012, and there were no complains or updates in the past 13 years.

I think we can remove that code safely, then we can move to rpm 6.

I will send a V3 for it if no objections.

>=20
>>
>>> =C2=A0=C2=A0 - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-=
4.2.patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 GPG check FAILED
>>>
>>> * Add scdoc-native to DEPENDS to fix do_configure error for both nati=
ve and
>>> =C2=A0=C2=A0 target:
>>> =C2=A0=C2=A0 Could not find SCDOC using the following names: scdoc
>>
>> Is this a hard dependency? Is there a cmake switch to turn it off?
>=20
> I will check and fix that.

Yes, it's a hard dependency since the man pages in *man/* are scdoc sourc=
es.

// Robert

>=20
>>
>>> =C2=A0=C2=A0 Note, both target and native need scdoc-native.
>>>
>>> * Add bash to RDEPENDS:${PN} to fix:
>>> =C2=A0=C2=A0 ERROR: rpm-1_6.0.1-r0 do_package_qa: QA Issue: /usr/lib/=
rpm/rpm-setup-=20
>>> autosign
>>> =C2=A0=C2=A0 contained in package rpm requires /bin/bash, but no prov=
iders found in
>>> =C2=A0=C2=A0 RDEPENDS:rpm? [file-rdeps]
>>
>> All things that depend on bash are specifically placed into
>> ${PN}-build, so that the main package will not pull in gplv3 licensed
>> items. I can imagine this will fail in no-gpl3 tests too.
>=20
> I will move it into rpm-build.
>=20
>>
>>> -EXTRA_OECMAKE:append:class-native =3D " -DCMAKE_INSTALL_SYSCONFDIR:P=
ATH=3D/etc -=20
>>> DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var"
>>> +EXTRA_OECMAKE:append:class-native =3D " -DCMAKE_INSTALL_SYSCONFDIR:P=
ATH=3D/etc -=20
>>> DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var -DLIBELF_FOUND=3DFalse"
>>
>> Addition of LIBELF_FOUND=3DFalse is not explained. Also I think it can
>> be easily provided?
>=20
> Good catch, we don't need this change, it has been fixed via 0001-tools=
-=20
> elfdeps.cc-Remove-format-module.patch
>=20
> // Robert
>=20
>>
>> Otherwise, looks good, thanks for working on it!
>>
>> Alex
>=20


