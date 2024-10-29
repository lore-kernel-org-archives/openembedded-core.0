Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86764D5B865
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 03:23:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11273.1730172186234482856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 20:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=103298b06a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T2e2Ev024356
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 20:23:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42guq3tvma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 20:23:05 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49T3N5Dn022125;
	Mon, 28 Oct 2024 20:23:05 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42guq3tvm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 20:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQhtM76mmmTMDEQEJXfiNYILytC0kZFDM12im7NQrOp5Vo6Ejzhmq3WRJZz5xchnTjfEwxwmaHVkVXgChAvdvpJ9d4BJc5KKOxTfSJ2W9N+OI1s19H2gJ8Js0ywsswUCBEUud410x4ab9Ekzj48lEF8EydY/HTn0o+7slbXC4DXWYY4FiQTS6G0EGwgTqNgtsVpSRfmC8Ai50d4dxVhiia0ZQc9XAyS0fo6+FefJCNLZMzO/fMlPqClKuyZ4xlUynb5g5uw/h+Q3GLqWb9q7bEe4uvYjLgZ0NLvfDTGyBccp7GCoM6HAl+8nlfCP5J7M2x51Fy5YqILttKz10u31bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RgmpzFvG12lCm/w4VeIUsIHYoTemNmWwjVpzNCtKBc=;
 b=PT0wE4F1kPlNjQ/QnMx3utwU32VLQUbEkCc2V/0StUPmoJmjYFNRnW+sIYJnjzspaYfYlW7uftV0F+W3Bl2D1SOwksutVdMNs+Mm8ZV0JW0WT/JpAw8zbNYX3Luq2JLJg+a6+Kj9NhfW3IYkLJssyeWAIY+Y1jL8Nxwiyf/5WB1kAQ3N3tBrvZ4MTd7tv7cw7cVvlpllgQdPELYA4jQTF/8UHwf/M3wLRM3yqo/8JokUS5qBDvrHSQe0jXMaQuGOTfRXSt3+0UCoZ89jBQHdLC0rVpQFXbNvCQsbQIWXrvlZ829MG0jefbdv2Am5hJzDPCQ/E19veVGQd9RbwAsxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 03:23:01 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 03:23:01 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Joshua Watt <jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/6] meta/lib/oe/sbom30.py: correct python list
 comprehension
Thread-Topic: [oe-core][PATCH 1/6] meta/lib/oe/sbom30.py: correct python list
 comprehension
Thread-Index: AQHbKXIBOGzTI1IbBEClQB+IbzXlP7KdEK9I
Date: Tue, 29 Oct 2024 03:23:01 +0000
Message-ID: 
 <PH7PR11MB76086545D4295785DEACE9AC944B2@PH7PR11MB7608.namprd11.prod.outlook.com>
References: <20241026032519.1968518-1-hongxu.jia@windriver.com>
 <20241026032519.1968518-2-hongxu.jia@windriver.com>
 <CAJdd5Gay16NWTfxPLyAzVuTx02=hNeAY--JkPAXk_iHA=5bxKQ@mail.gmail.com>
In-Reply-To: 
 <CAJdd5Gay16NWTfxPLyAzVuTx02=hNeAY--JkPAXk_iHA=5bxKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7608:EE_|CY5PR11MB6260:EE_
