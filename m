Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1277.1616604738062610928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=F7NkF9Hm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.216.51, mailfrom: scott.branden@broadcom.com)
Received: by mail-pj1-f51.google.com with SMTP id ha17so12076293pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=wMGiABKtyupUt6Ef4VsZavoXHhUUTOwB18fZx1mryzI=;
        b=F7NkF9Hm1mdmVs7dOVS/12azOAjd6p5JLBdjBg3SrbYP5qtqx0kBHezSw2QSaPloKO
         H1yK7IVHPONUNwIx6kzW7rEntlKL+sVzdgc+B1H0O12EUKwgIix4wKDZaim1Y0bIJT0K
         XSwEfAx1HOJALxCmoBgRfu5E4Yjnmpy9Te4yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=wMGiABKtyupUt6Ef4VsZavoXHhUUTOwB18fZx1mryzI=;
        b=n8jxndV/1U9lPqyOdBiA3SWb1g2ba9+EuP6nF/5fgJsQiaQLKSi59EeC7AtKGwuEVM
         JKy2CkJa1+n/E2Zpld+esTaAS3NFXQ1ncJY+GQWHO1XKaTo+YbifEhveiE+noG1XWVaG
         lvs7rmwCkBoZzDBuPLZTZhvDw0ANSZp9c5bS7UBCYivQfy2oxTlQB0dYNumGE2gQTbSQ
         mz/qFqJQiM9t3XZrlho4ctaK0ioPih3KOcj2ORuB97Gl0IJIlSnS8zahw8S3M3i2fY7u
         8goUrxCu+oG+uZProCQ2/q16YbmUXcswRydjS7lVKFMGIFXWev/uTJXiBm17IYJclfI+
         lhJw==
X-Gm-Message-State: AOAM5306oVhqQ/qmqrikKhYBBxiXCv92rBfTVPkgof6TGDe1omEmGGDa
	Yo28XmaCBAwEQKhYtgXqY/zREQ==
X-Google-Smtp-Source: ABdhPJx5m0r4wViphOrmKr8LQ3G0/uAaleurByyS//0l6DmQQPUPYLEbpB77J6dDcopeGfXdfheXNw==
X-Received: by 2002:a17:902:b70e:b029:e6:cef9:6486 with SMTP id d14-20020a170902b70eb02900e6cef96486mr4658530pls.18.1616604737386;
        Wed, 24 Mar 2021 09:52:17 -0700 (PDT)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id y23sm3011729pfo.50.2021.03.24.09.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 09:52:16 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org, bluelightning@bluelightning.org
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
 <20210311150959.782186-1-luca.boccassi@gmail.com>
 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
 <20210315135555.hlkwmj4yj5ugw2he@jama>
 <166C88B2CBAB1BAF.20509@lists.openembedded.org>
 <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <c9335d1e-e133-1c1c-65f1-13fac6b6b43d@broadcom.com>
Date: Wed, 24 Mar 2021 09:52:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 149894
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000023a5a205be4b1f66"

--00000000000023a5a205be4b1f66
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I have not debugged yet, but I suspect this change is causing the following failure if I merge the latest poky into our builds:

ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: QA Issue: util-linux-uuid: Files/directories were installed but not shipped in any package:
  /usr/lib/debug
  /usr/lib/debug/usr
  /usr/lib/debug/usr/lib
  /usr/lib/debug/usr/lib/libuuid.so.1.3.0.debug
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
util-linux-uuid: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: mc:host:util-linux-uuid-2.36.2-r0 do_package: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /hdd/yocto/genx/poky/build/tmp/work/core2-64-poky-linux/util-linux-uuid/2.36.2-r0/temp/log.do_package.31753
ERROR: Task (mc:host:/hdd/yocto/genx/poky/build/../meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package) failed with exit code '1'

