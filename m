Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6F5F4612A
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:24:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18672.1774275836340534958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+vuf0yx;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb112c09so26044825e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275835; x=1774880635; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GopAwhG3AVcd4OT7Rk/9E/8R/1nIDtI03tCvfYpDFs=;
        b=d+vuf0yxy+AszsMGv4avY4dOIO3VpEpI+vqJwIkGsyFEFdomGile4zpsd/uPQGCWFJ
         uE/vNGOMMhqpOT4N/hiJpawE7s1WovsimRtVmnhfRkjE2m6tQXtODR5XO1Bc3g0uvror
         o65DZDUKmOzWu+8O4PpE5hp5CUV9mXsaw5cF6yOaUC5tTlD8Us1NiNfgoIGiModMdOxF
         0nGNoINxsdLlj4Tv1gPxYM3M5vakLI3CiknvlmC595G1uweaaiflToxdhzuj8EayYUEs
         xkPSZinm8G1A8FKVeZ/TmuT3UnSKXA767We73KJdjTqkrir3nDJiO3GqPCnakFQGf9RU
         b0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275835; x=1774880635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GopAwhG3AVcd4OT7Rk/9E/8R/1nIDtI03tCvfYpDFs=;
        b=qJJc35x4sLV4RQvmw2vo0NbZCw+bJwwGH1k2j1Tk4kjLM/zKNbL/jbyldCZ5q7Gl/J
         fQ0CEOmX+X1mE79EKxPf0Ktm5UQn8B/R2rTx3h02LrFMRptWsr0XncQYIO5/VdlXVTVW
         JjHn9EfkIyI3uJEJhoX6Zzd5seHu/CCZtD9eBU6oUzW4l/FhbVt5/3hZVpb58SVTYQNl
         VWCcWn1SCGJWjdfR+Qek2zQ+fHBLrpJ7/ZB7jFhypqbGE+kEdF26Uq3u5XWpvy4Hn+/L
         KDB1cnBhcBL8OChZO5XpwgWMsbey/TKMSlHtwQr5fCb2Y1LDV6Y6UHAEfCH/FZWR1vce
         Dmpg==
X-Forwarded-Encrypted: i=1; AJvYcCXwVPF0ZLBOXTbpqZlIE+x7ywZjoUP9fJx9aMvPGXLz3usGLSkwcYC0lgumcDHmkeEo6dG35XBNIXdH9vdbKoLBjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7aWYqdQ4HHXmdr77xocdZ+39+eiwcu5IN4t/5UgYnz2uvDW55
	CNyKrQuxxyx2A8ckPKTMPsd+p40LKG/QrStf/KIVDrJEDXPNLk0oelGz
X-Gm-Gg: ATEYQzwamFyq1Q6k3+D8UZQRyp/H2dNVbHgs4qUPKvqxYo7hbgF89xJkiH06IZMECag
	Qisyw4esCxHx70pue+twOkBbsVaJOyDrEeRAy5wCjpeh1L3zhY9wNQ3lrWKHWGv21b5Kt3Sj8m2
	m5Cr+1HEFAXIywrmXihvKH85lGKJMdKYBcGBGXrJw3mayQIc0TTCPnxR3BDYmsylWkLxfS/xGat
	9silC7Z7imPSa6+Y7XSYMEq1OIII99p1Oy+3S9fWASIjOH8yAeZZWLlIwjl7j18rklLJ9lpKQgU
	OGlwy2QSHqVcxfo4PymH8hJ7cLBjo8AzqxEzSLqZ//7whgIE4UVM1nefgtHU7Hg41fpxbHswr/u
	yOv3ZAjidU5Jv4ppyrdhIG9MDCq2LFqxB3mF/eoO7Iyq/9lJ+pz+wcfjNLv5lNZP48BbI9BfbLN
	xilK5TXNgkYlqzoTL8XlSfqGPdlDHRHdU3lWHmD/Hh7CVp8FuwWo2mklo=
X-Received: by 2002:a05:600c:3554:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-486ff01d7f3mr162082435e9.28.1774275834264;
        Mon, 23 Mar 2026 07:23:54 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe880c21sm86197275e9.8.2026.03.23.07.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:23:53 -0700 (PDT)
Message-ID: <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
Date: Mon, 23 Mar 2026 15:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233737

2026. 03. 23. 14:28 keltezéssel, Bartosz Golaszewski írta:
> On Thu, 12 Mar 2026 13:00:24 +0100, "Zoltan Boszormenyi via
> lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>
> said:
>> One of the main points in the Python 3.14.x release notes was
>> that free threading is officially supported.
>>
>> Add PACKAGECONFIG[freethreading] to turn it on with --disable-gil.
>> GIL is the Global Interpreter Lock, which is kept enabled without
>> this option.
>>
>> By default, keep free threading disabled, i.e. GIL enabled.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-devtools/python/python3_3.14.3.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
>> index 7047cd8e8d..7a1ad1e386 100644
>> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
>> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
>> @@ -112,6 +112,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
>>
>>   # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
>>   PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
>> +PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
>>   PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
>>   PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
>>   # Use profile guided optimisation by running PyBench inside qemu-user
>> --
>> 2.53.0
>>
> Thanks for doing this, I'm really interested in using free-threaded python on
> Yocto. However, when trying to enable this with current openembedded-core, I
> ran into the following problem:
>
> Loading cache: 100%
> |###############################################################################################################################################################################################################################################################|
> Time: 0:00:02
> Loaded 5224 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.16.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> SDKMACHINE           = "x86_64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "5.3.99+snapshot-8061433fcd11eba91a29004dfafd175d449fb2fd"
> TUNE_FEATURES        = "m64 x86-64-v3"
> meta                 = "master:8061433fcd11eba91a29004dfafd175d449fb2fd"
> meta-poky            = "master:c7fa63bea78248597798739aa4da49a9f4405b9c"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems     = "master:b883bd25cdd27560fdebc5a4bf56f90e99964c4c"
>
> Sstate summary: Wanted 254 Local 2 Mirrors 0 Missed 252 Current 2392
> (0% match, 90% complete)#############################################################################################################################################################
>                           | ETA:  0:00:00
> Initialising tasks: 100%
> |##########################################################################################################################################################################################################################################################|
> Time: 0:00:05
> NOTE: Executing Tasks
> ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> find header python3.14/pyconfig.h.
> ERROR: python3-3.14.3-r0 do_install: Execution of
> '/home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-poky-linux/python3/3.14.3/temp/run.do_install.2092850'
> failed with exit code 1
> ERROR: Logfile of failure stored in:
> /home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-poky-linux/python3/3.14.3/temp/log.do_install.2092850
> ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_install)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4513 tasks of which 4512 didn't need to
> be rerun and 1 failed.
>
> Summary: 1 task failed:
>    /home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_install
>      log: /home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-poky-linux/python3/3.14.3/temp/log.do_install.2092850
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
>
> Any hints on what could be wrong? The same config builds fine without the
> new option. It's just a core-image-minimal on poky with a few python packages
> from meta-openembedded.

The problem is that now the directories are
${libdir}/python3.14t and ${includedir}/python3.14t

Note the "t" suffix.

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb 
b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..492f2f93f0 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

  CVE_PRODUCT = "python:python python_software_foundation:python cpython"

-PYTHON_MAJMIN = "3.14"
+PYTHON_MAJMIN = "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethreading', 't', '', d)}"

  S = "${UNPACKDIR}/Python-${PV}"



