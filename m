Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC1CC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:17:38 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7943.1786691848333385222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 00:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iXVGLSsK;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836c8bdac50so10747887b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 00:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786691847; cv=none;
        d=google.com; s=arc-20260327;
        b=WbNyarA3Z/nT/SgGltJCHE+Qx678sBFCMRCzEind8naS1BVKzzafXeX8MGeDU94RsG
         MJo7R4C14AL+Y9GBWgt74ATZ/KJkqMxMStIC1dnNussk7auaNj9Rv8M7dllly3qCYt6H
         oNRG7+9llBRU5VZZ1eZQUqRn+sR5C77AhmzbFHGV4FsEnzlnNqP27gVP8rJPpEh/nK9y
         38zQMohUJeDCEqumE4IUxWPYn/FrqGoX+SO1pi7GaVnP6aTr2syCWqXC3BkijiNY4J1m
         kCJMSdEo2XSio5IcZVwc6nKbvjr3NneDxaMm5b3MWzzZpn6JalM7f3880jIP4VqxPsLC
         VDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GJtsNNO82n4cJ0UjwnR+R4qW4W6KRXF/qK6iN3fJAY=;
        fh=coVZbaCw8hvtjBz5969ejPOOx8fdA5mxvDsHgB4adj8=;
        b=QNMDpGaw+aMxbEZ0pi31wdqjyTriiLAoosila3gFFTgKVk+GAisfM9n0XDSVBwCV8Z
         nhlWbdEC3kIiF5nnshkN3bp1lDZolXi1ojMXT7++3KiCGu4Wt9sWLRnLVyCaUCQPJvRi
         5D8GquskMVYZEOGyys4bOePBNrIZ6e/UvCVMQNjgA6vVvaeGN+axhf23mm5xv4DtHCgf
         XImqQ6K7apWM3WSFoLXz5411916XfSWXPBEXB8APWGcSGef9dnPTo2jlvgoYz0DP5G2/
         9/voDCPBPxq0+qEdgmi09GV9QY5xJqD+uxN+uPLE1tqeu3WVENvZfAExqpW2fTeKtbPE
         zPAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691847; x=1787296647; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GJtsNNO82n4cJ0UjwnR+R4qW4W6KRXF/qK6iN3fJAY=;
        b=iXVGLSsKFrsF5QE4/HeC1Etnz7oKOLu5WNpixeGu0lEa5pzI42DiM7HxGegInuCgy7
         x8fPe0IMFjnzussP9+cQ1gdCQbh0VKzo2y77F/rbuoqKkecPuJbBfW97Vacuke8b3gMw
         62RxAU++qFd/CPtsJO6VV22YThny28lkmZqj3QDoJzsj1vHPsP8Qh0nnJIjSrZvcjvy6
         JU/PlcWMhtOQA9DSzKGCUGo2EOKKNeV58W9ZDPXsK8lhfOx57VPvqNNE1zC8aUiH03kX
         zzKGvo8s04TNcQhpWws+AVkBqNuF/tY9k31i4pTAUhGDu3x7IaucNh84n8cX8hZvb9WX
         38dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691847; x=1787296647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GJtsNNO82n4cJ0UjwnR+R4qW4W6KRXF/qK6iN3fJAY=;
        b=qUNe46ys5Os8U+qUUvGfMLikD5P9iIqCLdFDyE5suGDlIU/dzu56WgGLgp76Vgmij/
         6STXF2nP7cB1afFcIm4z8Bfu3T+jQLZELlJBD8N0lGli9rD6ZGYq1nmoKSrtzrtlTIS6
         wwhhspCeskdnCNZVERYjsIWUHztzdN0GwPiEtNCTj7BSk3geHsLvneVaFQ45eLOfBPwF
         RVlYTulMvJ11yqqZL4uvk8aooxf5aNDndjqEQwDtIfivAsqGkSV6D5p9H4dmxIFf1mHz
         L4NIhQslSzOKGHxMyOyTp/5swE7M6Qgk2xHodj9/nh6JVxfJzE0/xz8qz1k22sYX2giN
         k8rw==
X-Gm-Message-State: AOJu0YzAzlQK9t7QWWkM/fG09WLFK1z+EGuAH5mdPrrLCXxgop5zKLwi
	qlHDnpQDLjBXhkzjC4X0o6MxItT0PNLRiPFx/JYPL0ujdi3adGIetosJA/rK4va/Cp4mUkqq5RB
	E+8/5xKTl6Lxme4KEyKC0GSowfyBgqqc=
