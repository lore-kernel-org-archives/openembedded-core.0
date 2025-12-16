Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A00CD5C0FE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:07:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18107.1765876029657796190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZTlHnl8c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG0e2lk1179835
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=QpxkaOiw+pRB23kgy35vbz
	y/LeCz4qADjBN25q75++8=; b=ZTlHnl8cPnXtv9Hfhv1LtZbMl+w+vtXNT7PrGd
	v+0YJm3yk2SLRQeLR33sAODOuU/10GACKYp/Gpht4BddY2hEPNDvxiixnYlDl/RL
	lCd5hZxGFtfeYqmKSgTYnn/CD+Az8bUGfcR51Z59sOkRTixBmEVolqJAxcQnJttf
	709vlbrmB4YiTUplENgFYJqPHMLcZCqsBZ5ct/o5cZgvuTvxoRbsy63Y4zpRKc/R
	8Y071zNyTZoRfN/LPF5BHubZ6WSwmXjHrkDP66OE4hamYbev9+PK7YdrP88ZNkTt
	U7k2sa7sPFQ8vELuWrzBquSF/6NOpINrmwi0bshAfhax/v5g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0jy5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 09:07:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNeOBbpyW8Co9Xqpyp8RnMYhACOd38UnWzFIRDD5HcX9ZotNI2Bpeno9UgEvTzE7F+PkwThvbBG9fQaf9cKNpMwe3kzC2ouxgxwRDhgN5gp0A3HcJMc4RHd4VreKyNYL5D47Bqi22HpoHkvgiVl5j74qxmgjCh5thJNgT8+P6Yo8BhjjJ1W8ZQ9kp56wr31nIsvn/B8/N7DKAw5szZHLxh5U8lpcIhplEY+6q2kSi9H1N7HQof6vUKXki2UlNo3SnN8i+n+HbFE53nFt6jvxgMz4z8p5y3HJQ+5wE42adwFBmMu5Xq9v0d+zsu+ongVfF8ucKckDt8GPsER5Fguwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpxkaOiw+pRB23kgy35vbzy/LeCz4qADjBN25q75++8=;
 b=BmV5jVT5UJkKPWxUeoQl7x1EY9zJTqsJKkARdoRgbH1M3eNse7UoZ+WZfR9Q6zahXgR83E25NVrJtXclhlLE9ltIVl8e4JZJK9lBxkZ84Qif1wSgYisvIU9ObEvnp5A7H1JWJqCSNDZ7Wq80zwDgxJftEZTS0u0b62xvDeiXjhXtsqb8+OjMvGz46x5BmpX5vNFrim/yIYo9I691zhRb+UWlULKIVS5ogXNhMAgRg/je+3go+e7Ytlw3kPryUv7wmNmtx5dH7SKa5Q7HDfo7u1HjqFZFU+vzWRv7yw8S3aq2iEiZgzCHUR6hInKqKkFxSmq7GgItnB3m+apsRDQBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 09:07:05 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 09:07:05 +0000
Content-Type: multipart/alternative;
 boundary="------------97I000IKaD6ssEX5giGHY58h"
