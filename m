Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD2DC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 08:58:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.26502.1664182712767926909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fsKqhngX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6268e86fbe=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28Q8iTws015558
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 08:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=guT0EtxJog1I6Bo37Rnzv247n7bJyzryvdCN40hM4M4=;
 b=fsKqhngX6c9af+dN+Z8fNAhlGwaxEX7UXekzqj6jtYSJPkOYl9RGHeOWvaHpXaYbvE+a
 Or7KvZHNUWnr7a4rDT8pxqvashMJ5aNQNbLvkZF9JeWynTyYUG/25/zE8FE3b31e+q3d
 SzKRSvpn3BhPNvGDBXQ6/jQogQH4imJ5Q0MsuAbA4fqQ/iTg3xU5NhLrXtIfnr+MQO6b
 uUx8XP1nVxjzhllsl3Nf3qiMkWNXfevIaMA9G3qTCx5TBADx+lyMSTZef3jfUF+hsL2L
 6z5FJFWgKSqslm80RP3go7yWyDiYlXXSGS2UnRa5aq14pZe9T5IqTHuBhyx/TIsVAewk OA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq421fhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 08:58:31 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q8wVwm012095
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 08:58:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq421fht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 08:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cylgQfgOQZB8OHxxP8J1jUvbwm/OmDfjPy1MRjQLiTLiNOwy4qOEDw8/v/Y6Xm606Q7VyvplKuFl1+mAS24mrntkyt/pdhpeFRab9qmAmln4Wk+T2dK8uIzYdjtx0L+79+KdfWKwfQzcMUTC9RCtx7AB01Sq+HjLkz+alYcJvQ7WU2YR7+sc9QKrGlGjueLKd5PwknP+jMk0oiMSOIizXy8QrpSo8iL6On1iA+KlUy2uTPgtUjJ0M+vpBsv7qWo6qFvSa4lAHl7Mh2Q3qKvD5kIvt4YIOG3YrlZRiSajP3Xm6R8NjuHiIPyG1UPZLMY5qigHAb4KuoRcZmj7VRpywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guT0EtxJog1I6Bo37Rnzv247n7bJyzryvdCN40hM4M4=;
 b=jm4qm7Icj6AFD2jxizjiZJzK2Z/f7DmAPG3eOzE+CSLegzwiLQ6bJj1qvgVxSQhpm3Aq6kcRFoB/5H6JHbUqXsuELf5h1UgBLB2odOwhoyv92Q+ZvzM59nPMniRXFAFt9fGxLg1spmWP8KK7QVb63yzvgpJx4Gm0qG1g6WStEZ1Yp1fJQdqfQ0duP/Kvo3SY82h6nvne8EUc8/7MxbRquj7hzHnqGDv5RAY/BHnKEdaerH+eMHr5h1/PkZcZ6tzix6mvoLal2hHRD/NLvBJ6szMbpN6GcEFyAu/LdxDwM1rQyElXe8SN3MYVU48Sjf6oqOYjnWY1trvt4YeTHbe6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:58:25 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::ef40:941e:d951:8a0a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::ef40:941e:d951:8a0a%6]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 08:58:25 +0000
Message-ID: <84305303-fdc6-fc07-37b4-040c970e7f9f@windriver.com>
Date: Mon, 26 Sep 2022 16:58:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] binutils: handle symlink files for gprofng
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220922082545.40540-1-kai.kang@windriver.com>
 <C355BFD2-1F04-4F16-98DD-23101750B29E@arm.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <C355BFD2-1F04-4F16-98DD-23101750B29E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|BN9PR11MB5531:EE_
