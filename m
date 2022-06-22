Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DCBC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:55:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web11.7513.1655906096516383735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=3enyCWby;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.45,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxdqhZiR8ApSs1omg0xExlptRDryYNlhZVhqIBxSsY3DnP9+mDsVcQdK9roYx6zco7K5KG4KD579Nfq2nDxzfrM7ov2J8bvryNh2Fm2IEw0/A+SZSgnaLUtCSXwcc2be4K4expqxExUk8fCnPJzCPL3Fi8y93B2cWhZrObfiheLopQzHO/YORCT8svpm/sezSAUoeD8ZsIPo5Xn38rRBcEOurHlnphIWQ9nqBiSEK52MtCW16OGYOKHZt+gi7IuGt1QY+YOHDIhi9gEhLpmMmcgRfZKVLXhNXuQ459hK9NfAX6dkReZONJ3CAdKvGRk3XNi96lXwCjwTDpNttC4nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXg7pgM86Rj+t/NX9G26uzBQyXkbYOEYsyT0b7IsCDI=;
 b=iNiVxF9e88UTAhEu2oERgPO4rAwmbLMrsBU4zlEqxKftAxZTVM1cNTvgc4SgEpwBh7OwboDjfH2AGEOPVTGhP/vrGGZSQiN8Nyaq454OCTZD7tjH/+wq2tBKYSBxayckUuWP5B/kbKBqej6gGcLpIWddmAUM+AI35jpD2Ht1hcIFxhYoJV4YANjnUT6mwPe/PPyWHu0MkRNhFeRdiEg9TyYfmdPjCXunLWgvzoTFzIONSv1rnya7HITdaQN/yT6ZcaHlTjcql/B0wyyTF5GpEKAi20ihElp5cVBvUcnZ5Hs1p6rPKGRDNmgVPSuSrrV2ZjmhRapihrFKR2+93JdtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXg7pgM86Rj+t/NX9G26uzBQyXkbYOEYsyT0b7IsCDI=;
 b=3enyCWby5is2h7cjSQEdpw+qhx8j2OSrP73blcZhsdnqy/a9MoJ7dlsZLJ44dNtoA6u085FBw4i7V5sGLC9jPCaBa527aW19NMT9RqM6Q+atggX7YxWvxd/MfhknTPDjxN0IBtS0wiyN4swI6oDrIvkMwk2yhbBmMy1gbH1MYGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR08MB2936.eurprd08.prod.outlook.com (2603:10a6:6:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 13:54:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::49a6:e5ff:7f94:8787]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::49a6:e5ff:7f94:8787%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 13:54:52 +0000
