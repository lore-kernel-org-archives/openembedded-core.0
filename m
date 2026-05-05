Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEB8FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 09:56:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35212.1777974980847629958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 02:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PtlIgeqq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Su612225359
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 02:56:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RqImpiEjfgghU8NtIYTubA3rKquQPPBw6/U4xKkNy8M=; b=
	PtlIgeqq6Xg+KennFvEIHoMiL2p+de88bn6XysPuo+vZAMisLGi2SwY13SPkBMMC
	ev0/hI0i4WBbUuIZuB/rnz7+0wQ8tcvdUbqlGfi8OPxurNdQMUSAl4Ix9skEozoa
	quujmjAfi+fhQSKpaKcT/vA2Bem33m597BqFafJNYc5XMMJE/HKSMdrgi1ax7Tqb
	1TOcQ9Ng9fmJ9jcZ3ebEhpPZ7LKuSOkmkYEOPzbcU114N1c2C/wvvzkJELz19RZV
	YXRDMM/e5Aia9CH5MpgAj0u54IYux/gP+mJ0czxenIH/Vd2S7oxiv5sPsWoisWYq
	qmOiEUvwxIS2ga3L2HWTUA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyu0sx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 02:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bsm/eBtaM9672PSk2wm7mcuKqC/uA6X4QEbVRDaZKaUA3U3Xo2wkrQDge8fZolbHCMRM2MMv+crBL7tz+bk4dFFF72Ct21Ud0Ny2qooM7WCwo0PrwX4OzE51+6oKFqOvnovM0mk8Dsbj6gT7iUihjEBzir/ehAY/UzoR5PO2vQQw1xs9CLF1NNL5t0qPhcqJGYov7dc08DdH8YFLzIiQJMpVwK0f1/pc4WZjbLYtL6VLyZQ5wZypykB+1OtId4xrDZqV20HGseNus0zSVmBnMMtM5LTfE7+LbtKUKCFHohI/ADg4mxtqdD8yH4uwI+Bc2IpVxZ+ptxPEfdhoNmLusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqImpiEjfgghU8NtIYTubA3rKquQPPBw6/U4xKkNy8M=;
 b=MBH+2+unaQQHEl3qGWSod3kDhF3bSQY72KQ0pCV7F+uoEyiNxwrdi/GthWIGiFFBq/qlSA0qOpbsv2a1WvfP7uRJcr4DPSS4iNShDl3ZTGDsc/7eVQa7DuBnHQUPKmgEFblRjE7aCl0rRx80DyDOS+AVtYbgZSfN1EKRcYs8IskJAB7ZaQFxfOPzbddVBx3fYJ+eIckmAUonL1sGDV/MGkkpPFToYCcnBR2FGi3xJOxTbwADrYoMR5oujsa0FkFn8bab4jpdJqY2asa1g1IONxHGefZJ8j0/NHeJHytWZif0pdd41t6PL/iKm0AMruSIwcI6AUfF92XDCqh6TcDWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 09:56:16 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:56:16 +0000
