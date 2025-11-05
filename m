Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32960CCF9E3
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 02:31:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3989.1762309874680717545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 18:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TiutwRl+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34047cfdc5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A51t1YX1813824
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 02:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=qWA79lxziBgWlhPgdwgH+v
	MLCbmdPh1yyUTngHnmvoA=; b=TiutwRl+uQdw08dU26YO+SfwrJhKIZxzIur9G2
	toK/1YHT5o+dpceP01Wi8xQy198vT+AHYnRURyA5QEsdGqdu5JGno5cmAQtOgmFX
	rIxrkaFwxhbs6scgKwzRWRGOJqUslK1f22g54DJ1F6FkgCMWfzeLG9MSGa0//Cef
	fLzlIPvE+KBTRQ0by1BOxPI/jCXqlOl3WVyOdt890ymujVB++vuSdvl1gSrUfuHS
	swTcXoe0OK5Fd2+XtuX0ik6zHZHX1Vb0QNCZamZ5D2egvfkICMd0xE/afeJ4EMpr
	GldF2EO75Nbql1eQYrLZAtjKgoEHbSakq4USl95CyawJDCLQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war80y2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 02:31:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbexQyB0H4HVW84z4itf/mUVImxKY8D0l+i6hjOLDXMlee8V/OuufpOaF3v9mjL6bijKsQ5RQwFCfPLpfwBFQHwD2ywzkzBs9m6wCTycsBYjzXsUrerW8i/678MomhaT+ez7lsdW7mq4d2wrWCW3WnzAiAZXyuePlxn0RHmDbYXOtQkp3vN7gn3hTXxO3AtD8aDo9gai6lOZESKF6dOk9xTSsuez1kvm8eY6o8gkvI09wqYbZ37swkmArMwa/QakjFsra8CvFGUR8S2sC+fr1RpKKp5NYdhFJuyD53Ct124nIyhn7L3KWw4nUMqqe4YiOHe0GYpvjmLHzu+G89XsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWA79lxziBgWlhPgdwgH+vMLCbmdPh1yyUTngHnmvoA=;
 b=X58OmNYRN53xAJ2SkKzqDDSJqXtMMly13NWnWFAC8eB/7evGmRc9gDyMO4jX8ZNgD2Z41yihLQXyQBKUR0418ekaoGUYPG64T4PQp2YpfoNkWzR5eQHWb5EX+GHt6Ou7AEUYkVoFEvPX6CorK8/1pzS5p8EbDrLw6aDs0aa8ncyLfK8ZDpZp5GmiA6lrK/v4OAfOxxAJKlhC6bXvkAcMO2bUO2SDjhkZd3zQDjgCoPcxzhw+lZiBztz9r3oF9ElDsm80ao+YUQNXAYWGD1ELCYkXzbrSEDg/l3yoyWHKAugNnPC/r70OyJCSdDU8RS7YlWqtmxfkOEdEEnszz1I5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 02:31:10 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 02:31:10 +0000
Content-Type: multipart/alternative;
 boundary="------------2meZbMF4YRvGT3dVS030Bbnr"
Message-ID: <2583876b-0d80-4ee1-9622-a2d387aad48c@windriver.com>
Date: Wed, 5 Nov 2025 10:31:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] libxml2: upgrade 2.14.6 -> 2.15.0
To: Gyorgy Sarvari <skandigraun@gmail.com>, hongxu.jia@eng.windriver.com,
        mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
