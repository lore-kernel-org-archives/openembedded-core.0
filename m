Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956A9C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:57:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3620.1675843055220406652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fHAnhj7I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14035990f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3186k6X2009676
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 07:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mqxifuuIeAfL6ZqQX3OMi0+oga6cynpqrXGpA63hiGE=;
 b=fHAnhj7I8Erw9KGhh9MXmEifIoGqLo5h9gNZpgP67E8uRnorNaj2btrJ3BlSUiypTUJZ
 XKjbk6ED40KBmAHYgIJJm+dAsDXWrGXzR3G/AEV4kwgJQ/V5q2SPBoHDhWBL1w/vmW+h
 3KF3bG0ztAoPu9FjPHSaWLVZPsKwDFS0Wa1lqdCn3UhVi4kLqiCv6Z/d7D6SOuYGhgkv
 PSkswWSjNi3UgCajmQEqRa2acDfG5rjJI7wypcv30DvPRYSmpAdy7bCAgRitsUxoA6lF
 9cr9w+33R/TCn/OwE1j+a+OPCr59pfMCuxQzz/nrRqlBWBWX+j3QkhfLoKkuM1IhNUYH fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebabtxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:57:34 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3187vXhR006916
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 07:57:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebabtxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 07:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo/OMTt0nWpY0bo2H6DNipek2jwmH4ha8JHPe00HP7/VJAxPRzns7hwz1KkB3Ycw2FuoG8IovsPp3g9x9P4kqfaJbIE1kKAdt2R+7OfrguKZ5ZUr00h4HZCYWtJJXU4PzcA4EI9E3UYSLeFZFeUYNvXu2lvf4veeDXuwO4GQ69QLTO91b3smrcihGrcP8Fo+S3HTTcclXtrOZ/q0ArgHV3PSso8AhegP1+T96z8Gi5Hx/bqllt8XHDJxzzpJXB0AVIgJPi3W3ayr0QOVAKPs44t9rWnGsZUrhRFxkuNcJncvJnjzvs+EZ4whC3b97tJaJAtVgvm8rTS75x3XihQA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqxifuuIeAfL6ZqQX3OMi0+oga6cynpqrXGpA63hiGE=;
 b=nholEltgHcz86BsrPvDMgpLad/vaU993vgeqtcP7IQgV+BFiUf0Ee8BOUS0ERfaZ4CiOlNAJiQLiJ/K9Z6DGXYV5gq4ruOe9tw7uoa0uPQo3yaXHLOXfIZ88XRKqBuVA7rMrKUzZlP+ApAXwTu7H+F4sR8NnUDKpuq3E1/jMn7Cx2uxA0aiRsEva5lInWD7iJq5ypcYVQ5X1FVMmBBRBoayjGEk9sbhmAilmo3GKfnl2OsuCNh76mX5jYPFt/sjtWV+5MiIc8Cb0MqfvSibxaInFG74CWcJ7lXQUu0l+0ulqsph8sbrHktenHXMM+pakRgR/1rNRUjE9YQVk+zWDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 07:57:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 07:57:31 +0000
