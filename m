Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F214C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 03:32:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1997.1637551944626016606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 19:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=dK0KgDGW;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6960842fb0=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AM3WONt009782
	for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 19:32:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bqV1YKBNYNvF35CNVPqZK2fKBFXcJH5ALQ+3J2owmEU=;
 b=dK0KgDGWryJOg+7K66ZfatrwGFWzOo8EnZfsx1ChP6W60rTDSjRUOzNc5QOx2l0fXeUQ
 v3jgJEnrmrpLZ1bd09yMC27O1am9e0GzfQa2e2UBH0OxhOIypn0zQYOnjRJj3y1LjrFY
 sJZ6i+e1cWw6krxzES+R0e332AnIZ/PNGDUFx7sPTAw7fbzqn4/5nv/MCNLJiXiRfW5C
 pRsiChS6deBcl1v0UFFHUSD7tZoFVQa6gW+G40jGNHQqVYedKSIN0/OqnDYzBP6Oafhb
 OEkV7H8w2QLlJcZq0RGUQH6MXlNCHeufWonsNT1UQQGSkvBAVz01R+JSsn6bbUxv6JT5 0w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cf1dr8xnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 19:32:24 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AM3WNgm009775
	for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 19:32:23 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cf1dr8xnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Nov 2021 19:32:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoqH1cOrFdMtdM4ubIgWExXV++Vmu9ArbObKvHQxUjhxzyuMkiSy8B/Q7RUl4zqj7bc2E1Xfgq9DeDq2t57Im7T1fhQfgDHb5J/+/D5S2016u/bvWNu/cgb5wxEUQXINqubADEiZNYkW2iJazw6rZ1q3sLyDIzNsawl+6Qede0sNv1TjcspMDaQqp1qi7Tgy57UOJm8cSrjs4c5/RAZ7SPxpAyTeU14t7R1Gf3PH6kUFEHiK4zy0iLReQKPmRMwQ3h0Q46Qo6sPXE495EdN7K9xEIprrIJLCRNkswVXKS1kROlPdMa9YtxuyKKZRLVFUF0I/DXWVZ3mX7Bm0l/G/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqV1YKBNYNvF35CNVPqZK2fKBFXcJH5ALQ+3J2owmEU=;
 b=PL1Ouqit3IsgiCU/bdtFb/vuCzQDVt6EgITybYUMZOE2zV/epklL5VxcYP9pa1odUDcmusmMKFQX6ZMTWTkpWMpFV709vqguFC8YoZvsbL73rMW2uYz5Bk8Soo9FCphnTvp6lhFHtEutHVh7Jr//nI3JsHAgV1MLWgjhCvNo7eDo9YiRrrRSNlQzpf4PhX6WQzAGUo5N8N8UInOV8TvhWYLBi9kyNi1j0ZlIOTLR6GVdufUdG7HRIZUIhD9/rH4X1YtS/Y0qsJuPApmRzhz4xoVjHG1HXj2rNcS2KjIM3JlJrhILhxdYn3bAkm7hXajwlzSX7QG/x8MAfGeMxdMkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 22 Nov
 2021 03:32:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Mon, 22 Nov 2021
 03:32:20 +0000
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <2f667850-b6f6-e7e8-5aef-41b2d0e64b5f@windriver.com>
 <7d5674bcfdd7de854cf8bfa431c1c46373f426d3.camel@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <07dd9b69-ed68-acbd-227d-a2ac5a46ec3d@windriver.com>
