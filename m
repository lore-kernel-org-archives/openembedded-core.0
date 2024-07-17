Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB51C3DA49
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 02:18:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6482.1721182677997569391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 19:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7928052a7e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H1vmZV018125
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:17:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrayd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:17:56 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46H2HuEv016514
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:17:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrayb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 02:17:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO7CnzZa8ZJlbVIIv3bwaqy+6ej+QXnCGky/DGmDT55Dk5jr3oAcgitbbBjCEpg5MeUUs8T7LFoz9tFebSU7z1CS3loHbMCi+3YJarn7QVbafM0bWfV8+aBYJtIBD8onCzfpLLg2rGy5jhnuuTrk5kQAL/sIP2HeuOqBRHfekSLVcpMkyXeRNJ5uxlDs/IV5fD8ZBiLY8yyhnl4GmfoT32Jc9GeXgu6QJh+eglLIySUe5K7Jt+0qkWC1tqHjiYbrpvAwSBNGI7K1cDup6dTw97Tf+saLb6MaYBdL/Cr0KlVeim3cIf6K7nrncOx1BUIGlD2JVSThLy4CWxEvzQMs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScYBtIz8fCjcsVMXuvHVKPLXHKXYnVaEdLYsiWQbtq8=;
 b=GinNnm23aBgZSgNcoGqRY1JaV6HCL1+0aoP8NdnSgdlICDmVw8Sbj809izbg5f2duOcJ7RwZz65PXNO73BPkb3rnoCIoRxUJYv7XALEUl8/1sT7Rc1A/mbJcCIQlZ/2aMN/YS3ysb/WuFHF4vN1ymBdrZdyd5G6Uo+lJmm3dnVfPo0Avy4U8mUwTjGxqBu/7CvD4rTBOy6LkhEqTkYyJnh2Q6Vr5Y2Us9YqVOhjiIA3QlAslHRaO2gRKtjNiSsfYTjFXMVxoBTWm7v4eUSOqBhdq6LtMtm9Ucx4TEEqMYCLSRjp2to/F5qgDu2FpD2ANpSCa8DORgEevY5BThz5tWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 02:17:40 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 02:17:40 +0000
Content-Type: multipart/alternative;
 boundary="------------d4xrLyenNdtEBxeVF75yscU1"
Message-ID: <0557a6b3-636e-41cc-9774-9ad6fc52dce5@windriver.com>
Date: Wed, 17 Jul 2024 10:17:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] pixman: fixing inline failure with
 -Og
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240716095803.3548946-1-changqing.li@windriver.com>
 <CAOSpxdZzpn4h2-=qgJd1yv_aUcnLF+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdZzpn4h2-=qgJd1yv_aUcnLF+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com>
