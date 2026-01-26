Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9688BC88E74
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:26:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15599.1769415998842586827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Cx77X7Hh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5486ac34a2=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q6dxfJ3768953
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=mCucboNe6shJ45rxz7hvsG
	aR/LmmMJY3bn8eK/mt8Iw=; b=Cx77X7HhOfz3FazibCCHcodemLpcIUj+aRTwqG
	zK9GklQ9rbI7y8hzYaOu3l08Mu6jUFXJmBxCpuc/BBxnNIYkWVVIwdtOej/+W7PG
	05cWLo3gxIq8yc4Ui/Oy4IK+7uFvGMcowwegc3QBQXvzYg186SL6bX60uabXnXpQ
	OzD5IRsWM6KOJi2rdtGIewWDrbL9bSx0TQcNSVpzmyMZVwhOgsFACVDNVW1+kOMh
	vqg5KYfym4upIHlRifPyZVuEVKciE3qytJnu8nypSaWslkB6g1mf/T+9d09XhbrI
	LxbvcM0HTSWqflg8S/1htWlli3WzJfpdyMCqwWXpuiO3UjEw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvn289jk2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:26:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFVAuEpWuIWGnnl2ZjveMtHZTpKyndNjdEXqCpjXcWWIcCYQqUMzl4Aq5agfNL8BqStbCLB0n0Pr1YtOgo9PwAeZOpAJgb4eXBuGhKoGdTYyY84j0xdBbP+zt0aFhm26brFHzDiGwXMl/WpyJCKuXN8jeSqQltPP/Qx0iWANvuple2LSmbE8taxB8b8BLngjzJ6cM2tuXK5tYQR6FawMbgbb02fJuXS1Jt0nrW2NfU4p2qG2/s7hv8pyG2Uo3h4pTcv9Q+sorOkBTxKBT8w1JUB50KqVNldQycpUxNPkOWhUgXp056KCVWxisWYGdfsIIOvrY9GiZtaU9l3NPFZfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCucboNe6shJ45rxz7hvsGaR/LmmMJY3bn8eK/mt8Iw=;
 b=AOzjcDI2sTfXGdwH9jI57fjcnBN12TtuRxPwN862GXXNQJNhIA2OkWQUDh9nOVoCv+0x6z2iptx75O2KtS9K6217vZXk03/xdEIbSz3dBLXrp3P9YW6dS9+5Ns5U7ujNsiq+FEkDMzvQlahbVRZNrwPnP+75oPQDFfRnGV5ttR/GNWrVb8BeG5rhpqptXMuBy3jKV2Ag7SwpJmyrYTVvSa9XJyoRPwnuPKKF4wZaRzcnJDemjRIB0/bYWpb3Zg880icCRa57CVNfTiXKYBZVKHaJEK9ZPd5RJO7Z2q3q+Q3s9yreEkRYx1dM2tSdCOadfW6NO20r6ciPPK8h6rUc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA3PR11MB9063.namprd11.prod.outlook.com (2603:10b6:208:57d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 08:26:35 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:26:35 +0000
Content-Type: multipart/alternative;
 boundary="------------lvIXj67oigyNP46DqT7tAbag"
Message-ID: <00f746f8-79cb-492d-ab7b-5bc780f761a7@windriver.com>
Date: Mon, 26 Jan 2026 16:26:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] go.bbclass: set buildid to empty string to
 improve reproducibility
