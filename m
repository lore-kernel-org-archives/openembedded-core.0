Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21F7C05027
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 02:22:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6372.1676427743061825490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 18:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=b3JrcL11;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141047d949=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F1k0Sl030256
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:22:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=B4t+jJ14AvyvjJ8vH3FJNyAVrU+zXKaEzQCs2L/EVpw=;
 b=b3JrcL11UytbirF4Juz8Q47Qc3zPwSidDAuaKcWL3JV9q9C1Tc/awcE/YL9VcdzdBleE
 VII62OGt/vZCdmacBY/REkjpYqdqQopaPRRVIuBWT6qLIiG8bx5k4eo6xfn33fnPVWyQ
 GFlIS9EDkuz7+KYd+xymVeVIh8Q3DsNtiEmeL9x/c9dmv3ILEbzFsDmRYolhyvFu6ZFq
 qOYjCx7Kgkx3biOR1SrFTWAmEKyGSC69hVGgHlHhWAiarixUsXhBRq/eKWdVlrZA0Q8T
 y3Y4SD4vzIANXQCOj0kBEZcSp5/xQ8T7AXU03EJPzne4+5Px6Z2BvGgLNWLIIpFgZiuM EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768b4gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:22:21 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31F2MKnZ012332
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:22:20 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768b4gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 18:22:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hewH0aYzKwz5gIzgkbATTr7LH8V8tgCCPb1bZzU91moS7As5Q/dlg4dOnG7kwJNWBNP3om8TPylY+4gXz9YRNiUiE953k+O4H6hK8bzeKo8FPaqJEC1t3gLsglVcJIRMrg5WDA9C71ci/ItM8UuYDpXULIU0gshEJLFD1nJdQcBPO5Aujrqh0uvjyiDEGS++hkiFZx7i/jULnUAOhIassAgj0eaZpHyf0mULleNOF9Fb6CYuFvqvP5LSyBPyhYvZCAEUMiuQ9U8OIqJk/20P+fz4CLwL+rjK76vZ/nAuW0E5QCPZRY/n0tTf2QVzkJyTWoHb6tbq68OFjWCEP/5WlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4t+jJ14AvyvjJ8vH3FJNyAVrU+zXKaEzQCs2L/EVpw=;
 b=JbhdEL9nySMdgwczTMbk46I4HWBVdDyxBAwjxIcyxR0iUxSi8vRYE06D/QPAf6jVLngIuP6BZ/TXaexSjWU2DGhdt2BHIdG9LXvn2yGhbsH6xug+M522Ga26m/CZ8kE+7Z81WFp/cWP+B3N5+8KKePWJtQxQps5eVRj9iDPY75UAqT8noKO7E1b0Nj6WPQ79xDItiIx155fO7aI+iVbzZpoFxJZaFIeanJCVv+Pw2MtG6MQWbqPPdV/4KbPTSevNAWJM43tGjMX+rNSWYUcYfn0f5hs7FkSxN4dGxgb8xnh4IbKZwrXn92ubgCchQolglcw4GcdIrtDms7DpPyflcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 02:22:17 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6%9]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 02:22:17 +0000
Content-Type: multipart/alternative;
 boundary="------------sousiyTxAfIbfRR4K9EJzNXP"
