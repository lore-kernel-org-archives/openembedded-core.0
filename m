Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826EAE6B25B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 22:40:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90486.1766443213975047761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 14:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l8HCt96n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451c17654=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMAb2Gb1595474
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 14:40:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=YJHrQbOd6f0D07v49i4RSj
	7YFPfPLt5uwnKUrRvagsU=; b=l8HCt96n3U+MsDj8SCxObvoiH0ZiOJzEJa2bY6
	OhqWfeNh9T2hO1kDjXoVIl0rY1mVt3ldHq7zosfV3JJHfH3RSR05DRlCKC02GGdF
	BlgQKfBxHhk8XetxIuolbGI+JYWqiDNysjjslPaj6wyOmRTbBrJpG2WHiQRuOomr
	xfM9boYaKc8VoIVgm9O9YScQF5ciUaGhJv1tN/neJJ3T43n+Mrjcvh8bXsGcQiyc
	kzQLpu7LnunpmLXedHZrDz3aiPwXef2LdmfODF/RcFmEgqVhv/c6eA0tnhUBCXQR
	jKC1bnRuC8pd1L9vDfJLswZ9RBimlsj+YiO/iWd0ACOAQHiQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4t7ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 14:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrdiKYgOeKj7CE61sz/Xmk8m/zMwB0t2rx9WFvOZtED8PSimtYAxwQLoOkqiR5UWpRYK1DqCud9P2W14WRomXtQN+/SWCmAX3k2QVvRGnRCAeMqIBQC3bwpL/6WMd1Klr34PUXgLtykRenNRo5xufTHYmbwOkjkw/bMmjJE1YrG5YDWySudX2CNS7XAAqJebNId0l3ecEIUa1/eNeqKQxM3dqanhSHLKCdIjXGTzJwe5o5OxZ2o44i7TdcEo3Ap+AVXy3C8HOvdoJyXUCanSrN7JQIOD9OmTAVNArdCUeYHI0daUXmfaqBv3tiJnFaIWgaVpThiC0cVBROOaFYhTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJHrQbOd6f0D07v49i4RSj7YFPfPLt5uwnKUrRvagsU=;
 b=dpczdbqyVSDh+xj6aYRUCmYoqlwrvgf8xmVwpL9+fu4rjaFte77CXXaVwl8tXwMUdu4FpVPyRjj8rbovyDOG5RJccPqRVxji7vhyFcYSWbZsdXLuLV3TMrrzfSLmsUk2/OGaFlK54J0KiaaiEAQmsqpyWaKqmfmIUC/Ok2NGbLeqfr/gFLmhC6zluYLZuCcsyrkxa6aXoKbKwXy8CfshyZhRrpFqk8E55BsEf7AYu0Zu3xLo1Zsf30tLtF8CKmxh/KgKPwlbCKKbQ3kd/O6b6HLk5s4Wd96xU4LvKECAcXdTTEBc1H0G9Aj7iRRemlJw/adqBk4Oxm+bsPeTts3xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA4PR11MB9178.namprd11.prod.outlook.com (2603:10b6:208:569::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 22:40:10 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 22:40:10 +0000
Content-Type: multipart/alternative;
 boundary="------------QfjBjLSmlnzyi2Sn6HPO9kbl"
Message-ID: <c1d0b949-5995-4f60-8e94-98dd73ab5a3d@windriver.com>
Date: Mon, 22 Dec 2025 17:40:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: enable default uwtable and ignore arm no_std
 test
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        hemanth.250302@gmail.com, nick.owens@eero.com
References: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
 <20251222093830.2658141-2-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251222093830.2658141-2-Yash.Shinde@windriver.com>
X-ClientProxiedBy: YT4PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::8) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA4PR11MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d7f959-334e-488f-f222-08de41ab1059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXVKZERMdll4Ukx3TUVDVGxjbktnRWUzTVhHRUxCNnl5TlFBQW1oUmpLQVNG?=
 =?utf-8?B?dFdtUEkvVUgzS3pvRVFkK0JtOHpNcHhMR2tCV2pnNDhHU0Q3dDgwOE9SbjVH?=
 =?utf-8?B?MVZxekU3WDlGUCtBR3QwZjl3ZlBKSk5kVC9hOGQ1NDcwRTFJeWNKOVJmQW5O?=
 =?utf-8?B?Y3YvNFF5cnpGQUtXMUVEUWRUbHFrL0pXL2V2Q0MxMHArdUpLVzhpMndkNWpW?=
 =?utf-8?B?ZzlMWUNuTnZlYzAzZmttdVkzZFV6bmM4OE9sS2xpVG1ZSDZpTjVTK3VPN3VS?=
 =?utf-8?B?cnh1alJ4azhXU2VDeW9XQ083dkFGRi9PUnhFaitTVCs4TWkxYkJXMVcwSHNW?=
 =?utf-8?B?L2Nncm56c0RmQmNjRUkzTTdVR25HMTNCdHFtY0FJLzR1OVRjSkFnWHBQY0kr?=
 =?utf-8?B?cWcxVDQvaUdBVTRzVmgvVUcxMkt3Y3pBTjZjbWg5TUZsMGF5NjdKeWdXUE9M?=
 =?utf-8?B?V1dhSk1zZkRnUDdVZ0h5am41SDlZc1FMamxweUVKZzhKWTk1S2ZXSzdTWlQ4?=
 =?utf-8?B?anZGOUNabVlJMGcydEJTRGNmczcvcWl6Um45S1lyVlgxbEl3K3UwS2k4Y3FE?=
 =?utf-8?B?d3BuZkJnbFVReURFQVhYQzh5ejRQMUUwN3JKMTRiNm0wYTlGUU13SUJhRHJw?=
 =?utf-8?B?YUFra0pJdlJYcjZBK0tpWWM4UlJrZS8rKzFSR2k2NGptY2xDNnBNT2xKTG41?=
 =?utf-8?B?dUtYMVVZSkRJWkttN3g3V3JqYTZGZGhHTGQwRHl4RGxKNTJSQWFuR3FBSmJh?=
 =?utf-8?B?TU1qa2FSb3VUOE40OWpJT3BwNkdMa2tYQTF6MHV3YytCWFNWNmRzVzByRzM0?=
 =?utf-8?B?S2RRTXkxYnJWSUxpOS9EOVA5elhRUWh6Qjdld1lXWE9PSzJ5T1NBQjR3Z2NE?=
 =?utf-8?B?cXdQT2pVYit0ZnRqdlNIS1dTR2l5RjlmVlRoaHlMeVB4NGRpdEJrY0RWd3BK?=
 =?utf-8?B?SE84S1dscE9US0x0UVVBUWxQaVFvOHRNK1B6SS9SNnpOK0hKalE4QzBTcnFr?=
 =?utf-8?B?b0VIcmc0M2xySE9tZSs3SWlueTJtVEpRVk9wVjVUYVZPQ2txdHp6UEdtRC91?=
 =?utf-8?B?WFhyVGlWUTJYUkZuNHBRbnZnUUNxUis2MFRmd1FOc3FNbmxEMkpXZWdNZXF4?=
 =?utf-8?B?blhocnRpRFdkNUFXTXF4VGJjUjh5SU1QbzAxc2pGdE9SRk05V2V3WXdmdTJZ?=
 =?utf-8?B?dUhqSHFndy9Wcmg0TEl3MndXWXRuSzF4NW05d2FFVFJmTkpNNExmd2llS0FS?=
 =?utf-8?B?NVJPTnVrYjY3cVJWZkRyTm04MzM3cDNqelg5UDlOWGx0Q1NYS2RMK2hNYkpw?=
 =?utf-8?B?QXpFL3YvQTVZZkZoNUJBZThPeENxbUdNSFEwdmh3N1paSWF1bC9GenY4cTY0?=
 =?utf-8?B?cDBMUzljbjhDNTRCbDc5ejFGK3dHVlA1a3NwV3M5SWhPSlpSaDNlY1JnbVpC?=
 =?utf-8?B?S1BLWkFscWdaVlZjN2R0TWlFOVN6NDUrWHdGVjhBVGF1U3FnY2VSVUtadjl6?=
 =?utf-8?B?WG1rQmxsUE1FVklVZmNjeTZIaStDRHRkWWt4U1B5UmtVZ0t2MzJMQlViOEl6?=
 =?utf-8?B?SVVTZzQyR25sRXVSSUtKRUdhZ0MzNEdvRVdvSHBiL2paa2ZZbHVQWFJYRGh4?=
 =?utf-8?B?K3RSMS9UczlISmdWdlVqR2RJKzJEcGhUNWxNQ3lSSHBRZitTcE9oU1B4d1JQ?=
 =?utf-8?B?UHh5bm0wN3RHY0lUblNKUU9LT21CemowOFZpcjJUR09UOXZLMktnYzNibEFM?=
 =?utf-8?B?NXE1YW9uQ0NCSGlBcEM4ZmwxcldjeEx5dmxQbVNZQy9HNkg2eXRUcS93OWtW?=
 =?utf-8?B?TU5ORGxOWXhsakhIMFZCd1prWFhob29lUEVITjdSMENuUWlqclJYU2premFS?=
 =?utf-8?B?azU1Qkp2QWhncERPdGVwdmFyNnk4MllCMzdOaDJSdENOK2lZWG5iL2dlR3Ew?=
 =?utf-8?B?RklRVWlVcW1vcStwV0g1OXc4V2t2c1duc2trcHFFZHMrcTBRb3RKdU44ajZq?=
 =?utf-8?B?bEw1ajJtdWV3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V05hT1ZMWTI3QThBMmFBemRsT3NieFUrdEIraCtxcEVQeGtBRXNBZllPWnFv?=
 =?utf-8?B?bnduOFoxOEdsVFducXFHWlZQUCs4cEF4SmdyK1B0OVo1cElDM1p3TDVoZjQ5?=
 =?utf-8?B?MTNjK0ZxZTRqOVVLdFpySXpGWjYrSkF3Q2RPcExpYVllN1pLcjJWcmNML0Vm?=
 =?utf-8?B?d3lXT1ZhYzM5M2htSlFiN25jd29iemNwb0cwaU1LejFpMHlzVVFzeWV3RDJD?=
 =?utf-8?B?bUdhQVVDcVJIY2NnWHRScFBkQ0MxMjZHYUtrSkFkUVVaWDZJL3IyMVZQbDNH?=
 =?utf-8?B?Wmw3NFJ6TkhQK2ZTRW45bThPdERvdkZFRm03eHpUZlZsN0NicE5Kckg5NXFt?=
 =?utf-8?B?bDYxNW41MDNlOGVEWWFGclQyS3FHbHd2VGJKVWtVQ2hqMzF4VHJRdWN1MEdI?=
 =?utf-8?B?eEd5ZkpmT2wwdGl4VGVHQW96Q25EY0xLQTNsS05Eck5KYnJSY3ZGOVNtdGEv?=
 =?utf-8?B?a0lmMVJOSCtHU0Q0Q1Zta3hzeXQwNHlPbEdpTGtOZThwd0JDWmVKS3NJN3ZO?=
 =?utf-8?B?WWl4K3loTmFTbDFCMllYWVRyNnJKWjJsNERXbVVTd2NzeHZKOHk1d2dJa2dx?=
 =?utf-8?B?YjF0a1V3Z2ZLUzhBVlhaN0NhY1BvdmpnQVlMY3JGZloyd3U3a1lmaUZ4a0Z1?=
 =?utf-8?B?RWhPdk5iS08zMHc0R2xhbWVrN09nYkpLKzU2V0gwalZaZ1lnc3hXQ2Z3R2RF?=
 =?utf-8?B?Ulp5LzA1b0hGYUJ6dEJ6Y0ViRkc1bzhESlBRcy9UKy9ZQkdGUGZGNXNwKzY3?=
 =?utf-8?B?djFwdDQzczNrMERwRG5QbitodjY5VVEyUjZ4NFVuenJwZjdWS0FrZU9rVWhM?=
 =?utf-8?B?enJhQUpGSHFldUUwTjVlMk8rd2trSUo4TG9FQ0RvOFQ3bHZ3dHpYWklkaW1V?=
 =?utf-8?B?S0NhcXJ6b080UnVXc3hKQXlFTjZMMUtWeVZtYTQ0eng4blpNdVdCWXpkV1dY?=
 =?utf-8?B?cDFhdTVRbU50Yms2NGxkM1VPcDBFMjIxQS9WRFlpQ040QzZ3bjRyc210ek80?=
 =?utf-8?B?UkRrMGpxRFhLZlBNNTBHSlJvakc2dzZpc2h1dHVqd0UzWHBnYVJrS1lPS2Zq?=
 =?utf-8?B?ak5jOUJqTk5pNDZvYkFkNnNKZk5xbXZJU25rd0xIS0laK045RTYyMzlDWU5s?=
 =?utf-8?B?bDQwZTU4VXF4eWFZcUxWa1lGdmkrNUZZZ2FWWlRWNmxZKzVMRUh5WmpzdnJX?=
 =?utf-8?B?aWk3ZERSZndCYkNxcEJYK3AreUJMeElEUDF6YW1RMTN3alZUMDltNko1N0t2?=
 =?utf-8?B?K0drS05xR3dPWGdseGVsTUFmdlJTdDVMZjFpYnd1cTFSRk9kblNTdlRXRXE1?=
 =?utf-8?B?RWtaamJlUUZCejBwbmRuM0V4RytVWDZ3VjJ4VTZSbXowdm9lQUoxc3ZuMVo5?=
 =?utf-8?B?OU9BUkI2Mnlaazk5Sng2RkgyajZVRVl3S3p4aGFPZjhJRmtORkNZWVIrc1Jt?=
 =?utf-8?B?alB6ZGFQS01PYU10aGVQb2hZbTNzK2N3T21JRm9ubUd5aHlGd2xZbTFiNVU5?=
 =?utf-8?B?SXc0bWZ0Y0VkVUZ3OFMzSnhWL0pWcHE5VzdEZXl6aUNOR0RDSVJjY2NiY3VY?=
 =?utf-8?B?b1oxTXdFUFNQYWViWnBqQ1pqaGdwNUp1QlJRNk4xNlFVeVNvV2NMQ09lYWtW?=
 =?utf-8?B?ZzN1V1IvVWR4RlpjZlhNSEo4dEFGd3I1QlJySUtoL1RQVlNwbE5DcTRVb0Ny?=
 =?utf-8?B?Y3A1b0V2V3E4Y253R1hCS2xZRWZzMy8wcFNQemJhaHpjd0QwUVZiUG1ZNE5V?=
 =?utf-8?B?M29odk9SU3VHTEdpUi9VRlhuc0F4cmEzNzRRQ0IvdVJGSUpmSzlnQlBMQ2FG?=
 =?utf-8?B?YW5qbDBhaExFR1hqbnhUMjdIZUI1RHAvcXI2NVgzS0RBeXI0dG50VitNdEdK?=
 =?utf-8?B?c2R2WkxuWjBzS29hMWtMWWZpQW1RRTRRUU9lSElhYnBQaFFMVXBVdjR6RDlK?=
 =?utf-8?B?elZLMzZNWmdrSTloY2hzaHJCL280VllqVUo4UDJNcUdDbWFYK2swaGM3aWND?=
 =?utf-8?B?QUZHa0taSmNUTks3emttNVVmdEpheWUyaGdIVm5lN2hySTJGNkZUTzJidHYr?=
 =?utf-8?B?RkpNUzIwb2pZMVR1dmhieGx6bVphQ1E1U1dZSzB6dnJ5TFAvVXJ0R0pXM1dt?=
 =?utf-8?B?ZlRpVHV1VjJUQldDL2JZV1E1bUVld1FMdmUwdC9oY1NmVldRWEdaQ3FzQmd0?=
 =?utf-8?B?UVRieUhzMVkyOG9MM0tIOGxyUEptenA3K05vNTV3UnR1dGpvdkFTQy9oQWJX?=
 =?utf-8?B?aEt0VmFGaWo4UERBak5YRzdhUnMvbjhEMXVnTkxia21BeStEaVE4N2hqcUgx?=
 =?utf-8?B?OEl5SzJ2K2lVSGJKR0pwMVJYRnhYdFJrSTlWSkFHZi9CSG5NMGllMlBVVGdp?=
 =?utf-8?Q?fbRIhd5jye1DjaFk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d7f959-334e-488f-f222-08de41ab1059
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 22:40:10.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6NnRlz9OMCNf29vgJQ9xS4ptOEzJnbwzst8w7EjEvM22B8ZLmiB6Xsjc4YcDBhkcAotJy32mhGgUwh/YkBC/an/lZ9CVmckzZoTl0G+g3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9178
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: FtCZwx160UGVAOCupRW9erquAFf5kjkZ
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=6949c8cd cx=c_pps
 a=NkapyFR+xBWi1egQVwNhyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=SI1g7rKZajCoSnGkFmAA:9 a=QEXdDO2ut3YA:10 a=cWkNTeRcdyXLL7WjoFAA:9
 a=FoIKYH5dREN2KX9U:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDIwNiBTYWx0ZWRfX/gS/cNgIdaIf
 6i+s+5OUZW0gqkqleP+tj8Nm245SCJNwKkK+fCHioBIe7VXEug48KOTrGMSNKbzXkGonRZfcVGs
 C+pS/8rz+DCH8nHIUkgoqm18mcFQkuoTgdjpHZ/P69UcVLP35rHM1OZPglQXQ7oNrI7cEtbwQck
 bC6UrprwjT6nCosQdsClC/g7Jfcnl+jviqviWZ9DnZcNqSw8LgHgR4IrGVcmZ5ZrmFEK+OV0uiZ
 l5s1uVCmzCp7o1txqziKimReGwUqVPQDwX/T6lwifPANbSOSMA2Hs8fiEZ8GPrF7ILQ9JGtO1Tr
 Oi3qxfeImmjrnn7jYZwlLaHrZSAO21EToAoP2hylxhbdrsnyEst5odApRFtR1NP4/Hc6VSa/SzP
 XyoE0CT8WTb0u5hnyLOtnsC3no+tUen7zrVbkgU+dtuKRkPs/0MYZrxdol+v125LNgfrsd/qkjf
 EjtvTmGkExLwuBziykw==
