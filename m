Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FECC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 09:08:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11494.1632820126035950484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 02:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fWu9j1Zk;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4905b2b2dd=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S8qCiM007773
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 09:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YLfCTtejo6vYgYizQ0iCNWJYOJ9xKi38IjUa0Is4I1k=;
 b=fWu9j1ZkgIFLwTTmDTcnwOJq/M6Simq0ZDNAjUgI0X8bP60McwsrrLTm14PyHvHblps/
 t6aoKwRlOlj1/2IJlCXIBecsZPFPlgsQEALYavizX9GNf6fqG24L4fa1cc1a9eWYBFIA
 iB7qxcTQanM6ZW2ohm0RZJ9Pbdp3+0u2Dn1VsjkfIwhcu00dQaFozr0fylFtO0WNuDee
 j/cqL7EYBrhfDX5w1S373CAqT8HTid4hDAZRFYyyYeKj0qS0UzyrwtWPjcxZFxcnYluR
 EARjw1oAM4K/FJmOLsk+UNbkp9/7rKT7e/DIPcOG210i4JIIFhwFSvz8VK/gzmOfelww fQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhryvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 09:08:44 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18S98i9l005787
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 09:08:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhryvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Sep 2021 09:08:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5z3vzDyk/4qkKqlni46kEcEp1YaF5bS9bsQIdKq2gkxdETWrVKPaILx4vUGXt4WBlsrSLN45crZaAjl5f37FDLlEGfFl4A/WuufW562IwGT2HVWLBcAQIyvCSNdMu+QwtEp9PDty2SDj+spTgCLX1D64Ke9jpV33/uAVQ5BJ5sK5CFgDTNLNkCJSoAJBeo79fIair7+fNiKi3sgOw2k4ikMvVRP7ssktSXnHpH/N+nTOp6QRC/29AfVzD+RuNOTqZdNQaUOGPeIZEeb9KyJ+pxH1XTTMntB0RitRFZNf+JpRLWyiT6S/L4uy2lrT6E1mI2s1POqlWI/bVMlSoeenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YLfCTtejo6vYgYizQ0iCNWJYOJ9xKi38IjUa0Is4I1k=;
 b=Qfw/9Su0tiLv6ij+Ln8Nz4gGVBm/OTJVAx8EjOmpKWykB8HE/1Ms1pGPujM9Ob1VNLYwI+aRRrajqguT6kBzlwz59IpTHUyF0BgDZO76hiKZAWBECLgsqSVh4tiJU3Q5oGESI2LMq8oUUP/4JHLHhhpB/BTHq6xWKPGVvT1M1AuQ3V/z8pmzrQQMUmy5gxjHGSUKLULzQGjt62OgKRNis9sVFQ9VCtQSnWvP/rWYksXj+4yByi6iWYvg9iCEY2dE5pEoMkRw7+UnWEXmJugkS9MqnQ+ym95XBPosgbkJ3RRdy7CrFRldRLtO6gKMjQ1jpbANvGJQnpmiw9ibvDILog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 09:08:40 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191%3]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 09:08:40 +0000
Subject: Re: [OE-core] [PATCH] libevent: mark util/monotonic_prc_fallback as
 retriable
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210922083506.29630-1-mingli.yu@windriver.com>
 <YVH8PvaqaHPeA+6d@piout.net>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <1c3f9768-ab73-8013-c8a7-c4ca03af4754@windriver.com>
