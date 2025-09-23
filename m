Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E2ECAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:15:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15347.1758629720451428949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=O5X3wQXt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13614b0c69=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58NBQSbr2758209
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B/yqm9yXV1d6pK3HGbB/lD6eo/MpEdRuakUohlc8z/8=; b=
	O5X3wQXtQC6ZDpOSz+m1g5FeqajU+OAjUwnViw22a0ys7oMbZP33rVW2a6IziO6A
	enTQGb3D8/85fTkpRD+BXJMBjgPC2eSRYdM6kRufMstKRjmzb8IRhUf8TagmnIZu
	u2I3PJUW0WHU/+9PgmqIjcHATL+Jpau/lc7Wl10iXDw/6k6gWhfCnJbSt9ifSr1O
	v3o4gaHkBVQVbMsAXq/aYmhXZKcxbOxuM/S+e9uy8m5O2MhTpoT8UjQM9/WG+jJS
	9qADk5mJRCvu/ilzsh6virOyAys6lE3YjnLnltYVx/Ttb6QkHnFFvoQklRVH816+
	xutSsrVvxwjDLbjLaTzKrQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1k4jb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 12:15:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl4N9g1YHfe++5iS3K7BAP4Z2DU67E2pM9QabnM2V8blmY4MW1AQIIjsqbQBfSZy2xyADu9pRE9Q3gG2m4ma2XoNJJtQO3Vru8TMjl8W3EMMpxGzLpsnD7eAgriYFipt7Yl/+k9XBLzseFKnpTggmnb3lZ47Cs7oVFFKfHCWRuZZi20BWz7sP9UGtKy8ZpVtU5KrYKa6ZkucdE51MUgR10DAu6iXYIY45pjIwZviG5ZugAvA3hEDScx5v58XceQqvDsd0wqX+Wuecw7BscHk5sudbCmY0x2nKIKRh0v0SLGVI9XeDXy8QogB29/nDbVEHboSnjeK5ismBGZvSJXJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/yqm9yXV1d6pK3HGbB/lD6eo/MpEdRuakUohlc8z/8=;
 b=pEHCAB8DG+nmrG+0kIgrLzUQGK/OL9krFYn3mlX+FPjeAcUhNn7wzkK1y7eMYKE2AupkG5AE6re/LcwJnF9FcgX2XwRazl8+nYwnZ95ieorYQJ7y0vbsOVxXqDdxKs0QsHV5zbN4oJcZxFSf9lKjBOun5WKn8kR/tW4b6OukjJh6niZyrWdDgfRpHZPw3fgvQJ7ETmFRreT+p24rB9sWgdv3uaz5B/bvVMqffXidJe1/mIty7ld0/FKlCfH3bP1QFrAGEhCgclJd57OgyLgwrbxw8ICYa85EssDjjP8r7YexOtvjr7U34SahrHyVqTgIs6798Vw87p03c1WBoQVMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 12:15:16 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 12:15:15 +0000
