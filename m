Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C6C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 23:16:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.995.1637277392921820028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 15:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GQrNu8xK;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6956f6c3f6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AIMu9pB000685
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 23:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IqL+JFQKRZUlQucHpULUyrQL+4nK379QTMkSekWu2xY=;
 b=GQrNu8xKoccuG+OTXi+vCUa+T/uHBkpKBYkZNx1eBFYsCP4VLt3G9CZMt7KM+i+e/0Pc
 i90aiQh7EvvmDlvvuUzDdcPj9pjqjvfQyCdE4SbDoXncW4WsDS61MtXM7J14Q8ULEt6t
 5LGqBv6aYxZuKoHEiy0h0F3B6k7ih1bNBtIxjwDE/7jM4Z5/IJheMSL7lKt/e7ThV+iH
 /yQyA/DeQQUdwF0YHVsfLP+xpF9sIFGYLeBuR/t9zGwRDhxF8+JCyiCNbjXbtrFVWzgU
 ycsaBcwnYf7CVjgljz+DflUjD45n5G4s9LKZng2jA+D079sy2zUiABzUQ2qx4BOuJYVr yg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cct5mhubj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 23:16:31 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AINGVOt015295
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 23:16:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cct5mhubh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Nov 2021 23:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY3tITOuZylMgkJkteNIH51whj+SXUfbVTrtx3+s7kRr5+fzwTl7g8H7hZI5GHr7dmQapRkOukNX23QwQrQqlqJYLNhfd+IIYKGTAT5y5vSchdNEujWngjYSGirN1rhalNZeWRlNkbeFi+C9i7Zpy084D23WSALW6Osp+DGFDYi4RwN2t3+6XnhIWHop8UOC/K/06VPHTVY09ezJQm1xyTX879DOJtpVKY6S4oX7zuFAJ6BXTSy1A/EBuTfxPaLz4xVNVV7wPyUv15k7dBasI4v+0K3ZGscxCyDP/Aq6BWLtOpUzC1vFzrG/sexlfAFpfUIcwZSHHNlFzZztm3uORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqL+JFQKRZUlQucHpULUyrQL+4nK379QTMkSekWu2xY=;
 b=HWkDAw0jgyYB5B8rI5XymN5/TZ9DDnAn4GpYRXFL/kt6hMP0HAzV+gDJri6xN+YoA/vU1ze6Vwg1JhSF8jsbiomS267mJ6dKr3fddcQkxo7EKWcS8j64efPVSLJShxKEekyEplL0XJxHm8R85U/56IEWgo3sokuHfeskB0THcikpS2V/u45COKvCC3VZNRvP37hvql63zqE9/FDKk6O7g48idRofxkuBHA+euHCivU1juNaSSCKyGgcuUCep9tbj3XgFX+byk3O0CnZXU2TfgYsWksTKPqWRQuZVrnhw5G5XK8booz+OIzX3RutjxVJ7Ub59MkJCh8/Kuc8EF3JEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3291.namprd11.prod.outlook.com (2603:10b6:5:d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Thu, 18 Nov 2021 23:16:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3%4]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 23:16:18 +0000