Message-ID: <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
Date: Tue, 5 May 2026 15:26:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
 <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BMXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4885bc59-f47d-448a-a960-08deaa8c8c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0g3ogjcvUC0SXKd7larZfLqkAUzrpCMuQfxqa3a1ReLk0lrGHKSfEKJszUPEpYTw5ZZs9JOLKVgBExBzOKRZc46boUs8mq9XzFKc0GpUGZJ6ezb3hlMzCVZ1OG/n3nF9BI3LF0uYFosUAaj4RSE5c0Eqn+xzQVyKl9Ssl35XsBrq7janS9MVzcprT3HZhpa0EN41vijArhKItg5BHDlk7KA6afGN3x46eZSAfBPVwrcgyB95f5RGbfz0d89PdDYu+CEFkqTOz07h2U6Ag5HoQf4+opL7+1bPMsvnSJRMUO0Yewp36oxxDV3rlbVOLwe2mPWlUWRTBliZLHmOw2Ost2bapreY8vooWdNWbfGg4WWavuyxcs2cSezeAvII+kK+1opO2yhR6KnLmLnCFqAQN+xte2y/kpuh4LE+a4tNYU40jjqoIsmCq2R7VLVcNSQ1Ay8xLt8hgAZsDngLfHoiv9ujmAS7TeI9JwZ22Nic4TPWbszofNQmekajGmtqTRhNpgyezQbcovSdtYeIrUbUYg86FCtC1gWAvkY7naZ8Zh7Ht4JozsJKXt8rdP5HXBZpLwv7aVZ5HZ4Okx8EJmEXRJT0JZiEVgmCtszfEIJL8oXuW98Ezufz8KJi3HXH0WRV0W9iv9MIkBhaMxFcVRztSXnL2CIndvLKk7wOl09jDtFilSd3GeXIgwUPvtybKCRs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sy9GUG5UU2w0dkVQai85WjJqYzJyYy9udmZzS3Vzcm9SVCtGSHpkajB0K2pU?=
 =?utf-8?B?OXc1TGxESndNVUZONG92Qis5NUx5Z2FkODVMTytWVUZka2lhTkZJeHpZSTRO?=
 =?utf-8?B?WXJyb0xsYWVtdWJTeXl4RVRld0sxS01nMm53NTBQUHZaN3NUc01WaHpxNUhj?=
 =?utf-8?B?UDI4MXJJSVhFUVZOOW5HQU15cHdwN2FueFluQUNrM0R6TkNRbmxiOVUxMVBl?=
 =?utf-8?B?dExDN3hhcERlTXV3Y2FVUHpiaitsQUd6c01DbzA3YkpvQ0owV2NCQzJraVBE?=
 =?utf-8?B?cisvZnRJM0NYZ1dpZjRxZlQvVTZKc0RRL0Nad0NoQ2xYYVFtc0hWU1pRdngw?=
 =?utf-8?B?d3AybDFaaWZRVVovTXVpMWZhalNyWTBxcXNyQ0QrdzBkdzkybVRHM1hrVXhY?=
 =?utf-8?B?dGtIZ3g2NWJnNlFidEFoWXo2bzNIQWp5NnRQMkJmaW5idWpzYm5WcTl0Ui9n?=
 =?utf-8?B?ZkE1WnB5ajNxMUs1QlRyRjFTdmc2ei9TTEMwb1JXcVBkemoyOXlzOGYxbk1t?=
 =?utf-8?B?R1R1Ynova052K3NmREZlTDJrWnBEVktXM2kvL0ZJTXh6VDdaLzBWbnFzZEFw?=
 =?utf-8?B?MnRrZGVXanBqYnFCT1R0QllRckV4YVFFdDNGZGUvNnlmOEpqWmdvRlY2alBo?=
 =?utf-8?B?aFJGMUFjM1JGTkN5OGxkOXdHbWluRnI2Zzl6T1hibjI1VUw4TWg4bWQreHI0?=
 =?utf-8?B?aTEwVzVyN3I3aFRwVHFJYS9KK1B5NFVuU3hJY0w0SnRsQzUycnBBMkw3TWtp?=
 =?utf-8?B?cXJmWHpEUytlczNPM3A0YkswTE1tUzhOeGNKWHRjNnYrK2pvaGl3dnRrTjB3?=
 =?utf-8?B?b3VxT2V4YXN5TVJSVXhRenhtNFVWQUE3T21zUUZZQVNKUGhsSHA4bEJnMDdP?=
 =?utf-8?B?RThXR0E3KytRMXhab2NpaGEvYkVwUThvRjZvR3FqaFh5eFBQNkk1M3EvUXc1?=
 =?utf-8?B?TXA3dy9ZdDNleE9YRXNydjZFbHlYcUNlK1Z3dVFEQ3RIdVBzNy9LeVU5dGVy?=
 =?utf-8?B?WXRwQ1oyeTkwYkFvN0krWE5wOWNtekVIRGxOaDhub2VlekVyVnE5L1Vzd1BD?=
 =?utf-8?B?anM4Nm54dXg1TEg1MG5Ua2lkL1hlVk1SUEhqci9hQ283WTJnVXVDbm9KdllF?=
 =?utf-8?B?RUNEeWRBcElRa0F6TEIyTUxnZ1I1VjFMZU56Z1J6QkdVdFUvcXdFVGtxcG02?=
 =?utf-8?B?ZU5iZVVyL3NvSGRXelh3MUhjQmNBWFVtMjN6UzZLZFJiRDBYOVFqNjB3OG9F?=
 =?utf-8?B?a2NpUFFUNlpDSkw1eEdYZldrRExuSUt5dU1sT3BkRUZRcS9sRVJoZis0dy83?=
 =?utf-8?B?V3ZZVEprdFYrWXMyaWNIOFpHY0x0aTJxUXJjQzdFTi9LaVB2K3g5aktNMDVL?=
 =?utf-8?B?VGlaUGRnRHJLWFd0M0liSkxFTnhxbXJ3K3pJUWlKZVUyY1Fkc3JoY3Jxa3Bv?=
 =?utf-8?B?YWZoNmZmeFZYZ1NvQU1xUFVlZG9TOGhyQzdQdHNWK3IzaGhJWVFXNjJJaUFJ?=
 =?utf-8?B?eEMwMnAyeXVVRnJCOWhJWFAxS0cwODZ4WXovbVBJTVRhVmIwaGxRRGJPWkFz?=
 =?utf-8?B?emM4bDhKMjhxL24zRUNkZmFOSDZvOVhDUTErU3J6VCtjZ0g0TFMzOUk2OU9w?=
 =?utf-8?B?SE1lSFlJeThQbHFBZ3pLcUJUbUJjVndVdlhkR3BtVTRCbmhodFRFMFdUWHk4?=
 =?utf-8?B?YXhqeXVraTFFL2kvUHJSc0lwM0NLRytDV0dSRjQxaGd3d2NzVFRNU3RhMEYr?=
 =?utf-8?B?YzJqdGk0MHdib21QT0VNTmVzSjg0V29sZ2ZiNmRwRk9aWncvNS9vekh1YUhE?=
 =?utf-8?B?cVZtQ2VqeTVPd0N2S0dYeXA5NFdaSkJabjZiQ0hFbEZTTDJYRlVGcXZMTENo?=
 =?utf-8?B?M1VnMHdHTmh2NzBPcHA0Q1graU1qbm9nMERWamQ3VmdMLzJIR2p3cExYRGt4?=
 =?utf-8?B?dVhNeUphcHVjc3hvZ2hUUzhLZ3ZIcm1oTm94Ykw4VFk1WHNVSXphUFNIWFpS?=
 =?utf-8?B?ZDlnMXJhQWpFenY1NUk4U1JDclFiaWdoWFVhVzNsQ09UZVpxQjFZUGY1anpk?=
 =?utf-8?B?SXc1K3VDbFpONnA3ZStGSEc4VDJYOURQalFBYVF2QWcxUUg2aCt2OGw1WTE4?=
 =?utf-8?B?a2QxNnBlSE1yRkJXRGJkRXBzTG5mdCt2d0FYRmRXT1BKdFZBN0FyL3BQN25m?=
 =?utf-8?B?c3hZYnBrNWpDRFNYclpKZXlmaFF6TVNuSDZ3K0JFRG00dFJwOSs2K0FKVzlr?=
 =?utf-8?B?ekdlalNJOHNoSzZIK0pWQkE4QzQyZjE5VTFIU01ETDVnOUtSSDlrSUdOZE1Q?=
 =?utf-8?B?di9waXZmbHJNeXNrMS9hcHluUlRHTnNqTC9TTkJpbzJTaEFIREJqNHkyZnhL?=
 =?utf-8?Q?pkbOarChmkSicE5yRPTTg6MSRClUTPrvG5mRi?=