Message-ID: <ab763cf8-1627-84c7-f533-738295f13914@windriver.com>
Date: Wed, 15 Feb 2023 10:21:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: fix compile error
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
        Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230214142235.38975-1-kai.kang@windriver.com>
 <CA+chaQe7v3SCti7VASE80CcsPaObRk+FXckC5NcVYsrSh5cfCQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CA+chaQe7v3SCti7VASE80CcsPaObRk+FXckC5NcVYsrSh5cfCQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca6a047-1c02-46ee-1fba-08db0efb7548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i6nYIgQt/ptNqTYjYUHrgOM11WSJ2BpIMFsas6Xh4f2Pf2Vug/TCOQPJqluC+jDdYtaq0+Oy1pnWC7FfZVIpN3Y7uR9R1fzoQCu12qy6sqnZcFsxKQXdnmOlfh5VnQcSiyZTDujVX4S6jIHlOuRED/g0C+Kr/tOV0cWSbWHdDl+ksmv9W2xdp+g9toGJk18XvwQdVQt+ERA97QuesNzuOXxdaq+7fuXYqoDijzFwfWiSXh6hNXIjCyLBMGLMz9ZYuilEtIOJ3cHnF99dyzOLjMcjIEHWMDC8GNBK/DAJy9oPWIrJxKGVccoIjGCTofl3ls/6VusSPnKk4ywyX62Gojrsvygw1Y5FDF5UBi35xhg4nY7CWKI3EvUWOmiNIXGILcIWQgS1/MCIvUn9HO4Qi6r3sD1HYcN1Cue6nfz7Xk1FbUua5c6GCX/9YsydkZj8ooeriJ68+YDeKfzxoGijcs+VdK9AhyRDrY4O9Z6PaDTUWImkG00yyHhUBGRoDTkcuBjMGrGuY+lBBI3bTRunG45mBzLxY7BYWpKD6KMYmEKVaeWipus6pqDJb5W5qvpu3E9C6fS0ELUtZIu226Z/KIfROEncyTlpD0QgKkzRp8Tc83uWKd81btCKkTGqHRH3vEoLZNOaVZj4mD8eI39YV552VnP6dV/r5A/MEiQpEJNVZ5W7ShTtrn8YLl7ntmKEH9fjB4uskNT7MLeg14iJwAnFVjvEvy7O3NDZ6a/L8cDP8A3Ur6zEurnEROKSd5SE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199018)(86362001)(186003)(41300700001)(6666004)(316002)(66946007)(83380400001)(110136005)(2616005)(66556008)(66476007)(5660300002)(8936002)(478600001)(8676002)(4326008)(33964004)(6506007)(26005)(36756003)(6512007)(53546011)(6486002)(966005)(166002)(31696002)(30864003)(2906002)(38100700002)(31686004)(66899018)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnV3ZzNUK0FmUndyS0pGZmNYOC9XYlFHL3JBazZPcm5FKytGTnlrOS9LNmYz?=
 =?utf-8?B?MGpIUjBKZmdkQ2FvVVUyaE9Ec2lRTU51bXM1RW51ZTBTL2ZSODQwN1dnd1V1?=
 =?utf-8?B?ZFl3U3NQUzhvSVAyb1pjTVFCUUFESnluV0xVRnkvOUJnREhmclJLRlNQd0F1?=
 =?utf-8?B?OWliU1BGeTg5M3JqMzFtQ0ZkYlNieVROUWVmV2xNb293WDhiRDZXMGU0K3JO?=
 =?utf-8?B?bWR4SUtkbWtETnJwbXV2YmtnR3VlU3RicVdHeFU4WDAwdUl0ZUJmTFhLMUt3?=
 =?utf-8?B?SHlKUURYcnJGWGNBTzQzU3RjOUU0cjVWQ0sveCtmN0xCWjRGU3ZhbjhPayt6?=
 =?utf-8?B?UXk4VHZFUWtZRGRQRWFHcm1tSEpTTUpuM1UwVm1qb2ZtN1BSYU5kZWlWMUt6?=
 =?utf-8?B?UmEreEVNMkdRVG1Tb3MvUXgrbkV6OWo0YkpwZHh0Kys1NHJpaGk1L2ZNcGQz?=
 =?utf-8?B?U2Z2Ti9wWFNocjRXcFRiZVlTOUVqcXVzNkpXcFZUdCs4bjk0cm42QTZCRy9I?=
 =?utf-8?B?c1IwVTF4VVQyZlh0OVY4UmVKL0lTdmM1VDU1RlFNdGx2Z0JZa1I5ZWc2RDNa?=
 =?utf-8?B?SzIvWnVHR2ljN212Njlmb2pNZDFsSEgxQk4zVTUybk5rdjBBWVdnRk9Fbndw?=
 =?utf-8?B?cURYVW5MTG5jUEt3S3lENnV1OGNWNnhER2VkNGFHR29EMVljYWVobXdaNTVn?=
 =?utf-8?B?OEdxMGZlRVhyNko1VXVZenBzWkRpNHZLU3YyTDZZM2ovbTVpZDJxamdsSzFj?=
 =?utf-8?B?OWx0V0tpVTF3ajFJY2ZESnRNU1VsczlpalBvN2VCT2V1bHJ4QWhwT2lFdG85?=
 =?utf-8?B?ZnJVMmFiM2FkaHJuVDhkc3g1REtiZnpFNys1dEYxVmFmQncweTRHTUowU2JC?=
 =?utf-8?B?N1g5Z3RSaFVsR3gvOXdXeFI2RHB6dzk0aDJxODBiZzZIVkhOZmlLUUxzSUVG?=
 =?utf-8?B?dC9ITTBrNUF6cXhPZDVXeGtPY3YwYzR1Vk50OUpGT1Mxd2VTbm4ycTFZOXVt?=
 =?utf-8?B?OXNyU3NXZmNhQWpoZi9qZzJNUWtsUGJ6dlkwWUswSm1naFZYRHo4bXo2UkQ5?=
 =?utf-8?B?OSsvRXo3dWVlNXJDbm5wZ2d0aDhTZG1UQTQ0S1Y2ZVJTVDZQOFJrR0ZYNTQ5?=
 =?utf-8?B?ZDFhV25QUmNLQmxWZ0wyS2ZSK0dHY2ppenhibmxORk9rcko5SGZkbmtoVUdu?=
 =?utf-8?B?ZDFnU3VtR2t2bTBnSUowYmI3S0xXeld0eUtEQ1lmSmxJZ25IbmFQOCsrc3V5?=
 =?utf-8?B?YXdxL3JId3ZMUnkvVVErU0NIN1VxVVV1aXQ4WS9XZjljYVMrSjB5aStBOWJl?=
 =?utf-8?B?R2UvNWpjOHQ0eFo4WXRyaElkNk1mdHFCMHlwR2dtNlREVGg3clUzcFZ4bVVJ?=
 =?utf-8?B?UGdYL3luNDhMZVZpeVpNemZHT0NyWTZONCtEeklSdllVZldrUjlFZnQyT3h6?=
 =?utf-8?B?SnRVNTRUNmdUcHp3ZDNEdndGRXFIeWpEVytPR3JPSldicVJEM2xHb2FtcVUz?=
 =?utf-8?B?RFBlaDE3cndaSDBIM1pLbWJRbjBJU1ovUHpvUWxQMjVQOHpyblFkRWZlblR5?=
 =?utf-8?B?WUpNUSt2WUZ1ZWRoMll3alhLOU1aVHNzQVJsYUlvaTArWDg0VHpPZlNod0VH?=
 =?utf-8?B?Z0Z0bjR4M01qTVdqODVjbEwvMkF2a05hRXFmK3hLamg5L0hpRk9GMDlvTUEr?=
 =?utf-8?B?OGl3aW9BTG0rUnNCZHhucEdEOWFWRVAyYmdXRUsxUlRWMFIrS1ZOMkF1U3RE?=
 =?utf-8?B?MVhmVUdtVXEzU3A2KzhCZlc2Vzk0aENvRVczRDV5R1A0S0FTUzBNSG5HS1FU?=
 =?utf-8?B?dXJPN0tzWjVQSTVIRmo5bjkzSFZYNG0xNSt6aVJXakczQ1pvN0gva2MzNjlP?=
 =?utf-8?B?alBJcDNKSWV0WVJRU1JWblJUSjFkTUZaNXVOQ3FUalRmVHNBWEpIblFXcHo4?=
 =?utf-8?B?SU4wRjdlQjJ5azdiQVZmc29MN251U2pNcWlNMXNRTVJhMnJNMHRjTWN5QXNr?=
 =?utf-8?B?TnhIS3V0WE00Mi93U0pVN0hhQ2RaZ2lxUGxoK3FacVlmQlpmZVMxQmFoZitj?=
 =?utf-8?B?MExjQW1ZbXlhc1NjTXpua1R5V09HOTBaVy9IYi95cGhQQUFGUUh1QVNxSGZK?=
 =?utf-8?B?bGFJNStRK3pyblJlTlU4bFJ2MTlzdnQ2TGY0ODJkWktpaktqcmY4dFFWT1R1?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca6a047-1c02-46ee-1fba-08db0efb7548
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:22:17.3747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erpjFHuCGOqboNVEOkirJ2LTYTEF01JpjC99Go5D7oLIvHXKZEsxn5Ezh8ORdS5kDbM8/JF6GTE8aCvsxfX1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-Proofpoint-ORIG-GUID: a5416AcDqJiB6KYmIFaGrwaPvtrBLUKj
X-Proofpoint-GUID: WdzUALVDaUi6P1KWaXPKw0gd6yMEJk9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 02:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177179