Message-ID: <0eb892d6-1654-4413-b286-0a2694e0e6f4@windriver.com>
Date: Tue, 16 Dec 2025 17:06:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 1/5] distro/include: Add debug_build.inc when
 DEBUG_BUILD is enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com,
        randy.macleod@windriver.com, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
 <9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org>
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 8744ad6e-4fac-482d-447b-08de3c827b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTY4c2VoZjVaT0V6RTZ0aEt0cTRiNUFvdkJzUVBNcFpqM29yUERPbUIvb2xr?=
 =?utf-8?B?dmJUc3JMVDQxeSs3MEYyVUhvN0lKWlhOYjJLclZkbkpnUVNGY0hsQlp3ZnZG?=
 =?utf-8?B?cTV0dHFlMW95Z1NSOXVjUU5USUNPUmw4aldCa1N5ZzVUc2t2UW9UWU5GdUNW?=
 =?utf-8?B?MG9uejdwb09PcWc1bHZFSVJGT1hUVnNPZUtiY05SVVN1WnVXNi9rY3lkUERO?=
 =?utf-8?B?MDVaZUVIT1F4MGlYeEQyblFPb0JzMTJLT1dESHdRY0tBSEIwaEhESm94SUpn?=
 =?utf-8?B?SjFaclZlRS94Rk1tallDTDFyMUpwazVXcUluV1ZnZ1REazB3bGYwcG1wSGYv?=
 =?utf-8?B?U2VxUGo5bUFEWmdRdnpwdDJaUTNHSlNFbXJ4b0Z0UFlLY1oraDFBcVRGM3Rx?=
 =?utf-8?B?TUdCc3FWQ09tUzlwZXRnNWhoTHpMOHRtTnRqVW1MYkVUU1JPL1dKMUpSM1I5?=
 =?utf-8?B?K3NtMWRhOUlML3NFRXJHUmp0TmMvSW1ib05JNlJUVW9jLzFDT3RHMUNGVWtJ?=
 =?utf-8?B?UDlSN3B0bk9EbWcwSjgwdEkvdXl0TjBFajYvRkZPZExzQlZhcTdqb08vcEts?=
 =?utf-8?B?aHJYY0cwdko0eVdNZFhreTRtSTlzanBrR2lYUzREQUtZYytNem1PaVFWS05t?=
 =?utf-8?B?WFBiNUVKVUIyYXhUdWhFRW53a1RUb0FVcUE0OUpMbzJWck9yKys0bGRWRUpP?=
 =?utf-8?B?Q2lxWDRLcWw5bWc5YUxCQlpHZ0s3L2Z4WHRZYmVtYm1HMVc3R1FXTEY4OWlT?=
 =?utf-8?B?TlRweUVlR241TG5tdGVQM0FyRUo2UnVja1hCc0Z6eHIvWDlzY3NBVktKdmZT?=
 =?utf-8?B?dW5Zb3hrRjNxY1QzdVRDWUt4dzJZNzRreHBleWJ2a1FVR1pEd3Ewc0VLbENr?=
 =?utf-8?B?R2psN2FSTUVIUEtzVHBSSEJhUlFXTmkvZiszVlhBNUJlS1NzZVlDTmlxVzJh?=
 =?utf-8?B?SlpUMFU1SEFLNDJCdUF5N2IxQ1ZoUmZ5NGx0dFZjRVI1cy9uMSt3T3k0dE5y?=
 =?utf-8?B?bWo0RWtqcngrU3Y2RFpvNFF2ektCSVZXb2I5bEg0RTZuMXZEcFVDQXNubzFi?=
 =?utf-8?B?VGlReDZWNnhLL3F6ZzhtVXZXREhmcnh4Q0NMMDRsdkxmMVBmSWZwQTcwMGdY?=
 =?utf-8?B?OGxJbHJJN2RuUG1DbFRjeGh1YnpDVU42TnU3TUM0MVFvQU9yQTJqYUhkcmsw?=
 =?utf-8?B?M0dHcHIrTGlmWGxKZkdqQjVuajROZ0hlRDJhY3N6RXRwYlp3aWdlZWtVcEp6?=
 =?utf-8?B?TFZQOGRaZm9kOG5xbjg4ZTdoMDV0Vm1NYnc2SEFtVjk1MnJERGR1ZGZ3YzMz?=
 =?utf-8?B?YWZmd0hUbUtnVFB2dGtzSG9TOXFkQVRGblB3QUZmUFFybG8yZFpWSmF1WlAz?=
 =?utf-8?B?cTViR254ZFlrcUJ5TUtXcjZocFF0S2F0Ukxmc0NwYmVFMWVPbit1OWFad0pC?=
 =?utf-8?B?aFpGQXM0dTcvZm5raUM2a2VsTU10bG9rWVFkL3NZTVUxVW5KZHJCb1VIek9k?=
 =?utf-8?B?UmV3QUg4ZHJDQnFHbGx4Wm9BZlVrK001NW1pUE5scm1hMktCN0ZUYndkN2pt?=
 =?utf-8?B?YkVMVDhqVWQvamoyL3lJcGMwNFBRQVhKNUpRR29MaWlET0hzSEVINmIwUjR6?=
 =?utf-8?B?eFA5bEdLaktSUkxidWwrZFpkTld3R0pHTTloZ3FCOEp3TGI4NXlocy9hRzND?=
 =?utf-8?B?UnVNR2tGZUR5K3VDbGVUU1lxeVZWeVY1RmRnQ043MHJxekd1M0dRZVpHNnBV?=
 =?utf-8?B?a3I4UXQ0RG9OVVVvdGNzOGhDYnRtZ09JMEhweEIvbGFRakdwb3BwaTB5eW5t?=
 =?utf-8?B?QWxHRy9DZHQ3ZmNmaUV6WGRZQVMrN1dDMlNNRTJmMkM2RlpLNS9TWDl6VlNm?=
 =?utf-8?B?NC9yVnZkeGpmblMxL1dzY1oxSzdIZFBXbmlSZjJCZkpadjJnRm8xZkdxSFJI?=
 =?utf-8?Q?LIE7qHhG2+V+Oa5X0DuzuFSxWaATIH6A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWdBcUo4TW80QzRxMk82WTc4NWRDK0pIMEN1anlrSlVSYlViRENGUUhiOVJz?=
 =?utf-8?B?L1IwRGFBVTUzRG9XRXc5TFg5aHhYbDZKTStPSUk1T3VKTHVGdzM5MGVlaVRy?=
 =?utf-8?B?QmRTU3V6Y2pyN1Y1RURXWGg1QW81Y2x5T1NBa3pnaHBxRHB0WCtGa2l3L2Zo?=
 =?utf-8?B?WXBra1p6aXRRK24zalJzd0M5UzByd3A2WXNrdUtHbmZMZHpSMTdibjEzTTFk?=
 =?utf-8?B?clZJY3NLVFRJNlJtQlh2T25iQ1dEMjZjcWhMNEpZdHJWdGtaVXJoTUlQNVZp?=
 =?utf-8?B?K2duQzd2dERhd1BRS3B0MDRTbmNKL0dRTmIxa09CQnNFeHZENE1Iemw1LzBT?=
 =?utf-8?B?d042MlRINDhIcHdhTEh6UXdSNHJIeld3MHRKcWprb2w4UHN2djlhL2wwdHR4?=
 =?utf-8?B?VHBUTkpUQ0p0QmFkcTBVL2ZBYWJhazJiMmRVeC9NWllNUkdyRUZhMFptdm1w?=
 =?utf-8?B?Z0RzN3FjWlhJS05XUDQ0eEdPZjVzRHQ0V0VkNlcvbmxqVTJEUG5iOUNuVE10?=
 =?utf-8?B?WmorQ1hVNWp0bldJbktNTmFKUHVHeEU1WmVURHArZ0VQM1lLMmhqKy9QMCth?=
 =?utf-8?B?RDdsU2szU2x3YWRhR0xwMFM0ZWVaQWdJRkY1YWIwZW0wcE8vcU0rLzBFZ1Jp?=
 =?utf-8?B?Y2Z0SkFVbXMrVk1SYWowOWZGQkllWHpHejdKenl3Mjc1SzV2N2Rucldnd1Vx?=
 =?utf-8?B?MWVjOUNuMm1qZVB3TjBCcStlaTRDYjA0M2dBMHcwaENKNDNrbFFCWEpWcU1Y?=
 =?utf-8?B?UzN4aDg0TVMzYi81SmVpa3lhV2dQYnNMbTNWa0FMM3VVd2V5YVVMV0RIYmpa?=
 =?utf-8?B?Z0NodEZuNkN5bndlTk0zTVNZVTlNK29UNXVxZEVWMnJQdTViQ2ZRcnNzT0RW?=
 =?utf-8?B?ZU5nZmhVNERpVlMyZ2hXMUhzZTNkMXA0Z05kMEt0OFZraVd0bGphWFBCOC9v?=
 =?utf-8?B?U3VpS0RsaytyK3NLL1ZzbHB2UjRreDRwSWtQeGg1VzZmcDNYWVJnc1dGWGdt?=
 =?utf-8?B?djV4VDQ0SGRMWUQraG5qNHRtUlltdDVwa3FxbVZoUnEraUtZejV3dW5BZGhE?=
 =?utf-8?B?ZjRtNWp1WXhHY3JOeGpzVU9SRFRhS21wRnNZWmRuN3A1bU50NU92OU1ZQ3Ba?=
 =?utf-8?B?SXpXNmJYWW9LNGdGak9DZUE5VGFYZlF4UkFxVU1Xb3NwTmF5RjlQWDBnRWtp?=
 =?utf-8?B?QlFzd3lWR09lNlJGZDB4bzFmV2F5bmNqWmxOYU84SlRBSmRwSEQ5dFYyUE4r?=
 =?utf-8?B?Z3VWRG42VDluM0RFUlJwbHpGRXRxWmM5NXZ3bFVFTlYvOEZvTldFa2hRUjBX?=
 =?utf-8?B?WmZJZldyQjRXK21pMTZndW95dmZVQUNUamtNVEs3dVJWOVpvZGsxK0xtcEg0?=
 =?utf-8?B?Z2FIYjZ6SVdZWHFkcWg0aDFRKzl6ZFd6K3YrK0FNYTFUVE1wYTlFRTZwbnQ0?=
 =?utf-8?B?Qm8zTVJjREdqcms2SWsxUUMwWVZmenR4YnRmOVFiUVhidE1DcGlUN0JiTllF?=
 =?utf-8?B?czBYSVlNSjhJSGJ3cHhVbnlwY1YzdlROV2VTUjNvSlRRdTRhNXlNOFhEYTdT?=
 =?utf-8?B?MmpRd1ZzT0NRQVBPV0VSbHZkZDFGZVN6aW5wMEg2TkppVk1TM3U2MldRTSsx?=
 =?utf-8?B?Y2VuOEhXTS9VaUtxQXIySTJkQkZUQld6Sk5ETkNEK0xRU1ZNRzRkeFR6MTFx?=
 =?utf-8?B?WFBXeng0T1ArTkFKWTlxMGdQQjRUcEdLNnJ6NnhDZVJuODRBR0QrOExaMkpl?=
 =?utf-8?B?Q0xZLzN3Ni93ckNVSVorb0w3bTlZZmUyMlFxcWxXeW1ZN2JCa0ZmVzZEeFhu?=
 =?utf-8?B?bEtYSGRhUGNmRXdaSWlSd0V5QWV2RmFaT1N0RzFMVE9lL0RFWitxMmZ0S1Mr?=
 =?utf-8?B?SXl2cFY2d0RGT1JsTnEvcGxVbmtaQUpsSjVOa0Z3UTJHT3RveldRYi9ud0lL?=
 =?utf-8?B?QlRJRnBlRSticnl5WlBWdTZ0SDh3c2ttN2JFdHpXNWZsaU9oNHVJTy9KYlhy?=
 =?utf-8?B?TWovUUhLMXpDOHM2bXozU0kwRlh3VExqSXFheFdvVkJlQStTMExnOHkrMmtz?=
 =?utf-8?B?MXBIOGdXMldnbTBkbVArb2x6cmo0RTdFSlU3WWFaSWlRdGY3QkZ2VTBvUE5h?=
 =?utf-8?B?bEp0QVpQNDJ0SG5SRjhaOGpkQk53M0VMYjNBU3gybG9vYVdSZzB6Y1Q2a2JK?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8744ad6e-4fac-482d-447b-08de3c827b99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:07:05.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyuywbB6lP7UHfC8R8xWYuSYOtImGMSSSqOIw4FY3FeLJ530YlwEuVYXxi4VHImwvMnyDM48nQ+ADDKw/DMB8fPhmVdTY2NHgfiiYTSMI8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NiBTYWx0ZWRfXw+j+0QDO/zuC
 GrkFC4aYrWZH3m1RoK0p4ShEldFGnJrAvV/DEkHoLE8kVp+17U7SG2a/RZ/28eD9CSbHdF+D7oC
 Jt8TJGEp8V1PQynmLuRXULOS6D5kXTSjw5NCpUvFtT1BIsoBI/WbzkJs0Wv8WgVXDYU6M7Y//Nx
 9lPUCBI6HCru7lbiiPzEaqL5zqjcXds7pwCUpE9IMbh1IMPPe4NhBrHLKPKq/hdoOBf9SBuaBQr
 uPssnVh1VOQnY6IQ7pj8sPbTXWd0ASOHxo+MuoGfCiHv9ZNijNUB8skwsPYByonHKMJnJhKYLeW
 QNo037560S+78bdqS1pU50o2mYYbHL09niuQ9ezOZns8QCRqumLS0tW0b36SvcOM0/f3ltsvJKh
 DYnxoUBYV/t7fXSXAdWpXX4Z+I5QQA==