X-ClientProxiedBy: TYBP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a1ff34-d2e3-4d29-f0b8-08dca606a1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFpEVDB5WkJ3ZmFIZllJN3gzMXNYbkt0TXZVOVN2VS9uRy93c0F1OFltd2Yz?=
 =?utf-8?B?QzZhc2dtYkpnUVBGZmQ3RUsxNjBYc1VjSUxDRGhzS0xwRVRZdVZEYnBTRXls?=
 =?utf-8?B?TUJXRlJDOVdzYTZTZmxjUmUyUTZ4Umw5dU9aQzZ5aGtYQzhsV1M5TENSY0NP?=
 =?utf-8?B?MEtSNitFWG5XYk9Rb1FnT2p4RHdUdEw0KytiR2Z1WHZWaWNNQThhN1h0TTJU?=
 =?utf-8?B?MDhaNEtDKzBkOUVuKzJaOWFtZEdqcGRWem5uZjlacmpaZjFRZlMwdmVTWnpu?=
 =?utf-8?B?VU8xRFNlMmk0UUhvMmRSSnBRdVlZMUM3TE5SOWFzVkNRTVUyU3ZRLzZyM2hF?=
 =?utf-8?B?TVJ2TEkzVlQ3YXBxejU1dDJLbTFpdmZHSEQrdmN0SEhXdDU2QXFUUUFjNHhP?=
 =?utf-8?B?R3lWdkNUVzQrbTEzZkxtTUxLM2dNR2RVSTZPWXI0VlNiV0NhZUVpOWpza3RC?=
 =?utf-8?B?N2lPc2FLOHY5VitXYlVQbTNtM0VUaWQyRDdPNFcrODZsc0N6ZHQwTUo4RXlx?=
 =?utf-8?B?NnJ3clhvQSs4QjIvK0M2N0FCNHArNHpwNkRUdWgxa1pMcHBPZXVIVER5VzNl?=
 =?utf-8?B?N1B0Wit0eWEvemVJOU9oYkFGaDdEK08vOHFXWGpRRWk3cWlMU284cGxzNnRX?=
 =?utf-8?B?SzBQQzdoVXZWWGVmbDVaekQ4OGJ3R0luS05tTC9RWGw3VTY5Z05kanhVVlIv?=
 =?utf-8?B?VmkxZ0Z6S0d5bVllQ0ZpUHEyd0ROanF2M3JMVDliZlBQVVJwRG1wV2M1eTNp?=
 =?utf-8?B?YkszeXRFNU9sYkZMUHd2WC9mOG9JM3pTcXQwa0t6ZWtFVXNDQWU2N1Z2QUFD?=
 =?utf-8?B?SU9HUU1rQzRicGxER0g2N0VBWXI1SlJxZ3pwSW1ZQ04vY3prd093R3hJM0dh?=
 =?utf-8?B?SGJTQ091OTZWZjZoMFNMbFkxKy9WKzI1dlBKWFhoUTV0L0swWXpqSWVxcFJZ?=
 =?utf-8?B?V1VoL2dRU2s2UG5aMXhTdUhTMG1oQ25RMXhmakR2NHhIU21Mc0VtM0NJMzNa?=
 =?utf-8?B?a0NjQ25relBrK2dITVFHd2FnTVFpTUdtNkZ1OTdqOG5rdVFzZFAxTEVrUnFi?=
 =?utf-8?B?ZWIzMEd3cllJWEZ6YzlkRThiUlM5bGZDTE5mbCtGWW96REJxVGF5RHVQeEVX?=
 =?utf-8?B?T2ZvTXJsVWxoSnlUMXMzWDVFdXJhT2NDWTFMbVRDSmhFLzJiTk1UYkZJWUpv?=
 =?utf-8?B?OThqOXowaS9aeUJkNWxDVXlFZlJtakRxSmRyUys0MnJabjdITkJpREFibDhN?=
 =?utf-8?B?SzByYmhHWmNMMXFyMHZkc0hFMU5RRDVQeUR3dVlPeEkrUVlUMXgwcXZ4eVFG?=
 =?utf-8?B?SmxHZ1V3eTRaS1RLSHVkRjRlSGtkdXdZVjloZUMzRC9mNnl1K1lFQmZhc0Ir?=
 =?utf-8?B?amxESHVSUkMxcEZqYVlGbWErSjRORExiQXRSK1NIS1UzQTduaWMvTzBSR1l0?=
 =?utf-8?B?VmY4dkZ2U21IbUhERjNDSVFmcWhKMWhFVkY5UTRNWXJWWW9DNnBlZEJxT3No?=
 =?utf-8?B?OHBFNlRFRUNvZ2hFL0ZweWhKdGtWdG5tUkFiY2tUTnIvaUF1SFE0Z1lpN1FS?=
 =?utf-8?B?QlFuOG1Yb2tvWkFwWUI3b2p1N0xUNVhPUU5Pbm9RNUxjSFU4NTJNSTNacWJJ?=
 =?utf-8?B?VmZwdUVKWDNnN1BEMFR1MFZqbmRmNFBSWWJNcUNaTTJLY1JEeXhOYXRJWUJ3?=
 =?utf-8?B?bHNwK2UwRjNyUjZ3L2l0ZmhVVkxqWHVKWGsyelpLQ1FVaHZucUNNMXBuSmpI?=
 =?utf-8?Q?1nvRXJek0ykEC6PWC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEkwQTdLVnRFZEpXYjd6cmtNTG5oNzZzODRlNDZocW1YL2RPb0J4YWpLeHlk?=
 =?utf-8?B?Rll2NmwzdTcxZmNlczBieThFMlBvSGZMZVFmOWJ2VE4xOTcxNllSTFVMSVgw?=
 =?utf-8?B?Vm02eUVsejFzenhGcmxQdFlMVGZTZEQ0bkFDeFBHZlZUOWZtVVJZeDFGdW5J?=
 =?utf-8?B?SW9ZOGNzTmpkcWpvYkNCRDkyRmUvaDZKN0RkRk53TEZIdHV6WW9KZmRsTUIz?=
 =?utf-8?B?VGV4Q3VITVJUdFJxOEEwditsN0xyMUJwOXh4a2c5dUFGMFkvcUNkcUFGUmlM?=
 =?utf-8?B?SURHeFdSSWEwMXIrNTZaeDdwZFNzMzhScWpTN09pbWlJVXQwSy9wN09LQ0g1?=
 =?utf-8?B?SWk2T2xtVE53UU1PS1JZTHFoS0JlWlA2UDljMks5UzcwbEJkM1hobkJGWUh0?=
 =?utf-8?B?MVRNNW95eFg5aHFmNkhRMnd6SW95NzAwR3dZdTRtYWZxQTFwL0xmL2pocVp3?=
 =?utf-8?B?WVYxQUUrVmpod3ppbXFFZW8zc2VmaFhjenBHeE9qYkhRc21HQVF0SGhGcXRW?=
 =?utf-8?B?Um1SYkR1UUxYNWh2Y00vN2lJYlBZTDYrL1YrRjYrV2FNVzBBUThWYTR0c0lt?=
 =?utf-8?B?aW1aS2pWaDNuSEJ0aXdTOEhUS1p3MU9SdmZlMi9kN1JzKzlFSTFBSlQybjhh?=
 =?utf-8?B?VEZlbUVZVit5ZmlDL00wRjBpQlRrR2J0Um4wcE5UWURUQ29UQmpEcFliMCtU?=
 =?utf-8?B?bGZWNld5SmNTLzV3b0ZPY2NGTmdMY1gzbkJOZU5xTmIvTWZGUW1vdk04VTVY?=
 =?utf-8?B?dFNZVWc3Q21oQ1B0RmdXUzVicmNUOVdpWTdLSEVqQXN3MEtZR1F2Yk5qaGll?=
 =?utf-8?B?MTZQTmEreHJQQy9JbXlpL0lUVHBmT29Ld3B1Rk1Sa0xVRkVBaEYyMllTc0s2?=
 =?utf-8?B?a0RPTWFIZFIzRXg1M2lCVUlFcE9Db2tmczh5UG9YbUhRYy9Vd29ibERtaDZh?=
 =?utf-8?B?WHJuRGpDUFVKdlhlbVkzb0drVTgyWkQzYWdYZHNDOXl4ZVQ0c09Dd1JGYVNa?=
 =?utf-8?B?eGFsTktUckw2VUNJVExTVlg1SGhCcllnMmx2aTZOdk1jaVJWSFRoVnhRbkVq?=
 =?utf-8?B?Nnp0a1FPQkRUb1dhbXBLeXJmalpLMFB5VHJTcktlK1U5WjVTT05hT3dHcWxw?=
 =?utf-8?B?QUlTNnk3U1RUaUlTMG5HSmVPdkJSc3FFNUk4ZysxeUhkRWVyMHdDSEVCV3Bq?=
 =?utf-8?B?WGM4MStOT0F0T1RaTzdEbDQ3dkRQRGxTajBLejlRUU5WK0c3blQzMlVVbVFG?=
 =?utf-8?B?aEYweXpoRjhZSDdVb2JJajFjYnJBSEcwQ25QWDhDcDZHQmpjUjg0ZElKOGtn?=
 =?utf-8?B?VnhWRDQzRWVYcXAvcVZCM3d2bExyT2V4VXl4V2RHeFBFdHB0M1ZhWDdvRkRq?=
 =?utf-8?B?Skw3VzhpeFhaNjNFd3FXckNMN0U5NE8wMFNvQnB3ME5rQnJ5U0I4R0JLaFBv?=
 =?utf-8?B?QWhvQ1NCREtXdmxjVmE3UnB1ZW8xQnczK3ZKVFIyWXMybEJkMWV0TEplc05u?=
 =?utf-8?B?aTBvZTRyTUMxMythaWZCSUp3TU4rMXlxZ0drK2swclE5R0RSZkF1NlFNck4r?=
 =?utf-8?B?VmZYT2xlZXlUd3lPZ09iTjl2OThaeG5rb1FkOUtDQnM0WXhweFFBTDloK25h?=
 =?utf-8?B?SVg0MGJMMHhnNG95YmdrazNWWmthcTVENFZYV1Q2UUwwd0pOSy90dnBDTUlK?=
 =?utf-8?B?eTAxZkxTVVFxK25YaXpyYU9vS0M0NFFsekZYM040TkRHS2JrNHFFUW5CK1Jm?=
 =?utf-8?B?R2RSZTFxZ2ZHU01hbE0xWklDeWRQSGxWaW5mK0V0dkphdVdyZU1DSDkxOFZz?=
 =?utf-8?B?WE9aKzJaUTVCQVZyZmJqNHBJVktTVnpIUHcwZXVyaFBHeXVyTW9iZld5eG14?=
 =?utf-8?B?QUo4QkdsMG5xNGQrZ1YvQ3p4NXlYOHF1Vzg2dmFzbFMxWkxJS1ZhYWg1RVh4?=
 =?utf-8?B?VUxUTHdwR1VINGJoMmFrbUJrSGxmbHNmdklzK1d3c1d4UEh0NEZza0FqMEI4?=
 =?utf-8?B?aE9tY0UvTUM2dVd6RmJ5U1BVaW9seFE3K1BTSWN5NHdmY0d1SVBqb0V5Z01r?=
 =?utf-8?B?eGZ0TnFtMkxpcnBKOGkybm50bFdUSWZ2eVRkcTF2ckVWN0hwMkNHd3ZpTGVO?=
 =?utf-8?B?TENtZ1FWZWdUNldXMFpDRUY5Qnc0djdRUTZxOFYxeUZOSWVuTVh1N2J3WFR3?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a1ff34-d2e3-4d29-f0b8-08dca606a1f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 02:17:39.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZwQHKZfx0/QavEFZXk8YoP7Hf7lFpTlnp0owHW9w31VkAxt3g58i3hiqfonGB7n8HwbHpk8fnjSOnnUjAlHdx8CQ61KIrXCi70d7SwPpPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
