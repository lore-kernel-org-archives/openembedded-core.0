Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C10C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 08:00:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10967.1706256031304143304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 00:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Opvdl9/v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1755b81852=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q7wAFQ003800
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 00:00:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=/7ZT+TT5zwh5E5x5rO+vv0aivCHhzN0i9z1Y+aVLdoM=; b=
	Opvdl9/vMx8ffH/QpT3w5AqGrEzW4M+Uao8rOnMEkPQj1/XdCxJ8hqEY3Vkjo6h4
	9DVYfmEwmpT2z1oU7/1jCwhQt18f9Wx5uk/wfJjHQChJdYSisq5riytjdpmRfHRm
	U19GP39dP+P4ejrTF+05Qfd8teNX8A4W5s6vPp+URfYjzqXj+/8VziSnZok1pFu/
	Kaf3tFcP+EpVoi9Uz0giYgJ9Vi41U/i/JnK65d4NKl4A9FmkIjgDN75kqPPXWqmj
	E5O/RPqKT8S+SRK8EHkGN9waIHP8+LE41ujUIaXGA6GEbN+uF8zcpaXai7klQL7C
	muCWrVgB8vDRpLC53+CgoA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5sf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 00:00:30 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40Q80Ugg007229;
	Fri, 26 Jan 2024 00:00:30 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5sf95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 00:00:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF+6bkFhA7Zcrl5a0DHBJR48LnUHmzIQSvLy9yZpBPNwpThJPqFB7KrJhGzAzuzAKc0KYLnSakuenpecGqFf3C7BihMlasp4Uiwo0O+zmtEpAUlDWrY7f4tXiSPNHptaRRLf+uNUA5n1+HaaOr7YgIMH/SDaVz3khb9T5tjqePOwxn8M7BRKTZOL9YjDI1XzG/t7XNQknNV1Focns3/KmGBY9IEcOCexu9H67e6aVC276ieS1Ul+QAB02P/ESscT8VF8cL5rEnvLM2wf0MkMEiCZ2Isdv3AuwNwqTko+mclFWpBYMbo3Z8Vlr9AoGKmjj240aC1+KIjaMYz4PEqBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7ZT+TT5zwh5E5x5rO+vv0aivCHhzN0i9z1Y+aVLdoM=;
 b=mKoiaz/KeI54zpx/Rv1UjJJBHNEPWdc+W3eDQnfY6TMy8SANt/XJ6aKrum29rq6oiSGxlYiAGj30EHNNhP5b/hBN9yMtMtv6Uq6bkxMId6BsLZf6onJPh7rIFbVhhds7GG2zsdeLNlCmvq3UpArR53e5S0DF3Mn+6WHGAVW61QnMcR7499+oH0Ovz1DDnUELnIXDEXn+0wWBHn/yYNk2mboj73IBAT5iRRygZLbbVLtYcFt3QAnBE9rGI48c5d8aCzGmlVpsf+fMeYJr7UbK1CwnSW903+0mR+bxThCdqnV5T40uenw44w26uAsDg6tFX1zfxL6ZL8eICa86fWrkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA1PR11MB5826.namprd11.prod.outlook.com (2603:10b6:806:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 08:00:27 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217%4]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 08:00:26 +0000