X-MS-Office365-Filtering-Correlation-Id: 8575a12c-db65-4724-39c6-08da9f9d45aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oipnq+4VZcE4Puuhvn+dJjNX1GEz1Qt7d0ovxRUBaPRpaHL7kSCKpFp536VNVmLudJwh95JNcAXbkNRRnlJF2Bg8+GkDDMIa8m1GL2egAOKndj+mYyH2MYMOcYb4xlZa3ExMwbCPewBMgHH/HXQTpTajTpBMPrwUc5BhG9rESe01DYZxh/GQe4UDYO0UKqQ6sSVA2Po3r3SWptByYqdHYsmHEMkRmxSXMtSL/X5Cf7C8287kWXl1LPOveuC8wsYRucGzSrxT3isn010cM5LXsDh+cJE6V6v5BY1hgMJ+3ucnNQy83ye+yDAhqKUl/1zYW+ny5WDXTgpma7tMBiwmn1DFb7QM3j/1qSZmKAoUlNXBlJ0XJNzHK/xZnnM2++g/86t1648rLIa8KgFjrJSXUqbbRyT3NtWaamkY3+TZdhsSAZPOVHY2RCkPfGwsnvUXVAIEUDLPXKG0i/kMzrUELqBoYTwOMGxgxA3OwKRpq9PdlCLRJ/EiJSeJekErzT6TOMB0/em7g6fPMY+VXjBMSoz/PAPetbEHKGFTthOGCDazwwUKA48yCBvb4i3hufTzaI0fGkkuD6PRRrxt5vlYPvn4LGQaRFJhOHUhZkhBR6+duKAagu03H5sSELymKdPApIWt89pljgPTVVmqIZYm8jVI6vJPcFuEDLF3yVK9RlbFEdJyBVQScR4TZE1wQ4pu+kQpp0DW0+PvtGrdGHNM4dv+dw/lO3cUUAwYjq/RQnmzGcLzHTttDulnB8DPkeL3kaBdUOkdQIERqrZoR9VQxUoxMSrFhcqt+d+tnIhjjms/H6kvyRG948W4QtdRKQuwHIouSdy0lKwlhpjgFl1LkjuozCmgFTD06ZVuJy4Qqt0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(54906003)(6916009)(4326008)(6486002)(316002)(966005)(478600001)(66476007)(66556008)(66946007)(8676002)(6666004)(5660300002)(31686004)(41300700001)(8936002)(26005)(6512007)(6506007)(53546011)(2616005)(83380400001)(38100700002)(2906002)(186003)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2plWHZzRHVyd3JoQVRmUi9KQ1RSNnZNT2J3cGxUY0xndlRBOUNTeHFVQ1JI?=
 =?utf-8?B?SjlKWTBIeGRpTnRZTWJCcTdPbDJXMDVEdzVVUG5YWm54d1dZNUtvQ2k5OGgr?=
 =?utf-8?B?cWZTZmpzbjdEajllZWUxVHNGNWc0N1Y1VktCZDdWWFM5bTFVajRONTFJcmR0?=
 =?utf-8?B?a0hLZ0FSVTRhUWtHSWxRaW5SK0RwZ01zbDBvdVVRVmxveFNheWpsYWc0Sk01?=
 =?utf-8?B?YnhrYWNrd3NPM0xHQ1cyOTl6bnR1U1ZUQzI1YXNEckJWd2EzckI2UmtNejBQ?=
 =?utf-8?B?UHp1M3dsbzZacnZMdlRGMEhUZU9hcGF1UERsaUJFeWpBMXdwY01VM3hUbmt2?=
 =?utf-8?B?b1BRMUJkMnpmbndtZmMxQlVvNHUxR1QzWnBWZ3JOK2d3Q2FLbFU2NXZlOHNx?=
 =?utf-8?B?NzQyZUFRUnZGY2p3Rkw4RzZaVXZpNFdwL1Zhd2hpN1lHVUJKVmFpeG9JbmFs?=
 =?utf-8?B?S3VvSElybHk5cWdhL1hUUkdUYWJtb2FIL2I4eXhCQTRIUmFiakpqd0pkZ21n?=
 =?utf-8?B?LzFVbHhsaTQ5Lzl5Z3I0Y0ZIOFg2VVc0eGoyczNJT0VweG9YQkNLbS9Lbm9G?=
 =?utf-8?B?SGJjUDREOElLU0IyaWkrQUFwSy94Q3A0d0h5NjR1TktYOG1NWGV2cGl4QTF6?=
 =?utf-8?B?cDFDVi8zYlh2QkU4U1h6bnJtYThrMmNpMjFndFdsaEpFYytIRld5NGNSYmZL?=
 =?utf-8?B?K0M0ejVlVnh5K3g4R1Q0MkhQNzA2VkxDdU9qWXg0Mk5rUyt6ZzdtYjMweldq?=
 =?utf-8?B?V0p4UkdLSzcwUzRIVXhjL3F5YmdOVVQvM2YxMzhnUURYVmJkZTAvRVhYa2ho?=
 =?utf-8?B?dVQzWjNGaWdDMGpYR0E5b1lvQy9jZnZKMkEyUEZWZTVGbFQwUjloU0w2UUhG?=
 =?utf-8?B?V3JER2J5S1NBdnNFZ2pkbWsyNzZEbWFVRUMrZHF3enNOWW80QXVTWm9RYUdz?=
 =?utf-8?B?dXpyNmNUM3MrSGFpOWJmY0E1SzNlclRzZVQ1TzFjeW4wY1d2LzB6ZTlwMVFP?=
 =?utf-8?B?RU91alpMcVUyZnNaZlJ1R2VOQ2N5SEp5YXhqVWhONHVqRFdTR1hvN0FkUjdo?=
 =?utf-8?B?WkcyYm1TZmN4VnVRUm9wUmZnYVY3ZVFXQk9FOTlSdWMyc0xBajQ2aGtZalFN?=
 =?utf-8?B?ekhadmh3M0RGVGJUMHR0eFpSYXpUMk93bnVraFNWSmRISFFCK1pudVRzaDdK?=
 =?utf-8?B?T3AyUzZwMW50Nnl2YS9lcGJldXVlc0tXd1ZuWjBhZjcrZ0QvVk9UMXdUYzhM?=
 =?utf-8?B?TjlKK1RzOSsvMnQ5aVBVZ01ZQ05OV3A3OGxDdVhLS3lTVzFEb2l1S2lWRmda?=
 =?utf-8?B?Y2VsRzBjelErZHp1YjA0QnlEQTd4MTBlRWhXd3dCNW9heTRhZDBOOUFrQ1NZ?=
 =?utf-8?B?aHFIWWtnT1lpaVZFQmx1LzFMeWVFK1JqMUVqcVdnNXdsSFYwTlNxdUZRUmJP?=
 =?utf-8?B?emxwMzF6YTZjNGpJOEFudytsNUs4Mk9LSjhkc1RPa1V0VEE2MUVzQ2ZlUTRt?=
 =?utf-8?B?QlcwdFZhMzJkK3l2UVdlSjl3TWVDeDhJNXNuekpod0cvcjM3OUt1UUhDRFJJ?=
 =?utf-8?B?QVp4QzlHVmZJSHdwQTlyUWpUUUZqeDFvdmRvaVk3T3Rmb3d4SDNwRDZVYTBW?=
 =?utf-8?B?Z0hKaGt4c1dkeEcrWWxWRVpYd0t6dFozVHJBZEdkNFVmSzZCMmlsVGh3U3Bx?=
 =?utf-8?B?a3pDekpja0h6cno0UW5HU3lLUzBLNjlhWnNWdTVoT29TSnpJWEszRVREZnhC?=
 =?utf-8?B?MXB1b1h1a2NMMVBSYjZnNXpEUFdMOGNvVm03cGRXRk5lTmt4YndMRWgwdGtH?=
 =?utf-8?B?bWx1UUVxSWg2dHN6MWZscStFTmhkVUJHaHBIVEpKTDVPT3VhS05ndmpFdG5j?=
 =?utf-8?B?OXRFRnBvRzBoVFNhdEY4WmVCcG5DeG9sTGVkN0JhSXZyc1RubHh3eU4zMUth?=
 =?utf-8?B?VWxFRHNBRUZLaVdwMHpSMEs1NkxPcENKdjJCa1pCUldJRzEzR2FyQlQyMUdm?=
 =?utf-8?B?RmxUcnVPUEhsaXN4NXB6aUNFelVjOE1LU3VKNjlkYzVDTEhZUzUxSmxEWEhV?=
 =?utf-8?B?aGowMVh3L0FIZWp0cUU4R3VFZERxTjR0WU1PVnNOTWVoSXIybnZkZFh3amFK?=
 =?utf-8?Q?zN3Lsq3SNYfhF+NFiI+0MGv/I?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8575a12c-db65-4724-39c6-08da9f9d45aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:58:25.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V6004AytcWXGsmm6KMkKs84nO3JDlxc0z2gwcXPr0o2MOJS61xzkTNHNt56WzmrTQDaeqa80KzoAf71mRE2K5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5531
