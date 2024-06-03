Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B703DC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:53:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.76643.1717394002092441401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688488c23c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453502Un005391
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 05:53:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9g73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 05:53:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4535rKBv013213
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 05:53:20 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9g71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:53:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWYa+9XCruVyCxGwXqXQrDwggydfFRSVgh/OgITKQFunQEccH1XN2k36J/nrwt5hTj/M9qWIiZ6ZmrqrraQWweMi9fxyDj4G3cRby649ut6IfsLnCf3RwG3lsI9O4iuAaPhXJTD6gO+S+JjfNFxz+79/M6Qy4PUy8VVXvreCzYRHfYePMQKVug2WYWJk2ZohpulQR7TsC5oSFDpaS1oeBIvtdDokzXlvMGPGG15DAa1Aa5cd5dRuGGWDO4Q0B+tthcI+FKDuo82XpSqobwHPhxUpVMp9a+S0XColjfYRU/OLx7fchr36ts8r+f9YLaMughBlriG68I/xOQKNIT5S+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TFKhtqnrTIZUVRYQQhpV0wmv6sg6E9dvXNk/Xd5pKA=;
 b=FuIanzEP9kBYWS2UHdmJprISL5brHHyt8bYscHOgb01/5hdAT+l8JKREo91ctWCsBb5X/yw7e0hp+QodQ8L1o7ljDplS7swvZ+rv4GYmfy7KS98PwIw34Q/uNV4j9Dy409SWl/kUDEijTwwzXKb+ydKHFqVuriJqrr58q6MGV/NMBwvi6SEoHFN/aHtSWRK7pP20lOhi6UsiNALdlOdbScNAYpOWQwh7c6v2RFRFppEeU3O123ITYv4GIUvAGInnEjiZzyaXajisr5AJ5SnL3bHg/Pc3qA8jGveUJGdjSomKrcn7b2mAbNaUfanXEHtuoCUbOrePgHl6pif8a2jZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 05:53:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 05:53:18 +0000
Content-Type: multipart/alternative;
 boundary="------------Owcj0aU3vCSpEiTQ6uGq4Bmo"
