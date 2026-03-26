Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6CE109E557
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:41:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41761.1774503673235745442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 22:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gv+65Y8d;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso5431105e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774503672; x=1775108472; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WVXGEyYgPJvZPzrpV14vmtPK36pwD3q421vudveuNs=;
        b=Gv+65Y8dr6bH8DzvdRMfIhbIbPELS/5l+PVCuqGbellxYLMCQBBdDFf+0QagA/794O
         YRDZ4WvZiHzdfVOjI2oI0nM3kzFqpo1KS7m5Ergfo955A9jIFI2f8wyUHWBxCdq5TGUH
         lr+OCSZB5yRk5w3MRh4V8Q/+qS0h+PsBta5Znm7lGm4eHQpCyVMfTTycB75Jn1Cvoing
         B4Kg5ybezkdGozkrSATKUuCzI2MTrTtKVgLH89PEHWusdYUl10jRSZ3sEm3Qn6vyotCP
         W8gPqoxP+FqL7SGde/TPo2EtCdXfpsd9Ar+8gF+1C4dTZrGinTUEwhTS5HRXeJvr3+m8
         suDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503672; x=1775108472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WVXGEyYgPJvZPzrpV14vmtPK36pwD3q421vudveuNs=;
        b=GY7Ki9VDG18shgWjIRrEyZGoK35cYmPv8Dc77ydPiwd8cT1pWRa5icE2NU3wH/rvYg
         Cw87UAk40jk0NtUVPizZCYeKAx0w6tptdXbKYmPpqlIHRDAzuPuDRv+5DWZekrU52e+A
         N9Sn2etS7F0c6E4x5pgBdS6Si084+aAMOYMHXdcLC6dLz8x3ezE+9RR8X8jP/zYKbXMX
         giM+tSVdvmhofDSRlNyB8AQ5NQMmzyMdh6D3nEb1jH7hGkRnZTpfLlfXWDApp+itOWSY
         jSWV00oDDJ0CO3cx4oq3dtqLBr/gu+31JBdh4dJrCfGZhP7j3O1AzOcoMp3BWBoknnmJ
         MSUA==
X-Gm-Message-State: AOJu0YzJ1wE4QisXNpkASLmkU1qYkwojXRVXkgR5a3ZlpkrSliefJa71
	dK7TtAJh7BFPgI8ZwOAtQFteP+GXP2tj+1OVFrb6Bk0FPmHx+weZnsMg
X-Gm-Gg: ATEYQzzI/eiwZYTKqoafr02O4SD7XckmrhwAeqx95uoyDnEU4uFhR85CZnxUWy28rzd
	GYeZODgjGThQHXKvZcjDYW6SHnRZz/vBvocoFXYWMtjYk52FAujovHzzqcFJLe40mPCbVrDPTK0
	kpgafvoWTwOy0GXtD0ZDahgg85nkJSf2ZJulGcAxVk3gk+UGdqnTX0QFIj8N/VZPAs7Knf7ag+r
	hteb5/tqq8rPgphVadzS10EeaQ+9+bSCQBwzY96HjtzosLgYmwMwhfLcLIKl6qXM8Ykq2De/S+z
	UqecC7ZQKEwrWOQNq4YJbfFr0/qkbv7B9juB/sTxa7XhBmpmmz1hT8AYv+BMLSr3Iiph4reVrEH
	lq1Vf099X4JfhODW26nHV+6uSDB1Iq/BDnVniXComeNaXEo4DLn3vcEtdOp/IXm4fhxgIjEXuha
	ntzXZWDtsTHAzyOjAFUwyhqixbePoLFXk/Ra97WJh79nhGa8TWNQaULOEVWdsw3b2tZA==
X-Received: by 2002:a05:600c:1715:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-4871a895b4emr37581925e9.20.1774503671455;
        Wed, 25 Mar 2026 22:41:11 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm8194515e9.3.2026.03.25.22.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:41:10 -0700 (PDT)
