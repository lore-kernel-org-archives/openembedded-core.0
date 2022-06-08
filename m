Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6583BC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 01:21:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1400.1654651274188181450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 18:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=FYUIp8rY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31580cbef2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2580raIq023583
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 18:21:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=b8TK9zQYZYKpuxhiz9HfxW2W7HYV49klyZLnWd8CfaU=;
 b=FYUIp8rYSD/sT/zR1xi9RP/Bwq+iLCVfZ58GkX7QSYqyV1ugFWMMM01XnFSyr32Bl1fD
 e7/P/Bzyyb+RKhF0260yTRC7dB822ct++MMuRvbqhrUaeVMTarFNQsQoNgy7C0RGKq0B
 d0PISFrb5whbjJZyDQXHaSdIqIeqawgXWKTViX/80/nOlVEMhdZGcVGUBP3k162uCVAH
 YtcDn6gIgj3ETCA7Kn8XumGu3q2WScIzY7WLp4jGpY6muxhbd6dpqVdIB5CVLx7x7/eN
 0rczOi+0ywWBi/xzNV/dDKdhggFZsUo/6SDoNWNJC/hPwgS5M8Tfy2t0CWNhWUsG8zWM YQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmaffu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 18:21:12 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2581LCv4020255
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 18:21:12 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmafft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 18:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7TxsifmvQQqOPJ7RoxpGv/zNgrA/xAjtOT7EOd75KUmAvtYSH8NpKImQrdUrBUSTzSc2ZnsZJCs1IaEwe4DTd2dwr3bSUBvgNNQ+dchUA9g5FXU7PVQpq4rg92pMu5qFQIIhywh3LYF9qoTIiSevEime8H5W1w9vMGs7YgzL9rcEU6hlyLCqR8hQaKWS7rvkkTYe292JlV5FHU4Mnmu3TD06szYWnsLAL36PjLzV2znfZW/sxZOvxbjvmWO1wXDPimandutXtUwE9PossuFWDQY7U8qCqYNgCpniMZtU2PvsighPIsgwrX/IqOCN1WH2g6nNTCgUJQR61vBPhfP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8TK9zQYZYKpuxhiz9HfxW2W7HYV49klyZLnWd8CfaU=;
 b=PgnZjAttkJy7ku85OCWZ95SIi7L3cQSBi19vwO3gP8eC8xV7sr2sJNW+2kOfHnVVb+WF3M7RjdY29167lzmqvYb7LhYeqVhffAa7FeGdcMM/lWzON9gWb9q+BpJCt82cPVkz84IZrhlXTigtam+iowFY7VCi+4hHr/c1vN+QjEecOHhIuVflHC5tzCAyNxVmHj1zfrPHEsKRkyFBmG9uhqvCmaZjjP8azwZED6dbmlScjuk0IQo+eU8FqrfFO5XiO2M/ghiAMfOxmfXzeT800Y5qH70lj51wSyYuPeL8r0wlBMaCsKg1HIGccqm5cCaXKSTjqxSi3BWF7F91KFUrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Wed, 8 Jun
 2022 01:21:09 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 01:21:09 +0000
Message-ID: <581f3396-dbef-0360-dd61-fb1ba387d30c@windriver.com>
Date: Tue, 7 Jun 2022 21:21:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Rust recipe fails to build project on kirkstone but
 works on dunfell
Content-Language: en-CA
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: 
 <CAMRc=Meo0zQbMsG_feDcPXwruGkphWEePspjUMOMBD3t+8tiGQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAMRc=Meo0zQbMsG_feDcPXwruGkphWEePspjUMOMBD3t+8tiGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 975a7d0c-0c6a-4e0f-ffbc-08da48ed2b2a
