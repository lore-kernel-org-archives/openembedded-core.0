Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE66C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:28:34 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.10334.1639398514274477015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=ym12O6pf;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=798194e796=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BDC17KQ018072;
	Mon, 13 Dec 2021 06:28:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=EKa3HbRTZrK0Eqhkn6sRRFif00tRwcclHVQmqUU4X2U=;
 b=ym12O6pfFBXhHy9Ai4MVI4e4N/PBVcceMJiDfeBPc5ewJruz2rfCFsmDnvWCao9gRI+7
 U5vGJAda38hlJbSIfIB+Grs55kLJ08eiNo8c9E2B0fU1qvJH/SyJfqukXc6Nl5wTbjXx
 /PPR/jXIsHo6spcobQHS+PTl4mJWZYsfgXCatdhUe6s4oqbTf+cVS44mCniZjn6jr1Lp
 +IHdYO1VBIfrhJydmMe5+5f1cvcICppGnRurc6v1mWTTPQp0BL8Y3gkI1uv17rvBJYmI
 BbHxAq3FPSYC/osrEhuCwOXcjDzaZpT1DYLiZPYyR6su/6+94dZvUaMkFClK0CHFNmYf gg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3cwc10swyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Dec 2021 06:28:32 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWhqhhlH7Z4r+t8Vkdreo8YnvyzkxiPBcum2r/MealTWe5z2gM9ULgQGI0FdaQPXd6GaOnbnHOhpRb4110HhGEcjMd2N9193LqnWO1d8z3w1IYAwgvFdzFSQuDB/oK/FOZ+2cyD29PW+W7QN8YZ3sTEdu+p7B+J2yrh014gSqEVzsUSLi6xhLVF2r4aZq81fptne3FnKzsv7YbaTgCWSwrasXlAMFTPAUO1u1m1HeBNuB1lRnRWG7UErIxeO1GgqfLa15EXuX4iJj7h0Gw+xon7gFaEM15ixeJxGuwt8PZHZBcjobzgokVSB0KDlWk452SRHZHKXbuuv7lzX+qao6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKa3HbRTZrK0Eqhkn6sRRFif00tRwcclHVQmqUU4X2U=;
 b=BUbvuoRvGWDvkkQUSghD9CHbjZtytYGT1z9huVREl0tFTLjUsjAcO0/Mn1OelBwa0p4kaoJxpsmaeLh0iW/ZpYshTsA3YpZBQ0theYRasG6/HAAn1e8dC/8IRb9UJTP+stI4YWYoFW0p9dD4Lv0ot/CUyLZsYltKRIMf+T1i30rUAeD9plShU3TJvqkm66i3uU/sfJHe385kMa7ARZfxgZucM+L5PhCpQo8eHJSDRDjNPsQ8ZoM5c8hUSO6dAvhRizZkmeUsCih40bJXvnPPzsobNomUvvJH/M2OWRWcxJQz6H8zWbEnfctThb6kPx1rIJnfcY1wnBfFXiuVP079uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKa3HbRTZrK0Eqhkn6sRRFif00tRwcclHVQmqUU4X2U=;
 b=KDfbNPTpoOpz8YePg4eTrEyWqPjseNGzNdH1wGdXftRM/TktFctcZTMRcL7IxYcAhawpFxDQAaMscuo9FCssMZr/jSFE9H6KY3TrYXsgG6E1ENnsbWoLg9CAcHyZjbWtrxzVSAn5CkfGD/oY5SREc13hatI8qsPPO2l81rKfb8k=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB3950.namprd04.prod.outlook.com (2603:10b6:805:48::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Mon, 13 Dec
 2021 12:28:30 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 12:28:30 +0000
Message-ID: <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
Date: Mon, 13 Dec 2021 06:28:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] The state of DKMS in the Yocto community
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>, raj.khem@gmail.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98694e45-b948-498f-2988-08d9be3411fb
X-MS-TrafficTypeDiagnostic: SN6PR04MB3950:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB3950E591303399C86E6E899BFE749@SN6PR04MB3950.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bR8ChsbtuU16n0UECQsWk4IumL2L6BtceLEnOnW8C45JkIddovnc8WZ+6nnKnljrFSW1gFZZEwnRijUW3lQLkusMeARWoifg3ZlKOxaGnMlyjVeR4ePo/3HoTD4VrZpN61L9g/RPU+9rqbwa7NO/mlS1NE21ex5wII8qGXMBvYs7rgBfffYtTioM41pdPjYQOu4zUjsM4Va3P+GdmtijIX1DjmCvs5GQS3Rh60/xDaxNWa56U+yKWcp5VgIN8crV9u8U1d2X30YKSCBxTZEfC3l+21+Wwqq07o1TgpJtXTB/ZlDvB8EC/uQoZdNBr4w9Yn+wE2QLjQCmiX/ignKY3Kv+BEmz3M/BOpkTI1ueE65G3blp79CHb/xWA4bzJDM3l1/1aVEtU+kErmhjTJPxGj1NUhqLVPQdF9WIXHo5y5pif7wVk+GdB7cJmcn5rrfZmTF+WHfcugmoA/GFb/9JcA/ZqmYiGwbSQcetO7PQcYRnbZcVZJ1VZQM9LEn7D/XyOvQN+mEiYmRUyGnN7SMFHwBBCQWGcqCukC9rcrVdzSG5oWaUVADD0jWQ/7AnYmz/Wyr4NpmjF2BmTaUfgaWWZKbnoUH6IY43WpWusjvRX1aK8Pf9h8XjDZHZRiaojzM3HDhFfZ7cHK1JufMd1HpfnkoxOADjBdCRsjUpoJswAy1cUuXTRTu8D5w73gQoQATtlrLl4qMIEXzPpot/FcVq0SmBpD6X4UEDDjmHBPwTh/vW69+GxKXJ3LK9WZWBuY61ID/fwehEzrGzmNUcwsfjyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(36756003)(6486002)(6512007)(6506007)(53546011)(31686004)(66946007)(508600001)(38350700002)(38100700002)(44832011)(5660300002)(36916002)(66556008)(8936002)(86362001)(66476007)(316002)(52116002)(2616005)(2906002)(186003)(26005)(31696002)(83380400001)(4326008)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vis3UG1XbXhRemRiZEx4WmNpOWR6T2xlU2pjWnFHQ1hWMFVaSWIvalRKMDFL?=
 =?utf-8?B?OUVqdUIzWmhFRlQwdkRyQ3NST2tlMTA1ZFhuTXY2MFMvdEM5ZHpwRFdXWkI1?=
 =?utf-8?B?VUNxY0JSc3ZGZGF1UFgxMjVaY0VRbUU3OE9FdHZrSExRMmhnNDMxUDdnRzhU?=
 =?utf-8?B?OS95RkZYREFQcXpEQVNZZ0pMS2txNVMrWVE0RksySUY4bCtZTWVTaC8veHYw?=
 =?utf-8?B?WmF2UHZ6U1NYcHlJbWJoNWlmRndIdk9rT2lzK3FzaGlZV0hvTCtEMFJMSEtL?=
 =?utf-8?B?NDZSZWY0MHNIczEzOW5uRnI2U2xwTUFGTmd2M1lSUFNoSmFZbXdhVmpWMzdx?=
 =?utf-8?B?ampXR3FwWTJ5SzFseU1IbHV1SUhQeFdSa3ZlVXNFSW8wc1FVMmFaZkRUemFX?=
 =?utf-8?B?N3cvTFJENEwvaGk1eUxjVWxYQ1VCWnNyN1BSSWtQSTlzamxFU0lIaUlvam1h?=
 =?utf-8?B?WjdjNEh3c1pleW90cG5MSDQ2dHNUTTVRVnp4TEQ1Vy9UVXhKcmpDYjk2SlBs?=
 =?utf-8?B?YjlCdm5WMTFlWmoraTI5S3d5SlpIYUliQitDanoybzRmZUdsUDB1Zk8vTEwz?=
 =?utf-8?B?ZzZXRVBIOEdhdFExZ0RsR21pNFdGSU9vREhSWnFtNGc1SllHVFJpNkN4TU9M?=
 =?utf-8?B?b3ZadDE0MFdRUnhqQzhFY2h5aWZCbzJVa2xaUTdLMENEeUM4MHJxTnZFcFRM?=
 =?utf-8?B?ZkZEcURETnVKajFGL0tNQUR1VU5ZYzhHL1R5SVg2OVMxL0phZ1lmczdVNkFC?=
 =?utf-8?B?YkIxcFM2dlNnSXBiMUxyNmkxRHdhQy8yMHhBbk9CMnA1akxIZ3pyQmIyQ2pX?=
 =?utf-8?B?K1I4T2xjQWpIMi9JbGVPbTgrd0pkNTdOQWI2d3dFY1F6cDJKbll4L0NKWmJB?=
 =?utf-8?B?MGFTS2dwdFhFRmRkMHRNZlozd01mZHZGaHhHNUZUYW1teWg1UTd0Q0NLYnpN?=
 =?utf-8?B?OFdjbTlNMEZjbXg3QWpxUG9oSVhUNkJxeDRaeGRWQmlJa3hGRlNjSTdHbHYr?=
 =?utf-8?B?aDNuUkpqSVRmVUN0dFloUmZUaGcrS3Z1Rm9xMHE3VkFOeFJVNVJaeUp5VFBW?=
 =?utf-8?B?ZytreWFxNVhjUEFDbWhtc1JMRThkVFVzUFZKUXUyVDVOcW1aOXlaUWpKUjdn?=
 =?utf-8?B?MTQxV0h2NE5wV05DREg2RWtZRTMyc1lvSHBmbTVOTW9idUQwSmVQS24weDg5?=
 =?utf-8?B?QnExdmVyWXdYUkdadmpQd3QyRmczVXVQQXJTM2N6M3hBWWNxdG5Odjh4NzlQ?=
 =?utf-8?B?QXFxQkFEY1ZaVWxLSXp6LytoSjR4Z1EvNHJXcDJKMERzL2pHQm5GSzZXbDZl?=
 =?utf-8?B?TUtYNnNpTmJTN3lGS0F5UTFDcXNsWXluYTYrVlU0TmZMOTNXSnRhaGhTUWRL?=
 =?utf-8?B?amxjUnh5MmVZSFJ2RVFqK09GcXlsNi9jcUZGamVvUmZuTU1lOXNocnNrTm1F?=
 =?utf-8?B?aUdZdkt4WmVRbUtCTmZicWtOYTgzYmlUa0oyR3U0M1N2YXlWL016U2V2Zjha?=
 =?utf-8?B?cjEwdDE2aDl3eDFZYU5BOVBoNDQ4Y05Ydnk5bktSc0xoMHdoNVRQa2VicDZz?=
 =?utf-8?B?ZElTSUJGV2xWVUZROUFFcEhQbXlxOGZISk5XNzdnZW5ZRTF1bGZ5aVJYTGhW?=
 =?utf-8?B?WTJVZDJpNENkOTVaNkFiRExEZ1ArMzQrU3FKd2NtdzdkWndJK2RGT2hBb1VI?=
 =?utf-8?B?VkMwdzA5cHZ5bFU5K2JUdmN6VDJpWTZWcTlUaW1FRlpVQkZERDdPYkdWTm94?=
 =?utf-8?B?L01VWFhNZUFyNzVrYndkVjdiY0lUSUpEckxvVzJkWDdHc0t4SDdjTlhRNWdU?=
 =?utf-8?B?bFJydmRQNmpiSmFQZThIUnpQRENaOEdtUEg3clBrekVQQllSM1hQckI0MlZJ?=
 =?utf-8?B?NkF2azdTZ2o3cTg2SGx6YVBEeGNqd1ljWHhRZEU1RVhaZXNlQ1Y3RE96bFoy?=
 =?utf-8?B?QTdYVFYrME8wc3J5NzZ5OUNWYTVFK3ZHTmVrUXpzcjFBN0RRSFE1VzdVYlNC?=
 =?utf-8?B?cFdnQi9VSU13MGE3WHZBV2FYaFZiZGZMVVA4R1VlTEtNWkVFL0tONnlnaDFh?=
 =?utf-8?B?OEVScy9jZTA0ZUdHSlhFZWQ1UzRTZE9iVWUrSEVia0FoVTZmK05FQ0kxQ25R?=
 =?utf-8?B?R09ycDhHR0VzMFZMK0hJMnRwZ0d3cy9QSHNXdzlBL3piRUo0UDJzVEdpemVj?=
 =?utf-8?Q?Gvi/5F4EaWpjsNFmi+HVCps=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98694e45-b948-498f-2988-08d9be3411fb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:28:30.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 89Pg3v9ace+UBwwYK/8vkTYlDX1VK7xwpr8GeOYXEWpzJbcHRGH1PyPv20W8O0cwcSeFYQYC0edDjelwEnhuyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3950
