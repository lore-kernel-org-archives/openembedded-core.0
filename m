Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72033C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:22:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25637.1723004528089552372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8949aa9b73=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4773U2sl027235
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 21:22:07 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv81jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:22:07 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4774HVxM027495
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 21:22:07 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv81jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 21:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwk1RBf9zN7WobmaScpxPHdjPJX1k/RRb6ftzqymGbBAH6Lr6RrF4QPCdTr2Oz8t9ok4FbbcwM8BeQvTHH7vmdf8F6yx8ggikUxqFyupPXzGuWn1D9NYjxnN5PNTwPAAkLHHWDIaoMQNTfQfu2BUpitegXvqDjZLDqTZjav4PUXojdKczySHb1itNg8eRFA8h2ufTSeSHd0Pd8CskAXrJ5DUY0F9qLkeICrs13J9b9xLTM0DnueQTtDLO+s2micUD+JmoN/eyai+boe2q5LlfBhswW5GhIdEhfJBtOn3oIyLLQiGMNpDBiI1Jem8j9GuZi4Fh9L/R375Hbjp7xIgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGQBxK7glOHqDL28hI9Jp+CrsJXPcj0o2aMmwDtIRxQ=;
 b=IR+PRRf7q2Ad1hnDcFdDB91zX2e3BIteETq9sP4Q8z/nbfAbYykuWG1Fkuc0360YEGISxSGbSLzqb5xrhckeuu54AhQRItT5Dtf0OvMj1qg+XgKLvSNvOFmDkvoMELmxMMXIh9CO2KA8dHPAQDXM0/yMgQz1MS2zMI1oxphPyiCeXCtpj9r5L+BGQFvhq3t9A3IGE3pfqSz7MqN/eD3uRzqd47JglnJmO5AdGZmKGntnke0O39e6756XheyOeZIwBnItBoO8wFeEkDpAZVThKUVEFe1FozIyDo+xoE+g8ouqpnoopQ6LYAF56CrB1dK0FeJFmil47y5AjUCxl7cLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 04:22:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 04:22:03 +0000
Content-Type: multipart/alternative;
 boundary="------------WGYK5INhmJXnO1Ypo0ke8bKf"