To: rs@ti.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        mathieu.dubois-briand@bootlin.com
References: <20260114064400.4070617-1-changqing.li@windriver.com>
 <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
 <188AC968E243AEBC.2595076@lists.openembedded.org>
 <703def79-e544-412c-bac1-4d30cf7ad65f@windriver.com>
 <DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA3PR11MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 6889f76e-e5e1-473c-3039-08de5cb49e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|8096899003|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a09pV1lnMFdscERxenNJTVZMV3krZkViY0NVaTljSjBQZW1QYkxoV2NzelZO?=
 =?utf-8?B?OEdoZ1hzN3J2MDZacno1TEJCZ0VCcWpUSW1oaXhXaTlTRTBuemM1VzV4WUJL?=
 =?utf-8?B?V09HL1ZPdUpQNktuTExmcXF1b043QzJzVEwwcktVcm9lTUdwdk13d2U0TVNS?=
 =?utf-8?B?UWV2b1diYktmYzNVVEdvM2Fidkp0Q004UXhBeFJ5anpDQ2tac0Roc1hFdVQ5?=
 =?utf-8?B?RE5IaTIxWnM2TzNJNG00cEY2K3ZQRkhKdUdSQUd2eUltVVgxZ09OZHowY0VY?=
 =?utf-8?B?dWpXc1c0QUgxcXNjbnJYeVEzMlROeG1zWVVEYlRYR2tsNnZYQ3hjdFdBaFNB?=
 =?utf-8?B?TjF5THhNMnV5TmxxWHF1N0RiNFNYNzY5TTgyNzlnOGkxdVluRE9DZDJlZ0tB?=
 =?utf-8?B?NzdzcG9WRENrYlZLUGV3bkIwMUFmb1JTMjRISnBzdU8yaTE1eG5VMjd4U2NG?=
 =?utf-8?B?cG9CM3QyYm5UQkZUclJoZTRNZlNpS2Z1Qk1oblFETVk5UGk4TWJhUTQzYVNw?=
 =?utf-8?B?a05DN0x2Z0J3cVJiaEVKOGdyeEFnSmN3ZGlKR3lmNnFaSTdMeEVwU3BGcDJr?=
 =?utf-8?B?enFkYkhib0UvZzF5eWR6UlNTR1ZsSXBFbzAzM3lhbXFodEREM2tzK0JmT2po?=
 =?utf-8?B?ZCtXanlsOGI2L0s2OHRXNXRhUlpKci9uZHVTcFdONElxcGFSUUtXczNIdVFj?=
 =?utf-8?B?M0ZUUW0zVVdhQ29pZGtRK1JkTEVESUh2eWRZSlNaYmJRSFN1TGVTZERsYkE0?=
 =?utf-8?B?ZDVSSzN2NStOZGg5L1pKZ0xpdnNRa1FsRFE5YmI0WTZqS3hMOFJaU0pISVlF?=
 =?utf-8?B?NkJJeFVOOFNSeG1LanlDV3ZUQnF5TXcrZnhiOHFTSFhqU0xXckkrQTBONGJ3?=
 =?utf-8?B?T09SQllTckVkUGVpWUVHbnBZYUFkR3VrblJVa1dVSWUzb0hvbjBad2V6UlZG?=
 =?utf-8?B?aG1Jb3VmakdKSUxTaGdiU2pvM1k0UHdQL3c3dVh1ZEFwdjI1NGRjRFBsZG5k?=
 =?utf-8?B?RHFvdlZHbGtPcGhaNXBwYzI2Q2VVR2ZUMVNQNi8vc2htTWNhWllsRHJsRXBR?=
 =?utf-8?B?WVoybjYvSzdYd2x6MXlkb1hzb3hrMHJDN1BOVm5VaGtwZ2J1dGJMNzdpWGJ4?=
 =?utf-8?B?UXU3NHJaQTlteDVlM2RHcGYzY0g1VDhIbmhBQmUzaTB2SCtFQXA2TXUxbVdU?=
 =?utf-8?B?dmJBdXlQVjlVNDk5MGJCdnJDeUlqUUVneXhmWUovMExlT3NpdWxpdW1rY0pJ?=
 =?utf-8?B?WVZ6VU9EVlQ2N2dDQmVtYmREWS9MSmhKWUN0alk2ZlZjQ3NmRnU4YVpOdUcy?=
 =?utf-8?B?T3VQaGJOYURJMGhoalkrenRtaDNiNEVpNkdsWkdXTzVnTEx4b2hTRGpxRlhz?=
 =?utf-8?B?S3FHalVCTHJQUzRwemMrWE1xNExIZ0NOOWJ1ci9iSmFVQVdOSXZwVCt6T3Jh?=
 =?utf-8?B?WWl1dEFQZklEZHYwMThTUUVIR2VBLzY0RmhFY2NHL2p2QVlZamhIaWtLcDBD?=
 =?utf-8?B?NDFEUUpxd2dSb1gvOS9FalRGTnlXa3ozaWg2N0FwSk03QndCYnBEYWNrcGlW?=
 =?utf-8?B?UGFZcUhBcVpSNVcxUU4wemdzL0Q1VDFmZ1Y4SDJyOFFQVVo4TEV5SFU4OVVC?=
 =?utf-8?B?Zjh1UnNGckliUHJ5Z2tBTFdBWE15eWM5U2hEWDh6ajJGcDRHcGZmSUIrWVBC?=
 =?utf-8?B?MVlxeXNQb3dTNmlZYzhkVFQ1VFhYbGl3ZEV2eDVxWWp6K2FsWE1ob2xsMU5H?=
 =?utf-8?B?YnJubXNwZGl2ZFd4L0ovbWRYVTNBaHpoSEdtNi9BT3JhQjdkN2d2QXJJL1pF?=
 =?utf-8?B?K0dQNXVQU2NTUkJGZGJOVk5NRm1SeFZTbXY0YTZHaG02MEM3Q1AvVmNnMGJn?=
 =?utf-8?B?VldYeGM4WDhtWjcreXpnS1ovbVhWN1FLQkJ4dC9senpFUjl5Zk9pbWw1TFMr?=
 =?utf-8?B?MExHMlQyVnhqQTVjTStLNHZ6U04xdEVJYmFHZGZGZjZKaHJ0NDdSbHNCVVVL?=
 =?utf-8?B?RTY0UVlKQldJdi9ZZXF2bWkrWWl2cThRNHhnZGZxTWZPYmE4TXVGWXVvMHdR?=
 =?utf-8?B?YmpoNTVtazhyYnpiZjVFbWYyY3FmWHJvb3c2Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(8096899003)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTFXTTBSelR4R2QyWU51TnhqM25ZdGExSCt2b3luMzgzNjNNL2h2ak5XTXNV?=
 =?utf-8?B?SjRMTDJ6cGtVTjZneHpRVHV4dDRyR0c3eXovQmkvNFhFVVJHZzUrTFMvUEQw?=
 =?utf-8?B?Um5hTWh1SkJMQkVTVk5BaHZjdERHWENCaWFtZXJuU2NHeHJ3S1QrTGRSaDVO?=
 =?utf-8?B?Yk5RekFlYmlPaldQNTBRdDUwcWJ2ckdQWUFrYTRPMkJqUzZQejhtcWJJaGVH?=
 =?utf-8?B?VkxFRlFIK2lSQ3FFM2FkMGZFdEM1T0RHdENSR3ByWk1FZ3c3NDEzY0k2N1Qw?=
 =?utf-8?B?dXQwclYyeDNISkZ2Y1VuK0ZrMUN2LzRGUUV4eVlqT3ZxNGVHUitwQk42UW05?=
 =?utf-8?B?UWZ1dklJM2xObUI0cVVQa3RtaGU1VTl6R1QzVFRYUmNHSlhXcU95UmR4SWU0?=
 =?utf-8?B?dlN5UWl1VG51YkhCOXNXenA0dHF6Q2RZR2ZyZytCTE9VNjRNZXlSV0E0cU9y?=
 =?utf-8?B?UFVoYlRMczJISFN5KzIxeDFQM1o1bks2Y3NCY3F4UVhiMzF3OUhIeWhVZTh0?=
 =?utf-8?B?djBUR21tMlhJL3NjdnNzUFo3SWpZWEJmN29RdCtYeVdXejFKaFJUaEhiZ3Nk?=
 =?utf-8?B?Vlp4MGdzRDJySUNKK1NVazNER0hKNzl4SEc1KzdWRDBtV2ZrTzgydWhZTXVZ?=
 =?utf-8?B?Z0pWNkZyL1hjS2F4eVFWZU1EWnoya1VDYTJOVWVwcXkySVlsMFZLZjV1Uncz?=
 =?utf-8?B?czlzSmQ1QlRUQ3J1TFNiTXJUMEE2eE40UzlJdzFFb3NLK3grZU1zNk9EN29o?=
 =?utf-8?B?Z09UVzluaDcrOHlpaXlqVHZaNUhoL1N3alM0VkRrcUlLeTdyWFgreFpkTGgx?=
 =?utf-8?B?ZVBncks2dWU5bENJTmV4RDZaZTBTak1aSFhFdlR1OGZGQVNOcTdaZ2xYVnZh?=
 =?utf-8?B?bHF2Q3cxa3hhaHlzbWkrQytlTSsrSzIxbnlwZndDRzliOTRZYm80OFNFY3BJ?=
 =?utf-8?B?MFBXaERBN1JJdHZ0YWFNNUlTMkNnWW9iNEgxaXpZSVFsR2NicjlKTWk5Y0VO?=
 =?utf-8?B?V3AvQ3R5bUdzbmpLUVlhRjJncEhVVlRNRi9UT1dVWUVCOXY0V3J4YXQ4M0I4?=
 =?utf-8?B?NTdDaERiZkVDdE9Cei80aUFQdTJ0NUUvWjVtekl2UExCdEU3eUxIQnNGR3BK?=
 =?utf-8?B?d0VpVmdVMUhuQjdncXI1a1AzZ0IxSVNoQmtkTEtOY2JIYzg1NVBNYzJMK0Nh?=
 =?utf-8?B?SjRhNkxWcUdwSkY5S1EwMjFNZWFNM3JZdlJKZGFSU1p3Wk1IQzhxdWRFczBl?=
 =?utf-8?B?Y3c4b1oxWFROWXVGWnJNejZRdmxmejlFQXJMS29taFFvQm13NUlxeVZKWWZU?=
 =?utf-8?B?bnZxLzZELzZKWEFySVNUUUtsaXpBT0JXNVR2bTZtTkZaZ2hOd08rempkODRq?=
 =?utf-8?B?N3NLRjBnWmhjRGU0WFpqRVcvdWNkUmdGY20rYytyclg2UFYwTmQ2SzZPUkhs?=
 =?utf-8?B?aDZPYVpPcVd2YTU5UzNUcHhQR3lMeHh5T3FKME9FT0MwRlR4bHhTcmkvaDMy?=
 =?utf-8?B?S3drbUdOcmxkYzMvZkVTSkFCVXBqMzlEb21LbWRVMWRjd2ZYT2Q4MWtiK1R5?=
 =?utf-8?B?dDU2MEY2VWtwc2d6V3M0Z01BbmlzNTZmcHhjOXRIWjJDdFF4VzAzWUZzWm1B?=
 =?utf-8?B?WHAzNW5GenpmNjNZeWZjMU9SVHlUVHlDRkZkd085MDlkNHZWajFDRitudVI1?=
 =?utf-8?B?WjhZV1ZhS2FyblNyelVielFrcGVMNUJYMmE3MWNkTlYrY012SVU2QW91Q2ZI?=
 =?utf-8?B?NHp2TjAvbjVveVlkQVJkRUdFNzRqWkVwakhQRS9yN1BPN3lwNVljOGh2QnRU?=
 =?utf-8?B?T0JoNnRTMmRxUFU4eTViT1lzTndUVFduK3dpUUViYlNRaUhDTW1lRGhVR2xi?=
 =?utf-8?B?NHJlUlZNVVV0WUZWNmEwZ2NybDdmY1k5bytEWGRacnRjS1ZnNjZvbXN3SGl1?=
 =?utf-8?B?RU9WaUg2U1pWaTFNU1doeXNkSTdaRGMxTUp6MHFpQndjN1lrSDZQMjNEbGpZ?=
 =?utf-8?B?aXNsbDlkMWxMcE43OGxnb3oybTJ6VitWcXhLODJQajJiZHF5anJuRDc0Um9l?=
 =?utf-8?B?T2diVGIwaVZ1eEdzNkFaWVR5SUdrTFBmZ0lCaWQwT1JzTmMzSlFvNmV4cVAv?=
 =?utf-8?B?ZDVhaTN2MHJzSm40Sk1zeGN5MGE4SzZwcXNMYWZ2SHNnZGxOWHdaNGNDQzdB?=
 =?utf-8?B?TUdDaUY2OEoxenJwdUliS3dWMy8xcEMxZkxRNjJPN3QvVmVmYnJ2OFdOU0Ur?=
 =?utf-8?B?WHNZV2pZTi8yVjhBY2hFSmJpTXU3azdoZk5uTU9JRUVVcllTWnVpbmFDdDF4?=
 =?utf-8?B?K1kxSVBHVU9HL0E1QnNWeHRWbFhqdm5iZ2t3UmNRUW91V21YclAwV00yd1Fh?=
 =?utf-8?Q?VdWPGvUMJ4UoSWPg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6889f76e-e5e1-473c-3039-08de5cb49e11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:26:35.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuwZ9/qBaCEVas6dzMRaAvYVtShyZ9v4gzf6GmGwGdFvF4495ZYKTY5hIBva17ddt1pMy73iHgKL+lsTWUxZWL2tSEAFwadnPeSlNQ5M/Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9063
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA3MSBTYWx0ZWRfXzdaB9V+frmMH
 fggAz70ChkjDVIILPYM1jpklvrFrqGjKWoYkYz3SWs/nDzCpolFWq2mUfQ38Cp2PZ3JvjXAI0O9
 gFI4pFvoEKAn+/Y2mfqG7C5dAJb/XHUjwlSToYdTV5dh9D1NaHyFap1ihwD9MXzmZ91Dr69USsj
 HAADe2HjYtJ1XPtIX1OGdj6keMiDUCcR8vmAyv1e7oLmMZ6VFTZd4TbrHmYw1UUTSe5hgZwr8T+
 hxeVkBe3DVvzeBXVoRmOI+zvbrstNuypt4eGvBMy6yHTPNn0IwOi2fXlOButMDYwOMWa9Cim5Dm
 o3C7hfpdvdNPAHr7HiwsWjLZOJTrvwhHMpWsfQJ4i/Nz/Dx17xltNT2JiqJdTmTpjKvLlT3wPEF
 8a+ugW+HtSrLymF4yAJ+CfG2+5Ps0Tav/QbYO4buzhTxnFG7smG490dLGIS2LzPxSl0Fp8rhG6z
 LlCzO9IvZ99C+3qaUgQ==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=6977253d cx=c_pps
 a=NvljgnbIoj+kJW4KAcm4xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UGXAvUmdAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=z23x522UixbLUZwHcUMA:9 a=QEXdDO2ut3YA:10 a=sozttTNsAAAA:8
 a=hJdaFWpNaPIsrvASO90A:9 a=RM7uAyZapR-k8-1d:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: i71HwAXpScAwMGuiFDK-EC5mOmtkBwnp
