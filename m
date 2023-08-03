Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E0C001DB
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 23:53:55 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.139])
 by mx.groups.io with SMTP id smtpd.web10.313.1691106829028048696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 16:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=GbiIFmit;
 spf=pass (domain: ni.com, ip: 40.107.92.139, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnEmRmV9aqGMzjaJj+BYjZ+lr3H1SMrNxZPIQban3ge/oNZQDOX73YW7bQeprflFkokWe6gxlPFnUbNm28eVLRlq3X3O5QXWZd2mVRTmkVCBDN7762ZgxBztt6y91yIEPwENpL3HWKnp7DfwG78DZcnQZaMtl9PVlibpaGzaxCQ36dGkyrMY1HpqDQkhmucrRumHDohthcrwjxcI+AEfU2yLhiwwvD0d6rUtRfoJvTMtCWplNZoZnE7KYPa3DPQYQphu0RxV9Z5P//OeAT17QsxAqihR5S4AOZBgyQP0WMiMCUuMxPWbN9q3fukkArvOzeISATRmNZOZUWYeM/H/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqGHRr9OuYHV+YzoVfOUyVPXCwNRGPkvXtT7aBaEagw=;
 b=XJX/37vz6pZRNpYulCH48fmdhv0/2r6GPXI2W4GOug73lJpLWlVWyO7KKOw+oS6P3GJS+oQw+HdGeb0B1WaUvtaxGzbI1gvDsMrv75mnI0m1Ykw5lEQwinu8zGZFE7myBZ58eId8AUOIRIPfle7z6FNrGx3VdrD0DsZteS8VoknLZo+8prIQWU++mdL3a8sSCVr48eALNhxOGFT4dMQzbeUOVnw6K2Uw3xs+lWWzw9Nlp8bENMDTCtXCEp8IaPvwRQcJDGoqjGyaqCZaSgB4dJFD2FWVI+imjFHX6l3Hg6KLiCyN3Q7KDyooZyxRU4jeeqfceB1IYu/trvCWGboysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqGHRr9OuYHV+YzoVfOUyVPXCwNRGPkvXtT7aBaEagw=;
 b=GbiIFmitFoAX6/lAXi0+snnprw946/hP61UNrwzQbeJoCokfQT+XWrBPVNX7VntZPaHmzCpMWBkzf+aAHVxf5ydvjh+sQUjBm3QsniB4v/3rQEdYLpJa4koKp3B0exyx8C5QMwXCTqJvdg2OIrMGGvQ+L/jYG0ywSjxBDfnqGsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by PH0PR04MB7317.namprd04.prod.outlook.com (2603:10b6:510:1e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 23:53:46 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 23:53:45 +0000
Message-ID: <36a2aa5c-e417-7ac2-f669-0c0a712c4325@ni.com>
Date: Thu, 3 Aug 2023 18:53:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
 <20230802214019.1068795-6-charlie.johnston@ni.com>
 <CANNYZj9djkn0bxvRnNyvwNwUrMx6hHuAPwSwD9QFOWhEUb-rAA@mail.gmail.com>
Content-Language: en-US
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <CANNYZj9djkn0bxvRnNyvwNwUrMx6hHuAPwSwD9QFOWhEUb-rAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:806:121::24) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|PH0PR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: f3298f09-8e69-4a10-9953-08db947cdfe8
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESNAdz2crVBbcB4W484yhRindNqAKrbhrRp48Qr8+tbFNvfPeUgpMQUOmKwoNSI23xS+EhGD7o5xfo++nX0nBM5uMM33bazAiJRlkAKOs2Nrl2MaeYG1DZ4NqGzPblYpb0ekRsIh4VnrP0AQuwm7cRXjdWM9SubOOMbEvJw2JKwcGxMVtTuI5re/kxHc/BxwjmTms306Px88uWA/vVfJH0eCpc68QG99H1Xm8TUVOcC9iz2T8kthpzxaSwFDWlUAZTt2ln134CKe2Y74fJ1WbLXP9nYkcEMeqlW0rButaVK0Ljgw5MkNeWwWVihYY2Zl36k9dCL5ewg8jYY3so5vOF0pz5io6bpqUC0bMC8ERJmUX0K77O6OfEwbUHCvrfu9Tti0s7EQY9wQia7VLFZw7TWK2GQCIhLJauKGane8szoB9ulM152Sx7m+whjK1cCTHk91r/9hjKfcJq6/gzePbbDzuZJny5JcvtQecB3dEDQK+gqwzCWpdy3oJq+dNA85x+6rGI7pv/HskYzllSTcdBetfGQDqXiU3ztbLqcAWyWUUL0ixGPNkgYSx5XdDCb+ThKSoKa/XrGbSwnpx7ICECDLMmpOsCY/vP621ZiRgqa9QyR2eM5OVcoYbAbTMW8zRfc3sOYjnIJ5QELwSzm6qA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(1800799002)(186006)(2616005)(83380400001)(53546011)(26005)(6506007)(8676002)(316002)(66556008)(2906002)(4326008)(5660300002)(66946007)(66476007)(6916009)(44832011)(41300700001)(6486002)(8936002)(6512007)(966005)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmpqZlU3WVh5SEM5aE9zSlp5b2pMTTcyc2h5dGhVNC9HdVNBeWxXa3gyMC9P?=
 =?utf-8?B?RHVEZlV4cXJWS25xVXU0SURzQjlBL2IwUW5FVGsxTDlSL0ltVmZUTG9RSXI0?=
 =?utf-8?B?d1ZCQmpGaFdRSWRpaXYwMUpJVU9Oby91QWNRQ2xSQlZLWDh5NXo3MkRSbkpo?=
 =?utf-8?B?dkJ4aU5Lc2dPNU5Yb05yN1RCNTVuYjBDTGdLMFdaaDBCRGlwZXFTOVBLRWtv?=
 =?utf-8?B?QnIreVBtakhVMlowbFlMdFZoQy9MWm5aMUJDcnVrMmkwRFZPdlJZbzJjcDQr?=
 =?utf-8?B?ampWMGU2VVJES29rNkszbGNoc2cxVlBVdFFpZVE5WXZqS2tqMWxCTkpYRDBF?=
 =?utf-8?B?S3M1S1UxdTQ0QUtDaFhHSzFWQ0htaTRVajUyckZOM2V4Z3NnalU5WVdCSkhD?=
 =?utf-8?B?eUR5RlpBWVgxSjJaeUdNejBpYTdRSXU4Z0pISVpoQ3UzUFAyd3F3d29nVTJY?=
 =?utf-8?B?SldsTDFzVUZuUGtFQWh4RmI3ZVJXd0ZKcTgxYnFTdy92eUhmcFE5QXdCT2pM?=
 =?utf-8?B?N0MrdzU4ZVF4M0xNSDQvd1EzTGdwd0xPOXdCT3Vtb0kzc2Q3UEpwYkQrMEg0?=
 =?utf-8?B?eVZSb2dldUdSaXpSV3N3bXRZY1JVOGszak9VWi9IRWtLaEZpYkthejEzbEVv?=
 =?utf-8?B?Sk9lRjhNNFBhQ0UwZkpibnZhdlZmVmt2cVh6M3VzUjBGVXJneUdLazBXQ0I4?=
 =?utf-8?B?NGJLcUo2Nyt3ZDl2YW1UckFyaUNHZkIvMVBiQ2p4ODdSc0JtQ0JTSmczN2VU?=
 =?utf-8?B?Q0pIWHgrY3JjcDdhZDBVY0dDSEU1RFFIV1FKNWh3d1A5REduT3Z3cUM2emRL?=
 =?utf-8?B?ZUpyODN0RU1takl5YjU1dUtIaTdoQWVhYTZYdHBMWTd2bGpyZlo1SFd5Ukx0?=
 =?utf-8?B?RGsrYlZVMUtZU2R2cncyeVA2cjdZSS9wNTFDWDRuNWxYQ1YrYWdoVndwSzFN?=
 =?utf-8?B?NS82dG51cjNDa2FQOG94MWdVSzNDS1E3VHZYcHZ2aCswakR4dFBMMzQ4cnAw?=
 =?utf-8?B?T2NoUVljQjlFSkdqMGU0Qy9SajNiV1lWLzZVSU5CUHVld2d2UzY4YnJjeDND?=
 =?utf-8?B?SXI2b05zcGNEVDNTRTFrUjE2L2NuZlhQNE52Z2RzMnYxOTBZMlg5d2hEWVZx?=
 =?utf-8?B?a2F6dS9iUklWbE1IUldMTFBBam9IVHBMTGhNamJqeGlrdXd2bWdXZmt4bC8z?=
 =?utf-8?B?MGpGTzlhRDNKTWNNZHpOSjdJdUFhZldxd1IxNDRjUzc0RUhmT2I0M0g1aWY3?=
 =?utf-8?B?ZC9BTjYxd0xhWTF2TGRyNXl0OFdMaWl0eWlHRGJFUlhSUHBraHFDNGJ5Z2I5?=
 =?utf-8?B?c01XUlltRlNheGllM3NGY2JHL1VWaEtNZUlXQlBUcGNUYkIrSDZLTURlRkoy?=
 =?utf-8?B?M1RCbUpnWllkMy9FcG0wV1E5WmwwcUxPQndvd25sWDdUalFEM1FFa2svcWZq?=
 =?utf-8?B?dWFWM2tJYmlwY3hDN1RRMC9wMnRYVWJHcEJxek1nMFlPMENTK0ZDS04xSUxC?=
 =?utf-8?B?bFIyT2dRQmFod3hLTFY5NVVpUHRFNzB0WURQaDMzRG84T3RyK1lVUGE0M3lq?=
 =?utf-8?B?ajg2b0ZTdStNUFp1emZyanFHZnVpT2kxZElEaHZoZjNGREhNYlB5SmVSU1li?=
 =?utf-8?B?Z0dCZ1dxY2s3MVMvN3YrTHQ3ZVN1blJtZkZsc1NSZ0dsbkhrMTB2ZHAyUWxo?=
 =?utf-8?B?Nm9ucDdaSkUwd3I5V250VXdzZklVd0liMEU0MTNDSHF3RHZaQUJQRW5pSkFu?=
 =?utf-8?B?Y2dWQTBNM2JNYmlyeGRaTXNxSWhPRVJhb21DUFM0dW50a2lPM0hoc1NNc1Jp?=
 =?utf-8?B?SGtTT1RHYXJwKzFsTXdwTEVwZTFPcXBod1oyaGZQUjlYODRKTStSMERXNE5w?=
 =?utf-8?B?SVpSb056YUNka2M2aFhYa1ZrUmlTL3lUWVZueWtTLytYNysyYUdFUCtoSzJt?=
 =?utf-8?B?TitVbGZteVgyY283RjN2eDJjdm1iQlJlOGYwSDdtWmJOMGlTWE5CTnQ1NlBj?=
 =?utf-8?B?cVVNMzhhZnZDOHExN2V0dW5waSsvR2NNa1czVmpmalJadjFOWVQycFhwcjBJ?=
 =?utf-8?B?ZURNWDlyMnVOVUVXQnVFTjNQNzBZU2NXK3BaRmNIVVF2VzFZRkFZUWhwRUxw?=
 =?utf-8?B?ODR5aEZXdHhCSGVUakY5cUpJeGFoNVVFNkYvbFB5L3JvYkt6V2M4UkRhYU1x?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3298f09-8e69-4a10-9953-08db947cdfe8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 23:53:45.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpySn3vhWtl1dYtWX2+aC37TFi5LS4BU4m/X9kQgAunG0JPtMVJHRXZQBw3JrUX1zTlJQRA4d/0DZVlDJ76Www==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 23:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185503

Got it. Is running runtime_test.TestImage.test_testimage_dnf sufficient for testing the change? Or are there specific images I should try with testimage?

For the examples, how many sample recipes would be adequate? 1 or 2?

Thanks,
Charlie Johnston

On 8/3/23 02:18, Alexander Kanavin wrote:
> Same comment as before:
> This does need to be tested, and it does need examples. Can you rework
> create_rpm_index() from meta/classes-recipe/testimage.bbclass to use
> this class instead of package-index?
> 
> Alex
> 
> On Wed, 2 Aug 2023 at 23:40, Charlie Johnston <charlie.johnston@ni.com> wrote:
>>
>> Add a new bbclass that allows building a feed using the
>> new oe.package_manager class. Additionally, there are
>> packagefeed_<type> bbclasses to define package type
>> specific configurations.
>>
>> The do_packagefeed task currently does no use SSTATE
>> data and is set to always run via [nostamp] = "1".
>>
>> The variable FEED_DEPENDS is used to specify feeds that
>> the packagefeed depends on and will be available
>> side-by-side. This prevents duplicate packages in the
>> two feeds.
>>
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>>  meta/classes-recipe/packagefeed.bbclass     | 26 +++++++++++++++++++++
>>  meta/classes-recipe/packagefeed_deb.bbclass |  8 +++++++
>>  meta/classes-recipe/packagefeed_ipk.bbclass |  8 +++++++
>>  meta/classes-recipe/packagefeed_rpm.bbclass |  8 +++++++
>>  4 files changed, 50 insertions(+)
>>  create mode 100644 meta/classes-recipe/packagefeed.bbclass
>>  create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
>>  create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
>>  create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass
>>
>> diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/packagefeed.bbclass
>> new file mode 100644
>> index 0000000000..08df96f662
>> --- /dev/null
>> +++ b/meta/classes-recipe/packagefeed.bbclass
>> @@ -0,0 +1,26 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +PKGFEED_INHERITS = "${@' '.join(['packagefeed_' + x for x in d.getVar('PACKAGE_CLASSES').replace("package_", "").split()])}"
>> +inherit ${PKGFEED_INHERITS} nopackages
>> +
>> +LICENSE ?= "MIT"
>> +
>> +# Feeds listed in FEED_DEPENDS and their dependencies will be excluded from the feed.
>> +# This allows for side-by-side feeds without duplicate packages.
>> +FEED_DEPENDS ??= ""
>> +
>> +fakeroot python do_packagefeed() {
>> +    from oe.package_manager import generate_feed_dirs, generate_index_files
>> +
>> +    generate_feed_dirs(d, d.getVar("FEED_DEPENDS"))
>> +    generate_index_files(d, isFeed=True)
>> +}
>> +addtask packagefeed before do_build
>> +do_packagefeed[recrdeptask] += "do_package_qa"
>> +do_packagefeed[nostamp] = "1"
>> +do_packagefeed[rdepends] += "${@' '.join([x + ':do_packagefeed' for x in d.getVar('FEED_DEPENDS').split()])}"
>> +do_packagefeed[cleandirs] += "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
>> diff --git a/meta/classes-recipe/packagefeed_deb.bbclass b/meta/classes-recipe/packagefeed_deb.bbclass
>> new file mode 100644
>> index 0000000000..2decc70a4f
>> --- /dev/null
>> +++ b/meta/classes-recipe/packagefeed_deb.bbclass
>> @@ -0,0 +1,8 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +do_packagefeed[depends] += "apt-native:do_populate_sysroot"
>> +do_packagefeed[recrdeptask] += "do_package_write_deb"
>> diff --git a/meta/classes-recipe/packagefeed_ipk.bbclass b/meta/classes-recipe/packagefeed_ipk.bbclass
>> new file mode 100644
>> index 0000000000..89d296200b
>> --- /dev/null
>> +++ b/meta/classes-recipe/packagefeed_ipk.bbclass
>> @@ -0,0 +1,8 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +do_packagefeed[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>> +do_packagefeed[recrdeptask] += "do_package_write_ipk"
>> diff --git a/meta/classes-recipe/packagefeed_rpm.bbclass b/meta/classes-recipe/packagefeed_rpm.bbclass
>> new file mode 100644
>> index 0000000000..8ce37cc855
>> --- /dev/null
>> +++ b/meta/classes-recipe/packagefeed_rpm.bbclass
>> @@ -0,0 +1,8 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +do_packagefeed[depends] += "createrepo-c-native:do_populate_sysroot"
>> +do_packagefeed[recrdeptask] += "do_package_write_rpm"
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#185439): https://lists.openembedded.org/g/openembedded-core/message/185439
>> Mute This Topic: https://lists.openembedded.org/mt/100515098/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