--------------sousiyTxAfIbfRR4K9EJzNXP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31F1k0Sl030256

On 2/14/23 22:30, Martin Jansa wrote:
> Thanks Kai,
>
> this should fix what I've reported in:
> https://lists.openembedded.org/g/openembedded-core/message/176508=20
> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-core/message/176508__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz=
6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_Jtle_DS0$>
>
> once this is merged, can you please add both oe-core changes (3 qemu=20
> patches) to dunfell as well, so that similar patch is included in both=20
> branches? The broken version wasn't merged to dunfell after my report.

You meanCVE-2022-4144.patch and this commit, right? OK, will do.

Regards,
Kai

>
> Regards,
>
> On Tue, Feb 14, 2023 at 3:22 PM Kai Kang <kai.kang@eng.windriver.com>=20
> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com>
>
>     Backport 2 patches and rebase
>     0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to =
fix
>     compile error:
>
>     ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>     ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared
>     (first use in this function); did you mean 'gsize'?
>     =C2=A01477 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qxl_get_check_sl=
ot_offset(qxl, pqxl, &slot,
>     &offset, size)) {
>     =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~=
~
>     =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsi=
ze
>     ../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared
>     identifier is reported only once for each function it appears in
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     ---
>     =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +
>     =C2=A0...ave-qxl_log_command-Return-early-if-.patch |=C2=A0 57 ++++=
+
>     =C2=A0...ass-requested-buffer-size-to-qxl_phy.patch | 217
>     ++++++++++++++++++
>     =C2=A03 files changed, 276 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_co=
mmand-Return-early-if-.patch
>     =C2=A0create mode 100644
>     meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-=
buffer-size-to-qxl_phy.patch
>
>     diff --git a/meta/recipes-devtools/qemu/qemu.inc
>     b/meta/recipes-devtools/qemu/qemu.inc
>     index b68be447f1..5430718f75 100644
>     --- a/meta/recipes-devtools/qemu/qemu.inc
>     +++ b/meta/recipes-devtools/qemu/qemu.inc
>     @@ -93,6 +93,8 @@ SRC_URI =3D
>     "https://download.qemu.org/${BPN}-${PV}.tar.xz
>     <https://urldefense.com/v3/__https://download.qemu.org/$*7BBPN*7D-$=
*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6W=
Uj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_J9O72OyM$>
>     \
>     file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch =
\
>     file://CVE-2022-3165.patch \
>     file://CVE-2022-4144.patch \
>     +
>     file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.pa=
tch
>     \
>     +
>     file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.pa=
tch
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
>     diff --git
>     a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_=
command-Return-early-if-.patch
>     b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_=
command-Return-early-if-.patch
>     new file mode 100644
>     index 0000000000..cd846222c9
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_=
command-Return-early-if-.patch
>     @@ -0,0 +1,57 @@
>     +Upstream-Status: Backport
>     [https://github.com/qemu/qemu/commit/61c34fc
>     <https://urldefense.com/v3/__https://github.com/qemu/qemu/commit/61=
c34fc__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-Ajn=
Ji3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JLSk1OVU$>]
>     +
>     +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     +
>     +From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00
>     2001
>     +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@=
linaro.org>
>     +Date: Mon, 28 Nov 2022 21:27:37 +0100
>     +Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return
>     early if no
>     + log_cmd handler
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +Only 3 command types are logged: no need to call qxl_phys2virt()
>     +for the other types. Using different cases will help to pass
>     +different structure sizes to qxl_phys2virt() in a pair of commits.
>     +
>     +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>     +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>     +Message-Id: <20221128202741.4945-2-philmd@linaro.org>
>     +---
>     + hw/display/qxl-logger.c | 11 +++++++++++
>     + 1 file changed, 11 insertions(+)
>     +
>     +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>     +index 68bfa47568..1bcf803db6 100644
>     +--- a/hw/display/qxl-logger.c
>     ++++ b/hw/display/qxl-logger.c
>     +@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const
>     char *ring, QXLCommandExt *ext)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_name(qxl_type,=
 ext->cmd.type),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compat ? "(compat)=
