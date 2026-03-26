Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3FF109E552
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:29:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41123.1774502961846452399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 22:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fh2ufcp9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48538c5956bso4269025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 22:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774502960; x=1775107760; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2P3w5b07SGxbPsf+Oiq9W4uT4InqbEz4PE8GcPp5WXA=;
        b=fh2ufcp9ajrpJvMpQuH+STx/vjoKcq8HruGhjQmyTqna/9oK7QEBtvZyFttjjdE1Cl
         JYlgMKyLlhbZQOou4Fvcu8IeOVbLA6Uw7MDWNr9C0OlH068cKeL5lcPG54V3tir9m7Fx
         4kBHIzlGGdK8B5SZ0AggDNmzpSFQRoeoYNtELfqIFdpy6zupyFHbZPGlJX3E4iut5/wH
         nK+Iw9LB3FxkpUTb0qsoq54YFFAOG9cKTe2O9ON0FS3vWgL2ce/EKxkjX8ENcsayIrBC
         rTsi5b4HwAF4umHRU6QxIYkRKNQ7mcJLxKb3tLZaXG1jKhcd+hK+sEVHbASzAMgOVtRe
         RMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502960; x=1775107760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P3w5b07SGxbPsf+Oiq9W4uT4InqbEz4PE8GcPp5WXA=;
        b=mX+bxQgKRPdXl0yvMbWjODnjb3PXFdhSkMKn3R4QJkDGbld0YtvOxAggg4XIZ5JMz2
         jhFNTOrekG9Ykt/1qiZjQ8HMSHrxf+b00eHtUAXgKF3MFdbnYagJsbpkcJH7E+x7oH9v
         pRc8qwB+uvc6bQAuojT0xj4PjcwhadI9+MYEeSa44EXCMJ+GoMEIBwmmxwg3lN3yVeHb
         cYGhXzaMwoadKSjlat3epMVCErfyilKv+KrHHHgi9e9yup54/L6v9r/Eb4dwT2m1Lp3y
         i/EwtqT1x7vS7zuECTUhas2WN6rchdhVo/jmTreNcslcLxPUPZWKC9Nx3eP1w/lj5Vkl
         H0KA==
X-Gm-Message-State: AOJu0YwkEzCJjHdhGi4vlGEz2gAFHoibK4OKw7CSPjDfRPgNNIL6C0rg
	ITf4oSlVnowEJntc9ee7LOUOnTAdO/pvNGUn3G2Hfkro2MkjbOd1Ainy
X-Gm-Gg: ATEYQzyoylMv8JPf+GYgqrl119add7jcpuAxmGdO+kxH4q69uQb5Q3ZWLiC59SfBF/k
	C+J12zeQYxJpoXwOrI7J/pAs81l6sj1v86TJZzUnxWgkHfCPkAGTOWFOStoVvrThAuXqfTD9p1o
	I3o9JeRt89RpfjIsAimr/ufa5/bhjoWhlV7XzXu7ml7Q8yRAbE8oAJMG1SF+vJ70vX5JxYF75VW
	WSW3rh0TEr0nt84sKtkD3Th4ez+RHaFk+VeT1Mz0rSIlnkPC+NhVM2POyrqGH3dhbuuTI48lPUM
	QHQnAa1Bxdh6kiarMA1ivaoUVsZnyCf1ytt9RxQuLgb/OaD992LLiipoj1nuxQLF66MawrhFiEd
	WJyXV6+nF/D3KinqsPsPVRVDjSBiQXkAqsyBxfPmLmEl2+nH63BRL4VrcZIUAxnaUDucgntSM2F
	GtoGxdh0iEcBaK3PJ2TTy93bvG4mF60Qy1SlHamSphDjZC5DFF4xjrVD8=
X-Received: by 2002:a05:600c:a011:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-48722bfbba2mr2941555e9.16.1774502960139;
        Wed, 25 Mar 2026 22:29:20 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872092b540sm7275485e9.28.2026.03.25.22.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:29:19 -0700 (PDT)
Message-ID: <bd1d2cee-9e83-4ec5-a22b-a12291b74208@gmail.com>
Date: Thu, 26 Mar 2026 06:29:17 +0100
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
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CADkTA4P-Zz-uNyth-y1Zjaq0Y3O+Pk8qTM650_2QkL2ZCDEQBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233951