X-Proofpoint-GUID: f2Ypqh56_VNX9df5qrutBjqYbCWvZCRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229973

--------------lvIXj67oigyNP46DqT7tAbag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/24/26 05:10, Randolph Sapp via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Jan 23, 2026 at 4:35 AM CST, Changqing Li via lists.openembedded.org wrote:
>> On 1/15/26 11:20, Changqing Li via lists.openembedded.org wrote:
>>> On 1/14/26 20:36, Richard Purdie wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the
>>>> sender and know the content is safe.
>>>>
>>>> On Wed, 2026-01-14 at 14:44 +0800,changqing.li@windriver.com wrote:
>>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>>
>>>>> Go packages and binaries are stamped with build IDs that record both
>>>>> the
>>>>> action ID, which is a hash of the inputs to the action that produced
>>>>> the
>>>>> packages or binary, and the content ID, which is a hash of the action
>>>>> output, namely the archive or binary itself, Refer [1].
>>>>>
>>>>> And action ID include hash of modroot, which will include build path,
>>>>> so this make go package not reproducible.
>>>>> Refer [2], keying off module path instead of module root directory
>>>>> is a TODO.
>>>>>
>>>>> [snip of log]
>>>>> HASH[moduleIndex]: "go1.25.3"
>>>>> HASH[moduleIndex]: "modroot
>>>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
>>>>> HASH[moduleIndex]: "package go1.25.3 go index v2
>>>>> /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n"
>>>>> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC
>>>>> 1704\n"
>>>>> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
>>>>> HASH[moduleIndex]:
>>>>> 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b
>>>>>
>>>>> Report this issue to upstream, refer [3]
>>>>> Workaround the reproducible by setting buildid to empty, refer [4]
>>>> The trouble is there is a lot of potentially important information
>>>> going into these buildids and you're just removing that functionality
>>>> entirely.
>>>>
>>>> Can we patch out the problematic component until it is fixed instead?
>>> OK.  I will check if it can be patched out.
>>>
>>> //changqing
>>>
>>>> I'm very reticent to remove them entirely, that doesn't feel like a
>>>> good solution.
>>>>
>> After do more investigation, it turns out that the not reproducible is
>> not caused by what the previous commit messsage mentioned modroot.
>>
>> The root cause related to the cgo_ldflags, which may include build path.
>>
>> Take buildah as example, it deps runtime/cgo,  and runtime/cgo is
>> compiled into ar archive file _pkg_.a,  and  it includes _go_.o,
>> __.PKGDEF and other files.
>>
>> _go_.o maybe include metadata "cgo_ldflags,
>> -ffile-prefix-map=buidpath/xxx=xxx", and meantime, _go_.o, __.PKGDEF all
>> embeded go buildid in them.
>>
>>
>> build buildah, deps on package runtime/cgo, so "import runtime/cgo
>> 'contentID of this package'" will be part of actionID of buildah.
>>
>> 'content ID of this package' is the content ID of _pkg_.a.  we cannot
>> change this content ID by simply exclude them like
>>
>> what this line has done:
>> https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite.go#L46
>>
>> because the build process will use this content hash,  sometime verify
>> cached can be reused or do cache verify.
>>
>> it is related to how go design like.
>>
>> I have update this analyze result into:
>> https://github.com/golang/go/issues/77086.
>>
>>
>> And seems fix the reproducible issue by passing -buildid= is a safe way.
>> It only influences the last step when generating elf, the previous build
>> process still use the original actionID and contendID,
>>
>> if we set buildid by pass -buildid=,  it will influence what value will
>> be set into section ".note.go.buildid" in doelf.
>>
>>
>> Bruce had suggested to set buildid to a proper value like SRCREV.  if
>> you all agree with this solution, I can try to send a V5 patch,
>>
>> if I can get SRCREV, set -buildid=SRCREV, otherwise, still set buildid
>> empty?  like:
>>
>> GO_BUILDID ?= ' -buildid="${@d.getVar('SRCREV') if d.getVar('SRCREV') != 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s'%${PN}) != '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarflag('sha256sum') != '' if () else ''
>>
>>
>> Regards
>>
>> Changqing
>>
>>
>>
>>>> Cheers,
>>>>
>>>> Richard
>>>
>>>
> Oh cool, someone else found the same issue I did.
+1
> I submitted the following
> patch the other day, since the only LDFLAG parameter that is actually breaking
> build ID functionality is the prefix maps, which include build paths. That was a
> change made way back when to address an issue that has long since been solved.
> We can safely revert it now, assuming nobody is using external toolchains older
> than GCC 12.
>
> Alternatively, we could just conditionally remove those arguments for go
> applications only. Up to you all.
>
> https://lists.openembedded.org/g/openembedded-core/message/229857