X-Proofpoint-GUID: r8PFbZSzL4tQ1HEUoU3hkITbFrhBkpbA
X-Proofpoint-ORIG-GUID: BEurnUUZsf-MNW2vVHdE3s7R4NNUeKzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_04,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407170017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202133

--------------d4xrLyenNdtEBxeVF75yscU1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46H1vmZV018125

On 7/16/24 20:54, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Is there any reason I can't cherry-pick the similar commit in master?

No,=C2=A0 but if cherry-pick from master,=C2=A0 you need to cherry pick t=
wo commit:

[1]https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b=
32a80432d9cfa6c904027b8a6710b5

[2]https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&id=3Dfdb5798b813c258ff8d922711ebe081c3c36aedf


[2] is based on [1].=C2=A0 I noticed [1] is not on scarthgap,=C2=A0 so I =
send this=20
patch.


Regards

Changqing

>
> https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b3=
2a80432d9cfa6c904027b8a6710b5
>
> Steve
>
> On Tue, Jul 16, 2024 at 2:58=E2=80=AFAM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> When debug build is enabled(-Og is used), pixman-native do_compile
>> failed with error:
>> In function =E2=80=98combine_inner=E2=80=99,
>>      inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../=
pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
>> ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining =
failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_l=
ight_c=E2=80=99: function not considered for inlining
>>    370 |     combine_ ## name ## _c (float sa, float s, float da, floa=
t d)
>>
>> Refer [1], always_inline is not suggested to use with indirect functio=
n
>> call, replace always_inline with __inline__ to fix the issue
>>
>> [1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++=
++
>>   .../xorg-lib/pixman_0.42.2.bb                 |  1 +
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman=
-combine-float.c-fix-inlining-failed-in-call-t.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine=
-float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg=
-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.pat=
ch
>> new file mode 100644
>> index 0000000000..5c79754e50
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.=
c-fix-inlining-failed-in-call-t.patch
>> @@ -0,0 +1,56 @@
>> +From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li<changqing.li@windriver.com>
>> +Date: Tue, 16 Jul 2024 15:31:16 +0800
>> +Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call =
to
>> + always_inline
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Refer [1], always-inline is not suggested to be used if you have indi=
rect
>> +calls. so replace force_inline with inline to fix error:
>> +In function =E2=80=98combine_inner=E2=80=99,
>> +    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../=
pixman/pixman-combine-float.c:655:511:
>> +../pixman/pixman-combine-float.c:655:211: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
>> +
>> +[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
>> +
>> +Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists=
.freedesktop.org/msg04812.html]
>> +
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + pixman/pixman-combine-float.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-fl=
oat.c
>> +index f5145bc..f65eb5f 100644
>> +--- a/pixman/pixman-combine-float.c
>> ++++ b/pixman/pixman-combine-float.c
>> +@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, fl=
oat da)
>> + }
>> +
>> + #define MAKE_PD_COMBINERS(name, a, b)                               =
  \
