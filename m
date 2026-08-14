Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD2BC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:21:28 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7977.1786692081241081078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 00:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rMvmV5aw;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e6f0b4610so8572707b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 00:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786692080; cv=none;
        d=google.com; s=arc-20260327;
        b=WncOheLvWBHGfkEcTJfS2XNWaqrraPol5wg/F9cMiejxLBma7cVBCGPSopvddjYQ7h
         cqOndiwlOuaJL5Y0OHWi0s4TVPQiT/L3eYpVJMayc6WYWKHCw1sLz9Ye5HDJMG9FJIv6
         Pezv3Y0nM7+P3osntElm79pxIkrc95z6jMaSHNZcF16Kzf2aA2qN3Wmzd8VnoATMkn4l
         bTWazDwZh0w9fS9xtnxd3EOkDzADFGSKDdlN93yJBoQX59RNwjVrm+ZGRH/N0dHTHknb
         OPjgA+kRdRhPsWAJ9xKLDH4ZeO/BT2aYkonz3RU203yXIFzbBd0bN1XIH4MMs9VWQGyd
         eTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lg892IrAmuC57Ujvx9t4UtwvSu2Q6B/ZGI6Sd3Y2wfs=;
        fh=coVZbaCw8hvtjBz5969ejPOOx8fdA5mxvDsHgB4adj8=;
        b=H3T6m53je+nii20S4RqR9nh6KoyHexwC7EZ9MPtuvss42Gv9yYerelk+6Gm2SNWWck
         fXwuS+ay7J4VHsnGrrn+B02AslxmVSmZeMJmzCjKz8hhO3a+5eu/rXKjZEkSj6Yj7jiO
         YBR99YXwOgX7LEtydBJH6aI698fOr77n7ItkeH2zo94BVZ1rZOFi6f+ucs1EmpRkbA0h
         8SwTyf1QPqyWaDPSI8lXJjSChKhCITUdmA7/TV8p+Q1AG2Mo1ffoXq/TqIs2+jIM6hjE
         WdgcJ07XX8JR9E9v/4JJdUuFKtp1wlGRkCtJzaeyBBwBH+XbgJmQswgYm2rtdYcn+FNL
         PEKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786692080; x=1787296880; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lg892IrAmuC57Ujvx9t4UtwvSu2Q6B/ZGI6Sd3Y2wfs=;
        b=rMvmV5awNwEYcg96HtaA2ZGNIsMcShhVFeIfiUzZyI9OKL7JKBsdRBd8iEcTkf8qSS
         F3YptBkIaZFGGKuQ4s9UYJEAhuMan+5l5LKfIus478s6sO7aofFUy3Ov06vWpgwZPcPH
         nlJnWa0NfLpoa48NH+p6I3SZWkZ29ohHuPy0lWHIGHjkWEdRaDy+CJlEhcsPRu6/yl79
         sjbCiGjtn58i8ay4klkBgYJfiXEx/tTf8JEAfpsc6zREPsI/hO0dPoRSH5KS1f5Nq51S
         A0acOv1BNW4Ih8Da22mmyraPW2TNgIBTKyD/F2EFLtpg6bqOWYAwjB7L7LJNgoM6MtN4
         f4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692080; x=1787296880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lg892IrAmuC57Ujvx9t4UtwvSu2Q6B/ZGI6Sd3Y2wfs=;
        b=Esa8xlYA0rwqVfWRgHNZmsWdj8Rwgo0agmL6qTylfX/XY8whpz+m8qh45vw5F6PRd9
         8040eoNvckLV0rX9XY+LbjPcEQwNG3cWGkL88RearByNVywkeu/guz4YoF6I4oYp9q3q
         vrHDwRC6aW1Z2SAbpXMze4rw9K0+QfHOw2PokqEVd4AbWioVND3Mtpjo8+8CD428Y86t
         NbgIYG7sViWgFiuAbgy1+/FMF9D18eeuhEuERlXDN5LN8ZipPEUabFU+LzQDCTK/yQ9h
         PQPbig49AlJn75qQay2675YPy6KDsZc4k3vDpQL6747sM+gfvsNBVbiNGvnzXvcMFVsn
         cF6Q==
