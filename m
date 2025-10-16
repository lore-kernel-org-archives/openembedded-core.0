Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E18CCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:08:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2455.1760598472011061910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HgHc75hp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2384ebcd45=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G4jlt01016047
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uqsqtyfk+HbjuELMDVd/3J1WUXs4m+2GY5dL/hZYbRw=; b=
	HgHc75hpgg3jbiO8Aua+PaCxC22+qpS+goOURXtsTAb7oAFDlx6yqwwmQqXsz4El
	UF03+Dyp/OmxTwlRQh2PQzZF3AzD2ZD2MKCXqEl7f5K/spR2YIZ5o9VlqcmjxSbU
	AX+bzhIi1melYGfywRPHKMVW9+OjHs/vLPi2vYGuA0eDkmzPtWqWXeV+WYwrD4dd
	xlq+bQun+ntySHSRDh03FTSTswQ1hW0Ga7LmUMwYIn8wTtV8ewUkpWB4s6+MfRf9
	a1AvlG2l2gRux0XKnH4KSlrruhp03kvZWNjASMJnieeK9aLGd28whUpnHqj0hRxP
	UEE780r/3rRIIDfHO3FPvg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewp0h2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 07:07:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUpLg3lW98CnxeErlBhhhEpatXBgswecNkyt0fkHOwuW1kScM1oxWoIpFA0yQ+fdNrO1tV1xWM4jA/UgBmoHAFBqdWFLT7bVPkf9rHmZy0UjQ49Q3pEEaput3091oAkB8+jZ/1V36If1GVOlgA45QlYbLPYa6qkvpRREnoLjgdfa/ttfulWnEegsODvMCobBfSINkDmNNrGzY810jowiAQIRwx8QpL6iuoKbXDrhL0xEnPFTWhzCxW0gOOBrTY6qq6h9TVXbGWAxxvQOT36S8TUM284N/+m889b8MIIeufpbzxmyRrVs+OLe+N+Xv9SLAZpdfY92jlTTL2n9zBHftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqsqtyfk+HbjuELMDVd/3J1WUXs4m+2GY5dL/hZYbRw=;
 b=F6MUO75b3D/7xquF6Lvv/O0ADBP2yWkM9CtJPqZVlZDGn2r8rcLP15P8Y4ZWxmoTc2tJtWAFEo9SqGk9QDJzYmx/3d8IhNQU/QdiI0VgZ5eKCl0d57fN0IMfaFXIReCICy4PrPfwUgmTKu6ClCNEm4/wW+U0BdcwdnF9W0r9EyII/hojAd26/XO40dehb/Vl6+xJJ50T4WZzLZSWdguxjeriNlo8NKyT3Q5wUFw3WDb/NwfB2ejoa8WjLC3JdJBqW9wAw3UtvMqnzkRHk1E9Rwl6Mgt7V4zv6fJ5jm4Eh480S3t+j8YZetPRMAjXtja0qFKLr8LTmGtNAJXi5DOJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 07:07:46 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 07:07:46 +0000