Message-ID: <3bf2c312-1d58-4ef5-acbf-72735ddf9e09@gmail.com>
Date: Thu, 26 Mar 2026 06:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
 <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
 <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com>
 <CADkTA4MOXYq1xQaGgGnREmgQUTQaEDTskv1aWRyM9zqiXxAuJA@mail.gmail.com>
 <2646923f-34d6-4cb5-9e9a-ac8ec789c359@gmail.com>
 <CADkTA4P-Zz-uNyth-y1Zjaq0Y3O+Pk8qTM650_2QkL2ZCDEQBQ@mail.gmail.com>
 <18A04D0ADBD32036.57592@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18A04D0ADBD32036.57592@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233952

2026. 03. 26. 6:29 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2026. 03. 25. 15:17 keltezéssel, Bruce Ashfield írta:
>>
>>
>> On Wed, Mar 25, 2026 at 9:51 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>
>>     2026. 03. 25. 14:17 keltezéssel, Bruce Ashfield írta:
>>     >
>>     >
>>     > On Wed, Mar 25, 2026 at 9:13 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>     >
>>     >     2026. 03. 25. 14:01 keltezéssel, Bruce Ashfield írta:
>>     >     >
>>     >     >
>>     >     > On Wed, Mar 25, 2026 at 7:31 AM Zoltan Boszormenyi via
>>     lists.openembedded.org <http://lists.openembedded.org>
>>     >     <http://lists.openembedded.org>
>>     >     > <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org>
>>     wrote:
>>     >     >
>>     >     >     This patchset allows turning on Python freethreading by using
>>     >     >     a new DISTRO_FEATURES setting:
>>     >     >
>>     >     >     DISTRO_FEATURES += "python_freethreading"
>>     >     >
>>     >     >     and optionally:
>>     >     >
>>     >     >     DISTRO_FEATURES_NATIVE += "python_freethreading"
>>     >     >
>>     >     >     The change to python3-dir.bbclass is crucial, as all python module
>>     >     >     build helper classes rely on it.
>>     >     >
>>     >     >     I also added native variants of some settings because another
>>     >     >     series against meta-openembedded is needed to complete this one.
>>     >     >     In that, the change to the fontforge recipe relies on the native
>>     >     >     setting for setting BUILD_LDFLAGS.
>>     >     >
>>     >     >
>>     >     > Looking at those other patches in the series, they don't seem to
>>     >     > be conditional on the distro feature.
>>     >     >
>>     >     > Are those changes valid for a build with and without freethreading ?
>>     >
>>     >     Yes!
>>     >
>>     >     The main change is in python3-dir.bbclass, and the recipe tweaks
>>     >     are just adaptations to the fact that only ${PYTHON_DIR} is needed,
>>     >     not ${PYTHON_DIR}${PYTHON_ABI} from that point.
>>     >
>>     >     I was thinking that the introductory mail stressed this enough.
>>     >
>>     >
>>     > Obviously not :)
>>
>>     Obviously. :)
>>
>>     > I didn't get that impression at all from reading the introductory
>>     > message or looking at the patches themselves.
>>     >
>>     > You have the overview knowledge of the feature, why it is
>>     > useful, how it impacts existing recipes, how the migration would
>>     > work, what is the compatibility, etc.
>>
>>     I think the Python 3.14 release notes has enough details.
>>     See also https://www.phoronix.com/news/Python-3.14
>>
>>
>> The information needs to be distilled into your commit, not left
>> to the patch reader to go off and read release notes. That's the
>> point I'm trying to make.
>>
>>
>>
>>     With the two series I sent, only a single recipe is left (cmpi-bindings)
>>     in openembedded-core and meta-openembedded that uses
>>     the PYTHON_ABI setting explicitly.
>>
>>     Migration (of python scripts) should not be a problem.
>>     If it worked with 3.14 as is, it works with freethreading enabled.
>>
>>     Compatibility is poor for a lot of modules, that clearly spell this out
>>     in their pyproject.toml or PKG-INFO:
>>
>>          "Programming Language :: Python :: Free Threading :: 1 - Unstable"
>>
>>     or something not quite production level support.
>>     It's still experimental for 3rd party modules, despite being officially
>>     supported for the interpreter and built-in modules in 3.14.
>>
>>     This is the reason this was an RFC series.
>>
>>     Anyway, the reason I was experimenting with this was that
>>     with heavily threaded python code, an import storm can cause
>>     a crash in 3.12.11 or the manually updated 3.13.12 in Yocto 5.3 in
>>     importlib._bootstrap according to the backtrace.
>>
>>     I would like to see if Python 3.14 (with and without freethreading)
>>     fixes such crashes.
>>
>>
>> Definitely worth putting in the RFC as well, the motivation for
>> the change matters!
>>
>>
>>     > The patch reader doesn't, so that all needs to be clearly
>>     > supplied.
>>
>>     Maybe next time for v2 after I have a complete image
>>     successfully built with freethreading enabled.
>>
>
> No such luck.
>
> lldb in clang won't build because its swig source wants to play games
> with PyObject->ob_refcnt directly instead of using the proper macros.
> That struct member does not exist when freethreading is enabled.
> In fact, the whole struct _object (the PyObject implementation)
> is different when freethreading is enabled.
>
> The llvm sources, even in the newly released 22.x and main
> do not have any reference to the Py_GIL_DISABLED macro,
> so as a whole, it does not support Python freethreading.
>
> I can revisit this series a few year later when llvm adds the
> necessary support, which can be backported to older clang
> versions in my meta-clang-revival.
>
> This concludes my little experiment.
>
> That being said, I think the cleanup in the recipes is a good direction.
> PYTHON_DIR should include PYTHON_ABI in python3-dir.bbclass
> because build helper classes rely on it. Then PYTHON_DIR must be
> used consistently in recipes that need it, even if PYTHON_ABI stays empty.