" : "");
>     +
>     ++=C2=A0 =C2=A0 switch (ext->cmd.type) {
>     ++=C2=A0 =C2=A0 case QXL_CMD_DRAW:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     ++=C2=A0 =C2=A0 case QXL_CMD_SURFACE:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     ++=C2=A0 =C2=A0 case QXL_CMD_CURSOR:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     ++=C2=A0 =C2=A0 default:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     ++=C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0data =3D qxl_phys2virt(qxl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id);
>     +=C2=A0 =C2=A0 =C2=A0if (!data) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const
>     char *ring, QXLCommandExt *ext)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_log_cmd_cursor(qxl, data, ex=
t->group_id);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     +=C2=A0 =C2=A0 =C2=A0}
>     ++out:
>     +=C2=A0 =C2=A0 =C2=A0fprintf(stderr, "\n");
>     +=C2=A0 =C2=A0 =C2=A0return 0;
>     + }
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requeste=
d-buffer-size-to-qxl_phy.patch
>     b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requeste=
d-buffer-size-to-qxl_phy.patch
>     new file mode 100644
>     index 0000000000..ac51cf567a
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requeste=
d-buffer-size-to-qxl_phy.patch
>     @@ -0,0 +1,217 @@
>     +Upstream-Status: Backport
>     [https://github.com/qemu/qemu/commit/8efec0e
>     <https://urldefense.com/v3/__https://github.com/qemu/qemu/commit/8e=
fec0e__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-Ajn=
Ji3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_Jb8ZNv9E$>]
>     +
>     +Backport and rebase patch to fix compile error which imported by
>     CVE-2022-4144.patch:
>     +
>     +../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>     +../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared
>     (first use in this function); did you mean 'gsize'?
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A01477 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (!qxl_get_check_slot_offset(qxl, pqxl,
>     &slot, &offset, size)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsize
>     +../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared
>     identifier is reported only once for each function it appears in
>     +
>     +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     +
>     +From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00
>     2001
>     +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@=
linaro.org>
>     +Date: Mon, 28 Nov 2022 21:27:39 +0100
>     +Subject: [PATCH] hw/display/qxl: Pass requested buffer size to
>     qxl_phys2virt()
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +Currently qxl_phys2virt() doesn't check for buffer overrun.
>     +In order to do so in the next commit, pass the buffer size
>     +as argument.
>     +
>     +For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
>     +verify the size of the chunked data ahead, checking we can
>     +access 'sizeof(QXLCursor) + chunk->data_size' bytes.
>     +Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
>     +assumed to fit in one chunk, no change are required.
>     +In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
>     +qxl_unpack_chunks().
>     +
>     +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>     +Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>     +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>     +Message-Id: <20221128202741.4945-4-philmd@linaro.org>
>     +---
>     + hw/display/qxl-logger.c | 11 ++++++++---
>     + hw/display/qxl-render.c | 20 ++++++++++++++++----
>     + hw/display/qxl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++++-----
>     + hw/display/qxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-
>     + 4 files changed, 35 insertions(+), 13 deletions(-)
>     +
>     +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>     +index 1bcf803..35c38f6 100644
>     +--- a/hw/display/qxl-logger.c
>     ++++ b/hw/display/qxl-logger.c
>     +@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl,
>     QXLPHYSICAL addr, int group_id)
>     +=C2=A0 =C2=A0 =C2=A0QXLImage *image;
>     +=C2=A0 =C2=A0 =C2=A0QXLImageDescriptor *desc;
>     +
>     +-=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id);
>     ++=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id, sizeof=
(QXLImage));
>     +=C2=A0 =C2=A0 =C2=A0if (!image) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl,
>     QXLCursorCmd *cmd, int group_id)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-=
>u.set.position.y,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-=
>u.set.visible ? "yes" : "no",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-=
>u.set.shape);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd->u.=
set.shape, group_id);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd->u.=
set.shape, group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const
>     char *ring, QXLCommandExt *ext)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0bool compat =3D ext->flags & QXL_COMMAND_FLAG_=
COMPAT;
>     +=C2=A0 =C2=A0 =C2=A0void *data;
>     ++=C2=A0 =C2=A0 size_t datasz;
>     +=C2=A0 =C2=A0 =C2=A0int ret;
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (!qxl->cmdlog) {
>     +@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl,
>     const char *ring, QXLCommandExt *ext)
>     +
>     +=C2=A0 =C2=A0 =C2=A0switch (ext->cmd.type) {
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CMD_DRAW:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D compat ? sizeof(QXLCompatD=
rawable) :
>     sizeof(QXLDrawable);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLSurfaceCmd);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLCursorCmd);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     +=C2=A0 =C2=A0 =C2=A0default:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +-=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id);
>     ++=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id, datasz);
>     +=C2=A0 =C2=A0 =C2=A0if (!data) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
>     +index ca21700..fcfd40c 100644
>     +--- a/hw/display/qxl-render.c
>     ++++ b/hw/display/qxl-render.c
>     +@@ -107,7 +107,9 @@ static void
>     qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl->guest_primary.resized =3D 0=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl->guest_primary.data
>     <https://urldefense.com/v3/__http://guest_primary.data__;!!AjveYdw8=
EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKt=
ZqepurDo5Y_Ps_JH1i2mLw$>
>     =3D qxl_phys2virt(qxl,
>     + =C2=A0qxl->guest_primary.surface.mem,
>     +- MEMSLOT_GROUP_GUEST);
>     ++ MEMSLOT_GROUP_GUEST,
>     ++ qxl->guest_primary.abs_stride
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * height);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qxl->guest_primary.data
>     <https://urldefense.com/v3/__http://guest_primary.data__;!!AjveYdw8=
EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKt=
ZqepurDo5Y_Ps_JH1i2mLw$>)
>     {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest,
>     size_t size, PCIQXLDevice *qxl,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (offset =3D=3D size) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk->n=
ext_chunk, group_id);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk->n=
ext_chunk, group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(QXLDataChunk) +
>     chunk->data_size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chunk) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +@@ -295,7 +298,8 @@ fail:
>     + /* called from spice server thread context only */
>     + int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>     + {
>     +-=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.d=
ata
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id);
>     ++=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.d=
ata
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof=
(QXLCursorCmd));
>     +=C2=A0 =C2=A0 =C2=A0QXLCursor *cursor;
>     +=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;
>     +
>     +@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl,
>     QXLCommandExt *ext)
>     +=C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0switch (cmd->type) {
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CURSOR_SET:
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd->u.=
set.shape,
>     ext->group_id);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* First read the QXLCursor to get
>     QXLDataChunk::data_size ... */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd->u.=
set.shape, ext->group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cursor) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Then read including the chunked da=
ta following
>     QXLCursor. */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd->u.=
set.shape, ext->group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor) +
>     cursor->chunk.data_size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>     +index ae8aa07..2a4b2d4 100644
>     +--- a/hw/display/qxl.c
>     ++++ b/hw/display/qxl.c
>     +@@ -274,7 +274,8 @@ static void
>     qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
>     + =C2=A0QXL_IO_MONITORS_CONFIG_ASYNC));
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_conf=
ig,
>     MEMSLOT_GROUP_GUEST);
>     ++=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_conf=
ig,
>     MEMSLOT_GROUP_GUEST,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sizeof(QXLMonitorsConfig));
>     +=C2=A0 =C2=A0 =C2=A0if (cfg !=3D NULL && cfg->count =3D=3D 1) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl->guest_primary.resized =3D 1=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl->guest_head0_width=C2=A0 =3D=
 cfg->heads[0].width;
