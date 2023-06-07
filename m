Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5118C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 03:09:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.351.1686107370491597334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 20:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fmZcKOY3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55224a7685=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35730HYe024101
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 20:09:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=wwYdQq5gtvs1hu/Qcp8ifoMFyQ3Ot9jIsdRZ1PGwIEQ=;
 b=fmZcKOY3q6nZAHQRTSRw2JmOL3aduCwtCBNpauTayvbvp2Zo0OZl6Xv2nfa01CaaSnh3
 qXDj544KK3F8p+cp6EzbQHpFCzulcvObBhTb1hWDCEXz9RDuwTE+r1Kw7rV2vb8cAPun
 +xbkOJTywlthkw4sQLm/e9/kTKCiYV0A8jxvA/xmg9L7iMZLBMv0AQ53dxgjnGDoHnIH
 EwazDf3HQbZHsD7EsocWoFVTFFHIVolxN4FzH6L9Xp3rbClNz3S84Yq1aT4vXRRNf8DT
 5rlJnxdJSCovmx3mgMahfW0LpCkXy4iH//1GQOYRuLaIYqpwMU+wVOg3vzksXtlm/wdI Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2a80r9v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 20:09:29 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35739Tou009268
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 20:09:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2a80r9v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 20:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7OLvBF19WBS0dA8L2GYmQs1oCJ6DjWlvGCdHS/9Ue9ujHvIdgpACLrc1ShkHFGpbhF8MZgoEZRpc4gOmHoFgNOYbj3WQRrjAi+xVRZ5MCq482T41Sg87kLQdJyLfhNjx9zTqqk4mf+7FadSI8O2U19Ntwnprl/dx/RiV3/ku+EAgQ3+r5od0YeIa0vclK/wuFb5ctkbNUIrPnuxteUBPuK2IjoOOiDMvxgLI/lq/WPVUpcJwi/oS5/hmw2UBWP8UW7+kVsVuu1/RB0ibV1qVq+VQReEjq1akvLdnStXqNSFDOt3YPIJAhCjzAqkw+1qvd/YkoNFa3jTgEMdHbYJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwYdQq5gtvs1hu/Qcp8ifoMFyQ3Ot9jIsdRZ1PGwIEQ=;
 b=RoBD0ObCYx1z0/CVKdY4E0OW3lS5hwI9SWApnqLk4ekTFG6M46sCyV4fN2onuMNd1zHxNx/lzrQyC8W0jQpZzgU7ZrIS1WuzeL2ah7Ht2cJPAQDoqghkwYvZdd6tomOwOhvGTsfHTJ1Zy7pVKNJomanNC8Ceu3uQqSEacaz1L8WGZuscN0sOVbDeqN61Lyib+883i1fSA3LdSYiLCs9Xb0Wc1vauGzhkvL29f2joPXqu6Id8HPLFtXTKku7IIeoQSeljIim0ez/i1FXCULiGRbXXuiN0nEOgCmY8kZOuiS49wMzEeS8qkYYnKkqsDo0i7u6H/EC0+1Ox7aBhn7DYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 03:09:15 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431%7]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 03:09:14 +0000