I read this patch today, and I am wondering if we can remove the 
DEBUG_PREFIX_MAP,

I replied in the patch mail loop, could you help to check if my 
understanding is right?

//Changqing

>
> - Randolph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229915):https://lists.openembedded.org/g/openembedded-core/message/229915
> Mute This Topic:https://lists.openembedded.org/mt/117257536/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------lvIXj67oigyNP46DqT7tAbag
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/24/26 05:10, Randolph Sapp via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri Jan 23, 2026 at 4:35 AM CST, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 1/15/26 11:20, Changqing Li via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 1/14/26 20:36, Richard Purdie wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the
sender and know the content is safe.

On Wed, 2026-01-14 at 14:44 +0800, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a> wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Go packages and binaries are stamped with build IDs that record both
the
action ID, which is a hash of the inputs to the action that produced
the
packages or binary, and the content ID, which is a hash of the action
output, namely the archive or binary itself, Refer [1].

And action ID include hash of modroot, which will include build path,
so this make go package not reproducible.
Refer [2], keying off module path instead of module root directory
is a TODO.

[snip of log]
HASH[moduleIndex]: &quot;go1.25.3&quot;
HASH[moduleIndex]: &quot;modroot
/build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n&quot;
HASH[moduleIndex]: &quot;package go1.25.3 go index v2
/build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n&quot;
HASH[moduleIndex]: &quot;file buildid.go 2025-10-13 16:08:43 +0000 UTC
1704\n&quot;
HASH[moduleIndex]: &quot;file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n&quot;
HASH[moduleIndex]:
007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b

