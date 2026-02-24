Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E104F4BB90
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:39:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31742.1771969148752160780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DvSEONpI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65157b7930=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O8IKEl3609669
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 13:39:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=qZtiq7anCi1ULBMCOvOycd
	2F5vL3fMIGLg3rpJnvKTs=; b=DvSEONpI8ZltMeN48V1oJyB1NveaBYPkissFk2
	scoE/yW2TZp6E1fOSxNoYAbUENTemRvRIIt/LhJuPAKfCBUJ6/aWr/TwMhQPN08Q
	e59i2BC6iRF+lysgFHSZ/pek9ub2RwbXBqpBndTUa07+sk2o5K43CSibED07FfiK
	8pjpH54WXEPNnMFtNjS5BSKhA1rq4fX/zJHS3V/hTL8pl710szy7i+Up+i67yRBe
	wziM0AICl3SDf2PmK1wTH7EGGnnMa7DDmTaq4uuvUk0LVPQSDkcCVgIggiAdaF72
	W7GNkwG63x1CpKuPsqd12Buv5uZYImg48Pn/zKf3Zj67YNzA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k3phv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 13:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+o8bVN2hW1usk0iNRXwgABhq/Hu82YBtdtk2nuHFDJIVWeJveRkzHk1iPC61d+W61AHGZS5P/7YlnvUfi5DUvetAeVrSAJhdLM/rqMc2u2WtQrYrYmTmYD/08xrPra4DME7CdA9ssBZsoYY4kTdPyNAkvYrkcTCku2C58AtRMgf0xJZOwo5PdLhhSDoFH1bYriFEP8KGORnClAypyx0iTeJQg5thsJA9t6QchULSp2vNWcj1T3R6WkBxlFLQx53fUZlfrlqMa/7M+n11j7ZDsIYso/Vqu/GZ2wXDW7YnJLuGXYCZpSBi6XLI+JRJtZO/uPRxd7rpzmxH0m/NMciHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZtiq7anCi1ULBMCOvOycd2F5vL3fMIGLg3rpJnvKTs=;
 b=hJAhpJRu8XsPa+y+0V/41LudDng7e5/iXy6m/Z9cwxvyL8M/YnoFoSrs+VflROf191a0ApfLE5j47tSxm13CZUyzNhwUMbABsp/Y4Vj16CVRWpzAR79FmZ3mGNgzdPsPIXOFk96KFQcLWefGZ/Qr5wj70I2/qvjwIC2d/r92y0UUg76lLlLpw9oNeRefKkPoDtBZN0J06c8XUOrLRnXdMGgEDFjCNnuummkW9K2ppVBh6Lvcfvqp4bwOIPkrPvkCCsONCmFUDFqWo1HuSMoFD7nu02qzPZwjg9kxOxajgN8u1UBYEiTKVogeNDYOvSZAqjuVMpd1wPTiexaO3aHUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 21:39:05 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:39:04 +0000
Content-Type: multipart/alternative;
 boundary="------------kXyeyKbP0F5QL24RLzqmRTw3"
Message-ID: <f22d7183-760a-41e5-8713-8a68b24918dd@windriver.com>
Date: Tue, 24 Feb 2026 16:38:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] nettle: upgrading to 4.0 FAILED -> FYI blocked by
 gnutls
