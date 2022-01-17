Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5292C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 03:35:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6832.1642390544924985205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=rFlPTY/y;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=801638724a=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20H3VSjR006990
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:35:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=C9vZHCgg+yn4qUKK0YXY9/SfPA7PQZh5GC5edhXP/yU=;
 b=rFlPTY/yOR+YjGovs11Kp8dq7f6FVhcKbYkNLM0/WW62tT2ZqBXyO7TYaIZdCkiz51ZV
 NMPbxMxIcw9nobVi0/QD1oAcRTVs3k/kC5/x8RMPGGW465cUqqIzdS+LlY/qr2hXx3N4
 aIhYwjizQ5U2AEV7koXJEpewWBF+H08k6sIPrxoFYLS1wBLH0yFoCDKpOSW6eQPzUD48
 7PDQkP2tRaQuRe4dnfKHWu75a/1/0PFIElyyCLCDb0P4GG3H8RMR5+71I6mUWtCE0TqF
 dHndEO7+cy5DZgq3pbWDGAW7EVHpfU/n2mPD3fcfZjfgrqDlVWhpNrZ42lg/7oMPc48C xw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8tue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:35:44 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20H3Zh2V012785
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 19:35:43 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8tuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 19:35:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY9rEI6QZ+r/JYHDhPRKOAiTEwJ+g/N54hFPNETr7M5hfmyNeXzoLPAeLDZ19B6HaFF+nocSe3YI8U/FN6yjqAEbqHwPYJ49VHRBLbXyxZilWo2j1ALum8b0GOV8xpVwdEmWBiZNRgDpuxg5oWAZV3gfNJH9uPfrTpQ0qlisYj0D/jpgsxjyIo1JCyPNIlvTFuHQypySuiryQTscKsIcuw2VwOVeEJivsWoVjehZmtFFN/c7KsX1TQDPbNiyPSmCoWtHXalkDMHot3igxap/wOOb4dLOwD8J3+kX3Kb5Hn94031vc/KrCm8kpjwaCFD+A/0QLxDigtp97gB62ulWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9vZHCgg+yn4qUKK0YXY9/SfPA7PQZh5GC5edhXP/yU=;
 b=I9UWVfosRPYlQr03VYFjb43Th3aiqy/ZTytvHULfvEJvDDqvIQKcH9hIYdyVzqPWE1VpGhQfQPdSREZetph/dSB14k3O4Uu+PxCkhk4ZhBGgC4YDIpzV0AzvPUuO4EsBheb/rMrU0AgQvZv0FibPzWdRk7YDWlGzpmmefRKRNp9vq7R9aloOzH9VCBnAYSp93kkjHIxwfLc0qeUevxNxUKRGvIgKd/Jn5iZrHLXkvYmxy9gofxYJn7nrakhBRHWFDpj9dxith9iFtyPrTZ4jF5wZuJMTF/dNB+Mk0Sll1w3JD5oJZ8hXQG8fpIp2xwIF7WzFFxfD7jl1ZpaRClDQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by DM5PR11MB1754.namprd11.prod.outlook.com (2603:10b6:3:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 03:35:41 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693%8]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 03:35:41 +0000
Subject: Re: [PATCH] tcmode-default.inc: clear PREFERRED_VERSION for llvm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220116164706.4555-1-kai.kang@windriver.com>
 <CAMKF1srUmN7RzBaE3FNFXjUc7rvYWwOeR=qfhaXW71XKVONcKg@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <da314cc2-bc41-4fea-e51a-4e8cc463da7f@windriver.com>