Message-ID: <fdb316e6-2e3a-4674-9b5d-f632d59e560d@windriver.com>
Date: Thu, 16 Oct 2025 12:37:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5 1/3] rust: Increase QEMU size to 1024 MB
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <ffa8ec8ffcc9262c7e2f01a27de5bf37cefb71c6.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <ffa8ec8ffcc9262c7e2f01a27de5bf37cefb71c6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MN2PR01CA0044.prod.exchangelabs.com (2603:10b6:208:23f::13)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7f276d-a733-4738-e0fe-08de0c82b556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTRpOEJReWQwRmU2eitoSjNOLzJsVGljRjdwUTRqL2JyMjVQSit0RVBtdSti?=
 =?utf-8?B?UmVFSHdPdW93aHlsVFlMa2YwbEx0Y2VCL21PL0NPUll0QXRsZmsxQmJ0eEtV?=
 =?utf-8?B?U3ZYZXNMbjRlM05HWWtwcXRXY0gvWGMxaHo1Rmg5Um9sSlNJQlg2VWNGM0FU?=
 =?utf-8?B?anBSaVVtM1JlNFo5bDB5NnU4dmY3d3M1aXlZWkd2d1ViT1FNL2ZKVmp0Qk9X?=
 =?utf-8?B?citwWlhoUjFaWDhscllTaCtXeUtub0lyWU1kV1lIVjF6eDZFZC83bEJ1QVVU?=
 =?utf-8?B?QWxKcVdTL1NYblpPSGJORnFZRTVRa241azJpc1hDMlp6UFdFeEpSVW53MEZk?=
 =?utf-8?B?WGRaTmdDelZDVEhCREUrdVpGbjRNUWFXbC9mYWs0YkpwbWVCTFAzejdrU094?=
 =?utf-8?B?NHZHYkdVSU9EYWRQOWVxWFZRZVB3MUF1OHlsS0d0UVBDUVc0YklocTdQSFhT?=
 =?utf-8?B?Y3M1OThlaDRSWUdhSmxKb2todUhmdWlOcjh5bXdoMUlQdUdId0VHK21MZVlV?=
 =?utf-8?B?dktYUGJrVVljL2Z5VVBNalk0d3k3VGZUQ3JNSGxHelltN1FRaGt1OGF0bDI5?=
 =?utf-8?B?ODNiL1d2WkR0bjlqNlpVdThSSEVvUmVTWENBZm93YXpoc1FabTBkV0kvaERH?=
 =?utf-8?B?T0pzeWIzNGdqd1NLb001VzJ5SUUyNFY5WTVRaE5tR2E1cnBjNnlseWtsZVZ3?=
 =?utf-8?B?bnljVzZORG9wNDdkaE5zRFNWVmk0UThKYllnWWsrd2lyOW44TDVkeFd0ckl1?=
 =?utf-8?B?ODRmZVNMMjhhWXlMYlRhblNLQ2dYbEJacjU3WDYwamZrL3B3YTNmK0RxVEtl?=
 =?utf-8?B?azZpbUNWT2JQWHBYVzhiSXdPbXJCQVhtMzNLbGg2aG94UDlVVFBmYTVFUk1s?=
 =?utf-8?B?RzV5bXlybzJZZzlUczkrWXN0dXRmVExZWHIxTm1PMHNwMC93RStaTzV4QzNo?=
 =?utf-8?B?eGhZQi9KbUt4VGJDRkpZT2lhOVhURDRhT0FHSGV5ZXVPeEh5RVl1OEVPYnJ1?=
 =?utf-8?B?OVR6dGhiRm80Snl1Qk5pY3BYZjRXUCtQanNQaDIzQVVma0dPdVREaVVUVDd4?=
 =?utf-8?B?ejRqQ3g2Qk0zM3BZVEpBN0JCN0orMjR4WURYaS9IZkh3ekJUakZ0ZHVIVjFQ?=
 =?utf-8?B?Mk5Zek9zYURnR1dHbFVrM0pOZXFZQ1RlUTlMUEdmUEt0Q3RWMWZOU254NWNX?=
 =?utf-8?B?US9NeGtPQ0RzN0NDdFh5UHYzWWp0MnNidGlJTU9nbTlwazBzSk1rKzhHM2lv?=
 =?utf-8?B?ZE5lZC9vWjg4Vm85a3NwWXhzOHplTUJuLy9JeVN6MHJaMko3VkVicU1SVG43?=
 =?utf-8?B?VUxvdWpPdHpTQzJPVTdNL3RKdGtqaEdjM3lzSEFFLzdZa0ZWVU92UWV2UXdk?=
 =?utf-8?B?UDd0UkFFWDNsa1NxdjBwTmEvSkZ1VkxqY3IyVVh0MVZhdXZnRHdnN2JZamth?=
 =?utf-8?B?ejVHd1BXMUpuVUc3OGVGN0hwd3BlMkpDbkJRU1ZSbitLc1FYODQxQjN4U2V5?=
 =?utf-8?B?K3gzc21zTDZzWFJBT2ZyQW9zYktrQTAzanpGMmtPejZaZXNlRzNKYnZpYkdS?=
 =?utf-8?B?Wi9jdlcyWTZOSVVnemdKK0FwenlLZFdSWmFBc1FVcm04WVA5ZFdCVFhDSmcr?=
 =?utf-8?B?bmU3c3ozR2NHdnIyclp5S3hZb2tlSXBLeHh3U2tiazZhaHc4cWhjY3RyRStj?=
 =?utf-8?B?ZFVDNVpNYmd5dkxKNnhEUFJaNWpsbFZVMHVVRElDYXF0bkZ5MFRRb2t0dmVU?=
 =?utf-8?B?Q0VQT0tpdUs1OGdSOWJxRFpRT0FQSExmcjVYV1ZxKy93dk1ubE1UMmpGY1lH?=
 =?utf-8?B?MUliSnFTS1VmQzVyNnVVT1Q4aGFBUU85cldJVkw3cmtuYTdyakJndkJwSXA0?=
 =?utf-8?B?UTRRd0FwNDNIa25ZWFFPbG41UWNkWVl3citGSUMvUEdqM1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2R3MkozcG9aY3Nma3lKSlIwbmJpS08vR3J3TDl5OEYrcVBhT3BBL256OTNI?=
 =?utf-8?B?T3VEaDhveWtrZmxPemZOL1ZMZExObzczWG9ra0M3TG5xQzI0R2MvSWtrQXFR?=
 =?utf-8?B?NVF4YUIzdHN4K1FVUWpTaFBNa3NuQmxOWWRnbFJ4aXVsSktsdExKeW5Rc0Yr?=
 =?utf-8?B?V0FvSHMzT0ZncVF1Y1B3Zk1iOEpNWTE2MFBJVms4ZWduWTFKTXlIcFJLaHNP?=
 =?utf-8?B?UU1QMU9IZnF3ZVdEbGdFRUx0VGVFSG9EZnF5ZEpPaVJXMmtjR2NUYy9kZ25m?=
 =?utf-8?B?UXNPR1FnRjRnbk00VWVBMmhUUVBnQzV3QmNPOElEVnQ0ZG5ZK2dXRzhkY09C?=
 =?utf-8?B?UHZST1hKdVBzcmE0dUlGYURnNmJWM1g5QkozYmhDSk1xcDUrOUZqMGhjKzRI?=
 =?utf-8?B?OWllY0dYdzI1cFRHOFAwc3dJcXg4OUc5ZnB2ZHFrcWNhUDB0eFJ0RnZNMGNB?=
 =?utf-8?B?VFhFRVl4RHI5R3dHTS9vL2owUFZBVmNUN2tsT2RUS0grMnFmSUNJYnF0OHFG?=
 =?utf-8?B?NlZoZWl5QkhNZ0RNeU51MStZbFB4Wnhyb0dQVDlWMTZFWmgvcHptanVDTlhC?=
 =?utf-8?B?MVluNUhLVWpVVnJFdU5LcjFYL240ekgrVS9QTGNWZHA0dGdSQ0ZiaDFIcERC?=
 =?utf-8?B?M09PczVncnpQZTJGU3dNeEdHTCtIbWJuR0FNbnU2c21LR1pCdzlQMmdweVJK?=
 =?utf-8?B?MVhsWEZISU9OZUp5Z3V1ZGljTm9zWW43OWdTM05BYnd2NlNQMUFqajJQcU4y?=
 =?utf-8?B?ellVZG9yK21GYXdELzJBUU1RaG1vb0FjeXd0d29YZkdkSGwwQUlHRUc5dUJj?=
 =?utf-8?B?ZG5tRWU1a1pJT2lqZXR4VHBLSVdORUc0TVZob3daUENwTnRZb1dBck44aGRo?=
 =?utf-8?B?SHZLcWRnVkV4bURNUXpETmlTN2kwVmtvcy8zb0tzWG5xWjNzUDBQV28vT3lt?=
 =?utf-8?B?RmR5MGNOQWJwa25hRnZjWnIzUDBjajlxODRYZUhzMXpRU24zaVZtQUpEamdE?=
 =?utf-8?B?d1duYmpFb1VZc00zdjdKZVQxdWdzMEsvL254elIvSGtmZkFPYXRZdE5LZ2pE?=
 =?utf-8?B?N29FK3NkdTRPTzl1c1VKREcvUHJXcU1JTEUyakdyTFNPaGhmR0FmdG1IVTJp?=
 =?utf-8?B?T1pqcG44NzlhQnZncTJDNkh0cG5JR2pXRGd1N2I3ZlQ4RXJDK2dsMjNZaUdO?=
 =?utf-8?B?ZkdOK05uZDNYKzhNcUhrdE9SSlVyTkRCS1p4dlpGMUYvR1hsUk01M3JabCtC?=
 =?utf-8?B?K0dJeHZOcEtqcEFFSytUYU5jWHZROS9RMjAyRlNnN1R2M0pGdENvVW04TWgz?=
 =?utf-8?B?WTBLcHgyUjNuRFNGTXZ3dDFnYlp6VURkSit3M0dZaWxCaXgzeTVVWnBkb0pK?=
 =?utf-8?B?WFFSb25pMmFCbS9uUVpOenAxSzFSeWFoU1VyUU9xMWsrMDB0bXJFeHpOQnpr?=
 =?utf-8?B?RGhwMUk4TmFici9vRDNrYnJtN09nZWhvR3MzajNHd29VUlFmSTZ3OUVPOTNx?=
 =?utf-8?B?VDZPSXF5TEkxNktHSUllL25EZm5ybVVYdjNXRm5OUUMvcXdlb0R2NmVlQ1ZS?=
 =?utf-8?B?b2hsckVxRVRPTDJxTDFaMjBjWi9kTHNxQVhHMlY4OVVuZWtTS0Q5UWcrRHUz?=
 =?utf-8?B?NkZqMW1ySnNIOE80b0hIaG1HanRoaVdjUWFEZHgvcnM1cWhYaEQrQi9mQTBH?=
 =?utf-8?B?eHRBMWoxQmhFQVIySGE3OTc2M253NEFMMi93N3phVlRJRzRFNGhhcTdwUGR1?=
 =?utf-8?B?cnJONnBEWldHcmIvTFl6K1dQcGx2cjZkV0JqdklpRlZsL1NZbkd6L3pPQjdY?=
 =?utf-8?B?R3hZNmY5Mmh5dDRTbWVOTmY0RGh0aU5RdWcvcGw5ZnUxUnpjR3FzaENhWlhy?=
 =?utf-8?B?UitDdEtac1hhRkxzL2tzcWhoRDdZSklzZ2gxRkpZMzlaMUZuMDBVSW1JNk9Y?=
 =?utf-8?B?NWUvdkhtQkZ6TDRxN0srZHY3Q1J2VnNtVnhHVEpzRUtGZitSeDhrYkRuVFFE?=
 =?utf-8?B?UTVhM2xBLzlCYi9ZczQ5QUlRTTVBYU4zV3FqSVlDVVlIMFBwK21VRkgyQS9S?=
 =?utf-8?B?KzJtOFF1a0wzS01aOXJaVmhoRmVZSHRCRE1GWlF0blV3MWJhc0ZRTDVrSUUv?=
 =?utf-8?B?OHdlUlNHcjFvd3R4L1hYNGJ3Q0FsL1hhNVoxbFdGYVNGYmNaSDNBTEFGOUl4?=
 =?utf-8?Q?6T1pmYtrpvnZjOhh7DppqXs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7f276d-a733-4738-e0fe-08de0c82b556
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:07:46.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8CSlEXGKm20rUuXwk0cL9dfzDg6xs+Tlt55i7bBt+7NeUn5u2ygUugSSRBKWUmCh9SLSqbxifvVy3bdvWfV3sVxdJJPbPXbJf4F82HU4vD9LlfLgwqKJseUnuHPiGue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ygaW3XUIuuDvvRW5Vx3TeETGmd5KVIn6
X-Proofpoint-ORIG-GUID: kjJDXdBXh24__0hSL5vorX8zgu1Fhz2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA1NCBTYWx0ZWRfX/pDumlHAdSIB
 wxZkCkhxPt0L3lQ9xvWm4533IyovUirJKYC/uYqLa3uENCSsSOiBVwFPK4qUysssd9ioslnCw3q
 Wr9PwnV2kfPFUoCxQYVMKDVis08fbw3Gu+Aspxv19+s9e9LjV8j6JRsYgkTPf79WZ0MgFOJdi+d
 Bjb+J2Q+onsspINLRjbXyLPgmMDuPT8m+mT1e1fNcxVV76ujgE/nbQ4C0pk2D5m+JOMcA+eORiw
 Av9SVaOQ2Au6ssDw+QyODPrZeQMW2vTXGEeBj8H+Z7dEGUE+8lMsuw1M/0dCyHKhKouzO3TflZO
 YwTVFd8+8nBRqCin9qNGKhIf+lXWtmO4B28TtNLdk8gZIjeScw5TlcynqmPoDyIMhxTWRZenWM9
 i4m43u7B/tORESjBCdEvVoamJW4oLg==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f099c6 cx=c_pps
 a=Q5I7zFPfgszDbE/a6V3qwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=_rsZ8svgLPVIV8VGzZoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59G4jlt01016047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224950