>> +-    static float force_inline                                       =
  \
>> ++    static float inline                                             =
  \
>> +     pd_combine_ ## name (float sa, float s, float da, float d)      =
          \
>> +     {                                                               =
  \
>> +       const float fa =3D get_factor (a, sa, da);                    =
    \
>> +@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,         ONE_MI=
NUS_DA_OVER_SA,           ONE_MINUS_SA_OVER_DA)
>> +  */
>> +
>> + #define MAKE_SEPARABLE_PDF_COMBINERS(name)                          =
  \
>> +-    static force_inline float                                       =
  \
>> ++    static inline float                                             =
  \
>> +     combine_ ## name ## _a (float sa, float s, float da, float d)   =
  \
>> +     {                                                               =
  \
>> +       return da + sa - da * sa;                                     =
  \
>> +     }                                                               =
  \
>> +                                                                     =
  \
>> +-    static force_inline float                                       =
  \
>> ++    static inline float                                             =
  \
>> +     combine_ ## name ## _c (float sa, float s, float da, float d)   =
  \
>> +     {                                                               =
  \
>> +       float f =3D (1 - sa) * d + (1 - da) * s;                      =
    \
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/re=
cipes-graphics/xorg-lib/pixman_0.42.2.bb
>> index 23ae0cbb27..3c55c1705a 100644
>> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>> @@ -9,6 +9,7 @@ DEPENDS =3D "zlib"
>>
>>   SRC_URI =3D"https://www.cairographics.org/releases/${BP}.tar.gz \=20
>> file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch=
=20
>> \ +=20
>> file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch=
=20
>> \ "
>>   SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a=
3fe62626e38e234a625e"
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202099):https://lists.openembedded.org/g/openembed=
ded-core/message/202099
>> Mute This Topic:https://lists.openembedded.org/mt/107249150/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------d4xrLyenNdtEBxeVF75yscU1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46H1vmZV018125

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <div class=3D"moz-cite-prefix">On 7/16/24 20:54, Steve Sakoman wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZzpn4h2-=3DqgJd1yv_aUcnL=
F+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Is there any reason I can't cherry-pick the similar commit in master?</pr=
e>
    </blockquote>
    <p>No,&nbsp; but if cherry-pick from master,&nbsp; you need to cherry=
 pick two
      commit:</p>
    <p>[1]<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembe=