Date: Mon, 17 Jan 2022 11:35:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: 
 <CAMKF1srUmN7RzBaE3FNFXjUc7rvYWwOeR=qfhaXW71XKVONcKg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------9F52295D3FD79D58DADA6EE8"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::26) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dfe273d-c648-4ff7-da62-08d9d96a6f8e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1754:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1754A290390714F903EBBFEE95579@DM5PR11MB1754.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7S+ndjwTw1ImwQJsvsipwnjWF1qwncTPwfiX6GiXWcAlv/DHjNa0IOoQLbIp7n4NsVIheY/N/6OcB0haGAiaIWmVECVueg/rIqN+UnzITbQicdAqy7heGAhBPqkvUaO5RGwEgoxQudHS2ZouimvKush37FjH7imUqQftwGvdtKE3zq3X15CFL6t8ioYYCHeARrQ7OPHcrj6XUSsEW9vuMkXaMJF9X+rUuwv6t2CN+uNewdu3qIC6UbAooegdZ9TFnBrcUrF1A3oLTuHWEu3RANayQh2zclM9MIR9ssjjvwVAsfWn/Zbm/NZHimJmrleIu7K9uVMidM0I1kuJ2XPCuzFRnvzUDwDf6psbQ3TAgbIEBsS5FrkDbwRVPG6pPk2aJ3BxSCyjESo9Cwr462oYcSN0um18tqGDMaBJoFgityj6Uf2sGjmwVECG8h3G+APDOAN/CJSKV2oc0bdX67uz9YvjVzg4RIZp6sL7iV3BAOKdf46poEntAtMlKgYjfgV58AKwng+BomcUL6fbtoJgD53iskatb63pcIKcTzZfBtmo0EuA/zBYPHjLMwE+SZs9XDGh68nRHlR8wLNggaAvZ9GCncdYDVNVFhaiB4/rhKohTUq5DZh+Ka2emiAUjQag6RMaoqXGQ1a2crW/3hdARxlE87tk47RyB2ZsgdVF9mlY2pyyDbJWWf5A4w+tW9Fo3BOIdXUMlQb+xnu5SdsH05fEYSNc3rucGQzi+AgaYARkd/JeawraZNnCUs6+JHemuEjKms/KrPT5Sc+hTPJ1zQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4326008)(38350700002)(186003)(2906002)(6916009)(508600001)(66946007)(86362001)(2616005)(26005)(8676002)(6512007)(38100700002)(6666004)(31696002)(52116002)(83380400001)(66476007)(6486002)(33964004)(5660300002)(36756003)(66556008)(6506007)(53546011)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHZrOWJRaWJTWlJiMGJZU0RSMk1UOFN4UGpyM3NlVVA5WUx2R2o2WlVaT2ll?=
 =?utf-8?B?eERtV2hHVmRjMnoySG5kVVJ6SGpSbWlXa1JtOURoYW9HbURscGt0akRBSndS?=
 =?utf-8?B?eVN5b2dhZVBVNDNoUVVQREtENWVISC9mN2dySlB3QTdzRWJuOENkem5nd2dj?=
 =?utf-8?B?VysrMzdxZmJ3MFowUFVUL1J6QXl1VHJJV0w5MjFsYW1WdjR5c0xNbGpsRm14?=
 =?utf-8?B?TnEwM2s2VnJqWmNJRGplOXUrRE52RlF0cGRHNGxXUktraE5ITGhmRkJJejRH?=
 =?utf-8?B?aE5Mdk1SZGpMbkFZa0prcS9INjcwQVZyTXZnelY5OG5Zc2drem05SUc5SnQv?=
 =?utf-8?B?WjdnT0VqYTFqZE8ySExsTEwwcUQxeDFnZEdHZURDTTMrdDk0czE5b0NqVTJH?=
 =?utf-8?B?SEdVSTlQcVRBU0ZGMUU0U2lSRVJhZ1Bqb1o1Um80QVRoREVOMnFiWm5TRTJa?=
 =?utf-8?B?UHdQMXYxMGlOaTN1TzRDU0xuenFNaGFLVmJMUk85ZDc4a0RoN3E4L0k4bjVy?=
 =?utf-8?B?NC90SWIyaGc3QlF4QytMNjI0NjM0YzNaN0dvL2FweWthU0lOQmx6bEZiSDFT?=
 =?utf-8?B?VEtTMkJTa2ZCeWRlNS80U0Mrd1N3dHNWRzVLWTdxdWdjVjVYQzd3NHV0T0hw?=
 =?utf-8?B?ZFEyZk81RkVwbFF1UVQ0b29KSm42MEoxRzlvRmpzSXB0Tjh1RlF1U2hEYS9x?=
 =?utf-8?B?R05jQkxhaVJFT1pRZU5kcVhyT2orMnNTYWM3Q2g3Ym91WFZDL0FyeHFLN1hC?=
 =?utf-8?B?ang5Rk10c0xTLytwUzNqSGlUbVBGQ2JLMmVUNUp1dGw2L2Z0dWpnMnd5aGVO?=
 =?utf-8?B?clFLbHRmNnNDUzN1aGZObFFzcFl6Y2xwQ3g1VlB3Q0FDSzBtdnJUdEUzazY1?=
 =?utf-8?B?T2phOHE0NkwvMUJWNFZ0RzlvZjhsSkd0YW9xMld6MWFpNFh6Z2NlMUlxYWZX?=
 =?utf-8?B?QTRDVFc4MW5lWkhjanVjbHMvMHRoaWNyNnprTnRzNlY3Y1dodTNIMFVCTXg2?=
 =?utf-8?B?em5qY0hPQkJ4c2ROekIvWnorNEgwdjdvZCtXVkhrOHlTUi9CRmpXWjg1dUMz?=
 =?utf-8?B?T1g5bWJRcU5QK3FqbTJTcnZPcE8rQnRyeEhHSm1qTzNCSTAyTzZHUE9DQnQw?=
 =?utf-8?B?YldqbUpFUEhaOFZhUGVFM3NhdDJrdzQ5eHJnbmVXK3orVnpUN1dNNVdPRU10?=
 =?utf-8?B?dmdpRzJqeitER1ZkMDlsSTVqMUx3YjNESEw3V2h0V3JwUFN4SFd0RlpFZEZx?=
 =?utf-8?B?S3JKUEhHcFZlWVRoanJFK25jZHVLYjFoUG5kc1FKbmFIaGc1OTVUM1NqWmZz?=
 =?utf-8?B?YnVCY0lzTS95U0lVWHduVk55QlNGcGRoOFZ4L2NoRGZFRUpsNUl3RHZrSXo3?=
 =?utf-8?B?cmZVdUMwdU9ZNmp3eGdHYXdsSU5DVGNVTTA3Qml5TlBVRXVkWkJJL0lGb3M1?=
 =?utf-8?B?NzU0TVZUZmJ3NmhIVmJXSW1ja1U5QWcxVG9aZDNiS2JSTDgrRHdHRTYyalNZ?=
 =?utf-8?B?V0FNV3Q4TjVZTzR0d1FIdVNiTWIxYlcrSm15OHgzenlSWnNDcVNKdnhWUjgr?=
 =?utf-8?B?UlA1REJQRDJLQXV1enJkd3JleG94M21iNnRSZFl4R0UvUFErV293eTBBVHBq?=
 =?utf-8?B?UmR6NEpCUTVXS09lWkVnUWc2eGwwNkErOXhFc2plaTRKR1RDYnZEK3MzS0dl?=
 =?utf-8?B?SFdiSzMwRjUxcENWR3ZOOHhUeDBqTGhvTlVyVy9pUWp0N0JDV3IweC9YaDNn?=
 =?utf-8?B?MlhOcnBCU2dwWjhNSjJhakE4RWw5UWpQUWFUZG9OZ3JCaTNDZTFad3Z0Y2pU?=
 =?utf-8?B?TDhmT1NidmkvVmlwMnVOQlZsR2pqK1F6VkF0L1d1MW50VzZwQ29nRGlVcWVZ?=
 =?utf-8?B?NVp3UjI2cGpibmdPS3cvc1ZDSS8waktOTEgwUndoNnprR2V2a1lCZnhEUlhT?=
 =?utf-8?B?QU1LbnNGT2JFU3NLbWRPNWVDaDRteHlPelBzVU5WWndPNmllRy9CZm13SHFK?=
 =?utf-8?B?NlpNT0MxYmwwUmphZU81bmhPYXBVNW9pak96dW9nSG5vT01XYzFLK1doSGRB?=
 =?utf-8?B?ZWRiQ1gzSmpETGZOcHozRkhneEtUdlhuZ2JuaEZrcWtxUEpVb1JZSFU3OEJZ?=
 =?utf-8?B?V2tlazUwc0p1Yy9zaFF5Q3h0OHhMQ1J2MUdhWXhHWndCRlJNWHdrTkNZNWVX?=
 =?utf-8?Q?yO46Q8KB/UTGBQGwVBCdSRs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1dfe273d-c648-4ff7-da62-08d9d96a6f8e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 03:35:41.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 J4SkOynX9/ENSYmII6rX+lkv4TUlZD3SFiVu8oOHC5yG7d0SVLxbt5Cq2rk/gp/kDQQtGW/bhFD2Fc+/b7xy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1754