2026. 03. 25. 15:17 keltezéssel, Bruce Ashfield írta:
>
>
> On Wed, Mar 25, 2026 at 9:51 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>     2026. 03. 25. 14:17 keltezéssel, Bruce Ashfield írta:
>     >
>     >
>     > On Wed, Mar 25, 2026 at 9:13 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>     >
>     >     2026. 03. 25. 14:01 keltezéssel, Bruce Ashfield írta:
>     >     >
>     >     >
>     >     > On Wed, Mar 25, 2026 at 7:31 AM Zoltan Boszormenyi via
>     lists.openembedded.org <http://lists.openembedded.org>
>     >     <http://lists.openembedded.org>
>     >     > <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org>
>     wrote:
>     >     >
>     >     >     This patchset allows turning on Python freethreading by using
>     >     >     a new DISTRO_FEATURES setting:
>     >     >
>     >     >     DISTRO_FEATURES += "python_freethreading"
>     >     >
>     >     >     and optionally:
>     >     >
>     >     >     DISTRO_FEATURES_NATIVE += "python_freethreading"
>     >     >
>     >     >     The change to python3-dir.bbclass is crucial, as all python module
>     >     >     build helper classes rely on it.
>     >     >
>     >     >     I also added native variants of some settings because another
>     >     >     series against meta-openembedded is needed to complete this one.
>     >     >     In that, the change to the fontforge recipe relies on the native
>     >     >     setting for setting BUILD_LDFLAGS.
>     >     >
>     >     >
>     >     > Looking at those other patches in the series, they don't seem to
>     >     > be conditional on the distro feature.
>     >     >
>     >     > Are those changes valid for a build with and without freethreading ?
>     >
>     >     Yes!
>     >
>     >     The main change is in python3-dir.bbclass, and the recipe tweaks
>     >     are just adaptations to the fact that only ${PYTHON_DIR} is needed,
>     >     not ${PYTHON_DIR}${PYTHON_ABI} from that point.
>     >
>     >     I was thinking that the introductory mail stressed this enough.
>     >
>     >
>     > Obviously not :)
>
>     Obviously. :)
>
>     > I didn't get that impression at all from reading the introductory
>     > message or looking at the patches themselves.
>     >
>     > You have the overview knowledge of the feature, why it is
>     > useful, how it impacts existing recipes, how the migration would
>     > work, what is the compatibility, etc.
>
>     I think the Python 3.14 release notes has enough details.
>     See also https://www.phoronix.com/news/Python-3.14
>
>
> The information needs to be distilled into your commit, not left
> to the patch reader to go off and read release notes. That's the
> point I'm trying to make.
>
>
>
>     With the two series I sent, only a single recipe is left (cmpi-bindings)
>     in openembedded-core and meta-openembedded that uses
>     the PYTHON_ABI setting explicitly.
>
>     Migration (of python scripts) should not be a problem.
>     If it worked with 3.14 as is, it works with freethreading enabled.
>
>     Compatibility is poor for a lot of modules, that clearly spell this out
>     in their pyproject.toml or PKG-INFO:
>
>          "Programming Language :: Python :: Free Threading :: 1 - Unstable"
>
>     or something not quite production level support.
>     It's still experimental for 3rd party modules, despite being officially
>     supported for the interpreter and built-in modules in 3.14.
>
>     This is the reason this was an RFC series.
>
>     Anyway, the reason I was experimenting with this was that
>     with heavily threaded python code, an import storm can cause
>     a crash in 3.12.11 or the manually updated 3.13.12 in Yocto 5.3 in
>     importlib._bootstrap according to the backtrace.
>
>     I would like to see if Python 3.14 (with and without freethreading)
>     fixes such crashes.
>
>
> Definitely worth putting in the RFC as well, the motivation for
> the change matters!
>
>
>     > The patch reader doesn't, so that all needs to be clearly
>     > supplied.
>
>     Maybe next time for v2 after I have a complete image
>     successfully built with freethreading enabled.
>

No such luck.

lldb in clang won't build because its swig source wants to play games
with PyObject->ob_refcnt directly instead of using the proper macros.
That struct member does not exist when freethreading is enabled.
In fact, the whole struct _object (the PyObject implementation)
is different when freethreading is enabled.

The llvm sources, even in the newly released 22.x and main
do not have any reference to the Py_GIL_DISABLED macro,
so as a whole, it does not support Python freethreading.

I can revisit this series a few year later when llvm adds the
necessary support, which can be backported to older clang
versions in my meta-clang-revival.

This concludes my little experiment.

That being said, I think the cleanup in the recipes is a good direction.
PYTHON_DIR should include PYTHON_ABI in python3-dir.bbclass
because build helper classes rely on it. Then PYTHON_DIR must be
used consistently in recipes that need it, even if PYTHON_ABI stays empty.

>
> Ack'd
>
> Bruce
>
>
>     >
>     > Bruce
>     >
>     >
>     >
>     >     FWIW, less than 30 recipes was spelling the latter out in
>     >     openembedded-core and meta-openembedded combined.
>     >
>     >     > That's the type of information, along with the benefits of enabling
>     >     > this would be information expected in a 0/N introductory patch.
>     >     >
>     >     > Cheers,
>     >     >
>     >     > Bruce
>     >     >
>     >     >
>     >     >     All of the changes included here were successfully build tested,
>     >     >     except for the gdb-cross-canadian change. That one failed, but
>     >     >     it's included for completeness.
>     >     >
>     >     >     Quite a few of python modules were build tested for native and
>     >     >     target builds, including python3-pytorch from my meta-python-ai
>     >     >     with reduced RDEPENDS because e.g. python3-onnx there failed
>     >     >     to build with freethreading enabled.
>     >     >
>     >     >     All in all, this series at least allows to get things going.
>     >     >     Though maybe not for Yocto 6.0, as it's quite late.
>     >     >
>     >     >     Best regards,
>     >     >     Zoltán Böszörményi
>     >     >
>     >     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >     >     Links: You receive all messages sent to this group.
>     >     >     View/Reply Online (#233874):
>     >     > https://lists.openembedded.org/g/openembedded-core/message/233874
>     >     >     Mute This Topic: https://lists.openembedded.org/mt/118499141/1050810
>     >     >     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
>     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
>     >     >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
>     <mailto:openembedded-core%252Bowner@lists.openembedded.org>
>     >     <mailto:openembedded-core%252Bowner@lists.openembedded.org
>     <mailto:openembedded-core%25252Bowner@lists.openembedded.org>>>
>     >     >     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     >     >     [bruce.ashfield@gmail.com]
>     >     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >     >
>     >     >
>     >     >
>     >     > --
>     >     > - Thou shalt not follow the NULL pointer, for chaos and madness await thee
>     at its end
>     >     > - "Use the force Harry" - Gandalf, Star Trek II
>     >     >
>     >
>     >
>     >
>     > --
>     > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>     > - "Use the force Harry" - Gandalf, Star Trek II
>     >
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