References: <20251017071908.3574315-1-hongxu.jia@windriver.com>
 <20251017071908.3574315-2-hongxu.jia@windriver.com>
 <d83c4856-628a-4150-978a-d3ea5a107e2f@gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <d83c4856-628a-4150-978a-d3ea5a107e2f@gmail.com>
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ2PR11MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 73697c99-1b88-4fb9-1bfc-08de1c1361d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmE5VlNNWWc2a25wV2thbWZQT1NGSnFqSEE0NFRaakZ0Z2FvTElYamwwd1Zr?=
 =?utf-8?B?a3NYazJ6a2dxQlJvR2V1dTQrWHBrNXlNSlRhSlFDSzlFQmhtUEhlNlkvQm9M?=
 =?utf-8?B?ZmpKVWRuVHRSY3pjcVZmSk1HdFdoMVJOaklHVmIxWHRZYzFxS1RKbjVtZ01n?=
 =?utf-8?B?dFcwL0RWOUw3ejAveTVzNDU2WVBtOFhhVldqODdZL01xZEIzM3VMZHFveGwx?=
 =?utf-8?B?WXErMXl0ZlM2VXBWcEh6Q05HZ0V1UldpSlYyRnJiRWRhMXlEU1RGU3Y5Vzdr?=
 =?utf-8?B?cm84NkFnL3NRZWhWZEczckk3TXNTRmp6NDNjTDZ5b2E2bWpZL3hOWnF1K0J4?=
 =?utf-8?B?N2hjSTNPTUZRanlYSVZYOUxDcnl0RzZab0w0SS81bHVMZ0Y1MlNxRnZCSk5j?=
 =?utf-8?B?ZjdBblFSYzBqVVAybFVLSjF2M3pXeWRoTWI0T01MRXdCK3JPMGQvTFh0WWZs?=
 =?utf-8?B?Y21GWmh6MmdiYitvMDYvR1RxU2VtcWpBdURyYnRaK1FzeDl5R25XYi9Ca1Na?=
 =?utf-8?B?QVJsbVE4aW9WMmozajBJSkx3Q2JraDcxY1IvVFR0ZmM1c3pLdGwrcFJpMWZO?=
 =?utf-8?B?d3pmRnVsZlc3bm5DSDdMckpRSVBFU3VINER2WkY1bUpkdU9RekluS3Y1ZmZR?=
 =?utf-8?B?S00rMEw3eVdsQ3E4c3NDQklDZVBxWmZBaDExU0JYSHVvRktrTjhBblVrU2Ux?=
 =?utf-8?B?ZUxBcHNaQ0laT3hPNm41SW9VNDdkdnFwbFZrSlExVEVidkRUNWc3ekExd0Zh?=
 =?utf-8?B?RFg4VGd0T09vbnFUTk9QZ295b0J1V21mUGlZS1g4YlczQjF1SUpQbktKMmRD?=
 =?utf-8?B?Um5RanlUMVhLdFczNHQ5ck10dC9XcVFtZ1ZtVVBFcmtQZGs2diswb21JT3Uv?=
 =?utf-8?B?dDJRQUU0UnZORHd5NmZ5RERSNGFMUzh4RTJ5UXk1ZkM0N3o2OTU4RzRkaW81?=
 =?utf-8?B?YnlHemJhMi9hbnU0ZVp3SEhHa0M2NVFscys5ME15RlF1Q3FYSGJyNjNocHRw?=
 =?utf-8?B?SjNHQUtuZWhXZ0VlSHBwQkNlaDJuRGEwb3BueWNvbzlEM09XTE0vL1JkV3Jm?=
 =?utf-8?B?MGdEQlFYcjZBYW1jS1ZxZDdWbU5KWEh6S2Fra1NtejFmZzR2U1cxcUFhVVU4?=
 =?utf-8?B?Y1VMb1hTbWZ1SDZrb29MKzdLUnZURjlSSFlKRnVmaTlPdHJDMHdIb3R5WDMy?=
 =?utf-8?B?WkVtZXRWRTY0M0xubUhFaGpuQkk1d3MxdXg4cExlbzl4TzNESzRCSEhDbndL?=
 =?utf-8?B?c1llSGlLNlR3SUIzSW1wTHE0cVI0UXpWN2Y4eW5DLy9ZaGY1RGVwMXFQYWFV?=
 =?utf-8?B?TTNmYjdTUkhMRk1yOVpBUkRsZXVyU2lKU0luVUU3UUZwSWltZzJzQmFCdUpz?=
 =?utf-8?B?REVkZ3pJcXlRV1VnUU0rZjNoWUtkTTdZZE9lMS9EN2Rwd0FiQk5wUFBGaEp5?=
 =?utf-8?B?WFo3VFFxOUpuNE5FeTRDUUFQU3hTVzRVNkViS1V5cmlOK3lpbnh3K3BOazZq?=
 =?utf-8?B?RzR0OFNsVGdaUHFuN2g3dHZWVTFGalVTeVZocWFVb2xYNnZsMEFpeUQ5Rnd1?=
 =?utf-8?B?SHRua2pwT2ZCVjhheHlETjhXT1U4eUdpeW9vKyt0ZS9EYjlrazhOYzcvTUsr?=
 =?utf-8?B?aFR1R2FxcFpWN1JxV0g5ZkZ0R3I2WFp2akVPY3lRQVNjL0JYNE4rMFdqTjZK?=
 =?utf-8?B?ZWNWR0lwdnZIYjUvSkwvcnc0RDJpb0FobmhEUHNOcG1QeFowb0lYY3oydlIw?=
 =?utf-8?B?MmxSVDUwN2VuV0tROFdybDdBMjZ2dkFxbDBaTEdhM0lpWGZ4SDQrckVUWS9R?=
 =?utf-8?B?M0ZoWkJDVFVROW9GaTdIYldzV0xlSytMTGtIQ1laR0VGeVhUNmpaa0NoV1Y4?=
 =?utf-8?B?MnV4alZjODA3RlZpUGNBaitZaGhNa0RVUzVmbDNRL09FSW85YnR4UlVLaFp2?=
 =?utf-8?Q?9Mnn0oIewRA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlpVR0xMc3pUZUtRRzhkd01lSW5kbytmdi90R2hraWlZd1VMV0NjLzFtU1lx?=
 =?utf-8?B?U0h3SkRScWVrTWxySHFXdUEzODNIdnNXV0pvcXo3KzcwRm9FQWtVL2k4R21u?=
 =?utf-8?B?dko1eHBWbHUvMWM3dlZvUXJIUjlRR2RnY3ZJbWpNOUVtOXRTQlZqZmlCcDF3?=
 =?utf-8?B?QTBTbnRFWEdDVUtKMkRWL1ZnbGp6bEdOcW9DVXB0SlRmMGNpN2kvc0RmSU1N?=
 =?utf-8?B?bWZmWXFNaFZrTWkyRGhwZHZRdFBlRS9iVFVSSjJqQllsU2tSdTlLL3NkY3ZL?=
 =?utf-8?B?U1ZUTEhJZkluMWtwNGJzalpRQjBGY01DZVAxcXVNSWVPYldDQ2lPQmhIN3U3?=
 =?utf-8?B?Vkh5Vkl1TVVIRG5BOXZqcFdReGdMQ2hNTzh2Zlp2Uy81dVRhdVlOVEdsSW9w?=
 =?utf-8?B?OUxDcEIzU0ZOVkZiNEVJbEFRU0l2dnhTQ0pOV1JmT1RaOUxzNStlRUNrTFlM?=
 =?utf-8?B?YUE1V0RoVUpwRHRwWkkzNkg4VndqVCtObXdSVVphLy82UHVUNlk4MFdvVWVk?=
 =?utf-8?B?Z0hQbVdNVytwRitGa2MvZDkyeFlqRDg1TURtQTNmbDgwdmUwWCtZalFHc0dj?=
 =?utf-8?B?YUppay9oUStib01rMDFFTWo2N1BnNnFBbVI0NjlHRkMwL3p1ZXlMZGpBcUkz?=
 =?utf-8?B?UkVnTE4wdFVDVmtBRkgrdng3eTVvQ01ZUlJwWHRBVmJIOFJHL3lJQkNUMEQz?=
 =?utf-8?B?K3dKMzZqRERpUUoxSU9OeWNHVStsamgrY01HaDZ5ZGcvZE1qYTA1U1c3bm0v?=
 =?utf-8?B?RGxWK2VhK2FFZjJhU0Q3ZDJ6T2xmdFNYTzVlakxETEtNcVo5Y0N0czdXVlhy?=
 =?utf-8?B?Q2lXSXFuOWc2YXRHbTNub2FUZitwNm9Wc0MvRVUyMnVJcVdvZjZmMU1YT1lv?=
 =?utf-8?B?QzRzc2twT0g4MmRZUkIrSFYvRFp5am55MkE4a3N2Yi9WR3Jac3h4bUVPQmFK?=
 =?utf-8?B?aGl0ZHhFTW9pbzJ5eUtvNU5iWDgzTStpbzJ0R1o4WkUrZ2dseVlodDVDQllr?=
 =?utf-8?B?ZWkwNDZGSktCRHJxSVhOWWp1U0hTWlVGK3NtdXBVYzJCOENyaXJCS0NqR29N?=
 =?utf-8?B?NWl6TG9XM0N1R3hGbTlDaDNFQUR6ZnZRYURZb1AzeTFFTWRzQ2ZXbkV4ME1m?=
 =?utf-8?B?Qk5YeFlMa3F6cldraGJ5MzZmbUEvUnlhQXhFak1pZWdOSmtZT2tXQ2NCVGJp?=
 =?utf-8?B?TzRGejNXRmFQUkpmSEQ1eTdjb3llcyt2VGpGNitPU3N4aS83dWpscWVqNGht?=
 =?utf-8?B?RTZPbFhZUmZJMkZnbDdYNldaTlFqV0lEeW9PSmFBd1BNSmwzVDB1dkcrQlBK?=
 =?utf-8?B?STc1L21sTUxMcmhubTUremZlVFQzRUk3NzljSGJKU1lqOVdyaVhjcWUyMDFp?=
 =?utf-8?B?cVBBTlYyOHdFcUZSV2JMMXZkb1p3V0pzQW9YY05iYXlOalV6U25DcjNPaXlj?=
 =?utf-8?B?VDJXak9DMHFscWE1SlFkUkxjSGVIdGRoQ2g4VTVFU0pKMEpyS0VNRG9CbDV4?=
 =?utf-8?B?c0JqVm1uZmhKeXkvc1dIcWhpc3ozZWxFZjhtSnRwOFJrKytZRDMzTGZFU0tM?=
 =?utf-8?B?SWxScWdYeVpHKytObGg0UGJvL1R0dmtXazJwVlJtS3lFVk1EWXRWaVQ4WEZS?=
 =?utf-8?B?cUZ2TzVmdWh4UmMvOUdsM1VmbUZ5dkR6YUtHb2JCL0g0NS8rR3ZmcEdRU0Ji?=
 =?utf-8?B?dnhUOTlUNXRDSlV5Nmk4YW4wcmxPZnpoNUhEZHZiSE9NYWFnYkJuK1RZRkht?=
 =?utf-8?B?eEdKNGhFUnNBN242TEtXaHJQRmNCeDd1dG1zMUN2dTNDNFA2bkRka3BKNzky?=
 =?utf-8?B?a2hEWTNWSzZndnkrVS82NFkzbExNMGhadThHbmFXZ2Z2aFc1WGU0RFU5OEhp?=
 =?utf-8?B?UWJRemNQcjBiMzVBRjRJenFSUFNmSEtUeHFncEtsclpmb0NNVXljdDhybTVI?=
 =?utf-8?B?Wlo4WVZiYlNQNlhiSGxIUXkrdHR0a3Z2djBrL3dXYWxDc3pOaWRZdEFyT2Za?=
 =?utf-8?B?SFBHZC9sSVZMV09KRGlhN3pvSFBRQks0by91eFZUZHFhMmlBb3Qvc0RNbUNr?=
 =?utf-8?B?K1BVczNablJtdk1KUE4xY29SeHpaVDBIOGk1bEJkQnNZTE0yVkY4YUxnTGtC?=
 =?utf-8?B?UFRuamcwQlZlc0V1UVNmZVUxS3RyTHR0VFNWZWhqWmVubzJvU0lJa0wvakpB?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73697c99-1b88-4fb9-1bfc-08de1c1361d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 02:31:10.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHhYr7p8+JqhdAQqAKuDgp+jTYbXgyLiNJ2jKUqYrQn2yzCiy5Fh4EyEGVaqPsBpDJnZbUyxUQ91TBkXaNnUq0/X7W+5jvY1th9mCpbrrfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690ab6f1 cx=c_pps
 a=gd7JxMPBqN93mtTmHvcGFw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=Z5getJ8MAAAA:20 a=SSmOFEACAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8 a=EA_8yzcsl7V6LHdqMbYA:9
 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10 a=E3k6eB6KuMJFupH31GoA:9
 a=CbXXLlzobNMgaxh4:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNCBTYWx0ZWRfXy949Bd3Q74tb
 vXdOeFVqK/8+NHPr5v2DUHCkxyxNhAHBSXeZIdB0FfI9UK5QHA+95icOsNTZdEplax0IDXdo5LD
 TVSeET5IQg/V/AL1oLqpMhOdzfnOy+jaMFYaJHqNYzMjd8kqSKIWOfz0kAXXYhTVhGE9LmsVkVg
 +cnJ8MUres0ZFf8NWW6zAlXaWu9XHqH9PZ2VEL/PYS7AsBYeHbP/wz8IhXJliC13EKthlduDRlU
 hsie5QVd7ZQGk52RTK51leWbOzigMbfffU6ucApURlS8WIKq0ssiC90vyY5jgJFE4S4hdYS3WvN
 6drn1l7oHzq7/6Om2/8JLzrC3iAAQdB+7F2lJV0o9jB7cpdPGAvHuCqtSlGTD6i+hg/xWjAM0ak
 3efiZzlcxUY/d9ew98/a66gq5UPDpA==