dded.org/openembedded-core/commit/?id=3D4ab0d5c24b32a80432d9cfa6c904027b8=
a6710b5">https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0=
d5c24b32a80432d9cfa6c904027b8a6710b5</a></p>
    <p>[2]<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembe=
dded.org/openembedded-core/commit/?h=3Dmaster-next&amp;id=3Dfdb5798b813c2=
58ff8d922711ebe081c3c36aedf">https://git.openembedded.org/openembedded-co=
re/commit/?h=3Dmaster-next&amp;id=3Dfdb5798b813c258ff8d922711ebe081c3c36a=
edf</a></p>
    <p><br>
    </p>
    <p>[2] is based on [1].&nbsp; I noticed [1] is not on scarthgap,&nbsp=
; so I
      send this patch.&nbsp; <br>
    </p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZzpn4h2-=3DqgJd1yv_aUcnL=
F+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/commit/?id=3D4ab0d5c24b32a80432d9cfa6c904027b8a6710b5">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b32a8=
0432d9cfa6c904027b8a6710b5</a>

Steve

On Tue, Jul 16, 2024 at 2:58=E2=80=AFAM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

When debug build is enabled(-Og is used), pixman-native do_compile
failed with error:
In function =E2=80=98combine_inner=E2=80=99,
    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pixm=
