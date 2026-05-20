Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE11CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 01:47:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3027.1779241631844410368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 18:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AuuRBRpe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=960081c0ee=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K1G3NE888767
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BPbY7NDA9VoWQcKTa+bE/wOdv2r+8K6IasGMyiXpR78=; b=AuuRBRpecPrq
	gdoopaHEVraAyl0wrNCiaYKvDKyx2sSb5bHTLKqKNU5aLQBvSnPN0I0PlmfeIHpo
	Of2PprN8gdeyoUy9Zuop2jT+aOe+FInuEeZs8Fqcq7xB/MVtOWI6lLM9UvzgpGmJ
	N9qTiiCov2Iq6rb47tVKQuo6sXXWfGKaycU5B3FtT52FIqz+nHiO3tjebqEl86RR
	PYKRz9MtfL/ykRQrhmGULPh+RioY7ORtSjELdhwpZ8d84aV/CtNTfJo4UE7sYw8c
	0Z76UssHV5V9Pk/pWV7ZWibvmfQs1pNtS9rrNnJkg6Vni+Ao+Yw7PRiPM3lHuRJp
	7kthXlXijg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3vhw5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 01:47:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cms2o097q1LUnJ9NAZWNrX9oAaktOePI3HQDmdxS3dgzfvNk9rqG+XJ17PQcCZaZFwNiAeI6fyzTDBG4/+Ns/vyXjyRj6DtpvIHSKThfnNpqMNtG1NqMwAZYV1AxT4gHG31onlkwYjeRSQiy9bwERjS81EwtwmYH4Vve4V0KuLeQp9iyNe0gQRl9KCk7vNWEZWZeCaSmDSK0DmUeyP6kmvsmuk5f0bpmzJfBvd35T7ZbyY5H4nrGRduEKkxZTuI3izbu32HYBUoX9mAGfGE+04nbMX1yM/saXyaWfbVfeMIlX8akfwxGoWtGiHWhVcMKd9dwFMA0CqZUgCT+Wj5ltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPbY7NDA9VoWQcKTa+bE/wOdv2r+8K6IasGMyiXpR78=;
 b=Ykx9LCcUgXcJheB/KiL+t96u9FR6UiBX01Rn2yfwRqhJU2+CzKCoJs8MODHd5SD4Ae/M1GCxTX33yZyDisuVbNjdzJIi2/dUcudM1IRGbtimWF48viU6n+1IMfmVzxT0NmI8TIqCOF3jkE+p/eMUR4dnEkvZVBNwgO8TgBUMi/nnnOsh4iuLJeTuJgtf+kGUHvt4GOY6vewdYi0RmLgKDpF3q/lO3TnhvLuKDsuu6EfndUmZ6z8DhBczjASmaDkCGjmC+mU+nsVjHINP1cL+ty7vz+DBHQZyxruli+hExENQt5G42Zn2koSCdH8frNCgviqYVSPnXU/OpEvV3+9Ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 01:47:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 01:47:07 +0000