On 16-10-2025 12:01, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 2025-10-15 at 02:59 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Rightnow rust depends on llvm instead of rust-llvm
>>
>> Setup in rust-llvm
>> CFLAGS:remove =3D "-g"
>> CXXFLAGS:remove =3D "-g"
>>
>> Setup in llvm
>> DEBUG_LEVELFLAG =3D "-g1"
>>
>> As a result, the stage1 compiler crate binaries include debug symbols,
>> increasing their size. These binaries are used to run tests inside QEM=
U.
>> To accommodate this, increase the QEMU RAM allocation to 1024 MB.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/self=
test/cases/rust.py
>> index 95859a9eef..06acf53e9a 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -102,8 +102,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>>           testargs =3D  exclude_fail_tests + " --no-doc --no-fail-fast=
 --bless"
>>
>>           # wrap the execution with a qemu instance.
>> -        # Tests are run with 512 tasks in parallel to execute all tes=
ts very quickly
>> -        with runqemu("core-image-minimal", runqemuparams =3D "nograph=
ic", qemuparams =3D "-m 512") as qemu:
>> +        # Set QEMU RAM to 1024MB to support running unit tests for th=
e compiler crate, including larger
>> +        # test cases and parallel execution in the test environment.
>> +        with runqemu("core-image-minimal", runqemuparams =3D "nograph=
ic", qemuparams =3D "-m 1024") as qemu:
>>               # Copy remote-test-server to image through scp
>>               host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
>>               ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, =
user=3D"root")
> This failed in testing:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2522
>
> I suspect some qemu platforms don't allow changing the memory size so e=
asily?
>
> Cheers,
>
> Richard
Hi Richard,

I had a look at the failure and noticed that this test run includes a=20
linux-firmware upgrade (20250917 =E2=86=92 20251011).
While it=E2=80=99s not confirmed yet, it=E2=80=99s possible that the upda=
ted firmware=20
may be affecting device initialization. Since
the log shows a warning indicating that the target did not reach the=20
login banner within 1000 seconds, confirming
that the system hangs shortly after starting likely around the time=20
virtio-gpu is initialized.

Additionally, I believe this issue is not related to the increased=20
memory allocation because the GCC oe-selftest,
which runs with 4096 MB of QEMU memory, completed successfully. I also=20
checked previous autobuilder runs without
this linux-firmware update which had these rust-llvm drop set of patches=20
and the qemuarm-tc build completed without
issues.

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/42/builds/2519

Regards,
Deepesh
>
>

