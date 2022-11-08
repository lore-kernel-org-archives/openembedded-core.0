Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F04BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:42:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web11.212.1667929362376938979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=cb37l2V+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.68, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQ9KdS9okKGigohsSKrXTP4Cotb2Zh9UQFtc1BC6saPRznCAyr/jTxQgC0aHEX1i5B6WgLVPEdoMfF8fnnMN4nk/Vpj/Sr7PRiwrMW7F+yXr8///Dn+Q1XgmKsBMQE2AmgFEs/6N+PRtnRYyFdAzpB+v76QPDKRBd5FtjOOS/t7R66msnMeXoRvz8F521fHT6u9RQLOgY96DPNHujDjPqX42P4ByRzvQ0PPjgkEbAWhOBIZoXEiYoP32D6FTWUtFmVk3eMNVeLOkGedhJ+muYXRfyGYEjk0iKGHl7CoEVqX7NgrE0HEAuuAwdpwraLj8DvpmY9uHNr5YLCF59cNYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EU5tT52QfKApg/kK/QCNMpNBkSDpsEdQyfdKjN3Ho0=;
 b=XlEvt29G7L4XrS3S3nX9CZjbnTPd8wQba3i5ZHsInjGHghaPLihFC7hj0lmjmiI1K4RJQ9hQ+vPaTRyGD+ZzBlhYahu3CQB6jRENWQR1tpW2Kt4ly7dlYNwwuX1FofekR7bXQ7TDtgFOv4/eZzT40cdBQ5BHAuD+ZZS18IbJyyJdleEn+39FfVV4qgTLXA7rWs/QcoVtxPTXXpULqGjhZyRzH8bLn/eskN+P9xgZ+QGQEcPI37xgS+t1QqQmFyaztTSHQ4ZxxxHZ7bvrewx1IxDGbL32H4YvngP0j484oV93dgYGi9znwYsxsRTv08Mi6++22BhoRelN0nLqURxx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EU5tT52QfKApg/kK/QCNMpNBkSDpsEdQyfdKjN3Ho0=;
 b=cb37l2V+OXzhSr028lRJiZgX0TRqudtyiJAjkQrA6I07x0PEAE7F8v7xJPboOzFJKgOxyfPkTfqY6nhnCHglIc5VfFU12KQOfevqj3cxT3PvGKKwgMorlQRBXvK9ZdJsFc0nHKTKzZCLj/TmVJS+9fmaCWtMGEJPVT1iMWEm7/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by BL1PR12MB5377.namprd12.prod.outlook.com (2603:10b6:208:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 17:42:40 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::cd00:ca6:8cb4:e913]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::cd00:ca6:8cb4:e913%8]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 17:42:39 +0000
Message-ID: <663a8ce0-c048-94ec-0ed0-b97ceebab676@amd.com>
Date: Tue, 8 Nov 2022 10:42:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: python3-picobuild build issues
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
 "Hatle, Mark" <mark.hatle@amd.com>