X-Proofpoint-GUID: JhfG9qaC5QJXuz_fkAbYjxGzkl5moVGM
X-Proofpoint-ORIG-GUID: P4eAd9mFsZS97c8d7NQoerBB_zZTtqlU
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=6941213c cx=c_pps
 a=ixAZ6W2pdOuc7GYTaWtIWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=mcYyV4GR6TnfMPSpjYgA:9
 a=itNntiE7ACGd12bT:21 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8
 a=scgZtQAgwulBoYZdEN4A:9 a=zMvkPhXa9mMNPDlX:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227926

--------------97I000IKaD6ssEX5giGHY58h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 20:00, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
>> In bitbake.conf, use ??= to set *_OPTIMIZATION, add a new include
>> file debug_build.inc to use ?= to override *_OPTIMIZATION when
>> DEBUG_BUILD is enabled
>>
>> When DEBUG_BUILD is enabled:
>> - Defer inherit bblcass debug_build, while setting DEBUG_BUILD = "1" in
>>    local.conf, the debug build is enabled globally. For the recipe (such
>>    as qemu) which doesn't work without optimization, set DEBUG_BUILD = "0"
>>    to disable it for a given recipe
>>
>> - Use include_all to allow other layers to add their own debug build
>>    configurations
>>
>> Suggested-by: Peter Kjellerstedt<peter.kjellerstedt@axis.com>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta/classes-global/base.bbclass         | 3 +++
>>   meta/classes-recipe/debug_build.bbclass  | 8 ++++++++
>>   meta/conf/bitbake.conf                   | 9 +++------
>>   meta/conf/distro/include/debug_build.inc | 5 +++++
>>   meta/conf/documentation.conf             | 2 +-
>>   5 files changed, 20 insertions(+), 7 deletions(-)
>>   create mode 100644 meta/classes-recipe/debug_build.bbclass
>>   create mode 100644 meta/conf/distro/include/debug_build.inc
>>
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>> index 6de17d1bb5..0f4398e26f 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
>>   inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
>>   inherit_defer toolchain/${TOOLCHAIN}
>>
>> +DEBUG_BUILD ??= "0"
>> +inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)}
>> +
>>   def lsb_distro_identifier(d):
>>       adjust = d.getVar('LSB_DISTRO_ADJUST')
>>       adjust_func = None
>> diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-recipe/debug_build.bbclass
>> new file mode 100644
>> index 0000000000..a917e9cbc9
>> --- /dev/null
>> +++ b/meta/classes-recipe/debug_build.bbclass
>> @@ -0,0 +1,8 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +# Allow other layers to add their own debug build configurations
>> +include_all conf/distro/include/debug_build.inc
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 5406e542db..52ceb76bbb 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?= "\
>>   "
>>   DEBUG_LEVELFLAG ?= "-g"
>>
>> -FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
>> -DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
>> -SELECTED_OPTIMIZATION ="${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 
>> 'FULL_OPTIMIZATION', d))}"
>> -SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
>> +FULL_OPTIMIZATION ??= "-O2 ${DEBUG_LEVELFLAG}"
>> +SELECTED_OPTIMIZATION ??= "${FULL_OPTIMIZATION}"
>>   # compiler flags for native/nativesdk
>> -BUILD_OPTIMIZATION ="${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
>> -BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
>> +BUILD_OPTIMIZATION ??= "-O2"
>>
>>   ##################################################################
>>   # Reproducibility
>> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
>> new file mode 100644
>> index 0000000000..95e09e64f5
>> --- /dev/null
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -0,0 +1,5 @@
>> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
>> +DEBUG_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
>> +SELECTED_OPTIMIZATION ?= "${DEBUG_OPTIMIZATION}"
>> +# compiler flags for native/nativesdk
>> +BUILD_OPTIMIZATION ?= "-Og -g"
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 741130a392..2a7418ccb3 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
>>   D[doc] = "The destination directory."
>>   DATE[doc] = "The date the build was started using YMD format."
>>   DATETIME[doc] = "The date and time the build was started."
>> -DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
>> +DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable and includes file conf/distro/include/debug_build.inc"
>>   DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
>>   DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
>>   DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
> Sorry about the delay in getting to this, we had to focus on the
> release. I have been giving this some thought and it is heading the
> right way but I have a couple of ideas.
>
> The problem with DEBUG_BUILD is that we have a lot of debug information
> in builds anyway and this is now unclear what it means. The
> documentation.conf entry mentions packages which is now incorrect too.
> The variable is a very old one and the interface is poorly designed
> compared to other areas now.
>
> Rather than keeping "DEBUG_BUILD" alive, perhaps we drop that and
> simply document the INHERIT instead? I did wonder about making it a
> config fragment instead too instead of a class?
Got it, I will try to drop DEBUG_BUILD and add a config fragment to instead
>
> I'm also wondering whether we should remove SELECTED_OPTIMIZATION
> entirely? Certainly DEBUG_OPTIMIZATION and FULL_OPTIMIZATION can be
> dropped. Whether that should be this patch or another, I don't mind.

