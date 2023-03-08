Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D4CC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 06:52:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1465.1678258346194078765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 22:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=MjNXMyPf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2431915962=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3286h15A002051
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Mar 2023 22:52:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jlA4XWwFt0dM9hF9G6e7NN2qihmbXnHv1P+XllFIQS0=;
 b=MjNXMyPfkiOg96lSGw12HtwtW8od3ZFrmwrDQvkdYQoNzB1kHSY8bMtzYveQik95/0yX
 pJLk3fR8goYU7JnVW279Ce5YYtdjJaoG8OWG59OOXu0QSwKZ4iMZVvB9OLFmXlqdBb4D
 b3yZzSevL77zNDfDvem0L95fj2UNkvgKwDi+smaMcXln8urMmtcEXx0duKBbJYHuOtdT
 4G2LNdAzpRtfDs5h10EIPRefkm+XAsK6Xldkz5BVRLeeumF3tsyzDV35sqjVQEvwQX8X
 jq69CFEEUks2NBdtpngRrjSDKDTWHAahM84I6G3ynW4db+A60lfBb0s1AJuCQtPSqa6x uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fff87xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:52:25 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3286qP7T021968
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Mar 2023 22:52:25 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fff87xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 22:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtzYhHLoR+ramg8CocNb/+lxqOpgI3qSNWbAx3GweZdeVfmBDvEY32sZexTAEcmkzYCaGaVfgA5fPl0PcHHGeRr5bSD3FDJuDs0jTfoNYoxbxkCqxLik3sxKODYSRdrWaMHVdXVgiSGNkO5SQSkxawDvZ7hIkIRw3QxCOFQ/iTNNVZ82pA6HAHVEfqaKZayJrVvLYDwuQRB7OQL58EXHUsrTAFvZBZdcgyPD6U9Zet8K6JmtVsXm+bZrZkNmMDyLdUfkibmVvKkGBip/vKxM4OY1CXhuCYqikW3yCciWNLW3qbITkSOab05Im65vXfU77NRgB5bwkDvOZMHbMyeOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlA4XWwFt0dM9hF9G6e7NN2qihmbXnHv1P+XllFIQS0=;
 b=I6DIdTCJ7vIq5wXVL0I5Tfmx2FKoLvJyCBsaMVdTi6DQmqELXVeBfPtkaV//58e3WNDaRtbGe3zSgypYc+gSYMyqC7qXhl0v7GYKOxNh1xfM6fShYcWImSbkvK6DCd4ghEJODsCNcrDdZC1/wV4YVc71wD8mk/gci2prBsnjGfWP6U6uO2RYe5bQW8W447FTAZBiZ2w9Xz6u7qwKAEGiBhSytQZGNb1uCgRxz6pj3KqI0NuZ7UE3+8hYtNyG9JegjTDxH9/fnM8vJuDJhfjr6XmRyB1labYGrWnupjlmRR2VOJHzDClRwgG0ujK/wS/2759sfVp7WmTyBBXUyfSE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 06:52:22 +0000