X-Exchange-RoutingPolicyChecked: 
	BYdaw1gcyAukXU0TkcEGEW/iXpJ52+ZlpETX5F8QgYfOX7kjsQ+MbDNtS9gwofyW9u0t91B0xEGEiQn+WBhoPvcqIMlmh+K7ffsDZLTVpuhGv0vzoXHELpxjbnAqc08wnxHKa/uooWeJCAET7lhtJUFT7XF3AxnR199lKnUKmbPSy7MjaZDBqcb9gNx8n6i9iaUuR3h/fFGCbxsuuU8s8M6a20EChUJP38gwtXxuXBprWoiHawVKPckL6K731dzZp1xYFTeFnC8bx4c2prTzmJV0NSYDvgn8pRvNQqlNL508jbLnRl37DqI/n/BRDDxde5u/HZ66QAwUlSs5wdZjEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4885bc59-f47d-448a-a960-08deaa8c8c74
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:56:16.5423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JELEEdtjzTw1utYdDkO/ORe0S2ARrXaUU4yR4Fgh0bbffusoYGh1QCPHWGP946fCFkUublBVB1kyV5h+WpnN6glumWlExDU3YJINmcpl7noQVx5z9h8bgL5p7BsCOho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MiBTYWx0ZWRfXy7WEGxpA6L0o
 VobUUMV653aKcksCbzQoNfa43oTZbMz/+NP6hfDF9MxNH8mYZ7ft3lQFaoRAAHVDxoTPbviT8TT
 YaIRjcG+ph0M4W1XMf9Ir4NKhPxnRRHj1HLZbuNWK4jEwakrDxPeK1isMoftHgjRG2cqU6FTwQO
 FRGxtcjybujCKY2HwXSEmlpgE8BZmR79BfAgMr8QaUVkoqKLsYfH51on5pZh+qpwKpdhSJQp7E2
 xEqq7Py5J3Nmc2cyzGPsFdwKcxEtdd5ZwHzvH9IodVpgYG6EZLKYqyd9gocH/Fvj7gKsfPu4E/L
 Jd9+PuGnBsEZ0wwgCItktWLcVOCzJh3FC1AVpf7JJCqIClA/dQhBh1byaUPKiMzMrGxz4SPetIG
 ZkVUGes1UOdjcxt3r5fDBjtOIQI+a49ztKP7/S69V4F/5S1SUB2bpt0Fu+nwNw3eHkqu0EQG1Pu
 wBks+VzAVvMdS0NnQ2w==