Message-ID: <50c86734-7c3d-5d99-9a64-1a1c89498c3d@windriver.com>
Date: Wed, 7 Jun 2023 11:09:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] qemu: Split the qemu package
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <CADkTA4NXhx1h5znY-Ayemm1BAnpuMeFV+GO5v1b56Gv1JmR9Qg@mail.gmail.com>
 <20230602023657.309867-1-mingli.yu@eng.windriver.com>
 <CADkTA4P19O3EHGZpSPBaTKjQXpWuV8hF1T-pWiKzuNiVgnc5eA@mail.gmail.com>
 <35cfabc97e3639a0722f477949ee42bc3e259998.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <35cfabc97e3639a0722f477949ee42bc3e259998.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: ea06b2cd-168f-4e0a-8175-08db670492e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GgP+sVnhXQiDpDzc+qsOdjNVQwUWmwjE1v+eJRVp7LhHfGisTzI4WX/uvQIfwutT4e6W+X6Bi321Yz6cavQFnk+UClLBPv82JtObp2qTK4xWMJUdis3CJaZrt+97XSJOSuqzZpJefM/QMQthbh7D0BpUwpYYaOIOq19xTiT0s9AusElvBcq21944DPthnKiXk4PfTsBFs8aysuFknHkqqBV7yE2i11l41JYnSlMLNRh4bvIm+Ptk+P05Yvy/9Difo5iNwAkMT8PobhJwR0s8aVTD8k0+MXzhi4uwq/BhN9zogUUYS/dt2QPId5MWtgieSA8r6v1HwGOCbclVdlFSzo6EzDbmx+r+u6jZMbV1i+pUdkmQumNzjyY9PD5SFiXkYmVg2H8V4X6xZ8AEXYhdEms3Lst8LrXMI76nhF/HaTDx3h4CY58/FnU0w/NwzRyIJXW+LHA91jUqXNcbQe59J4f+UMiyNiSFoZratmTPSglgMOBt1e7Q44+NmoVwEFnl5AmJh0k3Tqzh5855ZL6DbLkO2ZRdl/ux7KBguga+QzXnpGfTyEaz3fnkrWhWUmwDJfkzPorQVViU2JgYW/tJPnz8u4qoKGs82WhPYGzz1/ybBhy+jd/bzh7iar/cea85CKjPjkJ6qQCrGGS9NeY8/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(451199021)(6486002)(66946007)(110136005)(186003)(478600001)(8936002)(8676002)(38100700002)(316002)(66476007)(4326008)(66556008)(2616005)(41300700001)(6666004)(83380400001)(26005)(53546011)(6512007)(6506007)(31696002)(86362001)(5660300002)(2906002)(36756003)(66899021)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnptSlVlNkRqaWdNc2ZkNEpkcjdZdHZtOHdrR1RqWHZMNkVjck1EczNrZ0J6?=
 =?utf-8?B?SzFMSWpuU1BLbDVQRlpFanc3YkRDY1c0eVBkU2Vnb2RPQkJ0ajZLWjJsTDJB?=
 =?utf-8?B?TGtSMlRuU1dtYTlDNDFLSFd3N2pHNWgvU2RKS3lEUnpBRW92WVJ3K2FxdHFn?=
 =?utf-8?B?WENUam56WmVGcEExRU9ZV1hjSmh4czlwUUY4bFdDT1d0TVlJZ3c2Wm9zMGk4?=
 =?utf-8?B?VWlRMkJHWkVUVE91REdDN0Qrek1PbWtkWmlwU0dCcFZCUkpiL2xXbTlqTE9B?=
 =?utf-8?B?b29GaGl1SkZSVnhsZ0p6cXBuOFRCaytwUGg3OHNDZjQwaWxURlduS3V2RDdk?=
 =?utf-8?B?Tms5T3M3SWxJdHJ6T3Rsdko4RDVwOUVGWnpPTGVKKzd6SkdDekVMSHI4ZXdl?=
 =?utf-8?B?WDhxVjlWS1RuM3lGcG8vSlU2aGRHejdFQWtlTHNyaWpFaVRWYmFIRjdSdFpk?=
 =?utf-8?B?KzlVcUNydkQ2cHFGeEFGT0xWQWxqc3QrVTV6VFFVUzR4MENFZDFGWnAxTlBP?=
 =?utf-8?B?OU1oZktZK3Y3MHovK21OVTBrYXBXOHFnbkpWSDlyMmIwRkszMTJKZXZhaGp3?=
 =?utf-8?B?RTM5OFRSRnZPUGI4S3pmM2F4eXlIR0hJUDNIeEk2eVZEdllvTTUxUmRFVGxS?=
 =?utf-8?B?SmVsbnUvTGppaGpHN0dObTNRbGN2SHNkc1JBQk5HN0lLZTg2bTZyK3Rta0hX?=
 =?utf-8?B?VlM3MXV0YzFnVXkyMmJkTGJaVVVXUlpldjZZNzVUNVRyeTczL3NVOEJDWm5I?=
 =?utf-8?B?SkJyYlc0QWtYYzJJZHhqeVpPVGlaNkhSSHpyQkY2Ynp2SytDTDVQUU1pc0l1?=
 =?utf-8?B?TjhHLzdPc1JYbzVYS3RGWGsvS3dXZkVyNjZ6cmdleWI5RFpCVW9abmpJdkdK?=
 =?utf-8?B?VE9xaVoxK2JvWWxsbFREekJKSW83NklhYnp2cytMMWlDcWNVNDVMYmQydXVj?=
 =?utf-8?B?RUkydDF1U0E5VWtsVzFtN2VsOUpJNU9VQXdjZS9rWDhhV3RZQmQ4d1pwVTV2?=
 =?utf-8?B?b1lpT0J3MlJHN0pPcTBKTkc1RnZ6ZkQvMjI3L3Rqdmd0MCtMTWFpdEljU09D?=
 =?utf-8?B?V1NXTVZDem5SY2xqLzNVTDM1Zk93NDQyOXQvTnhXZEg1UHREVHlob2hyRElx?=
 =?utf-8?B?N2hKcmNkVm9KUGViTlFXUW9XdVllMGJLYTVlQmNPdjFqVmZ6RVJCUDFNeDZm?=
 =?utf-8?B?NmJnYUsxNnBQalZxM0JPUHMwR2ZoRlJQa3d6b1NpL1J3ZGZpK0l3VzNRUG1s?=
 =?utf-8?B?VVV6aUsvOVIyZk10ajFKcUtTdUl3UWVVRWVxOVBmOGNwSjNkem1OSmQxSEhJ?=
 =?utf-8?B?RkxmR0xrNXp0VkUxY0YrdXZQSVRTc3BhamJwNFhyVWJsem1oa0Zvdy94ekJM?=
 =?utf-8?B?ZjA4bjVGY0k3NWllTlB1VEk3eUk4VzVidUl6WHNQOXJ3dnkwOHpaQmNOWFA2?=
 =?utf-8?B?UWlXSWJuQTRPVmMwNWV6TSttWTRuaGNTT2k5ZExtL3JHbWtEOXlTQ2dleW9Q?=
 =?utf-8?B?VDhmVCttTVRsK2xDSTl6cis5ZFI1TkJzbnhheTN2YlZQaUQyemZ0V3FDNXRt?=
 =?utf-8?B?ZkdubzMwUTZkbjVxL0FsTmFSSTB0U3hQOWJpamJSTVBNUzVCaHF3b0VoWGVa?=
 =?utf-8?B?ZnRHQUs1NEZoakdTTkFHYVJ3UHY1REVVUlArVFZhTVNXMGQya0dMbFE2Yncy?=
 =?utf-8?B?cjJkWWlyL1h5NzNtYkxuR3UzanlmZ29lOUwvc1N3N1ZxZUUrM0ZaUENsUUpi?=
 =?utf-8?B?dURDc0FoTDZIZDNUNmo5amhUMVFHdE1yREoreVY3RW10MEhhcmNXSnRKOTJ2?=
 =?utf-8?B?YXF2UVhQbWJ3MXQzN0Izc084VFpGcnJNdmlTY0NCRk9BdW5NTnJpSmYzaEVM?=
 =?utf-8?B?cFFGME9WWWc2WlhSbFNRdVRxd0Vrb3JTL29qSEJsR0xxZVNaRGZEVi9jZEY2?=
 =?utf-8?B?dU5MUk9Tdm1waVB5Q3FtdHNaRnNQYzcxRHAxSElrTHNHTTZ3b3l3cXhHY0Y4?=
 =?utf-8?B?bWhTVlNadWY4ZHQyR1MrbHhJT0VuMXV1UHBHSndqZ1BlK2d6d2dpbXpvSnVM?=
 =?utf-8?B?NDN1b0Irc3prT01NRlpNQ0MxS3hINU1uM1BIdDdQVzZVZ25sc0QxTjFydlJr?=
 =?utf-8?Q?rc6uy/XLO/dPaZQFoZ4Ea7sDy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea06b2cd-168f-4e0a-8175-08db670492e3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:09:14.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R55T+K0LMnr2ZqZd4mye14xFvbmxA2LP6xeOF65uiKvgwZdHK3WhJY3KTXJWRPkWDQHpG3DRbSZrav/i2AcIug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
