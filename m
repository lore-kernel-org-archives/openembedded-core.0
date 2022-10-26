Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D94C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:49:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.88])
 by mx.groups.io with SMTP id smtpd.web09.10003.1666802979396881820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 09:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=YQFk3VoB;
 spf=pass (domain: seco.com, ip: 40.107.13.88, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fypBAHfvylvNWLGCrjq/Frh8C/zoPAUS2oxOU+zkFJOyUGfXUXlcmMt7WtMTNk97TdKlV96kRLx7yhtIIEt9DUc1Mv5TB10bCRDQ1Ejg5cXalITn0pRNlmgpnYyelFp7Wh2++/8esIRMUqC9CsM4R24rPn8fFmISCf7itgr4BkVa15/oUSgafUC4ja2RBw9A96hXat0J8HJ6zgoPn9FnIohpYSInUvQD8qpVb3/bV0n8dueRu8BmXwyuvOZR7GCqH3xfc6gCJgTvlT2ImWZOufDrtEqfoCDA151ifJK367J2O1J+U1oEoSdEwUE+58CJawjU4cLswFUvKO75AhsuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8JJPpHBpBc6hG/9v4mVrM4bbHerDAU5Cse2j3Ixo/c=;
 b=UDB3+AX2T/bjXGtv02bs3SfAAWSjK7wimcrFf4g0YQf2JM89iee7Rj50BhstE2ryXikMuu0UBGsbC/+pzpnGANDQKOzezh7Xz6/S0dQzCny5gDVPSZm+yeTnG1e8YpAOmxaeZnJCrtbSRe9JT1bG0V5pQFPsrd6uKxQk3/Uw1qYse3AGx8iRNa+nGhIJw94djO7jJPgU9C9ZtDOvlkMztVpdeHHRNfCpRRxzRo483ZiyJbXG2t5HYV42xb0zo+WcgKp4KJrZzF7Z+ZdBqOZUNqYriyb6y/HA2TndKwmtg3hbT7AEi9bhTzkggFDZ4OZ28Dxyu8nDU0uTMA1qpLcCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8JJPpHBpBc6hG/9v4mVrM4bbHerDAU5Cse2j3Ixo/c=;
 b=YQFk3VoB6PCGkw//NGyH9hkjBd3aLDl+baIIyb0G+jt8UirXX0lZPc0VUB7SZl42KGIa4ro1R2i5uxLok++j7gPnWUV67khDvwYDZyOzeFPvhkG5HWgjGC6THe9OpJJ6MRZT6CtGSXRnPMDvX6Li2sl//4JvZP/0Vs11AsFvK7nZpTp/bPzhw7Ty4etxe4LxUzAFCwKzYAU8wzWD/x3xD+6Gcl6CROb49SZkFFAND1A6ciSpeg8BaBYkmh6Dpfl1LN3+DGVlbhbQ8bMmn42EV2LV53hFLJvCZoqI/JCB4d6ijaycc2vEG20vZVERzB1bEFYBny5G8hjxqtYpL/Qb8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM0PR03MB6146.eurprd03.prod.outlook.com (2603:10a6:20b:145::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 16:49:35 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::447d:3157:60b0:ded8]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::447d:3157:60b0:ded8%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 16:49:35 +0000
Message-ID: <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
Date: Wed, 26 Oct 2022 12:49:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com>
 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::29) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM0PR03MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: be8ee049-9c9b-44e7-1ee4-08dab7721055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jzjxPNgcdRJRHGEGjf6HR0erFUHFL5zdXsQmj/dSD0bWqjQyiHF73d8UlPDRTlJ97/DSxu+H9/LRFLAGj+/UZmPWfCwyhvfv7b0+b8cCi6brgL/12FwJBVtwFsZhTb69vEjSGSA41d48Osrd+LET1FWWkGd+zTrsoNI4HJpbMI2PjJOmNtusowfhp12ORi5ITv4rIFlEDiPxJhro/73sttZDOtjV3jZ8df53Qvs/tgBQabuXeiycTCYRLrUiXyfhwBjH9xlwJB4qRBpXSaU7X3BLwEuyoRLz21GUIvaO9zTg4iRZ2N3CfbExde+Ktce1tElFUXyirP+KitpXqhfjqwuRCd+SGe1cqKZFdO13E/ZmPNs3Z5Lp1ujQp+XDZ+2EyLrLuJEn+f18nBzZL5UyF9zgGir7NCNQA4Gb1pfAojY5mequnT+pwo7VtJNDV9nRawj63MjopfQt5J2uXbV+l7Xmi8afyLVGcQsUB3sJUAtvGWQaXQrIzSd/8Naf5EQkUrgWvwBROqUbduXSGMdSVn9gE1Ua8cbAKadi9kNry9oGOSRYaauWuqUFfhsKZBkdj5BL9bjhIjvAkuUwhtcsTnfqyq6+OCuNV3uDc302wyfIzecZusCjOJyJi2w2T84IqzJK6JfRFGH9bqiGUQcd+uxnhDuDQ+dkmcG1/5YCiGXIbd405z5JxWWk647Nk5lR36T3nhxVXilj7+bVr2P90Fd1L9OZgJf+tpfJsH+IjwTXElfD1QbIiMdcCMCs/U8XBFtKT5iVMORZXiGtoCBLfmHclktYZpWWExHR0TIQphXEMj91yajHM/o0DgXJB79XIDFLohn6tVPYuz45fTyuaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(39850400004)(366004)(376002)(451199015)(8936002)(5660300002)(316002)(54906003)(6916009)(6512007)(6666004)(6506007)(66946007)(66556008)(36756003)(41300700001)(53546011)(8676002)(4326008)(66476007)(52116002)(31696002)(38100700002)(186003)(38350700002)(4001150100001)(2906002)(44832011)(26005)(83380400001)(86362001)(2616005)(478600001)(31686004)(6486002)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVhBdWhVc0ZabE0wWVhGZFgyQnkxOTZOdHQwcEpGSjltR1JLamN2WXIxb2w2?=
 =?utf-8?B?Y0phQk1ldTNGaVVsZXhTOUJLSDJtWnpPUGJldWNiUjI4ZXFjSlZYWkRaRWNx?=
 =?utf-8?B?YlJQODdMZ1hhdjkvQWV1eG1SbTBDeGRIMEpkajhiSDVJeW81UzJibGt4L3A0?=
 =?utf-8?B?OXAzRkUwTk9UcHVWOUM1N2Q3Tyt0S01YUWo1VXdzenlOdUFmY2g5emJiSGxJ?=
 =?utf-8?B?ZWJ6S1lxdjZ6M2hQcnQzTlBIOVV4OGNXYWZQZ1hXWXdTNVhiZFpROTFCZk1k?=
 =?utf-8?B?YTFhNnUvTXpsY1BGbzdMZXAyMlh2cFZWOTcyWTJVRmt6VFk5QVhPNmt5NXd3?=
 =?utf-8?B?ZTQ2ckhBQ2NudUhyT3duT2txT3Q4blBlVGJuWlduZU9GZWU1UFE3b0tCL28w?=
 =?utf-8?B?WndOSjEvQm4yT09xMUp0YTRISVkzM1l4eHBYeHVDMjJTQ3RzQWlYc3BQeWYr?=
 =?utf-8?B?SkVKT0FOWXpnMVlkUGc3RndLTElmU0s1QXd6VDhsZDhhcms2T20xUWxxL3JZ?=
 =?utf-8?B?YUVyTzBaVWwzVmhocnJuYzRjU0kxSkJzZHJueU9NSit6VDZ6aDZqSE90ZDQy?=
 =?utf-8?B?UEJLWXZ2MC9XU1JlRE5sd3VibUhxQkliVWZER1c3NUNTcUhrUnN6cWp5aWUr?=
 =?utf-8?B?MmdSTjFQY0x0KzNxdkVDbytHQlVUb2NqKzk1Y0N5dmovVDREMU1aM3VIUTFK?=
 =?utf-8?B?UUxja2Jvd05hZ3Y2RHNHSTNhdno1bWJYSWlWb1E1cTBVOTFnNWZLaE5RV2Vn?=
 =?utf-8?B?bEltcnNjaW0zSC9wQjg0T0RYYXBtTVBUUlNtOEZWaEpvc2g0WldQMmhuZDk0?=
 =?utf-8?B?SDltd3RIYjdlY0oxL21SU1hMMGJlZVdpelkweE9uMm4vc0J0ZGlsbGJoNS83?=
 =?utf-8?B?cUxDb2F1eWpaUGtYQjlLTzB5VXNDWTFtNWYxaU1peVhlbWcyVlVGRnlDTUox?=
 =?utf-8?B?ZlBZQjlQTTF0d2hMM1krK21hbFRCREh2Y0tGZGJmZXRVQUpiSXVDc2hhcXAz?=
 =?utf-8?B?YWFFeklVRzB1a0toWG1XSG4wUWI4NjRGakN1WmhiUTBWR3hQMi84bkUrZmtI?=
 =?utf-8?B?cmJQWmJyUThOQklwejRNdXZPbXN1RGYrVlVzYlZ2M0hOMnlReVd6aERHTVpX?=
 =?utf-8?B?ZXRnZVVZVDU3SGVzYTlGL2hheWlyaUFpbFBOM2pCRG9saTU1Y3ZxYTdQTG9W?=
 =?utf-8?B?cW8waGs0RTRKeTNoVEdDQ2tpTjhuL3lpNkNxd0NFM2RlT2lnNlhzdEpxdUdL?=
 =?utf-8?B?bytyRGhoUVhqTXY5L3U5U2NZc0wxc1dDWVR5WmxIZG9TZkswUTlPa0x3SlpJ?=
 =?utf-8?B?NU1xYVdkSUNLU085djFQa0laTmxqVlVyNWtOV00xVHg3dHhyZ3kxbW93U2hx?=
 =?utf-8?B?NEVXcjVuM2l4OGhRS082M3JGNC85eVMwS2VuSzJJWFUzNmZ5dkoyVmxtak1h?=
 =?utf-8?B?SDhxcFV0RERzc0lWZ05hZDlSTnl3azQxTzFRczkwa2ttbWptUWJOTXNWVmpt?=
 =?utf-8?B?UTd2ZlBQZGdtV2RxcG1FaFQ3RnZrQXViOC9wWU5tTUVWbVdqR0VVUUZuOS9v?=
 =?utf-8?B?RnNBWFNBWGRMalFBWUVGb2k5UjNpQ0R5QnN4cEV3YUxieUpRUWs3SDc1cVF4?=
 =?utf-8?B?Nms2KzlwZ0liV2pJTUNROUFiTG96RXRYSUR3S1J3eG5XT0RUUTE4VXpTMlJo?=
 =?utf-8?B?SnFjL0dyRE5ISGpHRCtNR0J0MXUrb0dHQTNoUWxsN0s0SXJxWlZ3QktMRjF1?=
 =?utf-8?B?QW5vTFNja1hjdVp3anNMdXFvZVZCS1E3UlBkam5sK0dnRkZ1dHN6b3V3SEJl?=
 =?utf-8?B?ZG8yZnhLamt3TkRHQ0d2eEl4S0tkOHlNZExPSGx1bVc1aUhoWk9OaHFjQW9a?=
 =?utf-8?B?RmNRTlErRklONTlnWlpPZ2l5bC80c1Fxb25xQUNlT01sVFp5VmRJUHlIb1JR?=
 =?utf-8?B?WHhBSjVFSmhEVm5iWmZld2hxUzhMZFIrQ2QvS1k4RmJoY3Z5RVZCZ05ZT0w2?=
 =?utf-8?B?RnpSRUp4T3QvanhGaEpVUkxpSzA3aWE3ODlLWTdMMk5FOXJTNlB3Uzl2WjdB?=
 =?utf-8?B?SENPT291VU9XeG5kdFlJVitZOGliNU9rL21Tby9zRTNyVTRjbkVoNUJZeURn?=
 =?utf-8?B?dm1ETE1oUWIyY0ZXc29QcWZPVUt2eE9TdzFPaExMSUFQVk9rcWt3RlZscng1?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8ee049-9c9b-44e7-1ee4-08dab7721055
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 16:49:35.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf1lkYQRWHgG/qvEex68iMoJ8x2vF+ZK7P6TlUcaNx99Zsq5Qqltq1Xha9Ib7FcY6CtZtjgHsQgE0AjbtKawvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 16:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172163

