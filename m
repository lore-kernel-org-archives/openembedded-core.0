Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C45C61DE7
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 14:30:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20646.1771684227047111516
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 06:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DIdkhwbT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6512d13505=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LEE3XE1114413
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 06:30:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=GS1ElApWDyOG1lskh90yfN
	GVZVvOwpZnNUxBo0teS34=; b=DIdkhwbT5u7ah5fdvD3iY/2eM/tOqkBpQDOou+
	zlTo7CJLubGYG4kn9VkOAyiSOiN3OMX8LRpRWtLoaM1aDKE7/swYPyl4Ok2S6/nH
	14cxSaDlwafxYvXkDjCqL1vWU5m+bkaVJgZkgp99gsqN4zM/MVUmLNsZciikZhu1
	3UYXiF6xRs+wewEfq1/Xt9PDBj3o8/jM+Xgu9jsAaKBoncDnMlHne4N2GBV0d020
	RhQVXIqbOyB9mmP5dJzI8kiabi/6ImOjpOC2PMAiebHY9Xo5eS4uSxPMNVAt18+s
	ll+359mBSoAGlFyHPZBTkzTXlYqmcYH31XAViTzUP1wY0o0g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v405sj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 06:30:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeYRI3HUV3fIjxyE3lWbicCMbRjqQ7ekuIkgHw75szIE5bPQF/g4SAbEF0K2nAqfDSohdOataDG4vSc1DdD3/DNex0Vo/QPQvxcEtVUejeJeXds0yV0s0s0MN7Hecz6apwd/4bE9GwXehd6WRpjbjnXB4uGhSS4JeWp8WOXeqWXHVz+1ORz4BuQWr8mXSB0rdXFl3XD2GneqsmgIi/yd9L96D9xMBxTPGPjXWEh77W9A4LPYIxg0lN5wra0GGhpPtXv/4tjMGcGtk+bfghuLwiNmKy0kj1NSAJmtWpqh8kHUnS+Ya6zfegS0HFnMhU3edoKGmsFdkWXBAv7FQU5hIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS1ElApWDyOG1lskh90yfNGVZVvOwpZnNUxBo0teS34=;
 b=W+mCu+7flQ3+UBW59LBguMzTGm1artfsPJm61VFlJlHpoTaCX8g7q3fCBHVfZSy0j6VOMcMB8tdVwSAXqeF6LEaJz49u3e0eoxhjreEb/wU9wDrzFVJ948V3Aps/lva9fOL2yjRis1mKnDtdNCReoGXNTYuO6Ckkf0pB1dS64rKw9ESvzlNljPX8RUYM3Y0PENjFQI6bEONcuHqf4+sl9an2evNaFcGIDcOCOglf5o9fVSyzpA05MKD30qF/k4Fe/zIVkskbfXttvaGQGHhSFDeRjZg9hx4imTufI+o3dBp2PHKP8FQgwNsEOaBwTaNrSvET+dd0F+dpmXMM285TVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Sat, 21 Feb
 2026 14:30:22 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.015; Sat, 21 Feb 2026
 14:30:22 +0000
Content-Type: multipart/alternative;
 boundary="------------W6nmiTlCYa1aBQ03fp0xIBZI"
Message-ID: <e057c0b8-6c9b-4d2d-b3dd-f71362f0808f@windriver.com>
Date: Sat, 21 Feb 2026 09:30:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: deepesh.varatharajan@windriver.com, Khem Raj <raj.khem@gmail.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260127053941.792825-1-raj.khem@gmail.com>
 <982964.1769514056170035817@lists.openembedded.org>
