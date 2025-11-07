Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4D0CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:27:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6949.1762504037788782546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D8dO+V0t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3406392cf3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75t3Fl160410
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 08:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pgF0lnuxLXXKWXxsavwdE9tiEqVOFaWIAUzYtOLrK6M=; b=D8dO+V0tbwyb
	LFoXl4XHzGvZcxuC1tpZ40g4lxm916+gPZQ3cReElFm/KuExG14o9BS62NX7gNat
	LYiqZqxUw+kpLNoWhf5IaKIGOjmM+QrxkZbvCqypRhYUqEf48AiWDJaWznRJnUjP
	RmUejuyt9eqQU89Mo9Ih6wX1fs8FjtNgFWQ+XclfKGHpBvNqN2/wJqB1CNCy8ZqP
	a6u+rGO+ooxbL/S3UObZkbQLz5CuY+yPplLHiEamr75pWblxw8PN6gD2RqWl541S
	fy5l1u+DGjjTl4MfCn5cE3o/ydTjaGJCsP6b6/iv0tskq+eaLonsU0pI+tZiRgIP
	5q4k9UBiqQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96y98a74-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:27:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTcanPNfpxULLsxqLSPbd1UlhJObcQZzwm1MEOW+Hkij8bbPqQdr60dPIVwVLN88aosNe/ZraeSEOF3GwK8bmFi91zjk6208oDIlJnNsAIxEP7iPhJd6BSaByg3T8CINzgQLsaYtXM0iy8KIaByerioHq6S3hKCPxDF5xwgmI+elDkQl3u1nnydQu7S7bxZSg5QrcBmhB++3SfO3kSc9KpAYlrk+ojKS3RUcNSNM3IAnKoKsUF0WKiUDvrORszQhGqPsqf0Kc50fjhvx14s6QT6HlxulANgS+dXOxo7JbBDtVi6HTdHBZgUahdWFq9G1s6Z7DqQXB0SrFl6v86/GRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgF0lnuxLXXKWXxsavwdE9tiEqVOFaWIAUzYtOLrK6M=;
 b=qzkNecChR3bYNXEPJCwqngACC2EQIKq2jz7ZwLZBktRXHSh9enuxVf+lTskWKpXqwTl8iKRDWykoqMGdnKhTSbvUSQCQL+rqI7CgVNggdStocveWdfc5jdGZU61L095yled1HxBdPOMDh48hslsVoFzDrZx5kiZo8mEd+/vvwMzLPIWeR+ewoNd5RXsEDWPsZgwv/DB5tAzj9hNJV7GZoVoEbfZ8sSmCONLIkAnga0d4p19JUZvYbNYkaIdHOXxPzo4H5GtsaQkQfJapzdiNQcUldeJUKQIC6KVhIzkR/eTqnP7bGxOrGCl3AXT5r6nKiprBQi4KTUnscqnc29jJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 08:27:13 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::48ec:9358:1988:ceaf]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::48ec:9358:1988:ceaf%5]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 08:27:13 +0000
