Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4890EC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 18:48:51 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.919.1646160530298379667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 10:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I2TpvYB9;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 8so17390164qvf.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8v5WjYfY30m+HEjyTWrdurQ9wtdvxaD2L1IvRR4BUw=;
        b=I2TpvYB9EM83WIT5ekVApR6of/WW9xhD1vfMDiM7FDCoNzjxQ/nKjZnB/RTqdjyC2V
         Fr+OillvegFfwn7LKooGapd26O5zgKqnaGVHrgFLQhffXTYSA/7r8G1M2ITikuljsr3H
         HhoBI+8QLJfx6t9Fe23NEiOboEeiQbLDOfiaIbfntPOuekUJy6peZ8kCWTvF2xI0/cIb
         hpTCOwRDbFTC3AcICL7/c0UE2FzSsSrA9Gy/vIw3m9lQvLVkVdS3sKG2C21RJudjW4qe
         aPB3Fi32Pggh/BLtlXBMg6aP2Eqisli8Wo9ra/2EBrdRkIWDnKEwc8yJxQrQmLMC0tHD
         yYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8v5WjYfY30m+HEjyTWrdurQ9wtdvxaD2L1IvRR4BUw=;
        b=2JuhdDeruqETVmvXlKAQbd5F5frKKgo3yzMquolDGzAgvhYDm20mDvsa3wx3Hk4Fvn
         tiUayfEO2d9LWUn1s8U12Y8XVon52AsKS15MaEdjx292ArFKeTnXe+dUrYt1Nw1Aqxma
         rukcIv0VR4MeZhy7t0JzV84CqeQSlh3gX95A7vcjYWsaksD9qiayhA2kVRv3Ez2x9ca2
         kr1YSqnq/0620c/vw8PfTy2zZThochliEHPMzzM9c2VzC+4qPoA1bfWXV5/5sSvrKbxC
         9TkMJBBcTlLzzZp2xoqihHrvkwI9DJtf7NZBPsrcIFyBAjRoj2d11prxj+dyARiGCqp+
         Y0xw==
X-Gm-Message-State: AOAM532cHvs5OEpiOUVwkxqiuiSiguHzXJ2PbyXlsZcbXL0OrEYh1Y9e
	boDfQQSsLuYa3G9J9mGxwZoQRTdd+NtVChI72DU=
X-Google-Smtp-Source: 
 ABdhPJxAKcyKhqZsppcCb80NXLRqUmBoEENyAv/awSQyOKkgTRiKBiYEBAKUlI5Oy+RAPlEL6KOdIXX91ZIDw9UXPNQ=
X-Received: by 2002:ad4:5dea:0:b0:433:2d8f:f85 with SMTP id
 jn10-20020ad45dea000000b004332d8f0f85mr6287355qvb.63.1646160529285; Tue, 01
 Mar 2022 10:48:49 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
In-Reply-To: 
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 10:48:22 -0800
Message-ID: 
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Tim Orling <ticotimo@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 18:48:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162569

I am seeing this

| Created temporary directory: /tmp/pip-install-33iiigxv
| WARNING: Requirement
'/mnt/b/yoe/master/build/tmp/work/x86_64-linux/python3-pytest-runner-native/5.3.1-r0/pytest-runner-5.3.1/dist/pytest-runner-*-*.whl'
looks like a filename, but the file does not exist
| ERROR: pytest-runner-*-*.whl is not a valid wheel filename.
| Exception information:
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/python3-pytest-runner-native/5.3.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pip/_internal/cli/base_command.py",
line 167, in exc_logging_wrapper

where the wheel file is called
pytest_runner-5.3.1-py3-none-any.whl

On Tue, Mar 1, 2022 at 7:22 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Tue, Mar 1, 2022 at 1:42 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> - replace python3 prefix when guessing the wheel name
>>   as there are still plenty of recipes out there that do use
>>   python3 prefixes
>> - remove all previously generated wheels matching the glob
>>   to avoid installing any outdated blob
>> - don't use PV in glob, as PV doesn't necessarily align with the
>>   version used inside of the setuptools configuration.
>>   this will avoid having the user set PYPA_WHEEL in a lot
>>   of recipes
>> - respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH
>>   and use B as a fallback only (in case this class is inherited
>>   without setuptools3 class being there as well).
>>   recipes like python3-smbus run in a subfolder of the
>>   workspace and were failing in before this adjustment
>>
> Thank you. These are patterns that were never seen during development, but are painfully obvious now.
> The wheel spec (PEP-427) allows for, for instance, dev/pre-release wheels which we see with the
> python3-dtc recipe from meta-virtualization.
>
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>
> Reviewed-by: Tim Orling <tim.orling@konsulko.com>
>>
>>
>>
>> ---
>> v3: remove in prepend to compile, not in install for obvious reasons
>> v2: fix python3 prefix string
>>
>>  meta/classes/pip_install_wheel.bbclass | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
>> index 5b7e5cd706..789c25b68c 100644
>> --- a/meta/classes/pip_install_wheel.bbclass
>> +++ b/meta/classes/pip_install_wheel.bbclass
>> @@ -1,12 +1,13 @@
>>  DEPENDS:append = " python3-pip-native"
>>
>>  def guess_pip_install_package_name(d):
>> +    import re
>>      '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
>> -    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
>> +    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar('BPN')).replace('-', '_'))
>>
>>  PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
>> -PIP_INSTALL_DIST_PATH ?= "${B}/dist"
>> -PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
>> +PIP_INSTALL_DIST_PATH ?= "${@d.getVar('SETUPTOOLS_SETUP_PATH') or d.getVar('B')}/dist"
>> +PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
>>
>>  PIP_INSTALL_ARGS ?= "\
>>      -vvvv \
>> @@ -45,4 +46,9 @@ pip_install_wheel_do_install () {
>>      done
>>  }
>>
>> +do_compile:prepend() {
>> +    # cleanup previously generated files
>> +    rm -f ${PYPA_WHEEL}
>> +}
>> +
>>  EXPORT_FUNCTIONS do_install
>> --
>> 2.25.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162559): https://lists.openembedded.org/g/openembedded-core/message/162559
> Mute This Topic: https://lists.openembedded.org/mt/89472354/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

