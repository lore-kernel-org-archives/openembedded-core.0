Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA262C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 01:51:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6652.1638928285977979745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 17:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=IPBe2k+0;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7976343dcd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B81b0O6032295
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Dec 2021 01:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4rKkJ1AVpRnoCLfMPJBXStGuR+jyGKr4IwKouxzwKhI=;
 b=IPBe2k+0J1RfRTKilTkmOm4Rg570FuaNO/M7whurpahm4bEN0LHdhX+oJt40Tx94HJ4M
 GnzCYNm40pzPTh7refbSb12hKkesjGWNBFyC4HacwVxtGwOYIBLO8tXgsqZlQ0cp43Wb
 AEN4SPc2wC9L9kEF2KzEwlKv9exMdp/L0aGAYtcL0xRot5xfNRiytjyf3OfHhKfsz6/r
 sSS7d6QK1oeLqY7j1/lZUiMLlwMYFl02vFwRxJBysNIsH8yQ6bn9NwC3ePhmH+/Cd3xQ
 r9ct5Cgr+9HdxPvTJhGMxq6qsiOMc+pwPoYauDrz6/ky5m6lo0jBqc3VKWx6MVh16uUU eA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ctba60c90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:51:25 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1B81pOT1024154
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Dec 2021 01:51:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ctba60c8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Dec 2021 01:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSZttMk7E4ztekMgsTluyUS/n5e7yVrV6wR63mofuQqHM3jS58Cynq65Lmsk7gEMkMGCMcN4mLJYJa6AuuNG6pYbhN0Ac2YQ3Fpv0JqMOMf3fYOv+shG0hLyFSYwqlQG4m4F+Duu1HqJtBXstSzlFnSpEaIaexhInHniHFVnrsvtk4LhWbHaYanOdTASMdc+rpI0DF4kXrcM9Hv2AZLsmipk8rilTsad/piMPPWG0v3uu3fABlrMTQQ7otptmfcU4vpo9lYuySEzWFVSyWSCuHx8WTc99OjdOhKPPMPlZGS/Hxo1/rH/tVid0bVLMZgLP6vKhenynTraeZxBMSggqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rKkJ1AVpRnoCLfMPJBXStGuR+jyGKr4IwKouxzwKhI=;
 b=AsWopPT9VYWGN6C119Pj1tmas5B63Y53rsy2oFyA8bDgOyMeGbqNVvXJdviQM9aqgWfe98nBFAGN82/XuOAnSsdZSgiQZd7uy3ZyqIcdPl+sV8lfhLuw2U/4GW1+Qodp9AWK8EcJeeyAalwliPysggjKUR3BvvqzgOH9R7W90QMuDzD5QPtv1125yA+iRauXNJAxt5jMunbjVdwQzJMb3wD4Jg5UYiIpWka5C6RejzVViQZfiXU93CPq0fedVJud/T20/f+ZGv9bO9cVUN90lzksR0et9XrT4We7kEXgQNEMzn8K2KHzOwtODlZzvdDUPPqAyiAAZDjVuzsHR74tdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3419.namprd11.prod.outlook.com (2603:10b6:5:6f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 01:51:22 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c52d:281d:a9ee:67b6]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c52d:281d:a9ee:67b6%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 01:51:22 +0000
Subject: Re: [OE-core] [PATCH] Build libstd-rs in release mode to compile
 mozjs
To: Alexander Kanavin <alex.kanavin@gmail.com>, pgowda
 <pgowda.cve@gmail.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <rwmacleod@gmail.com>,
        umesh kalappa0 <umesh.kalappa0@gmail.com>
References: <20211206054504.61115-1-pgowda.cve@gmail.com>
 <CANNYZj91-Jn48FCrzd1aFeCmyxR0vzqnOqqPx7+ORiUdjRdVAg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <edc34cd3-d06d-b940-05f1-a6d6243495fe@windriver.com>