X-Proofpoint-ORIG-GUID: YMJfvDJQeBqVjz9uCh9312p2bPeC5tqh
X-Proofpoint-GUID: yhhReipMsgs8ojXxkmU3WzJdLuHvFgox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_06,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=863
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 08:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171053

On 9/23/22 23:30, Ross Burton wrote:


Hi Ross,

> This is making our CI explode, I suspect the trigger is having meta-clang present and enabled:
>
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gp-archive: /usr/bin/aarch64-poky-linux-gp-archive does not exist
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gp-collect-app: /usr/bin/aarch64-poky-linux-gp-collect-app does not exist
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gp-display-html: /usr/bin/aarch64-poky-linux-gp-display-html does not exist
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gp-display-src: /usr/bin/aarch64-poky-linux-gp-display-src does not exist
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gp-display-text: /usr/bin/aarch64-poky-linux-gp-display-text does not exist
> WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative provide /usr/bin/gprofng: /usr/bin/aarch64-poky-linux-gprofng does not exist

Sorry, I'll figure it out.

Regards,
Kai

>
> Ross
>
>> On 22 Sep 2022, at 09:25, kai via lists.openembedded.org <kai.kang=windriver.com@lists.openembedded.org> wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It provides gprofng by binutils 2.39 for x86, x86_64 and aarch64
>> according to configure.ac:
>>
>> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=configure.ac;h=a5555a9c91b42214afc46a0ab8b629e4c6fedcc0;hb=HEAD#l401
>>
>> Add them to USE_ALTERNATIVES_FOR the same as others to handle symlink
>> files via update-alternative mechanism. And it disables gprofng for
>> clang and musl in .bb file, so clear GPROFNG_ALTS for them too.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v3:
>> * clear GPROFNG_ALTS for clang and musl
>>
>> meta/recipes-devtools/binutils/binutils.inc | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 789c8bec21..4dde387a8a 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -36,6 +36,23 @@ FILES:${PN}-dev = " \
>> # Rather than duplicating multiple entries for these, make one
>> # list and reuse it.
>>
>> +GPROFNGS = " \
>> +	gp-archive \
>> +	gp-collect-app \
>> +	gp-display-html \
>> +	gp-display-src \
>> +	gp-display-text \
>> +	gprofng \
>> +"
>> +GPROFNG_ALTS ?= ""
>> +GPROFNG_ALTS:x86 = "${GPROFNGS}"
>> +GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
>> +GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
>> +
>> +# it disables gprofng for clang and musl in the bb file
>> +GPROFNG_ALTS:toolchain-clang = ""
>> +GPROFNG_ALTS:libc-musl = ""
>> +
>> LDGOLD_ALTS ?= "ld.gold dwp"
>> LDGOLD_ALTS:riscv64 = ""
>> LDGOLD_ALTS:riscv32 = ""
>> @@ -48,6 +65,7 @@ USE_ALTERNATIVES_FOR = " \
>> 	c++filt \
>> 	elfedit \
>> 	gprof \
>> +	${GPROFNG_ALTS} \
>> 	ld \
>> 	ld.bfd \
>> 	${LDGOLD_ALTS} \
>> -- 
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170965): https://lists.openembedded.org/g/openembedded-core/message/170965
>> Mute This Topic: https://lists.openembedded.org/mt/93844412/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross.burton@arm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