Subject: Re: [OE-core] [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH
 with TUNE_PKGARCH
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
References: <20211115140340.8047-1-pgowda.cve@gmail.com>
 <CALY4987g508BzDM2fmYvoTpNH7KAKJkycF4OUABhtUjMLmZbxg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d583f076-b721-f482-535d-1c22867b6b63@windriver.com>
Date: Thu, 18 Nov 2021 18:16:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CALY4987g508BzDM2fmYvoTpNH7KAKJkycF4OUABhtUjMLmZbxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BYAPR06CA0025.namprd06.prod.outlook.com (2603:10b6:a03:d4::38) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 23:16:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98530005-88a9-4e9a-748f-08d9aae96ce5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3291:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3291FBC3079F2CFEDB13ADCBF89B9@DM6PR11MB3291.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BKfHOiFnfACqwmGRbJ8Ca9NQyHzBR1d3oWTqUo6Qh4FH4YmNpdwKvsCDlqSrs05L3JL53Dmt2/dtcm1iYMcoJjTocADTzJAYM8JZ3uH3xZrwCOMKfMjfs4kDT9W7eCLbNUb/a1RjsNlFldrXXyu8c50gr6SwjD+6z8EcCPcBHcc8ZMqdhk8Cpkra4rW8hpVFGLa9wmqS6AoNJEMnkil6q+ZnwiVNr4yQ2CCbSw+QqNJ/VHzvnCMn7k/Vx6QB9NNbNABE6LAI9dOBJPnUt5wAnef9EbO5c2a8BLyHln84c6jkOGrabChE2iBZy5ATJzegXyp8hXSiod1rRiQYZMOyuy2YgG6tWKqrxHiEqaSIJkAQ1DTQxBWFC6wK/bJZ6HhO1Dc3AI6gAPG24b+AzPHGWMSYeR5pHIVRESamcq4qBmF68tapCWiP6xeTtD1VzaXNvMELvtQen6w0nf+x2ZHNwRUV+q/RzswIpMH9Bg2DDsYp8Bai0jV5s1Sxhe/0+JvhF4NrD6wXZkDEVsg7cHX2NlvY5ho5mCVx6bXtP51xHpxGpzmlfty9NUUuv/fVflBN2Ni4N6FOTCrYPJO5JgSjZwvaLorUZmiNEgLwQ9izGOKZSzsjjx6AxiYSDIz73A49E+Bj/nzqbWL4E1ndY6dJMwrYopoCYVMW+jn2QpSpG3V4jlnZEgZ8igY6mPOdWdpy2n2r1e9hRN2kPzHAsPFhQC1VsVN0/hDkSfER9ENuDlC4QrTdqnxvvBcYm2llvHBnk3yNpcXETf25TWRUVIicW6R8vJtyXaAG1FyFVCwmdNfyT4VpNFhm6H9M2TtRxbjBU15OvVjOntxqp6wH9fT9Z2slXGH5qiij42YZWuipfSzLNOIJGRMJXF51mIp+YK14hYqNERjsF3LLY0bj+dTNfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(83380400001)(2616005)(4001150100001)(8676002)(2906002)(6666004)(53546011)(54906003)(5660300002)(38350700002)(6486002)(316002)(38100700002)(66476007)(26005)(66946007)(186003)(66556008)(36756003)(508600001)(4326008)(31696002)(16576012)(8936002)(956004)(31686004)(52116002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2hkaU1nQ2lUMFkwbiswMUp0clQyVmRpR1NxVnJHek03T2ZLWi9XL2VNdWFN?=
 =?utf-8?B?RmJNMDJyZDhiRlBjMGl1VEtIdUlRRVBQbmJIMjJSY3puTTZJWDhtQlZoS3Aw?=
 =?utf-8?B?RmJZb1hoQkltNWVXVHdTVEU3V08xYmE5UHJQdHR5K1NQZ1o4ekpUMDgwblg5?=
 =?utf-8?B?VFFkU3J1YVl1bWNDd2hOcEhacTcrVlAzZkNoZ2xiOU1ONklxdGMxQmFZRzVV?=
 =?utf-8?B?TVc1WjM3V2EwSHY1N29ha0FUdlh0UVNGVXhaMzZUS0VMalN0cmRKdXdNZFph?=
 =?utf-8?B?cjRjbExpdUkyODc1MnN2MUloOXVWSjdkL2pPdXJtOXNpRG1XZ2JUZVBRNjhw?=
 =?utf-8?B?TUpKdmppbks1SFQrZHZHOUxoUnNhWmpzazdMOXQzT2FGUjFoL2JsZ1pjTFJq?=
 =?utf-8?B?bUk3OVFGTkVENzcvajl6cW9TVDRtZU5NR2dZM3hHbkF3WXdnaWcrOTM2KzJ6?=
 =?utf-8?B?YkJxTHFydEkwSHQ0VmpSaExCbVlVKzM4M2pWN0ZlZ2NaTlB3YUdVNVFORnho?=
 =?utf-8?B?YkFLdkpyTjh4TnNqZzE0WjJRdHBaNVNIZ0JscTdGWUhKWld5a3k3NmpIT09z?=
 =?utf-8?B?ODRkbDNyQ00yTVV2WmhiN0VuSXdUMEJEeUpzbXVSS3hBR1IrYkorRnpFS0dH?=
 =?utf-8?B?RUdLMmdISDBhZzF1VE1zQW5PYXhVOC9aUFdGckpLbG5nNkRad0QyUEdRRjR6?=
 =?utf-8?B?OUV0SVJ2NWcxT3lSZFpzRU0yQk1NMjJndnZoSjZUVWRCbVNuNmhIa2RjOGd5?=
 =?utf-8?B?OWQwNG0wNFVtY2k2Y3JFTkY4WjNZOWVIUmExcWU2K0NOQmxDVGhHaC9keDNT?=
 =?utf-8?B?dFBtU0NBN1FLZ3JWVUs1eUxiZnRJb0tTMFVxRUFOamZzMXhqek04T2dVYnI1?=
 =?utf-8?B?dWFZbllmS0taRmZZREpOSzFMUEtRU3MxbXdycG9odjNtMTdLZlZ5citmRDJ0?=
 =?utf-8?B?bmlId1FZbE50a2oyVllCQitPVHQrQmF6OG9JMGRUM1JDUm5QWHpjY2FNemxp?=
 =?utf-8?B?ejBmbkxSUkxZWjA3dW5uM21NWXg0NDgxRmpmWXc2ZExRYyt6VnplMHpIUll1?=
 =?utf-8?B?Vys4ZjVZT2dQOXYySmErUkFUaytWN3pmT0JxdGtpbTZVRzJGYUNMVFFLOU1D?=
 =?utf-8?B?OVF6Q09SOXhKY0RiZ3BUT3Q0T1lZbHhkRk1mWUVqOUovODM4TDAzRldTVklS?=
 =?utf-8?B?RzdhUlROT3ljcDljMmo3TW9DNnpEUkNjSnNERk11a3ZTRTNTcGhEcUVDTDF1?=
 =?utf-8?B?ZCtncWJoSktMSFRma0JGZFAyT2Zxd1VnVmhBWjg3d1BoVmpJN2grZEVGeFds?=
 =?utf-8?B?aTBQZjdKa1dSL0xCTUhVYlN0UkE2S2xnQzFhTExQeThkdHlwczBXNnZ0L2Nh?=
 =?utf-8?B?RW9KYXBjcGszOFVqa0lZeCtSeU9MalZ6MnJtVjBRRzFraUhQWlJ4b0xxL29B?=
 =?utf-8?B?RUlBaVdiRWdQcm5TSnZpOVJ3ZUxFMWVFcHc1SHhyS2hQM29ITlA3S1RmMkpR?=
 =?utf-8?B?Y25ONlM2bEw4b1Z3ZFZzaGxmemo5RjZGa2orc1RNdWljNzE3d3ZLWmREQjA3?=
 =?utf-8?B?aUVLbW90R1VEcTJ6ei82dUpHNDM3Sk1FaW5TN3JVUDJTTlVrY2FWVFdSMDFO?=
 =?utf-8?B?TVYrSHdadDBFcW4yV29BSkhzRlhpZkhKaFgzZG5jeFVocTFOZXE1SW9taEtW?=
 =?utf-8?B?dWtBVzhaWVliTXZQcThvRDAvQ1RFUUNPNE5jQjN3UjNxeW90S0RVd0txYUIv?=
 =?utf-8?B?czIvdnNCMnF4Zmd2cGh1c3ZVOWFvamxYcnNlZHorVy9HMzZOVTJvRlBKM1B3?=
 =?utf-8?B?QTkzbTJhb3pRWnNtc1hZdXJrdTRnc1I3Ni9rWXFnNjlycGpudlNNVmVaUXNQ?=
 =?utf-8?B?SDFLZ3ByaXJKaC9MZ2FpWEVudHZITHJLWFhvY2VFQ1d0SEJ2TFk3TEZxc0N5?=
 =?utf-8?B?SDZRMjYvdGZuOEtORWRUeUxoNUVuWVpsaVJXdWE1aEFXNDFpVXNwa0QzWEYx?=
 =?utf-8?B?VDY3QllITEphVjgzc2VUT1ZRTFNPYzBqaWwyTFo0RlhGeWpJbW4vZ05MSStI?=
 =?utf-8?B?UXNad2xUTzBmRkpqTFM0THJ5TyttRTJXb2I5eEVhVEgzWWVKWXhxeG9MWEdo?=
 =?utf-8?B?d0VlM0cyL1dYTHFpOGJZZTkxZFZWTzViNCtYZ3QrT1FNa0ZOWUgyRG5BYjRt?=
 =?utf-8?B?Z3daR3BaQjZoNUdxYXNoQ3o2d0Y2Ni91cHdOc1d0c1dVOFNGLzlxMXowQWxz?=
 =?utf-8?B?T2ZkSDc3ZURrRUJsRXd1YXZSZktRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98530005-88a9-4e9a-748f-08d9aae96ce5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 23:16:18.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9J2z5BvZAHQrxO4CB2x5zM7hL9VD/UhEev4bVmQFRvsN3rWiOcwXDzXpWP5S5w3J2yUWkHfBC5ZvyyK+RDjBBFyqdNKEvlm8eLq45uwdR/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3291
X-Proofpoint-GUID: eHRgO3p9xMZgHsAfdZquDQMBGKCgsads
X-Proofpoint-ORIG-GUID: BkzO2LQugYRNnC2ePOAfelcFfwqNPppe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 23:16:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158486

On 2021-11-18 10:30 a.m., Pgowda wrote:
> Hi,
> 
> Gentle ping on this patch.

It's in master-next but it may not have been this morning.

$ pwd


.../oe-core.git




$ git status

On branch master-next

Your branch is up to date with 'origin/master-next'.



nothing to commit, working tree clean



git log --pretty=fuller

...
commit c2c3477377f3c41c6bf791a42d66386da17b0ba3

Author:     Pgowda <pgowda.cve@gmail.com>

AuthorDate: Mon Nov 15 09:03:40 2021

Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>

CommitDate: Tue Nov 16 17:22:18 2021



     rust-cross: Replace TARGET_ARCH with TUNE_PKGARCH



../Randy


> 
> Thanks,
> pgowda
> 
> On Mon, Nov 15, 2021 at 7:33 PM Pgowda <pgowda.cve@gmail.com> wrote:
>>
>> rust-cross-* imported from meta-rust has incorrect signatures,
>> depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
>> as shown by sstate-diff-machines.sh:
>>
>> openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc \
>> --machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-glibc \
>> --analyze
>>
>>   === Comparing signatures for task do_configure.sigdata between
>>   qemuarm64 and qemuarm64copy ===
>> ERROR: gcc-runtime different signature for task do_configure.sigdata
>> between qemuarm64 and qemuarm64copy
>> NOTE: Starting bitbake server...
>> Hash for dependent task gcc/gcc-runtime_11.2.bb:do_prepare_recipe_sysroot
>> changed from
>> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
>> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
>> Unable to find matching sigdata for
>> openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
>> do_prepare_recipe_sysroot with hashes
>> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
>> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
>>
>> The following patch takes TUNE_PKGARCH into consideration instead
>> of TARGET_ARCH and results in signatures as expected.
>>
>> [YOCTO #14613]
>>
>> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
>> ---
>>   meta/recipes-devtools/rust/rust-cross.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
>> index bb625f4240..a77f7d5122 100644
>> --- a/meta/recipes-devtools/rust/rust-cross.inc
>> +++ b/meta/recipes-devtools/rust/rust-cross.inc
>> @@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
>>   DEPENDS += "rust-native"
>>
>>   PROVIDES = "virtual/${TARGET_PREFIX}rust"
>> -PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
>> +PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
>>
>>   # In the cross compilation case, rustc doesn't seem to get the rpath quite
>>   # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
>> --
>> 2.31.1
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#158478): https://lists.openembedded.org/g/openembedded-core/message/158478
>> Mute This Topic: https://lists.openembedded.org/mt/87069441/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
# Randy MacLeod
# Wind River Linux