Message-ID: <3cf9278f-bed2-aa2a-cee0-7d9684e94b51@windriver.com>
Date: Wed, 7 Aug 2024 12:21:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] kexec-tools: avoid kernel warning
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240807033404.1513069-1-Qi.Chen@windriver.com>
 <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:4::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 204c3dac-c5f7-44fd-cea5-08dcb6987d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emFrSGh0VURoajZLa0Y0bkhPNG1UK3JxKzRZODc5NGZRWVZTZUpnOWx4bDlr?=
 =?utf-8?B?L1hsbTQwY2t2Zyt4MGRqbk9paitlTk0zbXBRbmo3UjFyN2VhUnlobHk2U1Y4?=
 =?utf-8?B?b01BQ1pUd0pOeEIzVEtwOTlpWm12NlEwKzNDYzlTY1pQc2dSVjcvbmd1SHZC?=
 =?utf-8?B?WEtwYldMZ3B2NlZoSENGWVZCa2t5TW5LQksxdVNJbnAvcyszek93cWFiMysy?=
 =?utf-8?B?UEJ2enVOc2t2VjVzRDJVanNlY2QzNXZ0T0FBRWVRVUt5MFVQR0JEOG1Edzhn?=
 =?utf-8?B?RnFyU3RWYzRTSW9FNXNVWUJ1VTFOQXo1NmJsUVlEd3RkTUxZUml6RW90akVT?=
 =?utf-8?B?WlJZNTlYSDIzZk1iTXBYYTFYclU4WktCaTJmSDZhc3krUmdrMUhDR1RGaDdK?=
 =?utf-8?B?bzUxOFVNdXJhbm5zQTFiL2NSZUVxVkhhZG4wa2h0a3JPZ1JUMmdXeGY3d3Ju?=
 =?utf-8?B?NGUwWWt0M0V1UVdtSjhwT1hrdkROei9TenNCNndEK2tSencwK2owemxINldO?=
 =?utf-8?B?MkFsMDd6Y1BQMjFYVmZGNHNOdmVGU1dwWnlPT0pmSmsyaTlWbHNmL0Y2b1ND?=
 =?utf-8?B?Rlc4c28xUzZSbDBYUHgwbm9VcDl2bndHZkhOcDZvR1o4Z2tOU2dYODZFTjNC?=
 =?utf-8?B?MnRkcWFKemVoQmlwRlVTaS9yeE1MZERZSjdVc1lsbjVxY25FRFpVNUY3azZy?=
 =?utf-8?B?OFNYdE9PbUhqeWNaZEcza3EzWWxXOEJaYytWcXFLd3BLWk4zYlFIajRDdXh1?=
 =?utf-8?B?dmRWU1d5TlduanIzWVE2eUwwWG96T2ZVRTJsWmlrdU56UXJTY1J5YnAzTVhO?=
 =?utf-8?B?ekJzWEdaTFNPTndRdHVjaTYvZkJSYy9mUVd2QjVxeXQvbHJkR2xKU20yeUh1?=
 =?utf-8?B?YW90Zit5eGlyT3VHeEUvZDFKeDczcE1QcVBxMEloTWR0dVNRbWtPMVJXaDZr?=
 =?utf-8?B?Y1poT0h2YWdESlo3ako5OU5zcFdocXduTGxrY1A4dXdvZlp5L0Y2V1BsUG5I?=
 =?utf-8?B?ZGJrZ28vOEpiSUJ5eEFTUUp0VDd2VzVRZ0dwcklFY1R2a0lrMkZ5SHRURjJh?=
 =?utf-8?B?VzkrZHIvVTFycHpSOHBMQ3g3a2VwaTFxUnlLeXFBM0NETmZQZnRadjZqT0dP?=
 =?utf-8?B?SWZQMDNwOUlqY1ZpWEdBV29KT1ZoNUNjR1lWMWtjdEZUSEIxbWJTMmVDZStF?=
 =?utf-8?B?aVg2TEZPWmdhdHBFWVo0cnJUZXhoeCtJTUx0WkxPdFcxaGIyeGwxc1hGaFBi?=
 =?utf-8?B?Z21EMDF1N2RWQWo1OWYwTURnRzkzTGRZRG9vbGZGTUF3c0FLbWVFeC9jWUZR?=
 =?utf-8?B?dFgra08xYjdZTFRSWmV4YVVCRlRhd2lWNzJmcmIrYTVuYURNb2dSY1pXNHFm?=
 =?utf-8?B?dENCZlB4MERHMlgxMTEzVnZ0Nk4wZzY1S3U5Tzlvb2VtVFdhbEpjdExZeUxN?=
 =?utf-8?B?bHd4UFlBaGpkREFtU3VaWEg2ak40MGxhNVRYSGFkMlpVUTRVaHJtWjlOMXRv?=
 =?utf-8?B?T1Q5Q2tiS3Ria2xsZjF2K1RDYkJ0WWoxOEZiaDIwaFFJcm4vNFA3RWlraGRm?=
 =?utf-8?B?UG1JZVBWTERXdE1mTE16WWFpa1haU1ZHYURLam45TjhwbGdybXVXcEhKTjN2?=
 =?utf-8?B?Wlg2NWJSb0tLc08wZytsTjNpRkFzRGNrRGIzRHY4OHI5WnJKODlkSW95RWtv?=
 =?utf-8?B?T3RPREFLSlhzOEp4YTEycWowU1ZUYmVUSE9PUmo1UlNIYlJscEtWQXNsa3Nw?=
 =?utf-8?Q?kx6u+lw0CFaD6g0xtE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVdCNDlNZjBsTE0vdFZRS0orUGFTZnU4ZXlqUmtjVWhhaldFdlkzTFViM1Fn?=
 =?utf-8?B?MHJYSVFaNVRzWW9QTkdNQSs3NUx1RFI5VFZwbHloV3k1UmVEWkhncFZJaWYr?=
 =?utf-8?B?TlJmZE83aDlVb3hPVndzUXBUdllUQWd6MUdBUVkxRHd4T1U4WkFEUEpzZDd2?=
 =?utf-8?B?djFGWUtPY3RKcjlRMTF0VldodHNKUnpRaDRuOXFIaDFQeVRwQzc0RG40SnZU?=
 =?utf-8?B?eklERU4yMjVhNzQ2YlVuc0tFTjA5SVdhV3NNTUY5Wis3d3JUWVBEWnoxdUdk?=
 =?utf-8?B?SHY3aVY3Z1Vta0UwWm4xUFhEZGtscjJKcVBBRjd5MXI1MEIvYit6c3NIbFJR?=
 =?utf-8?B?MUw0dVpEaDRYeDZ3NE9pN2VDbThEMktUWWVTR2tVSkpwTkE5WEJOQ0kwdDk2?=
 =?utf-8?B?Z0p4eXpUNWlhU0VSQnlSQXRJTWMwRmxvcm03V2Q3amZHakxlZU1ocUtFY2lI?=
 =?utf-8?B?b0ZxVnk2dEZjRmp0Tzk2WEtiQ3h6KzR0ajgvZnMrOWRpWnY3d0IwRklQeGxC?=
 =?utf-8?B?NCtvYUE1NTJSZll0T01zVkhGTldxWEZTUWFENXB5a2c1NXFrU05wOUdVTWg1?=
 =?utf-8?B?cDlNdWtvdkZRc2JXMnJJYlQ3ZE5tTnlOUEVqcFdudUtNTTNOdHd5Mk81SGtQ?=
 =?utf-8?B?aG04K3lPOUZPTWRrNUdxenVLQ0c0SzVZMEthTitseXdlMkt5TjVLNTE3MHZh?=
 =?utf-8?B?VXcrMENBV01Dd2dBWTlIWVJNMXhwUHlLU0RzL1NFYjk5R1lTK2tOTm1vRjVD?=
 =?utf-8?B?bkw3VXRKelJ1QmxkbDJDcWJGTFJXdUE3WDJoc2oxR3pSQlA3bFpxR3plUUFV?=
 =?utf-8?B?Y1gzUW1kK1dyamY0ZHpJN2hsUTdFZXgwNnFiVzVRZktzZkRxbjdTa0cxMmRL?=
 =?utf-8?B?NHRwVXBBa1F6TVBpb0xzNEFQRFpKa3N4OHhpL0NVWHNLaW9wbVFWYmdRYjlD?=
 =?utf-8?B?T2Y1a29UajBvY2tOamdZeHRHeTJGZVNsb2xpemJvVDVGQy8va1p5L3BUSWJ2?=
 =?utf-8?B?U2x5TStqTDF2STRaVEpleWpLeFdrZ3lHZ21QRnpJMDRseW1vc1A2QXZIVStj?=
 =?utf-8?B?YkJpVHFwbWVzV21tMVNFMW04WCtTZkd1ckZFaEozcHhKWEk4dFY4aklGaFFY?=
 =?utf-8?B?RkF5L0FuRGM4b0wrVDNZYVI5ZkdZamY1NHpSeGZFR2xXMHJtK3k2bnU4U0pP?=
 =?utf-8?B?LzdZbmxlaTFwdEh5bU92OTk0aUM2WmJvUnVvTWxVR3c5VUlrTlEvNWJWblEx?=
 =?utf-8?B?U212UFF6ZDlRYnNmRTV6NiswTHAwMUNObjA2STBneW9mZDFQMzZZMkp4aHIz?=
 =?utf-8?B?LzBuTVBNMXFTNE1nSFVWM08xcFdMQ0ZNTFU5a3gyMllSREZnWkpZeWYweVln?=
 =?utf-8?B?WDhOc25kRTMycDdEOE53MDNaQSt4MlhsNFBubmtvSGhiK2EyQVZNOEk4bVVi?=
 =?utf-8?B?Z1kxYTBtTlRLaDMwWWlhaTd4emlVT2Y0a1QyN0FTNlhWa3VaUHo1WTN2cTBR?=
 =?utf-8?B?U2tSakdhMXBLVDd6OThkUFQyTk9maUJqeHc0dmFVdzBQQWQ5ZmNqV1RuSHpv?=
 =?utf-8?B?TjBSVTR1RFcrU0MrM3N2NFYxQVhHekhScjB5WFlzUWNIcFZSZ2w2Szd3Zzc0?=
 =?utf-8?B?M1EweWNwYWxnZzJWcmluYkhyTExmUjdhKzNvVEVjRHJkRS8rcDkzek9FZEdS?=
 =?utf-8?B?V1NiRXlkTlRmK0FmTEQ2QWgvTHlKWE8ydHRQSmc1QktqaUxRU25TWDZsTDUz?=
 =?utf-8?B?MXNoSjE0S1orWG04eSt4UzQ3K2EwcGhqMmx5REowT3Z4V2k1enNRdlFqNnBG?=
 =?utf-8?B?bExzdWlyWTM5TnNxNkpSNjdIWm4vYUZCS3NURHFQVFpqSmpGYW13bmNKVi9V?=
 =?utf-8?B?RkZrbElHdGdodWVoejRCYjV2QStoNHdlNzA0R01iUURKbEFTR0U0d3B3OHFJ?=
 =?utf-8?B?SS9ncjkwNWdvL0xtN1p3YUVWcVBvQ28yUTN0T1A1Vk5MSmpjQUFDNTVwNVV3?=
 =?utf-8?B?d0JjciswWWVlZ2U4cFhDc2NJN3hxN3c3R2VkSjFqbTRXNDZGWGI1STFMNVNv?=
 =?utf-8?B?Z0p5aHY5NklncW9uTVdpb1FZUUlyWlJVelhTRVlMeXN4VWtvbkpZeG5NM2lE?=
 =?utf-8?Q?NMcPiYXrQhMUIRUslHTGmJTb8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204c3dac-c5f7-44fd-cea5-08dcb6987d74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 04:22:03.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weKjDd7iiXXX1vofzat0In7qq7YHo3z7JU2GvZMOuwUHT1xEebHSxwzEIt+JklGFHj2YHCaARCntfTaUSbXLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