Message-ID: <5bc02bfe-29dc-3c8b-5a12-6ae985cf503a@windriver.com>
Date: Wed, 8 Feb 2023 15:53:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core][PATCH 0/3] systemd: split timesync and networkd to
 packages
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230208071251.5412-1-peter.marko@siemens.com>
 <CANNYZj-rtpJ51hLGKrFWGkjcGWnn7644eCyHkH+L=hjKRGKrXw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-rtpJ51hLGKrFWGkjcGWnn7644eCyHkH+L=hjKRGKrXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: baa8bd2c-8bb5-413a-602f-08db09aa2173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nh76VwcVKib/iahlGUakJNi4GQji5vuFAWBeADdDtmgLYsjVg5r+XbnFTG6KJl+PvtY0nvDV1dFto7hXZGzIj5e3L+u/2/NKwUAKtmd0ghu/3B67Ohu3M6Xc0XQTJG1efFAfJVU06Bl48YcOyBI9ExY32+A/XAcLhoVb8aNvwHIZXkUXGDsy/iTI7a+0uAPMvU5FTsBHXBwwZcMP/of+TxZLHg9FRhlkaQKjogfWHuW7ZoI+Ep5wBnIbymHhc29D1ZHWLKtrevdc717hqFIPmQ6+EhFkewQNAHTId4GQvdxjwKz5lrCZ2w93qXeJ6xv88EaDr6BkCQU8NWxDqTTjjHCP9+Hxr83cvr2ZwRXMlXiaVmJVhQDX1YkdYEsiG4X3q78YVIpLyBadQzR5e0xuFc/0hFvejc4wuvnG2AegV/m/aPXDDH2Kn7hLeb8M8mLAMSfYmSU7CPzcdKOSzxJsJs6ZQbUtAwbDxYRbT9rYdHEmd8cqCX1kVsrnoCe9YrqMOZqGFLlmM9LJlDQeqwTZR8CKMB5xZ3MaqzPYLXNUphxqYE60oK4NHvwSH56fptApwyXWWNeorVTZiorNQuHRx6kJFdajGeg1jOFp4DUo9A28jKvGxXcQRhgEZJA5KqijtaoqSVHscrG69jjjp+ubWfn2A4ctS7rG32jNP6CGP4DlVAPgMX2g/Szy4vnlSAKqa6P9Ec1qHi9bXIpysCsLJvN5T2G2wuSXb89u1srvjH5Oln4vKfcPIt4IV4uR5J9t1ZG7r8/3ihr9+e2QdUO/W3fqG0DTzThN/IGoJ0FKVLz77OFEphRCLyWAyx7tSi1S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(451199018)(5660300002)(36756003)(2906002)(83380400001)(2616005)(38100700002)(8676002)(66946007)(4326008)(110136005)(66476007)(316002)(966005)(8936002)(41300700001)(66556008)(186003)(6506007)(53546011)(26005)(31696002)(6512007)(6486002)(478600001)(86362001)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnJTUnRUajJ4cDJWR3lqeEIxaG5jZEtGVnB6eEVGOEhhbUF2anhacDlUdHcz?=
 =?utf-8?B?d2NLZVJTZGdWOFBzdzRkR0ZEczAySmt1OU1NNEpaaUdXTHRFK3hNYW8vY2Jo?=
 =?utf-8?B?dmFXc0QveDlJMm5ZdVlHeHJQVjBlNmZEUUVTL3hvVTczMGVPdTU2YWRwVUVU?=
 =?utf-8?B?cFB0Y3FCRXZMR1lUQ2hseFBtdFNnakUwMXpiRnVMeStGcWJaREtJWXBCVDlq?=
 =?utf-8?B?Y2NVY2ZkaUpuYllORGs2bTVPVnYwT1ZVangxZlEyd3RVdm1Td0U2WXhNQmxJ?=
 =?utf-8?B?UmpLNXF6c0VtWXdnN3l2dDFMNGtMVVNJT2EzcE82SlI3LzdPb1FPTjc2NDVx?=
 =?utf-8?B?TlRiZzgzRVNZZkNpZE5xZXRwYTVmaXJIV01xbkNJK3VaTDh5M0szNUl2cFNq?=
 =?utf-8?B?RG1OcVJVWEEzRkZzMytMMitSRGttekVLdWNvdnl4YnN5QlpFT0lVMWpiUWtn?=
 =?utf-8?B?dGIvUHA0bDBWS0JLTDZyeUllVnd6c1F4RVBiK0VEMGI2RCtCMnN4K1owVHlF?=
 =?utf-8?B?OGdqcHgzMUFFb1BqL1VHbXVTd3I4aWhCUkNyZHYySjFrdkcvamNKMHhRSG9N?=
 =?utf-8?B?dC9teWl4UW8zaU9XWk92QkplSVJQL3VlZmpPRnRuWFNFMzZoa2E0SXU3TWdK?=
 =?utf-8?B?OEYyYUdnVUlxbVhHam5TQ054eStzTG5PSTdXZHN0RzhzeUtuVXJEQlNSdlR0?=
 =?utf-8?B?ZkpvbktQUW1Vbm4za201UXNFdWlNVGl5RzRiUUpIMVBFT3RLUmlnNzBod2g1?=
 =?utf-8?B?UytnSHFyTk9qamg3bmt0UGF1bnFhczlmTHc4YWRscCs4T21pOWdabGx2bk5G?=
 =?utf-8?B?TW9oQ1pyUGxNMVAxMVJRL0dqV29kK2hQMG1mZ1Fuditkd1B6c2NoUGFHQyt6?=
 =?utf-8?B?a09aOWhaaTZCWnB3aWFqWDJIcWk5R3lqTm9GTVkweFpvUHc5M2ZTbDdnMDc2?=
 =?utf-8?B?Y1c1TTF5d2Z0T09PWXJYUXZXeUNONEZhK3RDUERmc2RKUWd1eHJsZTFmSXg4?=
 =?utf-8?B?T3FaTlhXaUEvYVYrZjhmSzlOcit2TDNucTVyOXkzZVEweVZkM01WL0lERElk?=
 =?utf-8?B?K1JyeUlvVjVyV08ycndQWnhWekVsRmZza3FhZ2lpbDJhZ0o2L1Vndk9NWEpk?=
 =?utf-8?B?bEgwbzdiVWd2Z3cxN1o2R3BlQ3lqMFVHMEVWUE9xazNzUG5HQ2EvMkh4Q0J5?=
 =?utf-8?B?N2piN2U0UnlDaWRpeGUvdmtmUEYwY0E3NlpFYUFkR0RBY3FxYWRpNFpjRWw5?=
 =?utf-8?B?ZG9sOFJKQXJJR1pYd2dMZTVZTmtZWFdKSS9XNCtwQ0RSZGcyWFdMNkJzM1BV?=
 =?utf-8?B?RFJEV0lVWjhQeVdMZ3lITHRBMUQ0eHhJTyt1Yk9FNTZMYkRrMmZMeENMNElt?=
 =?utf-8?B?cFMyQXEyWU8raXNQbnE4N3VTTkFnRU5URWZ1emt4SENNek8zdS9NOTM2TW5m?=
 =?utf-8?B?U0ZYdi8zL3JMWFNFZ2dIcUFSNFRQeHVXbm1wVWQyOUlZWXY2aUpaWEhoSG9m?=
 =?utf-8?B?ZFVNYnpOeHMvWFF1YU5yT21XU3ZBdno4djREN0VXTlU5VE5zZXR4YUN4R3dY?=
 =?utf-8?B?TCtLZkZFYTVDbWRwQ2xwWHpvOWIzZHZiaVNuNzBKRTBEQnFOSm5YTDNsclRl?=
 =?utf-8?B?aW50RlJzNmFhenhpdjcwTjIxNlV0dlB5TUFhc2FKOU1xdTBtQmpOMTdFUHNS?=
 =?utf-8?B?ZkJzdTRBcXFKL0hOT053SEVLZXRCT2N5bWp5T2lhZ2krQXJxVERnelhnNklD?=
 =?utf-8?B?T0ZDRWFxMkpESVQvMTFvamcyRE5OeTh1K00rZ0tkMUorbTRwcWNPL2srdW9Z?=
 =?utf-8?B?RENxbmhqZHZaVzBUdGFuWWFGVnBIbW9JUXlKNmNWallFeDR4SGREeG5DbndK?=
 =?utf-8?B?OWZRa3R0eDR0QjYwRCs5eStDQTBKQTVBNXdIdnY4MmxMc20zWnI2ZHU1RkFh?=
 =?utf-8?B?dnNWeVpRWnZvWWV4OVZWUTRzVUI2dkF0bXdGbS9qZXJrZTNPK3ZKN0o3ZTZG?=
 =?utf-8?B?STdsMVZ6dVpXQ2p1RFU5OWNpWG0weE4wWUdmRjM2dzU0WTRHbGRlZGhjSGhv?=
 =?utf-8?B?b3ZjbWhmaGUwb3FYSGNpZkxTUXN2WUlEVkZTakpVSE81UzlhZXZ6QVZhSnlQ?=
 =?utf-8?Q?ObowH/snI566omqP63GgfXgqS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa8bd2c-8bb5-413a-602f-08db09aa2173
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 07:57:31.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTubRFkIunyL85Q5d02gaviSu3uQHYFBbZmAbq3asbVhx7eu0zF9ihh6lQJDPRp9jWc+5g/15ca2mw9LoGyAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
X-Proofpoint-ORIG-GUID: Tcv8n_CY6lP3w32Iw7J_9TDgsCTCtw-m
X-Proofpoint-GUID: dWO0VVgbZQ-oYg8Rn1V0Zro34BDlKJ9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176895

I think using systemd-conf to solve your original problem is more 
reasonable.
After all, the extra rootfs space is very small.

Also, BAD_RECOMMENDATIONS is not supported well for deb package backend.
poky/meta/classes-recipe/rootfs_deb.bbclass: bb.warn("Debian package 
install does not support BAD_RECOMMENDATIONS")

Regards,
Qi

On 2/8/23 15:38, Alexander Kanavin wrote:
> On Wed, 8 Feb 2023 at 08:13, Peter Marko <peter.marko@siemens.com> wrote:
>> One alternative we considered was via systemd-conf, but binaries still
>> occupy space in rootfs which is not desirable for some devices:
>>    ln -sf /dev/null ${D}${sysconfdir}/systemd/system/systemd-timesyncd.service
> On the other hand it's only a single line of code, instead of doubling
> the ways systemd services can be packaged, chosen via a global,
> publicly documented variable. When you are writing new code paths,
> consider the ever-growing maintenance burden, always, please.
>
> I'm leaning towards installing the services, but not starting them approach.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176893): https://lists.openembedded.org/g/openembedded-core/message/176893
> Mute This Topic: https://lists.openembedded.org/mt/96825676/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