Message-ID: <8a42aa34-7ba5-400e-92d3-3765eeaccedf@windriver.com>
Date: Fri, 7 Nov 2025 16:27:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] libxml2: upgrade 2.14.6 -> 2.15.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org, skandigraun@gmail.com
References: <20251105023236.310076-1-hongxu.jia@windriver.com>
 <DE2A8WAMFQ8I.33H1IHF8RV2DJ@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DE2A8WAMFQ8I.33H1IHF8RV2DJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 031d8262-da88-4cef-35dc-08de1dd772bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eTdlR3Y5SmVDUU4zeEdFd0xIaHlFcFVCZy9CZXhaRnJKOXJMYytZUmNwcEJy?=
 =?utf-8?B?VlY0YXNxSjFPcFRiL1VWVVA5QTI5NUd6bzVrTHppRWlTYkpBa2ZTU0xqZm5W?=
 =?utf-8?B?TGo3ZmF1aTh6bjEyNFA2SUdpNTRNa0phVkVTcmx0NG5vdkxBd3dFaEU1STAr?=
 =?utf-8?B?d3VtWDFCeUE1ZS9DdWNzNG1qSVlQV0xwazZRNjNKYkN4ZUVkd2FZTVJjUEEv?=
 =?utf-8?B?d3NlT2pmRFlMUzhKakZUaGRtMjg3STlKbXJmZGtmTlRTZzlvekNsNnZXWmgy?=
 =?utf-8?B?WGd2Z3Z4UXpoSG1JT29INHZSOW13OWNlckV1b0FrbndhNFRKRWZzSW9VNk9M?=
 =?utf-8?B?U1BYL0pvZVZkL0xKaVNxNi9raFh3dGNFZ0NHQnVKU1ZDYlJFSkhsWGFibDhG?=
 =?utf-8?B?NW1hdWRLOExlOUNlVVhyWlptTXVkSWpweEYzaDVPZzJIenVNOVkxbjU4ZjFV?=
 =?utf-8?B?L0RCeGZKTW1ObXdQNVJUSTlUazk3YUM2ZVh6VWJuV2ZXd0E5RUFsK2JyUFBW?=
 =?utf-8?B?aVRIaFhGa1l2bWtKT1l1YjZaQitxQ1haQXJxVXhBQTc1L2l5S3Z5dGVEM251?=
 =?utf-8?B?TmhadWpmdThTWTM1Z2s2NmVzTlh2OWFvZHpiVmoxckJ5YTI2U015NXdaWVVt?=
 =?utf-8?B?ODdrc2RWallxb1ZYU3ZVMEVxK0Q3WnVLcVh0NE1Fek9UeHhFSXRlOWFJeXZu?=
 =?utf-8?B?b2E2aUlFU0xkOGIyWVFMRjFGck5ORy9OdnRsL2hZdFo1UjB4S0wxSXdaS25D?=
 =?utf-8?B?MVRuM0RPUTZCZFc3U29DcmNYeGcxeDd6UXlSZldFTHE2QjRyTGt4V1gwdXd1?=
 =?utf-8?B?bGxiWTVicFZsQUJtTjM5QUNOZ2NnT1QyTTY5eUhOSWxzK1B1cFcxQVBJMVNx?=
 =?utf-8?B?U0RpVnNGSkp4TmJtdlZFY0dIS2JkdGVXRnhYK3BnNHNldWNkYUtuS1p1Q1Fq?=
 =?utf-8?B?SW1DaVhITjVqUDJyZTU0THR2clFjc1hsS083V1FqUEgxU3liUjErdittcnNE?=
 =?utf-8?B?R1JtUEJiN0hpSTJ4RGVCZzdhcnA3NGZMRWdRL2xzbUUrK1FvWEE0SnFkeHBF?=
 =?utf-8?B?OWZsVDdkTnVEY0QvbU5CVEZudS9sV1cwajBzMjB2cDdlMzJGbWQ3cTRGVlZZ?=
 =?utf-8?B?R1dYazBRUHZ1RmJiMllUM1AzcVI1ZHI2OFhzL3VnVjNDL0dKbjFpNzArZ1ly?=
 =?utf-8?B?V3N2ejdGUmNtZkIrb2xKd0NscVRnMmVGUGtzcEo3Z2VpbDNMV1pWZU9FQTF6?=
 =?utf-8?B?S0RrY1c5MUhuVENpRDhvb29nQTQxN0ZzZjJEYnZ5NC9IVUNZVnRFODR1d2Q2?=
 =?utf-8?B?TjZkRG9leHVrQlRnVDJpRHBwZytWck5MT0pROWdnUHVEOGVmYWNnUTVCZWNS?=
 =?utf-8?B?NGl0MkFsOUt1Ymp6WkV1VXVYN1IvUG5sN3RQR2NTU3lJb21wcXMvdE5hb0Qw?=
 =?utf-8?B?UE4xVmMyNmZCbzFtWTZMVXdPUmNoQ0ovbEg0Z2YwK3dObm9sam4va3lHa2hs?=
 =?utf-8?B?ZlBEdTd2dlBEVDFBMUd4TmhORlhIeWQ5NjZCU2NsZFVzTERaYk5jeFBCK3No?=
 =?utf-8?B?M0tSaEhZcHNaK3ZtajAwUFB4YytNTm5JTnVtVFJOUzlrc3JETEk3NlRBakkr?=
 =?utf-8?B?Ykd3UHJyK3NFNWZkb0lvUzA1OW1vNFp4dmVDRFZvcFpmdEZKMUFFZzBnS0RL?=
 =?utf-8?B?WStNR0Z1MnViT0lzckZ2cmhOV0J2dXBJdm9mQzFneWpLRnNSdEtRdmozQjVE?=
 =?utf-8?B?enp2ZXJJWmw0eUI4UUF2STYvb3U0Q05xZ0p4eWhWZlltbjdrOXFuNkNhdlhx?=
 =?utf-8?B?djNkRnlRUzNFWDlncm5qOGFXS3Y5OERzOU53Zm0wRFFIcGNlbmtabHllR3Z2?=
 =?utf-8?B?cjFTT0Eza0QwMWljZUpNOFlTeElkUmw4RWQ4dnl3UVVEcVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWN5a1N3Tkl4d0ZxQVRvdUJVUGdsbEhnOEhSc21WOVBhWFR3dEtpTk1WUkZ5?=
 =?utf-8?B?QVR2c1poejlGYmgyazFvMDNzMC8vNG1Uc21ObDZqUDh4OEcvRTFVWFpRSFJl?=
 =?utf-8?B?VU1JbWI0WVBvNXBwancydU5tc0svanE2WEo5T25ZSkJyVE5OazV5N0FpTDdO?=
 =?utf-8?B?WFNxaVV2TUNkaC8vb1Nra1FuR2tnL1BzSFZ1eW5ObmhlckZCNDV1Q2kreDAw?=
 =?utf-8?B?RjdDY1AvSWh3emtVdzVaYysrZFp1R2MxOER1TVBQMVpyRHJMalZFNnZ0Mm80?=
 =?utf-8?B?cHErSmJIcU10STk3QlRzVW82alY4a3QvbHAwNUNxU2poSENxdSs3Q1VESVJk?=
 =?utf-8?B?L2lBZ2pRRDM1TS9QRzB4Y1dMNDNrUEFUNUFRN0gvQ3U5QzFzMFJqZEc3elk4?=
 =?utf-8?B?RkM4anBhOW9acTl3ZVFzS1FtRzdXVElITjZ0VEtQZGZUcnhUN0hqSjl3aHpx?=
 =?utf-8?B?Y0lndjRSN2tjVnJzeGdrNDE2QzZINE83ZCtDV0c2YUFSVVIrYnFXL3pOSSta?=
 =?utf-8?B?emZqdExreHVvdHNCOUd2ejFib0taNHdjQ2p6WTNGOWlXQngrWVZVeVB0RDRp?=
 =?utf-8?B?QmRmTmdOa3B3ZFpKTDJTaGxveHYrOGQ1cXV0Yy9sVzVTQTQvQjhiaCtaNzl0?=
 =?utf-8?B?bFF3cDkxVHZOb3ljSGpnSFZvYXlwK2NYMkNndnE5SEdkMFAzZmE4am1JRjA4?=
 =?utf-8?B?THBCaWxEQ0pRaUVGVW9WRUswblRiMDdHclFaMUMyMVBOcjhaVUMrVm04QzZ0?=
 =?utf-8?B?ajNLdmZtMUozM3FBbHJXU3Z0N1JrQUFITHI1YjB6Z2tOemZaUnpSSUx0NzZh?=
 =?utf-8?B?ZVJhcC92U3lOaTM1bTNnRGk2NHQ4bzQvRyt4aVBVNVRKWlJTdDNkcE55bFRh?=
 =?utf-8?B?V0h6eHdIK2VOVjBZOHlFbm1KR2VodHNMcWdtT2lmZSt3Yk9OcGpHd3NNUkF4?=
 =?utf-8?B?NmFpTEhZN2o3K0xvL1JibTBObEN5RzJSdkwwYnBUa2Q2Qy9CZ0R2NzlGZFVS?=
 =?utf-8?B?eEJudTRaeXZMbENDSmtTT1g5dkR0RGNFdnVuSkpzaDJ2R0d0L3FBTW05bm00?=
 =?utf-8?B?Y3hMQ1JjNk1ETWU0Umh0VnpMU2FKWG4xUzdqMXRCRGhnZnFEQitITUtGUjA1?=
 =?utf-8?B?dWtxblYrRmFvbGlYcHhVTGNUMm0wbmhTMmFMKzBuOXdPNWFwQ0VzSGJMbzda?=
 =?utf-8?B?WnQ2dnVLMUdxL0JGUUl5OWhzd0JUM2ZXaDZ3L0wwb2VyYWhsSmIvMmU0VUM5?=
 =?utf-8?B?R0EwbU9mbXZYQjV2RlV4VDlzbzJiTVh1cjRMQUx6Rmdmb2gyQUpySGtjc2ht?=
 =?utf-8?B?TWRibjNHYkhRYldvNllrYWdtajllUnlvWU45SmRPajdXaTB4MlM5QXNMd1Vz?=
 =?utf-8?B?R3NqNTMzSkZ3ZnA2cGdybHFBSDN5KzY5OWlFQTV0aUc0ajFXSFRoaFd1N0Rq?=
 =?utf-8?B?akJJUTFkbXRDTHlpaFNiUjdrcCtza3ZmY2s2MEJOcTZiMExuSkRpTGdFTVJO?=
 =?utf-8?B?RWUrbEtHa2xVVUVCVjVUajhBZjJJeUJFQ2VzRVBzeHNZaFI2ejdOWDhxS1Rx?=
 =?utf-8?B?OEtlNXhSRmxrYjIwRXJVMUJySW94bkY2VGpCS2s0UEdPZ2grK3VYQlpjZXFh?=
 =?utf-8?B?S1FnVzVYaGtmbzQzajlqemNVeDNDb2wxdGpkdzEycGZFN2JFVzNIcFVkWHJX?=
 =?utf-8?B?QmxPeEFCWTcyVnJ0YVczWDBISmc2cVA1MnRCY2FzUDNnQmFhdFJ0M3hFOTUx?=
 =?utf-8?B?SGk4d21XUHMwWmFCblVQTjdTaVpDV01kM0NGbDhVWmJhMDIzazBtNm9BeURk?=
 =?utf-8?B?bEJOZmRPeUt6RjdtSVl4dE9Cd3dIVnhqczh6a2ZwcVhFRnZ5REthT0xMRjJq?=
 =?utf-8?B?eklsRnZvdHF3Qm9VSE5YaGhGRjU3MnFBaDZ2ZXNaYnI1OWVxaTZsVUpHQjgv?=
 =?utf-8?B?MW1IZXVZTTZmYUJYOEw1eXpNMVdkUitlL2pCclQ1dlh4bTBsUnhadGcweTJz?=
 =?utf-8?B?OFB1SlBFRHluZTdGZjVrYTdSZlBoZ3dWYWhqNEZYUDFSRDhURmt6bVBvb1d4?=
 =?utf-8?B?Y3NVdTV5MVhIb3psTHVpK1FGblhUQ3N0NWU4aXQ5RHZhTVlZZG9nRTkyaUh5?=
 =?utf-8?B?UEpLUlFBZDJkdElOVnp6MmlNVHFmazROOVR6REtFZWVYYVlJSkFSL2t1N2Rm?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031d8262-da88-4cef-35dc-08de1dd772bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 08:27:13.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7c3k7SJs6qgUci4cWuAjzvCKBwDAXXkHjMLyVos2hzQfk7N++kS7KexBELiOxZNrp+zWUup9kVbbSWFT2W64s77NSW+z7QK9Ztc3w9JtfC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Jq2YIDUwxlqwAfjX98J9CtGDLuEmz9jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2NiBTYWx0ZWRfXwZ0GOrQaTmzm
 8bEzj6f+qT6IpgRBMisYstvFIZleXdZCZLy4s0Ath9qFv8hRcg0aU021UeXkjHpUsaE0TSOf/cx
 uuW1dP1CRX3EeTxUhYKrNn5a3ow6m9gx+Z38tObzKqLHwbfGt/PHVLLJHganXvd7W+oe06AzU60
 O9tKiGy5MQBJkkSf/MxkQtMi1JsrdVZJqBps33GNXss2GeGqa+sm3cpF3oliBqiiPM5FhsGCsJr
 wbi8gRDgpWIdKD9ZbkDlSJ3cBXlvh3q8JYFwCStRmDCkv/9sT7I7sDvtiBNUUxlvDKQrL9fQ+38
 Lq8Q8Z9mtYUsScdkmMocFykr/JfsIUg50wwyAkqEK06gg5Qx1WarxruTV97Hk9SyUe7TtuQaUIC
 4AEnlrip4yrVogLE9YfN3loI5nhdsg==