Message-ID: <9b58065e-6325-4e17-84cb-fdc249990d6f@windriver.com>
Date: Mon, 3 Jun 2024 13:53:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][scarthgap][PATCH] ptest-runner: Bump to 2.4.4
 (95f528c)
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org, anibal@limonsoftware.com
References: <17CEFBF983FDDAAE.21609@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17CEFBF983FDDAAE.21609@lists.openembedded.org>
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 5986d9c8-dbaf-4d61-c498-08dc839177e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2lXMUphL1h4RWV1NWQxZTJaZG9mSlFqWnZzRFpJVDVqSGxZVjN4Tk9iYy9m?=
 =?utf-8?B?bktwenpEL0Z5ODhMaWVaZE9EOFRMZHQvdlh1UUVERmVzSHR6RHovM2xONlNM?=
 =?utf-8?B?ZW9xYy95clZDemwwYkc2TVo0YTBBQUxxZWkyVjMrdnMxbjhpa1Q0bGMyWVpz?=
 =?utf-8?B?MGpiOHFBSzFkS2FJdmpUTGtoVjBob1p6cGF3Yml4bCtQVWJOWDc0eUtKK2Nq?=
 =?utf-8?B?SUQ1bmhSWk92b3RxWE4zMC94dmdKbHZnemJXMUhsSHlYeXY2WFA2UTNCNGd0?=
 =?utf-8?B?TklpZjZEK01nV0ZQb0xZempaRmszbHV4THNTODN2RS8rZWVSUGpYUjBrVkg1?=
 =?utf-8?B?MkdlcVIrSE01U214UzRXVlZxMWcvMjFXWUU1Q2kwY0tMcE5RejhmVVNDTi9W?=
 =?utf-8?B?SDI4V01neDhOTmg4a1IxUTQ4R1dkOXJOd3RQVk5EQzZwWUVOc09Zcmh3THN5?=
 =?utf-8?B?UXpveXVoRmtYbWxib1BZaWxWTnhYeTVJSW9IeEVlOHFKTUNqcVBpRmREMkpN?=
 =?utf-8?B?ZUY3bzVvOXovTlN5N01aTzlBZ1RoNklpa3hFRWdQTmZjUVZIMUJOb0hnekl1?=
 =?utf-8?B?dkt4TEY0dG9JaGY5dW8vb0hjMVBJL2kxMTIvcDhDOEc5RVQyTGM4Y0pCejkw?=
 =?utf-8?B?eUpQMWpsdnJGSzB3bm1haStwd3JpVzhINnZERWVnTFByQkoxbHJGVnVlL08v?=
 =?utf-8?B?cjdrRGxpWXNoRnloaGhWNlo3T1VrbVltRzlWMEEyMnpvZm5RcldJSlh3U2Rr?=
 =?utf-8?B?VVpkcGFaZWJXZ3gveDV0SXBhNStJOW1iQ3JHK0JoMWNwTFBxc1RMcUJ1cXFC?=
 =?utf-8?B?L0FNd2hZUVVTTTJZMjlSUzRySHpEV1pLVkhKZk8zdFU4Ty9ud0tVcmhDRTBP?=
 =?utf-8?B?Q2ZWZEhjVWR1ZmhFTFdHaHd0MS9WSEdXYVhEMGx0eXY2bERjVk9wUTBTdllT?=
 =?utf-8?B?b0dCUy9zUGNTamU5d0xpcmsxM1QvK1JOeUV2L3F2dkZjMEFoaHR0djZBd3g2?=
 =?utf-8?B?NFVNb3hmNXhaMXNTT0JZOURyRkZ3dGtEaXEreldKZ2FnK0RtbWczVkxndE54?=
 =?utf-8?B?MUhpZnBRV0F5dzZkT0U3V3FYZTBQMVYzemdRaGNhc2hOaU5hVE9nekJ6Q3pW?=
 =?utf-8?B?Q1owMktDVGFsMWdzZTI4M2M5aEF5KzI2S0p1a3lMa29nMVFTaDRiQjBPM0Fv?=
 =?utf-8?B?R0c5dHJKYlJmbEljS0NjNEdGWDNpRlp3ZjdOdjdQOXpKNG5oa2lKK1JUN3BP?=
 =?utf-8?B?YnVyaXg0R2t3VnNNWFpwK01nS1Q3U1VnbnlsTU1qQjMvc1RBa2pFNFVwYWtu?=
 =?utf-8?B?Qm8yQURLU0VCeldiMDZzRFJqekhWMWJXd2NrM0g2RDYwckJ1TkZueUxvN0Vn?=
 =?utf-8?B?Z3Y5d1ZJS21OV1NlYlNPcmdQM3hCQTdHelJBOTlFOTYrdE9EajIxbXFpek1i?=
 =?utf-8?B?MTdVVlhRWTdDU2t3bEFtbllBUmp2WGdjd1I2MUVsTm8vMTRKVlNhTlNJRTlN?=
 =?utf-8?B?Q1c4aWE3bXVtaUJWbGtSaW5hMmdHdDFzVWhnOXBpTjRacmJLditOdThvbThX?=
 =?utf-8?B?ZWZpOWpQbitNVVdQcHM4dnhTT2xiN1IyU0JtWU05QWJlR3FqQ3VnQndUOVh1?=
 =?utf-8?Q?3tCtmLQt+2eY26yOZIWRZazk0Oqd+kDuG3P57kOrIoFA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0Q3dkt4SFFGaU1mYjZSOFlvVTMrUmcyV2daOEloSFQzTGtVRFk3ZFV0NTU2?=
 =?utf-8?B?cHdRRmNhVWVRVGNwZ3pDdFJkZGIxSWl2TEtjVmhaRjZ6QnZlU2VqMHE2MlF1?=
 =?utf-8?B?a0JPazlwdTlEWTZMTU5HK2N3M1drUkplNDRGYVhnSWFMYUdxdEY0UlpVdXlv?=
 =?utf-8?B?RFFzSm9YRFFueGg3ZWF0ZTc0eWhuSDBxZFVYb3Vwb1k2ck9ocnVCd1hKV2py?=
 =?utf-8?B?ZkdBSVNrTmhHRDZJVHdIdFhZYUxHYnZ1VFZlR0JsZXpUaE4wWk0zUi9rbXQ1?=
 =?utf-8?B?Z3dTa2I2aG1NelVlaDgwQ0hJUm94cHVTOThWY2k2bnJ4aHpKU1I3MDJwWlI3?=
 =?utf-8?B?dXZIdklzVUtqeHhabGNzcVBhK1RJd3lTMG9vTE1Ic0VRUWp4SzBlMFdQYThE?=
 =?utf-8?B?WnNubnMxdnlrQlB6NG92QUdSTitORlNmcEJaa3VOOXhBUnhvS05iVDFtczds?=
 =?utf-8?B?ZHF5Wm1qSThRSDJLZktucC9uNE9ybjd6M1Z1S3pVUlVUNlR4dEJsOGFIWDF6?=
 =?utf-8?B?a3YrdVd5aFdiNW9IeGt6elFPdEJ5My9ZSDNSWU9PYlpPT3V6ZjE2alhTVERz?=
 =?utf-8?B?MTFaMVh1bEJBa1NnN1dmQ3RMajlDbmpRaHJwQkN2MHdoVUxsb1k4QUtxTkpM?=
 =?utf-8?B?T1F1dldaYnZwbXB4Zm96YkZKcU9lWWZDbVNCOXBPODR0SGY0bGM5VXBhNmlI?=
 =?utf-8?B?NVJVRXN1eXhEMVRPNEFMc3pUbGtWWFdDVWtuTWRnQUZib3VGTGNoYTQ3a0FR?=
 =?utf-8?B?aU54Wk41KzdRdkpjdXNkeWZEdWQ1TisyNnptQkFXQlNJMkpDd2NOS0lsN1RT?=
 =?utf-8?B?b0l4ZThxWG96V2t2bUNXeU16enNybkhLZVRXN01IcHBQWUxZMjgzQlJHN1pF?=
 =?utf-8?B?M3JvVDc4UG1XNkJKL2ZoRDd6NUl1WUVIYXRmRGtqNklDVTFEZjMxNU45ZUlx?=
 =?utf-8?B?djVVeVREendjSFRxRm1zaXJBVWlvSmM2Z1I1UnRuL2pCWGNHdnhJWkNZZGsz?=
 =?utf-8?B?amZHNlZOSE9mQlF3TWJFT2h0dHpJMEt6elZZZFpQQ0NkYVJoNGhPUkpoVWh1?=
 =?utf-8?B?SzRZZUdSK2h1VUwzT0ZOOGdrZklabnhNcFBvYXlEaVh4eXd3YWYzNERrcm1u?=
 =?utf-8?B?QnBReGcxZWVFSjZOeC9sZ044REJlRzVENDlxcGZhNWRSRGJMTkVDODdVOVVi?=
 =?utf-8?B?Z3hHY1BZN3VaWWdLeUdNdzczdmI2blBGWCs5bzlWVmhSR2J1WkFVMW9wMDNP?=
 =?utf-8?B?ZGxJcm1BZkJ0WCt5WUk5TGU1LzJVT2puc24zTlFsNDUrT2tRR2xoRXBBcWhM?=
 =?utf-8?B?UitIM2gxQzZzencyRVlSVUFqeHlqNUp1bXNqZHNaRjVvK3hlZFMvT2tTMWMx?=
 =?utf-8?B?RGcwWUQ5NWxUZ3hTSXordjdxMENETlZldmFHbDVEaDlVd29TOFZSejROQjlv?=
 =?utf-8?B?WEpDeVA0OUFOOHJGWEhHTWNta3BtWG5wR09VSlEzMlV0Qi9Wekp5YThwVHox?=
 =?utf-8?B?WWFNOVRsK3ZrV29wejd4bERkeUNoSFFNNVBvUXlaSitFbEVZRkY3WEZzZHJZ?=
 =?utf-8?B?V2k5aGxHa0VvUXJCdUNxckFTMi9Id1REeEd5OW1mQ0ZramYyZ0Z2TDRTV2hk?=
 =?utf-8?B?VzF5NmhzUHBUckVkUUo3QmhKZ3JaYXZURi9iVWl6a2VOK043bTdjY2QxV1Vv?=
 =?utf-8?B?S05EdmhQUUtwUmgybk9TU3ZiVkVZRTZmZE9GK05HN1JWOW14WmNxRGxnQVph?=
 =?utf-8?B?VGVtUVB6SzlDaWhxNXJYdk8vNDUxTHBpQXlJL0k2WVlsR3YwSzNPOGZhK0Rq?=
 =?utf-8?B?d1N1TGkzdURGbHQ5Ky90SDlHdktoTWpMaWhPMitVZFZQR2hKMEcvUlNiMkc0?=
 =?utf-8?B?UHlsRHZzN0ZoNHFseEExSUd1ZHhpVWxka1REWkFIQk9UT2xEaU5Ea3pCL1lV?=
 =?utf-8?B?a2JRZitnMURDdURhcldmWmcybHA0K2RobDJmbXg4Ulh6eS9rRWpUUWNiOXM2?=
 =?utf-8?B?OEd0cSs3YXFVakpwZXpKSG82ZXNpSk5WUXFHWGpoWTN3alBISUcvYnBMU2k0?=
 =?utf-8?B?c1VSZmxpdDdDK0VCOVExbkI1ODRERzdxdnFKZFZCYjhiVnl4Y0RJcHNzQlN5?=
 =?utf-8?B?QlJJcnk3cXUwc1dQK244VGpHQ3lnQUw2ejQ2N3llOElTbUVsWHhEMnJ2a0Y4?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5986d9c8-dbaf-4d61-c498-08dc839177e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 05:53:18.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTQsnWQn4wt9l5ruSrMkVb0IrGvUrGFCDTCPQFe8eqHb4k2L6Uw19ne3ZQZYlUG0G75pvpDcAFlQ1pdbz4wsRXjouT7mukc5usLS970V9QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-ORIG-GUID: EYQnMUY-ccBC1YzmSHB2r69ILzkZq3Tc