Content-Language: en-CA
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <982964.1769514056170035817@lists.openembedded.org>
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f208517-edb3-4c01-cbca-08de7155bed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGhmT2cwb2g1Q0ZRMkpMMXVJUGFqQmpTQTIzNFRRczZZbmlaNFlpeHJxcUov?=
 =?utf-8?B?ZVN2dnJGTWVmM0FoakpYZmRuaDhXRUVMUENUQmFwUmp1OTdzU09RcEs1RkFI?=
 =?utf-8?B?dHZONmpuK0J1eEhVRnh1bjFGckdTYzB0bFVzMS8vTXlwTDFUZXR0Y2pteWc0?=
 =?utf-8?B?MG1jUXVFYm40allMQUhnZ285V2tUY2JpTjlZY3RMMFdMSGtLZjdXYUFkWGty?=
 =?utf-8?B?WUNUQ2FSczdRTjYvd1dSRGhDV29RY3dQb29wVW5SODFQb1ZCVzZMMEE4WDBU?=
 =?utf-8?B?ZlJuTEtYa0IzRHAxa1R6NVZKeDZjUkRCSDcrWVVPVysvSVBsYlR2eHlGKzBG?=
 =?utf-8?B?OTlUVnM3RzkzSzlMTUZSbjk1YmptbmI5L1haWE10VVF1c2F4YzNVZXJrNVZO?=
 =?utf-8?B?bUErQm5jTGNEcmg0VU1SRmhuODFoWDhjR0U0ZlcyRUYrVU9CWGgzQW05eHlW?=
 =?utf-8?B?N0d3THIxUE55MTM1dFlMZE1DYmt6ZHlhZ0J2Sy9WMWRZWEY5MnBHVjh0eUti?=
 =?utf-8?B?Q0s2MTByMGhzM2JVRFVlZlM4L0Yrc0c5aXhzQTk1TjRYUkN4WmNsdElLZUlB?=
 =?utf-8?B?RkorelVsU0lRQngwN2doL2pydU5hVXA3aXNTUmJNMGdIaCtCbVZlSWtoc1pK?=
 =?utf-8?B?WlE4bWRDY3g4dnBnTnY2d1NSUnFZeUNoWVppRUZvYnpEb0NiOTF1OFUyMHZ2?=
 =?utf-8?B?U01HRW52NHBuV0JWUXViTlFxeHp1MEVrcCsxeDdUZnc3OUJ4cnVpTEY3SHR2?=
 =?utf-8?B?VlJoN1RtdDIxeTBXRkRrU093ZGNZcU1LTng0UCtpQ0JCWUVRb3Z4eGNBa1lW?=
 =?utf-8?B?M01BYVVNSlYwVlV3a0hCSEp1Wk5GU1NEM3BWdDV0RGs0V1BETHQ5SVVnaFdT?=
 =?utf-8?B?ck90RzEvUHltdng3azBRTG9vZ0ZLbE5yUmlTT3UyODYrVDJvdElXUTdKcjU1?=
 =?utf-8?B?dTZhTXBSZmUrVWhaMXdxZXdHR2REZTYvdHpiNkpiU09KTkRnOEM3U2thVU1q?=
 =?utf-8?B?aGRFUmZIS0gvcmNhVGZkeWsrMXlZWHBGTWRYZTQyYlZnNU83SklqUGhYRjh4?=
 =?utf-8?B?SERCVjJDQm96T1RFTitNSnBSOEdoVFNvUXBTQnpCQ0NaZjgyYXRNTTZJK1dY?=
 =?utf-8?B?YncyS2lVNVJQYmpWTU13U2NvbldGY0VsbVVyUXMxd2duWmlJbmlZN0VXZlAv?=
 =?utf-8?B?TEN3Z1VPSk8vUk1XMkhlUjlZVktORmJaWGlxMWF2elBrbXFvZEhoZVFwSWNE?=
 =?utf-8?B?Mjh4UVVCVjBMSnAraWMvcW56bUlNZjF5dUhjb2RZMmlYdVJ3MUpaQU95T1dx?=
 =?utf-8?B?WlVvZUliWFBPR1lObUlLeWlCZW1oS0ZYakQ3bXZ3UGhCcER3R1BnUXRmWnZB?=
 =?utf-8?B?Zy9HRkdnR28zVHBvcGg2dXdTYi9ua0MwQzdRdnBRNW9qOW94NkNuaVJJTkFp?=
 =?utf-8?B?S0hHYVRFR0tmRkMyb0JoMTFKbFFvVjNRU1p0dXZZUG9NRjlpdllob3p6MUN5?=
 =?utf-8?B?alBPN3pNdXovWWRuS205dzhjNDVua1RnazFublFKaVVLK0dQckpubkRkdGhw?=
 =?utf-8?B?S2l2K3ZYZUZiWDNKYzhrQ0hEUXRkSGhtSU5melk4V2JGTDRKTm52Mm8wL1NS?=
 =?utf-8?B?MGZuTm1qa3dVQkNPQ0MvV0V6K0xPaEV5NFdJWlVCZ1QrbWhSSzhVTHJGTHNu?=
 =?utf-8?B?ZzhGYUFycmRaejMvZ0lyelRqQ242WHJTUGhGOUxabmtXbjlRMWZtNjBDaWJJ?=
 =?utf-8?B?L1BuVExNMWR0bURVakFNbzlIeGVhbG1JN3FQTFNLU2xQYkRDME5ZSlBHQ3Rj?=
 =?utf-8?B?Ukt4R3JOb0h2L3JmNmE0WlZjTmVRM1E2akJtOHQ5MCtEcXJZSkhWRGdOSzhs?=
 =?utf-8?B?bTNhUGY1N0oyQVg0KytmSHFNMDdhWXVYOUhLSHBiUjI2aEpDQXAyNW15Vms1?=
 =?utf-8?B?anowZjJ1b0x0TWdnNEtPRTlzeGxaQkxwY1FrMmZIVVU3dHlrWWpkRXlmdXFN?=
 =?utf-8?B?SE1PNlBJOHp3azVOdEluM0ZHdjNFMWxUd3Jjenh3cGRrVXBLN3hjWFBZbmFy?=
 =?utf-8?Q?2hXrtI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVYxYlhvcEZPSkMyK1F3Z0c0TCtySWpCNkNKYVhpN3JlY0xhMTBvK0phTEFz?=
 =?utf-8?B?TEwzbnJqZVpYa2FLZzlRNXFiN2NwbWxNQ3pnRndBb1lqdGdudTArOEs0eXVy?=
 =?utf-8?B?L2VNTVZWcThzYWdpSmRybU4rNzIxcHFWZVFRbW1lQm9Ib2xyL3NZRDFTU3dj?=
 =?utf-8?B?ZzZsZWNYQ2RwTVM0dTkwZzY0Y0h6L1c2VldWanBsSWZaU3E1Und5SXgzQjY4?=
 =?utf-8?B?WXI2N0pnc1NNajFqb2JxRUVLKzIwb3Q4QnF1QWR6TGxQWkNHVmYzZ0ZnTmRv?=
 =?utf-8?B?dVVWSk1GNEtGa1dXMDhDK2EyMEl2T3VnUytMRXZYOXE4U3RoclBGYVNjM0lV?=
 =?utf-8?B?WGdVbFE1anNjRjhpdEtVVFFvNkViR0JxWmZFa0xOTUgxWWQwNmd1SXBxUTBK?=
 =?utf-8?B?eUxxNitYK3luTDVNZVNlYngvR2pXaUFTcDBqVGlPTThZM2VUbGhZT3NPRnZa?=
 =?utf-8?B?Y0xFWDcyRlkydjVyUDN4RnNFSXYrTitJeUFlZTZTQVZTdUFybVFnem5pa3E0?=
 =?utf-8?B?amVEZVlnTWthdmt3a0xIbGExeWhrY01YTWRqUFZMZFNnekx0MFE2dmE2TGRm?=
 =?utf-8?B?QWVnazBtSUpJcFJZTGRsNXRGalJ0SXhmUkNKYktoZXViZVNSY0pBa1ZwM0xZ?=
 =?utf-8?B?TndCQitWZmxFVWRVS3dycHlKcWxzd2xBYVNoa1V4RnhZcUdFT1ZSeHFFMlpF?=
 =?utf-8?B?c3d1MmhZNzVrSVJOUWtlL2hFVGxQVlBmVEFjZnhRaWVVQlZGZ3hkaXRzMWdl?=
 =?utf-8?B?eFFoa3l0UkF0TXFuWDlkNlJiNkZldnVNeUlMb1RsV2h3S2pkKzZKMlZyR3VU?=
 =?utf-8?B?TmZyanY4dVNRM3h1K3B2eWpqV1VrbHZpY2hsMUtZN3VITkNaUDBKTUllanFR?=
 =?utf-8?B?Ukl5cFE0TDJZcW12a2NJOWFUV09EcCtYK1hoR05lWTRRNno1eDZSY0FaU0tX?=
 =?utf-8?B?aHN5MEVqaGRtUzhBR1ZKTG1objRydHVkaHBmUTg3dDh3NUdTZFN2RGwxb1RV?=
 =?utf-8?B?cXVKR0pXekRmYzVnanhLeG5kTUxXSHlyTnFCcjEyYk94ZGNVUGhoaDlkNVN0?=
 =?utf-8?B?dmxFMVZqUkovMENoUmtuRXpHQ3JUVk1ZNEM4Nk1TTGQ5TXM0TUxuUXM3MVNa?=
 =?utf-8?B?VzVEU0FVUUI2RDJoQkJadTcwU2dWWklPS0RKeVRiQndqUEFZa2F5SGtrYWdI?=
 =?utf-8?B?by9RYXhGc2RpWlN4Y2xZeE9WQ2dBZEZERDBwYnFTUU1yK2FmUWUxWDVnVDlV?=
 =?utf-8?B?eWM2ckM1OCt5UWx2QVZtSnM2ZjM3Yk8vS3JDNVhEQ1FsaEJ4K3BRWW0vY1ZJ?=
 =?utf-8?B?a2F6V01ka05peUtYZFJTb2d4ZlJ5SERyZzZvQ2tCZ2x5TmcwRE1HYU5PT3I0?=
 =?utf-8?B?b0lQOTRWL3VBdk9CSm5KNk9QUE5VUFlqSjJINk1WS3YyQlJmVld2Vm5pcUcx?=
 =?utf-8?B?V3BscW9aQ0xDeThSalhsUDFCNnNQU0JtK1EyM2U3NktPRlB6WmJKSkowd3Ez?=
 =?utf-8?B?cU5mang3aUJSQW10OWQwcThBc08wdDRiMHFMdmtIcnVvdFBlMTRFdExzbmtR?=
 =?utf-8?B?d0Q4MXI3b1hRdytQWHN5dFhYdEwzbG4vMDl6LzdQek8yT1k3YlpCVGdaT2lV?=
 =?utf-8?B?OXZRN0pGellKKzNwWHhML2xGbW9hWmJwNkZjdlBQRzVQaldJeSt1TlVLbmZE?=
 =?utf-8?B?MlRFS25kMUkycHlDVDI4VHZpbWdWc1V3WTdtaEY5Q1hqRSs2SFFuQ2VjTDdx?=
 =?utf-8?B?TE5UN3pkOUhQL1dtajFrcW5WelA2RENsVFVwMjlucUNIdjhNVlM1eFA3MWZ0?=
 =?utf-8?B?TnJDVnJuSWhwRlhWOVIvL3UrYjJuRzF4U3VxSHloaWpzWXZzVHlGdjRTaUVa?=
 =?utf-8?B?QStRRlAvdU0vVmRjSVc4eFgrd0VnWWQxQ2dXSURKckRwVVhrbk5qRzFGQnBm?=
 =?utf-8?B?TklLOXRQaG0rZnJOMG9rVzh3RmRIb21LSjBaRXBKZExOemhpYlp6c0JvR1d0?=
 =?utf-8?B?MXdubVBGZmhhVkhUTkh1Q1dyemVBbUZTTmhoYktXZVpKbUF6TERPajFVQ2hH?=
 =?utf-8?B?d2dleWNvOERoNjNZNWxmKzdpSDkyZFJQK1lEdmtnb2lnNHRzS3VpK0dZQll0?=
 =?utf-8?B?SDRZNXlDT1dRZ3RVMjExZ0NyT0pCNlp1aVNGa3Nwenc3Z0lhRm1Bc0xxUjZY?=
 =?utf-8?B?UWt1cWpFQ3U2OEd4czB6RlpFNEpWVVpMdDZ4RUQzQTZ0eWRmREc5OFQ1Nkg5?=
 =?utf-8?B?OXN5RDB2NmR5OC81OEtoV3BIcytnUkp6and0VFdxYk9qc3Vvak0zVWxqU1li?=
 =?utf-8?B?SVpESW1zWVpUdDZHZ0pkRWszRFlJczI3SXY3ODNZeTJBWXI1ZzcyOFN2VjFo?=
 =?utf-8?Q?jRUL9hBGJJI2M0Oc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f208517-edb3-4c01-cbca-08de7155bed1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 14:30:22.4344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2e/oZe6GmqYJd21L7LvW8o4htf6ZKtPtaOgFV0kmmbJQUBdxWXTdSorY7mJX8SUpib1OP5VgrYsN/3SSUp5+Gv6LB6wQHhPCv7lgwo9Z1+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDEzMyBTYWx0ZWRfX8WVJ3Q1LIjFS
 sqmS0mJibORK2wYpOVRhZOOX6PNu91XLrd0uq8VrI9HNqqz1AWTjf41ewm0CIc8Icbkmt2x4HRB
 3d2CHPJXmE90bhMfmf92V/T6/WvtTh+r+Bul1e620MJeQINb3LW3aIjvK3P49Ev4hJji5YlVst6
 p/NNVm49iC+szOH8Q2U/DUIF6BB1FVNQXfP/A1O+RDCEQUR7scFgw3yTlKrVXdQTi9za5N+bTjz
 GUemO46WrSY/63nz1K88ZzKnnn7ev0Mm3R5oZo5yh+8n8QeVUEgDVRZ2QE8YXUYalwpaFIVQj+l
 opMuurJ3ju0/IWvil2LAaL+nalHlk9Pb7NpAe66CssZEVVOclhYXD6js6OzCXscGg9avmfcM6is
 ENB8vCM5rUrIwjhMMDQEQBHChCpIqz7Rgmhv7o6FpYoAJsMdIubAKwzCeHuu+nHePujn5vsIOZT
 HC4Z67gPhgxx96nKssw==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=6999c182 cx=c_pps
 a=BKMVb8u7xwlFrvPG8etDZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7XWBZI6paEkzCuwUhOYA:9 a=QEXdDO2ut3YA:10
 a=7MAC0FNn3oFhTqvBmMEA:9 a=Oe2tOjj5LLDobNXl:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: M8KoSGNArShHiHGIBvWFyaC7GiZQ_kxX