X-Proofpoint-ORIG-GUID: RAr4uk4Ix4ktN7d_f8v8WPzfT0zbZkVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 22:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228441

--------------QfjBjLSmlnzyi2Sn6HPO9kbl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-22 4:38 a.m., Yash.Shinde@windriver.com wrote:
> From: Hemanth Kumar M D<hemanth.250302@gmail.com>
>
> Rust 1.92.0 adds new test that require unwind table support to be
> enabled by default. Set `default-uwtable = true` in the generated
> target spec to match upstream behavior.
>
> ref:https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805
>
> Also ignore the no_std simple-runs UI test on ARM targets. The test
> fails with panic=abort due to a known unwind table issue on 32-bit ARM
>
> https://github.com/rust-lang/rust/issues/146996

Okay and I'm glad to see the upstream issues linked.

Should we make some of these tspec decisions set-able by well-informed 
users?

Maybe they can already do that using this horridly named "FEATURES" 
variable.
(rename to RUST_FEATURES maybe ?)

For example, this bug:

Unable to produce a Rust static binary with TCLIBC=musl (oe-core/master)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076

seems to be due to hard-coding dynamic-linking to True below just after 
your:

+    tspec['default-uwtable'] = True


change.

I've CCed Nick in case you guys have a quick work-around to enable 
static linking.

