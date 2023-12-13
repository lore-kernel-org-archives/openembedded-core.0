Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E1DC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 00:29:07 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.113])
 by mx.groups.io with SMTP id smtpd.web11.12387.1702427342858598427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 16:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineo.co.jp header.s=selector2 header.b=Ud/d4iD/;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.113, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU3eAHnemMcSSXKC1S4t9p8WvGm7pYqCY4Zk0grV+Em0/A7IjkKIwObCUXNuzkuP9a/xxJfOFBz1NwkdXo9oiPb90e/6kH6YgzyN4AmURzQYVsLTwEAoazVHPayECrXbWuBN3iu3RgWpO3TxugAe5j8IXqTWgahHBPNt6IglirdHj0ZRiHPCqU0zUukDD/cr2geUeP2iVwEIZJwHFDhoCyvZZEq2K/ITWWzEDhL8kU8SAlNGUwxAiT2wsOTF/V0YUE/cJhe7Cor0N/v2aZRV5jQ8ntnHsWSc4vabgMtUv+gPpcVTd1bHFRxg0qFB4YQV9YE67VTdL4ITFpMOn6yaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os2J/Ls790pvfpn2gkk5RL2pvjb+zpkcBEHUoU+lUSI=;
 b=VEQlfB17pNjp6u+UeIIwJh8G1RljdRVapTAcJzGBDqGO7PT7HLuJupJLUYVQFU3kTIaWO/W9thvZuhL2Y9iIfUpdv4Kiayia3qX4mjmKRsI5yTEvC8nQTiXDl2f0C9trLTel8YevWO6kKYLJav6WVAERBFicrCZ9kszu4CcW5fJhCNdI7RetbYInZnBpwWdSuCppTmEzXeMQv1EHZQ5nx6ke+QOiYZ5IsDrsfyLd/mOwT4S3D8bqhfsJf7UH/d8R0zLbeOpOFRXuIWC1CtAEBOPuK43bAVjzEKAH5suy28SVh67414N+uXeOKDChTeMSCPvYaHW5ZIsZw819/zjYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os2J/Ls790pvfpn2gkk5RL2pvjb+zpkcBEHUoU+lUSI=;
 b=Ud/d4iD/xdMBdWNp+0UffCqLOPxz3b1NpfWT+lMDysP+dTbOJauAj6HD20DoDJStlxhp7Pkzfn9JmHO15d+L631HV2MG15N/V2UM79XKp32kmrvD5EIQam6ubk52yB4QhkfPjZq7xtDDxa/0YxBzm1MQOlh/7gjoWNjm0XRFYtwr8x9ffMNLSGazIyjO/QYeRSO/6FtnQSia6aUYa2QB1YOnQmUeqyZldAixVer0wlmV60RJ3rnmGNfeiNG4k61/t9kfZsfJ5RCIq/KexUxgGmi8B26v1UPDzntfA3ANz7PG1lf5lYGqQv8/BtjLOvEoQAtgzeocfD8Kk5L5kv46Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY3PR01MB9825.jpnprd01.prod.outlook.com (2603:1096:400:228::13)
 by TYWPR01MB11343.jpnprd01.prod.outlook.com (2603:1096:400:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.25; Wed, 13 Dec
 2023 00:28:57 +0000
Received: from TY3PR01MB9825.jpnprd01.prod.outlook.com
 ([fe80::ebe1:58ea:6434:6c37]) by TY3PR01MB9825.jpnprd01.prod.outlook.com
 ([fe80::ebe1:58ea:6434:6c37%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 00:28:53 +0000
Message-ID: <3a7e694c-e65b-4321-a3de-a60f32699584@lineo.co.jp>
Date: Wed, 13 Dec 2023 09:28:51 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
Content-Language: en-US
To: dnagodra@cisco.com, Yoann Congal <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
References: <20231208050439.461257-1-dnagodra@cisco.com>
 <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
 <a11d36d5-5151-404d-8065-f68cb2eadd19@smile.fr>
 <SN7PR11MB6971B5B0381A29B57317419FD48FA@SN7PR11MB6971.namprd11.prod.outlook.com>
 <179FF5FCA11A272E.471@lists.openembedded.org>
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <179FF5FCA11A272E.471@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TY3PR01MB9825.jpnprd01.prod.outlook.com
 (2603:1096:400:228::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB9825:EE_|TYWPR01MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: cc12119c-9d91-420b-d713-08dbfb727c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qImB4zweHaLod4TuZAMzQ8QXARbrJBgUcudb68vN+kBKcLBjynqatnlVOfroa1pWjVS46SZrH730bB35Uu2U6ysgHTVwyD8BuaxpFko7monaOCeGdUUwaje9TsK3gdY+1xDhB5VpK0nEGsXFbN+LjN8ZefgOm8w5Jp48Mm2sUwpteBQRLvBbFdvVAfArDewr2maBWmy28gMVKbcttXJsMHCyS6BQ/U7caD3PsE6VpqizoQi2JIwWNBVFpaVQRysjFCPJZKOks8pdfyUr+2kHznok5XY7mYuvizzs8sAwGoMBveOlvnRXMx0SDBwWDyRf1SgmPMGAbAZsyLGjO9eeDheySQuffnhEbovWgtndaO4+5TZleqKJGpQ+YREdWiNoEzRJKJ8okjGrd1tweHDqYqtm8XgG6c9NhmuyFS94CXthNeS85aYs+NieK5BwAxyUvVFvThQPomBOzMbCm7edZTXiYbsTxpJ5aFguY4CRkO13nyqG45bKtlrA786GpLunI+5fhcziGRZIC1bnqjhQ0rk2+FqYX31QZNcVEnSxue5HNhflEYbjLuzAG2djSqe9qrEcqe2jPszTr0mVeVchz04FelXbXhpEsO+/bCJlhGHAtSwcaSsbP3HA0LLgIoRFCVOsK9pE7G2ZNjIk2UCThA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9825.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39840400004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(66899024)(110136005)(66476007)(66556008)(66946007)(36756003)(86362001)(31696002)(38100700002)(53546011)(6512007)(2616005)(83380400001)(6506007)(6486002)(2906002)(478600001)(316002)(26005)(8936002)(5660300002)(8676002)(4326008)(41300700001)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3lLbFhCSjExdkllQWxUblNSVE5KMEdibUN1Vk10Y3dYQWV2QVVwdHJxUUNy?=
 =?utf-8?B?bE5CQWhONG9yaHdQejkzWnlSMUhEZi82MTViVjNoWStTdjdUbnJKa3JaZlR0?=
 =?utf-8?B?ckE4V3NiaXJhQVBNZENENTUwMWg2a1J0OU1EYm85VGRKc045OGNtRGVhakkx?=
 =?utf-8?B?VitabS9lSVQ2dW92YW5WcHgyb2hqMmVoUWo2d2M2dlUzcTQ2c0V5bXZQTXp3?=
 =?utf-8?B?R0xGaHp3SUtOaDZWNnpRNzhlY2pPN1MvTWtoUy9VMUNDT0d4ZWNPZ1FaZVQ5?=
 =?utf-8?B?SDNZOXVMNDFxc0w1MGZNM2pXWVF1cG5JOStvb1ErRlpVS0Jndks2a0tWa2Vi?=
 =?utf-8?B?OHZpTjl0K2gvanRpNERTSEgza245NTlMNmtKZ1hadno3clpHd3pxWEJ4R3BW?=
 =?utf-8?B?cXRyZ2JQYVRVaWFxODcxdU9aaGlEaWU3VDErTVpZOFptdTZJNSt1ZDNZNnZm?=
 =?utf-8?B?Y0pIZlBSZVNzQzFwNHF4OE9tWitLaGxhNEFEUGpkYk9NcmdHWFFnWFJpZTkr?=
 =?utf-8?B?a3FObnRITzJMM3ZxTkMxeDYrdmo5SnVReEw0RnNsRCthMW1sdkRkVFR6eVJD?=
 =?utf-8?B?M0ZhVUhzcGZrcVFhdExFaWNGMjJoTVhWcCt1RXBuRE83TTc4ZjlNd2kwcEY5?=
 =?utf-8?B?UFVPYUREYkpNdmpuZFpqbkN0VXJCUUVabkRhbnU4dW5aYklMUXlYczlYT25a?=
 =?utf-8?B?Zng5NUJPQ2xvN2J1S3RJK3IwYlFCWU8xcUJCa01ITVhnNU91czRFdEVGdHEw?=
 =?utf-8?B?SWUxdkRRZFRyMjVUZTF0d1VtVHQ1bzNoalV1TUoyTmh6UTF0QzlpZmFpTmQ0?=
 =?utf-8?B?RzlwQWRUVUZ6cTdhVzVCaWNqVk5tMXhGMUJiNmZoRDJqOHMzalB4biswTEl1?=
 =?utf-8?B?RFRReDhmYU83K2dSdXAxVGNXNHBTRUpQZ3hOalRod2RyYUdOcnkzYW1BZEl4?=
 =?utf-8?B?SE9NUjFkcng4N1BRNm5BSU5XWXlzNzl4UUwxS0ttbHZJcDFPdmVWVVd2T1Bw?=
 =?utf-8?B?ZnFuSEhway9rdTNlRVlqbFR4U25YaEw3WmFMc1l6bFFvMmNoRDUwUENsQ3Nh?=
 =?utf-8?B?T1dIc25aZ2pwYnI0azU2VUp0V1NIdDJ2TzhVQ3B3N0xCeXU3dzFoZmkwZUx2?=
 =?utf-8?B?TVVlTzBFUTBOUEkxVE9qdUltbmVLNUEyTlFha3MwcS9xZFhuaUdBT2pWelV6?=
 =?utf-8?B?aVZubXd2ejVJaG1mZStuam5WMS9OMWRXYTEzWk4zSVBLWEhkQTRQVExDVnEv?=
 =?utf-8?B?QXNwbk1uYnRIZXR3clkxSTU1bWpTK0lNUmducjhsQmFTUy96WUE5TEJQbjRK?=
 =?utf-8?B?eHVsUjFWdUgwQzFwWWI1M3hwcVg3UFhXWFhRT3lENVNEWWxmZFdnMU93SG5P?=
 =?utf-8?B?Ui9UVUIvdzJzVGpYb21DMThTZnE0VzVEWVJnZkZoZy9kb0RpaGI0SkJHSytW?=
 =?utf-8?B?M1V2U0JiZXJmL21WR2lMaFIzbXdsQUlVTFZCUmZmVDdpM1RpZ3NNYng1RlBL?=
 =?utf-8?B?b01QYXdMb0srbEluUGVjM25IM2l3N1phRmRlT0VPYStpOEY0VHRYTVl2ZGVW?=
 =?utf-8?B?OTJLY3VwaVdwKzJ4VlBRT1lsQnRGejhRZXA1RDRObDlIUUxnQjh2UjE5cjEr?=
 =?utf-8?B?bGNsVVlHNHdvZmU2WWJQMkJxeXZSQW5ISVNVa0pNNTJDQ0ZJeGFRZWoxZmNJ?=
 =?utf-8?B?QkorUlVReTBwa2pGTGxFR1l3UTZQeFg5dXhJQjVjeTl5UGJrZWszRWFZbitY?=
 =?utf-8?B?ZUVVQzQ4cXhpVzVOdEsxNGFvOUsyNzhKczRhL1hPZEtXcnJEMDdoeEQyLy9m?=
 =?utf-8?B?ZkFJZFV5T1ZVaXY4ZG0va3lMeXgzK2o2ZDE4SmJrSyttYkJFamxOWXl5ZDRj?=
 =?utf-8?B?dysrNFhFeTVVQXJSeTJHcTJhUXV6Y0xFZjIyalVONk1hcE5DRk13NDM0QUhN?=
 =?utf-8?B?ZzkraVdRa2lEQnRUSUhJeENhb0F2MXUyUUlaaDZQL2VaY092RXZSZjJ6dXU1?=
 =?utf-8?B?YVluaFo5MUkyNEgxb3A3K0g2V1RkN2NUQ2xEY0JtUU5ySWNVdFIwWkRWRWFI?=
 =?utf-8?B?Nk1iK0RPNis2Vk5NTGRvTDJoMXZsSjFUY2ZUUzhwdzUzRFJ3VGx6RjQ2dG5P?=
 =?utf-8?Q?r3GiI/DR1CT3VbSvkTOp+XoXB?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cc12119c-9d91-420b-d713-08dbfb727c43
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9825.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 00:28:53.4207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBIcB/bNQD6ZV1l4d5WCx3chRub4bdu8G+xpLvOEvdrIeLFC92i8pyPsz6dHc6gYTxzlj2+hPjzZ7GamzgnHWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 00:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192254


On 2023/12/12 11:54, Yuta Hayama via lists.openembedded.org wrote:
> I think you are right that HTTP 403 does not look like reaching the rate limit
> (As Yoann noted, 429 would feel right). The HTTP 403 error returned may be
> because the request is being sent from a single PC, so I will try
> cve-update-nvd2-native:do_fetch on three different PCs. This would be closer
> to the actual use case I have indicated.


I have been trying to test running cve-update-nvd2-native:do_fetch on three
PCs at the same time. The result was that only one machine continued to make
successful requests until do_fetch completed, while the other two failed with
<urlopen error [Errno 101] Network is unreachable>.

It seems that only one person can fetch in my assumed situation, no matter how
much we try to adjust the delay time...
>>>> As a specific example, multiple cve-update-nvd2-native:do_fetch runs
>>>> in parallel can easily reach the rate limit. It can be assumed that
>>>> this situation will occur if several people run bitbake in one office.
>>>> (often unaware of each
>>>> other...)

Also, the following was my misunderstanding.
> Perhaps someone has not read the documentation
> about rate limiting, so the server is putting a delay before returning a
> response.
> That is, I think a single bitbake will not cause the issue.

The reason it takes a few seconds for the server to respond is probably that
the response is too long and the server is struggling.

In fact, if we send requests repeatedly that shorten the response, the response
will come back in a relatively short time, eventually reaching the rate limit.
And the HTTP error code at that time seems to be 403 for some reason. This is
the operation that clearly causes the rate limit to be reached, but it still
does not look like it will be 429.
Below is an example of test code:
-------------------------------------------------------------------------------
import urllib.request
import time

cves = \
['CVE-2019-14899',
'CVE-2021-3714',
'CVE-2021-3864',
'CVE-2022-0400',
'CVE-2022-1247',
'CVE-2022-3219',
'CVE-2022-36402',
'CVE-2022-38096',
'CVE-2022-4543',
'CVE-2022-46456',
'CVE-2023-0687',
'CVE-2023-1386',
'CVE-2023-25584',
'CVE-2023-3019',
'CVE-2023-3397',
'CVE-2023-3640',
'CVE-2023-38559',
'CVE-2023-40030',
'CVE-2023-4010',
'CVE-2023-4039',
'CVE-2023-42363',
'CVE-2023-42364',
'CVE-2023-42365',
'CVE-2023-42366',
'CVE-2023-46407',
'CVE-2023-47100',
'CVE-2023-49292',
'CVE-2023-5088',
'CVE-2023-5156',
'CVE-2023-6238',]

for cve in cves:
    url = 'https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=' + cve
    print('URL:', url)
    res = urllib.request.urlopen(url)
    print('.urlopen() done.')
    #time.sleep(6)
-------------------------------------------------------------------------------

Anyway, the question of HTTP error codes still remains, but unfortunately the
situation of multiple people fetching at the same time seems to be difficult
to deal with.


Regards,

Yuta Hayama