X-Gm-Message-State: AOJu0YzbVSJu5VW3E0WAfG1j4vLwU6uOzknoXVpaXhSDnxMWuDQM9XE1
	RhAJRxdo0soWocJ5mGGVFuPvoO8OPnroSDneXpF/tymdOSdq1J7NnjhL1wjeZUSDo22LYGucf3t
	Ti3SwPgIYQhMj9XvEEHVy+M24/qr9myu9CeMqzsw=
X-Gm-Gg: AR+sD10Bj0+2uJsmfEjRVPEnUxQ9ZZ4/A9HNPMeIhexUhFxLnKEcxPUGl6L5wPLsAUH
	bau8YMVAcqDgk2jygQpYhp0BfoQNS/lC06s+q5H+itvJZL8BWXEmfI/2Lng7F4GFEjeliNCMWGg
	YkDWhCV6aO1yICV7bKxuXnlsDgPRToIlBo024aU1kQYLCvUL3cxeM8kGrGKLCkzA/87gz22k99T
	tXfcykYAr5nKi22mH6U/omwQYQCMgHhMICytIujOdd4M2SpiyY+pJrmhWxiifndFaMKkbPOATvq
	v8l9WGYxUL4qf0JVpdxOE2Fart4PKo4PJVGvSeyBjgYX8yLDc9fmCnS7LFIpGiKzQLi/Zngqvh1
	3Xqfg8zd0rlRSz7lqM93NSLIPT8/gf7Q8irXqwCriM6IYzkbgFOkpikHYeXSh3vy+4DSzqRmoHG
	ZPpAI7MQYiipsds3lpfiVBz/iyQ82jjYmLUaPlzWoifnxx0Kx6eRLKWP96EE6DPT3naId49TLSC
	N+7YwUXNXQXFQ==
X-Received: by 2002:a05:690c:9993:b0:81f:2403:9e70 with SMTP id
 00721157ae682-83711a2a782mr16914007b3.19.1786692080236; Fri, 14 Aug 2026
 00:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260812125954.688985-1-peter.marko@siemens.com>
 <CAMKF1sqJQuxMD_LWL9hfH0XUUVszT4dW6LF61_C+nhhQhuY3zA@mail.gmail.com> <CAMKF1so2QJSKukLww9tXjUK6knawOOsPhd7he2Oem-i1uE9S2w@mail.gmail.com>
In-Reply-To: <CAMKF1so2QJSKukLww9tXjUK6knawOOsPhd7he2Oem-i1uE9S2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Aug 2026 00:20:53 -0700
X-Gm-Features: AUfX_myVXr1qh5mFTFBE7758lCp2TH8PhvD-YQ8ld-GHVKKEjrJuyEG04gGpGTw
Message-ID: <CAMKF1srgnpO52zUF1up=zyDfRnngBLOZHMjfyTr2JDxXxiebhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain/clang: prepend target host-sys to HOST_CC_ARCH
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000c3fe0f0658fcaaab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243425

--000000000000c3fe0f0658fcaaab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

