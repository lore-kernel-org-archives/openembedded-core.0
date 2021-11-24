Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE69C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:43:52 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.40])
 by mx.groups.io with SMTP id smtpd.web12.1310.1637775829890017862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=l75srF+V;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.40,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpCRBsY8/sJjXulDUJaqTdROL9/0MwpmIJ5qld1kEqN4Rq86F3RptsQ65PDI+ONtM0VxB1AynKx1a0Yg8L0O31ENkCEusVZqDvT12QKHiGVBYxJrE4bJUgs8xu6AeEfWBpwAWSx3WzGbnnlSt1ilmx63ULj67Xiw0OX6VvYpGxK9KPtckVl1lrDVHGAu49kq12Kw8gSBsPFBG0cjEqlfICPhdB0NdODPZTEKCF7o/XGhW4FQFv4BODPuiYb8BENfWka8UevO8lx31Y2dbRDpdHqxXJTktf36dnouHrZlbK/DDNG/JRyF4wTIOn5UPB8ZimBZ4TTzgcFzT73AqMs3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiuXwIMzeQ4eMnaGejWOwy/Ap7oblIv+bNXjG0Bk2IE=;
 b=Hq0ScBE9gBaHzx9+RZTsWhErbM8tbnPZy9um+g3Y7ozkd5fZSbNo9XikcBy9B7gUUzP+vTT0lN0R9XuK+XPMQqaToMbrdbAYMrT2sDDq1qjNGnuZBYznU7YXS5IyCpzwzALPI7IV6qcCJ2PjxBt31aWuVLUG/wBxa1ez0PLVbjxkYZ16/QS3JYszV2yniy+RnJ44YdzE0IJOI4lkkJ7SFz7WFIhHDSJg5i7/MqzRIdXcNsWl7y7fLdchJ8+7ctmdDS5nmZkUsm6ttFItSxHnu2n3s0/DQyuljUZMdY5125u6x6MV3dS/G/igyrAZK5+3Cd7d/oJHrMS7k0f4+b8yEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiuXwIMzeQ4eMnaGejWOwy/Ap7oblIv+bNXjG0Bk2IE=;
 b=l75srF+VV9rieS1gFFuu5f+BnUQ+jQPOtZORUiAUDyiNXIE2xiEn4oJBkzuRVfK8NbzhMrIaIg82e6fhOnj8MZdt+2hT0woGWe3NYP/5F8SKwRqON9v/l7g+FBub2zu01+LvbJyDfMg3vqxZvFehGAr25h7icJYRGeDga/ny55Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6303.eurprd08.prod.outlook.com (2603:10a6:102:e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 17:43:46 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 17:43:46 +0000
Message-ID: <e09a78ee-ba5f-14fb-9957-34dabe19aa06@weidmueller.com>
Date: Wed, 24 Nov 2021 18:43:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>, Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
 <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
 <CANNYZj8njWL15rHq2rmOMtZPMJV24f097SBmTkF6O8Nf=3oYZg@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj8njWL15rHq2rmOMtZPMJV24f097SBmTkF6O8Nf=3oYZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0298.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::6) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.208) by
 AS9PR06CA0298.eurprd06.prod.outlook.com (2603:10a6:20b:45a::6) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 24 Nov 2021 17:43:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d757e46-840f-46fa-8a86-08d9af71f70f