On 2021-03-15 2:51 p.m., Richard Purdie wrote:
> On Mon, 2021-03-15 at 13:57 +0000, Richard Purdie via lists.openembedded.org wrote:
>> On Mon, 2021-03-15 at 14:55 +0100, Martin Jansa wrote:
>>> On Mon, Mar 15, 2021 at 12:21:37PM +0000, Richard Purdie wrote:
>>>> On Mon, 2021-03-15 at 11:50 +0000, Luca Boccassi wrote:
>>>>> On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
>>>>>> On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
>>>>>>> On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
>>>>>>>> On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
>>>>>>>>> From: Luca Boccassi <luca.boccassi@microsoft.com>
>>>>>>>>>
>>>>>>>>> Recently util-linux gained an (optional) build dependency on libcryptsetup.
>>>>>>>>> But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
>>>>>>>>> and uuid (mandatory).
>>>>>>>>> Split out util-linux-uuid in a different recipe to break the cycle.
>>>>>>>>>
>>>>>>>>> https://github.com/karelzak/util-linux/pull/898
>>>>>>>>>
>>>>>>>>> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>>>>>>>>
>>>>>>>> Unfortunately I noticed we had a performance regression in buildtimes in 
>>>>>>>> recent changes. The closest I have this narrowed down to so far:
>>>>>>>>
>>>>>>>> https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
>>>>>>>>
>>>>>>>> suggests it may be this change. I have more tests queued to confirm
>>>>>>>> that definitively, if so we'll have to figure out why as this shouldn't
>>>>>>>> really happen, its an 8% regression :(.
>>>>>>>
>>>>>>> Very strange that a single recipe could do that - is there something
>>>>>>> wrong in the new .bb that I missed and could cause this?
>>>>>>
>>>>>> I'm wondering if it is because we're building util-linux twice now and
>>>>>> there is some key choke point in the dependency chain. I have no evidence
>>>>>> for that yet, it is just speculation though.
>>>>>
>>>>> With the autoconf options I've set, on my laptop it takes 32s to do
>>>>> configure + make -j2. Most of that is autoconf - make -j2 takes 8s.
>>>>>
>>>>> Only 3 libraries are built with this combination: libcommon.a,
>>>>> libtcolors.a, and libuuid.a/so. No executables or anything else is
>>>>> built. It doesn't look like libtcolors is actually needed, I'll see if
>>>>> I can prepare a patch to skip it, but I don't think it will buy more
>>>>> than 1s, it's just two object files.
>>>>>
>>>>> The good news is that meson support is about to land upstream, which
>>>>> should be significantly faster than autoconf + make:
>>>>>
>>>>> https://github.com/karelzak/util-linux/commits/topic/meson
>>>>
>>>> Meson definitely improves the speed! I was wondering if it was from
>>>> configure for example.
>>>>
>>>> I now have more performance test results in (takes time to interleave 
>>>> them with testing of master):
>>>>
>>>> https://autobuilder.yocto.io/pub/non-release/20210315-1/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210315005048_6bb1621815.html
>>>>
>>>> and I think this means it isn't from the util-linux change but one of 
>>>> another three. I'm not entirely convinced those changes could do this
>>>> but it is what the data says. 
>>>>
>>>> I've queued more bisection to narrow it down from there...
>>>
>>> BTW: this split also needs manual cleanup in the TMPDIR, right?
>>
>> It shouldn't. The system should spot that util-linux has changed and uninstall
>> it from the sysroots as it goes. There is something not working right there :(
> 
> I was wrong about that, the system doesn't have code for this, it has code for
> the sysroots but not for other sstate tasks.
> 
> I think this is an oversight and we need to simplify things and make this cleanup
> happen pre-build, much like the "unreachable" tasks cleanup happens today. If we
> do make this happen, we probably need to add parallelism as the number of stale
> sstate tasks being cleaned could be substantial.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 


--00000000000023a5a205be4b1f66
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
cRe0CRXA7ypOJSgxO/nOOyQoaJxT7CGg1npOeSpPjEuc3fE4xum3l0nvU85hj6MlKZu43hokdBh0
D0nLyyhEwlR3AC/msdff/UGbM/JR9vk812RP4m/aNWZFJwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUOhjEpl04Sz9dh5MI82E1
V39lM/owDQYJKoZIhvcNAQELBQADggEBAA7Rlypx/esz/iq1yA4+KW7uwV/aBY344BWcXt6I+SNK
VwFBgFWfLj5vaEud9TVv2fPSiaHJo0umemOJk+43QD+bsoqmgcFXd21PrOt7Jjs+jjVED9VC5kJq
S4NNKUkS+BqijJwSegtVygrc/atrIlJbjI21q4qpemUo5fgwqCNm++BmBGTI8yA09vtGSNDRN42k
lLX9hl3iEj5SBgkQqCbbnoE+ZjjKfqt7ED166WhgyQWNrl39yLcvLj+JRUB3RuvXKZjH0NQEEBII
wZBDSkyneykLt3CBNIhSCTxKM6OWxVp936ALSa5K9FNy00TeWSpokR6NmzaW8VD/EjTgvqAxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgx9oXSJpKniO4dS
Gk8wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIP7FsGkn6UsLsVXLf8ajLgRKHfqn
WlzZhs2Hby6rGB5oMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIx
MDMyNDE2NTIxN1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAxHWdpp6OOVwhaRaMZC5VJANlgZafuM9Z8H/umD0QKEINQ
ghSLWUhM9QqSt0nB+QsWFjGbdJhgZ+S0S9us5XG/P7KUc6pgkeY9gKIiMWDfuVXauI7SyKGSHEX0
x7qSZ5UcQhFTOJEYDFlCNcFyp814PxSiLMZgzNtT2VQ+krLmy8WE4rk3ZgO1mXKBX8ELA8up/atf
G3TNBDr6nbyfGb1Uau2GcM+19jQc6sgi8wrLNoIfD+VRcJ3ZMDB5o7nSWc3RQhQKmOaWoOi9Amzo
MymMrR4eQYeAy4PgjOONz2HvsxnkFPiEFyreZj2Le4iBkgZ0NQbF80au3Fd1gXSW9deY

--00000000000023a5a205be4b1f66--