Message-ID: <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
Date: Wed, 22 Jun 2022 15:54:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::6) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 036b065f-d152-4d35-7532-08da5456c797
X-MS-TrafficTypeDiagnostic: DB6PR08MB2936:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB293673F5D72AE538DDE7E844D7B29@DB6PR08MB2936.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BIPtwKSWAYrH4hnEUZXEiOZd53ZoZftoDbLrFKzoCRyYQjeLZvVOQfwU4FkC0cWpBO7yMKH+8wy7aIKFChglFdahHdj9lkCm5n7lv8kl91m3BmybzR6BUpv6zt7x66zPoFenRaS9FG1V7LH5KOaIFybq8AmoiZxOVRioSKARZtnWUzV0Tt7nktS4ZYatrBYChXrK5ZWGnRFF32FUGxncmtVjGXCod9/udWZkGHoB/XyYGin3Hz1tzrWfYx6duOmPIOzt+8UgkAbWgq0tI/yOLF7nzGKMmx3gapnxjyiUF9YqTxBb3PdOYFrdpHJEE4zHnBN1nKdghwPvy/fVIsnke5MR/8fafcQpuU9M/9hQ2bNe9I+yxXZwo1vvDDNMwdHBbzunSzs5d+ocheG7OLbjcZLfWEp3L2iFyBb8JQq9uJMHk9Boq4rbW+gKJjKPSd5wq4T9DML0mQdv7KXXiGTxiGSqYHdkJzk3f5TGYU7ZNpZsSMqMG+nvlvXGEu1sJih+SQdO/uGKReP8KV1fFR9hrjl58o/G96CHuNclwDpyYHdLQyZBbhnKmcX5MA5OCKNvGrogw08mwutl44GoHqpftmBdghf39Iyg/AztkBktaLCsw5eF41UkDh87eQGiJe3VUEk+xlttLBqUMBSzyZWjpKS0gn+LntLravf1yTKawBw3T/MSxqYgVAT5JDMY7uzC+ohXvOfPhFm6IHYQNTWUaCl1wmOquYIY7TDvb1cfUiPAMIJeEfrZ1pyLuv+AQnBLHtmo+2zVHtXijET0MNkoVl/py8MpGBuxXrpKOd/CLewmC4QKRpKP+VL7WqkfKYfERCPHCVfRuakIFqUqSDma7U32MBjOQDxpkXC/yPyD4bo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(38350700002)(186003)(31686004)(41300700001)(83380400001)(2616005)(31696002)(86362001)(26005)(6506007)(36756003)(52116002)(38100700002)(6512007)(6486002)(966005)(66556008)(8676002)(66946007)(316002)(66476007)(478600001)(6916009)(2906002)(5660300002)(4744005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjZ0c2VUdGZRdmdxUlByQXlxWGliVVJ6clViN2RJYloxOWliS3UxQ1JNM2Iw?=
 =?utf-8?B?YWNoajNoNnJ6eXNuMlZmOFB0V3FsWDV2TWZQcWhDN2ZVTHVveDBQNERIdU83?=
 =?utf-8?B?MW4zMGR0RmR4NTRLemtxSjBNd2NJQVpjN2Q4U1JCVEtuSXE3ZlJuSGtiMEg3?=
 =?utf-8?B?Z3lRTTMwUkpCUGZvdC9kVGd5NHRPUzVwQk40bUJLSnFGdFBQaWpCRE16TzJF?=
 =?utf-8?B?UHBTWDByMHJ6cG5IRmdQeFJ6THhGcm5qSDFxWk16czZzdTBnc2tra05kQlo1?=
 =?utf-8?B?T3hGNTlIZ3dQN0VJWVlmd1ZPTzErZWFKckpmZ3BpL3hGQ3QvUmd3aWhTY1JD?=
 =?utf-8?B?UGRYdVJlQVFRY1ZQWjRmNllmVmJoMk5BeHVkWkRjSUtac1hrWWZBNDlwZE5N?=
 =?utf-8?B?YjEwRnpBKy9RZHVVMUtURVRoalB5YlN5N3h5TTc5QjJnR0NsQm80WkY4QXBE?=
 =?utf-8?B?TlRwelY0ZTkrS2IyWFgrOHpIdGJqTmExYkVYUUxHOWVxc2xhdklsVFZ4YWVR?=
 =?utf-8?B?VDFKeUVKaUgrZ21scXk1N0dQS1hSYW82OHdmZmF3bFJxK1lGSkVTUGNUNFE4?=
 =?utf-8?B?NDhpTDVQajAxUGRFNE5vU281NEpTVE5pVmxKQ0IxMDNKTFBTSnlEb2NPeHBn?=
 =?utf-8?B?RG1YOTZ3T0JOdTl6N2Q4cHBHWDhQUzhuMEg3YjBTbThPNk5YYmFWdC9FTHpO?=
 =?utf-8?B?aGc3b3Z5VGE0MzVNaVBWcU8xUHNyRjJ1TjhiTVBySWJFVnYxaG9hWDV4ODg0?=
 =?utf-8?B?UlRyeFFBZzZqSTVqZ0RGUy8xenAzZG14T3FaTGZZRlFCamkwMjFTSUlhVlBh?=
 =?utf-8?B?alBUTTlwdDZqTDVZZyttb1Z0aFphVTBCVERmKzRMTVJhbU8rZGs1RGE1TVYw?=
 =?utf-8?B?Z2lMemZOdkhQY3J5UG11VlZIZElLS0E2L3U1bThEQlpSVWpPWTJZZTFQK21E?=
 =?utf-8?B?MHVzYjcwQlVQck9jajdsODFTM1I4THJoYk9aZTV0eFl4UW1Sa1BLNHBnRWMr?=
 =?utf-8?B?S1BYTnRrNXY4U0dLNlRwa1dxR21qdnQxTTZpTUV2R2x2dUFBWGNjcjNTRUht?=
 =?utf-8?B?Wi9ocVhmRFVzSjJCQXBNeTFFOGhFRjRzM0drdjNLVXp5RXZwbGxrd2NzWlZn?=
 =?utf-8?B?MWNhTnoxQzdlZjF2YlR4bEVHejVTbUQ4akQ2V28yVmFKUjZBVmVjRklQOHVq?=
 =?utf-8?B?aFVaMUVvSnQ1ZTV2VDZaK1lhbE9iMXp6L0dKVk9YdklFemNCY2MvZjB3SXdh?=
 =?utf-8?B?YmRESTNrSTMySzNWbkpTT09uaTVEVm9VSlY3WU43Z3lFRVluTXNUZG9tQ2Fi?=
 =?utf-8?B?UVRSUjh3azJIWnFJL3k0VzRwakVlSHBvTGtmdmxyVVdMdmZCREZXbWpiTDcx?=
 =?utf-8?B?eEtWRktSdVdlRUVOeGJvV2xnWUQ4VDIrd21uZkl2eDUxRmI3UTVaL2k3dFdn?=
 =?utf-8?B?L2F2Rkx3Qi95SjRsSTY5Qi9yM05zZ05vTUpvNjdxOTh4QXVlM3RSYVdJbXBP?=
 =?utf-8?B?Qy9OM1c2cFYrZUtONkJmSDArQ3ZQcE1wdnlUb2lVUnNYNWUxbXRpNmdYN0Jh?=
 =?utf-8?B?SVY3K0dUVHUzV3VWTWozQk9lajhHS29Jc0xKRnpWN3VGWVQ3cklxUDNpSzRv?=
 =?utf-8?B?WnhsRmo1Q0h6SUtGUURaOHN2b08xQWsxbXlrWXZJQlhnZzQzRlQ1alVpTzFp?=
 =?utf-8?B?Z0VpL0dETkxmQk1DU0pLdnYyVU81azRleDhvSi9QR1dpeGdGWnQza2lMZ0xX?=
 =?utf-8?B?TVROcTdKRVdkWXc2MlY5WWxmNFpGUkp1R1hwbjFtRnJGVkZwZWtVVEZrdHA3?=
 =?utf-8?B?OEVlZTdjMFE1RkVsR2N0WlBvblpuOTlvUU00SXhqQmlYUU9CZ3J5dUcvcUtK?=
 =?utf-8?B?NkM1M3NvVFBMckM5OXk2UUo3ZEc3SEtRMk5PUVNNVEtzNmtDMUlPQzVkRlJ2?=
 =?utf-8?B?cFovRG9iOEpmU2htV0xtTUIzMVc4S3FLVHlZNVNtejdCbWt6T1I0YlVVeVMx?=
 =?utf-8?B?Zm1FMmp5TGpGRWxocmVXcUxMOHBhY1ZjanRDTHJOTWVJZXBmdjZ2bzBjWUZT?=
 =?utf-8?B?bWdPVXo2MlVKKzJwRDdyd1dvQUFYeFVKc1VISmxrTTYwYVBRRUx6VWVqSU1E?=
 =?utf-8?B?ejVucDVZTDA0OFY5cG5WakRPdU5obTlxazZtVUJkNTJWUElDOStKWmI5bjN3?=
 =?utf-8?B?QzF1NVRYTi9GbGV3d1hSb2NjNEE4Tk01QXliYWV5QXJlTnRhWHN2K1pTQ3Vs?=
 =?utf-8?B?QmFQUzhtR3ZTYW81bEUrdlBKUytwbU1zSFJBQ2Z1WkpFbE9RUEtUSGMrd1Uy?=
 =?utf-8?B?TGEyZjBVdkozWjFkTE9YVmovUk5PRnNXb1dSQWFJbndxQVZlZDBrbWVYMjY0?=
 =?utf-8?Q?ZhwyrNknVI/xstI8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 036b065f-d152-4d35-7532-08da5456c797
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 13:54:51.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S+tYzSmpT6VzrzNT6RNZcwvEbPGQXypiCIaN3jjVpZqRKbhapkKRIKiKMKwZpgotZByeebcBMrfhlt/qIQSTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2936
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 13:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167237

Hi Richard,

Am 22.06.2022 um 15:10 schrieb Richard Purdie via lists.openembedded.org:
> There is a reproducibility issue which shouldn't be too hard to fix if
> someone had a few minutes to help out:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14845
> 
> It is in llvm and is a cmake configuration issue. Rather than setting
> that option based on the presence of python modules (with python from
> the host), we should add a configuration option to force it to be
> disabled in our case. Should be upstreamable with the right patch.

I'm not able to test it at the moment but it should be possible to set 
the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP_FOUND and 
PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:

-DPY_PYGMENTS_FOUND=OFF

The find_python_module function in config-ix.cmake returns early if the 
variable PY_${module_upper}_FOUND is defined.

Regards
   Stefan