Message-ID: <456f3aa4-07f3-48fa-abbe-bf05565afb30@windriver.com>
Date: Wed, 20 May 2026 09:47:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose][PATCH 2/2] busybox: fix CVE-2026-29004
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
References: <20260519052711.3732145-1-Qi.Chen@windriver.com>
 <20260519052711.3732145-2-Qi.Chen@windriver.com>
 <DIN0GUE7HWMJ.770K6WDGCV6K@smile.fr>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DIN0GUE7HWMJ.770K6WDGCV6K@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0075.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: b04d3c43-4b50-42dd-76fb-08deb611b316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|4143699003|18002099003|22082099003|12006099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	5B6ZED+Tq9UJoHog0wDnIyAm9cEu+TE2eoffP2VhvMYqrUT1oDH2MSM8aARN6qIUOi1D8q0gIRw0sm+RiX6C1RdKgZyWmfrF7E/3kaaWOv1nFsiLKVKJrg2DpxPkkPbwWZw5UTGazycow7UXBQlhmJTrp6UslCIbM3JEpDUx/PqE3J0qnnHTDkbd9EqpXIR0QUaeBymV4sDSIDfTxuMUQ7Jokz4MLKvuJ/U0q9WcRkILMUzIWAcRAuL8tkY3eUi/DalgjW1Aun/2jeNxhWaFISALZDEgj+lAhAtJiEZ0Cmzl5MmEG97fQHpJIdjwzAJkeZINRyN7crN+zjYTGOS427nmNkML6kMjPuyd4Sr5F+1eJmrN6yTGJlZC5rR45OVFa740U0sjbojGKMWArGuymu12NZztWW06CKLKKDrap+56Ov/mQPufaaN6MZFclLl73y/emZ01dq2Y+Z0ahbQHJg8hXilsNvH+Clt6dIo67SczCLTHpLv4GhcXsiCXYlb8wWfyR/Nj3tsFwAGT0lQDH4n4b5V7umEVUxbJeKl04vY1ss1LD+vLRdbh8M+TraObbDHJkxelD4HMLoucvT7q1Hd95JOIMuNbUoC4MB3LDE/v3HEfnIEitY4cdDtGaL16NTpI3D1PFaDDw43O1WKQVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(4143699003)(18002099003)(22082099003)(12006099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eExnUDdLKzJSN3EwYmdBb2U0L3lHNDlVWm5OMTA1SVZrOHBOZVJEUGZoVDFO?=
 =?utf-8?B?cFdHV1NJWXV0eXI0cGZKaWd3TXZMQjNkczRpQzNCVXMvaDNkdEIwOTZUc2JJ?=
 =?utf-8?B?c0FTemMxYjlQNUFsLzM5MkMzOFhLcE8wTzNlNytpcjRjYVZZS1crNGNjOG81?=
 =?utf-8?B?SmdIMzcvekR3ekw1Qml0SzF3OGZDeGlWdmk4WDIzNDMxZ1ZBTjdZTm5aRFJL?=
 =?utf-8?B?R1FWRmt5NmZrckNaL2FOaFZ1WmVLRnczRlR1aEhsTDQwcjNHZFA1Q0o5Si9h?=
 =?utf-8?B?YytUaWdDU0FzbThxSzhhSnE4VHNPU1NXeFc0R1RIMWhDcUJPdm5Wckt6RkEy?=
 =?utf-8?B?R1FLd0RPcHRIaFdrTFpFZWloS280Z2lrU0FoRmJPM3BpN0tmbmJhcit0ZDBU?=
 =?utf-8?B?SmRHMjVndEE1dFhFZ1BrWXA1UGVocWl3UTc5OXlUeWtDSTJabzRPRFdkYm5J?=
 =?utf-8?B?ZEFwZHBkQS9jMlpXQVBFU2w4MEhBZisxbXQ5cFB2bjdVZW5ub3BzOWxxQ0th?=
 =?utf-8?B?cmJ6MDQ0OTUxWll0Ny9zWXpsNzY1dmdJU2R4eURrTlplaVZoZnhJNFhHV0ts?=
 =?utf-8?B?Y01laEhQTS93K3c2eWVVL1ZlbEV1c3p0cUVlSmdrdklUK3ZBYWNlU2lZM1Nr?=
 =?utf-8?B?bFJia05vNGZ0VFdyZXhxanpKQmpsKysvR0VDbkg1U3VTVDhnbmdRVG41TU1n?=
 =?utf-8?B?WUN6ZzhDT3A4R0dibExBSXQ1ais2ZlR1dVdOdE0yMWIwUjlDVmtkbGIvcnVO?=
 =?utf-8?B?dkFOc3VLallVTHdqc0t5MFcxbmpVOGJna0Ruakg0UGFENTNheHdsSFI1V3Nh?=
 =?utf-8?B?RDR0RThqSVhlUjVweXgyQWFtVjRZT2dVV29oVlhNVG5scWRiUGxlRkRUYlFY?=
 =?utf-8?B?QkdBQWQ1em55VVdhL0MzelliS0crZ0JGelp4WGIvc2tiZHpVbUJnTy8xbys3?=
 =?utf-8?B?dWNGZVo4eEw3cnFIZUV1Nmt2Qk9NQ1YzTk1ZRmFSYkxqUjQxeTUvdWcxNXI1?=
 =?utf-8?B?NjcrVFc3T0Z1dU9kSE1STUxwakppUytUUERjajExY2FrMWZMZGhaZGpieDgx?=
 =?utf-8?B?RW8xLytFRzI3ekxwZnFFU2FYTGN0aWVkNEk2b1lhK1lZd2NuVVdvWHhucXVF?=
 =?utf-8?B?WW8zbmppVGpLVVc2TzFQUHM3Sy9Ea3RWYyt0dEh1Z1lMQTRJRlV4ZVBZUGMy?=
 =?utf-8?B?cGp4YnRveEdOTlNKUllxNkQvdzlpNjRzYmxaWHErejlGa3pJN1k1YmltQVA3?=
 =?utf-8?B?MmphdFl2bis1M3RJZEVVNTZrVzUxSnNCeWxFY1lTUnIzZzhiQ1J2UW40WEZR?=
 =?utf-8?B?NjhBbTh6QkZBR0JXbHRPa05RUzFyNTlBdUZOMHc4ZUdtV0lDVC9DS2o4K0pl?=
 =?utf-8?B?U21DUVp5RHFZS0lPYkF6S3NiMmY4WWdoYUFNSngxaFB5MFNBNW16d1V0T2VK?=
 =?utf-8?B?cEpjMjRJMTY4SE8vcVcrUk81b1N4MFVmaWpBQldJUXRFYjBKaUlGL0dZdjJu?=
 =?utf-8?B?SnptYnRYdWFicUdXVGpwdVpaREVzc3ZwbE9sMHZCOTJTTmhpc1NEcUJNNit6?=
 =?utf-8?B?UTJrU0YrcCtBa0RJTU42MktHUmxIdExvcHFnb2drWFNKZGlvYnovWmo5R0dk?=
 =?utf-8?B?bWFLMmZnRGxLZ1lsazBmWjdoSXZnZmpiamVzRklZR0VSRUdGZVowWUFaZVdt?=
 =?utf-8?B?N1V0K2IxS2FEdmJ6SGwrb1FPL29Icy9LN3ZZcnRTek9HaUtyZk1FS1VITUY5?=
 =?utf-8?B?ZXgzOUVzU3BHREd2QjBEWS9nZUFxUFRCeUpicFpQSmxlV29CTUplTHU1b2lq?=
 =?utf-8?B?a2h2bllLcC9ZMWVXZDRvZlBoMTZ4WjVhay9LblFyZFY0L0x3WnYyYWxEM0Fy?=
 =?utf-8?B?VHNCbkQvUW1KMjBSVGxEUEdBTVg4RDQ0eGg4ajVPcGpNNkpHTTkyUzF1QkdQ?=
 =?utf-8?B?TGRJOFBCbkpWdVozOWgzQ1dHbmZheDUyZ2NDTDRrL3NmNjVPZnE0WjlGU3Av?=
 =?utf-8?B?VmlJSG9pTkdUVkRrNXMycDJUUUE1dHhOZlVhWktMeElZOEdQNzB0Nk5ZaUZ0?=
 =?utf-8?B?VEY2REE3enJQZXUwMkZLRHpxMnB1dTlzd1RZam1GWWR4WFlnRkVBUTZ5M3FV?=
 =?utf-8?B?Y3kzeEdBOG9TVVpLYlZ4UnlrOFkzNWYrUlJFVUhZVG5VQ1YxZHM4eGE1Z3BF?=
 =?utf-8?B?eWtNUnRmd3pEWElVekxiQXJkUENuc0IvQkFCcU1zK3hHNUpHZzlHYjVCbGZn?=
 =?utf-8?B?NWxVT2ZqUzRrVm9WT2llOVdlYlhhNVNnd2N3V210OGxxK0REcEVsM2FRNldI?=
 =?utf-8?B?UjhOTEtOZytGQ0M0OFJYVjZKdkQ4WUY4SG01dEdicnRaOEg2QXpKQT09?=
X-Exchange-RoutingPolicyChecked: 
	mlfq8kE1ZSnhWAEvFrElLKnnNzby9hUhv6QqcEVvnBfySeeU19szj4NzswstmcDGsrQZs3rirONE2hHw7uYz2qeRo/A5fVfFeBxKrTe78N9338QFjFLN3/JHTsAKYuM5Xa8f+7eSu3PTHSfdclBXq0kgs6o5DkUzgz8+AaCk++zZL44jHjvxvoSWXJD2w0k/RhuM3VGmn8XgiAjmUnaj5Y4p/i6nrUTRM0iycjpS0ODW44BAJWvR1fIMTP64WjpTnBb7YCcwLuH0J864BSnCAepvUesROuZHL904mu+XxnOAz223DQqkU11NzIDg8IKEE6PNZpjvSEJTkT04DOBf3Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04d3c43-4b50-42dd-76fb-08deb611b316
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 01:47:06.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sytE24P+BhIkr20sJbKpY+IFWhSezMplTaEcNZA1j5RN/vJIBMJ5vq3EHLuzpmiaXFtUPh/+48FcDQuGIOMbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: abySnsJxH88YFIjhx8K7B8kbASn--Dh3
X-Proofpoint-ORIG-GUID: q-kHh04l3NtFN8Xm7W69eLBDVRYRHho0
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0d129e cx=c_pps
 a=qH/fS2hzlQnCJHG7LpbWtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=J0Tn2xNtAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=BAgpWb_9yb2FhgsescIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9ZcRxastL33iXWX1AWsW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAxNCBTYWx0ZWRfX4Sj763fXh42J
 3t+kRTbMICXlc52TPWoKrJNOk9Sd3mBywF1D8g+hXM+h+Bps12kgPLaJGfWzZRkXMFtxSk2bHJe
 2k2g1ek2JiTbfpyhjCVJPi2O2Ay4E2ALTh5z75nCtNBqlX8LwzZmf0YMLik9IwiFdWLXGpOhb3Z
 bNi3wqizi4nsmNC8oJt8gyKFQfjab39wYVA7bGo1b8eLkqTrxigOlyd5T4uFencxAjr1cIdZA20
 P3o95qc0JtPE6VVC9H33a6mlePtL6NUx6p+/gXEq+k8XVkX3rcD0rAkoZcX3lEQNYYl5KVwSPj/
 mP4kbPWPRPlSlA54KePqXeZ8X16Hrn18wnOrOd9G4q8FRXDAaQ7cwERG4tLyCrvzW5l7d2pKodk
 +8K6qgD3eCrfw9O5NtcZBfrX+JpX9yqATlkN19YxrtmY1bCGoAETaSeO2DwVZCE/p2BBfwCBwV7
 uOoxIciBIyMA821YtRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64K1G3NE888767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237377

On 5/20/26 06:36, Yoann Congal via lists.openembedded.org wrote:
> On Tue May 19, 2026 at 7:27 AM CEST, Chen Qi via lists.openembedded.org=
 wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Backport two patches to fix CVE-2026-29004.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-29004
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> Hello,
>
> As far as I can tell, this CVE-2026-29004 also applies to master (in
> particular, it does not looked fixed in the recent 1.38.0 upgrade).
>
> I can't merge this on wrynose until a fix is merged on master.
> Can you send the equivalent fix to master?

I checked this before I sent out patches. I can confirm that the issue=20
has been fixed in 1.38.0.

"""
$ grep -A 5 "Setup environment variable"=20
busybox-1.38.0/networking/udhcp/d6_dhcpc.c
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Setup environment variable */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *new_env() =3D dlist =3D xmalloc(4 + addrs * 40 + 1);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dlist =3D stpcpy(dlist, "dns=3D");
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 option_offset =3D 0;

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 while (addrs-- !=3D 0) {
"""

And Andrej has already sent the 1.38.0 update for master branch.

Regards,
Qi

>
> Thanks!
>
>>   .../busybox/busybox/CVE-2026-29004-01.patch   | 42 +++++++++++++++++
>>   .../busybox/busybox/CVE-2026-29004-02.patch   | 47 +++++++++++++++++=
++
>>   meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
>>   3 files changed, 91 insertions(+)
>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-=
01.patch
>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-=
02.patch
>>
>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch=
 b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
>> new file mode 100644
>> index 0000000000..8ce4858adc
>> --- /dev/null
>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
>> @@ -0,0 +1,42 @@
>> +From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 200=
1
>> +From: Denys Vlasenko <vda.linux@googlemail.com>
>> +Date: Thu, 12 Mar 2026 07:25:38 +0100
>> +Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
>> +
>> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>> +
>> +CVE: CVE-2026-29004
>> +
>> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirro=
r/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + networking/udhcp/d6_dhcpc.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.=
c
>> +index 79cef1999..d13b05829 100644
>> +--- a/networking/udhcp/d6_dhcpc.c
>> ++++ b/networking/udhcp/d6_dhcpc.c
>> +@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option=
, const uint8_t *option_end)
>> + 			addrs =3D option[3] >> 4;
>> +
>> + 			/* Setup environment variable */
>> +-			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 - 1);
>> ++			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 + 1);
>> + 			dlist =3D stpcpy(dlist, "dns=3D");
>> + 			option_offset =3D 0;
>> +
>> +-			while (addrs--) {
>> ++			while (addrs-- !=3D 0) {
>> + 				sprint_nip6(dlist, option + 4 + option_offset);
>> + 				dlist +=3D 39;
>> + 				option_offset +=3D 16;
>> +-				if (addrs)
>> ++				if (addrs !=3D 0)
>> + 					*dlist++ =3D ' ';
>> + 			}
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch=
 b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
>> new file mode 100644
>> index 0000000000..734f0bbbdb
>> --- /dev/null
>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
>> @@ -0,0 +1,47 @@
>> +From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 200=
1
>> +From: Denys Vlasenko <vda.linux@googlemail.com>
>> +Date: Thu, 12 Mar 2026 13:23:48 +0100
>> +Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX optio=
n
>> +
>> +function                                             old     new   de=
lta
>> +option_to_env                                        694     711     =
+17
>> +
>> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>> +
>> +CVE: CVE-2026-29004
>> +
>> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirro=
r/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + networking/udhcp/d6_dhcpc.c | 7 +++++--
>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.=
c
>> +index d13b05829..1851cee2a 100644
>> +--- a/networking/udhcp/d6_dhcpc.c
>> ++++ b/networking/udhcp/d6_dhcpc.c
>> +@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, =
const uint8_t *option_end)
>> +  * |                        valid-lifetime                         |
>> +  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>> +  */
>> +-			/* Make sure payload contains an address */
>> +-			if (option[3] < 24)
>> ++			/* Make sure payload exists */
>> ++			if (option[3] < (16 + 4 + 4))
>> + 				break;
>> +
>> + 			sprint_nip6(ipv6str, option + 4);
>> +@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, =
const uint8_t *option_end)
>> +  * |               |
>> +  * +-+-+-+-+-+-+-+-+
>> +  */
>> ++			/* Make sure payload exists */
>> ++			if (option[3] < (4 + 4 + 1 + 16))
>> ++				break;
>> + 			move_from_unaligned32(v32, option + 4 + 4);
>> + 			v32 =3D ntohl(v32);
>> + 			*new_env() =3D xasprintf("ipv6prefix_lease=3D%u", (unsigned)v32);
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipe=
s-core/busybox/busybox_1.37.0.bb
>> index 4790899684..a6abfa2598 100644
>> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
>> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
>> @@ -64,6 +64,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-$=
{PV}.tar.bz2;name=3Dtarball \
>>              file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-=
does-th.patch \
>>              file://0002-tar-only-strip-unsafe-components-from-hardlin=
ks-not-.patch \
>>              file://CVE-2024-58251.patch \
>> +           file://CVE-2026-29004-01.patch \
>> +           file://CVE-2026-29004-02.patch \
>>              "
>>   SRC_URI:append:libc-musl =3D " file://musl.cfg"
>>   SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237345): https://lists.openembedded.org/g/openembed=
ded-core/message/237345
> Mute This Topic: https://lists.openembedded.org/mt/119386348/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