Date: Tue, 7 Dec 2021 20:51:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj91-Jn48FCrzd1aFeCmyxR0vzqnOqqPx7+ORiUdjRdVAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BY3PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:39b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 01:51:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25378656-0db8-4ff3-c338-08d9b9ed3c97
X-MS-TrafficTypeDiagnostic: DM6PR11MB3419:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3419309E2E097F384B4C67A1F86F9@DM6PR11MB3419.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UztAuV8sQQkeE0wKmjmM/PMihsNL7FmO/6YOEOgPdsx45wIfJEg9YU5g0GxFExNiRE0YdHGEmvC05s+s5Jw94v0Hxnsp7ZVoVRGP6CPpyKfdkP4+KZw8nPo6jeOJkIdx1uVoHgPz8ZGPv5LDMlWEX3qPkw3OgVfmY7/Z+LJIicc0UiAZt2c3eJ0mQxqQuNVFMSCxfYr2OCnkjYS4OTUY2zVApJmj4KsIUKWk4DBFGl6hIka0qdxl2Ch50wsBhDDnHEKUPAlIa3dBh4KGiLnRMmDcUaLl8LgDviOrq0uo5cTW0wyIOUce8FjvTuZca1t9nJjMSfVrJCXgtZbsZAdgBqFsT77LGFYGuQMfPXhsLgB5yv+Rt1dpaIldWO0N1Ne1B/9U9Q4af3zpFaE1bJG1sydbouDaiLlylVsfLnv5ZVqnsenqyRW0ziNAOu1BSGRAiqbCAx6ByDQLxZz4Mhy4NFr/k0NlajTlrZKHc1NYlL6ecpqybvRHxsyc8Y62zMkUVL0WH2dHZTXIzDOBnp833mPOd9PLbACUtpUs5lBrFcXyiCvKsHjXJgrUQVNYblUlaRngGnVik8u6rkRVamV154TqP+3xsJzp2g83xF2kBtWI6REInBsw3lleg4mJRf/2eLrwV0BNYlbB0y+hnytd8rMqizQg2h7yiL50btJByR7l5RAi7Dp7Q8z/lVBJzPsjdOHtnt4ThqiCfZ2c3ZQz1A11lTAcMNRiX2g0GYABe2g4c3zDx1E2uiF7PkHwH9cFlyxxLZFbQBEjYat/Z/QugiD2CK6OBunSmT1DP4lHr1Kit6uLLGJkQwL3Amf1M430fT6U+sEqBlOofTMeL6/Nhq1BVc9FIOaXi139hjEAbFYk8A3CMpZQ8E1Ijql/psHIWF0FI+vJXMji0I73wiMoMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(279900001)(629001)(31696002)(38350700002)(38100700002)(26005)(54906003)(5660300002)(110136005)(956004)(316002)(16576012)(8936002)(86362001)(2616005)(4326008)(66556008)(66476007)(6486002)(186003)(83380400001)(52116002)(36756003)(66946007)(53546011)(508600001)(2906002)(966005)(8676002)(31686004)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3lmMVo5ZGVjRE9QcW4xbE4vcjVNa1lUbXJFT0VQc1lOOEtWbGtyUFNBTkRk?=
 =?utf-8?B?QUlaTnVkbXk4dU9Sc0x5ZTZiclhXZm5oMmhQWDZZbzdKMllGMnFhd3BBczhu?=
 =?utf-8?B?eGZqbkdlK2dIN0p2bWlZWGFyTXJOQlc3cTJldEpWUmh4d2lwemVQVjVCMGJo?=
 =?utf-8?B?S3BTb0hwZjE5SXY5Z1Y5a0lDTzVmZ3hBNUxSekdsd24zUW1jeGQ5ZDJscWJS?=
 =?utf-8?B?QkNsWnlRZFVMYndib1JEME1hSExDeVUwYjNHM2tQdjY4Unp6ZGlFRG82NVBH?=
 =?utf-8?B?dk91bDhmc01JS3FOdlo1VDF6LzZBTytmMGpDRTZreCttUnVhbkNsTUszK29L?=
 =?utf-8?B?WlhpdFppNTRSRUhKK2ROVGZNRVM4UlF5aWM5MXhvQmlQVWFRK0YwNXNMRlFO?=
 =?utf-8?B?YXNuakRPcnA0WXhRTnZJWXN5R1B5MDhSTmlWTEZHQ1RyWVhyY0FobDJVRWdM?=
 =?utf-8?B?UzE5SENOZUlPZVJxbU1TVHRmYTRPQnZYektvOGNIZHVSMVhsM2RTUWNWQUN2?=
 =?utf-8?B?Snd2cDBOdElXbWRnVitHSzJHdzVYU3g2L2kzWS9hTVRCcmx1Wlphamt0YWlz?=
 =?utf-8?B?TGZNV28rcjk1eTM0YjhnVDhQRk43UkI5cXVJKzRVOEpTdEJyeEczaUJEd1J0?=
 =?utf-8?B?b01qVWpRUnRvWkJjQzhlcjBGY0hwQ1pNVnFFbHJVVmJSaHNlcTA0WDFxOHQv?=
 =?utf-8?B?czZ2NWxtVWJXa3lDNkMyZmQ4QXhRT1g0eEhiNlF2V3dYRWYrSFFjUHpNM1hy?=
 =?utf-8?B?M2hmd1ZmdlNwRStZTEtTS2daV01SeUZKVS9BR3FZeGk1djZ0RG5JSXdyTmph?=
 =?utf-8?B?WnYxT0NUcEVsVWU3M0dMYmVJWTg3WjhGa3dkTGM5VnhDditYT1hPdDE4c2c4?=
 =?utf-8?B?YXlCZkF1Uks0TUhPdFJvRWliZnhxQTR0UTh5ZWt1OGdaNFdKV3N4STJFL0Zr?=
 =?utf-8?B?VWJ2KzZoSUFkK25qQURQSlFmNmpTOXYxU2V1Y1VlcFhmRkNVKzZGY3JublB2?=
 =?utf-8?B?dmVMNjdoV3hJbGx6cGp6L1BJVjFkUzJ5RXZPWW9wbWVlVFk1ajVqNWlZZm15?=
 =?utf-8?B?dXlwRXk5YVB4cDY3Z1RLdThuVllPOEthaU5veFB2YUNPZzNCaEhQY0tCVlNX?=
 =?utf-8?B?VC9nbExoMlB5bUVvS2hnV3R5NWVIWTZ3eXlhL0ZhM2FiTVJNem5oZGgxb1d3?=
 =?utf-8?B?K3ZOdWVBN0NqRnlpSHRBUzBlcXhQb3JLL2RRUGVneU1ud05jMlFlMEhQVHN2?=
 =?utf-8?B?V0dNSWpremRBUk44cDVPYzdvY0ZXbDBGT2pxOVpmTFZDQUtlMDRvVGQvQmFv?=
 =?utf-8?B?NjJzVlhVaHRnck5qUEJmOWo4dVFsOVhoL2kvTEduTU9ZYllVc2RQa21GTitK?=
 =?utf-8?B?S0YvVjQ3WWhYNXk2VUY0amh3ZmNZT0ZhQ0lwdmZEb01idWpuZURoRnphVEgx?=
 =?utf-8?B?TENaenhCMkJxMVpMNFUrck1XOC9SK3F3WThDZCtVOXV1RkxnaFk5bHJaRVdF?=
 =?utf-8?B?N2VDZFFJeUdCWENZTDhFY0lVNGVaYTNKOXpJcitFQlFnR0JCa1orcFhsd1g0?=
 =?utf-8?B?ZEd2MENQZzdGR0xVb2NzaGNvYmZ4MUxrdHE1LzRGSHZVL3V1UzduS2RvS2dw?=
 =?utf-8?B?dkhQVGs5eElHRUhxVXpCck14MjRoV25CTUlVQnU3MG13S1gyR0owQlpnZzZB?=
 =?utf-8?B?MFRJdFNTNytiVDY4TVFQd0dBT0RLbVdnOVFtWm84Y2pFQzJMWDFBSWU5UUJ5?=
 =?utf-8?B?bnkraHJXbkpOeWdwYXZ4N2ZkNkJhUzA0d0hEZmZQdkpkMGJGNTZvR2FpcXVy?=
 =?utf-8?B?aENEakRHV28yTWFmTmZXMlQ1U0dNaWNTcnAwRmFncEJHdi9JR01uNXgwRkJn?=
 =?utf-8?B?VWloMVVJQkxSWVlBVXVTNVByUzhJWWFiY0hGVkh5R1Q2Z0djSkczUTNNRnpO?=
 =?utf-8?B?UllCUjlWRUJDWFRib3p3N0Jod3pON016MWJqL251RG1wc2hHSlVpMjhNZm9T?=
 =?utf-8?B?WXdEeHZSb3MyKzdTRm9naU1tSEtRSzVncHhua25ncUZaWTFBcWxpN0Y5eHE1?=
 =?utf-8?B?T0x0dkFkZ0s3ZE9ZWDVpL1ZVMDd6a1V5RU84clF5bUpIRXoyc2QrWXpGQnhV?=
 =?utf-8?B?TklwZ3Y2WUI1TGhkc1V6bkRMUGVPanM0MklkSTc0Um1CM29tSStmWTVxejNr?=
 =?utf-8?B?WnRxWlcrWXJSU0hxbE1NSmxHdnNqeENqS0ZXL1dpVUVTa3FmMWZ3MzBxVW9v?=
 =?utf-8?Q?tYsHhgI7u6KcVWYz1qa9exHtVBxLNajozpWfqqUOqk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25378656-0db8-4ff3-c338-08d9b9ed3c97
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 01:51:22.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JvhIuv84YYO7+j5zftQ30oQhqDBy4ADg/sPGijDIUUXrWzi1iuX/71jAcNYrbKTcHN5BmUD5KjdfJLJ5JOv36+bgKB8zAgEtkIAF8R6IEVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3419
X-Proofpoint-GUID: vTa5dADKbA2fcxwU3bpCtTYa5SeOOKMR
X-Proofpoint-ORIG-GUID: J8nOoiQ78D9FLOxJpispJPC4sNWjd-Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_09,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1B81b0O6032295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 01:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159338