an-0.42.2/pixman/pixman-combine-float.c:655:1:
../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining fai=
led in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_ligh=
t_c=E2=80=99: function not considered for inlining
  370 |     combine_ ## name ## _c (float sa, float s, float da, float d)

Refer [1], always_inline is not suggested to use with indirect function
call, replace always_inline with __inline__ to fix the issue

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzil=
la/show_bug.cgi?id=3D107931">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D107931</a>

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
 .../xorg-lib/pixman_0.42.2.bb                 |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-com=
bine-float.c-fix-inlining-failed-in-call-t.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-li=
b/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
new file mode 100644
index 0000000000..5c79754e50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-f=
ix-inlining-failed-in-call-t.patch
@@ -0,0 +1,56 @@
+From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
+ always_inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirec=
t
+calls. so replace force_inline with inline to fix error:
+In function =E2=80=98combine_inner=E2=80=99,
+    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679">https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D115679</a>
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html">h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html</a=
>]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
+index f5145bc..f65eb5f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float=
 da)
+ }
+
+ #define MAKE_PD_COMBINERS(name, a, b)                                 \
+-    static float force_inline                                         \
++    static float inline                                               \
+     pd_combine_ ## name (float sa, float s, float da, float d)         =
       \
+     {                                                                 \
+       const float fa =3D get_factor (a, sa, da);                       =
 \
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,         ONE_MINUS=
_DA_OVER_SA,           ONE_MINUS_SA_OVER_DA)
+  */
+
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name)                            \
+-    static force_inline float                                         \
++    static inline float                                               \
+     combine_ ## name ## _a (float sa, float s, float da, float d)     \
+     {                                                                 \
+       return da + sa - da * sa;                                       \
+     }                                                                 \
+                                                                       \
+-    static force_inline float                                         \
++    static inline float                                               \
+     combine_ ## name ## _c (float sa, float s, float da, float d)     \
+     {                                                                 \
+       float f =3D (1 - sa) * d + (1 - da) * s;                         =
 \
+--
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 23ae0cbb27..3c55c1705a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,6 +9,7 @@ DEPENDS =3D &quot;zlib&quot;

 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.cairo=
graphics.org/releases/${BP}.tar.gz\file://0001-ARM-qemu-related-workaroun=
ds-in-cpu-features-detecti.patch\+file://0001-pixman-combine-float.c-fix-=
inlining-failed-in-call-t.patch\">&quot;https://www.cairographics.org/rel=
eases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
+           file://0001-pixman-combine-float.c-fix-inlining-failed-in-cal=
l-t.patch \
            &quot;</a>
 SRC_URI[sha256sum] =3D &quot;ea1480efada2fd948bc75366f7c349e1c96d3297d09=
a3fe62626e38e234a625e&quot;

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202099): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202099">https:/=
/lists.openembedded.org/g/openembedded-core/message/202099</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107249150/3620601">https://lists.openembedded.org/mt=
/107249150/3620601</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------d4xrLyenNdtEBxeVF75yscU1--

