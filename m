Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B96DEF0701
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 01:58:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38765.1770602330258515129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 17:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pg+O5Qsl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=650090017b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6190htwu628868
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 01:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=OG648VwsyedPkblCfwD/qw5iHpULRT+mByvtCryR7ps=; b=pg+O5Qsl5q6m
	uAA5w+UBnL9LIvLFLq1NBM93NOfHaZTDhN7RyJbSbzrvCMERIQJRa7hEKxwkzGUL
	kkH1lKF64xdnNu2boE0R3o852x/jPnYCgrZKxCzW1LmSsD0JVKLPG/rt1GsM+ASV
	tcgUe3kaFRtKnP6bv7mSpfSm5UTvMXK603TBwN07Uo60PUL7Tggc+boukUbw91m2
	qlDbvYWWX/E289+AyvN3eq0x7CPa3lubIVLvqiI/826dWDrUfNyPPypo+A3q87kf
	ZhkPzdCkwvvqWCs/HQYIdcujT9hLfMp3dv7E3ZOc2fyXnB3bvXgKkb51AzYIqALL
	WZrFi+O5EQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc59bn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:58:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9Wf3Pk5rp4yYWmm8gmAztVc35kpaUUQUlOMYs5eNB1eStT8ht47wjqvgWMSSbz9oYPFMtfXL+qsMLvYc/eQQmviPpV27vfWwsPWt4IJpIIWUJXs7mR5egmQOFQTTwyq5dhGT3Iwa6Ecr3tRdG7tRQ2vrDfi7LczKi+bnSlwdfoO1f8DSASYMarIpQb+I/IPXKW5RVYvZM8TJJz7J3sUsBDsdhXXsYvYqoxOSgQyemoCMm9yB2hbuwa5XpUJPvajkcisbreBo5CHaPXWtXaA2cSeYk3ueCEL+reVVSb/KZxiOYEcvBCisJyzqIArPPdrRgwQdrMktfCa6z8j8GrjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG648VwsyedPkblCfwD/qw5iHpULRT+mByvtCryR7ps=;
 b=TJD3sn1GtroAPYr6Qnk7n8LOzvUe9/gsFkosHfivwi4cYVrm8pJoXheaf+SAZf6O0JV5+yJIdLTKbRyUeqgLoG2HPnmdlfI+24BFFnXD8MnfXvk/tRg5MSWhb/zSWzwZMYs9FNVecLhtoQUCwzCmhRLrsGXiNZfL6XNKXpjJsn+3O45Al37f1nJdJ/5aOFqzHoT3y2Ei4xHlRUPIPhxTmBSro9rwjViWlLPC6PIJqvvkchKBSTWdNm0A9MWnWFHMHVKsPl0FsMvmfJ+AksaWJVCZ8omF8FHhLu9kR7HeWHQmc++27svTIRCYgcmgVHL/8Sr9k7R2WUgGl6IK6isf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 01:58:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 01:58:45 +0000