Received: from BN9PR11MB5321.namprd11.prod.outlook.com
 ([fe80::b819:81c4:d9d8:9693]) by BN9PR11MB5321.namprd11.prod.outlook.com
 ([fe80::b819:81c4:d9d8:9693%5]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 06:52:22 +0000
Message-ID: <b9769316-02e6-90d2-fda6-4892bd1e8b02@windriver.com>
Date: Wed, 8 Mar 2023 08:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot in
 manifest != RECIPE_SYSROOT
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ovidiu Panait <ovidiu.panait@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
 <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
 <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
 <72a6bfc96bebf4bc8a6d3720b072e65e38a2c515.camel@linuxfoundation.org>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <72a6bfc96bebf4bc8a6d3720b072e65e38a2c515.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR09CA0100.eurprd09.prod.outlook.com
 (2603:10a6:803:78::23) To BN9PR11MB5321.namprd11.prod.outlook.com
 (2603:10b6:408:136::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5321:EE_|CY5PR11MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c768b89-3dfe-4696-6377-08db1fa1ab23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r/lx4A8wDr2KsoJgjnaSatSRrtn7Mv5Uqy2+e5A8lgbOltDyFiDKXfOtFtdcsym60cKPEUAalJOKHUMAx3K6USnie0pK9cwuQVaLu59GW/Bu4b0bvV5s3vw0xKgZVBfZ9VIOvKptwcvrt4+1gRmcIDppQAh4d0dSnySZA48fiqq16WV4+JZMNmjKSA9vcEShp1Egw2moYIdFsdSFCaYA6E5G8u+Kw4s9fBz+jfnP7isYtqMYaiYH8QGZPXc8r0qOg2VLMLFYKDi1fAY7q4f2QRO3GYReKhtad819TiUGGYLhjxIO4HAhFHSWXqk1IutC/90YP8MW/4LGnNTa8Bk67jTd2A0hMypoWzrgcx/Q0REg3wdGqoQk3Tgc3Ws4jcb5U93fmG3Dy9Y51pjThIopnpGTJQ/nt3w0ttbbzj3ZBO1DYhwuUd3JcfbntabzSxt9M3r26Nj1jTjpdCJ9UH1aFw5xJ4MtPbJ7R0xGFKh5Ypq2/KaQmxCLm5UqmHRsZA205Hdkp1TqY4pWr2sL+f//+Bhy5gGlbwFzwHD84NP1IoyzpcaAtSt0906UAZNiIHrl975fwyIUGYoBP1xBvnPH/2WoGt5Ngdm9XxEr/gO7kR0MRvFisaF5/MTcWQ2TasEDPbXuJpWY4gGULEiMt4EKaQhTpj7IL7Eq63VLeqtA/sqjCZ5rzw8KMJiE7PEgKAKHkbolEBJ2VC1nBwljF6dxlay3x3AiErdEDBiMnO6i4KCopIDPJNwzC7Lb77E2A31H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5321.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199018)(31686004)(316002)(110136005)(36756003)(6506007)(31696002)(86362001)(38100700002)(6512007)(186003)(83380400001)(53546011)(2616005)(8936002)(5660300002)(2906002)(478600001)(966005)(6486002)(6666004)(41300700001)(66946007)(66556008)(8676002)(44832011)(66476007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGVZb3JDbWE5cG10SGpqa2xvVlI2aXhzYk8rMkdTTE9XTEt1N2Ezc3QvZ3gy?=
 =?utf-8?B?V1pldHBKZTY1a0RuK0ZQMkxRQU1XMHVhRmdYbWNHSWtzdVlCdkJTS3dkNnlH?=
 =?utf-8?B?NVNraURQR1hxVjZybnlRamxPVDE3NkxIbjc5QlZnTncxV3FQV09taFpZam0y?=
 =?utf-8?B?SnhGbUxTa0pjOXo3MFhwWVRWSmd0RU5kV3NSTmF6Z1djOWVJa003ZTB1RE40?=
 =?utf-8?B?azQ0NnduRDFGY3BBQkoxQlZMUjRLc0dQT0VPQjgyVHJCOWRKejlzZGxUVE9j?=
 =?utf-8?B?MlFoYnlOWm5haTFJTU1Lb1V2SGhNTDZEWmNLeTQzMWlHRmZDRHpxcmpJMk9H?=
 =?utf-8?B?UkFoY3FwdG5ka3NlY3l4NDlTcFJEdFBEVmtMdzZkOWFsUzg4ZmVsV2k4Tml0?=
 =?utf-8?B?TDJTYVBmRTNUMFhzQmhnckhnU2VUYUhIdGlDSEZ5VTFxcTJPSFprL0psbk91?=
 =?utf-8?B?K3NEZllRRFNMNnUrMjdwSHBWcXhZQWRIc2x0VHRvcWdhYWRxLzAwRVVjbmw1?=
 =?utf-8?B?ejBnenhiKzVwbCttd2hJeEdoSSs0blc4VTVzcjR1N1pmbU5uMUVoekxidldK?=
 =?utf-8?B?a01SRmNNYWxpUTJPOUhaYytxOEtHakp2Q20zcmladGdqdlFkWnRxeGs0ZzlZ?=
 =?utf-8?B?L0E2WWpqVHFqRjdWbFFJcldaOEF5c1liaU9zdFd2TDRBOVA3N3padjN6bytn?=
 =?utf-8?B?amt6S0VBZFBLaVZFN3VlV291ZFpicXlmZGNMKzB2STZucFdLV3FrNTBwOFNV?=
 =?utf-8?B?bzQvdkJMOEN5azlEZUthQnhSTUUzQ0R0M01IeDdtR0l5UUd2YWJPZjJFUW1h?=
 =?utf-8?B?SWtqLytlVDVHamtzZEZYTEl0anFwQkkyLzVmaHRZNFg2bTlGL1lDczZKdlVH?=
 =?utf-8?B?Y01XcUN1OEFGbFMwa0kzaDFDVnhXQmZ1QkZTWkZad0NuTVFWZTk1a2VGbFB2?=
 =?utf-8?B?MjRtd1p2QTdEbjdRMExYV0NnOW9JNmJ6S0hMN2NrNGN5c1NSNDNnRTVWWEQx?=
 =?utf-8?B?VGV2eDZBNUNsa3lmSjZNam56Q2UzMTJaR3JqanRKcE9NbGhJRDJab1NvRDRP?=
 =?utf-8?B?ZFdGcVliUnhoVEZxdVN2NEVsdG16NWFpWTJUcUluSHFtRVRQUGN3QzBUaThK?=
 =?utf-8?B?RHhxWjBtZ0IrUDc5NkVQZGdMYkJXSUhkS0V1TWxFQmRYSHpZR1hUZi9CVFFw?=
 =?utf-8?B?aTEzNjBySXFBanIwZ3VvSnFzSHZGaHJSTHkyVVR4YTAxVHFnQzlEZW5oQjFo?=
 =?utf-8?B?YWg5QmJXNGlRUnZQSktKbmpUMzBzN2V1a1Axek9wRFhMK1JVUEl4MmlvNlhF?=
 =?utf-8?B?cHVYbVVnZzFvTzJNYzVmOVBGcjdyczlVMnpKeGhCbks5SkhkdG9FdTJwR1B3?=
 =?utf-8?B?c2FvcXVIZ0FnUktrSGJ0bTJvelZ4VjNqSmF4dWVhMGNLMGcrQzVXU2lTRGUr?=
 =?utf-8?B?ajNNZnVJVHRISnpuTHZFQngvOTlKbHJXZGV0bExaT3dXNGNqcWwwWlhlMTdq?=
 =?utf-8?B?dXd6K3JVNHJlaWtSemFVVVA3M3BNU1plM0RCTHg1aitFamtCa3Jpd3hqaWdz?=
 =?utf-8?B?cjB5SFg5Q3o2b002REpFRmxXSEN6WFFnc01ucWhkZmdwK2xjQXVHSnRkbFo3?=
 =?utf-8?B?QmJmeVdPMFdXcDduaURZYzd5ZjNFYkNFQWFFNlczOUNoV0Y3V2hmZlVlVEg2?=
 =?utf-8?B?S0RJUGR3MEhGdUYvVkpiUVB3THVZUFYzQWgyMkdhMVBpNlVFbTQxSTIxVHdK?=
 =?utf-8?B?UTVXZDNheEQ2M2RQL2ZXb0NJMjdSdEdzL3VsbUhYNXpzS2FKQXpZcnkzaFla?=
 =?utf-8?B?a3Z0T1k1d3E5ZU5BN3kxQTZISnZxVGZVZzdZdmhFTnk3bSs5UTFZUmd1Ny9k?=
 =?utf-8?B?d1pCbkFubncrVUxNZnFHYyt1L3U1a0Nmclg1QnhXMTFhSmJwbEE5U0JWdXNM?=
 =?utf-8?B?ck9rTzlmSTE0SWdSelF1UjdHQ0h4UlNVc1ZiRjBhaEQyQm9YSlZYRml0SmFL?=
 =?utf-8?B?Q0FqeEhGK0NISnNodlpvY1JmYkNaVm0rUTlnd1VCczJwS2Vlc3RCUlRFVDJi?=
 =?utf-8?B?QU9Lc3R3OFR0bTl4cFBlYnVoaHRDcmJ4OVd0c0hZOSsveWI3VjBFa1ZpMXFL?=
 =?utf-8?B?QUhjZXRPSEFsNHowbkw5VG9CUm9sSUczT2lBUE5pKytKQjNqdXhkQjVtRXNk?=
 =?utf-8?B?VnZiaGhZclQ2VUZDV2s3dUU3VHczaGdqcEVZaHhOb0NjYUlDRm9DUkwzMTJN?=
 =?utf-8?Q?Onm876qwou/4s7DAfjzqT8JV0U/2lqu7SpmdUTN7Lc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c768b89-3dfe-4696-6377-08db1fa1ab23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5321.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 06:52:22.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VG0pknrq7F5Ch3x8e62sljx9Adve0w0O4TlmubSRafWik39vWgT6PQ8WvpjZQ3IT5DIFCy2nqxiLZI9ulBAJ+6dPdBKt2TsJtjsejxsUgtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
X-Proofpoint-GUID: 0FRonK9uJZnngxCBMjoXjX_lIjhWbAP1
X-Proofpoint-ORIG-GUID: 8PUUlE6KOLQVKwYHq7uJM-YOyZ8r1oUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_02,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3286h15A002051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178155

Hi Richard,

On 3/7/23 22:45, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2023-03-07 at 21:04 +0200, Ovidiu Panait wrote:
>> Hi Richard,
>>
>> On 3/6/23 19:59, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Mon, 2023-02-27 at 17:42 +0200, Ovidiu Panait wrote:
>>>> The following scenario currently fails:
>>>> git clone git://git.yoctoproject.org/poky
>>>> cd poky; . oe-init-build-env
>>>>
>>>> add to local.conf:
>>>> require conf/multilib.conf
>>>> MACHINE =3D "qemuarm64"
>>>> MULTILIBS =3D "multilib:lib32"
>>>> DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
>>>>
>>>> bitbake gcc-cross-canadian-arm
>>>>
>>>> update local.conf to force a rebuild:
>>>> GCCPIE =3D "--disable-default-pie"
>>>>
>>>> bitbake gcc-cross-canadian-arm
>>>>
>>>> Failure log:
>>>> The stack trace of python calls that resulted in this exception/fail=
ure was:
>>>> File: 'exec_func_python() autogenerated', lineno: 2, function: <modu=
le>
>>>>        0001:
>>>>    *** 0002:extend_recipe_sysroot(d)
>>>>        0003:
>>>> File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, funct=
ion: staging_copyfile
>>>>        0160:        os.symlink(linkto, dest)
>>>>        0161:        #bb.warn(c)
>>>>        0162:    else:
>>>>        0163:        try:
>>>>    *** 0164:            os.link(c, dest)
>>>>        0165:        except OSError as err:
>>>>        0166:            if err.errno =3D=3D errno.EXDEV:
>>>>        0167:                bb.utils.copyfile(c, dest)
>>>>        0168:            else:
>>>> Exception: FileExistsError: [Errno 17] File exists: 'poky/build/tmp/=
sysroots-components/armv7at2hf-neon/lib32-linux-libc-headers/usr/include/=
asm/byteorder-32.h' -> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linu=
x/gcc-cross-canadian-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteord=
er-32.h'
>>>>
>>>> In this particular case, the paths in lib32-linux-libc-headers manif=
est file
>>>> are prefixed with lib32-recipe-sysroot:
>>>> $ cat build/tmp/sysroots-components/manifests/lib32-linux-libc-heade=
rs.xxx
>>>> lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
>>>> lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
>>>> ...
>>>>
>>>> When gcc-cross-canadian-arm is built, the actual files get copied to
>>>> recipe-sysroot directory during do_prepare_recipe_sysroot().
>>>>
>>>> Because of this mismatch, on rebuild, sstate_clean_manifest() will n=
ot clean
>>>> the files in recipe-sysroot, but will instead try to delete the non-=
existent
>>>> files in lib32-recipe-sysroot. This will trigger the FileExists erro=
rs later.
>>>>
>>>> Add checks in sstate_clean_manifest() for this corner case, so that
>>>> RECIPE_SYSROOT gets cleaned up properly.
>>>>
>>>> This fixes BZ#15045.
>>>>
>>>> Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
>>>> ---
>>>>    meta/classes-global/sstate.bbclass | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-globa=
l/sstate.bbclass
>>>> index af93546b04..edf5c7fb65 100644
>>>> --- a/meta/classes-global/sstate.bbclass
>>>> +++ b/meta/classes-global/sstate.bbclass
>>>> @@ -529,9 +529,20 @@ def sstate_clean_manifest(manifest, d, canrace=3D=
False, prefix=3DNone):
>>>>        entries =3D mfile.readlines()
>>>>        mfile.close()
>>>>
>>>> +    recipe_sysroot =3D d.getVar("RECIPE_SYSROOT").rstrip("/").rspli=
t('/', 1)[-1]
>>>> +
>>>>        for entry in entries:
>>>>            sstate_clean_entry(entry, canrace, prefix)
>>>>
>>>> +        # The sysroot directory stored in the manifest file might n=
ot be the
>>>> +        # same as RECIPE_SYSROOT, so the real sysroot will not be p=
roperly
>>>> +        # cleaned up on rebuild. Handle the cleanup here in order t=
o avoid
>>>> +        # "File exists" errors during do_prepare_recipe_sysroot().
>>>> +        manifest_sysroot =3D entry.split("/", 1)[0] or None
>>>> +        if manifest_sysroot and manifest_sysroot !=3D recipe_sysroo=
t and not manifest_sysroot.endswith("-native"):
>>>> +            sysroot_entry =3D recipe_sysroot + "/" + entry.split("/=
", 1)[1]
>>>> +            sstate_clean_entry(sysroot_entry, canrace, prefix)
>>>> +
>>>>        postrm =3D manifest + ".postrm"
>>>>        if os.path.exists(manifest + ".postrm"):
>>>>            import subprocess
>>> I looked into this and as I suspected, the bug is elsewhere. I've sen=
t
>>> a different patch to the staging.bbclass code which should fix this
>>> problem.
>> I tested with latest poky sources (with commit "staging: Separate out
>> different multiconfig manifests" present), but the same error is still
>> triggered on rebuild:
>>
>> File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, functio=
n:
>> staging_copyfile
>>        0160:        os.symlink(linkto, dest)
>>        0161:        #bb.warn(c)
>>        0162:    else:
>>        0163:        try:
>>    *** 0164:            os.link(c, dest)
>>        0165:        except OSError as err:
>>        0166:            if err.errno =3D=3D errno.EXDEV:
>>        0167:                bb.utils.copyfile(c, dest)
>>        0168:            else:
>> Exception: FileExistsError: [Errno 17] File exists:
>> 'poky/build/tmp/sysroots-components/armv7at2hf-neon/lib32-linux-libc-h=
eaders/usr/include/asm/byteorder-32.h'
>> ->
>> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian=
-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h'
>>
>> The manifest files still show lib32-recipe-sysroot instead of
>> recipe-sysroot (the manifest file seems to have already been cached by
>> lib32-gcc-cross-arm):
>> $ head -2
>> tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0-=
r0/recipe-sysroot-native/installeddeps/lib32-linux-libc-headers
>> lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
>> lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
>>
>> MLPREFIX is set to lib32- for gcc-cross-canadian-arm, so the existing
>> manifest file with lib32-recipe-sysroot paths is used:
>> $ bitbake -e gcc-cross-canadian-arm | grep ^MLPREFIX
>> MLPREFIX=3D"lib32-"
>>
>> Adding an exception for cross-canadian to the the mlprefix code added
>> earlier seems to make it work:
>>
>> diff --git a/meta/classes-global/staging.bbclass
>> b/meta/classes-global/staging.bbclass
>> index e6d0d1d55c..a9142ce780 100644
>> --- a/meta/classes-global/staging.bbclass
>> +++ b/meta/classes-global/staging.bbclass
>> @@ -276,6 +276,10 @@ python extend_recipe_sysroot() {
>>        stagingdir =3D d.getVar("STAGING_DIR")
>>        sharedmanifests =3D d.getVar("COMPONENTS_DIR") + "/manifests"
>>        mlprefix =3D d.getVar("MLPREFIX")
>> +    if "-cross-canadian" in pn:
>> +        mlprefix =3D "nativesdk-"
>>        if mlprefix:
>>            sharedmanifests =3D sharedmanifests + "/" + mlprefix
>>        recipesysroot =3D d.getVar("RECIPE_SYSROOT")
> Was this in a clean build? The change will need a clean TMPDIR to
> properly take effect. I didn't force everyone to rebuild since the
> issue is reported so rarely and has been present for a long time.
Yes, this is still reproducible in a clean build, with a fresh poky=20
clone. Same steps as before:

git clone https://github.com/yoctoproject/poky.git;=C2=A0 cd poky/; .=20
oe-init-build-env


add to local.conf:
require conf/multilib.conf
MACHINE =3D "qemuarm64"
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"

bitbake gcc-cross-canadian-arm

update local.conf to force a rebuild:
GCCPIE =3D "--disable-default-pie"

bitbake gcc-cross-canadian-arm


Ovidiu


