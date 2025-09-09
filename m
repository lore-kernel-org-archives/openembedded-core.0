Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE4DCA1016
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 01:00:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1088.1757379628896559713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 18:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rzJcukgg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13477e4776=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 588JU2IG339774
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Sep 2025 18:00:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cw6vkZxbRzm4NIq1Fm8KEiX7v964+gzMB+PMey9iBJA=; b=
	rzJcukggjZFjrRPM9gdCkBSkM7hwXesJnYTrl9Bhx1P6wXS86NjmWlgXQuF0cipA
	mtUwjcR9+zCEZClhIiSosq8hYvyqWVjqtuE/1Ga7hc5XndfKFLgmPv3MHfqO9yQF
	7QzcL1Kr/B/IBiE6lbivslTobX8xO3PKWUV0wlJSKFRti4qkaQndmao+dFk6Jwbf
	l9eZzzVl/eWSdIjhkfBQlm/Bkbj4Vbpe5LmiYnPotYYCQX4C7hkh0pbXtgMNjJB9
	rJ6J+XrenyK9dP3VsycDt3XsusU6Hzlr/qfHltG//EU96FyCazJeYZ588TbMKXyb
	KOPdYXYeQM5eL1x5csIr0w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg25p6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 18:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfmQey4V5DNpBccR2mdOIRWCycuRrvD5BHsNUlDvbXb/9vV5Z9kw4j4J/RBmHBeiR1q0eMu8gTONKvlK4kQOgzY3IZtgPHHODS2hMX0dTuz5Fyvsy+pKzNuU/ORudBhmXfjmHnHVjtN0sruPIiV3a9A1H0XX5YoC1KXw7KbZYzPZ7t+z0BEBjGdYRp9hV1Ag+7bQGGcj0tOQEn0PFTZyccMjKbHpQ5YwcnQL8ApifF0nIPEAnPYd75nu3KmA3u4tLqlADkNAGn8Axscy9ybvt9lK1oh5dkN83OlkKnJIQN4fqfjA+LqGmoHu/Fq9SL4ynKi2wOVmUmNTM7Or/PXw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw6vkZxbRzm4NIq1Fm8KEiX7v964+gzMB+PMey9iBJA=;
 b=T/KmfLQTs6SMLvT9M30FNfSTFqMIp9T/HNdQ1BEf8lxb9rz2Bk4v4SJLXpjhU7S0pnfujyVts1quOMxbFemDRufvV/3E20e8jPXhMh3rnbrzy/mJghRuI3xhS+lXo4UBmcb92jCNhB0s4dgxDOZaaA94/H2J+5eX6ECQyEArBN0OLx3AqMNMPvyFfI2i8MlTaQjN2TvnugxBj/H4TTabWr9Gms/7RiDSqlRpNUHIcBe/igL7+iOp8/WUdm/UNoFMq0kqGIXR9bYiLdvSCIoZHd4BXlqKeM+okAfy4SWd/8kAT+GMERV9llNNJzAvgh+shA3v7fuVUOp/e7l3s6zhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:00:23 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:00:23 +0000
Message-ID: <44fb444c-c434-4702-b8ae-e78a19180619@windriver.com>
Date: Tue, 9 Sep 2025 09:00:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] systemtap: Fix task_work_cancel
 build
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250908024455.634404-1-jinfeng.wang.cn@windriver.com>
 <CAOSpxdZHjHSeJm0WscXGw5m7gbCyFgPyKKZiG9jZ5rH21B1UbA@mail.gmail.com>
