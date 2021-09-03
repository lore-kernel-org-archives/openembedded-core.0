Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.6429.1630685409695678150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmV+uYuO;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id k24so5968903pgh.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=zvAug0PfRtw3o4HbFS56a8XVGtfEawxExADGBFGGeUI=;
        b=hmV+uYuOGWP687sQ/GO1zuKvHMkgq2V60KnO4BtzXjqGJoNGj54SffgZ+mj65VvT3n
         Mgf1rZhBwzNTQR3XqtGkhA4mquPG/OcmCr05ldB2CDRc6BEFvuTq2N0RXKgJNSq/Lr07
         VEegjyMjR/SGUna1avGzt6SV5z03GwFsnv1vzdTgtm/SPpmAwxX8k73reIjocbqz9Oyn
         6Kg3MZMFtktZVZyMEoKoScVF2zjFP/LjUHUpzzDq/WONy7PSy4YGBne2oFDf3Bl3uGpO
         jWmt+75d7Ez+KoaogCapgtjnG7waWE+JlBHWC7TZ1fc9M+LNTIxZCOfuM8a2Vdm9f5KN
         9CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zvAug0PfRtw3o4HbFS56a8XVGtfEawxExADGBFGGeUI=;
        b=tirxPey8AELczCUZfiUUIJ5ufsQKWfzL6mtY27rtSQtMtREacpi8lAI2ZN0b9IlNlX
         BHJ8UDNI6R11MTuA1P08VUMnOegX2GyYPbH3nfLSk2vvicigYIZqL4fZa+wZ5X3MLVsr
         8VoTK6joQFaogtZlz2n8PbaFZMbYEE1i0fptpmw9QckhUvuKfVSZEpOsRhhL+VSUbJIu
         EuEwVLbz5CSPQ+TSxeBnlLbugubCAilnAhgtyo2c/uz73/GBaKk686yB6xTaQ7y69Wd5
         MrNZAWbsFy5nPMozNbGwehrJY2je0XCnetKuIhBfr7nmtaIC3/MxM2Fhf1lkYZr0KZEF
         vKRQ==
X-Gm-Message-State: AOAM531nquUkuJ7DYKRhUqfgAFbrv6w9TIEye5wy8tHrrHhIveH+YjiM
	Vxf1uTgexbm6hX4yZVi684Ys/wLPQU6R+g==
X-Google-Smtp-Source: ABdhPJwszFRgWHj9Hi90RHZ38IAdi/ToEy7+C/vdr2TvEotwARSMM8TxH/sXuMm2Q5bfiolkJAEnsQ==
X-Received: by 2002:a62:8281:0:b0:3f6:3b92:3698 with SMTP id w123-20020a628281000000b003f63b923698mr4059321pfd.55.1630685408839;
        Fri, 03 Sep 2021 09:10:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:fc1f:bf2e:354:14db? ([2601:646:9200:a0f0:fc1f:bf2e:354:14db])
        by smtp.gmail.com with ESMTPSA id d6sm5789809pfa.135.2021.09.03.09.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 09:10:08 -0700 (PDT)
Message-ID: <f7ca9fdf-7d8a-a796-5b26-a1c71bb3c43b@gmail.com>
Date: Fri, 3 Sep 2021 09:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [OE-core] wanting to clarify some shared lib install and packaging issues
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <e819f3ff-af68-fac7-b1a8-19a5b1f26d7@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <e819f3ff-af68-fac7-b1a8-19a5b1f26d7@crashcourse.ca>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/3/21 3:57 AM, Robert P. J. Day wrote:
> 
>    some really basic observations and questions about shared libs from
> BB recipes as i'm trying to resolve some issues related to a weird
> hybrid build system that overrides the standard do_install() task by
> manually populating the "image" directory for each recipe, then hands
> control over to bitbake to take it from there.
> 
>    first, quick review as i am going to have to explain all this to
> some folks, so let's make sure i don't sound like an idiot. from the
> explanation here:
> 
>    https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
> 
> when a BB recipe creates a shared lib, i typically expect to see the
> following under image/usr/lib/ (example from "nettle" directory
> building for aarch64):
> 
>    libhogweed.so -> libhogweed.so.6.4          [linker name]
>    libhogweed.so.6 -> libhogweed.so.6.4        [soname]
>    libhogweed.so.6.4                           [real name, actual lib]
> 
> based on default packaging defined in bitbake.conf, i then expect to
> see the "base" package "nettle" install the following on the target:
> 
>    libhogweed.so.6 -> libhogweed.so.6.4
>    libhogweed.so.6.4
> 
> while the development package nettle-dev will contain support the
> linker name linking to, well, one of the above:
> 
>    libhogweed.so -> libhogweed.so.6.4
> 
> so far, nothing interesting, but this packaging means that, on the
> target, if something needs to link against the libhogweed library, it
> would normally link using the soname, "libhogweed.so.6", so a file by
> that name *must* exist on the target and, normally, it does (even if
> it's a symlink).
> 
>    here's what i just ran into -- this hybrid system that bypasses the
> normal BB install step and manually populates the image directory
> makes a bit of a mess with setting the symlinks and names properly,
> but this was "fixed" by totally redefining the standard recipe
> packaging, so that *all* shared lib files (all three forms) were
> stuffed into the base package. and as long as that weird repackaging
> was in place, everything "worked".
> 
>    along comes me, who really hates this re-definition of what goes
> into each package as it packages far more for the target than is
> necessary, and i revert the packaging back to the standard ... and
> things break, and here's why.

you have to be a bit careful while undoing it. one usecase which can 
break subtly is when some program is trying to dlopen a .so since it 
maybe just calling it by libfoo.so

> 
>    the end result of the weird hybrid installation and my reverting the
> packaging is that what ended up on the target in terms of the shared
> libs was simply:
> 
>    libfubar.so
> 
> that is, the actual shared lib (not a symlink), but with the linker
> name, not the soname, which would appear to be the cause of all sorts
> of things suddenly not running anymore, as a quick inspection showed
> systemd services trying to start and complaining:
> 
>    ... error while loading shared libraries: libfubar.so.1 ...
> 
> so i just want to confirm that all of that is due to the shared lib
> having been packaged and installed on the target via its linker name,
> not its proper soname, correct?

yes without looking at the code and what amends you made, it seems to be 
the reason.

> 
>    it *seems* like that's all i have to fix, but am i overlooking
> anything? as long as the shared lib is findable via its soname, should
> that be the general solution?

yeah, let OE installer do the right thing perhaps and fix the odd ones 
manually in do_install might be a middle way and reduce future 
maintenance, however watchout for shared libs whose builds might not be 
using soname versioning strategy. but I guess build time QA should warn 
about them loudly.

> 
> rday
> 
> 
> 
> 
> 