X-Proofpoint-GUID: gBUgjV9XVhwuLYVb3l49nX6Hbq8Dxf8D
X-Proofpoint-ORIG-GUID: 1OvmSFM83Aj3paF-QRD_g1pkt-WLAMPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_18,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306070024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35730HYe024101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 03:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182452

Hi Richard and Bruce,

On 6/2/23 21:19, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Fri, 2023-06-02 at 09:08 -0400, Bruce Ashfield wrote:
>> On Thu, Jun 1, 2023 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@eng.wind=
river.com> wrote:
>>>
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> Currently all files as below packaged into one package such as
>>> qemu-7.2.0-*.rpm. After the qemu package installed on the target,
>>> it will take up about 464M which includes not only the one matches
>>> the arch of the target but aslo all available built qemu targets
>>> which set by QEMU_TARGETS.
>>>
>>>   # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
>>>   qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
>>>   qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-syst=
em-x86_64
>>>   qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
>>>   qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
>>>   qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
>>>   qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
>>>   qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
>>>   qemu-riscv32    qemu-system-arm      qemu-system-mips64el
>>>   qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
>>>   qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system=
-sh4
>>>
>>> Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-aarch64-7.2=
.0*.rpm,
>>> qemu-system-x86_64-7.2.0*.rpm and etc. And let user can only choose t=
he
>>> corresponding qemu arch package they want to install should ease the =
concerns
>>> who cares much about the size in embedded device as it decreases the =
qemu rpm
>>> (qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of th=
e
>>> extracted qemu RPM decreased from about 464M to about 248M.
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   meta/recipes-devtools/qemu/qemu.inc | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc
>>> index a87dee5c99..c6fd39aab6 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -230,6 +230,11 @@ INSANE_SKIP:${PN} =3D "arch"
>>>
>>>   FILES:${PN} +=3D "${datadir}/icons"
>>>
>>> +python populate_packages:prepend() {
>>> +    archdir =3D d.expand('${bindir}/')
>>> +    do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-syst=
em-%s', 'QEMU full system emulation binaries(%s)' , prepend=3DTrue)
>>> +}
>>
>> I don't see a v3 changelog, but that does look like the unnecessary
>> default runtime dependency is gone, but what would be the method of
>> installing the packages if I have an image where I'd like the old
>> non-split functionality ?
>>
>> Either a meta packages (qemu-system-all ?) or a way to override the
>> functionality (a variable around the do_split call ?) are options to
>> enable that sort of thing. As I mentioned before, there's a different
>> expected split of the packages in some scenarios, and it would be
>> ideal to not break those use cases.
>=20
> This is quite a common need for things which call do_split_packages,
> I'm starting to wonder if it should support some kind of "common"
> package as a parameter which it would add dependencies to?

I'm trying to improve the package method to try to meet the need for=20
both the user who cares about the rpm size and the user who want the old=20
non-split functionality.

And I just did a little search for the packages which use=20
do_split_packages and didn't see there is any package which keep both=20
split and no-split functionality and just only split.

So I don't quite understand "This is quite a common need for things=20
which call do_split_packages".

BTW, if we still use the old non-split, is there any suitable method for=20
the user who cares about the rpm size? Any suggestions?

Thanks,

>=20
> Cheers,
>=20
> Richard