To: openembedded-core@lists.openembedded.org
References: <0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: FR4P281CA0333.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::8) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: cc50f8d4-9d6c-4c7d-a803-08de73ed21db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1o5ZGlXb0d6eTlQeW9RaGdISTRxbXJ3b1huUi8vMVJKSzczZEk1TVhHMEl4?=
 =?utf-8?B?UjBXejBDd3dvcmErdmFVZEpTWDRxN0o1SlBsQi8yMHhsMDVYcVhSaU10UnJz?=
 =?utf-8?B?T2RjVWg4Zk9CWEcwM29hY0JXNXR4UmNFaHh4NUg2cHNwMkNoRWdDalhTMXVU?=
 =?utf-8?B?YUlUcDV2SStaTE1yYzZxR3huMHUwS3BzeFpVNGhlZlp3M3ZiY014N2lUVGRq?=
 =?utf-8?B?dDJTeHpjckNJdXZPR1MzRUl1dGNaUG9qeDArM0VCZWpycFZGVERZK2JNVlhm?=
 =?utf-8?B?RW1EeUE1TFVaRnNMU1F0eXp0RWhHcFgrdXpSazh5cWMyQ0xKNUpySHhJOWxM?=
 =?utf-8?B?ZytVUFdnWXd1MDZlUGo4VVprV29SVnZsWC9hUTdqNE5rSkU0VEQ2dit3ZGZP?=
 =?utf-8?B?cEpYeDhKZ1lKU0M1Y2lCOVZQaU5rdGFydFFBRHhDY1YwaGt4MmoyTTdhb1JS?=
 =?utf-8?B?Z1R5T0VzU0hoR2l5eTd5UjRoU2JycFBTTDM1ZFVoV3EwUWRrZE5BRWNuOUZV?=
 =?utf-8?B?TS9wYmRkbk5UTVpXc283V01rdWZzZ2VGVXhFNzFLTkdqSExjdlZDVk1VUERC?=
 =?utf-8?B?R1NuaUJjRlhHOTIzckVsenNkWG82bkZkNERmSU1rYm5NTVdaTjI1elZEUSsw?=
 =?utf-8?B?OGtqY250YVIxeDV6WVh5RDF3V3FjdUgyN0JCVTl4cHc1MFNqUTRMQUVKbUpJ?=
 =?utf-8?B?VEFQWkpSVElEQXYweEo2bFRnR0E5Z2lhajRyK0NKUkZ4MmlmVXppNDlvNXdo?=
 =?utf-8?B?ZjJjZjh0TUhubGdDeHJJeW8rUjNJOFlmMDduWXIrc1pkR2swLzBIaUZxVUlj?=
 =?utf-8?B?dXlBNnBXdFlTamVYWjZPN01LODA0aHBhTGlPQURyK2N3QnpxaTRqWi9DMW50?=
 =?utf-8?B?VURUaHZBcnZuWEhpRjlXbDdCaGkzckdvSDZGU1o1UThQVXNST3RkZU1vN2xs?=
 =?utf-8?B?cUU5cXFXdWRTZ0FhOVI5UmJDVlBnK242Ly9WNWpkejJ5V1FOVThsaG54LzFH?=
 =?utf-8?B?MEIrMDh6bWFJUXJvM0I1MGlFdzRlZXp1cHhPVUZ4WXQrU3Y5SUlqQ1FJREdQ?=
 =?utf-8?B?NytteWFYNzVmV2ZuNGo5Rnd3WWM1bE9aZ1grYlo1NENLV0tjK2JkcmdJTFBw?=
 =?utf-8?B?dHpvdGJJNWZTRUhwbXppOU9iYU4wRGxtQnN1MzN1V2lkUXpycVliYnpZTm5q?=
 =?utf-8?B?K0c0eHdrdDBlVzZLaFhFVFJTdUo1OExDb2NWY1dSN3lyeDNrdlp1UVJoT0hq?=
 =?utf-8?B?VGFaa3hyV2RQbGU5bWVKMFVnaXhMNjlqZitmNmRGZDlBaEZrcm00MFQwRXBI?=
 =?utf-8?B?cmVnMENORmljSmNQZWVQTUdHTnhDMllkZXZiN1JWalBqU0R2M2NMNDNhbUx5?=
 =?utf-8?B?QVg1UjQwbFBMak03akIyYWlZcHJEaUlROUtGR3F1UTc2NlE2a3lCSFZmbzRp?=
 =?utf-8?B?bU9ueU9NTGxNK1lka0tJMGZJSXVFYVRtRW1xaTF0cFExV3M4YXZTeTQvRHRH?=
 =?utf-8?B?Nlc3dUpKMjI4S1RoZHJ1cHloemhRN1lNTVpNRkF5Rnd4eGY5MlhtV3ExUnZ6?=
 =?utf-8?B?NUFxWU1aZWhBWVJ6Vk9sQ3AreGdpVkxDdkd4V3hwVUNTRTRqdHR5K3RWN3lO?=
 =?utf-8?B?T25uYnVCOXBtNVM1dGZZb1kxVWN4NUp5aGx4clAxak5GaHJmNXRLSG5tQVkr?=
 =?utf-8?B?amd2eUVvUWZUSG8wblpWa0JqRUlTT0ZEM09sVTNsR2JtNlpCTW9zOENWU0lq?=
 =?utf-8?B?bjFNU1hKbFl1VE5wckZhL3EwYnBTaWtaYU9VSkQ0Q2x4anVzR2ZPTFFTZUlv?=
 =?utf-8?B?dXFCYjNPY2ljK21KdGt0UW9YdEFlUGROK2hlaUFMVGR2UEV2RmdnM0NOUDAz?=
 =?utf-8?B?TEt6VFJSd1RzM0N3RTl5dmR5OXFzSjdwUmRId3htWE05c0lPb2tvM21RckJn?=
 =?utf-8?B?ZWNKclN4MlJPdFdKZ0MrMncrNm9peGNyQUxib0hCWDdJTVo4MDE1dzc0emVs?=
 =?utf-8?B?WTFKN1RoTml0dkNBY1BKMGFYV2JSaWZMSnBwSGswalpNTlE0NUcyVVc5ZDIr?=
 =?utf-8?Q?AVVu3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUJscjZQK3poZFhpT20wNEV6cVg1bzZtdFVvQWVJcDJiRUFKNHJLSHRxYmVV?=
 =?utf-8?B?UVVsVFhSNStTYktFeHl5UjRVcVNuWGdndC9Ebnh0UTBYOTVTUnhDZElIdWUv?=
 =?utf-8?B?bEppcVNtYmk2RnZ5Z2l2QUdaWUVldEZjYy85YzNWNTRrZUYrdWM3ZTF3bVNp?=
 =?utf-8?B?QjdlYldCK1RoRjFGWGtPMDRlS2tzTmowaU9yQjBQSWtFQ2owNnp1NDd2OFZk?=
 =?utf-8?B?M2NmMGhPdDdYaWtvZnRYQ1hDbDFONU1vT3RyWVRvak9YRWFOd2VqUDdBSXcz?=
 =?utf-8?B?TmxNbWFQck1ZMi9FSzV3Wi8yV2ljdUxSRlpPMXdnbmQwcmx3YXlsM3k4ZTgw?=
 =?utf-8?B?NFk4bG8yeHBnNitTNlAwSzZYMUdCTDZMQXJ3RlRLYU12cTFDQkZEVG8rQjFI?=
 =?utf-8?B?eFBpUTZ0RjIwRlNXMmd2MFZYTW5jZXJLL1RMekJ2MWRnRXdPUVdRRFJWVGha?=
 =?utf-8?B?YXd2OXN2b044ZWJ2eUhTSVFWTjdYeStoUWU1ZE5jUkhNRG52QUpGNm9ZL0pM?=
 =?utf-8?B?TlVTR25pUjZaZERuUkdDRnY2T3NuVmhHaDlYbWMwRlNqZGZXSHlpaE11UUIz?=
 =?utf-8?B?eCtWTVVrVjNCdXZ3OFdBZHJObk1lUXRMd2dMMGdxOGozUmhsZFdEcUthUFhX?=
 =?utf-8?B?VEpMbUJEN2t6MURRa1pjd0VsRngrWGR0MDBqYWsyM1RVZ0JBclY1RHFIbUpT?=
 =?utf-8?B?N0srR2IrL2xiRzFhMUtucCsvKysxaVNSTHhQL2ZjekFMZGpNZnZlTVJJUWY0?=
 =?utf-8?B?cUNudUpjYUtQNUFvd29SQjI0VzBBTmpaTlhSMEg0alZ5SXUyc3VvL3ZGTHNQ?=
 =?utf-8?B?TlkrVU1RUUJIUWM2Ni9OeVR4Z2dwc01hbVhQZklNUHY5ZGtOUXZ0TDJtZGpt?=
 =?utf-8?B?RVlDdGxXTWNyWi9mUHA4UWVvWG0zTmM4eWRkWU5NM2FBTk8vdUtNUk1YY3Zp?=
 =?utf-8?B?cE5KRDc3bjI4a2Zta2NrMjVCdVlqRjJrZWNra0xXWG9BK2NIU093V1ZRR01m?=
 =?utf-8?B?T2EyU2pCWHJGTWF1RXFWeGp2UzZqRjE2dVlWUUtiSDRud2VJb3h5YzB2QWs1?=
 =?utf-8?B?NUJTa2tZbDFiNFZMMjJZYktIM2VOaGtYZWIzS2VNSExYdy9MUEtNTkQ4R0E3?=
 =?utf-8?B?bGZLUGgySTFESXdRS3p3VjgrTml0dC9VWmdPTXBGWXBRT29lN2g1ZDEyQzhT?=
 =?utf-8?B?VWFNMU9YaEdLZ0RNcFFCWnEyaldITlhNcXd0U1ZvLzdycStUZHNldkl5eC82?=
 =?utf-8?B?OEN3emNFUkxEQlF1V1psdCt3cUtNQWo3N0RqZ3FNZUdFTml6bXZFaTNWZGJr?=
 =?utf-8?B?ZHZvOC9hQ3h3T2llbmJLdkdQK0lHQXpWWGdyM01VdS85ZVl2c1NzMVdpYXdL?=
 =?utf-8?B?NUNwdVF1ZGdVNEF5T21FVWc5dkFlN2NyNHBkT1pkMllFMU1XLzZuSmprRmRY?=
 =?utf-8?B?bExxK2NKL2prcGl3MTdlN1FsbGNoN2pTTytPa21ROTY2ODlhbmwwKzJHQkpt?=
 =?utf-8?B?c3AvYWlQNWlhNWV4QTJyQjQ3L3d6QXMyS1JCeVBPS0RuUlNObW90WWUxUDVN?=
 =?utf-8?B?aDFSVFpTRGJCMUtHWWxPdk9VMnp4TmQ4eVdTM0FWa2VIVnE1MWNteFZlcWh0?=
 =?utf-8?B?dDhyYjczaXNORjkrZFBNTXYwdDh1L01KWlgwQ25mL01ibU9rdXhrK3dlZDRv?=
 =?utf-8?B?Z1F5dHB0TUEzRGplb2szMHNXODNnSzBidUQ4VlRBUWFPSjhHdXNlSXh6eFVR?=
 =?utf-8?B?WGhJK1l6eC83WFo3Ym52ZFBZUFJXOUtZa05ITkh3b0tzOXlDSTNUUEt3ZjJv?=
 =?utf-8?B?R1NNNk1RSkoyaVpabXRVRWFWM0IrelJHV2ova1VnS0dQelhKaVp1NUZjNExF?=
 =?utf-8?B?aThRRXhoOU95TDh5R2RyeTZTRjRuTjAwUkxMektEMVNGU014eC9MRGZjQXNl?=
 =?utf-8?B?ckxDTHpTNW1FcGk2SmxQZHZnb2MrWTBlb0xCejhYN3ZXT0hGZ3hWemVwbzVQ?=
 =?utf-8?B?d3U5RDlrVHlFRTBGcmR3dHpCNVJRRnBPZ0F6eHNKdHVJVkFuaWtLd282eVJ4?=
 =?utf-8?B?dmF4ZGtKNzBFZWVTbGZsdmZna0NFK2o5Z1ZVWFNEYkNmdCswTnYrL1g5Qk9k?=
 =?utf-8?B?NmU2TnJVUFhNMEtnbStzbTQraTF0bXdjRHBUMWpXdlJGbUMrQUhIOTlPTXpK?=
 =?utf-8?B?bEVHYlVHd1I2WU5pTDhIRnVUNno0YmowbEp6VU82aVRsY1dWeFJKTHJ6QnVv?=
 =?utf-8?B?SlZWUFlmVlZHQlBQM2pnakFlbllsS2JMNWxzeExZMjUrRHJBcVIwUGpQL2RH?=
 =?utf-8?B?OTRxY1dEcWNGTndGSkNXVjQ0a1U0QTJ0WkpMZndLQ2Vkd2tqbDB5OVBwend0?=
 =?utf-8?Q?PglazgjEanOcm4JQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc50f8d4-9d6c-4c7d-a803-08de73ed21db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:39:04.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIRnfj0nnzKS5D0k8RQ5oYAJntefCfck7q8Qty8/vWFGKvVLagi9uFPNyxzWXxrX/7MNdk+/XpzN4nugH2Jjlo3Qu2XQY2e8LWMSmKVttA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-Proofpoint-GUID: cSQRMl3zUMZVwnyXCujWqYO2l0VKgD1p
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699e1a7c cx=c_pps
 a=VaBts2rfnB/nCs5PY8NajA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=p0WdMEafAAAA:8
 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=V-HivKD50y9nvJVbUTsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=9vtG_mT138Ff4Hzxp7UA:9
 a=1g2W-k0W0EV_UzjP:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-ORIG-GUID: cSQRMl3zUMZVwnyXCujWqYO2l0VKgD1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4OSBTYWx0ZWRfX+AhllU7kPvYI
 jcuidsAlmKioV/mSNaY33m0INuQ7HupeNIcfWNyoTubOT+dwHV2cij9EaiyS3sUaXzwnCO9DPb4
 trQYkl3RB9i10WCXAkcstkTwawmkZReFoZuTDf1zeXFeh/WwwOjGvdQBpNNiF3qQmA02miIJ9u/
 CNAEdBJF1eSEPAQZry/SXhGOPIFE4gNEpQWCNBKG5u28BjGAmtDpchNmXY0R14Pd6Fhg0DZCeCg
 PQ0+Jjqj/Jf1CBZuJg7mQP2HwtgheLuYf3hvMMEIYi83BYJy29FjygJCWTqP1bW1+A0EHm2M25I
 9da9G1M3mrcWhiUwqqGJGyMnH8z9ILYm3IM2MvRqtMAExW54MWyo/K3mTBjaF6EeUpk+y713yid
 otNq9h2AbLG/m4mqj01+gnVsGTq0Mh1hixDkJddb5/M5DzOnWkQK58lxjKBG/1/4+zAhzaS6f6e
 Xk3eLzCLaEjLVJZuSiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231905

