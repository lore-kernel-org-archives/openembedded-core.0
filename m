Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49419C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 15:49:26 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by mx.groups.io with SMTP id smtpd.web11.16788.1747410565525699391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 08:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=orHdiEds;
 spf=pass (domain: toradex.com, ip: 194.104.111.113, mailfrom: rogerio.borin@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1747410563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zHhQEo5JvXNBe1gvxfSIv3UAXpSEIySytpm6hV+86N0=;
	b=orHdiEdsT/fy58XDUvG52h4CC2lSV+P5kXKxjQBXUuOUDVYLLP6fYZFvi5BY8i2TrvA1vg
	fhwAXM0Zs3EOQlnPG6EvKiojBBASDn9UAwhwrg7lpmlTXPhcpkrr/taisQcHJ5GHNjcDol
	/8Of+e91l707aMWSaT8gE8zaoWAi+0g=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp17010002.outbound.protection.outlook.com
 [40.93.86.2]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-70-a0tiZ-toPHK4fpowtXcK1A-1; Fri, 16 May 2025 17:49:22 +0200
X-MC-Unique: a0tiZ-toPHK4fpowtXcK1A-1
X-Mimecast-MFC-AGG-ID: a0tiZ-toPHK4fpowtXcK1A_1747410562
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::13)
 by ZR1P278MB0980.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:58::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Fri, 16 May
 2025 15:49:21 +0000
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99]) by GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99%4]) with mapi id 15.20.8746.021; Fri, 16 May 2025
 15:49:20 +0000
Message-ID: <5160dc12-d518-41b4-affc-9d9f7565087c@toradex.com>
Date: Fri, 16 May 2025 12:49:14 -0300
User-Agent: Mozilla Thunderbird
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 Marek Vasut <marex@denx.de>
Subject: [scarthgap] Backport request for "u-boot: ensure keys are generated
 before assembling U-Boot FIT image"