>
>
> On Thu, Aug 13, 2026 at 8:32=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>>
>>
>> On Wed, Aug 12, 2026 at 6:00=E2=80=AFAM Peter Marko via lists.openembedd=
ed.org
>> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>>
>>> From: Peter Marko <peter.marko@siemens.com>
>>>
>>> This assignment was present in scarthgap meta-clang.
>>> * commit adding it: [1]
>>> * commit removing it from native case: [2]
>>> * it was removed completely when migrating clang to oe-core
>>>
>>> After migration from scarthgap to wrynose (or current master), clang
>>> extra tools like clang-tidy do not work anymore.
>>>
>>> Test recipe used for fix validation:
>>>
>>> test-recipe.bb:
>>>   SUMMARY =3D "clang-tidy demonstration program"
>>>   SECTION =3D "examples"
>>>   HOMEPAGE =3D "n/a"
>>>   LICENSE =3D "GPL-2.0-only"
>>>   LIC_FILES_CHKSUM =3D
>>> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=3D801f8=
0980d171dd6425610833a22dbe6"
>>>   SRC_URI =3D "file://CMakeLists.txt file://hello-world.cpp"
>>>   S =3D "${UNPACKDIR}"
>>>   TOOLCHAIN =3D "clang"
>>>   inherit cmake
>>>
>>> CMakeLists.txt
>>>   project(hello-world)
>>>   cmake_minimum_required(VERSION 3.5)
>>>   find_program(CLANG_TIDY NAMES clang-tidy)
>>>   set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}" "--checks=3D*")
>>>   add_executable(${PROJECT_NAME} hello-world.cpp)
>>>
>>> hello-world.cpp
>>>   #include <iostream>
>>>   int main() {
>>>     std::cout << "Hello World!";
>>>     return 0;
>>>   }
>>>
>>> I have asked AI agent to analyze clang sources for side-effects which
>>> are mentioned in patch removing this with following result:
>>>
>>> When a cmake recipe uses CMAKE_CXX_CLANG_TIDY (or runs clang-tidy in an=
y
>>> mode that passes the compile command via -- on the command line), CMake
>>> invokes clang-tidy through its __run_co_compile path. This path
>>> constructs a FixedCompilationDatabase from the arguments following --.
>>> Inside FixedCompilationDatabase::loadFromCommandLine() the original
>>> cross-compiler binary name (e.g. x86_64-poky-linux-clang++) is stripped
>>> by stripPositionalArgs() and replaced with a dummy argv[0]. As a result
>>> the target triple encoded in the cross-compiler name is never seen by
>>> clang-tidy.
>>>
>>> JSONCompilationDatabase (used when clang-tidy is run with -p <build_dir=
>)
>>> wraps its commands with inferTargetAndDriverMode(), which calls
>>> addTargetAndModeForProgramName() and would correctly inject
>>> --target=3Dx86_64-poky-linux. FixedCompilationDatabase has no equivalen=
t
>>> step, so the native clang-tidy falls back to the build-host default
>>> triple and cannot locate C++ headers under the target sysroot:
>>>
>>>   hello-world.cpp:1:10: error: 'iostream' file not found
>>>
>>> The fix is to make the -target flag explicit in the compile commands.
>>> The cross-compiler already has LLVM_DEFAULT_TARGET_TRIPLE compiled in a=
s
>>> HOST_SYS, so adding -target ${HOST_SYS} to HOST_CC_ARCH is a no-op for
>>> the compiler itself. For clang-tidy and other Clang-based tools that
>>> parse compile commands but do not inherit the binary's baked-in default
>>> triple the flag is the only reliable channel to communicate the intende=
d
>>> target.
>>>
>>> On a typical GNU/Linux host the GCC runtime is installed under a
>>> vendor-qualified tuple (e.g. aarch64-linux-gnu/) that clang probes at
>>> runtime. Providing an explicit -target aarch64-linux overrides that
>>> probe and prevents clang-native from finding libgcc and crt objects,
>>> which was the original motivation for removing the assignment.
>>>
>>> [1]
>>> https://github.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e=
8b049b82247
>>> [2]
>>> https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e37552=
45e3220bf27
>>>
>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ---
>>>  meta/classes/toolchain/clang.bbclass | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/classes/toolchain/clang.bbclass
>>> b/meta/classes/toolchain/clang.bbclass
>>> index 9a3cd0e584..862ecb5e10 100644
>>> --- a/meta/classes/toolchain/clang.bbclass
>>> +++ b/meta/classes/toolchain/clang.bbclass
>>> @@ -34,6 +34,9 @@ LDFLAGS:append:class-nativesdk:x86-64 =3D "
>>> -Wl,-dynamic-linker,${base_libdir}/ld-
>>>  LDFLAGS:append:class-nativesdk:aarch64 =3D "
>>> -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
>>>  LDFLAGS:append:class-cross-canadian =3D "
>>> -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/i=
nstaller"
>>>
>>> +# helps extra tools like clang-tidy to find arch-specific macros and
>>> headers in a cross compile environment
>>> +HOST_CC_ARCH:prepend =3D "-target ${HOST_SYS} "
>>>
>>
>> This will impact all variants of clang compiler invocations e.g.
>> native/nativesdk etc. I hope it does not impact sstate sharing.
>>
>
> Infact, this is causing -
> https://errors.yoctoproject.org/Errors/Details/962419/
> This is on debian13/arm64 build host.
>