X-Proofpoint-GUID: wjyjPRDz_wdaSZfV32OSNN7f8Hy69yB-
X-Proofpoint-ORIG-GUID: oub6l-rKo3vFR328XZCqi1sxy2tvLIAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 02:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225744

--------------2meZbMF4YRvGT3dVS030Bbnr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 22:53, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 10/17/25 09:19, hongxu via lists.openembedded.org wrote:
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
>> [1]https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
>> [2]https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
>> [3]https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
>> [4]https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
>> [5]https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   .../libxml/libxml2/install-tests.patch        | 20 ++++++++------
>>   meta/recipes-core/libxml/libxml2/run-ptest    |  7 -----
>>   .../{libxml2_2.14.6.bb => libxml2_2.15.0.bb}  | 26 +++++--------------
>>   3 files changed, 18 insertions(+), 35 deletions(-)
>>   rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (78%)
>>
>> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
>> index 4c1faa83cb..9269536af0 100644
>> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
>> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
>> @@ -1,34 +1,38 @@
>> -From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
>> +From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
>>   From: Ross Burton<ross.burton@arm.com>
>> -Date: Mon, 5 Dec 2022 17:02:32 +0000
>> +Date: Fri, 17 Oct 2025 14:15:36 +0800
>>   Subject: [PATCH] add yocto-specific install-ptest target
>>
>>   Add a target to install the test suite.
>>
>>   Upstream-Status: Inappropriate
>>   Signed-off-by: Ross Burton<ross.burton@arm.com>
>> +
>> +Do not install python test cases
>> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>>   ---
>> - Makefile.am | 10 ++++++++++
>> - 1 file changed, 10 insertions(+)
>> + Makefile.am | 8 ++++++++
>> + 1 file changed, 8 insertions(+)
>>
>>   diff --git a/Makefile.am b/Makefile.am
>> -index 6f98144..ecb3b54 100644
>> +index 19ec305..64bf28a 100644
>>   --- a/Makefile.am
>>   +++ b/Makefile.am
>> -@@ -26,6 +26,16 @@ check_PROGRAMS = \
>> +@@ -29,6 +29,14 @@ check_PROGRAMS = \
>>        testparser \
>>        testrecurse
>>
>>   +ptestdir=$(libexecdir)
>>   +install-test-data: $(check_PROGRAMS)
>> -+    install -d $(DESTDIR)$(ptestdir) $(DESTDIR)$(ptestdir)/python/
>>   +    for T in $(check_PROGRAMS); do \
>>   +            $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$T $(DESTDIR)$(ptestdir) ;\
>>   +    done
>>   +    cp -r $(srcdir)/test $(DESTDIR)$(ptestdir)
>>   +    cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
>> -+    cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
>>   +
>>    bin_PROGRAMS = xmllint
>>
>>    bin_SCRIPTS = xml2-config
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
>> index cbbdd5592f..868649240b 100755
>> --- a/meta/recipes-core/libxml/libxml2/run-ptest
>> +++ b/meta/recipes-core/libxml/libxml2/run-ptest
>> @@ -11,10 +11,3 @@ for T in $TESTS; do
>>       echo Running $T
>>       ./$T && echo PASS: $T || echo FAIL: $T
>>   done
>> -
>> -if test -d python/tests; then
>> -    cd python/tests
>> -    for T in *.py; do
>> -        python3 ./$T && echo PASS: $T || echo FAIL: $T
>> -    done
>> -fi
>> diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
>> similarity index 78%
>> rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
>> rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
>> index 6ed8760f4c..6dbe1c16fc 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
>> @@ -21,26 +21,18 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
>>              file://CVE-2025-6021.patch \
> I think this patch ( for CVE-2025-6021) can be dropped. Over time it was
> transformed from a CVE-patch into a "missing-header" patch, and the
> "missing-header" issue is also solved[1] in this version.
> (Sorry for necro-posting, but I just stumbled upon this, and the patch
> is still in staging)
>
> [1]:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/3773bb3f89426297dd82d8ad5998059898d5172a