>     +@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice
>     *qxl, struct QXLCommandExt *ext)
>     +=C2=A0 =C2=A0 =C2=A0switch (le32_to_cpu(ext->cmd.type)) {
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:
>     +=C2=A0 =C2=A0 =C2=A0{
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(=
qxl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(=
qxl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id,
>     ++ =C2=A0sizeof(QXLSurfaceCmd));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice
>     *qxl, struct QXLCommandExt *ext)
>     +=C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:
>     +=C2=A0 =C2=A0 =C2=A0{
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(q=
xl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(q=
xl, ext->cmd.data
>     <https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ7=
9tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y=
_Ps_JjVH9YmU$>,
>     ext->group_id,
>     ++ sizeof(QXLCursorCmd));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     +@@ -1463,7 +1466,8 @@ static bool
>     qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>     + }
>     +
>     + /* can be also called from spice server thread context */
>     +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int
>     group_id)
>     ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int
>     group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t size)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0uint64_t offset;
>     +=C2=A0 =C2=A0 =C2=A0uint32_t slot;
>     +@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice
>     *qxl)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D qxl_phys2virt(qxl, qxl->=
guest_surfaces.cmds[i],
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST,
>     sizeof(QXLSurfaceCmd));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd->type =3D=3D QXL_SURF=
ACE_CMD_CREATE);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_dirty_one_surface(qxl, cmd->=
u.surface_create.data
>     <https://urldefense.com/v3/__http://u.surface_create.data__;!!AjveY=
dw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8=
oKtZqepurDo5Y_Ps_JpzZXWE4$>,
>     +diff --git a/hw/display/qxl.h b/hw/display/qxl.h
>     +index 30d21f4..4551c23 100644
>     +--- a/hw/display/qxl.h
>     ++++ b/hw/display/qxl.h
>     +@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_Q=
XL)
>     + #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
>     +
>     + /* qxl.c */
>     +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int
>     group_id);
>     ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int
>     group_id,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t size);
>     + void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>     +=C2=A0 =C2=A0 =C2=A0GCC_FMT_ATTR(2, 3);
>     +
>     +--
>     +2.34.1
>     +
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#177149):
>     https://lists.openembedded.org/g/openembedded-core/message/177149
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/177149__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5R=
pNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_J0CBMJoA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/96960641/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9696=
0641/3617156__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3l=
vkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JDhE2Swc$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-=
QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_J6OiSVjs$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------sousiyTxAfIbfRR4K9EJzNXP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31F1k0Sl030256

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/14/23 22:30, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7v3SCti7VASE80CcsPaObRk=
+FXckC5NcVYsrSh5cfCQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">Thanks Kai,
        <div><br>
        </div>
        <div>this should fix what I've reported in:</div>
        <div><a href=3D"https://urldefense.com/v3/__https://lists.openemb=
edded.org/g/openembedded-core/message/176508__;!!AjveYdw8EvQ!al_cQ79tsJXO=
pOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_Jt=
le_DS0$" moz-do-not-send=3D"true">https://lists.openembedded.org/g/openem=
bedded-core/message/176508</a><br>
        </div>
        <div><br>
        </div>
        <div>once this is merged, can you please add both oe-core
          changes (3 qemu patches) to dunfell as well, so that similar
          patch is included in both branches? The broken version wasn't
          merged to dunfell after my report.</div>
      </div>
    </blockquote>
    <p>You mean<a class=3D"moz-txt-link-freetext"> CVE-2022-4144.patch an=
d
        this commit, right? OK, will do.</a></p>
    <p><a class=3D"moz-txt-link-freetext">Regards,<br>
        Kai<br>
      </a></p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7v3SCti7VASE80CcsPaObRk=
+FXckC5NcVYsrSh5cfCQ@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 3:2=
2
          PM Kai Kang &lt;<a href=3D"mailto:kai.kang@eng.windriver.com" m=
oz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.kang@eng.wind=
river.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.kan=
g@windriver.com</a>&gt;<br>
          <br>
          Backport 2 patches and rebase<br>
0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix<br=
>
          compile error:<br>
          <br>
          ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':<br=
>
          ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size'
          undeclared (first use in this function); did you mean 'gsize'?<=
br>
          &nbsp;1477 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!qxl_get_chec=