X-Proofpoint-ORIG-GUID: zHyvi83Y5AP1nklqQ-IiRoqcKSLgaiSB
X-Proofpoint-GUID: zHyvi83Y5AP1nklqQ-IiRoqcKSLgaiSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_04,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 12:28:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159618

On 12/11/21 09:24, Bruce Ashfield wrote:
> On Fri, Dec 10, 2021 at 3:58 PM Alex Stewart <alex.stewart@ni.com> wrote:
>> Hey List,
>>
>> I'm trying to work out the mysterious state of DKMS in OE-Core.
>>
>> Our (NI) OE distributions rely heavily on DKMS to (un)install our
>> ecosystem of kernel drivers at runtime across our product lines. To
>> facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017,
>> which we have carried out-of-stream since.
>>
>> We tried to upstream it, and the patched rev'ed a couple of times [2];
>> but it seems to have never made it into a yocto release.
>>
>> Though some other recipes mention DKMS passingly, I don't see anywhere
>> that OE-Core officially supports it. Nor does my googling reveal anyone
>> else who uses DKMS. I find that a little hard to believe, though I
>> understand that it's probably relatively rare in the embedded space.
>>
>>
>> @all
>> So does anyone else on the list use DKMS in their yocto distribution?
>> Are you maintaining a DKMS recipe out-of-stream as well?
>>
>>
>> @maintainers
>> If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and
>> submitted it again to OE-Core, would you accept it? If not, we will move
>> it to our own meta layer and accept that we are unique in this regard.
> I used to have a DKMS recipe myself (at my previous employer), but
> never submitted it, because generally speaking, there are better ways
> to do things in OE.
>
> DKMS tends to avoid proper cross compilation (which of course we
> already do), or is often used to distribute proprietary code (which we
> don't want to encourage), or is avoiding the need to upstream the
> module code (which we also don't want to encourage).  It also only
> tends to be used on a subset of the architectures that have enough
> memory/cpu to build on target, so by definition it is a bit more
> niche.

Yeah; I agree. In our case, we have several dozen drivers split across 
many product teams and largely distributing internally-controlled 
source. At this stage, it isn't feasible for us to build them all within 
OE - which is unfortunate.

Many of those drivers are also required to support both our OE 
distribution, as well as a small matrix of supported generic Linux 
desktop OSes. So having them manage their own DKMS packages reduces the 
surface area for packaging errors.

I don't expect that either of those considerations is common in the OE 
community.

> We of course already have the ability to build modules on the target
> (we have a test case in core that does just that), so what is in core
> can support what DKMS needs to build on target.

I'm not sure which test case you're referencing, do you have a link or 
could you expand on what you mean?

> I don't see this as something that makes sense in oe-core (but maybe
> I'm not fully understanding the case, and where the current support is
> failing), but could of course be contributed to another layer.

That's fair. Our use case is motivated more by an organizational failure 
than a failure of the OE tooling.


@Khem
You're maintaining the meta-oe layer; correct? Do you have any interest 
in a DKMS recipe?

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