Content-Language: en-US
From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
In-Reply-To: <CAOSpxdZHjHSeJm0WscXGw5m7gbCyFgPyKKZiG9jZ5rH21B1UbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 8addd731-e817-4e70-dd24-08ddef3c4186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d2NkSlR4UldjT1h5UDNxcW5ZUEl0NnZvL000ZU93bzhmTDZ3aHVKMU9RRU9J?=
 =?utf-8?B?UXVpU3NVeGhHOHhKdGdtWXBGWlllZWJNYlhsUSs2REFoSXVzNXVUME56SGhS?=
 =?utf-8?B?TURINE5iZGVNZ2QvejBEcTNMcXZjTklaSlowMEkyZnE1TlErVHl6Nmg3c0Ri?=
 =?utf-8?B?KzR4Skc4cHhrTVJYNGZIMHlZZWhYTnlXbVBZQ3hISzMxeklra3Jqa0tTWUdI?=
 =?utf-8?B?L1E2UXovM2RRVldrUnIxdTgra0svbUVVREdZNWZTYjlCNmFDOG0rSmFDdTNo?=
 =?utf-8?B?eXFTWWJCOFRhZ3h6dlR5aVpDZlRYWVZ0MjM4MTNYY3piVFpNMkE3dC9SdTJI?=
 =?utf-8?B?cmZwMjhsTTdSZVJBUVRJMTN6UXFIVXZIZFUzcGtLUjlNRjBtK3FxbVM1MWNh?=
 =?utf-8?B?WWJaWGkvM2p3amliWTJXU05ZWWg5NnBUcW1pR3NKekV6azRySCtUSWNXcnJF?=
 =?utf-8?B?a3JuY1NtZ21Md1FEdzVpKy8zY3BuYjM4akM1Yk82MGZKTzFZd1RNQWQ5YTlQ?=
 =?utf-8?B?dkxVeWdMa0RLWkFMSGZMMk1hWmFCQzhXRHpud1VDQ1F5SEtwZ2RMVmkwWHhu?=
 =?utf-8?B?Ti9Nd0RDWklRZXp4OEc4bFZwMm9rcUFmWXhaRllydm1VSXF3cnJkcWErOTRB?=
 =?utf-8?B?dlNaOU9FQnNxbDN1VCtCVWo1b296bnplUDVNekhZUjlMSmhlRVUrMUpkbVY2?=
 =?utf-8?B?dlJBbGxhRUhJaXRzQklOanVrQVBTZVlTUWkwcmVtNDlVeHhONjcwTTlZNjMy?=
 =?utf-8?B?aWhzbVJiN0ZJS1pOc09XdmpxdTlCOTViYmpHdWNQa0l6NHVuc21wNlBMZXdY?=
 =?utf-8?B?aDlIZDVaYjVsdURLM1owWXNFNnZjU0JiSEpGWjFQMUlENCsrV2JmYUFKT0lV?=
 =?utf-8?B?SS9hUnV2U1pOd0pZbGJvUWM2dHhoMlBvNzBnRWo0ckdyK0UxeVc3a01JSkVT?=
 =?utf-8?B?UHpzL3pPMXNDaE1ET1ZZZjYreUo3a0xCYnAwajZ6dTR5U2JLOGhDdE94U1Fi?=
 =?utf-8?B?VTBYUDdvenlEeGt5M3REWTFaTnFPTlQ1aGZ4bi9TUFlJYU5YQUJRU2ppbXFw?=
 =?utf-8?B?bmdtZ2hsWXUrNGZ6MVBMUVRqanUwUGU3WFc4ZzRPRmpieTQzMkptUmJlVlMy?=
 =?utf-8?B?b3VOQWFJNXB2TjJPcG1zYVNPc3MxeHlmajJxc2cwcmVmSzUxSitQTVB2ZWM2?=
 =?utf-8?B?WFFsS3AvUmwzQjBEZnBheFJRMHE0QkU1MTRPRUhPM204c3Q2SjVJMEVyS0hy?=
 =?utf-8?B?L25CZjlpODRvRFYyaTIybDdROGtiREdIZEdWSzJZUGN0VVN6YnEzRDRHQ2ZK?=
 =?utf-8?B?OUFZdWNnekVxTWtoeDEwbENycjhVdk5iZEd4bzNrQW9wUVYrdGNaTTNzSDVH?=
 =?utf-8?B?Mmp4Wktua0JFTGJnTXBEdTE1MjV1TGtEdTJ0NEgvQkNQQTh2dEg5UDhCbDFs?=
 =?utf-8?B?ZkFlS2ExcmI5ajRVdXVBVTBrbVJxdmM5MHRYN05NVW9tbk84bkp2UnhXaWZy?=
 =?utf-8?B?R05UTFZwVGtIRTM3elJseWdCYWJGUjlEMnYyeWtnMTYzaVRMQ0tPWlhBaHVu?=
 =?utf-8?B?RHVJZGNGQjVFU1diTzkxK3Jnd09wVnpEUC9YcER0UWlVQmx1dUZUbzNxSXAr?=
 =?utf-8?B?RXRoOW83TVFGbU1CMWpwNElkMzFJQ2xzYWdwT1NkdXNqNSsxM1VZOGZtckgz?=
 =?utf-8?B?TVBqWTJwSlMwUGVaR2NlZlZpaE95ai83c3hhQUQyaHBpNENESFo3a3pQQjRm?=
 =?utf-8?B?TzFQSFBsR3djc1gzTjJnVG5SZXZhZ09TTlFzOW5Xcjk2aHZGWVZxbjVMVjlY?=
 =?utf-8?B?dE1JcTVxM2V2V1BqVE5YNkk3SnhveDRoVEIzSmtzRnV3MjR4YlAvbVNvejBN?=
 =?utf-8?Q?TzUATrU/GHe/u?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1lEcVlmTG5GVmxtbVFQR21qbWVjUFdhUEVtUHhhd2twOVJVenNsckEwVjlW?=
 =?utf-8?B?WldFcStZQllPVEN4Rkk5dmh4Z09HV3FGNlJjK3JqTGhuK1FuWHNWK0c2eTd2?=
 =?utf-8?B?NUFMTzhXbW9TZTJJclZjcmtiM09JYlFyM3NCb3FQMWJxSUdqMEJNbFo5NjAw?=
 =?utf-8?B?V0xWV3dYRWo0dmNYdStDejdBYmRMcWIxTTBXMXdxeHRRWVhNVnVPL1VBUlpT?=
 =?utf-8?B?dlRObGNrT3dkV01TdExIZ2ZLbDVFSVRsU1U5aEdDTHg5b3d3YjFqZnhySWJs?=
 =?utf-8?B?ZjBSMHpOSDFrbkFqaGYxdDNpZS8vTVZZbWVSRFg2dC9RdEVsU3BMb0JZbzBG?=
 =?utf-8?B?SldRNTJOamtoclhhV3U5RzlJRWVVOUtGUUlyS0dlbVNwWDAwYjJYSFgzRWVT?=
 =?utf-8?B?TXlzNzdUb29UT2NiWVBOeU9tL1VtQXNXbWpkZWszZzZ1YWNNeGdXNTB5NXNU?=
 =?utf-8?B?bWJJT1F3UndXaHlVTmJYdDd6TUcxZzA3QjVJK0hVY09NUFNTMnNXRXBJcXhG?=
 =?utf-8?B?RlY1OHVuYkZhREtXT2EzWFZxRnNTUHVHRjRVUklnTFdqV0dXQWJTOUNLc29U?=
 =?utf-8?B?bDV1ZWh2SW16QW8xVkUwUGh1YllRZFhOYWVSM3lLV0JYRHJidVhaaGowMHJK?=
 =?utf-8?B?WUxwam42UjQ5TGRwb3B6YWJuOVh0TGdqWXN2MFJsb0s0bkhBVVdSUGwrSHUy?=
 =?utf-8?B?MGRaWVZFQVVwbXNzUFo5dEJmVmJ4eUsxUTlzSS9hdkt6dkZiOGtTYlk3eCtS?=
 =?utf-8?B?dEI4aU9OZkJwQUhtaEhkd2VEaVVOd3RYelR2bGQrWEJCL1NSN0FjT1RuZmdm?=
 =?utf-8?B?amZJT2kwNmhZUFJPZUo2QksrcTVsbVE0TGNGYWprRUV3VlJ3YXVRakRtNS92?=
 =?utf-8?B?a0h4M1BQK256eTl2d2QxVTlOcDRIbU1tYmlxTXVkTFIwYkJweFluUjBkUTFX?=
 =?utf-8?B?bXBJT1h5N09aN0lyaDNUcTQ4TURtejZJakpndE5wT0V5clM2b1NRVnRoL0JC?=
 =?utf-8?B?UGp5ODdvcEFUeER4cWpNM1grN05IOEIyVldLdGc2N0pxdDA4WThQampWUENl?=
 =?utf-8?B?aWljOXl3SU00OXdSemtZNlJXMEZjdkIwVTlXNWJEeU1jamtLVk5XL0xVeHFC?=
 =?utf-8?B?b2tHRktGVUovRnJ4cGE2dFc1ZTFTbUVKS29LWXVUUE5IVllHSytHVzZyOTZD?=
 =?utf-8?B?dUZEemN0a25UTnVLWkhieHQ3dTNYKzhobjZSNWlTMW92Tk1wVE9XV2h1cHFn?=
 =?utf-8?B?RXBsRDB2YVFiWTZzYmJUQldVZCtPMGR1WjFIRjVQdXJqaVd3NkxSMkJlY0pi?=
 =?utf-8?B?TDBGcHpzRERlRklvSllrbWo5ZXd6ME5SNitaZHpYdEFqSUNNbVBZc0ZFdWF3?=
 =?utf-8?B?MDdPQ2NJL2JSMFhEbVR4VE14ZXE2WW5jMkhtMGw3MjVLT1o2UE1iR1ZNb2pH?=
 =?utf-8?B?dDNUM0FkQlpQZ0MzRHFyZWlJclIvaEl3L1BmamN1YTlQU2IxZC94RWNJbytI?=
 =?utf-8?B?T2JCR3dGT0pSQy9xYVY4WFdoaGQ2RE5kUzFoOURpeCtWOERmTm1mVG1iSlg4?=
 =?utf-8?B?UWxRNThEc2UrQitudm1BVkhabmRNYWRXYUl1ZEtwNXIyU08rM3F6L0YzVW1X?=
 =?utf-8?B?QTNKNWk4N3VqSVBLNDFwSkxYNzRWdmdmKzRQM2VyRzBrMUVBZ3BOZExSN0lr?=
 =?utf-8?B?R3ZIVTUybFA5UFlxaDF4bHZKMzNRVW1WRmpJSEVBaGR2QUNKV0xibS9najBJ?=
 =?utf-8?B?RkMvZWYySWdxeTZSUW1SR045dVMrL2pOQ3pHMllvZnd5NDJkLzFhM2ZEcGw1?=
 =?utf-8?B?UDdLa2JOOHBuY2NuOVZOSlFIQnU3SHZQaFhMZTgvMXpKN01sNmNndkxsZ0NF?=
 =?utf-8?B?S25nVzdYZDZ1b21vSkxXQTFjVWF0MXpHQlFEbHJmZ2szcDVKd1U0RkJuZ3pt?=
 =?utf-8?B?TU5YWDUwcVdWU096QmlyMjJKMVNrTm4rVXU5c00rWTN4dUhjbGtUMUpqZmpm?=
 =?utf-8?B?clcwWDZUbUtGVG84NWV6K1R3a1dpdnJqaVQvZ0lFYmZYMlRXN1RKYVlPVHZT?=
 =?utf-8?B?LzNnRGFaMXpIZDk0VEF6ZFowUFdCZ3dwdUpVeHZONnBzQnNEQWx2NS9SQTFm?=
 =?utf-8?B?T3NRSVVGZ2NQeVE5QjliYzNkRlFhR1J2QU4wSi9YQ2gxRmFjMjNxR3JjVnRG?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8addd731-e817-4e70-dd24-08ddef3c4186
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:00:23.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyFNc13XVTeaL8ZunFBB802SwudcZiz228gWb9GDd1ZSEBZ4/irKB5OYC0MZqVAcmttcf/xahkt7+73Bg52IEOHas1wuKAdoJZgLJ8UoUIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OXUaAwVqYeNFkiJmq8tnEq7b4kTAFg3w
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68bf7c2c cx=c_pps
 a=PsHZ2D2ELw/CC0ItkZK1jQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=CCpqsmhAAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=_enOPnqeAAAA:8
 a=hQPCTLDhK2dNLkF-KCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAwNyBTYWx0ZWRfX5Nh6EBlNQoRS
 74vH2GOMAE4k3FGWjZCpDehdP5Ykf2bHQSWIV/r9wzWLvbVMSEmnzEOEMMwRrCnrp353j0R9wtd
 pA5kCpTdmkUH2vubFntUJ1Fdul0DmZ+Lq3MOcoc1hSKoQ9uvaM1dD8hbtsCXloBLKwK7CjDYAns
 SRm9H8+edO4ie+bGHvBsmP365TrfK4UwUfKvQkHA5oMl81fGN0iDIzD5np2y6nZ79vKeq9deLZv
 U8h5tm7C3U9SLI3G9EC7pF6iDcnUa7sHy4t8dzKsAitHRzWLHQxz3p6Lemeh2DllU3Ha7gl5Eoq
 bHTrd4hA1hp7i6w8iv/Z7G20GrfxUCFVdua87aoX1F8r/5QdUiM2P7tirUvvYw=