On 2021-12-06 3:20 a.m., Alexander Kanavin wrote:
> On Mon, 6 Dec 2021 at 06:45, pgowda <pgowda.cve@gmail.com=20
> <mailto:pgowda.cve@gmail.com>> wrote:
>=20
>     When mozjs in firefox is built with DEBUG_BUILD =3D "1"
>     in local.conf, it will fail with the following error:
>      =20
>      =C2=A0rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialize=
d_div_rem
>     /asymmetric.rs:57
>     <http://asymmetric.rs:57>:
>      =C2=A0 =C2=A0more undefined references to `core::panicking::panic'=
 follow
>=20
>     Switch to building libstd-rs in "release" mode as that works
>     around the issue and builds mozjs successfully. This is a
>     work-around that can be used until the root cause of the debug
>     build error is resolved.
>=20
>=20
> Thank you, but I think the problem needs to be properly understood=20
> before any fix to oe-core is merged. Can you keep the workaround as a=20
> bbappend until then?

That's fine. We (WR) have this as an open bug so Naveen will
work on getting to the root cause.

CCing Khem in case he want's the work-around in meta-oe.

../Randy

>=20
> Alex
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159212): https://lists.openembedded.org/g/openembed=
ded-core/message/159212
> Mute This Topic: https://lists.openembedded.org/mt/87534858/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
# Randy MacLeod
# Wind River Linux