It is not easy to remove *_OPTIMIZATION, especially SELECTED_OPTIMIZATION,

with a simple grep,

...

$ grep SELECTED_OPTIMIZATION -rn meta 
meta/recipes-kernel/perf/perf.bb:88:TARGET_CC_ARCH += 
"${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}" 
meta/recipes-kernel/systemtap/systemtap_git.inc:18: if 
bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x": 
meta/conf/templates/default/local.conf.sample.extended:101:# 
SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}" grep: 
meta/conf/.documentation.conf.swp: binary file matches 
meta/conf/distro/include/lto.inc:48:SELECTED_OPTIMIZATION:append = 
"${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}" 
meta/conf/distro/include/lto.inc:51:SELECTED_OPTIMIZATION[vardeps] += 
"LTO LTOEXTRA" meta/conf/distro/include/security_flags.inc:13:OPTLEVEL = 
"${@bb.utils.filter('SELECTED_OPTIMIZATION', '-O0 -O1 -O2 -O3 -Ofast -Og 
-Os -Oz -O', d)}" 
meta/conf/distro/include/security_flags.inc:64:TARGET_CC_ARCH:append:pn-binutils 
= " ${SELECTED_OPTIMIZATION}" 
meta/conf/distro/include/security_flags.inc:65:TARGET_CC_ARCH:append:pn-gcc 
= " ${SELECTED_OPTIMIZATION}" 
meta/conf/distro/include/security_flags.inc:66:TARGET_CC_ARCH:append:pn-gdb 
= " ${SELECTED_OPTIMIZATION}" meta/conf/bitbake.conf:612:TARGET_CFLAGS = 
"${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP} -pipe" 
meta/conf/bitbake.conf:663:SELECTED_OPTIMIZATION ??= 
"${FULL_OPTIMIZATION}" 
meta/recipes-support/xxhash/xxhash_0.8.3.bb:15:CFLAGS += 
"${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', 
'-DXXH_NO_INLINE_HINTS', '', d)}" 
meta/recipes-devtools/valgrind/valgrind_3.26.0.bb:70:SELECTED_OPTIMIZATION 
= "${DEBUG_LEVELFLAG}"