X-Proofpoint-GUID: n4KlwVTPV94lXuXenDUbnog_IMleAfS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 05:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200233

--------------Owcj0aU3vCSpEiTQ6uGq4Bmo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping for branch scarthgap

Regards

Changqing

On 5/13/24 15:32, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Changes in 2.4.4:
> 95f528c utils.c: run_ptests improve error handling on ptests iteration
> c48e5fc utils.c: run-ptests improve pseudo-terminal handling
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb} (95%)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> similarity index 95%
> rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> index e6668da01f..2263e07280 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> @@ -7,7 +7,7 @@ HOMEPAGE ="http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>   LICENSE = "GPL-2.0-or-later"
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>   
> -SRCREV = "92c1b97bfdb4a94acc1cabcaf97eef52dc29144c"
> +SRCREV = "95f528cff0bc52903b98c292d4a322fcffa74471"
>   PV .= "+git"
>   
>   SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199225):https://lists.openembedded.org/g/openembedded-core/message/199225
> Mute This Topic:https://lists.openembedded.org/mt/106068298/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------Owcj0aU3vCSpEiTQ6uGq4Bmo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping for branch scarthgap</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/13/24 15:32, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17CEFBF983FDDAAE.21609@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Changes in 2.4.4:
95f528c utils.c: run_ptests improve error handling on ptests iteration
c48e5fc utils.c: run-ptests improve pseudo-terminal handling

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../{ptest-runner_2.4.3.bb =&gt; ptest-runner_2.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb =&gt; ptest-runner_2.4.4.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
index e6668da01f..2263e07280 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/">&quot;http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/&quot;</a>
 LICENSE = &quot;GPL-2.0-or-later&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe">&quot;file://LICENSE;md5=751419260aa954499f7abaabaa882bbe&quot;</a>
 
-SRCREV = &quot;92c1b97bfdb4a94acc1cabcaf97eef52dc29144c&quot;
+SRCREV = &quot;95f528cff0bc52903b98c292d4a322fcffa74471&quot;
 PV .= &quot;+git&quot;
 
 SRC_URI = &quot;git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#199225): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/199225">https://lists.openembedded.org/g/openembedded-core/message/199225</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106068298/3616873">https://lists.openembedded.org/mt/106068298/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Owcj0aU3vCSpEiTQ6uGq4Bmo--

