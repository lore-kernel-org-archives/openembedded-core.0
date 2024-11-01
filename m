Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB47E6B27B
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 13:17:55 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.37720.1730467065132748422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 06:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MdB+f+a8;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4609beb631aso13085221cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730467064; x=1731071864; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHcZFdjVdEpe+f71vEPevE3EbedIR6d2noiHlSDIbzI=;
        b=MdB+f+a8NLXQ4ijf2n2dWM4MqkFxQ0m79jSq+uS5xu5b5DHb9nfx4O/OmewRUEz8c6
         4k9kVgLk6WZiN9uqIKiwv0sBYMdgh4PsHtBAtAG7a+OlbpZXNgjRFaPGY9j4a+ZtiVul
         l5sg6S2p/epgOimTrJF5HqfjXBl6xfhIQ9/GFATdDbMWx+vu4lA+HGl3w4u03n6icRx/
         S9CcjUAjqkJdXymakUBxbDiRR6U3GlcWNFGiiEwx3wxA/rpQnbp68+QDbtOoUQW33std
         c1Ya+DpwaSJlubTMYPWNg/mqZDjypRYpL4219SZhwfpDZbksOaD4x3Cg67dqTJMK3ifj
         ra0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467064; x=1731071864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHcZFdjVdEpe+f71vEPevE3EbedIR6d2noiHlSDIbzI=;
        b=FzhuTeHoytSjzyDixJRaSKTQ2zeeqzM9pS1D9cxpGgWyV1P1Lgj2WJk09P809GwHjz
         LC2nwEZzVdn+2zo7pd1d3DGo9y/oSPK01mOJhLa9W9YiWt2qITDuIUnwfPzzo0uUX0Oa
         aTwEyoA4KKjQJ0XnPWm8W9Qkd8WNV71U4q2eqTGBx46g8dlhXdXuxPhjJ7Apt179Abpc
         ko7FQHwyw7chxppimWr/LfCA6vkoL8Ai9Y84JCGGX8deAnFvVRJ5dH/f/Q3s800LYuuX
         pzJVPREXKEsx3aFFyiiCUDsIhYPQxcdUUKPqzYmRiU3ZNrd8RSs2y/q55qycmdEtUDQt
         G73Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtSm5U209ohpSju4KBFdP6lzknZKW/lBxjeAe+b5Lzni6llOBiPjRLLkFV4o8BtmFr3J6Vrb1nAHYUwpci8+jEXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyApZzBWjMiW+9vIx9L66FJm/BeHgHV+iWMys8jQZnn56IpvWK3
	8g0HQKewUFecyms2t9FnpsHInWGvvuJgyYh7G8LQ5b7tSHA4Tmp3uFp7pDKp/TevvkaPnyqD4qa
	M
X-Google-Smtp-Source: AGHT+IFURdRYHFpUpy67OjK/xvSNeRYKGxAKEiKhppqPlVRmJLosZftHj/kcjNdz4UugY6aq7Z4hcw==
X-Received: by 2002:a05:6214:5884:b0:6cb:eb51:a26a with SMTP id 6a1803df08f44-6d35c1aea92mr43234876d6.47.1730467064080;
        Fri, 01 Nov 2024 06:17:44 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35417a3afsm19128216d6.126.2024.11.01.06.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 06:17:43 -0700 (PDT)
Message-ID: <78c5f303-4f31-496f-9ecb-08627db1fda1@baylibre.com>
Date: Fri, 1 Nov 2024 09:17:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 mathieu.dubois-briand@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
 <ZyJBQBRRsLFov02a@bootlin-mathieu>
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 13:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206621