../Randy

>
> Signed-off-by: Hemanth Kumar M D<hemanth.250302@gmail.com>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/classes-recipe/rust-target-config.bbclass       |  1 +
>   .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 33a290412e..2a06c4ae8b 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
>           tspec['llvm-floatabi'] = "soft"
>       elif fpu == "hard":
>           tspec['llvm-floatabi'] = "hard"
> +    tspec['default-uwtable'] = True
>       tspec['dynamic-linking'] = True
>       tspec['executables'] = True
>       tspec['linker-is-gnu'] = True
> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> index b39b326455..d1fba81612 100644
> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> @@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
>        fn linux_hwcap2_aarch64() {
>            let file =
>                concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-hwcap2-aarch64.auxv");
> +diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
> +index af44dfe..e6674e5 100644
> +--- a/tests/ui/no_std/simple-runs.rs
> ++++ b/tests/ui/no_std/simple-runs.rs
> +@@ -2,6 +2,7 @@
> +
> + //@ run-pass
> + //@ compile-flags: -Cpanic=abort
> ++//@ ignore-arm FIXME(#146996)
> + //@ ignore-wasm different `main` convention
> +
> + #![feature(lang_items)]


-- 
# Randy MacLeod
# Wind River Linux

--------------QfjBjLSmlnzyi2Sn6HPO9kbl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-22 4:38 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251222093830.2658141-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:hemanth.250302@gmail.com">&lt;hemanth.250302@gmail.com&gt;</a>

Rust 1.92.0 adds new test that require unwind table support to be
enabled by default. Set `default-uwtable = true` in the generated
target spec to match upstream behavior.

ref:<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805">https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805</a>

Also ignore the no_std simple-runs UI test on ARM targets. The test
fails with panic=abort due to a known unwind table issue on 32-bit ARM

<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/146996">https://github.com/rust-lang/rust/issues/146996</a></pre>
    </blockquote>
    <p>Okay and I'm glad to see the upstream issues linked.<br>
    </p>
    <p>Should we make some of these tspec decisions set-able by
      well-informed users?<br>
      <br>
      Maybe they can already do that using this horridly named
      &quot;FEATURES&quot; variable.<br>
      (rename to RUST_FEATURES maybe ?)<br>
      <br>
      For example, this bug:<br>
      <br>
      &nbsp;&nbsp; <span id="summary_container"><span id="short_desc_nonedit_display">Unable to produce a Rust
          static binary with TCLIBC=musl (oe-core/master)<br>
        </span></span>&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076">https://bugzilla.yoctoproject.org/show_bug.cgi?id=16076</a><br>
      <br>
      seems to be due to hard-coding dynamic-linking to True below just
      after your:<br>
      &nbsp; <br>
    </p>
    <pre wrap="" class="moz-quote-pre">+    tspec['default-uwtable'] = True</pre>
    <p><br>
      change.<br>
      <br>
      I've CCed Nick in case you guys have a quick work-around to enable
      static linking.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20251222093830.2658141-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:hemanth.250302@gmail.com">&lt;hemanth.250302@gmail.com&gt;</a>
Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/classes-recipe/rust-target-config.bbclass       |  1 +
 .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 33a290412e..2a06c4ae8b 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-floatabi'] = &quot;soft&quot;
     elif fpu == &quot;hard&quot;:
         tspec['llvm-floatabi'] = &quot;hard&quot;
+    tspec['default-uwtable'] = True
     tspec['dynamic-linking'] = True
     tspec['executables'] = True
     tspec['linker-is-gnu'] = True
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index b39b326455..d1fba81612 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
      fn linux_hwcap2_aarch64() {
          let file =
              concat!(env!(&quot;CARGO_MANIFEST_DIR&quot;), &quot;/src/detect/test_data/linux-hwcap2-aarch64.auxv&quot;);
+diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
+index af44dfe..e6674e5 100644
+--- a/tests/ui/no_std/simple-runs.rs
++++ b/tests/ui/no_std/simple-runs.rs
+@@ -2,6 +2,7 @@
+ 
+ //@ run-pass
+ //@ compile-flags: -Cpanic=abort
++//@ ignore-arm FIXME(#146996)
+ //@ ignore-wasm different `main` convention
+ 
+ #![feature(lang_items)]
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------QfjBjLSmlnzyi2Sn6HPO9kbl--