k_slot_offset(qxl, pqxl,
          &amp;slot, &amp;offset, size)) {<br>
          &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~<br>
          &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gsize<br>
          ../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared
          identifier is reported only once for each function it appears
          in<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;meta/recipes-devtools/qemu/qemu.inc&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2 +<br>
          &nbsp;...ave-qxl_log_command-Return-early-if-.patch |&nbsp; 57 =
+++++<br>
          &nbsp;...ass-requested-buffer-size-to-qxl_phy.patch | 217
          ++++++++++++++++++<br>
          &nbsp;3 files changed, 276 insertions(+)<br>
          &nbsp;create mode 100644
meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-=
Return-early-if-.patch<br>
          &nbsp;create mode 100644
meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer=
-size-to-qxl_phy.patch<br>
          <br>
          diff --git a/meta/recipes-devtools/qemu/qemu.inc
          b/meta/recipes-devtools/qemu/qemu.inc<br>
          index b68be447f1..5430718f75 100644<br>
          --- a/meta/recipes-devtools/qemu/qemu.inc<br>
          +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
          @@ -93,6 +93,8 @@ SRC_URI =3D &quot;<a href=3D"https://urldefen=
se.com/v3/__https://download.qemu.org/$*7BBPN*7D-$*7BPV*7D.tar.xz__;JSUlJ=
Q!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrR=
lQu3a9O8oKtZqepurDo5Y_Ps_J9O72OyM$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">https://download.qemu.org/${BPN}-${PV}.tar.xz</a=
>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0021-target-p=
pc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch">file://0021-target-ppc-im=
plement-xs-n-maddqp-o-xs-n-msubqp-o.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://CVE-2022-3165.patch">file://CVE-2022-3165.pa=
tch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-l=
ink-freetext" href=3D"file://CVE-2022-4144.patch">file://CVE-2022-4144.pa=
tch</a> \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-hw=
-display-qxl-Have-qxl_log_command-Return-early-if-.patch">file://0001-hw-=
display-qxl-Have-qxl_log_command-Return-early-if-.patch</a>
          \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-hw=
-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch">file://0001-hw-=
display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          &nbsp;UPSTREAM_CHECK_REGEX =3D
          &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;<br>
          <br>
          diff --git
a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch
b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch<br>
          new file mode 100644<br>
          index 0000000000..cd846222c9<br>
          --- /dev/null<br>
          +++
b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch<br>
          @@ -0,0 +1,57 @@<br>
          +Upstream-Status: Backport [<a href=3D"https://urldefense.com/v=
3/__https://github.com/qemu/qemu/commit/61c34fc__;!!AjveYdw8EvQ!al_cQ79ts=
JXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps=
_JLSk1OVU$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/qemu/qemu/commit/61c34fc</a>]<br>
          +<br>
          +Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">kai.kang@windriver.com</a>&gt;<br>
          +<br>
          +From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17
          00:00:00 2001<br>
          +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;=
<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">philmd@linaro.org</a>&gt;<br>
          +Date: Mon, 28 Nov 2022 21:27:37 +0100<br>
          +Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return
          early if no<br>
          + log_cmd handler<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Only 3 command types are logged: no need to call
          qxl_phys2virt()<br>
          +for the other types. Using different cases will help to pass<b=
r>
          +different structure sizes to qxl_phys2virt() in a pair of
          commits.<br>
          +<br>
          +Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marc=
andre.lureau@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">marcandre.lureau@redhat.com</a>&gt;<br>
          +Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:philmd@linaro.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">philmd@linaro.org</a>&gt;<br>
          +Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@=
redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">stefanha@redhat.com</a>&gt;<br>
          +Message-Id: &lt;<a href=3D"mailto:20221128202741.4945-2-philmd=
@linaro.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">20221128202741.4945-2-philmd@linaro.org</a>&gt;<br>
          +---<br>
          + hw/display/qxl-logger.c | 11 +++++++++++<br>
          + 1 file changed, 11 insertions(+)<br>
          +<br>
          +diff --git a/hw/display/qxl-logger.c
          b/hw/display/qxl-logger.c<br>
          +index 68bfa47568..1bcf803db6 100644<br>
          +--- a/hw/display/qxl-logger.c<br>
          ++++ b/hw/display/qxl-logger.c<br>
          +@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl,
          const char *ring, QXLCommandExt *ext)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl_name(qxl_t=
ype, ext-&gt;cmd.type),<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;compat ? &quot=
;(compat)&quot; : &quot;&quot;);<br>
          + <br>
          ++&nbsp; &nbsp; switch (ext-&gt;cmd.type) {<br>
          ++&nbsp; &nbsp; case QXL_CMD_DRAW:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
          ++&nbsp; &nbsp; case QXL_CMD_SURFACE:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
          ++&nbsp; &nbsp; case QXL_CMD_CURSOR:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
          ++&nbsp; &nbsp; default:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; goto out;<br>
          ++&nbsp; &nbsp; }<br>
          +&nbsp; &nbsp; &nbsp;data =3D qxl_phys2virt(qxl, ext-&gt;<a hre=
f=3D"https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ79t=
sJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_P=
s_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>, ext-&gt;group_id);<br=
>
          +&nbsp; &nbsp; &nbsp;if (!data) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl,
          const char *ring, QXLCommandExt *ext)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl_log_cmd_cursor(qxl, data=
, ext-&gt;group_id);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          ++out:<br>
          +&nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;\n&quot;);<br>
          +&nbsp; &nbsp; &nbsp;return 0;<br>
          + }<br>
          +-- <br>
          +2.34.1<br>
          +<br>
          diff --git
a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch
b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch<br>
          new file mode 100644<br>
          index 0000000000..ac51cf567a<br>
          --- /dev/null<br>
          +++
b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch<br>
          @@ -0,0 +1,217 @@<br>
          +Upstream-Status: Backport [<a href=3D"https://urldefense.com/v=
3/__https://github.com/qemu/qemu/commit/8efec0e__;!!AjveYdw8EvQ!al_cQ79ts=
JXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps=
_Jb8ZNv9E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/qemu/qemu/commit/8efec0e</a>]<br>
          +<br>
          +Backport and rebase patch to fix compile error which imported
          by CVE-2022-4144.patch:<br>
          +<br>
          +../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':<b=
r>
          +../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size'
          undeclared (first use in this function); did you mean 'gsize'?<=
br>
          +&nbsp; &nbsp; &nbsp; &nbsp;1477 |&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (!qxl_get_check_slot_offset(qxl,
          pqxl, &amp;slot, &amp;offset, size)) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;^~~~<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;gsize<br>
          +../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared
          identifier is reported only once for each function it appears
          in<br>
          +<br>
          +Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">kai.kang@windriver.com</a>&gt;<br>
          +<br>
          +From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17
          00:00:00 2001<br>
          +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;=
<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">philmd@linaro.org</a>&gt;<br>
          +Date: Mon, 28 Nov 2022 21:27:39 +0100<br>
          +Subject: [PATCH] hw/display/qxl: Pass requested buffer size
          to qxl_phys2virt()<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Currently qxl_phys2virt() doesn't check for buffer overrun.<br=
>
          +In order to do so in the next commit, pass the buffer size<br>
          +as argument.<br>
          +<br>
          +For QXLCursor in qxl_render_cursor() -&gt; qxl_cursor() we<br>
          +verify the size of the chunked data ahead, checking we can<br>
          +access 'sizeof(QXLCursor) + chunk-&gt;data_size' bytes.<br>
          +Since in the SPICE_CURSOR_TYPE_MONO case the cursor is<br>
          +assumed to fit in one chunk, no change are required.<br>
          +In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in<br>
          +qxl_unpack_chunks().<br>
          +<br>
          +Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:philmd@linaro.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">philmd@linaro.org</a>&gt;<br>
          +Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.co=
m" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freet=
ext">kraxel@redhat.com</a>&gt;<br>
          +Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@=
redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">stefanha@redhat.com</a>&gt;<br>
          +Message-Id: &lt;<a href=3D"mailto:20221128202741.4945-4-philmd=
@linaro.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">20221128202741.4945-4-philmd@linaro.org</a>&gt;<br>
          +---<br>
          + hw/display/qxl-logger.c | 11 ++++++++---<br>
          + hw/display/qxl-render.c | 20 ++++++++++++++++----<br>
          + hw/display/qxl.c&nbsp; &nbsp; &nbsp; &nbsp; | 14 +++++++++---=