x-ms-office365-filtering-correlation-id: cd4d6034-4c89-42c0-ef3d-08dcf7c8fe53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bVJYdklrUk9RbVJXVGdWSWxIU01YVmNmV0VKYmNYcGd5bFBNUXNiVmNna0FR?=
 =?utf-8?B?bzFMd0J5WkFiMGdaZ1VteFJBT2psYkFwdEdsa2lPS2M2UDFjREN2NWtNYlFK?=
 =?utf-8?B?aEFZWWxTV1lUUkRhVis0YTRHa3locVNML0xrdmdKSktiTDlRSkRzWU03RWMy?=
 =?utf-8?B?SGdtNHJPQk5YV0lUOTZrcjlLbWtSSC96OGo2RkVrTDRRck1mb0VUdGc4YjRv?=
 =?utf-8?B?VTFGOS9UNWhMdUhYN0ttY1R5TlhGS1hVWlczL25WQVpLSURhTkFBZUdPTkxY?=
 =?utf-8?B?Yy92YUR2c0YyMFEyclFWbURsRXJheGFQNVpGMnVkSzhZRStGY3huL2Y0MEJB?=
 =?utf-8?B?STNHcHpEMW1nWFdSWkExaWpqMXpFeTM3MzgrY1d6SFpEdWoxVkx2d0pUV0RL?=
 =?utf-8?B?dVJHYXVpdjUwbitQL1JzTEJNR2F4YWtpMktlZGlDanluYWxZYWFQdkhHVnFi?=
 =?utf-8?B?VmdnVGc0cnVsQ0tSSGhsR2wyMXZXSWlZaitoTExna0EwdXNlQyswWjJsaVp1?=
 =?utf-8?B?K0JraldHaGdkQjJuYkp1dEFmYWlQUXVBWTdpRkwwUnRjYlc5S0JDNTlVL1J6?=
 =?utf-8?B?ajVXVTNSUkxpNndtVEF6MDhpQWJOVTlzV1N3OFdieVcyMG5uWUd2b2FHdVM0?=
 =?utf-8?B?eFZodzB2RSthM1Bzc0FHZExMT1g1Q2hNaVowOXl6QTRjZzFFamlORW5JQ3M5?=
 =?utf-8?B?NGJOZjVZZXc2aTZjMlNSa1hRUVByeU16NFloUElUYVBoMDNzQ0VRN0ZLNzY5?=
 =?utf-8?B?bEt0SEttSzB3Y2ZhOUgyNTVVNDU0YkwxaWhyQWdxV3RCbjJia2xMTGZ0YlZ3?=
 =?utf-8?B?d0JDWjk4bTZSMWlUV0ZEQ3hEVHgxVndieWRwdlhHbXlBSURRUDgvVlMwTk95?=
 =?utf-8?B?ZE1IcHg1TzNpZnhsbE5KWmIyQ3NOK2loTmZ5ZFdmM0J4YTkxUkhQQWIyUVBl?=
 =?utf-8?B?UjBvVjErMHNOaWdkd0Y5OURkVXpkS2wxNk0vNmtkNS9LcmlWK1NMRHhORTg3?=
 =?utf-8?B?Ymx6VEp6Vk5rMTR5TkptYVZ0bktjZFQ0WCtlUjNnSi9qb3QxZjRsOGh2cWM0?=
 =?utf-8?B?TXljdjVXby93YnRMOUY4OWZnLyt4bXJoS2ZEdGNkYXZNMVhqM294amVMWG9M?=
 =?utf-8?B?WG1NQndMcWV1QitldmdZbHpOdlVSWXlZZHl3SDJhb3pPdzJqcWYxYm5ETjBy?=
 =?utf-8?B?eEV5TUJ2V2hEOGR5ZjlQZUZoWFFVVU40WGo5bFRtMXpuWjhyS0lwUi9vUHoy?=
 =?utf-8?B?c3FONjZ4b2VrR2NBcWtsVml5bHR2RnpiYkxtRE9HZGZHNXdGT2VJVzh5bzVi?=
 =?utf-8?B?Yi82cDdmNEpRa1djbjhCa3BFejRkTEhtWkF1WHR6bmdqRE5OV3J0dDI3emo1?=
 =?utf-8?B?V3FnY01QeDAzNFBROGI5TFQ4RlpZNFRBcnZzU3grN2VaMjN3K1pkZUZFdGFY?=
 =?utf-8?B?U29rSldhdEdscTA5MUg3TjNEN2NCdFBiRndEWVBPUlAwbXBrcWQ0aWNQVWNU?=
 =?utf-8?B?Kzlna2tRVmVUNFhCYytmb1F6QlZ6QjE5U1I1emxoa1RIUDd5UkY0KytnQUFQ?=
 =?utf-8?B?ZHRYRUI0TXF6dTM4NU8zQnhVQzE1WTNEYzNOR2VoSGpPWnRsQXpaQ1ZCZFMz?=
 =?utf-8?B?aTJMM0IvSjlBQ0wzWU5vUnExTHlUdWovNXIremJETndWbXpBUHcyeURPWENW?=
 =?utf-8?B?L0lDUnNvN2VrYkZGMEJrWjRtM29mSjd3N3hlVks5MzRwSitwckZXTm5lYmhq?=
 =?utf-8?Q?kfGd0fLHDTUj56cqTb0JJxKiLGEUCLa9a8fjdnH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S2lVeUVQNWZiSHhUWXdGci96SGI5SktvNlVBaXlkd3Y0UVpWMW1LSkM1ZDdC?=
 =?utf-8?B?alBQaDdmaWRoTGtCa0pWM3BES0JGU0tYRzF0UmJPTDF2b3NxV25XZHBBbTVX?=
 =?utf-8?B?bVNMdFpLdTVJcUYzdVFHTkpqOXFRMFFSTUhMRGlma0FHZlpKakRLaFdVL2Nl?=
 =?utf-8?B?cXJ6OFBOQ2NLNDVmRGIzd0JSS0doRVdpWDdoM3dSb0k5RnJSUjI3eE0zbXBB?=
 =?utf-8?B?SVJnMXBCNHI0Zm1wMzdMOTBrUUl4N2xtZ0JzVGw4WXY5dGRjQ3hJekxzWE9J?=
 =?utf-8?B?c0JmUkt1L3duZEpTUlRMSTNwZTV1eUh3UTZaRmJpY1k4ZFZnT2FJaEpSQTZj?=
 =?utf-8?B?OVM4Rk1XN0J5ZkovWUZLdkFhcVdlWllLV3VJaHB1T1BnR3FFL0E1ZnprZ2Zj?=
 =?utf-8?B?U3piQjZjRzNjV0EyRmxveGxSTzdvWi9jRW1ZbVpTdUZTOFFZbHdENFJmMkFP?=
 =?utf-8?B?TXR6SlRkYTJ0KzUyd1NuK2M2R1FHNDVlVm04c1FIaDMxa3lSWVlLU0ZxWnFp?=
 =?utf-8?B?VVdEM2hJU3JzeGtDcTZRek52akpYT09IaEEvenJ2UFUvSUNtdjN3a1B6em81?=
 =?utf-8?B?amJtYThRb0kxeUVuRGpKU05pR2YvK2tSUG1leXpLRGNhb3d1SWRNQ1ZWM3Zl?=
 =?utf-8?B?RlFUQkJsUzZocG1ZU0dObys2UVJFZ1ZNWDJxM2hVczlrcExNZDk5N1pjdlVJ?=
 =?utf-8?B?WkprOU9lM3IyZGVEc1NYUElDWTBmRVhyc0E3T2hwdTgrcXlZb21UZXlrdTd3?=
 =?utf-8?B?eHdnZlp2SHgwN25BSEh5TEJKd25lSXJVb3MzTDRaWWkyM0d2dzdHWlZGWTVi?=
 =?utf-8?B?VUJseVNncExmQU1jd1dJb0ttRVNlUEI5MEJ6bHVkWTRaOGVHaHVvY2Q4NHJm?=
 =?utf-8?B?YnFLV2laeXppTEdvWkhaSG54dk1DSlphU0NlNGwxWnZ3UVJNMWE1TlhIZ2NC?=
 =?utf-8?B?QVJlMklONURvbTlJT0kydTR2eERYamxEdUFnWDNKNzlJREM1YlhzbHVodVBk?=
 =?utf-8?B?TU5FQzVkZkN4MUs5akY0TDB6VjFSRU9SV2JNT2dpWGVXZzV4b1doTzZHcytE?=
 =?utf-8?B?UytOS2pEQysvSk9NckFVYmIxQ2tYZEdwK0xlb1hZUVZjeEtwVjdnWGtHQjFr?=
 =?utf-8?B?RGNWU3FxZFJsM3d6azFVL2FDem5oRE9yS0hhdlkwQjRZcXJXVTNrdnd0c0M2?=
 =?utf-8?B?TzRoYVJGTTJ3MjBWajMxZ0FqczZ1QjRLMDZ0N2tOYlREVGtFaDk3NWNJQXB6?=
 =?utf-8?B?NEZka29uNjNneG1qb3J2Um5pNnF2eDZZKzFlV2Nsa2FFYk1sQi9XVDlqM2RH?=
 =?utf-8?B?VVJWbERqellKbFZqb01LUXhaaDhIL0VnTE5wVStvcVJkNEJsVWh1VHJVYVJ1?=
 =?utf-8?B?WWpmYVJqQW93ZVpENW82cGExSG5EbGRDOXRoNmxBaWkyaU51Zm82emZPNU9Z?=
 =?utf-8?B?Ymd6a2pDSEVtNFJTRHZzMklJcCtEbXhNTTZlUmphVE9OQm9ndXFwZUFDdCtN?=
 =?utf-8?B?RXNLUEEzRUZHZGRCYUJra2FEYTduN3dETm5qTjBBaHV0SzRsUzBpWlVzc1lm?=
 =?utf-8?B?YmNoTEo5bHZpUkNKZXZrdSsvaGpTSTNCUVZTTHJlZUo3ZllCWVBiWm5oYTJT?=
 =?utf-8?B?c0lwMjlSUGNrTU04QUlUYlZLd3dKWWhkZk1VQ0Q4MXFSMUxFZko5UkFNU0gv?=
 =?utf-8?B?TldvYStNZnNWNUl5UlFMN2t5RTV2d05oSXl1MTRVdGNnVERubzdERkdTYWpK?=
 =?utf-8?B?eGhBLzQ5RUtNVFoxU08vMXdLVUR5RjkzOENkY1JTbjNvL3NUdVVPTHNldGht?=
 =?utf-8?B?c1hPcDdrNW1SV2dYZ1dEZStoVjdmQkN5Ukc5RHhvVzZmSWJSbmhPMWlrQy9S?=
 =?utf-8?B?TmRiV1ErMUhadm1iNng4QmVhVG5zbSs1SlpFUFJUT3ZreGtsNC9LYTJ3YkIr?=
 =?utf-8?B?RzhvS1EvY3g0endia25nK1hjZlA1UTlLazN3M1dBck1majk4bnRxbC9SVkZq?=
 =?utf-8?B?LzA0dDN4eHlyZTBxc1Rwa3dHamJMUEkxaVBoVDB6ck0yMjRGdWR2UXlFRktI?=
 =?utf-8?B?b2IvMVM1clpLWlNwbjc4TXlSSVpRY1FTNVNmTTU4VTF5aWxRdWhhR2lod2ly?=
 =?utf-8?Q?q6wzZcfxYcrJ4ZeWC5qQhDoHj?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB76086545D4295785DEACE9AC944B2PH7PR11MB7608namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4d6034-4c89-42c0-ef3d-08dcf7c8fe53
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 03:23:01.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uN1jRxFSzlGdkez3rxUZdr2Pfd8ap3nIeFa8J9BqsdO3oPLQPd/+4GmMhiwTetiXqbOKk9WeeSsmgdTehj9JbUTGGvx2Qtbcjj/EIe0l36M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
X-Proofpoint-ORIG-GUID: MiRpOHiBeK3EC--D8Rn2thXWocXGg8Wg
X-Proofpoint-GUID: uNMFUsrGOTigtPU80Vj0PnKzLUcbpky-
X-Authority-Analysis: v=2.4 cv=T9jeTOKQ c=1 sm=1 tr=0 ts=67205519 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=24AZYWMyAAAA:8 a=h4urgZ6a17EinMjLeFgA:9
 a=QEXdDO2ut3YA:10 a=yBxvwyJa1PPN4JHL:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=bG88sKzkDEFeXWNnvthB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_02,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=957 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410290025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 03:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206473