X-Proofpoint-GUID: desgYXV5WFhfpK-FOW9CGNemvgg3G11R
X-Proofpoint-ORIG-GUID: yz__cgEpXoqxbTbnOVvwc-CfgaIjsdSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 03:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160632

--------------9F52295D3FD79D58DADA6EE8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20H3VSjR006990

On 1/17/22 2:43 AM, Khem Raj wrote:
>
>
> On Sun, Jan 16, 2022 at 8:47 AM <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     When include layer meta-clang which set LLVMVERSION in layer.conf, =
it
>     shows warnings:
>
>     | WARNING: preferred version 13.0.1 of llvm-native not available
>     (for item llvm-native)
>     | WARNING: versions of llvm-native available: 12.0.1
>     | WARNING: preferred version 13.0.1 of llvm not available (for
>     item llvm)
>     | WARNING: versions of llvm available: 12.0.1
>     | WARNING: preferred version 13.0.1 of llvm not available (for
>     item llvm-dev)
>     | WARNING: versions of llvm available: 12.0.1
>     | WARNING: preferred version 13.0.1 of llvm not available (for
>     item llvm-bugpointpasses)
>     | WARNING: versions of llvm available: 12.0.1
>     | WARNING: preferred version 13.0.1 of llvm not available (for
>     item llvm-liboptremarks)
>     | WARNING: versions of llvm available: 12.0.1
>     | WARNING: preferred version 13.0.1 of llvm not available (for
>     item llvm-llvmhello)
>     | WARNING: versions of llvm available: 12.0.1
>
>     Because only one version llvm exists, remove the PREFERRED_VERSION
>     setting for llvm.
>
>
> I think these are PROVIDERS mismatch more than anything between two=20
> recipes so perhaps it=E2=80=99s better to keep that in sync