Report this issue to upstream, refer [3]
Workaround the reproducible by setting buildid to empty, refer [4]
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">The trouble is there is a lot of potentially important information
going into these buildids and you're just removing that functionality
entirely.

Can we patch out the problematic component until it is fixed instead?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
OK.  I will check if it can be patched out.

//changqing

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I'm very reticent to remove them entirely, that doesn't feel like a
good solution.

</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">After do more investigation, it turns out that the not reproducible is
not caused by what the previous commit messsage mentioned modroot.

The root cause related to the cgo_ldflags, which may include build path.

Take buildah as example, it deps runtime/cgo,  and runtime/cgo is
compiled into ar archive file _pkg_.a,  and  it includes _go_.o,
__.PKGDEF and other files.

_go_.o maybe include metadata &quot;cgo_ldflags,
-ffile-prefix-map=buidpath/xxx=xxx&quot;, and meantime, _go_.o, __.PKGDEF all
embeded go buildid in them.


build buildah, deps on package runtime/cgo, so &quot;import runtime/cgo
'contentID of this package'&quot; will be part of actionID of buildah.

'content ID of this package' is the content ID of _pkg_.a.  we cannot
change this content ID by simply exclude them like

what this line has done:
<a class="moz-txt-link-freetext" href="https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite.go#L46">https://github.com/golang/go/blob/master/src/cmd/internal/buildid/rewrite.go#L46</a>