...

Variable TARGET_CC_ARCH need to append ${SELECTED_OPTIMIZATION} 
conditionally

It is possible to remove DEBUG_OPTIMIZATION and FULL_OPTIMIZATION, I 
will try it in other thread out of these serials

//Hongxu

> Cheers,
>
> Richard


--------------97I000IKaD6ssEX5giGHY58h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/15/25 20:00, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In bitbake.conf, use ??= to set *_OPTIMIZATION, add a new include
file debug_build.inc to use ?= to override *_OPTIMIZATION when
DEBUG_BUILD is enabled

When DEBUG_BUILD is enabled:
- Defer inherit bblcass debug_build, while setting DEBUG_BUILD = &quot;1&quot; in
  local.conf, the debug build is enabled globally. For the recipe (such
  as qemu) which doesn't work without optimization, set DEBUG_BUILD = &quot;0&quot;
  to disable it for a given recipe

- Use include_all to allow other layers to add their own debug build
  configurations

Suggested-by: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>
Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/classes-global/base.bbclass         | 3 +++
 meta/classes-recipe/debug_build.bbclass  | 8 ++++++++
 meta/conf/bitbake.conf                   | 9 +++------
 meta/conf/distro/include/debug_build.inc | 5 +++++
 meta/conf/documentation.conf             | 2 +-
 5 files changed, 20 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes-recipe/debug_build.bbclass
 create mode 100644 meta/conf/distro/include/debug_build.inc

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 6de17d1bb5..0f4398e26f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??= &quot;${PREFERRED_TOOLCHAIN_NATIVE}&quot;
 inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}