References: <34e26020-b14c-e5b2-d397-0d0715b67e4c@amd.com>
 <196A74E6-80CB-4137-9E28-4C0E498A51AD@arm.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <196A74E6-80CB-4137-9E28-4C0E498A51AD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|BL1PR12MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: cb631405-79a6-4cb8-a6c6-08dac1b0a1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QQznzAIWAKEjq+oGNXAE3UjAQApGLYDevDvH6CFFA60UU8qmPn2PRUl1IH42nPJXpbwpHfrxeCFmqQdyuK2W11NEhhRLrBMD7pR8Js2aUhM70vP7gPR1bcmPIGwOZUDNPjC3Y4VLyWAaWjE0OzoAdbPrBKOODynrqDlttALMZqAikE+kECEIofcl1UEm1Mimdp3JXa7utqz7FPfuRIcCp/B5H+oU3+uwcCsBurb5MOZVGTm7oI3NBBQ54c05+kvJmmDrDggH9rIG8d7YCJ4fI053kxh7wqgYa2COrSBQT3qHeUCyzM5bcVbnYrztUqWDG9GjLPaJOUdNjBKs5VoDM6vLMQcmsV62Bj3s30i35dgEXsBEAa1+oLHAhnwt7YOWryzwuSiWaDPcOyNJovALLs/4JZfBOYzuTx6dVmJihuF6SLdWI2GyCFad5Irbhob7Bb1obiCBb6mFV0DoZchkCzORxOyz1Wl8r3+brmFxm+JxxARRlXwn+5KEZsLZxU2ybE1Uml+zx1Dj7IiKF5qTXkjPZi8CtUaFbZWoG+fUcjssywpNgXXg8rdgu7LabjEzSexkRKEdAEtk0tSgvtf7mxG5ftyWlPtIGJibCChhE4baWP2AdFKf9wNT+qO35odmNzL1xkZ59WuW0RM2wscX09CN7+1cpGAAa/GdM+uhp2GIBkeCmgRwcj8yD75VZw8VUBuMNmHBElcWU+dGOfEvXfHRTlP0KkDSuCUyBD55FXOSF1QLKKNKI1j9Wlj87TrnTS5FDony0ixKSTvKHF/3GgF0nLccNN3hPXkdKSWg2reKmeQq336k+nm2Tq5xJgW53lCckNgbCxhm2xAGN9ZnZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(36756003)(31686004)(478600001)(83380400001)(38100700002)(86362001)(31696002)(186003)(2616005)(2906002)(6506007)(53546011)(6512007)(26005)(4744005)(6666004)(8936002)(966005)(6486002)(5660300002)(41300700001)(54906003)(6916009)(316002)(66476007)(66946007)(8676002)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QYTYNTRlQFqs3z1kYXiaqkn+x1l4JjYjlR4k6zh+DjGYtOiZlu+FNer+dvCU?=
 =?us-ascii?Q?fhLMGbbmbQAnaONaaKgSZ//I11rLRr95hm4AqHQ+yOPsggFT6g2QdTGyOAdo?=
 =?us-ascii?Q?+Ifcte0K9rWFWJXE8+MVXSfsBmIh6J8nZuCLwSpR9/v5wsbucZN6Wh0Mzjx7?=
 =?us-ascii?Q?ipEKyMhnEGv7OQ0PUkGzweYtcUouAIqft4XbUp+VHDGEhc7vMLxR0FjDiUP6?=
 =?us-ascii?Q?YUI/jyiIEjjqKTpgYiWn0wlPFN0Qd85Ykji9vp/oHWPdiCqbkR74oledhDlj?=
 =?us-ascii?Q?AUICHLDJbD3iaSsY4eJbNQKHt0qhAoghqD6+0eDBqhyQcGsIYZkPkMhOXvrz?=
 =?us-ascii?Q?0Eb649BiN1VJh+/s/LSDMs57U73Jl8bqRCQslrIZEvQjKLTvIGRgKtZvgOI7?=
 =?us-ascii?Q?2fOspmmQmRGa90qwpAubVmt/lcaFSOjwG+lzwK8KvGX054QVoLffNOzo8nzI?=
 =?us-ascii?Q?ITQzhMgVs9DNoKvXl1oDGplqR/EzYyHXiNtzTi3GbPxfQa1eA3kR/Mp4p2nx?=
 =?us-ascii?Q?Y/zQg5cxQZkvRQK/hAP8nhBcUuQcxYakQXhbLj0g4L5jaOc6VZUCY+REB7oc?=
 =?us-ascii?Q?bp2VPO3isVSqospaZnJTK84jNVe75Bkg3ENUAGAaPOSyEnbBMXstrFwAWDDR?=
 =?us-ascii?Q?PuARyXmJ7XcNe9+tk5xC7S9NpqO/qZp1GwS2T9GJzE3ERPJ3BBFVnFENQfAL?=
 =?us-ascii?Q?i/CC6DQJKOdDBZGHjwLpLWeRMa1rc5NqpeuNK3QhGmQaVFUpqXzJkrH8S9k/?=
 =?us-ascii?Q?88t63lZfFzsLWlpXSJUJlxDSKskqEk12t6FcgcCUYoQxhrGwdhuXq30445cr?=
 =?us-ascii?Q?A5VGvSTHAYhn+vOP1QdhlEEF16Xmaeg1/MC6BWOIQSrDYyZqlFJxC7SxiGGi?=
 =?us-ascii?Q?3GAsXiCusKpcEg8iT0ZUmzucJaYnX6pg0GQri141ueQu8joWfK41SevJbkVW?=
 =?us-ascii?Q?lEymF425Ciny7FvLksUG5TXvXwZtyMlDnHBxa9j0oI18ao+flkS7aySTkW7z?=
 =?us-ascii?Q?1F+O4RVz0lYwp2Jxjsq4cd5vFTaazaVceEmFraQaWPV/bmJPrjkjaV3YVxk6?=
 =?us-ascii?Q?XbUdN+oaGZ4UPQfJ2ZTLCmWTxd34q/I60qjmHdTzC6X0AhByq2z/aOQN43Gv?=
 =?us-ascii?Q?XMqKnuTe8z4XvdZlK7BENEN7IZcqguMfUAAwRKYMJzqOL9anfNwJTj0HtS6F?=
 =?us-ascii?Q?mhd+vM6oGFrvFccx7YCktPdFa3qeJg6aUxptf9teRNasBYv+2AOCI19mlQQ1?=
 =?us-ascii?Q?ZAlfbFCgNB4Ye8AJNhgfFTV2dZRaBO2GG3yTjtotxzUo7NK7cB10gG3zLDM6?=
 =?us-ascii?Q?i4CyJaHvj5Z4ll/ZCY0QHI3bU57tVQTWq9LNWQ/NiPI+cMDC6OgTjKHuFVpi?=
 =?us-ascii?Q?0HPCjvM+2GmSe6uaFc7o7CRTt19cKtvzR/axQVY2fWgbUSNK0BEPv38J2pCz?=
 =?us-ascii?Q?uVyMBpwukcEe1x6JBCoqrw+7JZLRfh3jEm3bt9XevLlfZCtjf9dGNpww5HeG?=
 =?us-ascii?Q?6mc6al3k6nqBbtaSBXLZrgy2yG52+FtT+BCHSrrwFy2w+EGKKKIJNMe6aoWd?=
 =?us-ascii?Q?8nXqAhG4kXD4YxsbeuhL9uMRpF+6omyhWgAuKXKo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb631405-79a6-4cb8-a6c6-08dac1b0a1b9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:42:39.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ygd3SwoTyqzL8nErcZ/s7YMCeHHLLSVtQjUxWaCXmy/Sb8txOrFuUUsOeRRai41B7jWwnco5DOJURto5EuKqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5377
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172985


On 11/8/2022 10:01 AM, Ross Burton wrote:
> On 8 Nov 2022, at 16:27, Gundlupet Raju, Sandeep <sandeep.gundlupet-raju@=
amd.com> wrote:
>> Hi Ross,
>>
>> I'm using langdale release and build host is Ubuntu-18.04.3, Any pointer=
s on below build issues.
>>
>> | usage: python -m installer [-h] [--destdir path] [--compile-bytecode l=
evel]
>> |                            [--no-compile-bytecode]
>> |                            wheel
> That suggests that is running a copy of installer which isn=E2=80=99t our=
s.  Do you have local changes to the python3-installer recipe? Is this repr=
oducible with a plain checkout of poky/langdale with no BSPs or other patch=
es?

[Sandeep]: We have a patch from Tim for meta-juytper=20
https://github.com/Xilinx/meta-jupyter/blob/rel-v2022.2/recipes-devtools/py=
thon/python3-installer_0.5.0.bb=20
may be that might be causing the issue.

Thanks for the pointers.

> Ross