Message-ID: <d12886ad-409d-469e-b037-0590818d52c8@windriver.com>
Date: Tue, 23 Sep 2025 17:44:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/5] toolchain-scripts.bbclass: Support
 target-specific environment setup scripts
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy" <randy.macleod@windriver.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
 <20250915102750.3298492-2-Harish.Sadineni@windriver.com>
 <515EC6BC-D6C8-4B16-B99B-A3DF3FAB66A3@arm.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <515EC6BC-D6C8-4B16-B99B-A3DF3FAB66A3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: d2018c87-afde-4c81-5a86-08ddfa9ad962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|14125299003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZG51M290TzNoQzU1N1NIeW9FTTFIaTB4NmpYRXBPZGpqclBzd0UvRzRyVmJz?=
 =?utf-8?B?OHFrcUZrVis3R2NoKy9ib1JjSnM3RXdXRFB0UHVuN0R0RDZmTUV6NnNGZTFq?=
 =?utf-8?B?Z3pQWGJ3MEZIajhGQlBnbjAydmI0RW1KZGlnOXZZQ2lwSU0yMlRKcndQYlBo?=
 =?utf-8?B?eHNUa1ZWTVBvbFNqLzNZTGh2Q2Q5WThuL285N2VGaHVMbGFhMFdEdWhMUTFo?=
 =?utf-8?B?NkVPMU93aExkTWhkQlRNTzA2bFV3Z3IxOVN3VDZYQmhpVGxQWm11Tlova2VF?=
 =?utf-8?B?S0c3UHpTTlVpRndueHJ4ZG92TUVPM3M5dWFlWmxoT3o5am5UTU1TSFJDUTgr?=
 =?utf-8?B?VDJGSDNMR0RyVlVUOTdjcGZ4KzVxODFjdVU2S0txMFNvZ1dlVW0za3Z0NkE3?=
 =?utf-8?B?KzFLS2pWTDhLem9naU9UUDJXdlNacUhnZG94UkhYcDZFUmdDMEpHUVFNaEtX?=
 =?utf-8?B?eXIrNW41dU1HV1h5cU9aMmpVNWdGbFEzRHAvYlVHUTQ0b0hxeUlGTnVXZm1E?=
 =?utf-8?B?YTkyeGthNFg3QjlNMDBvdmFMUEFIVDh1MWNBa25IREQvSzJTbGkyMThiRzBM?=
 =?utf-8?B?aHczcE9RdGxXRnFrZndNSjdvN3NGR0d4ZWJrZVMvRDlCQ2dhNTNNRzQ5S2JM?=
 =?utf-8?B?bDFMcjZPVWdOd3lOblY1dGp1ZjQ5cjR0cWhXYUV1QXFRU01DK3dDWGwxRkJM?=
 =?utf-8?B?Q2Y1V0FhS1Y1VkxKVWhOdHkwZjRxbUZkY3pxSi9DcWZLNWtwZHpwUGJTS0lD?=
 =?utf-8?B?Um1WWTlHWGJ6WVoyeUJsS09rTVJlMWw4dWNhYVZ4RUMwMFg0N3RuSjBFQnBJ?=
 =?utf-8?B?Y3VDdEYxOG1PSWl0aFU3UW1ENTNwRGtBWlhhb1JDaGxwaUNaMi9GZ2RkVDY4?=
 =?utf-8?B?Z2ZDcHRaQVdvQ2Fybm5sWlltWHBTZmNCTzJLVDBPNGNHUnhBSVAwODk3a3gv?=
 =?utf-8?B?WXM5VDJJSnNxSUYvMUhuMTR0SXRpYWtnMTN3cVgyU0JHVUMyMzlvdG9vVGdV?=
 =?utf-8?B?Z2FtbENaRjBsK3o3eU4zclQvRWsxbnZ6WlgvYTJxU1hWQkY3K203SXFkVFFu?=
 =?utf-8?B?bDhkYWZlL2xIVU14MGNoWGhqd040b2k3Q3BpVUd5Mzg3U2EyVTlMeDZPNGZx?=
 =?utf-8?B?a2o2VVAybmpjaE54QnVtQzA5V3hPeVRORjQyVmlNaUFCUG5SMldISjk4Rzdq?=
 =?utf-8?B?MGo1bGJRMVVQMktQYTNTWVd5VXNFVHVQRWluU0lWempkblo0WGJMOFN3ZzJB?=
 =?utf-8?B?OTlPSkhkT0xsU2w4bmFRTGV3N2twNXlGT0U3d3hZR01HOVlhcW9wRnJFWVlQ?=
 =?utf-8?B?cjVqYUM4Y2VWYVpxSTJtdGZQbFhTeWRZVGM4Vk9WMjg5ZndRR0RLQlVrV1Vi?=
 =?utf-8?B?ZGVkNTZOZzc0R1crTUtLSFA2dHdmR3hOVzRGdG42a1hiTXAyZiswNWcxYWxB?=
 =?utf-8?B?Tks3TmU4Rlhac1VoeUNROGJkN1FaemRsMkZFRmlSSHJVN2NoMkFHMUxycTRl?=
 =?utf-8?B?YUd0bklLM3N1Q2lTdEIzZCtDaGgvL1BFSVZGMTVySEZsQ2VKdkphckZXbjkw?=
 =?utf-8?B?TUhYWldWZ3ZyeUNBRkpCR21kejZ0S2cyTnI1cXEyTXJRTE9ncmRmUnhTTk93?=
 =?utf-8?B?Szc4K1R6WmZwNllYcGdMUmxpT0JZcVVkTzVaUEwxZHB3VnhRK1Rsa0NHTVRH?=
 =?utf-8?B?L1BEQ2hGYWRSQ0RUeFBpbHd1RS9pZmQ3ZEhoZ3lmVDVjS3NVVEI5b0swMFhC?=
 =?utf-8?B?WURSQU01UlF2Nkd1MDJHUUNQT1BTYkJqOFlnLzlWeVpsWGw3eXljeGErWTVp?=
 =?utf-8?B?ZWkza3JwZHdYdGorblBlMHBqdDFGczh6eTljb3NMdkQ5dnFyYlJ1N2x3K1lG?=
 =?utf-8?B?VXF3eHN3ajFhV3VxTGF2ekhVZk1qcHB3OWRjSk1yVDBFOVp2SDVuMVhGSlNm?=
 =?utf-8?Q?6v5pJCnGyucbLnhqP2u8yJiW6tIwjsRg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(14125299003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTVqN29manQxOVJGcWxSbndqTXNjWlJ3dzZyUnhYNHRHdkV0aWFzcFh2cHJH?=
 =?utf-8?B?LzJ5RllnaE5lSU9mWkhyWFpCdFE1NVlGcE1pc2t6VTV4ejhBQ1FQZFkrMWQw?=
 =?utf-8?B?aHRVUTlCdFJCOWx2Tm1vUWN0dkdCR0pkc0gzQ0plZWt1bDZFVkthMnQ0TTJu?=
 =?utf-8?B?S1E5RFU3bzdOQldXSElmT2lBZksxVkVVUUN0cndoYVNYbU5DLzRpT3pZNWgx?=
 =?utf-8?B?VUVnQVN5Z1ZOME5XUWpKM2JyRFFFVU5pcDJ1d0M3SEpNOUZFaXNsSGJwUzcx?=
 =?utf-8?B?b0I0WkNaUDFqNHEyWHBrTzZxbE1tRkFpR05ObVlBRHVrUnBkY1c4bzVtdlZ1?=
 =?utf-8?B?R3h2RnJSUHk4eEpNSXp3NUtCdDcwbGJTY0J4b0gxc1N0SEh5QzBZNEp5RE41?=
 =?utf-8?B?SzdCTVd2cTk0OTF4RzM5UGt6Zm5GVW5SdkVYQnBjS3NMbXU0RGhsK3llUjNX?=
 =?utf-8?B?SWk1WVdCOUxOYThqdjBIR2lUdWtxNDRTRlVSUk8zd2U3aUxnVUFJWDBGSlh3?=
 =?utf-8?B?MmptZ0pxMm9QK3U5QlBWVEUwZytTa1AwNi9qdisvVWhJdXNobzhSNW4ySm9z?=
 =?utf-8?B?MXlBNmpwRUxITjlINEdFODYranVtOFlKQ25CZ0hXSENsQzkreXd5NFRXVlVE?=
 =?utf-8?B?ZFEvSStPQmxITGwzQWhOVEtDQWN0ODVmYys0UUN5cTdkOXYvUk83RWVET0xq?=
 =?utf-8?B?M29US3FYd3BZTTZsd2o4TVBuc25HREUyWDRGaEZHTkx5SUJCZnpXLzV6dThW?=
 =?utf-8?B?S1d4U1Axa0FSc2FMc1NwZm5xeExBUTlxemIzaVA0aGpJbExkaHRSYTZIUnBj?=
 =?utf-8?B?MElucS9pYzR0Qk03WWFGZTdWTlBmM0tnT2IwY21NSVFXdy9uV0UwSEQvOWpx?=
 =?utf-8?B?ZFE4ZGlNaFJkcElVenRKNXhpQ2hiK2RBSDdQcWhQNmJRdnFHMTF2bnE0b1NX?=
 =?utf-8?B?UUxENE9hZ3M5MFFsaVNqaXVCZWd6eVBzbTBMV05IbHZtRFBiWUs5RzlCWHB5?=
 =?utf-8?B?aFkyZWorRUNSQlJmU1d6YXp2RThheWxoQ2phb3lBeUp4Z3ZUa2RpdGdZTldk?=
 =?utf-8?B?ZDgydVZ4eXVEdU9jRVVnZjNNenlYOFJPeGJpelI4dFNIbm54NVZnU1Z2dERa?=
 =?utf-8?B?VHpqWHNHM1d3cTkraHZ4NUtOcFd0ZkNLMjVCSVRwNU9UanNCOXZDZnRkWEZR?=
 =?utf-8?B?K2V0OEdpbnhueEd4b01Ob2wyYys2UjlJa0RtalFUVmROQ1dtcEtNRTU5ODNS?=
 =?utf-8?B?ZGdIOEdHclUyMmh3THc0MklCT3dRUUo1UzZDdG9iT3Fjc3F6czBpZ2gzWDFk?=
 =?utf-8?B?aS9SZk5zQ09IWGFBdnkva2tVNFhrT0lkbjhWSzduMEs4Vkh1NUJaZVUyVVNz?=
 =?utf-8?B?azlteTZiTlIxOHlKODV2TmF6bU1tNngwNE50b3dFanA5QWNaYlg3UVZpWGlC?=
 =?utf-8?B?anR3dWVSZGhGeFJPVWNYYTVBSFg1eS9vQ0owbysxQVZKNzNQbkg1MllETDhm?=
 =?utf-8?B?anR0UXF1dUJBY3NLWUVZekFXd2YwWFdYV1dGUWpIU2t5dzZQeVlFc1ljTERw?=
 =?utf-8?B?dzdUMWFOcDBPQ2lTWVprZ2Z6YTRGSTVBa0lsMWlXcDJyUjZFK3NaZUZ6eU5a?=
 =?utf-8?B?bEJOYXk1RGFpNnErNEtaRUZpVVZLNWp1eFlqZDZrMG1sblBzMFRnZGZCNDh2?=
 =?utf-8?B?NEpSTTMyczVlZ3lWZXA3NXZ2TXc3cHV3dlYwdHFhUDhyNEp0ZnF6dkpETC9l?=
 =?utf-8?B?OHVCVnZnSjdjTWVFWDBGMHZMK01TTWFVVnI2enFqTzhQQnhybGxneE8xdkxS?=
 =?utf-8?B?cCtsbFhnS2s4NFlDVFpKcDl0MGZlZnNpQk9JcytVYzZxeW9ZSmM3V3JJTVBt?=
 =?utf-8?B?UjB3TVpicmZFQmJ4a3YyK0Q4NXFZTStuTGxvOWVCQnBuMm53TG42ZXY3L042?=
 =?utf-8?B?cEVNL3ZteDRJVXlaWENYcnJ6VG8xdnd0QnNWMUVPa1JxTDJiNlhHYWxYVFBT?=
 =?utf-8?B?YUFTUGlIczZaTGg2a2V2MGVXNTM5WHNvT2FuQnlWOFVpNU5QV2RxV1dNRmhx?=
 =?utf-8?B?M0hTVk0yamxUTHRtQ25tb1FxUEs3Y0p5YWMyUitMNzY5YUxyKy9Xckdsd1dx?=
 =?utf-8?B?OFBYSWVtYWU3b1lxTE1WL1BMaXdoSEZSWlljM2pvSUVEaTdJbkNzcU1jUExF?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2018c87-afde-4c81-5a86-08ddfa9ad962
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:15:15.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joDVBS6ALYsCKHA3tpW32nyqTJWkfdxQXwYUJ9gl+Lvf5Jv4jhBQHZASQpg4ZdWZDKw0WId0mepVMYAEwLqFBhYi5/PSVHJpcMbN86od9g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: DyKOz9_MvuyI-UzAhiVTr7Onuzl9HJEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXxye5DCnlgZV2
 OGtcChfUL8jQrcTCChrtF2Cq68cQt+QebN+4+25InNM6PLyprBgLjBZrrJV4LYXf6148EKyKTzn
 7QAomjYBhuKNXZTpcimzw+lxj6EDotZlhbfQpwBsHjZhk3MHX8818Stxs+VBuJSIfGLrtW6l1Ti
 ovAKvitrXUcLq0ihu0Qfc6QhKaPom5f78hUFTOaCv651opu9MEHvGsOlCCbutZJal/3B6/mmV66
 4DqkgyNJRX8RiOFA9bmM7fUYGZ/JmnWg7NMwhlYp6YBzZcsqk45JqQnsJp4VZ7AcMmExyLm56qE
 Sg0I6v/LQsR01vX7DM1AENyQffq954iKpATMjJQLqOMmDc0yB+FILtn4kSyXok=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d28f57 cx=c_pps
 a=xOYz1KraVtwoi73AohHYLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=h-ESkEqzAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3pNzz9yFsF42klarBtUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UotwztkNT2BMaZ9imtcu:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: uhO9Ondr0w6uLh6esK5ZjUhuCehvkfJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58NBQSbr2758209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223871


On 9/18/2025 9:29 PM, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 15 Sep 2025, at 11:27, Sadineni, Harish via lists.openembedded.org <=
Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> YOCTO [#15061]
>> Extending the SDK environment setup logic to also source scripts from =
a
>> target-specific directory `${TARGET_SYS}_environment-setup.d`, if it e=
xists.
>> +if [ -d "\$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d" ]=
; then
> We already have a target-specific directory already: populated by the t=
arget recipes.
>
> The SDKs are constructed in two parts:
>
> - The target recipes (eg libxml2) are used to build the target sysroot.=
 In this case, the same package that provides /usr/lib/libxml2.so <http:/=
/libxml2.so/> on the target will be used in the target sysroot to link ag=
ainst.
>
> - The nativesdk recipes (eg nativesdk-libxml2) are used to build the na=
tive sysroot (thus the name, native for the SDK).  So in this case, nativ=
esdk-libxml2 will provide the xmllint binary in the SDK.
>
> There should be _no_ connection between the target MACHINE and the nati=
vesdk recipes, just like there is no connection between target and native=
. As the native sysroot is populated from nativesdk recipes, they shouldn=
=E2=80=99t be able to know what the final target actually is.
>
> Where you have crossover there currently needs to be a little magic, fo=
r example the nativesdk-cmake recipe has an environment.d script that tak=
es the target configuration from the environment variables and generates =
CMake configuration.
Hi Ross,

Thanks for clarification, we referred how nativesdk-cmake recipe has=20
handling environment.d script(cmake.sh) it is Copying necessary files=20
into the SDK without expanding any values at build time but with rust.sh=20
and cargo.sh it will need to expand values at build time so we can't=20
adopt that.

And from your comments, we understand that target-specific components=20
should reside within the target sysroot, and only nativesdk components=20
should be placed in the native sysroot.

Based on this, we're now moving our ${TARGET_SYS}_environment-setup.d=20
directory to the target sysroot from native sysroot.

And now we observe the following target sysroots under sysroots=20
directory when using multilib:
x86_64-pokysdk-linux
x86-64-v3-poky-linux
x86-pokymllib32-linux

Is this what you are referring to, is our understanding correct with=20
this change?

Thanks,
Harish

>
> Ross

