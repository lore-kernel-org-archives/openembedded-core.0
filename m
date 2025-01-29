Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FB9C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:01:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8065.1738137683990599165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fyKddRQh;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385eed29d17so3379169f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738137682; x=1738742482; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQGxH0ZhL1GuZ6G5mTvpk1K9fPLAUICqu5Bu1XI1cf8=;
        b=fyKddRQhfXYxTfTSMr2qg1Ksx1pqTEKcRh16txOtFi92KmbFqE4hd9LFf9pke/XQNi
         H69j6gUgvrJbrSdlXM/RKRVj5l+x14NzHtGKrWGeTXU1JrsiJNPYbyVe3Lkfir3ENP7q
         f+z8MqrPLIDbNX1cVbHsfb9++VP0sJuukYE0MfAApYN2INEf4luFbqH0eerVIvQwUSXJ
         6BwbSrkrOcvU6F8BVL+YRXJYKnRQP3UPj18Pwjx9yQiNZ4noOEiatLaso3sxMnRm6KNT
         g+tDESYyVdtxqihH10qIjDMH0SgcM8OqvCwSR8anyZVxGIAfnSpIYYfs4hU6o1djvAqb
         BcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738137682; x=1738742482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQGxH0ZhL1GuZ6G5mTvpk1K9fPLAUICqu5Bu1XI1cf8=;
        b=ds04w4qI3Uwu4mIk9P4VOJjNDonghfvxE9Aip9prZbVbiq6MTK7gg28Fniaw16uFLf
         a85uUPIWN/QUeg4HLBX+4kMMAZiKosWVOrMf3G9q6ni9QeQpoVYsf2sW/1cMItBndYeY
         o/UTxkZSGyd98HwgLUFJ94jzhFR0WHtURdipVndz/2mWG7aD95/RjQ9GSLh0ZotBOZHs
         OsxbF/Iis3tPts+oVyTKplE5jSG3t/Vh2jZ6wuIxkyTKuPBIQriwaDyUrAdkHnY6rhSO
         oaoTM6vHZYswa41HhSs3zfzHqqXKDOhpl+pmsfCy+joWfmcs37X7Or8g4fiA+3oWSMAW
         4TRQ==
X-Gm-Message-State: AOJu0YyCPGiZWDoSmHMaoXP68eVdyV6UtOXtfusRS4DctjKYt9l5UwIX
	mNXhRmb+xQi5oJd9OgplTInGCuBJe1Wc0G+fHqqaFrrqQF8ve23G
X-Gm-Gg: ASbGncvwDrN0rWTueonWCPUFuW9BWwlPancXvl+/yc9S0skaJNTpC+KCAfo4wVbJnA6
	GtbYnmS/WdQEJ+QLfE1YcNIP74DxNoWpHJvhk1pqLNFFaY4WVjn+AG6kqoXHq11+c10GGX/000Z
	yGDf4/0H+edGSmUG70Pp+Nw376QOA2RZTxlV5fgD1ILOVIYXSvpYSi1HaJic8EmUi3w3MOmBo72
	UEpTHXlWtQ1RdAb0TjUh9cV2cr8v3q2+jotAo8vm22f58EdvvLMccL4EtqGr4SK2KMktc2HbtSt
	IurfoQDHldS1J3h0fKtbcwj1cT6Kj2bSkjlT6y8GWEm+uRer
X-Google-Smtp-Source: AGHT+IHNc6b9g6cmtBL42rsdxmPVq3UvNV7p4xXZiEylMm+ySwF2iUi3dYfYfwS0E0BeC8jYQfxleA==
X-Received: by 2002:a05:6000:1fa4:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38c5195e85cmr1581078f8f.12.1738137682164;
        Wed, 29 Jan 2025 00:01:22 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf65sm16530658f8f.64.2025.01.29.00.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:01:21 -0800 (PST)
Message-ID: <85010feb-ed9c-4be0-bcfd-99c4212847aa@gmail.com>
Date: Wed, 29 Jan 2025 09:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
 <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
 <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
 <ef779855-5513-44b6-8b85-f4c07fa69756@gmail.com>
 <0a4e3939-3361-4656-956f-ae11af7998ac@windriver.com>
 <CANNYZj-DWb5SjEOguzTYgteQ5=rV6wpNuQzpm8+mGniS6ZN2uA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-DWb5SjEOguzTYgteQ5=rV6wpNuQzpm8+mGniS6ZN2uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210346

2025. 01. 29. 6:36 keltezéssel, Alexander Kanavin írta:
> On Tue, 28 Jan 2025 at 22:52, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> A patch to enable the signing using  a PACKAGECONFIG for rpm would
>> likely be accepted. Off by default of course and a test would be ideal.
> We already have this in rpm recipe:
>
> # has replaced openpgp support and is written in rust:
> https://fedoraproject.org/wiki/Changes/RpmSequoia
> PACKAGECONFIG[sequoia] = "-DWITH_SEQUOIA=ON,-DWITH_SEQUOIA=OFF,rpm-sequoia"
>
> I also have a half-baked sequoia recipe:
> https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/rpm/rpm-sequoia_1.5.0.bb?h=akanavin/package-version-updates-later

FWIW, I have created an rpm-sequoia 1.6.0 recipe that builds now.
1.7.0 has some dependencies that need rust 1.83 but Yocto master
has 1.81 at the moment.

Some ideas were taken from Fedora 41 and the dependencies
do not include clang, only openssl. The librpm_sequoia.so.1 library
is only about 2.5MB large, so rpm may re-enable signing either
unconditionally, or automatically / conditionally based on
PACKAGE_CLASSES.

I had to slightly modify cargo.bbclass, though, because "cargo build"
complained about the --frozen flag because it wanted to make some
changes to Cargo.lock. It also recommended using --offline instead,
which also avoids looking for the network. So I created a conditional
in cargo.bbclass for this, maybe other recipes need it, too, that
previously didn't build.

I will post the patchset after testing that I can actually build signed rpms.

> And there's a currently disabled selftest:
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/signing.py#n62
>
> So someone needs to take all these, add meta-clang, and make it all work.
>
> Alex