X-MS-TrafficTypeDiagnostic: DM6PR11MB4380:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB438088FD01216102E8FCDAC9F8A49@DM6PR11MB4380.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Socdjca/kBjKVyM10iQfcQkRn8rmhHyhiSXDNLX9vJrWlsLevIMv638TzYkKIRTxJl51p65GBFhtM26Tt0bxwIyHzsybKAAFwyTBXwZ2yo4bk72LRztWWLtw/PGmVgjqwpmkOc0TWryn1yL2hyZk7vIK2UHdzfJNyXKeMOh7OTqEJdfgUE/XJAkgvq3i6XCDtwBKhGY//PKIu47muNWSqe8p0BAO80h0ZIZ+u4oQF/VpyrXBOPpskc18k4J1M7zgtj9VejjVd7QNCVV8fHkItH1/Q3sCmpFdRFwxKz9S6C4eovq26L1EaaYcXf8hKfBroHkB9r8K8jmaQgObss0ZRc0+OjBsjfhYkfh5uyqcfYPghD2ixRXhzcN2IWJdy4lbq+2LEFIfzy3Mf9gfYzPYNMPfuTRbIsLVUhuO7wiMP9k9x8pQ7aqK+JUvjTX6H+vEc16hv/NSVxgApmHU9tiPNe9RY/evptAtLrh97vCkCD0jGuTEWjRvINwjiu22E5npO49nNRKxkTnkZeB3BC+ldOQNgZUSILOzgas4Fr3tL0/SiHFSwCqSgDllB9Kpd9nooydyuCMWMVfNah7F2qFeCU3zPbGlbxSoi9HHuCcPrIY1YxibfbvMvKDfz972V2SzmPZ/C/vCKBzbntc7goRmus9+59cil12Zwqm5X1nxzRrOZGF03K/kd26OKDGFMqFAllAhoGDoy1xKjzqunGJvG4Ng8O5Ql+J5KUDPGpgL4CpwQcc4u93J9FErAdj2dRr8xhsSOE8fhPlPbc8xcFSs8S0WcT7lSwjy1ecyNbRjUyzHEFVaHdfEXIiekurDqkJfjJIuTm9Nbr6aWC/924oI2zDu3pCaIHxfE6C0l33gfmzC+PQqOmcoQUfgqlTQanRnBex0sbMEjWJupvKfDqNBRgIRHqoskwsV0AsFTcV63QM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(5660300002)(66946007)(66556008)(86362001)(31696002)(8676002)(508600001)(6666004)(31686004)(186003)(6512007)(6486002)(966005)(6506007)(2616005)(52116002)(53546011)(110136005)(2906002)(6636002)(316002)(26005)(36756003)(83380400001)(38350700002)(38100700002)(8936002)(10126625003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFBzQldTdURRa3YwUi9MajNHQ3JYRmloN0tXdVREb3Iwc004MFFqallXS1NR?=
 =?utf-8?B?QVRJbzR6Z0JmN1Y5OE9KUEdmU2hCbzlOR3hhd3Y3blN3STFyU1hOd2t1Rm9m?=
 =?utf-8?B?V0FML2xOd1FtU1hNdjZIYWNpR241WnhnMDZmR2FLZjZ4Z2VSMTVxTCtGblFC?=
 =?utf-8?B?bnN3OElTRVR6UWtBazVmd1czNEFweld3MStyMzNoVElKaGljTDVSaEhmek9C?=
 =?utf-8?B?Wnh3ZjdFME1RcTZoVDJxMW1Dc0tydzNlQlNFM09IYm14aXMvd1FmZUJyUTVI?=
 =?utf-8?B?Ulc3Uk1JV0ZpdW0wWVZrcjZUWkZ2dURVcDgyUksza1RmSUtNRVU4VWY5dE4x?=
 =?utf-8?B?TCtFemVhR0lDc0xnSTcwL3dsRUk5ZTNIbEpWb01NWkRNc0dvS2RlVnE4SUQ5?=
 =?utf-8?B?Mm5yZDVNOHJLeVZTNkZoNzZCWWdvRFFUUTJ0eGp1dTZ5amJ5WTl5RjdGVkdT?=
 =?utf-8?B?Vy82S0gzUG9TbjlYZkZhNEFuZjdaWVhIK3N1dmwvQVJjVjNSbHBUTlRFdWRm?=
 =?utf-8?B?TEp2R290RXdtdUQwWEhWa01nLzFXM2NZbTB6U3BWcjJlNWFqT3lMc1pNMVY1?=
 =?utf-8?B?M3lhOGIva1Y5VEczYU5PYS8reVZsNHkvRjFxUUhKVEFEYnlZSU42NlQ1L2RK?=
 =?utf-8?B?L09sQzRkSlUzSytNYkpmY3VVd3V6K3Qrci96aDY5UzlqWitwM0U5VkxOVzVL?=
 =?utf-8?B?bnVOMlVZOEhVbE9SOUthckVZYURmNUZiODFkZ1FGc1o0UjRNNVVKdU5wVXpQ?=
 =?utf-8?B?ZWxLNW8wdUREQWNDRWI2TnNBczZzYlU3MXhhZ201ZmlCWERna05PZUhSK0hS?=
 =?utf-8?B?WFZIWGgrM2pCSDcrRHhQSW5URVZ0MHF6L2FlcG5xaVJUbUlQcTdibFA5MWpq?=
 =?utf-8?B?Q3hxa0w1TmkxRmk3ejlQd1Uyc1hUb21uUkFsUk8rMnZqdUVaN3Vtam1kZS9L?=
 =?utf-8?B?M0pqOUlkd3FZRGhvVlJHclRteDJBTWRaNityd2NYYjhBaS9HWksyTTFDK0hO?=
 =?utf-8?B?QmRhWW1JbEhvZ29RTE9uOXo5UnVSSVoyOUFSRDVIQUNjRkxuazBKeGxQT3Fv?=
 =?utf-8?B?Rk5TLzZPZVRTMElvSFl4N1FvVWU0M3B1V2JWTkZoMm9DeExKSEdYV0JqRVdi?=
 =?utf-8?B?TGRXa2RRbHhSOStvTDEyODd6M2NDeEhYZmI5MUljaGdhUmdOK001YU9LYkFY?=
 =?utf-8?B?NmlYV09GMkdYY2t6TTdUZGpScGo5SHVUZFc5OW9rYlNsTmxUNVNLYldLYWtG?=
 =?utf-8?B?V0sxSGcrS0xJZ0RnQ2NSekpXRWlHTExSTXhPU3kraDNhR1ZYa2MzS3E1K1Iv?=
 =?utf-8?B?NFNNRlBtTFQ3ZldubFJqQTMyOHpneTZQSGhGMndQY1JLZTY5VHRsT09LZ0V6?=
 =?utf-8?B?MUtRQVZzdkIycjdLMUR3c3NkZk1ZeDFkQXZvZ0lpRHhVS0NhcHVCZURWbFZz?=
 =?utf-8?B?d0c2SXZtVGNMcEZib3dtN3FkT3AxMEpodmFzNWtXajY3SXBpOE52c2l0RFY1?=
 =?utf-8?B?OUtuRm1ZZVlWWFpkNWFCVEZDUnNTN0FUTllVRlJJZ2pDSy8vdkR2eXJhVUM2?=
 =?utf-8?B?by9INW80U2hlUG1kYUJIcXo5SnRuK3VOekNZTUwwRlh1UTZ0dmR4SXg3UDlL?=
 =?utf-8?B?Y1VST3lTNE1VbXRIdXEzVjFCUFphZDNYZlBjV2NCYmZLekxWbWZJcGg3VDBX?=
 =?utf-8?B?bEFGbTkrOEJaSThQTWJDVUNBY3EzZFFSSzZxdWx1ci9YbndBZzZpMHJINjdI?=
 =?utf-8?B?ZGM0Zlo5blNLNjVYYWNuQUNLRm1aU2k2UnRKM01mRzJyS0VWL1cybTVEUFV4?=
 =?utf-8?B?eThMalE2L1FSRlR2eUdJVDFWaXozQUlLSFFDc3JwbmhBb2VWZWVpL2JjOFo0?=
 =?utf-8?B?ZVVXbUFkdWJsMU1jMTcyNGlJaXJhVDhnZlZ4enVDMWVDdFVTK2pyaWRVdXhK?=
 =?utf-8?B?Y3ppa1NFNGI0dGp6cmF6S21NS3Y2RElpM29JM2ptYW9mNzZOb2k3OHFSSE4w?=
 =?utf-8?B?NE5PWG9mR21OZyt5d1V6RFNzeEtwblp0QUsyYXE0Q2V3Q0tkK1FoeUpFdXBs?=
 =?utf-8?B?SzZjRkZKck9pdTh0cmxXVEx5bXJEaVhQWGhzcktBZ2xMcVV5dXp2RktMZDA3?=
 =?utf-8?B?WEpKUHo5T2lMUGRjRjhrSmFGeVhxamlyWUpSK3lnWkJSSTVndzB5NXg1Skxi?=
 =?utf-8?B?RUQ5MlAzL2FoYmU2SjdXU0lldXpMek04WVRtY0FZNnhUUlh4anp3bUllRkkz?=
 =?utf-8?B?Y0hiOEIwVHpUZUhJOTJDL3pwb2wxVlI2MGc2VGttMFNyejJLbTViQzNTWVh5?=
 =?utf-8?B?UG9JbVRycFY4cEhiQWJsZk9pOEZYdFhmdldDaFY0Sm9icWNBL1FBOWtBNzBr?=
 =?utf-8?Q?zTcwAM/OibZt/FKMN4t/C6Q2CNe/aR3WJfCNM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 975a7d0c-0c6a-4e0f-ffbc-08da48ed2b2a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 01:21:09.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uzSCND+IF5dOx/H53eWjHycpwuussyXWl6OFRhoggFNbnFodP/Xg3trTh/RU5EvNhPLvUOEjXXAszx9v9p315PE1fPcAj2lNOdv5u7h0w18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4380