On 10/26/22 10:08, Richard Purdie wrote:
> On Fri, 2022-10-21 at 19:37 -0400, Sean Anderson wrote:
>> The U-Boot signing code is a bit of a mess. The problem is that mkimage
>> determines the public keys to embed into a device tree based on an image
>> that it is signing. This results in all sorts of contortions: U-Boot has to
>> be available to the kernel recipe so that it can have the correct public
>> keys embedded. Then, the signed U-Boot has to be made available to U-Boot's
>> do_deploy. This same dance is then repeated for SPL. To complicate matters,
>> signing for U-Boot and U-Boot SPL is optional, so the whole process must be
>> seamlessly integrated with a non-signed build.
>> 
>> The complexity and interdependency of this process makes it difficult to
>> extend. For example, it is not possible to install a signed U-Boot binary
>> into the root filesystem. This is first because u-boot:do_install must run
>> before linux:do_assemble_fitimage, which must run before u-boot:do_deploy.
>> But aside from infrastructure issues, installing a signed U-Boot also can't
>> happen, because the kernel image might have an embedded initramfs
>> (containing the signed U-Boot).
>> 
>> However, all of this complexity is accidental. It is not necessary to embed
>> the public keys into U-Boot and sign the kernel in one fell swoop. Instead,
>> we can sign the kernel, stage it, and sign the staged kernel again to embed
>> the public keys into U-Boot [1]. This twice-signed kernel serves only to
>> provide the correct parameters to mkimage, and does not have to be
>> installed or deployed. By cutting the dependency of
>> linux:do_assemble_fitimage on u-boot:do_install, we can drastically
>> simplify the build process, making it much more extensible.
>> 
>> The process of doing this conversion is a bit involved, since the U-Boot
>> and Linux recipes are so intertwined at the moment. The most major change
>> is that uboot-sign is no longer inherited by kernel-fitimage. Similarly,
>> all U-Boot-related tasks have been removed from kernel-fitimage. We add a
>> new step to the install task to stage the kernel in /sysroot-only. The
>> logic to disable assemble_fitimage has been removed. We always assemble it,
>> even if the final fitImage will use a bundled initramfs, because U-Boot
>> will need it.
>> 
>> On the U-Boot side, much of the churn stems from multiple config support.
>> Previously, we took a fairly ad-hoc approach to UBOOT_CONFIG and
>> UBOOT_MACHINE, introducing for loops wherever we needed to deal with them.
>> However, I have chosen to use a much more structured approach. Each task
>> which needs to use the build directory uses the following pseudocode:
>> 
>> do_mytask() {
>> 	if ${UBOOT_CONFIG}; then
>> 		for config, type in zip(${UBOOT_CONFIG}, ${UBOOT_MACHINE}); do
>> 			cd ${config}
>> 			mytask_helper ${type}
>> 		done
>> 	else
>> 		cd ${B}
>> 		mytask_helper ""
>> 	fi
>> }
>> 
>> By explicitly placing the work in mytask_helper, we make it easier to
>> ensure that everything is covered, and we also allow bbappends files to
>> more easily extend the task (as otherwise they would need to reimplement
>> the loop themselves).
>> 
>> [1] It doesn't particularly matter what we sign. Any FIT will do, but I
>> chose the kernel's because we already went to the trouble of setting it up
>> with the correct hashes and signatures. In the future, we could create a
>> "dummy" image and sign that instead, but it would probably have to happen
>> in the kernel recipe anyway (so we have access to the appropriate
>> variables).
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>>  meta/classes-recipe/kernel-fitimage.bbclass |  68 +---
>>  meta/classes-recipe/uboot-config.bbclass    |   3 +
>>  meta/classes-recipe/uboot-sign.bbclass      | 421 +++++++++-----------
>>  meta/lib/oeqa/selftest/cases/fitimage.py    |  29 +-
>>  meta/recipes-bsp/u-boot/u-boot.inc          |   3 -
>>  5 files changed, 226 insertions(+), 298 deletions(-)
> 
> This looks like a pretty nice improvement, I've been worried about how
> entangled all this was becoming. Is there anything better we could do
> with testing of this code? We rely increasingly on the tests to spot
> regressions and I doubt the testcases we have cover the code
> complexity.

FWIW, I found the test suite to be fairly helpful when debugging this
whole process, if agonizingly slow. I found many bugs in my initial
implementation which were uncovered by the test suites,

The best way to extend the test suite would probably be to have QEMU try
to boot using the Linux and U-Boot. This would help cases where all the
artifacts are created correctly but e.g. the wrong U-Boot is packaged.
However, I am rather loathe to add more test cases like this, because it
already takes around 10 minutes (with sstate!) to run the tests. This
basically kills the speed of iterative development.

--Sean

