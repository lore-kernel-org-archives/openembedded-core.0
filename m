Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE56C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 05:07:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.15758.1640149677714468471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=lxE29Eek;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79909bdf5a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BM57vkr003386
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:07:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nXKeC0yQ++w8x7TyU7CJ2bwjVv9OZrjjWDrhEdJ4cCE=;
 b=lxE29EekTih4FhfViA+qGm/5gxjq5BV0equyJuVxCZbDan+6851nvrBxyxYZE+AiyAhZ
 a41dUOATbENSiJZcjW3Aen6QuJ3odTEuhVw620JQ05+EPbBd4heiVsmyTpPZS2SAq8kB
 r6T4lFOYLjJ7I3cpL0FtFtypwPV3534Nx4Lt6c7N2+cXoJ9HVK88sMLiVK1JJYhm16l7
 di4+V7Og/1Oe+RcYuQCi1TtCEMOS61+0Y3uGLsIuEqRMa/pam4cCPfReWWlbiXVKs0AC
 nf0iQXrkpl7H/m+A73UFfjLAxJZLDcyD7WE3zAFXi61uXlYdQzCDQiDCC+acuiZRySxG Ig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d3vk4r14t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:07:57 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BM57uDx003380
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:07:57 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d3vk4r14r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 21:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW3AEq95ldrluc6LPTOpgE2OAVPgY/V161v4PTnX4vA+R2AjumhSDm02kgw1cUo/xmhSt0Wjp1P78YApDWPcXelBfkAZZJjR/+UEf6B1KzoOT/hZ+TEeNT1yIud2y+9JLCMB7alh7wxopq4gwAQUwJc3S93bTmlfP3PhZ6j6IYESRcRWuUgyuZOpe/vPO4sXbpeJM0EuZiLjKqeQR120FlxCOpnn1qkhwAZit1BhSU7xNZPQ//TLzAAOuc5jXunsc8MOLCjkFpbdXLAJyE35dpXzBSC4xmkotTzgyUGfuqGkemGAvpe9zEm6v7e+r51IRtfjoj2XF46aKe9YNPrv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXKeC0yQ++w8x7TyU7CJ2bwjVv9OZrjjWDrhEdJ4cCE=;
 b=jGDsfCymm3ech3qDoPNh9K2KKfPdoby1VoVV2YfQNQzuww+hNF9wJlFg6SJBoeg1m17PTlCGcKCQxBZ86GN3B9npURyG9refyG3S3htBSPtV+Z/8tO8TRRoq7v6JQ7s+oZh/9Fct07YlCksgaf3D7L9B0sHqH2IY8lE1EatL0w0tpuVm8o3YuFKvxQACQ62CrSYebDregtSuH/yHpH3KQkjJgkd7wcMOuFQlzYnvTg4UXm6z67ZyJL8bm/Wi3gMCnyvol3i1TOaisy4Ju6GMxP6FlUjF581SKtqoyUHJHtuIPAxAfdWPH/7k257h+Bj4eV8jzqnvb96D+ce4pQ4L4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 05:07:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 05:07:54 +0000
Subject: Re: [OE-core][hardknott][PATCH 1/3] busybox: Fix for CVE-2021-42374
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20211222021125.55893-1-Qi.Chen@windriver.com>
 <50395e355ce40923537e2db7a157dd1448b60c7f.camel@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a92f9d5a-b730-4b45-d904-44a8b01ca0e9@windriver.com>