X-Proofpoint-GUID: rzVQeJe_Bq9Rf_FWFf36oK-39nKCC6LJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_03,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602210133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 14:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231618

--------------W6nmiTlCYa1aBQ03fp0xIBZI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-27 6:40 a.m., Varatharajan, Deepesh via 
lists.openembedded.org wrote:
> On Tue, Jan 27, 2026 at 11:09 AM, Khem Raj wrote:
>
> Hi Khem,
>
>     -CPPFLAGS:append:class-nativesdk = " -Wno-error"
>     +CPPFLAGS:append:class-nativesdk = " -Wno-error -Wno-error
>     -Wno-error=incompatible-pointer-types-discards-qualifiers"
>
> I noticed a small typo */-Wno-error/* is added again.

Thanks Deepesh,

That can be fixed in place or as a follow-up patch since duplicate flags 
are harmless.


Mathieu,

I don't see this in:

https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu%2Fmaster-next&qt=grep&q=glibc
or
https://git.openembedded.org/openembedded-core-contrib/log/?h=master-backlog&qt=grep&q=glibc
or

https://git.openembedded.org/openembedded-core-contrib/log/?h=master-review&qt=grep&q=glibc

Did you miss it ?

../Randy


>
> Regards,
> Deepesh
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230039):https://lists.openembedded.org/g/openembedded-core/message/230039
> Mute This Topic:https://lists.openembedded.org/mt/117484328/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------W6nmiTlCYa1aBQ03fp0xIBZI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-01-27 6:40 a.m., Varatharajan,
      Deepesh via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:982964.1769514056170035817@lists.openembedded.org">
      
      <div>On Tue, Jan 27, 2026 at 11:09 AM, Khem Raj wrote:<br>
        <br>
        Hi Khem,</div>
      <div>
        <blockquote>-CPPFLAGS:append:class-nativesdk = &quot; -Wno-error&quot;<br>
          +CPPFLAGS:append:class-nativesdk = &quot; -Wno-error -Wno-error
          -Wno-error=incompatible-pointer-types-discards-qualifiers&quot;</blockquote>
        I noticed a small typo <strong><em>-Wno-error</em></strong> is
        added again.<br>
      </div>
    </blockquote>
    <p>Thanks Deepesh,</p>
    <p>That can be fixed in place or as a follow-up patch since
      duplicate flags are harmless.</p>
    <br>
    Mathieu,&nbsp;<br>
    <br>
    <p>I don't see this in:</p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu%2Fmaster-next&amp;qt=grep&amp;q=glibc">https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu%2Fmaster-next&amp;qt=grep&amp;q=glibc</a><br>
      or&nbsp;<br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=master-backlog&amp;qt=grep&amp;q=glibc">https://git.openembedded.org/openembedded-core-contrib/log/?h=master-backlog&amp;qt=grep&amp;q=glibc</a><br>
      or</p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=master-review&amp;qt=grep&amp;q=glibc">https://git.openembedded.org/openembedded-core-contrib/log/?h=master-review&amp;qt=grep&amp;q=glibc</a></p>
    <p>Did you miss it ?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:982964.1769514056170035817@lists.openembedded.org">
      <div><br>
        Regards,<br>
        Deepesh</div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#230039): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/230039">https://lists.openembedded.org/g/openembedded-core/message/230039</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117484328/3616765">https://lists.openembedded.org/mt/117484328/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------W6nmiTlCYa1aBQ03fp0xIBZI--