+DEBUG_BUILD ??= &quot;0&quot;
+inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-recipe/debug_build.bbclass
new file mode 100644
index 0000000000..a917e9cbc9
--- /dev/null
+++ b/meta/classes-recipe/debug_build.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Allow other layers to add their own debug build configurations
+include_all conf/distro/include/debug_build.inc
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..52ceb76bbb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?= &quot;\
 &quot;
 DEBUG_LEVELFLAG ?= &quot;-g&quot;

-FULL_OPTIMIZATION = &quot;-O2 ${DEBUG_LEVELFLAG}&quot;
-DEBUG_OPTIMIZATION = &quot;-Og ${DEBUG_LEVELFLAG}&quot;
-SELECTED_OPTIMIZATION = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar(oe.utils.vartrue('DEBUG_BUILD','DEBUG_OPTIMIZATION','FULL_OPTIMIZATION',d))}">&quot;${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}&quot;</a>
-SELECTED_OPTIMIZATION[vardeps] += &quot;FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD&quot;
+FULL_OPTIMIZATION ??= &quot;-O2 ${DEBUG_LEVELFLAG}&quot;
+SELECTED_OPTIMIZATION ??= &quot;${FULL_OPTIMIZATION}&quot;
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.vartrue('DEBUG_BUILD','-Og-g','-O2',d)}">&quot;${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}&quot;</a>
-BUILD_OPTIMIZATION[vardeps] += &quot;DEBUG_BUILD&quot;
+BUILD_OPTIMIZATION ??= &quot;-O2&quot;

 ##################################################################
 # Reproducibility
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
new file mode 100644
index 0000000000..95e09e64f5
--- /dev/null
+++ b/meta/conf/distro/include/debug_build.inc
@@ -0,0 +1,5 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
+DEBUG_OPTIMIZATION ?= &quot;-Og ${DEBUG_LEVELFLAG}&quot;
+SELECTED_OPTIMIZATION ?= &quot;${DEBUG_OPTIMIZATION}&quot;
+# compiler flags for native/nativesdk
+BUILD_OPTIMIZATION ?= &quot;-Og -g&quot;
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..2a7418ccb3 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = &quot;Defines which layers to include during cve-c
 D[doc] = &quot;The destination directory.&quot;
 DATE[doc] = &quot;The date the build was started using YMD format.&quot;
 DATETIME[doc] = &quot;The date and time the build was started.&quot;