On 2024-11-01 06:08, Alexander Kanavin wrote:
> On Wed, 30 Oct 2024 at 15:23, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
>
>> Differences can be seen here:
>> - https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/
>> - https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/packages/diff-html/
>>
>> Can you have a look please ?
> I believe there are two separate reproducibility issues there:
>
> 1. usr/lib/python3.13/site-packages/numpy/__config__.py contains
> numerous references to compiler and linker flags which contains build
> paths. This is not uncommon, and we generally handle it by patching
> these out after the fact with sed in do_install:append() or similar.
> Plenty of examples all over oe-core.
>
> 2. The second issue is slightly trickier. There's a number of
> generated c files produced by cython and they contain lines like:
>
> static const char __pyx_k_srv_storage_alex_yocto_build_64[] =
> "/srv/storage/alex/yocto/build-64/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/numpy-2.1.2/numpy/random/bit_generator.pyx";
>   PyObject *__pyx_kp_s_srv_storage_alex_yocto_build_64;
> etc.
>
> This needs to be fixed by tracking down where in cython this stuff is
> generated, and replacing real paths (or parts of them) with something
> reproducible, like 'reproducible_build_path' or similar. Then this
> should be submitted or raised with upstream.

Yeah, I've gotten this far, but I think the real issue is that these 
should be configurable via some (possibly-nonexistent) bitbake variable 
in the recipe. I haven't yet determined how to add this stuff yet, though.

In the python3-pandas recipe in meta-python, there's a 
fix_cythonized_sources() function that seems to be of the right spirit:

https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb#n26

I don't think this is quite the right fix, though - it seems like these 
adjustments should be happening during do_configure if possible, so that 
the host paths aren't being propagated through all of the different 
copies of files like __config__.py...

There are quite a lot of hits under the numpy workdir for "Generated by 
Cython":

tgamblin@megalith ~/workspace/yocto/poky (master)$ grep -r "Generated by 
Cython" build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/temp/run.fix_cythonized_sources.581946: 
for f in `grep -l -r -e '\/* Generated by Cython.*/$' 
/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2`; 
do
grep: 
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Utils.cpython-313-x86_64-linux-gnu.so: 
binary file matches
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Utils.py:GENERATED_BY_MARKER 
= "/* Generated by Cython %s */" % cython_version
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Utils.py: 
file_content.startswith(b"/* Generated by Cython ") or
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Compiler/Annotate.py: 
<!-- Generated by Cython {watermark} -->
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Compiler/Annotate.py: 
<p><span style="border-bottom: solid 1px grey;">Generated by Cython 
{watermark}</span>{more_info}</p>
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Compiler/Main.py: 
if u'<!-- Generated by Cython' in html_file.read(100):
grep: 
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Compiler/__pycache__/Annotate.cpython-313.pyc: 
binary file matches
grep: 
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/Compiler/__pycache__/Main.cpython-313.pyc: 
binary file matches
grep: 
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cython/__pycache__/Utils.cpython-313.pyc: 
binary file matches
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_mt19937.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_common.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_bounded_integers.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_pcg64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_sfc64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/bit_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random/mtrand.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/build/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_philox.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_mt19937.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_common.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_bounded_integers.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_pcg64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_sfc64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/bit_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random/mtrand.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/package/usr/src/debug/python3-numpy/2.1.2/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_philox.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_mt19937.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_common.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_bounded_integers.pyx.c:/* 
Generated by Cython 3.0.11/
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_pcg64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_sfc64.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random/bit_generator.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random/mtrand.pyx.c:/* 
Generated by Cython 3.0.11 */
build/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/packages-split/python3-numpy-src/usr/src/debug/python3-numpy/2.1.2/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random/_philox.pyx.c:/* 
Generated by Cython 3.0.11 */

This makes me think that the Cython recipe is also missing a few cases 
in cython_fix_sources() (namely, ../Cython/Compiler/Annotate.py, 
../Cython/Compiler/Main.py, and ../Cython/Utils.py, but locally adding 
those and rebuild doesn't seem to fix the numpy issue.

Still looking.

>
> 3. We should also drop
> # Python pyx -> c -> so build leaves absolute build paths in the code
> INSANE_SKIP:${PN} += "buildpaths"
> INSANE_SKIP:${PN}-src += "buildpaths"
>
> from meta/classes-recipe/python_mesonpy.bbclass when point two is addressed.
Completely agree, it's on my radar. Apparently I need to learn a lot 
more about how all of this is actually happening underneath...
>
> Hope this helps,
> Alex