--<br>
          + hw/display/qxl.h&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++-<br>
          + 4 files changed, 35 insertions(+), 13 deletions(-)<br>
          +<br>
          +diff --git a/hw/display/qxl-logger.c
          b/hw/display/qxl-logger.c<br>
          +index 1bcf803..35c38f6 100644<br>
          +--- a/hw/display/qxl-logger.c<br>
          ++++ b/hw/display/qxl-logger.c<br>
          +@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice
          *qxl, QXLPHYSICAL addr, int group_id)<br>
          +&nbsp; &nbsp; &nbsp;QXLImage *image;<br>
          +&nbsp; &nbsp; &nbsp;QXLImageDescriptor *desc;<br>
          + <br>
          +-&nbsp; &nbsp; image =3D qxl_phys2virt(qxl, addr, group_id);<b=
r>
          ++&nbsp; &nbsp; image =3D qxl_phys2virt(qxl, addr, group_id,
          sizeof(QXLImage));<br>
          +&nbsp; &nbsp; &nbsp;if (!image) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          +@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl,
          QXLCursorCmd *cmd, int group_id)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
cmd-&gt;u.set.position.y,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
cmd-&gt;u.set.visible ? &quot;yes&quot; : &quot;no&quot;,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
cmd-&gt;u.set.shape);<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; cursor =3D qxl_phys2virt(qxl, cmd=
-&gt;u.set.shape,
          group_id);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; cursor =3D qxl_phys2virt(qxl, cmd=
-&gt;u.set.shape,
          group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(QXLCursor));<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!cursor) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          +@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl,
          const char *ring, QXLCommandExt *ext)<br>
          + {<br>
          +&nbsp; &nbsp; &nbsp;bool compat =3D ext-&gt;flags &amp;
          QXL_COMMAND_FLAG_COMPAT;<br>
          +&nbsp; &nbsp; &nbsp;void *data;<br>
          ++&nbsp; &nbsp; size_t datasz;<br>
          +&nbsp; &nbsp; &nbsp;int ret;<br>
          + <br>
          +&nbsp; &nbsp; &nbsp;if (!qxl-&gt;cmdlog) {<br>
          +@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl,
          const char *ring, QXLCommandExt *ext)<br>
          + <br>
          +&nbsp; &nbsp; &nbsp;switch (ext-&gt;cmd.type) {<br>
          +&nbsp; &nbsp; &nbsp;case QXL_CMD_DRAW:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; datasz =3D compat ? sizeof(QXLCom=
patDrawable) :
          sizeof(QXLDrawable);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          +&nbsp; &nbsp; &nbsp;case QXL_CMD_SURFACE:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; datasz =3D sizeof(QXLSurfaceCmd);=
<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          +&nbsp; &nbsp; &nbsp;case QXL_CMD_CURSOR:<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; datasz =3D sizeof(QXLCursorCmd);<=
br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
          +&nbsp; &nbsp; &nbsp;default:<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          +-&nbsp; &nbsp; data =3D qxl_phys2virt(qxl, ext-&gt;<a href=3D"=
https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ79tsJXOp=
OtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JjV=
H9YmU$" moz-do-not-send=3D"true">cmd.data</a>, ext-&gt;group_id);<br>
          ++&nbsp; &nbsp; data =3D qxl_phys2virt(qxl, ext-&gt;<a href=3D"=
https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!al_cQ79tsJXOp=
OtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JjV=
H9YmU$" moz-do-not-send=3D"true">cmd.data</a>, ext-&gt;group_id,
          datasz);<br>
          +&nbsp; &nbsp; &nbsp;if (!data) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          +diff --git a/hw/display/qxl-render.c
          b/hw/display/qxl-render.c<br>
          +index ca21700..fcfd40c 100644<br>
          +--- a/hw/display/qxl-render.c<br>
          ++++ b/hw/display/qxl-render.c<br>
          +@@ -107,7 +107,9 @@ static void
          qxl_render_update_area_unlocked(PCIQXLDevice *qxl)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl-&gt;guest_primary.resize=
d =3D 0;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl-&gt;<a href=3D"https://u=
rldefense.com/v3/__http://guest_primary.data__;!!AjveYdw8EvQ!al_cQ79tsJXO=
pOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JH=
1i2mLw$" moz-do-not-send=3D"true">guest_primary.data</a> =3D
          qxl_phys2virt(qxl,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;qxl-&gt;guest_primary.surface.mem,<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          MEMSLOT_GROUP_GUEST);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          MEMSLOT_GROUP_GUEST,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          qxl-&gt;guest_primary.abs_stride<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * height);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!qxl-&gt;<a href=3D"http=
s://urldefense.com/v3/__http://guest_primary.data__;!!AjveYdw8EvQ!al_cQ79=
tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_=
Ps_JH1i2mLw$" moz-do-not-send=3D"true">guest_primary.data</a>) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto end;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          +@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest,
          size_t size, PCIQXLDevice *qxl,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (offset =3D=3D size) {<br=
>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; chunk =3D qxl_phys2virt(qxl, chun=
k-&gt;next_chunk,
          group_id);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; chunk =3D qxl_phys2virt(qxl, chun=
k-&gt;next_chunk,
          group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeof(QXLDataChunk) +
          chunk-&gt;data_size);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!chunk) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          +@@ -295,7 +298,8 @@ fail:<br>
          + /* called from spice server thread context only */<br>
          + int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)<=
br>
          + {<br>
          +-&nbsp; &nbsp; QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&g=
t;<a href=3D"https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!=
al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqep=
urDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>, ext-&gt;group=
_id);<br>
          ++&nbsp; &nbsp; QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&g=
t;<a href=3D"https://urldefense.com/v3/__http://cmd.data__;!!AjveYdw8EvQ!=
al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqep=
urDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>, ext-&gt;group=
_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s=
izeof(QXLCursorCmd));<br>
          +&nbsp; &nbsp; &nbsp;QXLCursor *cursor;<br>
          +&nbsp; &nbsp; &nbsp;QEMUCursor *c;<br>
          + <br>
          +@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl,
          QXLCommandExt *ext)<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          +&nbsp; &nbsp; &nbsp;switch (cmd-&gt;type) {<br>
          +&nbsp; &nbsp; &nbsp;case QXL_CURSOR_SET:<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; cursor =3D qxl_phys2virt(qxl, cmd=
-&gt;u.set.shape,
          ext-&gt;group_id);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; /* First read the QXLCursor to ge=
t
          QXLDataChunk::data_size ... */<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; cursor =3D qxl_phys2virt(qxl, cmd=
-&gt;u.set.shape,
          ext-&gt;group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(QXLCursor));<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; if (!cursor) {<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 1;<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; }<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; /* Then read including the chunke=
d data following
          QXLCursor. */<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; cursor =3D qxl_phys2virt(qxl, cmd=
-&gt;u.set.shape,
          ext-&gt;group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sizeof(QXLCursor) +
          cursor-&gt;chunk.data_size);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!cursor) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          +diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
          +index ae8aa07..2a4b2d4 100644<br>
          +--- a/hw/display/qxl.c<br>
          ++++ b/hw/display/qxl.c<br>
          +@@ -274,7 +274,8 @@ static void
          qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)<=