Date: Wed, 22 Dec 2021 13:07:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <50395e355ce40923537e2db7a157dd1448b60c7f.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aab81d4f-5447-4f5e-9f20-08d9c50902f6
X-MS-TrafficTypeDiagnostic: CO6PR11MB5587:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5587FFE8690E3F070A51375CED7D9@CO6PR11MB5587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u2jukfSrpOfHr9a/GYCqb3L2EF88aJltqecCFilqG3C5aqVZ3uIvf8YyWRlI1Le52/6rM+5x5iB8/kEs3E6BEiYI3/2JvM4CeMbuyjlAjEiWWl5nXQ7lfIsS1btTXEd4KnkgQbsDoQmXsDcvWfXNbkPCo6HvcjcqxmYo+qq5iQUcS58mBZMSaoIFiXcURossF9qaPtzSVSvlnBUSzJk3LN3e7Gboh4NFMoZFe6rK3t5+wf2s5yHZeHrHm2SpBsrm4SfyZ0LXkoAx+tekZKboiuY0OspufoO+HNlDK/sq27QTDNHnYdlOkEG4UH9bBjNNrYG7FtZIL83jk6XDNVQXOs1f/q6EuB87T0xl3si80Wd4pz4HFtxrh71RPvdwNWqf96+i03DMTRTKNMRIjJ45K89UXeJGjmmWr7HoCVOncvdiJ4LDditFLlh3udp/Mj0ocQmaFiWBCDjcZ2jREKAYZrygFOZB+jCaMMQss8eiySJjqEARuY1z1pVJeubM9MRRdx4oUByZFNaP6WB/++ZSVArVASZ2GTLvhp2OIPcUcANF4RGN21NU0Xkvf6PathU5HPFUntYbkJyC1yKDAf3BIBk06d7D3gmT2hjimUeaz1GZCnhcvNa60Ro6qCXQvVHwVlwCryNAGJnO4aTv7qVdwt7KqVPvWDtFY2Gm6oIcZSCq1U1KAs9PNUzRPBTw3P9tVuKCEPZezn4M3AofBRqQfvyj8rfyvJjvS+S+VUoHRh5T625hJYDaSybPqHxUUryKGrYkwQAS5IXqhqfUJBJrKK79Lhb9IUv43SY4VHM+ogz/yt94vw1fqdk0jZ/aXOIY92nb4G39sNp8FJIQ7lgTKwk5ylolWVWPfLoh0ReCOXr60ceW3NsJPqU9fpVUFy0GfzSpc9h+ebDdJRiBKGwfHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(4001150100001)(83380400001)(6486002)(66476007)(66946007)(508600001)(36756003)(52116002)(31696002)(66556008)(6506007)(966005)(316002)(110136005)(5660300002)(8936002)(2906002)(53546011)(38350700002)(2616005)(38100700002)(6666004)(31686004)(86362001)(186003)(8676002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2JNQ0lRYVJCWWo1M1kzOTBhb2szWTQ2a3dpTk0zRTROVE4zRzRrT1oydnla?=
 =?utf-8?B?UGJLazJnOEIyTHJlR0FpMHBDclFkMU0xWXR2TnJxR3AvdjhIMm40N0MrYUtt?=
 =?utf-8?B?cm9QZzdVVnY1cjlwWldrVUdXMkNyYS9yQjdkeDloV1FTM1NXTWVZNGZ0aFVw?=
 =?utf-8?B?OHhCOTNWUTF3UVlZUzJFZEFTbTJuRlVnSjF2cHE3Zm9sZkc5ZElTam1SU0x4?=
 =?utf-8?B?NVN3U1kwMkEzaTIyWlE3SDVueWEzZkN0bHdISy9QQiszYno3THlCemZJYXVW?=
 =?utf-8?B?Uk43MXdQd0d2VCs4TzZlQ09EVTRtUEU4YiswUVNqVDh5RFlhRkNOUjh5SmxE?=
 =?utf-8?B?aktoM2FidGF0ZVNqVmt3QU1adytpTFZRcjJneEN0VTd1eGJxOTZOSjJpRldR?=
 =?utf-8?B?cXpYYUZFVDgyeE8rQ2hudm5oR3Z0QjNKNW5qUmxZSDJKeXBmV2FWOGQxNW1C?=
 =?utf-8?B?S3NXNlY1TXlGSmo2SVRlbkFMNHEwbGZvSExYdXpwSEN5eTJDN2dnNmQ4WWZ0?=
 =?utf-8?B?OGs2RzNGVldCbXppQnRKNnJsNFpUU1VKdHdKK1p2MFIyeFlmOCtWeUdhVkhV?=
 =?utf-8?B?SFAzTFRhZTdqUDdZTHVIeFpoMWNObjBUVVNVMDR3clA1bnBaeHNnUlFMYmpj?=
 =?utf-8?B?ZVMvNjY1cGlrUHdjMDBZNklVWm4yT0lDYlEvV1NHckxTRm8yaWg3aXpydmNP?=
 =?utf-8?B?OXpUMVhXZHp4aERReXNObWxTV24vTGdrRk1jOFRIZUpsRWpVY3RaLyt6KzlH?=
 =?utf-8?B?dnU5dGQ0cUEwTWZZSytDWjBYN1lxT0xxVGRxenUzTFA4cjZhR1VTejhQcFNh?=
 =?utf-8?B?MEJiY2I1UkttRllKMVU4elJVZFRRVEd6Z0NycWNoZjYvN1BER05hUjRuOVpB?=
 =?utf-8?B?L2VzMjFWQ2l2VTJrYnV0MnQrcVk2SU9uNFBDUngvTVArT1NucDE0WnB4N0Z1?=
 =?utf-8?B?eDRMNzQxUFpiSjN6SHlRSGNYajcxL0JlVksrd01hSkVWWkE2MGEvVmZTbTVo?=
 =?utf-8?B?OHByN0VpOUZKT1hEZS9tQ1RBWDFIejl5eFZoUlA0RVRWRnFKeFROL0xTaTQ1?=
 =?utf-8?B?OE81YlRRcFlEWUZScEtPQm1lNWpsT0RUNVNMQTRka3JlaDYwdXNsZTV2OTha?=
 =?utf-8?B?d2FhRGgzalBwbENuRXF5WmVncTR0ODRWU0pTWmhtWGlIM29TN0lZZmtmdGE1?=
 =?utf-8?B?Z2d5REs1d0gra1YzSUptN0NqSHJ4TlJQNDVGZkpUNzcweVBmR2Ureko5Snp4?=
 =?utf-8?B?YzRZR2xuVERKUGlzTG90N1BFcDF0M0lZSnFWVXh5ZjhrK0laUjZXV0hhTExR?=
 =?utf-8?B?UzRGNXpYR2twMFIwR0FmcS9BS3UwMWwrT3RiQkJLcjFub2lBUmZGb0tBK3FC?=
 =?utf-8?B?TDJOOFY1S0ovdTc0bTlCb1ZYYXY4Q2hQc1ZhUEVkaktWQ1JJRVJ2WU1NbXNW?=
 =?utf-8?B?aklHanZFVllsMW1vSW90TGwwcU56SWI5S1ZmTHV2UEt6UlI4ak5RUFB4N0dy?=
 =?utf-8?B?NzlOTnhHb0JHMm14b0dtc0FZanFpcUZhU0hyejgybE5iUEpTdkxHWVg2R3Az?=
 =?utf-8?B?VG5GRjVzUnlBdjRQcUgra2pWaUZtVVhCTGxKTjUrbW90VVZsQ3ZXcjh5RkdF?=
 =?utf-8?B?dE92WXBTcHExUi9rTDdQQ0tOOVo1N2s2ajBWaG9KZTBsKzZiYU5VZnpYc014?=
 =?utf-8?B?dHFIV1FJNFZIR1VUTGFDRE0wUnA5UUVlb3FJMkUrNHpoUXdTVGF5SEtvT0Rn?=
 =?utf-8?B?SDhldWJpZEkvT0Y4YUNaOG9XQ0FlNkFRdjFxR0l1R1E5VkxKSzN5a1VIa3B2?=
 =?utf-8?B?V2JJN1NOY2JHd09pNHBFdVB4aGZGb0NPb3VBVlJPVU9EdmhFZ2JkOG5SdWxD?=
 =?utf-8?B?ZWttekdqRjNXSkx4YWVGU2F1OGdoa0p2VFVMRmhNbFltUW1iaXlsUnc3TEFB?=
 =?utf-8?B?cU5PNndpRHZsZSt6bVBPSGg5RWxzVlgyOGRsTHhYMW8vbmo0NFU0RVhrWW5z?=
 =?utf-8?B?WjJJT3BUMWRmK2hnbHVSNms3Rk81QkhqVXJzK1N4QXgxdENqTWwvemt4WkRo?=
 =?utf-8?B?YzM1OWlqcGtmeDhacUtLc1NQbkhIMnlva1JUK0hCdFVkUSt2cHJWcXdPTTEv?=
 =?utf-8?B?dWtZOVFiUGxMMVVHZVlBUTZTektCRWJNeE4weEdJMFQwT2ZpMEJxYXdUNnUv?=
 =?utf-8?Q?IJmOnsKWMP3kCdDra5P3LWY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aab81d4f-5447-4f5e-9f20-08d9c50902f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 05:07:54.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q4+/q4Hw8pNBVBY2TWGeqOe+wBsGjyfm/jtFsWZ5GLODPt2jQ2z2iWp+4jrrInltwuUE3bdNv0f2VI2ulDIlYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
X-Proofpoint-ORIG-GUID: ecf4hOA91H-ubMdO4-PnFKtJC3cOmC6E
X-Proofpoint-GUID: RilC7nKQfReQc-9JkIOJ6gAjXXSEH-fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_01,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112220031
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id
 1BM57vkr003386
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 05:07:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159940

WWVzLiBJJ3ZlIHNlbnQgb3V0IFYyLg0KDQpSZWdhcmRzLA0KUWkNCg0KT24gMTIvMjIvMjEg
MTA6MzYgQU0sIE1pdHRhbCwgQW51aiB3cm90ZToNCj4gSSB0aGluayB3ZSBjYW4ganVzdCB1
cGdyYWRlIHRvIDEuMzMuMiB0aGF0IGhhcyBhbGwgb2YgdGhlc2UgZXhjZXB0IHRoZQ0KPiBh
d2sgY2hhbmdlcy4NCj4NCj4gaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC9sb2cv
P2g9MV8zM19zdGFibGUNCj4NCj4gSSBoYWQgc2VudCBhIHBhdGNoIGZvciB0aGUgdXBncmFk
ZS4NCj4NCj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29y
ZS1jb250cmliL2xvZy8/aD1zdGFibGUvaGFyZGtub3R0LW5leHQNCj4NCj4gQ2FuIHlvdSBw
bGVhc2UgcmViYXNlIG9uIHRvcCBvZiB0aGF0Pw0KPg0KPiBUaGFua3MsDQo+DQo+IEFudWoN
Cj4NCj4gT24gVHVlLCAyMDIxLTEyLTIxIGF0IDE4OjExIC0wODAwLCBDaGVuIFFpIHdyb3Rl
Og0KPj4gRnJvbTogUGF2ZWwgWmh1a292IDxwYXZlbC56aHVrb3ZAaHVhd2VpLmNvbT4NCj4+
DQo+PiBBbiBvdXQtb2YtYm91bmRzIGhlYXAgcmVhZCBpbiB1bmx6bWEgbGVhZHMgdG8gaW5m
b3JtYXRpb24gbGVhayBhbmQNCj4+IGRlbmlhbCBvZiBzZXJ2aWNlIHdoZW4gY3JhZnRlZCBM
Wk1BLWNvbXByZXNzZWQgaW5wdXQgaXMgZGVjb21wcmVzc2VkLg0KPj4gVGhpcyBjYW4gYmUg
dHJpZ2dlcmVkIGJ5IGFueSBhcHBsZXQvZm9ybWF0IHRoYXQgaW50ZXJuYWxseSBzdXBwb3J0
cw0KPj4gTFpNQSBjb21wcmVzc2lvbi4NCj4+DQo+PiBSZWZlcmVuY2U6DQo+PiBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtNDIz
NzQNCj4+DQo+PiAoRnJvbSBPRS1Db3JlIHJldjogMjk3NzE5OTg5ZWJlOGNlN2Q1MGUzOTkx
Y2JhM2UyNjg5Mzg2OTBjZSkNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXZlbCBaaHVrb3Yg
PHBhdmVsLnpodWtvdkBodWF3ZWkuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Fr
b21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1
cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4+IFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4+IC0tLQ0KPj4gIMKg
Li4uL2J1c3lib3gvYnVzeWJveC9DVkUtMjAyMS00MjM3NC5wYXRjaMKgwqDCoMKgwqAgfCA1
Mw0KPj4gKysrKysrKysrKysrKysrKysrKw0KPj4gIMKgbWV0YS9yZWNpcGVzLWNvcmUvYnVz
eWJveC9idXN5Ym94XzEuMzMuMS5iYsKgwqAgfMKgIDEgKw0KPj4gIMKgMiBmaWxlcyBjaGFu
Z2VkLCA1NCBpbnNlcnRpb25zKCspDQo+PiAgwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L0NWRS0yMDIxLQ0KPj4gNDIzNzQucGF0Y2gN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94
L0NWRS0yMDIxLTQyMzc0LnBhdGNoDQo+PiBiL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gv
YnVzeWJveC9DVkUtMjAyMS00MjM3NC5wYXRjaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmFlZjhhM2RiODUNCj4+IC0tLSAvZGV2L251bGwNCj4+
ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveC9DVkUtMjAyMS00MjM3
NC5wYXRjaA0KPj4gQEAgLTAsMCArMSw1MyBAQA0KPj4gK0Zyb20gMDRmMDUyYzU2ZGVkNWFi
NmE5MDRlM2EyNjRhNzNkYzA0MTJiMmU3OCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+PiAyMDAx
DQo+PiArRnJvbTogRGVueXMgVmxhc2Vua28gPHZkYS5saW51eEBnb29nbGVtYWlsLmNvbT4N
Cj4+ICtEYXRlOiBUdWUsIDE1IEp1biAyMDIxIDE1OjA3OjU3ICswMjAwDQo+PiArU3ViamVj
dDogW1BBVENIXSB1bmx6bWE6IGZpeCBhIGNhc2Ugd2hlcmUgd2UgY291bGQgcmVhZCBiZWZv
cmUNCj4+IGJlZ2lubmluZyBvZg0KPj4gKyBidWZmZXINCj4+ICtDYzogcGF2ZWxAemh1a29m
Zi5uZXQNCj4+ICsNCj4+ICtUZXN0Y2FzZToNCj4+ICsNCj4+ICvCoCAyMSAwMSAwMSAwMCAw
MCAwMCAwMCAwMCBlNyAwMSAwMSAwMSBlZiAwMCBkZiBiNg0KPj4gK8KgIDAwIDE3IDAyIDEw
IDExIDBmIGZmIDAwIDE2IDAwIDAwDQo+PiArDQo+PiArVW5mb3J0dW5hdGVseSwgdGhlIGJ1
ZyBpcyBub3QgcmVsaWFibHkgY2F1c2luZyBhIHNlZ2ZhdWx0LA0KPj4gK3RoZSBiZWhhdmlv
ciBkZXBlbmRzIG9uIHdoYXQncyBpbiBtZW1vcnkgYmVmb3JlIHRoZSBidWZmZXIuDQo+PiAr
DQo+PiArZnVuY3Rpb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKg
wqDCoMKgIG5ldw0KPj4gZGVsdGENCj4+ICt1bnBhY2tfbHptYV9zdHJlYW3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMjc2Mg0KPj4gMjc2OMKgwqDCoMKgwqAgKzYNCj4+ICsNCj4+ICtTaWduZWQtb2ZmLWJ5
OiBEZW55cyBWbGFzZW5rbyA8dmRhLmxpbnV4QGdvb2dsZW1haWwuY29tPg0KPj4gKw0KPj4g
K1NpZ25lZC1vZmYtYnk6IFBhdmVsIFpodWtvdiA8cGF2ZWwuemh1a292QGh1YXdlaS5jb20+
DQo+PiArDQo+PiArQ1ZFOiBDVkUtMjAyMS00MjM3NA0KPj4gK1Vwc3RyZWFtLVN0YXR1czog
QmFja3BvcnQNCj4+IFtodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idXN5Ym94L2NvbW1pdC8/
aD0xXzMzX3N0YWJsZSZpZD1kMzI2YmUyODUwZQ0KPj4gYTJiZDc4ZmUyYzIyZDZjNDVjM2I4
NjFkODI5MzddDQo+PiArQ29tbWVudDogdGVzdGRhdGEgZHJvcHBlZCBiZWNhdXNlIG9mIGJp
bmFyeSBmb3JtYXQNCj4+ICsNCj4+ICstLS0NCj4+ICsgYXJjaGl2YWwvbGliYXJjaGl2ZS9k
ZWNvbXByZXNzX3VubHptYS5jIHzCoMKgIDUgKysrKy0NCj4+ICsgdGVzdHN1aXRlL3VubHpt
YS50ZXN0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE3ICsrKysr
KysrKysrKystLS0tDQo+PiArIHRlc3RzdWl0ZS91bmx6bWFfaXNzdWVfMy5sem1hwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCBCaW4gMCAtPiAyNyBieXRlcw0KPj4gKyAzIGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+PiArIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0ZXN0c3VpdGUvdW5sem1hX2lzc3VlXzMubHptYQ0KPj4gKw0KPj4gK2RpZmYg
LS1naXQgYS9hcmNoaXZhbC9saWJhcmNoaXZlL2RlY29tcHJlc3NfdW5sem1hLmMNCj4+IGIv
YXJjaGl2YWwvbGliYXJjaGl2ZS9kZWNvbXByZXNzX3VubHptYS5jDQo+PiAraW5kZXgNCj4+
IDA3NDRmMjMxYTFkNjRkOTI2NzZiMGNhZGEyMzQyZjg4ZjNiMzliMzEuLmZiNWFhYzhmZTll
YTBjNTNlMGMyZDdhN2NiZA0KPj4gMDVhNzUzZTM5YmM5ZCAxMDA2NDQNCj4+ICstLS0gYS9h
cmNoaXZhbC9saWJhcmNoaXZlL2RlY29tcHJlc3NfdW5sem1hLmMNCj4+ICsrKysgYi9hcmNo
aXZhbC9saWJhcmNoaXZlL2RlY29tcHJlc3NfdW5sem1hLmMNCj4+ICtAQCAtMjkwLDggKzI5
MCwxMSBAQCB1bnBhY2tfbHptYV9zdHJlYW0odHJhbnNmb3JtZXJfc3RhdGVfdCAqeHN0YXRl
KQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgdWludDMyX3QgcG9zOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcG9zID0g
YnVmZmVyX3BvcyAtIHJlcDA7DQo+PiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgoaW50MzJfdClwb3MgPCAwKQ0K
Pj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoKGludDMyX3QpcG9zIDwgMCkgew0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHBvcyArPSBoZWFkZXIuZGljdF9zaXplOw0KPj4gKyvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKChpbnQzMl90KXBvcyA8IDApDQo+PiArK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBiYWQ7DQo+PiArK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG1hdGNoX2J5dGUgPSBidWZmZXJbcG9zXTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRvIHsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgYml0Ow0KPj4gKy0tDQo+PiArMi4zNC4wDQo+
PiArDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94
XzEuMzMuMS5iYg0KPj4gYi9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3hfMS4z
My4xLmJiDQo+PiBpbmRleCA0MDAyZDZhNWM2Li41ZjU3NGU3ZjQ5IDEwMDY0NA0KPj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzMuMS5iYg0KPj4gKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzMuMS5iYg0KPj4gQEAg
LTQ4LDYgKzQ4LDcgQEAgU1JDX1VSSSA9DQo+PiAiaHR0cHM6Ly9idXN5Ym94Lm5ldC9kb3du
bG9hZHMvYnVzeWJveC0ke1BWfS50YXIuYnoyO25hbWU9dGFyYmFsbMKgXA0KPj4gICAgICAg
ICAgICAgDQo+PiBmaWxlOi8vMDAwMS1zeXNjdGwtaWdub3JlLUVJTy1vZi1zdGFibGVfc2Vj
cmV0LWJlbG93LXByb2Mtc3lzLW5lLnBhdGNoDQo+PiAgwqBcDQo+PiAgICAgICAgICAgICAN
Cj4+IGZpbGU6Ly8wMDAxLWdlbl9idWlsZF9maWxlcy1Vc2UtQy1sb2NhbGUtd2hlbi1jYWxs
aW5nLXNlZC1vbi1nbG8ucGF0Y2gNCj4+ICDCoFwNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZpbGU6Ly8wMDAxLW1rdGVtcC1hZGQtdG1wZGlyLW9wdGlvbi5wYXRjaMKgXA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMS00MjM3NC5wYXRjaMKgXA0K
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPj4gIMKgU1JDX1VSSV9hcHBlbmRfbGli
Yy1tdXNsID0gIiBmaWxlOi8vbXVzbC5jZmfCoCINCj4+ICAgDQo+Pg0KPj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTk5MzQpOg0KPj4g
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8xNTk5MzQNCj4+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL210Lzg3ODkwOTk5LzM2MTY3MDINCj4+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBVbnN1YnNjcmli
ZToNCj4+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL3Vuc3ViwqBbDQo+PiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+PiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPj4NCg0K