Date: Mon, 22 Nov 2021 11:32:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7d5674bcfdd7de854cf8bfa431c1c46373f426d3.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.187] (60.247.85.82) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 03:32:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c3054a-9cb8-478f-6eb9-08d9ad68b09d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5586BEC2C4F6C482C8AE668DED9F9@CO6PR11MB5586.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jsB2iMV+STHYe1iDnTaGjSFuhVyGeXTzPZu44P6+ZS41OWjExJrN1KQQMStHvjsgm/ps2o/EuFlvuEexVHsRKt/YCHxSxPuHX5r5t/PVqZ62H8IAvvas0OSDFpQ1c4BgiI/Hk+Rdia28M4Phri+tz+nsestX/SzxUeWj83mQn+cwhch/KBO7Ig5YkpJEWq8INeOfpxC/QGBkZsXUZ42Zn2vdNgEwX6ZqBJvc/ybwaOjtToF0Wzx5SjAKbQMO4VjLDeXr7ER8Ut7we2qbG/EjshWWEQDO1treyNrlLfVLhmnr0OgRLbd70YA8w1dlmPAQ7E7mEWvN1/1UYrfjLvgNt93ZEmc2lS4OQN9XYiRB7SGMC5Dp3lgl0BcUeG2I4l6wG/9VlmSRrRmVaM7bhq3eZrwht/vBot+cfnr+Z9sSFmSL0z5fjr81qdTs0fCpKwKt0NmxhMLju/kTp/IOXvYktk4BYAxNWBvZGeyim465YNqlb+UM09w1lEIswWBY6ohDfEG4FscPGQn53mPgX/JUf1g8yI9dK2JlfN9HZfFUeAZIBUBOIyWXgQNiKv/UDuWuxZFb2AvSsmyC4/9CU8BQSYnx4qfAXGdDz5CvdD2xV8MEkFBCHfZSatpP46gN46nRRshgvkOspk35WDlc1B/Dw50Q+HB88nOMZhI32SMoh3Ph21lN1G9Cx5ke5tk41uJfGIhsQcjZX2XV6+RjcFEiAhvaT3uJcw8av+huCBNnIfbozFqL/s/kl9F1JSAr5nrP49XbsNl6oTAx5Uvhl6BYWS/7WV8hdo8iEAsEZiJ+BdIH8kq4jCxk9vcKRPybsjKZdg15lzPY9KIAywb2HAax0IQ7WtiuQOMBbzVnd77ddGG4ScOn2lxeGj0nFuuMVE00BXPALujlYpzxJ2LZ9nnsbJHR0IdwEHGejN6GgkXjjbY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(6486002)(5660300002)(2616005)(53546011)(36756003)(4326008)(52116002)(6706004)(508600001)(956004)(83380400001)(6666004)(16576012)(26005)(4001150100001)(186003)(31696002)(2906002)(8676002)(45080400002)(38350700002)(66556008)(316002)(66946007)(966005)(38100700002)(86362001)(66476007)(8936002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RFdrcE5FM0dTTUZsellqR0ZUcjlVRm5obld5RlBWREUyL212cmZIcmZxYmxx?=
 =?utf-8?B?WVV6aTlkOXhpNys2ZU9BZ2xoR1VQVkttb2Q0Y0xEaC9Ib3F3TE5aZ3p3R3U4?=
 =?utf-8?B?UmFscVBoMkNKQnBHaENsR3cyOC9TUkV6VHl0R3VPdHk3bjdzT2o5NE9RTlZI?=
 =?utf-8?B?MnQ4R0JHT0pvRFFwMU1ES2ZWcjNGWVZVb2cwVStlMyswZlJlakFhTGdrSk42?=
 =?utf-8?B?M2xTelRVTHUwQTNTR2hrNjl1UDN4aStSSmpCS3FwTnZXTDlDQzNEQTdYbFlJ?=
 =?utf-8?B?dW1BZDZiVlIvZXcxKzN2RmNlUnh5L1VwV3daWGhUSXgxZVk5NURaZzB4NUdX?=
 =?utf-8?B?VTBwcWV4a1hSVUlUSmk5UnZINS9lUHJZZXZaak5hWjFvQ2NLdHJ0Rys5SkpB?=
 =?utf-8?B?UGpuV1p6cWJ4Rm56SWtaVDllWUIvSHc2Rk1BNnJaa1BONVZIYnRNTE04bjN4?=
 =?utf-8?B?YjNiNi9YMFN0THQ3VENUN09NWUpudXREcTcyTGFrKzkvRktoKzNFSGlGN1N2?=
 =?utf-8?B?WUc5N1JraHRXUlhPL0ZLNE44cHNYZzJFOG9YRWlSRUM3VEdVem9ObnhOek1F?=
 =?utf-8?B?M0UvSVpmd0hoV3hRZEQ2VFk2Z3loaDl6bEZCaWRyZFFVZUg0YlNySmF0SnNE?=
 =?utf-8?B?Qi9aSjN6ZVp6czkrb20rTWJlUGw0bklQOWtEeEVDdU0vaDV1WkYwTkdyZUtq?=
 =?utf-8?B?WjdJZnZIaGJTTSt0ek1zSjJZWXJhT0QwTVdyZk5XcldaMXA2VFpOaDdLbit4?=
 =?utf-8?B?Uk53RFdFTkZrMEYrdFlvTUFyVjZFbVY3aDJyKzR5NFkyaWY5andFQjA4eEVM?=
 =?utf-8?B?Vk4vdndFYXFSajFZWnNKY3QyR2dvS1NVaHljZU9DVEI5S1U5Zm1wdkg1akFV?=
 =?utf-8?B?d1VaT1NIYlluVkpKNVZZZlpkbG5qM3VDbFdVc0FtdUdVZmdQUWN5WU53OGhr?=
 =?utf-8?B?LzNYQTFIVzBpQUxuQnYxVzROd01TSlcvaUdnTGZoNzZpU3FPVTFFSFJOR2tX?=
 =?utf-8?B?MUxCbEwwMlYvZm5rbVVlcW51b3RrcHpoZkFtSHhzNE9pRlR0NnpUenlvbDN1?=
 =?utf-8?B?VUl5QzRFcXVMZnY5eFplTVFOR3Z3ZnU3czVtSnVub2hKV2VRZU1qZ21GOGh6?=
 =?utf-8?B?c1laeG81TjVEc0xrRFNXbE52K1RNeVlrZVJaV2xZOWM2WFpCR1VPbThRSzlj?=
 =?utf-8?B?aU4rMDVEYW52d28zcmN5UTBYaUx1WDZUL1Z0T3ZzZXk2clU1eEdJdHRlZCtW?=
 =?utf-8?B?NnVVR0dFa2FvTEp3R3pDOFY2NHZ6cG5YRFVVS01oVVJ1aXBMY2I5UGNINjVV?=
 =?utf-8?B?dmY1MjN4eFJXQUJXUERRUk51dVRybEs2NlBFL0FGbkRSUllxVEJKdzBheHc3?=
 =?utf-8?B?Q2s5SnRRenV0aG9nM2FSdlZpV0IvSzZJK3kzZXI3OVl0TXoyVnRONkF3aXJh?=
 =?utf-8?B?YmNOMlZJNk5BUGRmNHFuajBraDJGQWhWTiswRkdqS3hLcDR0djRqclNxM0d2?=
 =?utf-8?B?eENxdnBrR3VVTDFMQmNvRG9Nc0IvdDN4cmNoV1FXMEIyN3ZqblFwN3RMVmF0?=
 =?utf-8?B?MVA3WGl5aXFNZUNCNk9hZDVZUE90RWNTMUtBZjdON25Gb0pZRkdWNWJrbHBx?=
 =?utf-8?B?VGhPbHFNbzNNZ0kyajREa0NEWENBNGpONUdrd1k5MjVWQmhmd05JbExIcFBz?=
 =?utf-8?B?V05RbkF4VUNaRkNDTWY2dkVDbm90Z3ZpWWcwNG1lQ1JnVzYzVXAvcjlUek1s?=
 =?utf-8?B?a1BEdzhURDV3QTNsOWZNckVWT1lYUVozMU9MSkZMYUMyaythb0hNUmZMTjZM?=
 =?utf-8?B?V0J1elV4emFtV3Z4MUlBY2hiWEpjekdRckdlb2FzYnRUYzh4YkRzTzZIUzRX?=
 =?utf-8?B?Lyt1RFJTSU9MeXdmeU1QMjVPblQwWVBZdG90eVRQaWVkRE1MMXVNdi9KZVMz?=
 =?utf-8?B?U2syTTM5QkpJYXBIcHcwTkE5aGRBbllpU1ZsQWdXcDEvYis1Y1dIMnJuSG13?=
 =?utf-8?B?YkVvalYwSlkzM2lyMVFKTktHVStXRFVySGNHald0cnFZSG45WHZMUmZQV0kx?=
 =?utf-8?B?VlYwRVJURHRUcnBRYU1nbkh0ZHVWdm1IWlRBM2k0bXRxZDhTeXZmVnlsa2hD?=
 =?utf-8?B?clQxajA3YnFEc0haYUwxMHBIdXl6cWxoSk9kZ0MrcUczVEMzOUIzSlFST2wv?=
 =?utf-8?Q?mRUMy+1gtdxNcdRIBX93w1Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8c3054a-9cb8-478f-6eb9-08d9ad68b09d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 03:32:20.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dp4FiaQucN78Sqxb1gRcJjjBSonAFDNO84C0E6iCpAs2rAjhmQU5DJWC3AG/umhadYSpbD9vE2ARjGKpN9L7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-Proofpoint-GUID: wT7pnymnF88jyBJgHTMrjQtf_8oUuolV
X-Proofpoint-ORIG-GUID: 3fAsiMPudGqORB316WGS8KRt5tJ7VRD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_01,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1AM3WONt009782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 03:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158553

On 11/19/21 7:26 PM, Luca Boccassi wrote:
> On Fri, 2021-11-19 at 09:43 +0800, ChenQi wrote:
>> Hi Luca,
>>
>> If the real useful part is only about systemd-analyze in case of
>> nativesdk/native, I'd suggest adding systemd-analyze-native or
>> nativesdk-systemd-analyze instead of extending the current systemd
>> recipe.
>> This is because systemd has a whole bunch of dependencies which
>> basically make no sense in case of native/nativesdk. Looking at the
>> src/analyze/meson.build file, I guess it could be built
>> independently.
>>
>> Regards,
>> Qi
> Hi,
>
> Building individual binaries like that is not supported, so it cannot
> work.


Thanks for your clarification.

Regards,

Qi


>> On 11/17/21 8:31 PM, Luca Bocassi wrote:
>> From: Luca Boccassi <luca.boccassi@microsoft.com>
>>
>> systemd-analyze in the next release will gain the ability to
>> run the 'security' and 'verify' verbs offline, on local units.
>> This is very useful at build time and/or in CI systems to detect
>> errors and issues before changes are deployed, as a static
>> analyzer tool.
>> This series enables building the systemd recipe for the nativesdk
>> targets, so that systemd-analyze can be included in the SDK and
>> called by users/build systems/CI systems.
>>
>> Luca Boccassi (8):
>>  =C2=A0=C2=A0systemd: skip chown when building for nativesdk
>>  =C2=A0=C2=A0systemd: skip postinst in nativesdk builds
>>  =C2=A0=C2=A0systemd: remove /var in nativesdk builds
>>  =C2=A0=C2=A0volatile-binds: remove /var in nativesdk builds
>>  =C2=A0=C2=A0volatile-binds: add nativesdk
>>  =C2=A0=C2=A0kbd: add nativesdk
>>  =C2=A0=C2=A0os-release: add nativesdk
>>  =C2=A0=C2=A0systemd: add nativesdk
>>
>>  =C2=A0meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
>>  =C2=A0meta/recipes-core/os-release/os-release.bb    |  2 ++
>>  =C2=A0meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
>>  =C2=A0.../systemd/systemd-serialgetty.bb            |  2 ++
>>  =C2=A0meta/recipes-core/systemd/systemd_249.5.bb    | 29
>> +++++++++++++++++--
>>  =C2=A0.../volatile-binds/volatile-binds.bb          |  7 +++++
>>  =C2=A06 files changed, 41 insertions(+), 3 deletions(-)
>>
>>  =20
>>  =20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#158384):
>> https://lists.openembedded.org/g/openembedded-core/message/158384
>> Mute This Topic: https://lists.openembedded.org/mt/87118013/3618072
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> [Qi.Chen@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>  =20