br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
          &nbsp;QXL_IO_MONITORS_CONFIG_ASYNC));<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          + <br>
          +-&nbsp; &nbsp; cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monito=
rs_config,
          MEMSLOT_GROUP_GUEST);<br>
          ++&nbsp; &nbsp; cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monito=
rs_config,
          MEMSLOT_GROUP_GUEST,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; sizeof(QXLMonitorsConfig));<br>
          +&nbsp; &nbsp; &nbsp;if (cfg !=3D NULL &amp;&amp; cfg-&gt;count=
 =3D=3D 1) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl-&gt;guest_primary.resize=
d =3D 1;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl-&gt;guest_head0_width&nb=
sp; =3D cfg-&gt;heads[0].width;<br>
          +@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice
          *qxl, struct QXLCommandExt *ext)<br>
          +&nbsp; &nbsp; &nbsp;switch (le32_to_cpu(ext-&gt;cmd.type)) {<b=
r>
          +&nbsp; &nbsp; &nbsp;case QXL_CMD_SURFACE:<br>
          +&nbsp; &nbsp; &nbsp;{<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; QXLSurfaceCmd *cmd =3D qxl_phys2v=
irt(qxl, ext-&gt;<a href=3D"https://urldefense.com/v3/__http://cmd.data__=
;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrR=
lQu3a9O8oKtZqepurDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>=
, ext-&gt;group_id);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; QXLSurfaceCmd *cmd =3D qxl_phys2v=
irt(qxl, ext-&gt;<a href=3D"https://urldefense.com/v3/__http://cmd.data__=
;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrR=
lQu3a9O8oKtZqepurDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>=
, ext-&gt;group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
          &nbsp;sizeof(QXLSurfaceCmd));<br>
          + <br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!cmd) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice
          *qxl, struct QXLCommandExt *ext)<br>
          +&nbsp; &nbsp; &nbsp;}<br>
          +&nbsp; &nbsp; &nbsp;case QXL_CMD_CURSOR:<br>
          +&nbsp; &nbsp; &nbsp;{<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; QXLCursorCmd *cmd =3D qxl_phys2vi=
rt(qxl, ext-&gt;<a href=3D"https://urldefense.com/v3/__http://cmd.data__;=
!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRl=
Qu3a9O8oKtZqepurDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>,=
 ext-&gt;group_id);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; QXLCursorCmd *cmd =3D qxl_phys2vi=
rt(qxl, ext-&gt;<a href=3D"https://urldefense.com/v3/__http://cmd.data__;=
!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRl=
Qu3a9O8oKtZqepurDo5Y_Ps_JjVH9YmU$" moz-do-not-send=3D"true">cmd.data</a>,=
 ext-&gt;group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
          sizeof(QXLCursorCmd));<br>
          + <br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!cmd) {<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>
          +@@ -1463,7 +1466,8 @@ static bool
          qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,<=
br>
          + }<br>
          + <br>
          + /* can be also called from spice server thread context */<br>
          +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int
          group_id)<br>
          ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int
          group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; size_t size)<br>
          + {<br>
          +&nbsp; &nbsp; &nbsp;uint64_t offset;<br>
          +&nbsp; &nbsp; &nbsp;uint32_t slot;<br>
          +@@ -1971,7 +1975,7 @@ static void
          qxl_dirty_surfaces(PCIQXLDevice *qxl)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          + <br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cmd =3D qxl_phys2virt(qxl,
          qxl-&gt;guest_surfaces.cmds[i],<br>
          +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMSLOT_GROUP_GUEST);<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMSLOT_GROUP_GUEST,
          sizeof(QXLSurfaceCmd));<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;assert(cmd);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;assert(cmd-&gt;type =3D=3D Q=
XL_SURFACE_CMD_CREATE);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl_dirty_one_surface(qxl, c=
md-&gt;<a href=3D"https://urldefense.com/v3/__http://u.surface_create.dat=
a__;!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3p=
BrRlQu3a9O8oKtZqepurDo5Y_Ps_JpzZXWE4$" moz-do-not-send=3D"true">u.surface=
_create.data</a>,<br>
          +diff --git a/hw/display/qxl.h b/hw/display/qxl.h<br>
          +index 30d21f4..4551c23 100644<br>
          +--- a/hw/display/qxl.h<br>
          ++++ b/hw/display/qxl.h<br>
          +@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice,
          PCI_QXL)<br>
          + #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)<br=
>
          + <br>
          + /* qxl.c */<br>
          +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int
          group_id);<br>
          ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int
          group_id,<br>
          ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; size_t size);<br>
          + void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg,
          ...)<br>
          +&nbsp; &nbsp; &nbsp;GCC_FMT_ATTR(2, 3);<br>
          + <br>
          +-- <br>
          +2.34.1<br>
          +<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#177149): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-core/message/177149__;=
!!AjveYdw8EvQ!al_cQ79tsJXOpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRl=
Qu3a9O8oKtZqepurDo5Y_Ps_J0CBMJoA$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-cor=
e/message/177149</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/96960641/3617156__;!!AjveYdw8EvQ!al_cQ79tsJXOp=
OtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_JDh=
E2Swc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/mt/96960641/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedded=
-core+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!al_cQ79tsJX=
OpOtcoXP7OEYC9Of5RpNhz6WUj-QJuQ3lvkq-AjnJi3pBrRlQu3a9O8oKtZqepurDo5Y_Ps_J=
6OiSVjs$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://lists.openembedded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gmail=
.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------sousiyTxAfIbfRR4K9EJzNXP--