Message-ID: <386ad9d3-ffbc-4790-97fe-021e7fa971f0@windriver.com>
Date: Mon, 9 Feb 2026 09:58:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] procps: support ptest when TCLIBC is glibc
To: openembedded-core@lists.openembedded.org
References: <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
 <188F2427284C7A56.4057262@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <188F2427284C7A56.4057262@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: daf7a3a3-16e5-4504-3933-08de677ec246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVB2UXlka1p3QUg5aEpOUHduV0xGNVZNMEN4L0N1YUVnYkVSdkt5TVlEZ20y?=
 =?utf-8?B?cGlVR2xHaUdSUjROOWRzN09iMk5zNm9lb0Jkb0FYa2s3NnFSMXNCcnFpdDB1?=
 =?utf-8?B?RUZ5aEJpVmlGNDhSU0MxOFVPSkpxRU0yV1ZlQkNoYXRwQ2hVV1A2RlVnS3B0?=
 =?utf-8?B?RDVDTGgvdWNXdithZitKREdWSExFa0tZU3BXUE9hSmZocHNHWitkamNic1Vu?=
 =?utf-8?B?aEpoRmxpbnVmSDRFTXdpQ2d3WEZlVzBpcWtpeFpSRjBHOFNQelZ1akREa3N3?=
 =?utf-8?B?OC8wRTZZWlFXY1g1NStFOEt6RytnWGM2MEJraCtLajRucjZ0KzRmR2FLSnRp?=
 =?utf-8?B?Q3pvbktEelZSeC9majZ2RERKaDBWZGkwOWRneWRSZGozOHNMVEJZakFaMXYy?=
 =?utf-8?B?ejBJMUZKTmk2L0ZmTi9NdlNWZkJHeG54RXFwK0hadm92bkErcGlVQ0NvcE1Z?=
 =?utf-8?B?eTZCMnRxUWhaaVRZcVl3dyt1RHcyY2N6NmRNUEJXK1M4d05Kc2R3Wi93R0tr?=
 =?utf-8?B?NU9Ib2pweDZNcjdaYUNLbGl5NzlLY1FWVHplT2V6YkFvRkp3czFLREE5RHBy?=
 =?utf-8?B?Nlp4dlZLS1ZnUlZiMnBlVTBOdElBZGNLaHJkNnY5eTc4dmNiUHhWYm9IdkFF?=
 =?utf-8?B?R0ZSRnl1RHFCZVMyRlJldUQwWTd6TWthN0tJcHRZV1Y3YlpjR0xKNUoxTmZF?=
 =?utf-8?B?Q1dWc2VndXZOcjM2T1NPMEVqS1BvVTBnZXg1WDBGRG9YUDFtVm5UTmp1SGVu?=
 =?utf-8?B?cmUwNm5qdER3eUgzOW0vRjd2VTMwZDN4VGlFdTk5NVZ6NEZIaWMrWlpFM0t1?=
 =?utf-8?B?Vms1WnFndFFtam9ZWW9rZWk0SzJ0ejJ4Y0V0OVZzWWhwbUxYeWw3TzZNZ2ZR?=
 =?utf-8?B?ZjllTEhNR25VMGxoVis0RUN6enF6Y1BvOXhKWWE3T0UzM1EvbEwxWVFoKzRz?=
 =?utf-8?B?ajg4Qi9wa21RRGE1N0YzeEZDWDZuNnAwVVNQdDd0RzdTbWlGK21vbFhSN3FP?=
 =?utf-8?B?VmhLSCtLK1o2V29oQ2VqYkI4UCtSV29KSW1ZYXJvc3NwVnBadFNYMHQvd0J1?=
 =?utf-8?B?UTc5WVJpS0FQbHRhS0xXb2hNcSt6VkZNY0RrQi84YWRrOE5nUG14aytSNmRG?=
 =?utf-8?B?MHJPWkovY0tnbzdNNk8rY0JRSDg5ZFEvWXE2MDZlYWlZVkRBRHNTSHp6M2Vl?=
 =?utf-8?B?SGkxdmlmVXhjd3hRelVUUFR5NzhqMnJhSXlFcWE0OXhSVnVxK2RqUW1VTWo4?=
 =?utf-8?B?dXpwc3l2MmQxdzdxZTdGMy9jQ1VIRnlGd3llWElaVnhmMGNnaWVZczFhMUNw?=
 =?utf-8?B?UDdseFJ3STB6dEtYTmtoa2h3bytrazNzVXU4L0liM0F1ODJRKzduL3VTbDVN?=
 =?utf-8?B?ZDg2SXh1OUlDTHFDbTcwVy9xdDNYNlFGUUVZYnR5b2JkbnF0RXI2a3BLeWNi?=
 =?utf-8?B?N2Q1NGpwQmxaUmdWSDV4VWo0bHc3aHIzcWdqU0J3MWVUdTFRWVJyMEVrbWFn?=
 =?utf-8?B?NzZ1QWloSTcyeU50bnk2dWVUcG1kNGxLakpDQTJIRWRkdE9WS0xSalgvd1pi?=
 =?utf-8?B?bFRvMGtWZjJlT2hKa3FlQzhwaVdORWpuZmJsNVF1NmtGWjJjZUxQRk5RTVp6?=
 =?utf-8?B?U3EwU1VNdXV3aWNtdGk1RFAvTDFQVFRMZGpMaEtqa0szMlp2TFI4YmY1L0hs?=
 =?utf-8?B?K0dwdG9mRDMrL29GVmkzRXduZGNzUnJoUnd4V0JneERwMy9IVW9kUmQ2Qitk?=
 =?utf-8?B?V1cySUVPVnoyRmZnTCs3UTFqYXdUUkx3OFkyaHJ2VUwzbkdLZGZtajgyalFI?=
 =?utf-8?B?ZzBmV2lncTFmQ0F2RDRNM29uaEZ5T0FGVTd5TmNaNWFKU1hiWnlkZ3ZkY0Jj?=
 =?utf-8?B?bnRyejFiWWpDTzFIYUdUdWdIeDRTOUFrUGVadHd2cWNEOUxlb2hobTNoRU5E?=
 =?utf-8?B?V3FjRUhWRUVPS0NyWkhoMDdNMlpVblB3N1lkR2VScUVwOUYyNHdjZGNPdWRQ?=
 =?utf-8?B?WUhHL1RabU55TXdtRG5GNG1rdS95UmkzRW56d1NLdU0rRXI0blBlbmZZcUhO?=
 =?utf-8?Q?Vci+if?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1FEVUQ5RXVyWUl0N2RMekRua2xKY0l4cG5uY3pzSityZjBsblVUVVVzY3Q4?=
 =?utf-8?B?UXhic2Rjd1pFN0w1T24xcTRLa0psVGJOS3lhUWZLWUZIK29HSzc2S0ZMVk9W?=
 =?utf-8?B?NWpDV3VZc1c0RUcvT2hjWU1rQjV0c1VMT3FiU0FlR0ZEQk9lczF6M2dUdXIv?=
 =?utf-8?B?U1E3VlNaM0w5Y0V6bDJZM0lwa1gvOWMrODZuTExDZVRlUzZlMnFtTXZyMDZy?=
 =?utf-8?B?Vk1BemRsVWV0S3AramU1cmtScWI4RFd6SWc2Y0RCZTFYYTNyWnBVeFdHa2Nj?=
 =?utf-8?B?cGg3TmhuWG5CaGRKbVlhaU4rNlF2UnRXUHNFMTM3N1RsbktkV0JZUHJLS1Mv?=
 =?utf-8?B?NmhzUWZ5NVJqTGt0WDNraW1xeDRQdGx4cEZDdW9FbHNUZnRyRi9rekhsQ3p2?=
 =?utf-8?B?cnBSeWFUbHN6MGhHYi94bW1NZDE0RW5oR3ErNXFKV1c2WTg0TURoZVhpTXIy?=
 =?utf-8?B?UzNwWldPcHpKNXc1MUgxdWRFY1pydWNrVzBmdzYyNWF2dEg1dldOQjFETEhL?=
 =?utf-8?B?MDNjOEhoNERnTC9SZWxXYW1nUEJnRXZ6bC8weTdUY29hMWVCR0w5bTNMVHZo?=
 =?utf-8?B?c0d0MHlYWE1jOUlCNVNZUDU0MWFtMUZ2L2xndkhNM01yWnZQR2FaS0FVdmVR?=
 =?utf-8?B?eVFLSXpDci9CZ0svbzJOYTZSU1hHY1lIU3lVbVVmUUs4Y05yeDR3RDY5eUFY?=
 =?utf-8?B?M0JqMi9oY0VaUFUwcWl6bWtxemVpR0N3N1pnenhDNUFFa2NJY3hwK0JEQUtP?=
 =?utf-8?B?UVdPbk5qMkNIZ09tb2UrY3M4NnJnYmVYNnVGWXkyQTF4VlUycjNuay9OOXhS?=
 =?utf-8?B?NGF0UTc1ZC9DNGFpNTlDSmczTWlVY1p4eFRvWnAzUTdqcjVaRmx0RUtwcjFC?=
 =?utf-8?B?Qzd3QzYra09FdytIYkQvTHdsb2RIZ0htNDJlNnArUjVOK0hCWjFQMjBOL0c2?=
 =?utf-8?B?OU93N2JhN3NKVFgrSnZuV2tHYkNrZlFLU3BNemg4d2ZPRUdRMnVJUDVlSmtD?=
 =?utf-8?B?VHgzTTlJaHdCSHROV2pvaTlhNjVjanJIbjNwa3RIN3VMMERKNmVhRTFNNmpW?=
 =?utf-8?B?YythaVE1dzhoRjRnNzF1eFdYVmtKcm5YVjB5U09MM2JjM0N5NWR2MmwxVUgr?=
 =?utf-8?B?d3NoOU1qeXlma0Z5NVNmQktER3J4UWc1dFlVUURxSVpPWVY3VmMreTNjLzl0?=
 =?utf-8?B?akdZYlZqSTAzN3lSR3ladWlpREh0ZTB4KzhnV3FJK1IwWm9VeE1vWFlzOW4z?=
 =?utf-8?B?anNiR3BXTFA3ZHRHZGNHZ0s5aHMzSWZOemRacXlOMTZKRS9tNWw2Zy9Wb3h4?=
 =?utf-8?B?R0lHNXR1TG5hOVZpTUFXYm1XMTFRS05UbzNGaUd1UHZ6dzZNMnVVUC9HNHAz?=
 =?utf-8?B?RzVReUE3MmdPNWZwRHdoMHQyRGRYOC9OSDliMVloWmo3OHpzN3B0bUVlUkpO?=
 =?utf-8?B?RmtITTdIZS9LM3lqUGZqNE1sczA5algzTVhaTFNaWDlkcWtDU3cwNlVCVGkw?=
 =?utf-8?B?NU1xWEdGOWg0aXgvVWh2UFlzejA5VG9NREZBci9wRXRwYTJmbmt4TVdPeTNL?=
 =?utf-8?B?L3crUTROMmNESGtvQWlDRWJVdDBwODBUZk5qM3oweVl6dFJLY0RpcUUrUVZ0?=
 =?utf-8?B?T2tSQzRGTExoMTZsTnJrc25NdEtMWXBENVB0Rm1ObFo4Q0k5ZE5DRVBOQnV6?=
 =?utf-8?B?N1RhTCtnZEt4L002L1hSdzVBOUdzUVk2elFOWk1JMXJIYTloenp6Q2RVZ2xK?=
 =?utf-8?B?UTlCaTlqbjVTUUI2SDFPczY1OTRuU0dRSGtwOFBFTEN0eHN0U29MblVPdktR?=
 =?utf-8?B?cEYzZkEyQ1J1amwwQ0REWUI1ZDJsN0Y4bERraEdaeTBKa0IvUm51RkUwMWFW?=
 =?utf-8?B?dFFPZitoQXF6bTdLTXVxL3ErZVNyaFVad0N1YWVtK0pmV3ZvcTl3YmFWRFY5?=
 =?utf-8?B?c2JFdnYrSDl0SFlCdkIvWU9ZNWROZ2VBVWpYL1prYm1DdWtUMzJsV1hIMkNx?=
 =?utf-8?B?K1VVOUlneXB4c1JvRHp2dTNFR1dVb3d1MUQyNnVPWVpSd0hHZnNGVUJucENY?=
 =?utf-8?B?VklRQ0xNSkl5NDZJMklxNmlIUnFScVdFSktpUlhHZGNyNFJzMnlVNUY4bnJv?=
 =?utf-8?B?YmRDeWMwSDhGSFZHbXpFWGNNTFR3SkpBSytuRnk3S0srYkNVSnNvNm9zSitk?=
 =?utf-8?B?ZjZaS1hFOGI5K3FxM3dYbUQ5VkpmeEg0TGVLRmZjWXpNazYya2NXUElXaEZ0?=
 =?utf-8?B?cWFrNllxUHVjU3A0Mm8zNm93NHNxSGZ0ZWJFVFdUT0lsUjUzNUtBdXBoNzVY?=
 =?utf-8?B?NlFXS0Q0SDRONE9kVVROS2R5d0Q5SjRwT0tUc1RRd3M3UzJGbEJxam12NWsy?=
 =?utf-8?Q?YNemzE1bfN1+lQGA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf7a3a3-16e5-4504-3933-08de677ec246
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 01:58:45.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9vGZ23M0L1E6ib6/mdX/bMjtpme18O6MpnEf+5oJ4NOONWnCJ6Xw/S/AVx5I9h3OZn8H/Yie47i+ZkKW3eR07Aw17Po+4jDTI8Ij4zuBeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=69893f58 cx=c_pps
 a=eN70jGNn7EKSdYhrfilGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=p0WdMEafAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=XuCPgOzMWNZkRVCaVhsA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxNSBTYWx0ZWRfX8sQwp6x8mZG5
 1Wv89fMCyX8hII56K7HTYrkTb5yyGX2x99PNBoat2fCAhdE23mMSGJGkjbEPgAN9XAbDVZZMTE9
 OyXhNUQEbb0EK17z8VjHSLwnyaPY3RF7dxDEtISEaOX6sT3JvhLl8xhWLKNfZN/OMq/EeAxJsvP
 YnZINVfAkJSEie+lUaIgPI0Ni2OJfowk/csrnDrVGGxswDUXl6XDgRWS7muLDByNwYTwMzoOYJW
 KZ9426cwJxrppdbR2BkMTyRXFlWsxAtcxwEzH2I3f7j6ab0qvO4edReC1a2y+1PDnyGX00CKGlF
 yecE4LX4ZAbgew7X5fnV2Xn6F8uhcqNWm+dGqlWlRU6xGsVi58JMsEJVKmoo7uzzeY937awpiZj
 kuP+KglahGrHP2yITpdJQgcZ6hRoESf2ohVt8X7/gf+l62fKR6FboqCaSxpzp9rJo6GH9JBHqlv
 q+x6B1UJ5ue/GML8qPg==