--_000_PH7PR11MB76086545D4295785DEACE9AC944B2PH7PR11MB7608namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29uZmlybSwgVjIgaW5jb21pbmcNCg0KLy9Ib25neHUNCg0KT24gRnJpLCBPY3QgMjUsIDIwMjQg
YXQgOToyNeKAr1BNIEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4gd3JvdGU6
DQo+DQo+IFRoZSBweXRob24gbGlzdCBjb21wcmVoZW5zaW9uIGlzIG5vdCByaWdodCBmb3IgbGlz
dDoNCj4gPj4+IGxpY2Vuc2VfdGV4dF9tYXAgPSB7J0xpY2Vuc2VSZWYtRlNGLVVubGltaXRlZCc6
ICdodHRwOi8vc3BkeC5vcmcvc3BkeGRvY3MvZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZS0xZmEwZDVj
Yi0yYmI4LTU2MzEtOWZhYi1jZDIxOTgwMTczM2YvOGQzMWUyMmFjYzRhODk3OWYyNGRjMjQwNDI2
OTJmYjU0OGZjOGZjOGQ4NWQ3NzVkZGFjNDA2YWJiMTIyY2VlYS9saWNlbnNlLXRleHQvRlNGLVVu
bGltaXRlZCd9DQo+ID4+PiBsaWNlbnNlX3RleHQgPSAoKGssIGxpY2Vuc2VfdGV4dF9tYXBba10p
IGZvciBrIGluIHNvcnRlZChsaWNlbnNlX3RleHRfbWFwLmtleXMoKSkpDQo+ID4+PiBwcmludChs
aWNlbnNlX3RleHQpDQo+IDxnZW5lcmF0b3Igb2JqZWN0IDxnZW5leHByPiBhdCAweDdmODU3NTE3
MzI3MD4NCj4gPj4+IFsoayx2KSBmb3IgaywgdiBpbiBsaWNlbnNlX3RleHRdDQo+IFtdDQo+DQo+
IEFmdGVyIGFwcGx5IHRoaXMgY29tbWl0LCBhcyBleHBlY3RlZA0KPiA+Pj4gbGljZW5zZV90ZXh0
ID0gW10NCj4gPj4+IGZvciBrIGluIHNvcnRlZChsaWNlbnNlX3RleHRfbWFwLmtleXMoKSk6DQo+
IC4uLiAgICAgbGljZW5zZV90ZXh0LmFwcGVuZCgoaywgbGljZW5zZV90ZXh0X21hcFtrXSkpDQo+
IC4uLg0KPiA+Pj4gbGljZW5zZV90ZXh0DQo+IFsoJ0xpY2Vuc2VSZWYtRlNGLVVubGltaXRlZCcs
ICdodHRwOi8vc3BkeC5vcmcvc3BkeGRvY3MvZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZS0xZmEwZDVj
Yi0yYmI4LTU2MzEtOWZhYi1jZDIxOTgwMTczM2YvOGQzMWUyMmFjYzRhODk3OWYyNGRjMjQwNDI2
OTJmYjU0OGZjOGZjOGQ4NWQ3NzVkZGFjNDA2YWJiMTIyY2VlYS9saWNlbnNlLXRleHQvRlNGLVVu
bGltaXRlZCcpXQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdp
bmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgbWV0YS9saWIvb2Uvc2JvbTMwLnB5IHwgNiArKystLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS9zYm9tMzAucHkgYi9tZXRhL2xpYi9vZS9zYm9tMzAu
cHkNCj4gaW5kZXggMjdhYjVlNDVhYy4uNzNhOTU3YTIwYyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9s
aWIvb2Uvc2JvbTMwLnB5DQo+ICsrKyBiL21ldGEvbGliL29lL3Nib20zMC5weQ0KPiBAQCAtNTc3
LDkgKzU3Nyw5IEBAIGNsYXNzIE9iamVjdFNldChvZS5zcGR4MzAuU0hBQ0xPYmplY3RTZXQpOg0K
PiAgICAgICAgICAgICAgcmUuc3ViKHIiW15hLXpBLVowLTlfLV0iLCAiXyIsIGxpY2Vuc2VfZXhw
cmVzc2lvbiksDQo+ICAgICAgICAgIF0NCj4NCj4gLSAgICAgICAgbGljZW5zZV90ZXh0ID0gKA0K
PiAtICAgICAgICAgICAgKGssIGxpY2Vuc2VfdGV4dF9tYXBba10pIGZvciBrIGluIHNvcnRlZChs
aWNlbnNlX3RleHRfbWFwLmtleXMoKSkNCj4gLSAgICAgICAgKQ0KDQpQcm9iYWJseSBqdXN0IGNo
YW5nZSB0aGUgKCkgdG8gW10gdG8gbWFrZSBpdCBhIGxpc3QgaW5zdGVhZCBvZiBhDQpnZW5lcmF0
b3IgZXhwcmVzc2lvbiAoSSBwcm9iYWJseSB3YXMgdHJ5aW5nIHRvIG1ha2UgaXQgYSB0dXBsZSwg
YnV0DQpmb3Jnb3QgdGhhdCBpdCB3b3VsZCBiZSBhIGdlbmVyYXRvciBpbnN0ZWFkOyBpdCBkb2Vz
bid0IG5lZWQgdG8gYmUgYQ0KdHVwbGUpLg0KDQo+ICsgICAgICAgIGxpY2Vuc2VfdGV4dCA9IFtd
DQo+ICsgICAgICAgIGZvciBrIGluIHNvcnRlZChsaWNlbnNlX3RleHRfbWFwLmtleXMoKSk6DQo+
ICsgICAgICAgICAgICBsaWNlbnNlX3RleHQuYXBwZW5kKChrLCBsaWNlbnNlX3RleHRfbWFwW2td
KSkNCj4NCj4gICAgICAgICAgaWYgbm90IGxpY2Vuc2VfdGV4dDoNCj4gICAgICAgICAgICAgIGxp
YyA9IHNlbGYuZmluZF9maWx0ZXIoDQo+IC0tDQo+IDIuMjUuMQ0KPg0K

