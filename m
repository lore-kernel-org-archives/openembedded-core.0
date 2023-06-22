Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDC6EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:37:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16538.1687451859841096905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37750C14;
	Thu, 22 Jun 2023 09:38:23 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D02133F663;
	Thu, 22 Jun 2023 09:37:38 -0700 (PDT)
Message-ID: <b1299dc9-4099-4792-e1f1-5322e56a9a69@arm.com>
Date: Thu, 22 Jun 2023 17:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
 <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
 <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
 <88d7eb23-d5e1-71db-f789-1c9dff4fcf47@arm.com>
 <d3cdc91111da08f19d47cfc1e5fb861fd8882543.camel@linuxfoundation.org>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <d3cdc91111da08f19d47cfc1e5fb861fd8882543.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183271


On 19/06/2023 13:07, Richard Purdie wrote:
> On Mon, 2023-06-19 at 12:47 +0100, Peter Hoyes wrote:
>>  =20
>> It sounds like moving testdata creation to a separate task doesn't
>> bring much benefit so I'll revert to something based off this patch.
>>
>> It looks like a relatively small number of variables are actually
>> used by OEQA tests in OE-core:
>>  =20
>>  =C2=A0* IMAGE
>>  =C2=A0* ARCH
>>  =C2=A0* MACHINE
>>  =C2=A0* PACKAGE_FEED_GPG_NAME
>>  =C2=A0* VIRTUAL-RUNTIME_init_manager
>>  =C2=A0* WORKDIR
>>  =C2=A0* DISTRO_FEATURES
>>  =C2=A0* PTEST_EXPECT_FAILURE
>>  =C2=A0* TEST_LOG_DIR
>>  =C2=A0* libdir
>>  =C2=A0* T
>>  =C2=A0* MULTILIB_VARIANTS
>>  =C2=A0* SDKPATH
>>  =C2=A0* SDK_DEPLOY
>>  =C2=A0* TOOLCHAINEXT_OUTPUTNAME
>>  =C2=A0* QEMU_USE_KVM
>>     =20
>>  =C2=A0* DL_DIR
>>     =20
>> Notably, DATE/TIME do not seem to be referenced at all (apart from a
>> comment in oeqa/runtime/cases/ptest.py recommending *not* using
>> DATETIME for test output). Additionally, DL_DIR and WORKDIR are
>> updated on each testimage execution using TESTIMAGE_UPDATE_VARS.
>>  =20
>>  =20
>> How about introducing a new variable, e.g. TESTIMAGE_EXPORT_VARS,
>> containing just the list above (to which other variables could
>> optionally be appended in other layers)?
>>
> I think that is certainly worth trying.
>
> Cheers,
>
> Richard

This is implemented in v2.

I have validated the new patch locally on:

 =C2=A0* The new test case
 =C2=A0* sstatetests.SStateHashSameSigs
 =C2=A0* qemuarm64 core-image-sato testimage
 =C2=A0* qemuarm64 core-image-minimal-dev testimage

Thanks,

Peter