--------------kXyeyKbP0F5QL24RLzqmRTw3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61O8IKEl3609669

On 2026-02-18 1:41 p.m., Auto Upgrade Helper via lists.openembedded.org=20
wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *nettle* to *4.0* h=
as Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
In case anyone else starts to look at this the upgrade,
I think it's blocked by a sha.h dependency in gnutls-3.8.12 (latest),=C2=A0=
 (1)

There's a 3 week old bug to track the problem:

https://gitlab.com/gnutls/gnutls/-/issues?sort=3Dcreated_date&state=3Dope=
ned&search=3Dnettle&first_page_size=3D20&show=3DeyJpaWQiOiIxNzkxIiwiZnVsb=
F9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9


so the nettle-4.0 upgrade (2) may have to wait for the next YP dev cycle.


../Randy

1)

| libtool: compile:=C2=A0 gcc -DHAVE_CONFIG_H -I.=20
-I../../../../sources/gnutls-3.8.12/lib/accelerated/x86 -I../../..=20
-DGNUTLS_BUILDING_LIB=3D1=20
-I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../../gl=20
-I./../../../gl=20
-I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../includes=20
-I./../../includes=20
-I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../=20
-I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../=20
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native=
/3.8.12/recipe-sysroot-native/usr/include=20
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.1=
2/recipe-sysroot-native/usr/include=20
-Wtype-limits -fanalyzer -Wall -Wbad-function-cast -Wcast-align=3Dstrict=20
-Wdate-time -Wdisabled-optimization -Wdouble-promotion=20
-Wduplicated-branches -Wduplicated-cond -Wextra -Winit-self=20
-Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs=20
-Wmissing-prototypes -Wnested-externs -Wnull-dereference=20
-Wold-style-definition -Wopenmp-simd -Wpacked -Wpointer-arith -Wshadow=20
-Wstrict-prototypes -Wsuggest-attribute=3Dcold -Wsuggest-attribute=3Dform=
at=20
-Wsuggest-attribute=3Dmalloc -Wsuggest-final-methods -Wsuggest-final-type=
s=20
-Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas=20
-Wunused-macros -Wvariadic-macros -Wvector-operation-performance=20
-Wwrite-strings -Warray-bounds=3D2 -Wattribute-alias=3D2 -Wformat-overflo=
w=3D2=20
-Wformat=3D2 -Wformat-truncation=3D2 -Wimplicit-fallthrough=3D5=20
-Wshift-overflow=3D2 -Wunused-const-variable=3D2 -Wvla-larger-than=3D4031=
=20
-Wno-analyzer-malloc-leak -Wno-missing-field-initializers=20
-Wno-unused-parameter -Wno-format-truncation -Wimplicit-fallthrough=3D2=20
-Wabi=3D11 -fdiagnostics-show-option -fno-builtin-strcmp=20
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.1=
2/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.1=
2/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.1=
2/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
-DASM_X86_64 -DASM_X86=20
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native=
/3.8.12/recipe-sysroot-native/usr/include=20
-O2 -pipe -c=20
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-xts-x86-aesni.c=
=20
-fPIC -DPIC -o .libs/aes-xts-x86-aesni.o
| libtool: compile:=C2=A0 gcc=20
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native=
/3.8.12/recipe-sysroot-native/usr/include=20
-O2 -pipe -c=20
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/elf/sha256-ssse3-x8=
6_64.s=20
-fPIC -DPIC -o elf/.libs/sha256-ssse3-x86_64.o
| In file included from=20
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-cbc-x86-ssse3.c=
:34:
| ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86.h:4:10:=20
fatal error: nettle/sha.h: No such file or directory
|=C2=A0 =C2=A0 =C2=A04 | #include <nettle/sha.h>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~=
~~~~~
| compilation terminated.
|=20
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86-ssse3.c:28:=
10:=20
fatal error: nettle/sha.h: No such file or directory
|=C2=A0 =C2=A0 28 | #include <nettle/sha.h>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~=
~~~~~