X-Proofpoint-GUID: 2Le6dy2nGsFylYsVGSrivgpEB9giV3sU
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=690dad64 cx=c_pps
 a=cj6+QZNyov9unU3rCXIAQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20 a=Z5getJ8MAAAA:20
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=ij94W6kC2FAeMkD465QA:9 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226021

On 11/7/25 15:26, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Nov 5, 2025 at 3:32 AM CET, Hongxu Jia wrote:
>> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>>
>> Due to upstream [disable python bindings by default][2] and are
>> planned to be removed in the 2.16 release[3][4]. If we still enable
>> python bindings by --with-python=yes, due to upstream [doc: Build docs
>> with Doxygen and xsltproc][5], build python binding requires doxygen
>> otherwise build will fail, and we do not provide doxygen in oe-core,
>> so remove python package directly.
>>
>> Refresh install-tests.patch and run-ptest to not install python test
>> cases
>>
>> Drop CVE-2025-6021.patch which is obsolete
>>
>> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
>> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
>> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
>> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
>> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi Hongxu,
>
> Thanks for the new version.
>
> It's not clear to me how, but it looks like this update is breaking rust
> build:
>
> ERROR: rust-1.90.0-r0 do_test_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/temp/run.do_test_compile.3947248' failed with exit code 1
> ...
>
> alues("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_rel, values("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_acq_rel, values("optimized-c"))' --check-cfg 'cfg(target_feature, values("vis3"))' --check-cfg 'cfg(feature, values("checked"))' --check-cfg 'cfg(assert_no_panic)' --check-cfg 'cfg(thumb)' --check-cfg 'cfg(thumb_1)' --check-cfg 'cfg(f16_enabled)' --check-cfg 'cfg(f128_enabled)' --check-cfg 'cfg(intrinsics_enabled)' --check-cfg 'cfg(arch_enabled)' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg(feature, values("unstable-public-internals"))' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg(x86_no_sse)' --check-cfg 'cfg(kernel_user_helpers)' --check-cfg 'cfg(feature, values("mem-unaligned"))'`
> | error: rustc interrupted by SIGSEGV, printing backtrace
> |
> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0xd2ab55) [0x7f3ae2d2ab55]
> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6(+0x3bba0) [0x7f3ae1e4aba0]
> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0x8527820) [0x7f3aea527820]
> |
> | note: we would appreciate a report at https://github.com/rust-lang/rust
> | help: you can increase rustc's stack size by setting RUST_MIN_STACK=16777216
> | rustc exited with signal: 11 (SIGSEGV)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2610
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/672
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2613
>
> Can you have a look at these?

Seems no direct relationship with libxml2, but I will still have a look 
and try to reproduce the rust build failure

//Hongxu

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