X-Proofpoint-ORIG-GUID: JFpVFgAyTzUmem3whf8p-qi5oaBhws7G
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9bec4 cx=c_pps
 a=OmH7RzXgq2BZ7BLjxN5ZDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OpmAf51uMBEsAglZprAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HGREtA6FYyC7CSOEkeOoQYlbUak5HWef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6456Su612225359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236478


On 05-05-2026 15:06, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Target LLVM tools are installed in the sysroot because they are needed
>> for llvm-lit to run tests. However, this leads Rust to pick up a targe=
t
>> llvm-config that cannot run on the host. Overwrite it with the native
>> llvm-config so Rust can execute it correctly.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipes-=
devtools/rust/rust_1.94.1.bb
>> index 3eb2a36406..e4a9f20e27 100644
>> --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
>> @@ -238,9 +238,10 @@ rust_runx () {
>>
>>       # Copy the natively built llvm-config into the target so we can =
run it. Horrible,
>>       # but works!
>> -    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EXE_=
PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>> +    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EXE_=
PATH} ]; then
>>           mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>> -        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PAT=
H}
>> +        rm -f ${RUST_ALTERNATE_EXE_PATH}
>> +        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_=
PATH}
>>           patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>>       fi
> This appears to be a consequence of the new install in "clang: Enable
> cmake flags for llvm, clang, lld tests". Perhaps we should just not
> install llvm-config there if it is going to cause problems and need to
> be overwritten?
Yes, this is due to the new installations. We now need the target=20
llvm-config to run the Clang
family test suite inside QEMU for the target. Previously, we didn=E2=80=99=
t=20
install LLVM target tools,
but running the Clang test suite for the target requires these tools to=20
be present in bin so
that llvm-lit can use them.

Also, the existing check is somewhat odd. Even if llvm-config exists in=20
${RUST_ALTERNATE_EXE_PATH},
it can=E2=80=99t be used for building Rust because that version is built =
for the=20
target. Therefore,
overriding it with the native llvm-config makes sense.

Regards,
Deepesh
>
> Cheers,
>
> Richard