X-ClientProxiedBy: CP3P284CA0002.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6c::7) To GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0321:EE_|ZR1P278MB0980:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da88aa3-d9b0-42bb-70c0-08dd94913868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXB3WjVhejlMVVZRelNKZldXSEtPV1ZKMkRkNzROL0M0WGlUOWNucW9OTVM3?=
 =?utf-8?B?RHZHckgyQUk4Tk83Yi9ncXpvd0k0a1ErWkluSVdVdXZ3Q2JLa1pTS0s5Z2di?=
 =?utf-8?B?dmppUC9QVU1vbHN6QUY2Qmlua0srdFdlZENwVXRpOXI0R3padHBBdUhuSG1z?=
 =?utf-8?B?TzNiNk9iaGREcjJ1ZWYrV1Y5aVdhNVlNRGdEVFNoOXNBM2xncktjUi96V1dQ?=
 =?utf-8?B?cnRTQTFTNWtZUGx0OEZpTUpoZE1MZENvQUQyT1lkLy9NMUF4U2xFdWRRdThw?=
 =?utf-8?B?Y2FFcWJMVG1wRXhuTm5XakZ1Qk9nSWN2dGVOVWdnU21JYVZrOGxJU3E2SWZa?=
 =?utf-8?B?UkNIa1RHalBZRVRMZ2kwQVpOZzNrWEx6SldXbjhOVSt0YjgvRk1DOXlYV2pp?=
 =?utf-8?B?Ti8xSy9wbXZpaWlCUlhLczlhdThxT2hGVlhvYWJ6V2VsVStwZHdVNEcrUDI5?=
 =?utf-8?B?Zk5OTEtyU0NZRXVSQURXVUhDYW9zelZ5UFgrVFVoazY2TTJaL3cyMklOYmJX?=
 =?utf-8?B?VE11b3pINzNmdjczd1NTRlBLZFpCaGNtVm5TekhIYnJyanl2TmFPU2IvQnJW?=
 =?utf-8?B?VkVJaHlwbnhOaWlxNDNVODZiZGcvSFVodld4bHlON01WSFluOE1WMm1pRmhR?=
 =?utf-8?B?ZlZFZGRKVUxHMFQyZXZKTnFQZWpTNDBqdk5sV21LZGZxL2x3Y2M1bXlBYW1P?=
 =?utf-8?B?aUhGd1FpcFE2SnBOL2Rwei9qVWMzenFFRkJ1bFZKTzcvTzVuNk5jTlhidUtT?=
 =?utf-8?B?Z1pMTUhHc1cyMTlObjVWRXROdkVuOGNDb3MrSng3bm0xQXd2WTVnaWEzRkYr?=
 =?utf-8?B?eXd0cS9ab1hRSFZ0VGNYb3hCQU1nalJ0OTd5cDNtY0tXNzE2U2w5ZHJSR3k1?=
 =?utf-8?B?YjN3U2RrWk10TWlMTUprWE5IWllQZElRZ05pWXQzM3ZvZzEraDkweDM2dW1Y?=
 =?utf-8?B?dGt3TkQ1dzBnaWdZVDJpc3Y5RmhTWm5xbjVQT2tRckxwdDgyZ1NhcWl5cSt5?=
 =?utf-8?B?K0paMjd3bTFoY2NXUnhWWnFqZ1dzWEYxdnpwQVlKaG5iQWd6ZTQvL3pacFVD?=
 =?utf-8?B?SlRPMlZkb2JaRFM4akdtS2pJTVJmelRXUDlxRDcweE9ORnJGc044RTlBYkJn?=
 =?utf-8?B?aFkwMkR1UXRzV1R4SUc3UDlxMjMvVGpoTlJkMEFCSFhWMDlFSURyUFBsZEhF?=
 =?utf-8?B?Zm1ydHFSc21uaGxId2ZvL1ltQWM2aGM1TkZmdGlMbjJ6aEhMamxwcnZEMWhV?=
 =?utf-8?B?R2pFbUNBVURWenhFWXBUSmVMd0RMTzUxTTdzOU4vM0xRaWx5cHcxWDdKbHVC?=
 =?utf-8?B?bGFma3QxSjFmVk80Vk9Uandod1dIZG1EWlJSYlVydnlpYXBjS01iL1F2QzJx?=
 =?utf-8?B?N1pSa1dLY1lxOXNieEJJODM3WHVGT3dMcFVVVnFuTFR0UEJrZDZjMEg5akR5?=
 =?utf-8?B?WjZEMFAvL1hsVlVQaTV2Y0hZeWxUci8xN3JHTVAxSGRZcU9vR3JyczhrOHRq?=
 =?utf-8?B?QlJpOEFEZHNENTdqSzU2SlAzdElVTVVJQzlLeUNnZE1tN2gzY2RmR3Eva3B2?=
 =?utf-8?B?ZHV6enAyd252WnNDZG5Ybm5wTyt2T1pEaUowWnZEaUpCcXRBcUd0UVdPWnRw?=
 =?utf-8?B?ZlBBYmVJZjF0U1VsVE5DekZScnAxMFlEQkZNdVoyT2VjeDF1aUlzb2FDYTYy?=
 =?utf-8?B?TzJiTHBpbjlsdUtVczVEbXJ1aE9Mb1MyeUdhTm1YbE11cHZYZDFBaFQ3Wm1h?=
 =?utf-8?B?WDhGaEg1ZWIxQ3dwdVZmaWY5ckp0QlNxaUtkMUlIZ1ZhZWw4ZG5DYjAySXhT?=
 =?utf-8?B?Nzc4YXNHZTZFcG9aMmVFbEhUWU5MMEdKVUpMQm96SUwyOHRvazNKS01wQTFr?=
 =?utf-8?B?UGphUENHR2RJdHdmcXhqVVo0b1J5Syt4WGcvazJiNHZZQzdRWERab3VhWmtE?=
 =?utf-8?Q?gDLKPF0fiSs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBRa3ZFdVRPOTZyRS9KWndVU0FlWFNSYmhQWnhRMEtJV1RYT21EYWNJL1FB?=
 =?utf-8?B?KzVaMGo5dnpQYXlyYWpobkF4RDZrYnhVbnBKRTQvY0s5U3FJK2t5N1hJWmNV?=
 =?utf-8?B?TnFkOGRrbEVuaWIzVkxJK1RiZkdNZk9vZ3d6bEQ3dGdVRzZlSUtsNXBQRm8v?=
 =?utf-8?B?azl4Q3pvd2Jta1M1aHJJaDFEV0UraHppZnFLMDNmcTdKR2NycVlab2lsa1Iv?=
 =?utf-8?B?RnUydE1qbytkbHUxRExVR0NBcHlWNm9maEx5dkhsUzQwWG1qaEJOcGl4d2FH?=
 =?utf-8?B?L2RGK0ExZURtRlg0N2x6L2phaWVKdW1rOEk0UUFFVEIvS0Y2YThCYVJQSFhD?=
 =?utf-8?B?TUcyRU10ZEtLZmlOZ3pqK3VxWDQ0NlhhTnpwTkUrS1NyQmZqc3NvNmc1VVBH?=
 =?utf-8?B?bkpUd2o5ZE92RlMrUlVvZW9QRzNuSUpMYmt1ZGY4Nzk3MDBac0Uxd3RUdUJt?=
 =?utf-8?B?ellSRm9pa0I1akpQL28wZWhYKzR5b2xBT1JPMERQT004UExCMDhaemY4blpp?=
 =?utf-8?B?QXZkdnNpRDJFOUROOHJ5V21FMnE5TmpzUUxiRWpBVnFFbi9mV0ZjTjU4OHk5?=
 =?utf-8?B?NmhhWDBZUVFhWWd4SUF1Qzg5RmJ0bWNvVUEzQ1VvMWhTWUt0ZWtUWG10UnZt?=
 =?utf-8?B?Nkdna2huMVhLODg5Z2J0NlRVcEhUOEgydzJibVpTRTlnVkhMdFhjN1V1aUJM?=
 =?utf-8?B?eTVNbGxrakhmL2hkM2IrVVNEK1NsY052VWZvcjgyNG1wZFIvOE9CN2RtVmpC?=
 =?utf-8?B?TEhiUWk2ek9qSHExSDVSYmJ6UTZSV1dBZ2FBOWZlS0E2QTAwbUVnYUhiYlJZ?=
 =?utf-8?B?Ym5ocXBxL0JIbld6WXJEZkZqdG4wUWV3KzJnYkIwTTU0YkZEWkJwOHZaN3h6?=
 =?utf-8?B?anlmQlRVVnJhVUs0RlhHWTFYNkR1WUlFazJoSTJnaENhdWw1YjBpcDhYZEpH?=
 =?utf-8?B?dHBaWTVxaDJkMnVJM3VjZWxML1paRHp4Q3BucE1iZ3BQbHAzUkdWOVp5L3M3?=
 =?utf-8?B?QmJnRXNQUmQ0VGRHMW40SHlDQzJkYzZ5WkdSNXU0dnlSZWlPOFZrMFVIRTJT?=
 =?utf-8?B?WUZycUlQL05xS25MVm94WE4wQUhxb3E1NEc1b0FnRjJmcEZCUSsxV05DaUJw?=
 =?utf-8?B?TjlXdG9sZGx1dnJCdGVOclliUFM0TGd2VlEwMjRVOVhqMUlGSWhQOFdmeG95?=
 =?utf-8?B?b1p1eUpDdHA3RTZBTEc2K2J6MEo3dWNPdVc5bkNqcFhoN2dKQU0vc2VLUW1O?=
 =?utf-8?B?RjQvR1lKL2VlMGhrcjVWMitXNHprMnJ4dTR3SXAxRlJ1bWczOWRmTm4vK21h?=
 =?utf-8?B?SFIwWnRGbjZiK1o2VmgxSitnS2ZnRld6RTlzZytYOUNOSGx6VjM4eVl6Qno5?=
 =?utf-8?B?SFcyUndZdWxvNjh1bEFJUjVqQkhrcmw5MERBcWd1cm9kcWtWd0tiT1MrZkda?=
 =?utf-8?B?QkF3cmFyUUF6WitVVkU2bHVwM2gzOG1ScXhrbFZnQ25URFgvUW9POFQ5cG1S?=
 =?utf-8?B?cVFSOVN2d2ZEMkE2S21CN0tadDdiWGJxTlpySzEwNWVxN2FINXoxZExZa05s?=
 =?utf-8?B?SjF0c1VIL0JrcEN3bUpFZkdVZ3BVeENPQWNpMlJrM0VManJnbVdKbnBPbnJr?=
 =?utf-8?B?cXlyVitsdW1OVXBKcFkxeHlnTkE4NE9hdk9kTVJjdWY0L2RpNmxvNHZSYnV6?=
 =?utf-8?B?Q2o0RzhIMFNRZlYwRGpVUlNBQSt0TzliSUZLRGFWMmpGcFBvU29ieEFIR0lR?=
 =?utf-8?B?ZjA3SDRMU0hWOXNLTlVMQWZFaGZ6UWlFTnpGYWlUY1d6bndURmZST2V5M2ow?=
 =?utf-8?B?TzJZNHhKaE9hMVZrd0UrNitEQjFWaTBic2RQRmRTQkhGY0N6anhqQ1J0NXo0?=
 =?utf-8?B?ZmhKMVhvTXU2aEc3Z1FCZFBkTXFSK2pqTUFZY3FUaG96VDhqb0V6TWxDcHlp?=
 =?utf-8?B?eXMxeXg4RmVoaXE2ajI4emgyNW1nQTBFOWg0V2d0SUdpdVEvalQ0TXpKaTRD?=
 =?utf-8?B?YW5haUVQSUtuKzV6eG5yRGY3em03ZG1EdWNFSmw4SzVkUGd6Y0Y4elJHRnJL?=
 =?utf-8?B?QWwxeDVRanVwWk45a1dsQmRJRTRDZ1pRSmt4SXBjY2d1dFpQUkJFNXVuR3VN?=
 =?utf-8?B?SWxCQ3Vmcjk0MDJCY2dOTmJ6d29xcnpmTW5XRUV5bitDRGpaTTFKMGI2KzNF?=
 =?utf-8?B?N0V5YmdkZ0IyU0NxZnE1VDJ3c0NRSVY1Uk16UVY0TVI4cWp3M2NzN0xvZGJo?=
 =?utf-8?B?bzd3aHQyOHlsUWRHU1JyZ094TFlBPT0=?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da88aa3-d9b0-42bb-70c0-08dd94913868
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:49:19.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYWrEih9+PBL5u0jJhCAUhCrb+Ri5ezDI2qfORJZasesimqJL51XN2o4ww8+sC/K71pekguXrDFlQVM5zr+Wg9lThkYtjn2/AzVDRP1VncU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB0980
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UVk9Gr4c8Fgi4J7ZOn85-9VI_rw3F2121ojLnakUjAM_1747410562
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 15:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216756

Hello Steve,

Could you please backport the following commit to scarthgap?

036f20156b3c ("u-boot: ensure keys are generated before assembling
U-Boot FIT image")

Thanks in advance,
Rogerio

[Toradex Logo] <https://www.toradex.com/>       Embedded Computing
Made Easy
Choose Us<https://www.toradex.com/how-to-choose-system-computer-on-module-p=
artner> | Products<https://www.toradex.com/products> | Developer Center<htt=
ps://developer.toradex.com/> | Community<https://community.toradex.com/> | =
Careers<https://careers.toradex.com/>
Join our webinar:<https://www.toradex.com/webinars>
- Toradex Quality Now on SMARC | June 04, 2025: Register<https://www.torade=
x.com/webinars/toradex-quality-on-smarc>
Meet our engineers at:<https://www.toradex.com/events>
- NXP Tech Days | May 22, 2025 | Stuttgart, Germany
- NXP Tech Days | September 30, 2025 | Boston, MA, USA