Which means I can re-send the whole series as a cleanup
or preparation series without the DISTRO_FEATURES enablement
part in python3-dir.bbclass.

That one can stay RFC as a standalone patch, separate from
the cleanup series.

I will re-test my build without enabling freethreading
before I would do that.

>
>>
>> Ack'd
>>
>> Bruce
>>
>>
>>     >
>>     > Bruce
>>     >
>>     >
>>     >
>>     >     FWIW, less than 30 recipes was spelling the latter out in
>>     >     openembedded-core and meta-openembedded combined.
>>     >
>>     >     > That's the type of information, along with the benefits of enabling
>>     >     > this would be information expected in a 0/N introductory patch.
>>     >     >
>>     >     > Cheers,
>>     >     >
>>     >     > Bruce
>>     >     >
>>     >     >
>>     >     >     All of the changes included here were successfully build tested,
>>     >     >     except for the gdb-cross-canadian change. That one failed, but
>>     >     >     it's included for completeness.
>>     >     >
>>     >     >     Quite a few of python modules were build tested for native and
>>     >     >     target builds, including python3-pytorch from my meta-python-ai
>>     >     >     with reduced RDEPENDS because e.g. python3-onnx there failed
>>     >     >     to build with freethreading enabled.
>>     >     >
>>     >     >     All in all, this series at least allows to get things going.
>>     >     >     Though maybe not for Yocto 6.0, as it's quite late.
>>     >     >
>>     >     >     Best regards,
>>     >     >     Zoltán Böszörményi
>>     >     >
>>     >     >
>>     >     >
>>     >     >
>>     >     >
>>     >     > --
>>     >     > - Thou shalt not follow the NULL pointer, for chaos and madness await thee
>>     at its end
>>     >     > - "Use the force Harry" - Gandalf, Star Trek II
>>     >     >
>>     >
>>     >
>>     >
>>     > --
>>     > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its 
>> end
>>     > - "Use the force Harry" - Gandalf, Star Trek II
>>     >
>>
>>
>>
>> -- 
>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233951): https://lists.openembedded.org/g/openembedded-core/message/233951
> Mute This Topic: https://lists.openembedded.org/mt/118499141/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


