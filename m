Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6420BC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 21:39:03 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.122])
 by mx.groups.io with SMTP id smtpd.web10.6181.1691098740695310823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 14:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=hw1w6wc3;
 spf=pass (domain: ni.com, ip: 40.107.96.122, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvxmaMt/Dps3hxnwbOsgJ1PJTWW0IaZiGS4dHkgQeZSeBPOgTiJ/w5ffIcCUqPmxnPH1Az5H96ifVra9OgNF4XQHfiRe735474LnrcMIIrOGRdghycqFrcnM1UiTiVAH/65gu/ivD2lyCNy7r9pdlW7Cbj2B6X39VZ7symtkcHeyYuMNkXFX7WTy7upsHkXc59npheRLoRLk3H4TMhonhS4bODlBltm7QlQHcCwxwLRgeAg6/ozVLaOMLEwzOTisGi1fF1j0tvknISM/6HvHRmDsk7mNPV1TP6HEez93P/LmpmMIl3Qw/HWFRy1v5tNfjyA27jo3zXsWf8he3JXcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq7bqSj8zX3ovEtIKJONzNDmYzTcLVtTlE1MAy7j7JQ=;
 b=Yj1AcVZXo8ltyK/1KRbLCOZoWiSsW+w2kGMd3zGTaD0JNMHlYJNeijUTkZUpNvlO5xUkhN/t5pPYbCK8205b7FJvgv36A1/hCsHwxusefXpKyDwjNfv6UTVlOpLW86Ct14drpnBUS0CiDKbvg7Z1ox5AXbgoqlxKIvMZFxnR+nXD9lm7KsXmp1GMBmfZfK9Da23op102JcfoG1k76IoDtHFaovgj8HiJabY5jsfvG8u645902BNjvx6RWIaEjvr0+Zx7bGf9AujiUxUCUwtonblmc0QRrzU0xBh8gPQla+wYapTzJJeuusL/njZdUqokC4jJ7buFj0ug7tdkpwIrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq7bqSj8zX3ovEtIKJONzNDmYzTcLVtTlE1MAy7j7JQ=;
 b=hw1w6wc3A/b3vIRGmWwxfg+Fh2K3uToHsQftuvsTZFfWWxrFwEGnWFddGVsGJ3ioBu1DCJETgt6YgibRDRYzSWI8yUXr6GJ3+DhYemSzzxNjBUSg9Rja/m0bkIMAXhQxZmHhhLvrOOnk4wAtiYyR/hMFAQEaafRxwDV0xJvmkbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7757.namprd04.prod.outlook.com (2603:10b6:a03:3af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 21:38:56 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 21:38:55 +0000
Message-ID: <c0dbc400-6eab-1f1a-b4c6-9246c009c7c4@ni.com>
Date: Thu, 3 Aug 2023 16:38:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
 <20230802214019.1068795-6-charlie.johnston@ni.com>
 <FC248CF6-314A-4991-819A-FC95837BB82C@arm.com>
Content-Language: en-US
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <FC248CF6-314A-4991-819A-FC95837BB82C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN4PR0501CA0006.namprd05.prod.outlook.com
 (2603:10b6:803:40::19) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e88454a-bc22-47f7-ad1d-08db946a09d6
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dWZJwmZpgRwh1AWPlsFIGQxqWgewevh7gP3KuZDPpEipqED0E5SycjRElY4HwlyKeTeCGty3e66rz8V+Y8g8dq6fxhzY+bnkoZEQW9Jkdyl6UcQ9HW06KMdGTI3Fq6VnGVpjVCm02gP5UHvLbqXNhR0W6awWK4JFjmfJhKypSlGTSAoUQh/ScSb+4jphD0JO6PhO0yXlNDKt2ns0HcT4oI5POAyuq8PPiUCUGDPVk9ZvbzQNt8/nXDOH+Ux0/ZHm9zFEAlRxUerCYfxwv2kuUN7mWqSIX7PQDDT7gIWo5n4UtKmVyKL+puWDWbQhtpp+KRYUyvaJw3QcC9Skn2ZqBRC8P+dvpQAAmOU50TKukdGWU6bahrFIa34cvZRgJj4pb15TjYzFXv/DypxHFRhBh1Pn//bqruSYq6eVuqcjOXCffvkhuKI2nJkkqZq6appWaWfCeNQ1UHjl6cSSBAbRJghFC8JzgK09fry81eHheRRa9TVbf9fT5KE9WqEWGUTZeAoNlYzZx2kOLKy6b3OyOhg3t1uZoDuve/1p3OEUNWoh3TyzkytxgGdEvTuMRb2VVYXKQ+BvITUkrAVv+rJaUhl6YlRRjBoWz/JG0SvIRJRfU+Uk+/fUnVk2Ofs96W13y2VT1WD97bWipfmYXX7POcZnq8IqjCowiq18MVbdClM5ceSIX0SNRwMjjYb1f9gl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(186006)(2616005)(53546011)(6506007)(26005)(8676002)(316002)(66556008)(2906002)(4326008)(66946007)(5660300002)(6916009)(66476007)(41300700001)(44832011)(6486002)(8936002)(6512007)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(547064002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2OvJyKdS9brjJluhvzKySdxDtf+ffAgXbLaCn1+UIwZlNN3rYJAqGAwnqucM?=
 =?us-ascii?Q?g6ATLkKXkiFIUfWIf4E2Kt6MjM4AGLC4qJf2KsDIbQ98MFD6Dd32KmlkXa7o?=
 =?us-ascii?Q?O7o6J+nMIsCCw6NCOY2/uzF9C4XPejmRKbjhqcOkZq+Z3ggY9mMEOZo2iTXy?=
 =?us-ascii?Q?8HWlhGsjHu/3TMVBExNRJlZMrp+izwG38ZU/Fgf1RdAkUG/gc0gRaM2Mbarz?=
 =?us-ascii?Q?odJbSwYqKFenw6JEG9NlWtpxV+CHkS0AyFN/vK6GepKQiHXk7PY+bbWdMDq1?=
 =?us-ascii?Q?KA77PjlM/chm4fwSKsUPGylDPE4Qcoj77F8cBlJvozZpn0tXqRinc0E0KVxo?=
 =?us-ascii?Q?RAAHlm4/ORUzSQaTwbxT4DuK5/qZcNfdH9rAYKS0ojrbMH8/O8a6L9iPpejF?=
 =?us-ascii?Q?MuRC8j+wR7HmJ9YgLVmprDRThlyLIohGfOs221lZzZZxtwoYP+JlZ33TCbXw?=
 =?us-ascii?Q?orW5vONpyDb7AAvAcc56NsNRnAjOdWJGFhb38xwzXdm/7Uq1W2WtkvjXyCz9?=
 =?us-ascii?Q?hdqA2prAQhmpLTvFhsve85EW6h1nWDBtDLDmMQNVrTs17vsAiy9UpQOeWoMx?=
 =?us-ascii?Q?oDH0aWOErmQuNo7FH/wtz5Cw/6GBmy1K+RE+jSwiyAC6IvZji4TFGbyvjUqc?=
 =?us-ascii?Q?XD5wp36FF0I5Lq1zrKoha9ssc9vE9EesAruUhOE9v80uEv3ZW2rQgKH5M7g5?=
 =?us-ascii?Q?AnyT7kcXIbTRwyCynGu4gTsjvflZPpDA4QnGtsa+z2mx4Na8MMH1Eu3eOFFP?=
 =?us-ascii?Q?XkjO/wQVayGDiMBXvqB32QUH9ooaBjYsUc19AEy+57+z7gkpeKxREZvQOeoy?=
 =?us-ascii?Q?oxWD4SPN7YZM3oEdLS4hzUktEXNMZyLfOAwtAx+t570fj6RKqbX9IjTw4+k1?=
 =?us-ascii?Q?wiNYb636qA2JANsb1bEL9dXFvZKguVpxguo9iKCt1h2JRVOf2SHFfa9XuoEP?=
 =?us-ascii?Q?a5WdU4b595g0wRh4RIZJlGcURugeCYyoDxwiESOMj3Pzqde/1a5tkTWaQXIo?=
 =?us-ascii?Q?8C9IGWxb6t/JW9cNSHq7KqebOjQRw6ZCHfAzuZtN3xRfk1RaSF1w8iDY6nME?=
 =?us-ascii?Q?hG4/4h+AickZL6HaYz1NjqeRlT0RQ6vOh9TgJHBrQbpPnkSv795xB2rIm3mG?=
 =?us-ascii?Q?ylSOK/SnG9U0U74SvUPjVU3iYY7+jsxIhVgmzGT7hjtY/uAWBsuoUucNddms?=
 =?us-ascii?Q?XRX61McfOS10rbEfbkv+IKD0mgFtIPTcuK5w3RGwGm4GiqxJ19K2i7DQCl+E?=
 =?us-ascii?Q?4dYq9QFGQySZOgKvE6QhQh1f/tuOwpaalp601WnnbhnLTBTQMkYrwnrIztvW?=
 =?us-ascii?Q?UQMJbJqQsOBYcvkpp4r3G10OTUZI8LZN4/8PRy2slz5KDo4y113eqK91qnEC?=
 =?us-ascii?Q?O7RFlJ6IEFQIa1SNUqmSNNytVdsWGjAutUisjgl93RBpie1Qb5n3KeG/yagN?=
 =?us-ascii?Q?9UTVgxvG6y8Yo/YiPdsq1ttfzYQs7GK7z02OdjqZOKXRkBiRR1zppDBb6f+U?=
 =?us-ascii?Q?yDOREuB092sdA6tuGZOCfnGp2nT0lf15r7KdGhNlTK91vClpkppFRUBAQI/I?=
 =?us-ascii?Q?svsEL3bnDMtGTgMjCcKp6PT50bDSsWpaJz5JK6N7lylnX/etjXQELMq8PFMM?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e88454a-bc22-47f7-ad1d-08db946a09d6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 21:38:55.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsCS5vTH6jB7IiVVNdts2qJfbksS1c6WS9YNUmINV7RJ4TiB25DA5YgK/T67VFCnvnaQ3ceN6UVOW7Q+QKYDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7757
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 21:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185502

On 8/3/23 13:32, Ross Burton wrote:
> On 2 Aug 2023, at 22:35, Charlie Johnston via lists.openembedded.org <cha=
rlie.johnston=3Dni.com@lists.openembedded.org> wrote:
>> +++ b/meta/classes-recipe/packagefeed.bbclass
>=20
> So this is a recipe-scope class which adds a task to generate a package f=
eed before do_build finishes.  I imagine the usecase would be that you add =
the inherit to a packagegroup or image that defines the scope of the feed?

Currently the use case would be a new recipe defining the feed. That feed c=
ould simply contain a packagegroup, or multiple packages or packagegroups. =
I did consider leaving it up to the user to determine if the recipe were
also a packagegroup or image or similar but I currently have packagefeed in=
herit nopackages. I could be convinced to go back on that.

> Personally I=E2=80=99ve often doing `bitbake package-index` to use the lo=
cal feed on my target, but this class wouldn=E2=80=99t be useful because I=
=E2=80=99m not just building a single image and if I want to use the feed i=
t=E2=80=99s often because I want to add a new package that wasn=E2=80=99t i=
n the image before.   All I want is a way to ensure that the deploy directo=
ry has an up to date feed in, am I right in thinking this class doesn=E2=80=
=99t solve my usecase?
>=20
> Cheers,
> Ross
I don't think the changes address your use case as-is. If you used a packag=
efeed recipe to build all your packages and used that packagefeed's directo=
ry as the local feed, it might work but you would have to add the missing p=
ackage to the packagefeed recipe (or a packagegroup in that recipe).
I'm targeting the use cases where the feeds will be deployed publicly for u=
se with images and (hopefully) for some future quality of life improvements=
 to BUILD_IMAGES_FROM_FEEDS. I'm open to any ideas that might cover other u=
ses.=20

Thanks,
Charlie Johnston