because the build process will use this content hash,  sometime verify
cached can be reused or do cache verify.

it is related to how go design like.

I have update this analyze result into:
<a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/77086">https://github.com/golang/go/issues/77086</a>.


And seems fix the reproducible issue by passing -buildid= is a safe way.
It only influences the last step when generating elf, the previous build
process still use the original actionID and contendID,

if we set buildid by pass -buildid=,  it will influence what value will
be set into section &quot;.note.go.buildid&quot; in doelf.


Bruce had suggested to set buildid to a proper value like SRCREV.  if
you all agree with this solution, I can try to send a V5 patch,

if I can get SRCREV, set -buildid=SRCREV, otherwise, still set buildid
empty?  like:

GO_BUILDID ?= ' -buildid=&quot;${@d.getVar('SRCREV') if d.getVar('SRCREV') != 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s'%${PN}) != '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarflag('sha256sum') != '' if () else ''


Regards

Changqing



</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Cheers,

Richard
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">


</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh cool, someone else found the same issue I did. </pre>
    </blockquote>
    +1<br>
    <blockquote type="cite" cite="mid:DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com">
      <pre wrap="" class="moz-quote-pre">I submitted the following
patch the other day, since the only LDFLAG parameter that is actually breaking
build ID functionality is the prefix maps, which include build paths. That was a
change made way back when to address an issue that has long since been solved.
We can safely revert it now, assuming nobody is using external toolchains older
than GCC 12.

Alternatively, we could just conditionally remove those arguments for go
applications only. Up to you all.

<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229857">https://lists.openembedded.org/g/openembedded-core/message/229857</a></pre>
    </blockquote>
    <p>I read this patch today, and I am wondering if we can remove the
      <span style="white-space: pre-wrap">DEBUG_PREFIX_MAP, </span></p>
    <p><span style="white-space: pre-wrap">I replied in the patch mail loop,  could you help to check if my understanding is right?
</span></p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:DFW9ZDYDKJZY.TU0KTUU1Y3NJ@ti.com">
      <pre wrap="" class="moz-quote-pre">

- Randolph
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229915): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229915">https://lists.openembedded.org/g/openembedded-core/message/229915</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117257536/3616873">https://lists.openembedded.org/mt/117257536/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------lvIXj67oigyNP46DqT7tAbag--