Message-ID: <4d812e2a-6764-4b8b-985e-12a45ee29179@windriver.com>
Date: Fri, 26 Jan 2024 16:00:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 1/3] pkgconfig: Correct the PV
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240125092554.3657475-1-mingli.yu@windriver.com>
 <CANNYZj-iqAqBZm09r0WviUt7NyZyJascDm6SstFPyYu3ZV0WkQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj-iqAqBZm09r0WviUt7NyZyJascDm6SstFPyYu3ZV0WkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA1PR11MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: af8cfed4-93e3-45dd-e86e-08dc1e44db4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	evWaf4PZMiQOdSXmS0zAsyrYL6Nq9w6RTSgSIZ4GUlI9Bv56bEh/moz1g4IWF9IrioWjs/snVZpoMCDYKqSnUTd4bG7e0Tj8Q7xtjtDRrHTczXHyeFpboHejFHyZdd2RoYM3VcR/vGc0WVfuIrhSDxehSqXTUdRHVraWS0OE3PcLWqCxjoupCPa1uaCmbg54d6qxdAFnVa3P/PiIGos0s24mfUeP0zl49YnlrVvEpU7KS5F303lMwQx2rVHG6/vSiZovCDHQwYbaKDmP3820dyuwPlQUkqLs2pWc0+d/VZWktD2rGxOjYWq38tj2tsvmXtFCsUXTFWj4A+nDcofRD6jITYt/SrYlIgEDJPBjEABktTVfjqZ4CVCOKdZ8jJf5dHyLiV2J3KMOPukpg6cFyrV54tYmm7gPBd+s5SsD/sNlnpBWLkTt3dqFs7dk6E9KKLbyXHlhkWehzmCfyOWKs2taaow+g90LBOsup3Cda40x5vKsEyQsmaqaGfbAU6rPc2LoNTTJn9hHskn4LTP5SWBZyWtoXLk3FClt3LSNQ/8pV/fNwlj3bQn6kjtplyJqOIbqSFPWLjnxlUZQptGzG/R8hX5IYXbsGOHCdxgzE5j+ptRjBDxAbbZoX7habSUQfaXsbFAkFXuv/A9VSIBiEHh3omO8EZcAsWH0Uh7aWGtJEg7frXH3IZh85rMOwYnc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(366004)(346002)(396003)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(6486002)(966005)(2906002)(38100700002)(31696002)(86362001)(41300700001)(36756003)(110136005)(66476007)(6512007)(53546011)(66946007)(478600001)(6506007)(5660300002)(4326008)(6666004)(8676002)(8936002)(83380400001)(26005)(316002)(2616005)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWtTR0RtMzd2TkhrRGpnM1R3NmxINmdCWkJLVFdmUDNVY2thVGtRTUlLR2Yx?=
 =?utf-8?B?Qy9YY3pRbGxPVHR2N0FicmFKUml1bWR0eEp3bE9HR2NndkdlSzMxZGpqTXph?=
 =?utf-8?B?THl0ZDUyNjFheG5IQ3VMUksrMlY3SXBKYzlsNTRJeWdBeWlYVldTVGpib1pQ?=
 =?utf-8?B?T21WWE16dlA3c2trNGlIL3UyQU9qRGdmNFRxTW5hVFJqYWp3STIwSi9nam41?=
 =?utf-8?B?OHFCcFZReFVtOVFSc1lyVFcwbnhiUUsvb3R1RktUcjk5cTgvaE41WFBQUXhq?=
 =?utf-8?B?U0JsSWs0WGdEZmhHc0hGRU1ZcU9BYkp4Z2ZOTXZacnRoOWFvMnNUekVwdEkw?=
 =?utf-8?B?VloxYU44aytKUkVFc290VW1tSEFTaWFZRlBmeUlFTGxyTzNzbklsd2d4bWVH?=
 =?utf-8?B?dE1tbWF4eXRhUzd5QVBpeFhvckhiR0dDRjh6RWRCbDJ0SjBjQkRhTGtic2N1?=
 =?utf-8?B?ODd4SUJCdEhXVTYxcDJ5TkxWWXZVUW4ybmM4NHQrKzVVRGM1UnN3Z2w0eUht?=
 =?utf-8?B?amxCMzVQYWUycmVIdXZXQXh4enJOR3NSVlpIcUxMT0MxK3lSK1M2QmVyTVFs?=
 =?utf-8?B?MFNtd1dWR0JSVUJibU13dkdjUmNQSmZzL3F5NUtXNWpJQ3pWb21wdnZxbUFX?=
 =?utf-8?B?OGYyTGlFbkhxRWdDcXIzZzhvd3lVMVFFUi94YlRWTXV6d3MwcnBMOVBLNkZt?=
 =?utf-8?B?OVVzalZxQWFmNjA0dlYzcEIyMmgwcUVxQUNSSytZMmNtZWNMMHdQeVlYK2lM?=
 =?utf-8?B?Q2N4OHR1Y2k3ZDhhY0o0TDV4bVZDaS9RTFczRXI1bE5HYThLQVNxWmNaVFZM?=
 =?utf-8?B?bDFaR2l2alh4aVdMNnZFdFVhQnhMT0ZIa2ZmYzNIN3ptSzh0U09DM2hYYkRK?=
 =?utf-8?B?WFF2di9LUk9OTVZPZ1Z5cjYwUExnL2VQL1NQQmduVmN0T2RRNWJmL0swbDgw?=
 =?utf-8?B?U2kvQVArSjNXb3BLVnAwRlQ5L0xIUHd6d055dXhhUkduV3N6eHhQUlR4ZUVr?=
 =?utf-8?B?bWlhMUtNK2w1am9oRkFCMDZEQkFPSEpIVFcwQW5PTFc1cExDNFJpb2IwaGl0?=
 =?utf-8?B?bWpaWGI1cnIwSFNKN3FlTlYzZFlySFVjWG9zQmM1SFI1eHdRN1oweEpENVZx?=
 =?utf-8?B?cFBURExkc2t2TzdjTy9qdEtjN2wyM3lVYS82QWwvVEh4OWhGM2c0eFhMZkI0?=
 =?utf-8?B?Qm9UY1MzSk5aeTN6RHpJREhrK3N6WmVKc0ZXQ0VjRW1oSFpVa0Nma0grdzhv?=
 =?utf-8?B?TllYN0lFNm5Ma0t5M1FiUEJjZm03a1VJbEVxdTRJSGhKRU1ROGduWTJIRnVv?=
 =?utf-8?B?Wk04ckUzd0h2bi9NYm9SdlFHMXJPYlR6MlN6L0Z0Q3plUVEvSHZHbXBmOGwx?=
 =?utf-8?B?MHpYVnVYYUNCaFBxVENXUkNHN3k4ZUZ6NDR2czhRSjhZc3JNUFRkRVlOSzdE?=
 =?utf-8?B?N3hNUG5OZzFUQ2ZjTXVSYWRmLzBERlI2c0h0enBHb3RjMmFpZ3Vxd0FCdi9P?=
 =?utf-8?B?QW11TGZrcHZwUGJnMXB6M3FSZEYxbDg0RVVxbld3SWF2cVFrbCtUaEJXTWZn?=
 =?utf-8?B?ZGMxTHRHUnFwa2VJRlpvb2hjendCKzBIUGVwQi9VSlFrWDd4dnlJUG85Tllh?=
 =?utf-8?B?YVc5SGZyRmRDVDNWcXFyQnU3b0RscDhUU2MzRnpVS254N2MwMkZ6VEwzQlk2?=
 =?utf-8?B?d2s2ZmdVdGszWWx6MFQ1TzFhMmEvUFRDeDJHblRXQ1E0SlhLQkdVbmtZVmt2?=
 =?utf-8?B?aTlKSUlwaklDbEplK0lCMmIzQW1IQkR3ZDJabk4rRWJTd0FJL0Q2L3lKdWYr?=
 =?utf-8?B?WUU2ejVQTjRVMDhpZDBsSmlJRGE4dmNNVkx6SUFDWTI5czhmaEpYTmY3Q29L?=
 =?utf-8?B?RmVJWkFqQ2JMQzgwVi9pZDhSTTdPcFh1VnNlTkxpQUdYaGZvTjVPRW9xRkc1?=
 =?utf-8?B?ejdxelN1TTU4MGR2WlJkS2FlOC9WRXhMVE9HdzI4bm9HQ05xZU1ocjk2bCtj?=
 =?utf-8?B?bms1OWp0Y0xub0U1WWVKNFJjeFZpYUM1VzlqWS9Bd3JpQWFsT3BvcDA5RXF0?=
 =?utf-8?B?MUg4RzhjZ2R2TkFIVnU2eWZZOEltOG05aU5NNDRPSUMzd3YzVFQycjBlUGZW?=
 =?utf-8?B?RytNSGFxMmVXRXNDZ3hJK2VsMGRYaS9EcUtrSGRhYlJkQTRZMHFJdEZHUW9q?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8cfed4-93e3-45dd-e86e-08dc1e44db4f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 08:00:26.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BDo6uiB54CoK6Q1yZ71DA9oOsenhi2eKj5+jR1jTqeI+OZhBc9vZUJBycIFBEsIx48XNgFPmFYFJk4VGYy73g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