X-Proofpoint-ORIG-GUID: 0PRSxBiF0BMrWGfBB426ZJ0hOXdj2Y2e
X-Proofpoint-GUID: lm-yVLdLs79R1_f6oSvSH0rJTvPLHoBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=875 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080005
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2580raIq023583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 01:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166690

On 2022-06-02 04:23, Bartosz Golaszewski wrote:
> Hi!
>
> I have a recipe[1] for a rust project. It builds the gstreamer plugin
> for streaming from AWS S3 that is part of the gst-plugins-rs repo.
>

> I'm
> upgrading the system from dunfell to kirkstone and trying to switch
> from using meta-rust to using the rust support from openembedded-core.
> The target is aarch64 and host is x86-64.
This seems like something you would have=C2=A0 checked but

have you tried compiling the exact same code when using
rust-1.59 installed using rustup outside of a bitbake environment?

>
> Unfortunately the build fails on kirkstone with the following error:
>
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>             ] 132/25=
4: num-integer(build), quote...
> |      Running `rustc --crate-name iovec
> /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linu=
x/gstreamer1.0-rusoto/0.6.0-r0/cargo_home/bitbake/iovec-0.1.4/src/lib.rs
> --error-format=3Djson
> --json=3Ddiagnostic-rendered-ansi,artifacts,future-incompat --crate-typ=
e
> lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C debuginfo=3D2 -=
C
> metadata=3D16f5461729d008fd -C extra-filename=3D-16f5461729d008fd
> --out-dir /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv=
8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-linux/re=
lease/deps
> --target aarch64-oe-linux -C
> linker=3D/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8=
a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/wrapper/target-rust-ccld
> -L dependency=3D/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/wor=
k/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-li=
nux/release/deps
> -L dependency=3D/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/wor=
k/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/release/deps
> --extern libc=3D/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/wor=
k/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-li=
nux/release/deps/liblibc-f4d4da8aaaf5cc3b.rmeta
> --cap-lints allow -L
> /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linu=
x/gstreamer1.0-rusoto/0.6.0-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=3D/home/brgl/workspace/veki-kirkstone/build/tmp-gli=
bc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0=3D/usr/src/debug/gst=
reamer1.0-rusoto/0.6.0-r0`
> | warning: target json file contains unused fields: has-elf-tls
> |
> | error: failed to run custom build command for `num-traits v0.2.12`
> |
> | Caused by:
> |   process didn't exit successfully:
> `/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-lin=
ux/gstreamer1.0-rusoto/0.6.0-r0/build/target/release/build/num-traits-399=
d85941461afdf/build-script-build`
> (exit status: 101)
> |   --- stderr
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   error[E0463]: can't find crate for `std`
> |     |
> |     =3D note: the `aarch64-oe-linux` target may not be installed
> |     =3D help: consider downloading the target with `rustup target add
> aarch64-oe-linux`
> |
> |   error: aborting due to previous error
> |
> |   For more information about this error, try `rustc --explain E0463`.
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   error[E0463]: can't find crate for `core`
> |     |
> |     =3D note: the `aarch64-oe-linux` target may not be installed
> |     =3D help: consider downloading the target with `rustup target add
> aarch64-oe-linux`
> |
> |   error[E0463]: can't find crate for `compiler_builtins`
> |
> |   error: aborting due to 2 previous errors
> |
> |   For more information about this error, try `rustc --explain E0463`.
> |   warning: autocfg could not probe for `std`
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   warning: target json file contains unused fields: has-elf-tls
> |
> |   error[E0463]: can't find crate for `std`
> |     |
> |     =3D note: the `aarch64-oe-linux` target may not be installed
> |     =3D help: consider downloading the target with `rustup target add
> aarch64-oe-linux`
> |
> |   error: aborting due to previous error
> |
> |   For more information about this error, try `rustc --explain E0463`.
> |   thread 'main' panicked at 'i128 support was not detected!',
> /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linu=
x/gstreamer1.0-rusoto/0.6.0-r0/cargo_home/bitbake/num-traits-0.2.12/build=
.rs:10:9
> |   stack backtrace:
> |      0: std::panicking::begin_panic
> |                at
> /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/x86_64-linux/r=
ust-native/1.59.0-r0/rustc-1.59.0-src/library/std/src/panicking.rs:525:12
> |      1: build_script_build::main
> |                at ./build.rs:10:9
> |      2: core::ops::function::FnOnce::call_once
> |                at
> /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/x86_64-linux/r=
ust-native/1.59.0-r0/rustc-1.59.0-src/library/core/src/ops/function.rs:22=
7:5
> |   note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` fo=
r
> a verbose backtrace.
> | warning: build failed, waiting for other jobs to finish...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 134/=
254: num-integer(build), quote...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 135/=
254: quote, http-body, typenum...
> | warning: `paste` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 136/=
254: quote, http-body, typenum...
> | warning: `http-body` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 137/=
254: quote, typenum, openssl-s...
> | warning: `iovec` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 138/=
254: quote, typenum, openssl-s...
> | warning: `rustc_version` (lib) generated 2 warnings (1 duplicate)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 139/=
254: quote, typenum, openssl-s...
> | warning: `quote` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 140/=
254: typenum, openssl-sys(buil...
> | warning: `httparse` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 141/=
254: typenum, openssl-sys(buil...
> | warning: `net2` (lib) generated 2 warnings (2 duplicates)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>            ] 142/=
254: typenum, openssl-sys(buil...
> | warning: `openssl-sys` (build script) generated 2 warnings (2 duplica=
tes)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>           ] 14=
3/254: typenum
> | warning: `typenum` (lib) generated 2 warnings (2 duplicates)
> | error: build failed
> | WARNING: exit code 101 from a shell command.
>
> Not finding the 'std' crate looks like an environment problem but I'm
> not sure what's wrong. Any hints are appreciated.
>
> Thanks!
> Bart
>
> [1] https://pastebin.com/iCWpj8Ch


Naveen or I will take a look at some point and at least let you know if
we can reproduce the error.
Can you try using the master branch to use rust_1.60 ?
I doubt it will help but it might be easy to check.

We might need you to report this a bug in bugzilla.yoctoproject.org
so please create an account if you don't have one already:

 =C2=A0 https://bugzilla.yoctoproject.org/createaccount.cgi

All for now,

../Randy


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166464): https://lists.openembedded.org/g/openembed=
ded-core/message/166464
> Mute This Topic: https://lists.openembedded.org/mt/91495505/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


