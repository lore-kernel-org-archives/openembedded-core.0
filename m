Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE09C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 02:37:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.6145.1645238272040330681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 18:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Tt0UXKx5;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id x5so18438816edd.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=snSkDw7HVl12q02ncNAmo5TITNHQKeiaBE1JDLVlnT0=;
        b=Tt0UXKx5gcNzi4s59eROtbrSB7V6Bh2KVV2ulDTaqcS1USCJFGyFQOQjpTw4D068cn
         EbDwY+HL92xn3S4QkKoaz/DRB2Wvwd710tCSde63LkP0IFyHw6K0cwHcDdnO/K9saZTF
         kEva5Hr+hEXNjbA8CPYcufyTPSwmYzTzLVYeKSXB0jsWWXm5tre4crTAkdnCheSIiFZL
         mUzouzVXQOJxSa6ZmIhXOu4AwWNaVKPGsfNdQ1eLdq85PLdbGsYM1KP6mZtKM4cEqn3j
         Do+hhCFjoBiQ+lxvkdgaRuHjoHquXXI88f4xh70DTbc+cls1ekTDAUx7ywGilGKRm25W
         bKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=snSkDw7HVl12q02ncNAmo5TITNHQKeiaBE1JDLVlnT0=;
        b=V5mvrr1+sGdpVzGJz89FMIHT+6AWnLwc7qom04eDyfNVbgULi1/G+6kH1xM3ioDJF4
         ysd+/MMKNKAn8YaoqRlQF4sjvFNL+SOmP7PGJLPbN5sFXmEIJdGS9D0hfuoX+citoZEq
         TluSX4mytBr0Eo7Yh18tkQ6X3TWhSJ7aBmuHbu2gLrmGeLs0A86q+E7OsDRSsA6fvMov
         k3ITRivPAIMcn3EkMBO/HZOrG+IJbnRlViSRxZz07dsFF1E9pHrfGCZJ0AgP8yh/7rjA
         uziB9DfcWoxYc38sugfC4NzNJUbMPc8tul9DKnyAhiDHYa1KyswifBImjMzqk3MwAQQb
         hr+Q==
X-Gm-Message-State: AOAM532iMPXjoU169fv6vLyBoIUQC7SXuJZY9aMobmsZ8tw7hOeLzpfJ
	5QU13qy0Sx8ziSoFkt4TfnT0hDPunMdXGhrWtusBSQ==
X-Google-Smtp-Source: 
 ABdhPJw42XoWC15ZRnRvOOchE6G0ljDdMlfIH8/if0nk1gn3I0ncLlPiBWzZJv+evD7n5nFU0CIGLoQRP2EvmWb4+54=
X-Received: by 2002:a05:6402:84f:b0:412:d1ef:c7df with SMTP id
 b15-20020a056402084f00b00412d1efc7dfmr3815622edz.210.1645238269926; Fri, 18
 Feb 2022 18:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20220216035900.851949-1-tim.orling@konsulko.com>
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
 <CANx9H-B8pxFuD6Dsv+Zhw=iBzeVvOd+BCZijY96xjHtBCFwijA@mail.gmail.com>
In-Reply-To: 
 <CANx9H-B8pxFuD6Dsv+Zhw=iBzeVvOd+BCZijY96xjHtBCFwijA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Feb 2022 16:37:38 -1000
Message-ID: 
 <CAOSpxda1U9+x_EDqcWd=Xv4Q4yUk9CnnPVNyXukZuuXqdFhw7Q@mail.gmail.com>
Subject: Re: [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for CVE-2021-4160
To: Tim Orling <ticotimo@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 02:37:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161958

On Fri, Feb 18, 2022 at 2:27 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Fri, Feb 18, 2022 at 3:36 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Tue, Feb 15, 2022 at 5:59 PM Tim Orling <ticotimo@gmail.com> wrote:
>> >
>> > Changes are only security and bug fixes.
>>
>> I'm seeing ptest errors:
>>
>> WARNING: core-image-sato-sdk-ptest-1.0-r0 do_testimage: There were
>> failing ptests.
>> Traceback (most recent call last):
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py",
>> line 36, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py",
>> line 36, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/core/decorator/__init__.py",
>> line 36, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/runtime/cases/ptest.py",
>> line 25, in test_ptestrunner_expectfail
>>     self.do_ptestrunner()
>>   File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeq=
a/runtime/cases/ptest.py",
>> line 108, in do_ptestrunner
>>     self.fail(failmsg)
>> AssertionError: Failed ptests:
>> {'openssl': ['test/recipes/30-test_evp_extra.t,_test_returned_1']}
>
>
> I saw this on qemux86-64, but was not sure it was due to the upgrade or a=
 one off infra issue. I=E2=80=99ll dig deeper and see what might be happeni=
ng.

I re-ran the test and got the same error, so it doesn't seem to be intermit=
tent.

Thanks!

Steve

>
>>
>> Happens with both qemuarm64-ptest and qemux86-64-ptest:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2863
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3124
>>
>> Steve
>>
>> > https://www.openssl.org/news/cl111.txt
>> > https://git.openssl.org/?p=3Dopenssl.git;a=3Dlog;h=3Drefs/tags/OpenSSL=
_1_1_1m
>> >
>> > CVE: CVE-2021-4160
>> >
>> > https://nvd.nist.gov/vuln/detail/CVE-2021-4160
>> >
>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> > ---
>> > Changes in v2:
>> >  - drop SRC_URI[md5sum] that devtool snuck in.
>> >
>> >  .../openssl/{openssl_1.1.1l.bb =3D> openssl_1.1.1m.bb}            | 2=
 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >  rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb =3D> open=
ssl_1.1.1m.bb} (98%)
>> >
>> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/met=
a/recipes-connectivity/openssl/openssl_1.1.1m.bb
>> > similarity index 98%
>> > rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
>> > rename to meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
>> > index bf7cd6527ef..c6f8499d4f5 100644
>> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
>> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
>> > @@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D " \
>> >             file://environment.d-openssl.sh \
>> >             "
>> >
>> > -SRC_URI[sha256sum] =3D "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa8008=
8d7f9153aa16fa76bd1"
>> > +SRC_URI[sha256sum] =3D "f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad03=
0f5316aca6462db6c96"
>> >
>> >  inherit lib_package multilib_header multilib_script ptest
>> >  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>> > --
>> > 2.30.2
>> >