X-MS-TrafficTypeDiagnostic: PA4PR08MB6303:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB63037210AE1CB0F4D4F93324D7619@PA4PR08MB6303.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4b/C265fTLpnvLWWpM/CPzCd2EOw3UkU63eSOdcyTsaF8hnh8LgdnWtJ06ilyJpIhi8jInkwSfbWtNR8g6HFOMi0xugED7rQT6UcExfEy3bRSNIJLFGfTFdBmr+LAZRy+TwZq3m+rChQSzoNEuBqj1CuZY2+Wmr+ngLh/JeeG653Gb3kKQTPF2+8dDnckSMNvVxddZlcvJ8WRRXvuwdZ6zrZ1ypd+jSINoDQxUJP+lM6QTnls/WK8cAWq63gtkg5u5IlZ7cZHDLCxKISNoG7J0s4DxtEK645owxm0um2li5v2HWnguXkL14WDrM4k/mvpyrSaxs5o6PZNcd1SjnmnbaWthaw3ERMM7Ld+cl7/m8DtdWx7E1eJUzcTbFR4oFNZgl09cyUyks6Wg6yBtUZNioDqvVdYTXrYubWsGkxnLFVEGiYevxFx5TMYliyBkSQPM1C6D8vKsgLNHvTW+Yt9sYYHuMhl49stxfVrOExn5olPObSRKs0udFdDou9RNpVy6g8VX/etBE1ExOH6lcmruZxThnacfVhu4AQWGHXJrCdDR8Z8uRAiioSp8k9a+Es8fxvpEa1uyEgPPBIhYhnda1Fo2X18u58HcXS2HCGWLOAoyEOod/NJTxzpHwn5hIzX60dyvK9pyZG1bEhp8Y3bjNSWrZQusw1hCCW8dlFKnR2dn3h1TTXBmTiFrPFT47c5AhPYA7SW5sa5HoPvDq5xVZVRtWBcHF1rUYvyeg7N/o7TbWEhWQdgPeh9s7hd0SM1uQkeBQEtu5In+akeOvtrbk2qNBKFCHAotikkvC6FTenZR4+08tjSwHXFdAzixgy6xPPSqQHofnjPHKQNN8Ncd8s3gNwg6u+ACCqFSEFALo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(2616005)(36756003)(31686004)(66556008)(186003)(956004)(8936002)(16576012)(54906003)(86362001)(66476007)(4326008)(4744005)(6916009)(52116002)(38100700002)(38350700002)(107886003)(83380400001)(66946007)(31696002)(508600001)(26005)(6486002)(8676002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUdIcXhvc29hSVd3UnI1M0U3RGRtaXV1WEJtL1J1YUoxZFQrMXE1RTkyK2g0?=
 =?utf-8?B?bHozSVVQRDF6L1JCMkIrNHVCUkcrUXFYU2UrRGc2OWJRcG5TSlZwblQzazRs?=
 =?utf-8?B?TmI3S2hiNFlKam9nWWJ0bm1ZTU5jRThBRThNeWZMYW5LWDRyTWd4OVhaYWxy?=
 =?utf-8?B?bHhBZXV5dWRXMTBjQ2ZvMjJEOTJiZ3ROcUp3OStFMTdiOFZmL0h5VEFvRU9F?=
 =?utf-8?B?RlhsOVZVYmxpTk40alF0VXF0QzRmVHJueWdrTE1aN1JRY1pXVDBxQy8rVFlr?=
 =?utf-8?B?TGl2blRsSm5NeDRQY1FsRFBPdVBYcndScGJUUVhXRHVWQXNyZXZMRGhnWXlM?=
 =?utf-8?B?KzFNbkRpNWZEOXpKZ2lkQmNlZnY5Y3hOVkdJRExycTVVbGhZRGZHb20wNktF?=
 =?utf-8?B?N2FmcW5nK0IyOHpaQUNqemtYWkJEQmVoZm5ENVVCSWlNR2hCbkpGZGF3MzZM?=
 =?utf-8?B?S2FjbkE2akdNQVpmT0NoY2dZeURrN2t3dmhVNkdycm5YV0dYMWN0Zlp2Z0pm?=
 =?utf-8?B?b1lMc2U3ekFXblF6VEttM0tUazlCNGNoaU81YXdMMjhqcnN2UmlzcU5pT0Zj?=
 =?utf-8?B?SHk0d0pEcklzMVI5bGFFUmdaRERyamxpWWZvQ1lrWHZPSnhxVjhOdCtTSzVt?=
 =?utf-8?B?Yk9aRnhhdjdsdVp1QTN4OGtzZGkySldiTGdhTk1tOHZHU1FtcDRpb256UXVV?=
 =?utf-8?B?MXFoeGdtNWhFYkF3b2ZmcDhicnhyNVdNSTBJVkQ2c0JobGE0WWpTQ1FtRXg5?=
 =?utf-8?B?cSs4YjJDb3plVWYvVFI5ZFpXR3ZlckxJT3EzS2VtK29UVVJ4Z0RUbzlkZ2I3?=
 =?utf-8?B?YTFiUStpKy9NY2MzM0wya2RvYldUNjdmT1pVTm9OMnBOWDE5OUV0K3RiNzYr?=
 =?utf-8?B?ZWVxYlNiS0ovU3FzVjlsM3lRMHM0Y3VsVW5tQjlYeCtoMGJ0MVdDVmg2bGlT?=
 =?utf-8?B?V1gvOTVWSUswb21sUG5MUDBQTDJPbVBLVk9Dem9xWVpIaG93UGNubG9KWlJi?=
 =?utf-8?B?UmFHWGM4QjNKcXVNVFdINFpOWTVpWDJtQW5HS0kxVEZaSGxaM05JbUJKUHE3?=
 =?utf-8?B?TVpyNityYUtEK0toaHFva3N5WDd4NDVub0U0RlVaQ2d2dFhOakFaR0RPUCtn?=
 =?utf-8?B?czFqc3orVzVOTFBpdTRDTkhxamp5cEY2RUNmZXZBeENTeWdtRytpN0lUU1RP?=
 =?utf-8?B?SjlaNmdEamlRQ1FRM21mL3NUZXRQY01LakhKYnNkWFVRU0pFZEFtMzl3dkJ2?=
 =?utf-8?B?akJPd0FrSzlIaGp3Z056bmRYVEYxd3FmTk1SQy9jdjhGdjN1VkpVNVFYbXov?=
 =?utf-8?B?R1J2MW95N0FlaXF2clVod2g0UCtCZVZpem5QcWNiQ3RLVmJMVVcvdmhEYUVW?=
 =?utf-8?B?NXBOdmZGRUdtY29aZEx5NW5TZWVodmVxeGRHdExXdHBWODB6T2lFZGpoTGY0?=
 =?utf-8?B?ZjBvN09mZ3hhUWRacS95MmpnUm1xOFJmZFdJV2praHB3UVlyYTB2NEJKS1U1?=
 =?utf-8?B?MGducmJhdVBGUjF6ZGFlSFBHTU1YeGZ1Rmx1dG9EcE5SWXpaL3ZtSmxwcGs3?=
 =?utf-8?B?WS8xdU5kdzN2N1RlRkxLb2xTOFpBSUZDZTZmcjR1QkoyTDlVRXJmUzU5M01a?=
 =?utf-8?B?V0N4QTJWS2o3OG5VRnNTY0NVZ1BnWi9YK3Q0YTBjZEZ1MnVwbi94bDhxZlps?=
 =?utf-8?B?WmlUcmtKUURDYWl4NUdqWkovZ2dmSWtWWHo2LytTYm40Q1lDNWhzeGpldERP?=
 =?utf-8?B?NVRPSkZnUVQrMU9kRVNGbnIvSHd1WnhMN3ZVUERzSjB5ci9sb21JUm40bjNX?=
 =?utf-8?B?ZXlDWEVUM1lJaEF1Qjd3M0ZEK3hwbHh4NE9HbGlBa2l1OEhPdFJrVkVUYUV4?=
 =?utf-8?B?V1EzbDRHMjd1S1VYWStPV1pkek96SUpVTzRoV1FUUFI3d0hrRVlJcExEamdo?=
 =?utf-8?B?Yjk1dkd5dkpIbzRiY2Z6TG53R3JrVE9UOXZvVjllcWlTWFR6a3RDSmtEY0Nq?=
 =?utf-8?B?TTl4dWtsYzRoVXRWa2JubzBvbG9CeGlJSFhnMmRlZFRpN21yQnlrL2dTQVU5?=
 =?utf-8?B?eTlTdHBMcFZ4eTBKUVkzdzAyM3E4aDcrcnBDQk9SdnBUQWpseEcrQXVZdlA1?=
 =?utf-8?B?T0lNZHZTbWJqdEhiODNwdnJqcjNLNERtcWcvdk5BaVB3c3hjZk9DTkxGRDZ5?=
 =?utf-8?Q?WLfxEPW8RcD7zGmp0jlZeC4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d757e46-840f-46fa-8a86-08d9af71f70f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 17:43:46.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L5jDEkvIonviM3Tx+I3guGyAi0FHK9q/Sz+ONN6UNuIt4JB+8cOQdoR+JwGU4FEJuv4NkGL7RQxUFYOUxCiX4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:43:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158733

Am 24.11.2021 um 18:14 schrieb Alexander Kanavin:
> On Wed, 24 Nov 2021 at 18:11, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com 
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> 
> 
>      > and shouldn't the tarball be fixed instead?
> 
>     How should we fix a tarball from npmjs.com <http://npmjs.com>?
> 
> 
> By submitting a bug report or (better) a patch to the maintainers of the 
> tarball?

The package is only an example and fixed on the fly by npm install.

The world is different in the npm ecosystem. The package is 2 years old, 
have no maintainer, no repository and 4k downloads per week. Furthermore 
you have to convince your dependencies to update their dependencies 
after you have fix a package.