X-Proofpoint-ORIG-GUID: 5EYFGxX_tHN67sgYQ5Wy0qE_vKbPnxGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 588JU2IG339774
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 01:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223087

It is not an issue on master or walnascar.

systemtap version on different oe-core branches are:

 =C2=A0 5.3 on master

 =C2=A0 5.2 on walnascar

 =C2=A0 5.0 on scarthgap

The issue is fixed in systemtap tag 5.2.

 =C2=A0 git tag --contains a64dc4e2e019
 =C2=A0=C2=A0=C2=A0 release-5.2
 =C2=A0=C2=A0=C2=A0 release-5.3


Thanks.

Jinfeng

On 9/8/25 23:34, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Is this also an issue on master or walnascar?  Or has this been fixed
> with a version bump in those branches?
>
> Thanks!
>
> Steve
>
> On Sun, Sep 7, 2025 at 7:45=E2=80=AFPM Wang, Jinfeng (CN) via
> lists.openembedded.org
> <Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>
>> Backport a patch to fix:
>>   107 |         twork =3D task_work_cancel(task, func);
>>        |                                        ^~~~
>>        |                                        |
>>        |                                        task_work_func_t {aka =
void (*)(struct callback_head *)}
>> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/=
work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share=
/systemtap/runtime/stp_task_work.c:107:40: note: expected 'struct callbac=
k_head *' but argument is of type 'task_work_func_t' {aka 'void (*)(struc=
t callback_head *)'}
>> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/=
work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share=
/systemtap/runtime/stp_task_work.c:13:26: error: incompatible types when =
assigning to type 'struct callback_head *' from type 'bool' {aka '_Bool'}
>>     13 | #define task_work_cancel (* (task_work_cancel_fn)kallsyms_tas=
k_work_cancel)
>>        |                          ^
>> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/=
work/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share=
/systemtap/runtime/stp_task_work.c:107:17: note: in expansion of macro 't=
ask_work_cancel'
>>    107 |         twork =3D task_work_cancel(task, func);
>>        |                 ^~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> ---
>>   ...sk_work-compatible-with-6.11-kernels.patch | 103 ++++++++++++++++=
++
>>   .../recipes-kernel/systemtap/systemtap_git.bb |   1 +
>>   2 files changed, 104 insertions(+)
>>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make=
-stp_task_work-compatible-with-6.11-kernels.patch
>>
>> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_tas=
k_work-compatible-with-6.11-kernels.patch b/meta/recipes-kernel/systemtap=
/systemtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch
>> new file mode 100644
>> index 0000000000..62a8dafa9b
>> --- /dev/null
>> +++ b/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-=
compatible-with-6.11-kernels.patch
>> @@ -0,0 +1,103 @@
>> +From 317669e7b44bc2688253f5ab9641c308f30566bc Mon Sep 17 00:00:00 200=
1
>> +From: Martin Cermak <mcermak@redhat.com>
>> +Date: Wed, 24 Jul 2024 16:47:42 +0200
>> +Subject: [PATCH] Make stp_task_work compatible with 6.11 kernels
>> +
>> +Update systemtap runtime so that it works with kernel commit
>> +68cbd415dd4b task_work:
>> +
>> +s/task_work_cancel()/task_work_cancel_func()/
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dsystemtap.=
git;a=3Dcommit;h=3Da64dc4e2e0195ca80c6509df511a42459b40e9af]
>> +
>> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> +---
>> + buildrun.cxx                                  |  1 +
>> + .../linux/autoconf-task_work_cancel_func.c    |  3 +++
>> + runtime/linux/runtime.h                       |  2 +-
>> + runtime/stp_task_work.c                       | 21 ++++++++++++++---=
--
>> + 4 files changed, 21 insertions(+), 6 deletions(-)
>> + create mode 100644 runtime/linux/autoconf-task_work_cancel_func.c
>> +
>> +diff --git a/buildrun.cxx b/buildrun.cxx
>> +index 816842072..4c528b1b1 100644
>> +--- a/buildrun.cxx
>> ++++ b/buildrun.cxx
>> +@@ -396,6 +396,7 @@ compile_pass (systemtap_session& s)
>> +   output_exportconf(s, o2, "__module_text_address", "STAPCONF_MODULE=
_TEXT_ADDRESS");
>> +   output_exportconf(s, o2, "add_timer_on", "STAPCONF_ADD_TIMER_ON");
>> +   output_autoconf(s, o, cs, "autoconf-514-panic.c", "STAPCONF_514_PA=
NIC", NULL);
>> ++  output_autoconf(s, o, cs, "autoconf-task_work_cancel_func.c", "STA=
PCONF_TASK_WORK_CANCEL_FUNC", NULL);
>> +
>> +   output_dual_exportconf(s, o2, "probe_kernel_read", "probe_kernel_w=
rite", "STAPCONF_PROBE_KERNEL");
>> +   output_autoconf(s, o, cs, "autoconf-hw_breakpoint_context.c",
>> +diff --git a/runtime/linux/autoconf-task_work_cancel_func.c b/runtime=
/linux/autoconf-task_work_cancel_func.c
>> +new file mode 100644
>> +index 000000000..0d460de6c
>> +--- /dev/null
>> ++++ b/runtime/linux/autoconf-task_work_cancel_func.c
>> +@@ -0,0 +1,3 @@
>> ++#include <linux/task_work.h>
>> ++
>> ++void* c =3D & task_work_cancel_func;
>> +diff --git a/runtime/linux/runtime.h b/runtime/linux/runtime.h
>> +index a5840794a..acb32d584 100644
>> +--- a/runtime/linux/runtime.h
>> ++++ b/runtime/linux/runtime.h
>> +@@ -246,7 +246,7 @@ static void *kallsyms_uprobe_get_swbp_addr;
>> + static void *kallsyms_task_work_add;
>> + #endif
>> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
>> +-static void *kallsyms_task_work_cancel;
>> ++static void *kallsyms_task_work_cancel_fn;
>> + #endif
>> +
>> + #if !defined(STAPCONF_TRY_TO_WAKE_UP_EXPORTED) && !defined(STAPCONF_=
WAKE_UP_STATE_EXPORTED)
>> +diff --git a/runtime/stp_task_work.c b/runtime/stp_task_work.c
>> +index 0dd3095b6..4818fecbf 100644
>> +--- a/runtime/stp_task_work.c
>> ++++ b/runtime/stp_task_work.c
>> +@@ -3,14 +3,25 @@
>> +
>> + #include "linux/task_work_compatibility.h"
>> +
>> ++// Handle kernel commit 68cbd415dd4b9c5b9df69f0f091879e56bf5907a
>> ++// task_work: s/task_work_cancel()/task_work_cancel_func()/
>> ++#if defined(STAPCONF_TASK_WORK_CANCEL_FUNC)
>> ++#define TASK_WORK_CANCEL_FN task_work_cancel_func
>> ++#else
>> ++#define TASK_WORK_CANCEL_FN task_work_cancel
>> ++#endif
>> ++
>> ++#define STRINGIFY(x) #x
>> ++#define TOSTRING(x) STRINGIFY(x)
>> ++
>> + #if !defined(STAPCONF_TASK_WORK_ADD_EXPORTED)
>> + // First typedef from the original decls, then #define as typecasted=
 calls.
>> + typedef typeof(&task_work_add) task_work_add_fn;
>> + #define task_work_add(a,b,c) ibt_wrapper(int, (* (task_work_add_fn)k=
allsyms_task_work_add)((a), (b), (c)))
>> + #endif
>> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
>> +-typedef typeof(&task_work_cancel) task_work_cancel_fn;
>> +-#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (*=
 (task_work_cancel_fn)kallsyms_task_work_cancel)((a), (b)))