X-Gm-Gg: AR+sD10iVwo5NSaaeWpUa/LcgyUeBPpBwXK1utLcMkSAn+LVYikk6gHZG4BYmHDxVBK
	2ybFsZrk86cSgYtOr2j17ZBLJQZuqJmjUpN+ZN0U/d4kY9AsdP/p70PTRSJsa8rgmW64zch9M9c
	9tZmHb93iSjaOnVKznio6RB/0pQqapMP7qGWrkbIG5Z5xRmDrUlcwYEiD9F/E71d5vBOSIauw92
	J8w3gMdTxsy5zV+9bkWcTHxiJhlEnAyOqbJEdDZR8UmM+1IS6ggdDz93xtGjOAO9bAHssFi+NHY
	RDWkBwopfLdCgyDxjJGQfq2b3RTr5s8+fqF60vAgOU06E0BUk6kKhfpgnXgyHfKY6IXzlVFgV0m
	XoAdfqw3tbxlnC7fTsd0SLr03xjcTC0EM+8zsWP2ZiikGP7t7q9p7no81m6xCZQI2RdRuW4CrCN
	PVm3NeqWtPGtgqZedgOFLkw47+g58yQlhfZcgW/Zj5hjscxb5KIC66oQlH3aPRTBcNscdDmcuK6
	GL8zv0JMOvwEw==
X-Received: by 2002:a05:690c:2505:b0:808:f9bb:3832 with SMTP id
 00721157ae682-83711e12165mr17283387b3.22.1786691847341; Fri, 14 Aug 2026
 00:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260812125954.688985-1-peter.marko@siemens.com> <CAMKF1sqJQuxMD_LWL9hfH0XUUVszT4dW6LF61_C+nhhQhuY3zA@mail.gmail.com>
In-Reply-To: <CAMKF1sqJQuxMD_LWL9hfH0XUUVszT4dW6LF61_C+nhhQhuY3zA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Aug 2026 00:16:59 -0700
X-Gm-Features: AUfX_mx8NM8_5fd_UH7gSlVOurjRcEmjqLBQDFeEwnxbv9yzfcOdr9jh11hif3s
Message-ID: <CAMKF1so2QJSKukLww9tXjUK6knawOOsPhd7he2Oem-i1uE9S2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain/clang: prepend target host-sys to HOST_CC_ARCH
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000e249270658fc9c81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243424