OK, I will drop CVE-2025-6021.patch, v4 incoming

//Hongxu

>>              "
>>
>> -SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
>> +SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
>>   SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
>>
>>   CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
>>
>>   BINCONFIG = "${bindir}/xml2-config"
>>
>> -PACKAGECONFIG ??= "python"
>> -PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
>> -
>>   inherit autotools pkgconfig binconfig-disabled ptest
>>
>> -inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
>> -
>>   LDFLAGS:append:riscv64 ="${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' 
>> -fuse-ld=bfd', '', d)}"
>>
>> -RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
>> -
>> -RDEPENDS:${PN}-python +="${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
>> -
>> +RDEPENDS:${PN}-ptest += "bash make locale-base-en-us"
>>   RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
>>                                              glibc-gconv-ibm1141 \
>> @@ -49,10 +41,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
>>                                            "
>>
>>   # WARNING: zlib is required for RPM use
>> -EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
>> -EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
>> -EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
>> -EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
>> +EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n"
>> +EXTRA_OECONF:class-native = "--without-legacy --with-c14n --with-zlib"
>> +EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --with-zlib"
>> +EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --with-zlib"
>>
>>   python populate_packages:prepend () {
>>       # autonamer would call this libxml2-2, but we don't want that
>> @@ -61,11 +53,9 @@ python populate_packages:prepend () {
>>   }
>>
>>   PACKAGE_BEFORE_PN += "${PN}-utils"
>> -PACKAGES += "${PN}-python"
>>
>>   FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
>>   FILES:${PN}-utils = "${bindir}/*"
>> -FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
>>
>>   do_configure:prepend () {
>>        # executables take longer to package: these should not be executable
>> @@ -76,10 +66,6 @@ do_install_ptest () {
>>       oe_runmake DESTDIR=${D} ptestdir=${PTEST_PATH} install-test-data
>>
>>        cp -r ${S}/xmlconf ${D}${PTEST_PATH}
>> -
>> -    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
>> -        rm -rf ${D}${PTEST_DIR}/python
>> -    fi
>>   }
>>
>>   # with musl we need to enable icu support explicitly for these tests
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224998):https://lists.openembedded.org/g/openembedded-core/message/224998
>> Mute This Topic:https://lists.openembedded.org/mt/115803730/6084445
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

--------------2meZbMF4YRvGT3dVS030Bbnr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/4/25 22:53, Gyorgy Sarvari wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d83c4856-628a-4150-978a-d3ea5a107e2f@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 10/17/25 09:19, hongxu via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Due to upstream [Remove LZMA support][1], drop option --without-lzma

Due to upstream [disable python bindings by default][2] and are
planned to be removed in the 2.16 release[3][4]. If we still enable
python bindings by --with-python=yes, due to upstream [doc: Build docs
with Doxygen and xsltproc][5], build python binding requires doxygen
otherwise build will fail, and we do not provide doxygen in oe-core,
so remove python package directly.

Refresh install-tests.patch and run-ptest to not install python test
cases

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b">https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542">https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542</a>
[3] <a class="moz-txt-link-freetext" href="https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news">https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news</a>
[4] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/issues/891">https://gitlab.gnome.org/GNOME/libxml2/-/issues/891</a>
[5] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2">https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../libxml/libxml2/install-tests.patch        | 20 ++++++++------
 meta/recipes-core/libxml/libxml2/run-ptest    |  7 -----
 .../{libxml2_2.14.6.bb =&gt; libxml2_2.15.0.bb}  | 26 +++++--------------
 3 files changed, 18 insertions(+), 35 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb =&gt; libxml2_2.15.0.bb} (78%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 4c1faa83cb..9269536af0 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,34 +1,38 @@
-From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
+From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
-Date: Mon, 5 Dec 2022 17:02:32 +0000
+Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target

 Add a target to install the test suite.

 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
+
+Do not install python test cases
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
- Makefile.am | 10 ++++++++++
- 1 file changed, 10 insertions(+)
+ Makefile.am | 8 ++++++++
+ 1 file changed, 8 insertions(+)

 diff --git a/Makefile.am b/Makefile.am
-index 6f98144..ecb3b54 100644
+index 19ec305..64bf28a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
+@@ -29,6 +29,14 @@ check_PROGRAMS = \
      testparser \
      testrecurse

 +ptestdir=$(libexecdir)
 +install-test-data: $(check_PROGRAMS)
-+    install -d $(DESTDIR)$(ptestdir) $(DESTDIR)$(ptestdir)/python/
 +    for T in $(check_PROGRAMS); do \
 +            $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$T $(DESTDIR)$(ptestdir) ;\
 +    done
 +    cp -r $(srcdir)/test $(DESTDIR)$(ptestdir)
 +    cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
-+    cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
 +
  bin_PROGRAMS = xmllint

  bin_SCRIPTS = xml2-config
+--
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
index cbbdd5592f..868649240b 100755
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -11,10 +11,3 @@ for T in $TESTS; do
     echo Running $T
     ./$T &amp;&amp; echo PASS: $T || echo FAIL: $T
 done
-
-if test -d python/tests; then
-    cd python/tests
-    for T in *.py; do
-        python3 ./$T &amp;&amp; echo PASS: $T || echo FAIL: $T
-    done
-fi
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
similarity index 78%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
index 6ed8760f4c..6dbe1c16fc 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
@@ -21,26 +21,18 @@ SRC_URI += &quot;<a class="moz-txt-link-freetext" href="http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=$">http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=$</a>{BP};name=testt
            <a class="moz-txt-link-freetext" href="file://CVE-2025-6021.patch">file://CVE-2025-6021.patch</a> \
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this patch ( for CVE-2025-6021) can be dropped. Over time it was
transformed from a CVE-patch into a &quot;missing-header&quot; patch, and the
&quot;missing-header&quot; issue is also solved[1] in this version.
(Sorry for necro-posting, but I just stumbled upon this, and the patch
is still in staging)

[1]:
<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/3773bb3f89426297dd82d8ad5998059898d5172a">https://gitlab.gnome.org/GNOME/libxml2/-/commit/3773bb3f89426297dd82d8ad5998059898d5172a</a>
</pre>
    </blockquote>
    <p>OK, I will drop C<span style="white-space: pre-wrap">VE-2025-6021.patch</span>,
      v4 incoming</p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:d83c4856-628a-4150-978a-d3ea5a107e2f@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">            &quot;

-SRC_URI[archive.sha256sum] = &quot;7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a&quot;
+SRC_URI[archive.sha256sum] = &quot;5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561&quot;
 SRC_URI[testtar.sha256sum] = &quot;c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273&quot;

 CVE_STATUS[CVE-2025-6170] = &quot;fixed-version: fixed in version 2.14.5&quot;

 BINCONFIG = &quot;${bindir}/xml2-config&quot;

-PACKAGECONFIG ??= &quot;python&quot;
-PACKAGECONFIG[python] = &quot;--with-python=${PYTHON},--without-python,python3&quot;
-
 inherit autotools pkgconfig binconfig-disabled ptest

-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
-
 LDFLAGS:append:riscv64 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','ld-is-lldptest','-fuse-ld=bfd','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}&quot;</a>