-DEBUG_BUILD[doc] = &quot;Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable.&quot;
+DEBUG_BUILD[doc] = &quot;Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable and includes file conf/distro/include/debug_build.inc&quot;
 DEBUG_OPTIMIZATION[doc] = &quot;The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'.&quot;
 DEFAULT_PREFERENCE[doc] = &quot;Specifies a weak bias for recipe selection priority.&quot;
 DEPENDS[doc] = &quot;Lists a recipe's build-time dependencies (i.e. other recipe files).&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry about the delay in getting to this, we had to focus on the
release. I have been giving this some thought and it is heading the
right way but I have a couple of ideas.

The problem with DEBUG_BUILD is that we have a lot of debug information
in builds anyway and this is now unclear what it means. The
documentation.conf entry mentions packages which is now incorrect too.
The variable is a very old one and the interface is poorly designed
compared to other areas now.

Rather than keeping &quot;DEBUG_BUILD&quot; alive, perhaps we drop that and
simply document the INHERIT instead? I did wonder about making it a
config fragment instead too instead of a class?</pre>
    </blockquote>
    Got it, I will try to drop DEBUG_BUILD and add a config fragment to
    instead<br>
    <blockquote type="cite" cite="mid:9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

I'm also wondering whether we should remove SELECTED_OPTIMIZATION
entirely? Certainly DEBUG_OPTIMIZATION and FULL_OPTIMIZATION can be
dropped. Whether that should be this patch or another, I don't mind.
</pre>
    </blockquote>
    <p>It is not easy to remove *_<span style="white-space: pre-wrap">OPTIMIZATION, especially SELECTED_OPTIMIZATION, </span></p>
    <p><span style="white-space: pre-wrap">with a simple grep, </span></p>
    <p><span style="white-space: pre-wrap">...</span></p>
    <p><span style="white-space: pre-wrap">$ grep SELECTED_OPTIMIZATION -rn meta