--_000_PH7PR11MB76086545D4295785DEACE9AC944B2PH7PR11MB7608namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpDb25maXJtLCBWMiBpbmNvbWluZzwvZGl2Pg0K
PGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxi
cj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCi8vSG9uZ3h1PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50
VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBB
cHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KT24gRnJpLCBPY3QgMjUsIDIwMjQg
YXQgOToyNeKAr1BNIEhvbmd4dSBKaWEgJmx0O2hvbmd4dS5qaWFAd2luZHJpdmVyLmNvbSZndDsg
d3JvdGU6PGJyPg0KJmd0Ozxicj4NCiZndDsgVGhlIHB5dGhvbiBsaXN0IGNvbXByZWhlbnNpb24g
aXMgbm90IHJpZ2h0IGZvciBsaXN0Ojxicj4NCiZndDsgJmd0OyZndDsmZ3Q7IGxpY2Vuc2VfdGV4
dF9tYXAgPSB7J0xpY2Vuc2VSZWYtRlNGLVVubGltaXRlZCc6ICc8YSBocmVmPSJodHRwOi8vc3Bk
eC5vcmcvc3BkeGRvY3MvZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZS0xZmEwZDVjYi0yYmI4LTU2MzEt
OWZhYi1jZDIxOTgwMTczM2YvOGQzMWUyMmFjYzRhODk3OWYyNGRjMjQwNDI2OTJmYjU0OGZjOGZj
OGQ4NWQ3NzVkZGFjNDA2YWJiMTIyY2VlYS9saWNlbnNlLXRleHQvRlNGLVVubGltaXRlZCIgaWQ9
Ik9XQTk3ODAzODhmLTAzYjItYjU1NS02MmQ4LWNiNTljYTAyNjM2MiIgY2xhc3M9Ik9XQUF1dG9M
aW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHA6Ly9zcGR4Lm9yZy9zcGR4ZG9jcy9n
ZXR0ZXh0LW1pbmltYWwtbmF0aXZlLTFmYTBkNWNiLTJiYjgtNTYzMS05ZmFiLWNkMjE5ODAxNzMz
Zi84ZDMxZTIyYWNjNGE4OTc5ZjI0ZGMyNDA0MjY5MmZiNTQ4ZmM4ZmM4ZDg1ZDc3NWRkYWM0MDZh
YmIxMjJjZWVhL2xpY2Vuc2UtdGV4dC9GU0YtVW5saW1pdGVkPC9hPid9PGJyPg0KJmd0OyAmZ3Q7
Jmd0OyZndDsgbGljZW5zZV90ZXh0ID0gKChrLCBsaWNlbnNlX3RleHRfbWFwW2tdKSBmb3IgayBp
biBzb3J0ZWQobGljZW5zZV90ZXh0X21hcC5rZXlzKCkpKTxicj4NCiZndDsgJmd0OyZndDsmZ3Q7
IHByaW50KGxpY2Vuc2VfdGV4dCk8YnI+DQomZ3Q7ICZsdDtnZW5lcmF0b3Igb2JqZWN0ICZsdDtn
ZW5leHByJmd0OyBhdCAweDdmODU3NTE3MzI3MCZndDs8YnI+DQomZ3Q7ICZndDsmZ3Q7Jmd0OyBb
KGssdikgZm9yIGssIHYgaW4gbGljZW5zZV90ZXh0XTxicj4NCiZndDsgW108YnI+DQomZ3Q7PGJy
Pg0KJmd0OyBBZnRlciBhcHBseSB0aGlzIGNvbW1pdCwgYXMgZXhwZWN0ZWQ8YnI+DQomZ3Q7ICZn
dDsmZ3Q7Jmd0OyBsaWNlbnNlX3RleHQgPSBbXTxicj4NCiZndDsgJmd0OyZndDsmZ3Q7IGZvciBr
IGluIHNvcnRlZChsaWNlbnNlX3RleHRfbWFwLmtleXMoKSk6PGJyPg0KJmd0OyAuLi4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgbGljZW5zZV90ZXh0LmFwcGVuZCgoaywgbGljZW5zZV90ZXh0X21h
cFtrXSkpPGJyPg0KJmd0OyAuLi48YnI+DQomZ3Q7ICZndDsmZ3Q7Jmd0OyBsaWNlbnNlX3RleHQ8
YnI+DQomZ3Q7IFsoJ0xpY2Vuc2VSZWYtRlNGLVVubGltaXRlZCcsICc8YSBocmVmPSJodHRwOi8v
c3BkeC5vcmcvc3BkeGRvY3MvZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZS0xZmEwZDVjYi0yYmI4LTU2
MzEtOWZhYi1jZDIxOTgwMTczM2YvOGQzMWUyMmFjYzRhODk3OWYyNGRjMjQwNDI2OTJmYjU0OGZj
OGZjOGQ4NWQ3NzVkZGFjNDA2YWJiMTIyY2VlYS9saWNlbnNlLXRleHQvRlNGLVVubGltaXRlZCIg
aWQ9Ik9XQWU1NDdjMDUzLTc5NGYtN2FmNC0wMzc5LWNmYzdjZjcwYjViMCIgY2xhc3M9Ik9XQUF1
dG9MaW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHA6Ly9zcGR4Lm9yZy9zcGR4ZG9j
cy9nZXR0ZXh0LW1pbmltYWwtbmF0aXZlLTFmYTBkNWNiLTJiYjgtNTYzMS05ZmFiLWNkMjE5ODAx
NzMzZi84ZDMxZTIyYWNjNGE4OTc5ZjI0ZGMyNDA0MjY5MmZiNTQ4ZmM4ZmM4ZDg1ZDc3NWRkYWM0
MDZhYmIxMjJjZWVhL2xpY2Vuc2UtdGV4dC9GU0YtVW5saW1pdGVkPC9hPicpXTxicj4NCiZndDs8
YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgJmx0O2hvbmd4dS5qaWFAd2luZHJp
dmVyLmNvbSZndDs8YnI+DQomZ3Q7IC0tLTxicj4NCiZndDsmbmJzcDsgbWV0YS9saWIvb2Uvc2Jv
bTMwLnB5IHwgNiArKystLS08YnI+DQomZ3Q7Jm5ic3A7IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pPGJyPg0KJmd0Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBh
L21ldGEvbGliL29lL3Nib20zMC5weSBiL21ldGEvbGliL29lL3Nib20zMC5weTxicj4NCiZndDsg
aW5kZXggMjdhYjVlNDVhYy4uNzNhOTU3YTIwYyAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL21ldGEv
bGliL29lL3Nib20zMC5weTxicj4NCiZndDsgKysrIGIvbWV0YS9saWIvb2Uvc2JvbTMwLnB5PGJy
Pg0KJmd0OyBAQCAtNTc3LDkgKzU3Nyw5IEBAIGNsYXNzIE9iamVjdFNldChvZS5zcGR4MzAuU0hB
Q0xPYmplY3RTZXQpOjxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmUuc3ViKHImcXVv
dDtbXmEtekEtWjAtOV8tXSZxdW90OywgJnF1b3Q7XyZxdW90OywgbGljZW5zZV9leHByZXNzaW9u
KSw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IF08YnI+DQomZ3Q7PGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IGxpY2Vuc2VfdGV4dCA9ICg8YnI+DQomZ3Q7IC0mbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
KGssIGxpY2Vuc2VfdGV4dF9tYXBba10pIGZvciBrIGluIHNvcnRlZChsaWNlbnNlX3RleHRfbWFw
LmtleXMoKSk8YnI+DQomZ3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgKTxicj4NCjxicj4NClByb2JhYmx5IGp1c3QgY2hhbmdlIHRoZSAoKSB0byBbXSB0byBt
YWtlIGl0IGEgbGlzdCBpbnN0ZWFkIG9mIGE8YnI+DQpnZW5lcmF0b3IgZXhwcmVzc2lvbiAoSSBw
cm9iYWJseSB3YXMgdHJ5aW5nIHRvIG1ha2UgaXQgYSB0dXBsZSwgYnV0PGJyPg0KZm9yZ290IHRo
YXQgaXQgd291bGQgYmUgYSBnZW5lcmF0b3IgaW5zdGVhZDsgaXQgZG9lc24ndCBuZWVkIHRvIGJl
IGE8YnI+DQp0dXBsZSkuPGJyPg0KPGJyPg0KJmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IGxpY2Vuc2VfdGV4dCA9IFtdPGJyPg0KJmd0OyArJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGZvciBrIGluIHNvcnRlZChsaWNlbnNl
X3RleHRfbWFwLmtleXMoKSk6PGJyPg0KJmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGxpY2Vuc2VfdGV4dC5hcHBl
bmQoKGssIGxpY2Vuc2VfdGV4dF9tYXBba10pKTxicj4NCiZndDs8YnI+DQomZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIG5vdCBsaWNl
bnNlX3RleHQ6PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBsaWMgPSBzZWxmLmZpbmRf
ZmlsdGVyKDxicj4NCiZndDsgLS08YnI+DQomZ3Q7IDIuMjUuMTxicj4NCiZndDs8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_PH7PR11MB76086545D4295785DEACE9AC944B2PH7PR11MB7608namp_--