-RDEPENDS:${PN}-ptest += &quot;bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}&quot;
-
-RDEPENDS:${PN}-python += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','python','python3-core','',d)}">&quot;${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}&quot;</a>
-
+RDEPENDS:${PN}-ptest += &quot;bash make locale-base-en-us&quot;
 RDEPENDS:${PN}-ptest:append:libc-musl = &quot; musl-locales&quot;
 RDEPENDS:${PN}-ptest:append:libc-glibc = &quot; glibc-gconv-ebcdic-us \
                                            glibc-gconv-ibm1141 \
@@ -49,10 +41,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = &quot; glibc-gconv-ebcdic-us \
                                          &quot;

 # WARNING: zlib is required for RPM use
-EXTRA_OECONF = &quot;--without-debug --without-legacy --with-catalog --with-c14n --without-lzma&quot;
-EXTRA_OECONF:class-native = &quot;--without-legacy --with-c14n --without-lzma --with-zlib&quot;
-EXTRA_OECONF:class-nativesdk = &quot;--without-legacy --with-c14n --without-lzma --with-zlib&quot;
-EXTRA_OECONF:linuxstdbase = &quot;--with-debug --with-legacy --with-c14n --without-lzma --with-zlib&quot;
+EXTRA_OECONF = &quot;--without-debug --without-legacy --with-catalog --with-c14n&quot;
+EXTRA_OECONF:class-native = &quot;--without-legacy --with-c14n --with-zlib&quot;
+EXTRA_OECONF:class-nativesdk = &quot;--without-legacy --with-c14n --with-zlib&quot;
+EXTRA_OECONF:linuxstdbase = &quot;--with-debug --with-legacy --with-c14n --with-zlib&quot;

 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
@@ -61,11 +53,9 @@ python populate_packages:prepend () {
 }

 PACKAGE_BEFORE_PN += &quot;${PN}-utils&quot;
-PACKAGES += &quot;${PN}-python&quot;

 FILES:${PN}-staticdev += &quot;${PYTHON_SITEPACKAGES_DIR}/*.a&quot;
 FILES:${PN}-utils = &quot;${bindir}/*&quot;
-FILES:${PN}-python = &quot;${PYTHON_SITEPACKAGES_DIR}&quot;

 do_configure:prepend () {
      # executables take longer to package: these should not be executable
@@ -76,10 +66,6 @@ do_install_ptest () {
     oe_runmake DESTDIR=${D} ptestdir=${PTEST_PATH} install-test-data

      cp -r ${S}/xmlconf ${D}${PTEST_PATH}
-
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        rm -rf ${D}${PTEST_DIR}/python
-    fi
 }

 # with musl we need to enable icu support explicitly for these tests

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224998): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224998">https://lists.openembedded.org/g/openembedded-core/message/224998</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115803730/6084445">https://lists.openembedded.org/mt/115803730/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------2meZbMF4YRvGT3dVS030Bbnr--