meta/recipes-kernel/perf/perf.bb:88:TARGET_CC_ARCH += &quot;${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}&quot;
meta/recipes-kernel/systemtap/systemtap_git.inc:18:    if bb.utils.contains(&quot;SELECTED_OPTIMIZATION&quot;, &quot;-O0&quot;, &quot;x&quot;, &quot;&quot;, d) == &quot;x&quot;:
meta/conf/templates/default/local.conf.sample.extended:101:# SELECTED_OPTIMIZATION = &quot;${PROFILE_OPTIMIZATION}&quot;
grep: meta/conf/.documentation.conf.swp: binary file matches
meta/conf/distro/include/lto.inc:48:SELECTED_OPTIMIZATION:append = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','lto','${LTO}','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}&quot;</a>
meta/conf/distro/include/lto.inc:51:SELECTED_OPTIMIZATION[vardeps] += &quot;LTO LTOEXTRA&quot;
meta/conf/distro/include/security_flags.inc:13:OPTLEVEL = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.filter('SELECTED_OPTIMIZATION','-O0-O1-O2-O3-Ofast-Og-Os-Oz-O',d)}">&quot;${@bb.utils.filter('SELECTED_OPTIMIZATION', '-O0 -O1 -O2 -O3 -Ofast -Og -Os -Oz -O', d)}&quot;</a>
meta/conf/distro/include/security_flags.inc:64:TARGET_CC_ARCH:append:pn-binutils = &quot; ${SELECTED_OPTIMIZATION}&quot;
meta/conf/distro/include/security_flags.inc:65:TARGET_CC_ARCH:append:pn-gcc = &quot; ${SELECTED_OPTIMIZATION}&quot;
meta/conf/distro/include/security_flags.inc:66:TARGET_CC_ARCH:append:pn-gdb = &quot; ${SELECTED_OPTIMIZATION}&quot;
meta/conf/bitbake.conf:612:TARGET_CFLAGS = &quot;${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP} -pipe&quot;
meta/conf/bitbake.conf:663:SELECTED_OPTIMIZATION ??= &quot;${FULL_OPTIMIZATION}&quot;
meta/recipes-support/xxhash/xxhash_0.8.3.bb:15:CFLAGS += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('SELECTED_OPTIMIZATION','-Og','-DXXH_NO_INLINE_HINTS','',d)}">&quot;${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}&quot;</a>
meta/recipes-devtools/valgrind/valgrind_3.26.0.bb:70:SELECTED_OPTIMIZATION = &quot;${DEBUG_LEVELFLAG}&quot;
</span></p>
    <p><span style="white-space: pre-wrap">...</span></p>
    <p><span style="white-space: pre-wrap">Variable </span><span style="white-space: pre-wrap">TARGET_CC_ARCH need to append </span><span style="white-space: pre-wrap"> ${SELECTED_OPTIMIZATION} conditionally</span></p>
    <p><span style="white-space: pre-wrap">It is possible to remove DEBUG_OPTIMIZATION and FULL_OPTIMIZATION, I will try it in other thread out of these serials
</span></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">
Cheers,

Richard
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------97I000IKaD6ssEX5giGHY58h--