--000000000000e249270658fc9c81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 8:32=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Wed, Aug 12, 2026 at 6:00=E2=80=AFAM Peter Marko via lists.openembedde=
d.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> This assignment was present in scarthgap meta-clang.
>> * commit adding it: [1]
>> * commit removing it from native case: [2]
>> * it was removed completely when migrating clang to oe-core
>>
>> After migration from scarthgap to wrynose (or current master), clang
>> extra tools like clang-tidy do not work anymore.
>>
>> Test recipe used for fix validation:
>>
>> test-recipe.bb:
>>   SUMMARY =3D "clang-tidy demonstration program"
>>   SECTION =3D "examples"
>>   HOMEPAGE =3D "n/a"
>>   LICENSE =3D "GPL-2.0-only"
>>   LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=3D801f80=
980d171dd6425610833a22dbe6"
>>   SRC_URI =3D "file://CMakeLists.txt file://hello-world.cpp"
>>   S =3D "${UNPACKDIR}"
>>   TOOLCHAIN =3D "clang"
>>   inherit cmake
>>
>> CMakeLists.txt
>>   project(hello-world)
>>   cmake_minimum_required(VERSION 3.5)
>>   find_program(CLANG_TIDY NAMES clang-tidy)
>>   set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}" "--checks=3D*")
>>   add_executable(${PROJECT_NAME} hello-world.cpp)
>>
>> hello-world.cpp
>>   #include <iostream>
>>   int main() {
>>     std::cout << "Hello World!";
>>     return 0;
>>   }
>>
>> I have asked AI agent to analyze clang sources for side-effects which
>> are mentioned in patch removing this with following result:
>>
>> When a cmake recipe uses CMAKE_CXX_CLANG_TIDY (or runs clang-tidy in any
>> mode that passes the compile command via -- on the command line), CMake
>> invokes clang-tidy through its __run_co_compile path. This path
>> constructs a FixedCompilationDatabase from the arguments following --.
>> Inside FixedCompilationDatabase::loadFromCommandLine() the original
>> cross-compiler binary name (e.g. x86_64-poky-linux-clang++) is stripped
>> by stripPositionalArgs() and replaced with a dummy argv[0]. As a result
>> the target triple encoded in the cross-compiler name is never seen by
>> clang-tidy.
>>
>> JSONCompilationDatabase (used when clang-tidy is run with -p <build_dir>=
)
>> wraps its commands with inferTargetAndDriverMode(), which calls
>> addTargetAndModeForProgramName() and would correctly inject
>> --target=3Dx86_64-poky-linux. FixedCompilationDatabase has no equivalent
>> step, so the native clang-tidy falls back to the build-host default
>> triple and cannot locate C++ headers under the target sysroot:
>>
>>   hello-world.cpp:1:10: error: 'iostream' file not found
>>
>> The fix is to make the -target flag explicit in the compile commands.
>> The cross-compiler already has LLVM_DEFAULT_TARGET_TRIPLE compiled in as
>> HOST_SYS, so adding -target ${HOST_SYS} to HOST_CC_ARCH is a no-op for
>> the compiler itself. For clang-tidy and other Clang-based tools that
>> parse compile commands but do not inherit the binary's baked-in default
>> triple the flag is the only reliable channel to communicate the intended
>> target.
>>
>> On a typical GNU/Linux host the GCC runtime is installed under a
>> vendor-qualified tuple (e.g. aarch64-linux-gnu/) that clang probes at
>> runtime. Providing an explicit -target aarch64-linux overrides that
>> probe and prevents clang-native from finding libgcc and crt objects,
>> which was the original motivation for removing the assignment.
>>
>> [1]
>> https://github.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e8=
b049b82247
>> [2]
>> https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e375524=
5e3220bf27
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>  meta/classes/toolchain/clang.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/toolchain/clang.bbclass
>> b/meta/classes/toolchain/clang.bbclass
>> index 9a3cd0e584..862ecb5e10 100644
>> --- a/meta/classes/toolchain/clang.bbclass
>> +++ b/meta/classes/toolchain/clang.bbclass
>> @@ -34,6 +34,9 @@ LDFLAGS:append:class-nativesdk:x86-64 =3D "
>> -Wl,-dynamic-linker,${base_libdir}/ld-
>>  LDFLAGS:append:class-nativesdk:aarch64 =3D "
>> -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
>>  LDFLAGS:append:class-cross-canadian =3D "
>> -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/in=
staller"
>>
>> +# helps extra tools like clang-tidy to find arch-specific macros and
>> headers in a cross compile environment
>> +HOST_CC_ARCH:prepend =3D "-target ${HOST_SYS} "
>>
>
> This will impact all variants of clang compiler invocations e.g.
> native/nativesdk etc. I hope it does not impact sstate sharing.
>

Infact, this is causing -
https://errors.yoctoproject.org/Errors/Details/962419/
This is on debian13/arm64 build host.

> +
>>  # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
>>  POPULATESYSROOTDEPS:append:class-target =3D "
>> llvm-native:do_populate_sysroot"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#243286):
>> https://lists.openembedded.org/g/openembedded-core/message/243286
>> Mute This Topic: https://lists.openembedded.org/mt/120717002/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000e249270658fc9c81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 8:32=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 12, 20=
26 at 6:00=E2=80=AFAM Peter Marko via <a href=3D"http://lists.openembedded.=
org" target=3D"_blank">lists.openembedded.org</a> &lt;peter.marko=3D<a href=
=3D"mailto:siemens.com@lists.openembedded.org" target=3D"_blank">siemens.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko=
@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
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
ttps://errors.yoctoproject.org/Errors/Details/962419/" target=3D"_blank" st=
yle=3D"background-color:transparent">https://errors.yoctoproject.org/Errors=
/Details/962419/</a></div><div class=3D"gmail-gs" style=3D"margin:0px;min-w=
idth:0px;padding:0px 0px 20px;width:auto"><span style=3D"background-color:t=
ransparent">This is on debian13/arm64 build host.=C2=A0=C2=A0</span></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000e249270658fc9c81--