>> ++typedef typeof(&TASK_WORK_CANCEL_FN) task_work_cancel_fn;
>> ++#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (*=
 (task_work_cancel_fn)kallsyms_task_work_cancel_fn)((a), (b)))
>> + #endif
>> +
>> + /* To avoid a crash when a task_work callback gets called after the
>> +@@ -35,9 +46,9 @@ stp_task_work_init(void)
>> +         }
>> + #endif
>> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
>> +-        kallsyms_task_work_cancel =3D (void *)kallsyms_lookup_name("=
task_work_cancel");
>> +-        if (kallsyms_task_work_cancel =3D=3D NULL) {
>> +-              _stp_error("Can't resolve task_work_cancel!");
>> ++        kallsyms_task_work_cancel_fn =3D (void *)kallsyms_lookup_nam=
e(TOSTRING(TASK_WORK_CANCEL_FN));
>> ++        if (kallsyms_task_work_cancel_fn =3D=3D NULL) {
>> ++                _stp_error("Can't resolve %s!", TOSTRING(TASK_WORK_C=
ANCEL_FN));
>> +               return -ENOENT;
>> +         }
>> + #endif
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/rec=
ipes-kernel/systemtap/systemtap_git.bb
>> index 68f5c76428..c2874516f4 100644
>> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
>> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
>> @@ -9,6 +9,7 @@ require systemtap_git.inc
>>   SRC_URI +=3D " \
>>              file://0001-improve-reproducibility-for-c-compiling.patch=
 \
>>              file://0001-staprun-address-ncurses-6.3-failures.patch \
>> +           file://0001-Make-stp_task_work-compatible-with-6.11-kernel=
s.patch \
>>              "
>>
>>   DEPENDS =3D "elfutils"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223057): https://lists.openembedded.org/g/openembe=
dded-core/message/223057
>> Mute This Topic: https://lists.openembedded.org/mt/115124766/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