My doubt is that it seems only a single llvm recipe exists in oe-core=20
around all the layers including meta-clang.

Regards,
Kai

>
> Fwiw llvm is not heavily used in oe-core perhaps it should be removed
>
>
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>     =C2=A0meta/conf/distro/include/tcmode-default.inc | 4 ----
>     =C2=A01 file changed, 4 deletions(-)
>
>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>     b/meta/conf/distro/include/tcmode-default.inc
>     index 49e99af8f2..2622b055a2 100644
>     --- a/meta/conf/distro/include/tcmode-default.inc
>     +++ b/meta/conf/distro/include/tcmode-default.inc
>     @@ -79,10 +79,6 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>     =C2=A0PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>     =C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
>     -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
>     -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
>     -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
>     -
>     =C2=A0# Rust toolchain preferred versions:
>
>     =C2=A0PREFERRED_VERSION_cargo ?=3D "${RUSTVERSION}"
>     --=20
>     2.17.1
>

--=20
Kai Kang
Wind River Linux


--------------9F52295D3FD79D58DADA6EE8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20H3VSjR006990

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 1/17/22 2:43 AM, Khem Raj wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srUmN7RzBaE3FNFXjUc7rvYWw=
OeR=3DqfhaXW71XKVONcKg@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 16, 2022 at 8=
:47
            AM &lt;<a href=3D"mailto:kai.kang@windriver.com" moz-do-not-s=
end=3D"true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kai
            Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"=
_blank" moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            When include layer meta-clang which set LLVMVERSION in
            layer.conf, it<br>
            shows warnings:<br>
            <br>
            | WARNING: preferred version 13.0.1 of llvm-native not
            available (for item llvm-native)<br>
            | WARNING: versions of llvm-native available: 12.0.1<br>
            | WARNING: preferred version 13.0.1 of llvm not available
            (for item llvm)<br>
            | WARNING: versions of llvm available: 12.0.1<br>
            | WARNING: preferred version 13.0.1 of llvm not available
            (for item llvm-dev)<br>
            | WARNING: versions of llvm available: 12.0.1<br>
            | WARNING: preferred version 13.0.1 of llvm not available
            (for item llvm-bugpointpasses)<br>
            | WARNING: versions of llvm available: 12.0.1<br>
            | WARNING: preferred version 13.0.1 of llvm not available
            (for item llvm-liboptremarks)<br>
            | WARNING: versions of llvm available: 12.0.1<br>
            | WARNING: preferred version 13.0.1 of llvm not available
            (for item llvm-llvmhello)<br>
            | WARNING: versions of llvm available: 12.0.1<br>
            <br>
            Because only one version llvm exists, remove the
            PREFERRED_VERSION<br>
            setting for llvm.</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">I think these are PROVIDERS mismatch more tha=
n
            anything between two recipes so perhaps it=E2=80=99s better t=
o keep
            that in sync <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>My doubt is that it seems only a single llvm recipe exists in
      oe-core around all the layers including meta-clang.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srUmN7RzBaE3FNFXjUc7rvYWw=
OeR=3DqfhaXW71XKVONcKg@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote">
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Fwiw llvm is not heavily used in oe-core
            perhaps it should be removed&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
            <br>
            Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true">kai.kang@windriver.co=
m</a>&gt;<br>
            ---<br>
            &nbsp;meta/conf/distro/include/tcmode-default.inc | 4 ----<br=
>
            &nbsp;1 file changed, 4 deletions(-)<br>
            <br>
            diff --git a/meta/conf/distro/include/tcmode-default.inc
            b/meta/conf/distro/include/tcmode-default.inc<br>
            index 49e99af8f2..2622b055a2 100644<br>
            --- a/meta/conf/distro/include/tcmode-default.inc<br>
            +++ b/meta/conf/distro/include/tcmode-default.inc<br>
            @@ -79,10 +79,6 @@ PREFERRED_VERSION_go-runtime ?=3D
            &quot;${GOVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&=
quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOV=
ERSION}&quot;<br>
            <br>
            -PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
            -PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;=
<br>
            -PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&qu=
ot;<br>
            -<br>
            &nbsp;# Rust toolchain preferred versions:<br>
            <br>
            &nbsp;PREFERRED_VERSION_cargo ?=3D &quot;${RUSTVERSION}&quot;=
<br>
            -- <br>
            2.17.1<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------9F52295D3FD79D58DADA6EE8--