Date: Tue, 28 Sep 2021 17:14:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YVH8PvaqaHPeA+6d@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
Received: from [128.224.162.173] (60.247.85.82) by
 HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Tue, 28 Sep 2021 09:08:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d331b4d6-702e-49f8-153d-08d9825f9041
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15343F5C265B9EBCA1147C97F1A89@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rX7Fh3nibPLWcwpvuqQX7ncJ/dZDVK9BRuWL6KSNzPfaNpij3V+u/+AXLGvBD4SXd+fgUx3wf6qf2Q2P7QMveen87FhvNJrAj/tbKaR4wv25pAjMrtT4RzAewGcdK4HA+wmGV1XKk0BeLmHcY5Mb/P/njv8m2NGvrJfyV67brR5xvOjGmhecR8DbQIW/S+Q46pWtEerOJaka8cjfGbd3xcdx+vzfn8xTH9meD1gfPTaJldF6qV/6FDn2AEArjndj048Sw3F+asbv4dq0DQG0qFy3jzjjtGFjQ222B373bMz6xzQYDJCKrlK5h/XCx2CMHuja39UYlg0+8sU0EoNjzl+ofnt5u2O6y0TkmKT1EaOyY60A+56qNZ9qjhfUo2pyXPrsNEiXq9gACFmGGt2DnrMRh14Nd8wDRaumNLkneH0NPEP4eyD/6xlMyIRs5o8oaxCd4g5EyDsFJcFFRM/dj82VcsuseTTZhI+kCkhmZbw2LmKjoY0ZWKeziumxjpElEDaiwvQq5COY4DkOfKgx1mvbtvkU4av4iIxjQ9CmibvQobeV/GHAcg+nuftLdx7Hiyo0LXZeCb6Ag5hjkrfPAaPvAYiSQG+KZLcQzZzBsX28rm51+8VO+TMgrw9sl37IMUApcjpJEbxx/d7CVAHJAdCWk0oBaa07J3cbYHb/Rvx+LEgO2Vow7MdamsNI8oh3pc4s2D5EtQImbZ/KAbCjYW24Y3/AdYKGIkqcSlgUGFq2Ha7lMWpRgMkfTxb7E9g1NV6Rf/pjb7MvoplgVRR8q58kIsETrsuuhMRLtEuhr4qaEHpUrF9mJ2TsEY3srAzQ9wAgZGqMnpt6LSwf/yy25V+1YVRMuuNzz9d+C8ISpbtiKFfJ+xZsLNqpGvPh0i+PJmk2D+2Js0On2lVWDphpBqKFX9IXRPXAJtUiqiLAYsQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(31696002)(2906002)(4326008)(5660300002)(86362001)(53546011)(83380400001)(31686004)(8676002)(38100700002)(186003)(26005)(38350700002)(966005)(6666004)(508600001)(2616005)(16576012)(66946007)(52116002)(8936002)(6916009)(36756003)(6706004)(66476007)(316002)(66556008)(956004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVJIT04veGI4SEVvVDM2ZDQwTGxMam5FZ1RyV0w0dWQ1bHlCRTJUaGRERlEr?=
 =?utf-8?B?cTU0YjRWbkhJN09ETlBSdGtBZ0RIUFNlRjNZdmsxN2RsWjUwT2ZaK01sY1F3?=
 =?utf-8?B?N3RhWStldVViQTZmZmNKQ1lEUlN6TWFQaHdHUUJVbCthaG5jRy9yaHh3NHk0?=
 =?utf-8?B?ZmdXa0lWR0pQUDdQeEhtdHRNdkxvdzY0WkFqN09Cdmt0T2dGdzU1S1ZTVkZT?=
 =?utf-8?B?UjhFM1JHTlFaRDF6c3BqR2pBMTVDcDBGcXZ1dC8ybVpHT1o1cEJ3eUFiUkkr?=
 =?utf-8?B?Z3dEcS8vTG9FSGRySFNsL2JFNE5XQ0IwRGF5M1FyTDBWbjhQcGxIVnhPb01L?=
 =?utf-8?B?RnpRM0dCRERiWmN0bTdiL1ZzMStOMXRQelFpM0JmYkZHcjdaZGtUYldWZnZy?=
 =?utf-8?B?Znl6RytvNUo5RU1SM0FaSUo3L1k1NERiRHVwdkkxQVZ2L21IYm9UbzQzUzZP?=
 =?utf-8?B?cEhNR01XL1R6ak5wSHA5a29xYjROSElwUVBLd1loN2cxa3JYV2Y4aFhlZDVS?=
 =?utf-8?B?QW5jSzRuNG4ya211NmFmaWxycVFSNTlOUk1uUkhNVUt5azN4MGVrSVZCM1Vt?=
 =?utf-8?B?aW5TY0JEWTh5MjhlYmcvRGRhOUJpMEVjVjdzaTBNOTJ1VC9QSVlVaEh4WlBQ?=
 =?utf-8?B?cGRCOXJvL2libFhQeDNyNjdTOGJ0L2I4blQwNlVJeis1QjRhSjdVU1Y5NUlM?=
 =?utf-8?B?TFdzVVBvcDNpL0hkcXpEcnBML0hoN3EwbDdXRkk3ajZSV2xNc25Va05FdEVz?=
 =?utf-8?B?VTdvbzFybFN5V1ZOK05oTWNrZFI5ZXo2ckQ3M2s5aFYzRmtmWUtaVmdKbnUr?=
 =?utf-8?B?QXp5SEgwWUsyRThiSmpQRmFjdkw3dWs4WUxRaDAxOThmMjdKS0FCQ1o3Zlo0?=
 =?utf-8?B?WEphYTBCZ3FHZmRGMVpXblNVdUprWnlZMXBqdEU2VXdBVlFlWUI1VXlKREFF?=
 =?utf-8?B?NWZkeGNneldFalN0dGdXT29NNS9ESzlUMWtOK2tta3k4bXBLY2hBcXRDRjVT?=
 =?utf-8?B?NjFqT3JWam9kSGpwcXJZeVZVKzhaUFVBb3BzSDBMR084bDA2NUxXbnlzN1JB?=
 =?utf-8?B?MTFrcFRMS2w4MHhnc1ZPWkdRVC9XaitGTkRVWGZWTUYxK0VlRHZMUVc4MUpS?=
 =?utf-8?B?MkhEQzR2M3lucjBPT3pHNVVKYVJ6NkN3SWZYdkNLYzkwNEJacHphUW9qMWtY?=
 =?utf-8?B?dGhtZ3dzOVFSWFQyay9LNUlET1NEYnJFdmNXV283QW44bm5IcEozaDEzOFVV?=
 =?utf-8?B?cklkUXFaaUxEb1hFY0RIcVF4bVhxMjgyVHd0UGhtNlhZVUUwMWJYamRxZG1q?=
 =?utf-8?B?c1VhN21DdjJhMGZ0WEQ1MHY4Zm0rVDdIbEk0aEZleUhsNnZqTDgwSElOQVlq?=
 =?utf-8?B?VEczbWZEVTJyb2t3QnRvWUJVTWptQW1qTG42eGw3Y3JNVzF1VkVnTDlVanU1?=
 =?utf-8?B?REJXRThweHhBQ09MZ2JZVjlWdXhlWm10MVlCU1BzNUpKU24zdUdDbUpZT294?=
 =?utf-8?B?dzhNazI0WFNDcFdRUjJJSjIrVVZjeDMxSi9vRUdqMi9wRjRTdkw5MDZ3STIz?=
 =?utf-8?B?dFM2dUdlOEk0b2ZHMjFmdUxpYloyRDI0VW1XSC9jSGx4TEtGTmhuZzFkSG85?=
 =?utf-8?B?R3dwKy9NTDBiZVY3QjFsYlhURW1VSVV5OHVxdTErRnZ6REFncUJHTmNtcm1D?=
 =?utf-8?B?d2JpbjY5cXFRNC9IcjdiMkdhK1JFUkNwZmxFaTZLdXpGWEpkeWNpVkZBSE5p?=
 =?utf-8?Q?smWTdA49iLQ3KDBSXmJD+Jr+Wa2nEXuPUoeI9Kk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d331b4d6-702e-49f8-153d-08d9825f9041
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 09:08:40.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LI8sCQDZskPVnDwQwRYK6ddB9c2zbi/Dn9mvDVXans4CkCrZFjOoJqFY7U2HTFoybon5+Ps4fDvja25kQ5L2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
X-Proofpoint-GUID: msQV_8MDWkaWEKkQjbPfzwnkv4TZOruH
X-Proofpoint-ORIG-GUID: SRtKrH4ygIORl98tAi3YPTX2MOuqnBZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 09:08:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156410



On 9/28/21 1:15 AM, Alexandre Belloni wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Hello,
> 
> On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Backport a patch to fix the below ptest failure:
>>   # ./run-ptest
>>   Running tests:
>>   EVPORT
>>   Skipping test
>>   KQUEUE
>>   Skipping test
>>   EPOLL
>>   test-eof: OKAY
>>   test-dumpevents: OKAY (output not checked)
>>   regress:
>>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>>    [monotonic_prc_fallback FAILED]
>>   1/312 TESTS FAILED. (33 skipped)
>>   FAILED
>>   regress_debug:
>>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>>    [monotonic_prc_fallback FAILED]
>>   1/312 TESTS FAILED. (33 skipped)
>>   FAILED
>>   [snip]
>>
> 
> Thanks, I did apply this patch on top of my kirkstone-next branch for a
> while and unfortunately, this didn't solve the issue on the
> autobuilders. What I know for now is that the time difference in the
> loop is not the issue and what is failing is actually the setup of the
> build, i.e, the evutil_configure_monotonic_time_() call fails in
> test_evutil_monotonic_prc(). I still dodn't find why as this should
> simply return 0 under Linux. We are looking at thet a bit more in depth
> this week but we may end up disabling that test.

Interesting, the patch did silence the failure in my env.

Thanks,

> 
> 
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...-monotonic_prc_fallback-as-retriable.patch | 30 +++++++++++++++++++
>>   .../libevent/libevent_2.1.12.bb               |  1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
>>
>> diff --git a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
>> new file mode 100644
>> index 0000000000..754c446a67
>> --- /dev/null
>> +++ b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
>> @@ -0,0 +1,30 @@
>> +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17 00:00:00 2001
>> +From: Azat Khuzhin <azat@libevent.org>
>> +Date: Wed, 22 Sep 2021 15:14:01 +0800
>> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
>> +
>> +Refs: #1193
>> +
>> +Upstream-Status: Backport [https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/regress_util.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/test/regress_util.c b/test/regress_util.c
>> +index 45caa27..a9e80db 100644
>> +--- a/test/regress_util.c
>> ++++ b/test/regress_util.c
>> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
>> +     { "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
>> +     { "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
>> +     { "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
>> +-    { "monotonic_prc_fallback", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"fallback" },
>> ++    { "monotonic_prc_fallback", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"fallback" },
>> +     { "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
>> +     { "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
>> +     { "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
>> index 4b419eab22..3f29c0cffe 100644
>> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
>> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
>> @@ -16,6 +16,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
>>              file://run-ptest \
>>              file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
>>              file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
>> +           file://0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
>>              "
>>
>>   SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
>> --
>> 2.32.0
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156237): https://lists.openembedded.org/g/openembedded-core/message/156237
>> Mute This Topic: https://lists.openembedded.org/mt/85785430/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