X-Proofpoint-GUID: CeG6iH4xPtRJhQZxXqrKVLhAIroEQqfM
X-Proofpoint-ORIG-GUID: CeG6iH4xPtRJhQZxXqrKVLhAIroEQqfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230704

Ping


Regard

//Changqing

On 1/29/26 15:48, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> * support ptest for procps TCLIBC is glibc. The configure.ac only match
>    LINUX as "linux-gnu", we can patch it to make test can run on musl lib
> system, but the upstream testsuite should only run on gnu libc host,
> some test cases only suitable for glibc, eg: Some of the error messages
> for free command on musl system is not the same as glibc system, which
> will make test failed. In order to avoid some other unexpected failure,
> just support ptest for glibc.
>
> * procps's testsuite use DejaGnu test framework.  The testsuite is
>    expected to run during build time, this implementation create the same
> folder structure as the testsuite expected to make it can work well.
>
> * Two pmap test cases may randomly run failed, so set it as xfail, and
>    open a issue upstream
>
> [1] https://gitlab.com/procps-ng/procps/-/issues/409
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../distro/include/ptest-packagelists.inc     |  2 +
>   meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
>   meta/recipes-extended/procps/procps_4.0.5.bb  | 60 ++++++++++++++++++-
>   3 files changed, 84 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/procps/procps/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index fff2947177..2391224527 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -57,6 +57,7 @@ PTESTS_FAST = "\
>       nettle \
>       opkg \
>       popt \
> +    procps \
>       python3-atomicwrites \
>       python3-attrs \
>       python3-bcrypt \
> @@ -97,6 +98,7 @@ PTESTS_FAST:remove:mips64 = "qemu"
>   PTESTS_PROBLEMS:append:mips64 = " qemu"
>   PTESTS_FAST:remove:riscv32 = "qemu"
>   PTESTS_PROBLEMS:append:riscv32 = " qemu"
> +PTESTS_FAST:remove:libc-musl = "procps"
>   
>   PTESTS_SLOW = "\
>       apr \
> diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
> new file mode 100644
> index 0000000000..7e132653b0
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/run-ptest
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +# Run testsuite which use dejagnu
> +cd ./testsuite
> +for tool in @DEJATOOL@; do
> +    runtest -a --tool $tool --outdir ../log
> +done
> +cd -
> +
> +# Run test programs not used by dejagnu but run directly
> +for p in @TESTS@; do
> +    ./src/tests/"$p" > ./log/"$p".log 2>&1
> +    case "$?" in
> +        0)
> +            echo "PASS: $p"
> +            ;;
> +        77)
> +            echo "SKIP: $p"
> +            ;;
> +        *)
> +            echo "FAIL: $p"
> +            ;;
> +    esac
> +done
> diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
> index 0e0e06f0d2..bccfee1de9 100644
> --- a/meta/recipes-extended/procps/procps_4.0.5.bb
> +++ b/meta/recipes-extended/procps/procps_4.0.5.bb
> @@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>   
>   DEPENDS = "ncurses"
>   
> -inherit autotools gettext pkgconfig update-alternatives
> +inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.contains('TCLIBC', 'glibc', 'ptest', '', d)}
>   
>   SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
>              file://sysctl.conf \
>              file://top_large_pid_fix.patch \
> +           file://run-ptest \
>              "
>   SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
>   
> @@ -47,8 +48,61 @@ do_install:append () {
>           fi
>   }
>   
> -CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
> +do_compile_ptest() {
> +    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
> +        oe_runmake $p
> +    done
> +    oe_runmake -C testsuite site.exp
> +}
> +
> +do_install_ptest() {
> +     install -d ${D}${PTEST_PATH}/testsuite
> +     install -d ${D}${PTEST_PATH}/src/tests
> +     install -d ${D}${PTEST_PATH}/log
> +
> +     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
> +     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAMS); do
> +         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
> +     done
> +     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +
> +     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
> +         case "$p" in
> +             src/tests/*)
> +                 install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/ ;;
> +             library/tests/*)
> +                 install -m 0755 ${B}/library/tests/.libs/$(basename $p)  ${D}${PTEST_PATH}/src/tests/ ;;
> +         esac
> +     done
> +
> +     tests=""
> +     for p in $(makefile-getvar ${B}/Makefile TESTS); do
> +         tests="$tests $(basename $p)"
> +     done
> +     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
> +
> +     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
> +            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
> +
> +     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
> +     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
> +        if [ "$p" = "ps" ]; then
> +            install -d ${D}${PTEST_PATH}/src/ps
> +            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
> +        elif [ "$p" = "sysctl" ]; then
> +            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
> +        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
> +            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        else
> +            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        fi
> +     done
>   
> +     sed -i -e '/set test "pmap X pid pid has same total"/a \setup_xfail *-*-linux*' \
> +            -e '/set test "pmap XX pid pid has same total"/a \setup_xfail *-*-linux*' ${D}${PTEST_PATH}/testsuite/pmap.test/pmap.exp
> +}
> +
> +CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
>   bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
>   base_bindir_progs += "kill pidof ps watch"
>   base_sbindir_progs += "sysctl"
> @@ -80,6 +134,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
>   RDEPENDS:${PN}-ps += "${PN}-lib"
>   RDEPENDS:${PN}-sysctl += "${PN}-lib"
>   
> +RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
> +
>   FILES:${PN}-lib = "${libdir}"
>   FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
>   FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230122): https://lists.openembedded.org/g/openembedded-core/message/230122
> Mute This Topic: https://lists.openembedded.org/mt/117523139/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