X-Proofpoint-ORIG-GUID: ShncRh-WMZS0aHm7FaBhnf600FyynVsV
X-Proofpoint-GUID: 86DmNR80-NQlm_wFxj0vsDMrQA94nkJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=849 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 08:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194347



On 1/25/24 17:29, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Thu, 25 Jan 2024 at 10:25, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Correct the PV to make the version consistent.
>>   SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
>> -PV = "0.29.2+git"
>> +PV = "0.29.2"
> 
> 0.29.2 release tag maps to a different commit, so we cannot drop +git:
> https://gitlab.freedesktop.org/pkg-config/pkg-config/-/tags/pkg-config-0.29.2

Thanks Alex to pointing out! The commit [1] did make to update pkgconfig 
to a non-release version.

[1] 
https://git.openembedded.org/openembedded-core/commit/?id=fd621eefee1a4acaffa3754b76f8e14d2684ab3f

> 
> It helps if you explain the broader goal. Why does version as reported
> by rpm need to match version as reported by component exactly? Can't
> you strip all the suffixes from what rpm says?

For some reasons, the user complains the version which rpm says is not 
consistent with the version which reported by some binary as below 
though no function impacts. So we try to fix the gap.

  # rpm -qa | grep pkgconfig
  pkgconfig-0.29.2+git0+d97db4fae4-r0.core2_64

  # rpm -ql pkgconfig
  /usr
  /usr/bin
  /usr/bin/pkg-config
  /usr/bin/x86_64-wrs-linux-gnu-pkg-config
  /usr/share
  /usr/share/aclocal
  /usr/share/aclocal/pkg.m4
  # pkg-config --version
  0.29.2

Thanks,

> 
> Alex