Perhaps you need to leave native recipe alone.
HOST_CC_ARCH:remove:class-native =3D "-target ${HOST_SYS}"
works ok.


> +
>>>  # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
>>>  POPULATESYSROOTDEPS:append:class-target =3D "
>>> llvm-native:do_populate_sysroot"
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#243286):
>>> https://lists.openembedded.org/g/openembedded-core/message/243286
>>> Mute This Topic: https://lists.openembedded.org/mt/120717002/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--000000000000c3fe0f0658fcaaab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 14,=
 2026 at 12:16=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13, 2=
026 at 8:32=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Aug 12, 2026 at 6:00=E2=80=AFAM Peter Marko via <a href=3D"http://lis=
ts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;peter=
.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org" target=3D"_b=
lank">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"ma=
ilto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>=
&gt;<br>
<br>
This assignment was present in scarthgap meta-clang.<br>
* commit adding it: [1]<br>
* commit removing it from native case: [2]<br>
* it was removed completely when migrating clang to oe-core<br>
<br>
After migration from scarthgap to wrynose (or current master), clang<br>
extra tools like clang-tidy do not work anymore.<br>
<br>
Test recipe used for fix validation:<br>
<br>
<a href=3D"http://test-recipe.bb" rel=3D"noreferrer" target=3D"_blank">test=
-recipe.bb</a>:<br>
=C2=A0 SUMMARY =3D &quot;clang-tidy demonstration program&quot;<br>
=C2=A0 SECTION =3D &quot;examples&quot;<br>
=C2=A0 HOMEPAGE =3D &quot;n/a&quot;<br>
=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-lice=
nses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br>
=C2=A0 SRC_URI =3D &quot;file://CMakeLists.txt file://hello-world.cpp&quot;=
<br>
=C2=A0 S =3D &quot;${UNPACKDIR}&quot;<br>
=C2=A0 TOOLCHAIN =3D &quot;clang&quot;<br>
=C2=A0 inherit cmake<br>
<br>
CMakeLists.txt<br>
=C2=A0 project(hello-world)<br>
=C2=A0 cmake_minimum_required(VERSION 3.5)<br>
=C2=A0 find_program(CLANG_TIDY NAMES clang-tidy)<br>
=C2=A0 set(CMAKE_CXX_CLANG_TIDY &quot;${CLANG_TIDY}&quot; &quot;--checks=3D=
*&quot;)<br>
=C2=A0 add_executable(${PROJECT_NAME} hello-world.cpp)<br>
<br>
hello-world.cpp<br>
=C2=A0 #include &lt;iostream&gt;<br>
=C2=A0 int main() {<br>
=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Hello World!&quot;;<br>
=C2=A0 =C2=A0 return 0;<br>
=C2=A0 }<br>
<br>
I have asked AI agent to analyze clang sources for side-effects which<br>
are mentioned in patch removing this with following result:<br>
<br>
When a cmake recipe uses CMAKE_CXX_CLANG_TIDY (or runs clang-tidy in any<br=
>
mode that passes the compile command via -- on the command line), CMake<br>
invokes clang-tidy through its __run_co_compile path. This path<br>
constructs a FixedCompilationDatabase from the arguments following --.<br>
Inside FixedCompilationDatabase::loadFromCommandLine() the original<br>
cross-compiler binary name (e.g. x86_64-poky-linux-clang++) is stripped<br>
by stripPositionalArgs() and replaced with a dummy argv[0]. As a result<br>
the target triple encoded in the cross-compiler name is never seen by<br>
clang-tidy.<br>
<br>
JSONCompilationDatabase (used when clang-tidy is run with -p &lt;build_dir&=
gt;)<br>
wraps its commands with inferTargetAndDriverMode(), which calls<br>
addTargetAndModeForProgramName() and would correctly inject<br>
--target=3Dx86_64-poky-linux. FixedCompilationDatabase has no equivalent<br=
>
step, so the native clang-tidy falls back to the build-host default<br>
triple and cannot locate C++ headers under the target sysroot:<br>
<br>
=C2=A0 hello-world.cpp:1:10: error: &#39;iostream&#39; file not found<br>
<br>
The fix is to make the -target flag explicit in the compile commands.<br>
The cross-compiler already has LLVM_DEFAULT_TARGET_TRIPLE compiled in as<br=
>
HOST_SYS, so adding -target ${HOST_SYS} to HOST_CC_ARCH is a no-op for<br>
the compiler itself. For clang-tidy and other Clang-based tools that<br>
parse compile commands but do not inherit the binary&#39;s baked-in default=
<br>
triple the flag is the only reliable channel to communicate the intended<br=
>
target.<br>
<br>
On a typical GNU/Linux host the GCC runtime is installed under a<br>
vendor-qualified tuple (e.g. aarch64-linux-gnu/) that clang probes at<br>
runtime. Providing an explicit -target aarch64-linux overrides that<br>
probe and prevents clang-native from finding libgcc and crt objects,<br>
which was the original motivation for removing the assignment.<br>
<br>
[1] <a href=3D"https://github.com/kraj/meta-clang/commit/503aa977b27be0506f=
b6ac21fbf9e8b049b82247" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e8b049b82247</a><br=
>
[2] <a href=3D"https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b=
97f42e3755245e3220bf27" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e3755245e3220bf27</a><br=
>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/toolchain/clang.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/=
clang.bbclass<br>
index 9a3cd0e584..862ecb5e10 100644<br>
--- a/meta/classes/toolchain/clang.bbclass<br>
+++ b/meta/classes/toolchain/clang.bbclass<br>
@@ -34,6 +34,9 @@ LDFLAGS:append:class-nativesdk:x86-64 =3D &quot; -Wl,-dyn=
amic-linker,${base_libdir}/ld-<br>
=C2=A0LDFLAGS:append:class-nativesdk:aarch64 =3D &quot; -Wl,-dynamic-linker=
,${base_libdir}/ld-linux-aarch64.so.1&quot;<br>
=C2=A0LDFLAGS:append:class-cross-canadian =3D &quot; -Wl,-dynamic-linker,${=
base_libdir}/placeholder/to/be/rewritten/by/sdk/installer&quot;<br>
<br>
+# helps extra tools like clang-tidy to find arch-specific macros and heade=
rs in a cross compile environment<br>
+HOST_CC_ARCH:prepend =3D &quot;-target ${HOST_SYS} &quot;<br></blockquote>=
<div><br></div><div><span style=3D"background-color:transparent">This will =
impact all variants of clang compiler invocations e.g. native/nativesdk etc=
. I hope it does not impact sstate sharing.=C2=A0</span></div></div></div><=
/blockquote><div><br></div><div>Infact, this is causing -=C2=A0<a href=3D"h=
ttps://errors.yoctoproject.org/Errors/Details/962419/" style=3D"background-=
color:transparent" target=3D"_blank">https://errors.yoctoproject.org/Errors=
/Details/962419/</a></div><div style=3D"margin:0px;min-width:0px;padding:0p=
x 0px 20px;width:auto"><span style=3D"background-color:transparent">This is=
 on debian13/arm64 build host.=C2=A0=C2=A0</span></div></div></div></blockq=
uote><div><br></div><div>Perhaps you need to leave native recipe alone.</di=
v><div>HOST_CC_ARCH:remove:class-native =3D &quot;-target ${HOST_SYS}&quot;=
</div><div>works ok.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0# do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP<br>
=C2=A0POPULATESYSROOTDEPS:append:class-target =3D &quot; llvm-native:do_pop=
ulate_sysroot&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243286" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243286</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120717002/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120717002/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000c3fe0f0658fcaaab--