2)

nettle patch in progress is an easy update:


 From 9ceab42c2ff568c2f770817cef6b7192e245a2e3 Mon Sep 17 00:00:00 2001
From: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Tue, 24 Feb 2026 16:06:22 -0500
Subject: [PATCH] nettle: upgrade 3.10.2 -> 4.0

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html

license change whitespace and http -> https

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 =C2=A0.../nettle/{nettle_3.10.2.bb =3D> nettle_4.0.bb} | 4 ++--
 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
 =C2=A0rename meta/recipes-support/nettle/{nettle_3.10.2.bb =3D> nettle_4=
.0.bb}=20
(93%)

diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb=20
b/meta/recipes-support/nettle/nettle_4.0.bb
similarity index 93%
rename from meta/recipes-support/nettle/nettle_3.10.2.bb
rename to meta/recipes-support/nettle/nettle_4.0.bb
index e651f68cb9..2156a10c00 100644
--- a/meta/recipes-support/nettle/nettle_3.10.2.bb
+++ b/meta/recipes-support/nettle/nettle_4.0.bb
@@ -7,7 +7,7 @@ context-independent set of cryptographic algorithms"
 =C2=A0SECTION =3D "libs"
 =C2=A0LICENSE =3D "LGPL-3.0-or-later | GPL-2.0-or-later"