X-Proofpoint-ORIG-GUID: 0pHEjUqgodyhdVSvneJGTI9PfByjxFBL
X-Proofpoint-GUID: lTpU6hlIIaTuEIHlZ0NraTShMnFM0owb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_01,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203054

--------------WGYK5INhmJXnO1Ypo0ke8bKf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4773U2sl027235

On 8/7/24 12:17, Alexander Kanavin wrote:
> What is oe specific in this patch and why that makes it inappropriate=20
> for upstream? Please do explain.
>
> I think it should be sent upstream.
>
> Alex

I've explained in the patch right above the Upstream-Status line.


>
> On Wed 7. Aug 2024 at 6.34, Chen Qi via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7b=
Yr8CTxzNf-nvWp306Q$>=20
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com>
>
>     Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' wi=
ll
>     give out the following warning:
>
>     =C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
>     MFD_NOEXEC_SEAL set
>
>     Add MFD_NOEXEC_SEAL explicitly to avoid such warning.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     ---
>     =C2=A0...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36
>     +++++++++++++++++++
>     =C2=A0.../kexec/kexec-tools_2.0.28.bb
>     <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveY=
dw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWM=
p7bYr8CTxzNf-nqfERVjA$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 37 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_S=
EAL-flag-explicitly.patch
>
>     diff --git
>     a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC=
_SEAL-flag-explicitly.patch
>     b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC=
_SEAL-flag-explicitly.patch
>     new file mode 100644
>     index 0000000000..3b11555a1b
>     --- /dev/null
>     +++
>     b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC=
_SEAL-flag-explicitly.patch
>     @@ -0,0 +1,36 @@
>     +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com>
>     +Date: Tue, 6 Aug 2024 19:41:30 -0700
>     +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
>     +
>     +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
>     +
>     +=C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
>     MFD_NOEXEC_SEAL set
>     +
>     +As the above two flags are only available in newer kernels, ideall=
y
>     +we need to do some fallback. But we know for sure that OE
>     scarthgap/master
>     +is using >6.6 kernel, so we don't need to do such fallback.
>     +
>     +Upstream-Status: Inappropriate [OE Specific]
>     +
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     +---
>     + kexec/kexec.c | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/kexec/kexec.c b/kexec/kexec.c
>     +index 08edfca..c5f52d4 100644
>     +--- a/kexec/kexec.c
>     ++++ b/kexec/kexec.c
>     +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char
>     *kernel_buf, size_t size)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, count;
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create("kernel", MFD_ALLOW_SEAL=
ING);
>     ++=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create("kernel", MFD_ALLOW_SEAL=
ING |
>     MFD_NOEXEC_SEAL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;
>     +
>     +--
>     +2.25.1
>     +
>     diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>     <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveY=
dw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWM=
p7bYr8CTxzNf-nqfERVjA$>
>     b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>     <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveY=
dw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWM=
p7bYr8CTxzNf-nqfERVjA$>
>     index f0a484f884..830d9ce585 100644
>     --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>     <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveY=
dw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWM=
p7bYr8CTxzNf-nqfERVjA$>
>     +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>     <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveY=
dw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWM=
p7bYr8CTxzNf-nqfERVjA$>
>     @@ -19,6 +19,7 @@ SRC_URI =3D
>     "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar=
.gz
>     file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.pa=
tch
>     \
>     file://Fix-building-on-x86_64-with-binutils-2.41.patch \
>     file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
>     + file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0SRC_URI[sha256sum] =3D
>     "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#203052):
>     https://lists.openembedded.org/g/openembedded-core/message/203052
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRH=
EUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/107763946/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1077=
63946/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxB=
m02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTr=
qYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$>
>     [alex.kanavin@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------WGYK5INhmJXnO1Ypo0ke8bKf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/7/24 12:17, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com">
      
      <div dir="auto">What is oe specific in this patch and why that
        makes it inappropriate for upstream? Please do explain.&nbsp;</div>
      <div dir="auto"><br>
      </div>
      <div dir="auto">I think it should be sent upstream.</div>
      <div dir="auto"><br>
      </div>
      <div dir="auto">Alex</div>
    </blockquote>
    <p>I've explained in the patch right above the Upstream-Status line.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed 7. Aug 2024 at 6.34,
            Chen Qi via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nvWp306Q$" moz-do-not-send="true">lists.openembedded.org</a>
            &lt;Qi.Chen=<a href="mailto:windriver.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From:
            Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
            <br>
            Running command 'kexec -p /path/to/crash-kernel
            --reuse-cmdline' will<br>
            give out the following warning:<br>
            <br>
            &nbsp; kexec[970]: memfd_create() called without MFD_EXEC or
            MFD_NOEXEC_SEAL set<br>
            <br>
            Add MFD_NOEXEC_SEAL explicitly to avoid such warning.<br>
            <br>
            Signed-off-by: Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36
            +++++++++++++++++++<br>
            &nbsp;.../kexec/<a href="https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel="noreferrer" target="_blank" moz-do-not-send="true">kexec-tools_2.0.28.bb</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
            &nbsp;2 files changed, 37 insertions(+)<br>
            &nbsp;create mode 100644
meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch<br>
            <br>
            diff --git
a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch<br>
            new file mode 100644<br>
            index 0000000000..3b11555a1b<br>
            --- /dev/null<br>
            +++
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch<br>
            @@ -0,0 +1,36 @@<br>
            +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17
            00:00:00 2001<br>
            +From: Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Tue, 6 Aug 2024 19:41:30 -0700<br>
            +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag
            explicitly<br>
            +<br>
            +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:<br>
            +<br>
            +&nbsp; kexec[970]: memfd_create() called without MFD_EXEC or
            MFD_NOEXEC_SEAL set<br>
            +<br>
            +As the above two flags are only available in newer kernels,
            ideally<br>
            +we need to do some fallback. But we know for sure that OE
            scarthgap/master<br>
            +is using &gt;6.6 kernel, so we don't need to do such
            fallback.<br>
            +<br>
            +Upstream-Status: Inappropriate [OE Specific]<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + kexec/kexec.c | 2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/kexec/kexec.c b/kexec/kexec.c<br>
            +index 08edfca..c5f52d4 100644<br>
            +--- a/kexec/kexec.c<br>
            ++++ b/kexec/kexec.c<br>
            +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char
            *kernel_buf, size_t size)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;int fd, count;<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; fd = memfd_create(&quot;kernel&quot;, MFD_ALLOW_SEALING);<br>
            ++&nbsp; &nbsp; &nbsp; fd = memfd_create(&quot;kernel&quot;, MFD_ALLOW_SEALING |
            MFD_NOEXEC_SEAL);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;if (fd == -1)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return fd;<br>
            + <br>
            +-- <br>
            +2.25.1<br>
            +<br>
            diff --git a/meta/recipes-kernel/kexec/<a href="https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel="noreferrer" target="_blank" moz-do-not-send="true">kexec-tools_2.0.28.bb</a>
            b/meta/recipes-kernel/kexec/<a href="https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel="noreferrer" target="_blank" moz-do-not-send="true">kexec-tools_2.0.28.bb</a><br>
            index f0a484f884..830d9ce585 100644<br>
            --- a/meta/recipes-kernel/kexec/<a href="https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel="noreferrer" target="_blank" moz-do-not-send="true">kexec-tools_2.0.28.bb</a><br>
            +++ b/meta/recipes-kernel/kexec/<a href="https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel="noreferrer" target="_blank" moz-do-not-send="true">kexec-tools_2.0.28.bb</a><br>
            @@ -19,6 +19,7 @@ SRC_URI =
            &quot;${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class="moz-txt-link-freetext" href="file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch">file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class="moz-txt-link-freetext" href="file://Fix-building-on-x86_64-with-binutils-2.41.patch">file://Fix-building-on-x86_64-with-binutils-2.41.patch</a> \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class="moz-txt-link-freetext" href="file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch">file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class="moz-txt-link-freetext" href="file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch">file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
            <br>
            &nbsp;SRC_URI[sha256sum] =
            &quot;f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29&quot;<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#203052): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/message/203052</a><br>
            Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/107763946/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/mt/107763946/1686489</a><br>
            Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href="mailto:alex.kanavin@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">alex.kanavin@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------WGYK5INhmJXnO1Ypo0ke8bKf--