-LIC_FILES_CHKSUM =3D=20
"file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
+LIC_FILES_CHKSUM =3D=20
"file://COPYING.LESSERv3;md5=3D3000208d539ec061b899bce1d9ce9404 \
file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
file://serpent-decrypt.c;beginline=3D14;endline=3D36;md5=3Dca0d220bc413e1=
842ecc507690ce416e=20
\
file://serpent-set-key.c;beginline=3D14;endline=3D36;md5=3Dca0d220bc413e1=
842ecc507690ce416e"
@@ -20,7 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
file://check-header-files-of-openssl-only-if-enable_.patch \
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "

-SRC_URI[sha256sum] =3D=20
"fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5"
+SRC_URI[sha256sum] =3D=20
"3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094"

 =C2=A0UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\.tar"

--=20
2.34.1


--=20
# Randy MacLeod
# Wind River Linux

--------------kXyeyKbP0F5QL24RLzqmRTw3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-02-18 1:41 p.m., Auto Upgrade
      Helper via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com">
      <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nettle* to *4.0* has Failed(do_compile).

Detailed error information:

do_compile failed</pre>
    </blockquote>
    In case anyone else starts to look at this the upgrade,&nbsp;<br>
    I think it's blocked by a sha.h dependency in gnutls-3.8.12
    (latest),&nbsp; (1)<br>
    <br>
    There's a 3 week old bug to track the problem:<br>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/issues?sort=created_date&amp;state=opened&amp;search=nettle&amp;first_page_size=20&amp;show=eyJpaWQiOiIxNzkxIiwiZnVsbF9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9">https://gitlab.com/gnutls/gnutls/-/issues?sort=created_date&amp;state=opened&amp;search=nettle&amp;first_page_size=20&amp;show=eyJpaWQiOiIxNzkxIiwiZnVsbF9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9</a></p>
    <p><br>
    </p>
    <p>so the nettle-4.0 upgrade (2) may have to wait for the next YP
      dev cycle.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p>1)</p>
    <p>| libtool: compile:&nbsp; gcc -DHAVE_CONFIG_H -I.
      -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86 -I../../..
      -DGNUTLS_BUILDING_LIB=1
      -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../../gl
      -I./../../../gl
      -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../includes
      -I./../../includes
      -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../
      -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
      -Wtype-limits -fanalyzer -Wall -Wbad-function-cast
      -Wcast-align=strict -Wdate-time -Wdisabled-optimization
      -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra
      -Winit-self -Winvalid-pch -Wlogical-op -Wmissing-declarations
      -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs
      -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Wpacked
      -Wpointer-arith -Wshadow -Wstrict-prototypes
      -Wsuggest-attribute=cold -Wsuggest-attribute=format
      -Wsuggest-attribute=malloc -Wsuggest-final-methods
      -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized
      -Wunknown-pragmas -Wunused-macros -Wvariadic-macros
      -Wvector-operation-performance -Wwrite-strings -Warray-bounds=2
      -Wattribute-alias=2 -Wformat-overflow=2 -Wformat=2
      -Wformat-truncation=2 -Wimplicit-fallthrough=5 -Wshift-overflow=2
      -Wunused-const-variable=2 -Wvla-larger-than=4031
      -Wno-analyzer-malloc-leak -Wno-missing-field-initializers
      -Wno-unused-parameter -Wno-format-truncation
      -Wimplicit-fallthrough=2 -Wabi=11 -fdiagnostics-show-option
      -fno-builtin-strcmp
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
      -DASM_X86_64 -DASM_X86
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
      -O2 -pipe -c
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-xts-x86-aesni.c&nbsp;
      -fPIC -DPIC -o .libs/aes-xts-x86-aesni.o<br>
      | libtool: compile:&nbsp; gcc
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
      -O2 -pipe -c
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/elf/sha256-ssse3-x86_64.s&nbsp;
      -fPIC -DPIC -o elf/.libs/sha256-ssse3-x86_64.o<br>
      | In file included from
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-cbc-x86-ssse3.c:34:<br>
      |
      ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86.h:4:10:
      fatal error: nettle/sha.h: No such file or directory<br>
      |&nbsp; &nbsp; &nbsp;4 | #include &lt;nettle/sha.h&gt;<br>
      |&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~~~~~~~<br>
      | compilation terminated.<br>
      |
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86-ssse3.c:28:10:
      fatal error: nettle/sha.h: No such file or directory<br>
      |&nbsp; &nbsp; 28 | #include &lt;nettle/sha.h&gt;<br>
      |&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~~~~~~~<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>2)</p>
    <p>nettle patch in progress is an easy update:</p>
    <p><br>
    </p>
    <p>From 9ceab42c2ff568c2f770817cef6b7192e245a2e3 Mon Sep 17 00:00:00
      2001<br>
      From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
      Date: Tue, 24 Feb 2026 16:06:22 -0500<br>
      Subject: [PATCH] nettle: upgrade 3.10.2 -&gt; 4.0<br>
      <br>
      Release notes:<br>
      &nbsp;
      &nbsp;<a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html">https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html</a><br>
      <br>
      license change whitespace and http -&gt; https<br>
      <br>
      Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
      ---<br>
      &nbsp;.../nettle/{nettle_3.10.2.bb =&gt; nettle_4.0.bb}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      | 4 ++--<br>
      &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
      &nbsp;rename meta/recipes-support/nettle/{nettle_3.10.2.bb =&gt;
      nettle_4.0.bb} (93%)<br>
      <br>
      diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb
      b/meta/recipes-support/nettle/nettle_4.0.bb<br>
      similarity index 93%<br>
      rename from meta/recipes-support/nettle/nettle_3.10.2.bb<br>
      rename to meta/recipes-support/nettle/nettle_4.0.bb<br>
      index e651f68cb9..2156a10c00 100644<br>
      --- a/meta/recipes-support/nettle/nettle_3.10.2.bb<br>
      +++ b/meta/recipes-support/nettle/nettle_4.0.bb<br>
      @@ -7,7 +7,7 @@ context-independent set of cryptographic
      algorithms&quot;<br>
      &nbsp;SECTION = &quot;libs&quot;<br>
      &nbsp;LICENSE = &quot;LGPL-3.0-or-later | GPL-2.0-or-later&quot;<br>
      &nbsp;<br>
      -LIC_FILES_CHKSUM =
      &quot;<a class="moz-txt-link-freetext" href="file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6">file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6</a> \<br>
      +LIC_FILES_CHKSUM =
      &quot;<a class="moz-txt-link-freetext" href="file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404">file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404</a> \<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      &nbsp;<a class="moz-txt-link-freetext" href="file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a> \<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;<a class="moz-txt-link-freetext" href="file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e">file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e</a>
      \<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;<a class="moz-txt-link-freetext" href="file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e">file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e</a>&quot;<br>
      @@ -20,7 +20,7 @@ SRC_URI = &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz \<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      <a class="moz-txt-link-freetext" href="file://check-header-files-of-openssl-only-if-enable_.patch">file://check-header-files-of-openssl-only-if-enable_.patch</a> \<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
      &nbsp;<br>
      -SRC_URI[sha256sum] =
      &quot;fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5&quot;<br>
      +SRC_URI[sha256sum] =
      &quot;3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094&quot;<br>
      &nbsp;<br>
      &nbsp;UPSTREAM_CHECK_REGEX = &quot;nettle-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;<br>
      &nbsp;<br>
      --&nbsp;<br>
      2.34.1<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------kXyeyKbP0F5QL24RLzqmRTw3--

