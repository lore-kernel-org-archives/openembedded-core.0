Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F76FC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 03:32:55 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5756.1786678365408044984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 20:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CtRhRdQu;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c744a00edso309830d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 20:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786678364; cv=none;
        d=google.com; s=arc-20260327;
        b=dfduSStAhQYXYAaIb8kxWxejwQ9wGPjijeJ1dU2Ra+E6XptLNAOeMlN177sO7xCHFf
         8zSA8041S7ZF13XJoCsyLI+9Fq9SgZJtKYsjQrGEjd8090dtAUJfr0s2PzIMUubIUqBk
         G5dgf+TiaSlmS1N86VJPCZkcdOTSMyDkD39y72rpp2cjLBmPOzao3UOVtwxlxfyNCn6R
         4zW6ZG3gx2JVfQTWaXtsMTNTqpJzcs8z0A3beRhno30ITtk+k23VkctO7jj3CZq3z+qq
         yb4n07jBFyx43DXfX5ZRJ+H+Y4O5CPLeD4e8lz5Rp9/yUEMPhyQlweQDiZh4ruPjaZkv
         cVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=px6XSCpS+ZYoIcfCBwYiNA0yb+JevTZKCt/uYLazFH8=;
        fh=coVZbaCw8hvtjBz5969ejPOOx8fdA5mxvDsHgB4adj8=;
        b=axDOFzYDmUFSJAeeROoPUVWB+paeYOYTn6Wc5B9gpvsMxbRbI+n56wcjUamNgpekma
         s02iIoUXY3Ch/p6TeFAEjc9JfLpNaFJxAtJULm2Pz57EzQ9if9VTjNI2G1Au/4CpynR4
         029XqAJr71jVD7IMDHHCot3g1wKblEIL6oEfRbX6/VubZ/ScGuL341g5HNPuEaGb7LF+
         vGn2rAJ+0yTq4Sjg3A/eYB4k6FTkYyVEiOJRFPDGnQQIbD/E5O7CT0agb2caCuX1h9vH
         FOGElZjt4rVKQkanLcGl+1kaFwceUSImlbQpGkhpH8yhc4RQ2/eWRpdJhMrdOssPK//z
         lzAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786678364; x=1787283164; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px6XSCpS+ZYoIcfCBwYiNA0yb+JevTZKCt/uYLazFH8=;
        b=CtRhRdQun9jr4Ym/RDxE7RghfUSq3xI70rsoytemds804/4ZN3xI8H4Frfhb4naxfO
         WBMouEikaoTiNnTcGwV863UhDg7ATH/iJx06eZ9L4n8+Cn97cfXtnLbCnaMUeTimtaDZ
         ppKe7pJO/3a122VBuOXFIMu7i1rW/q20lhEqb1ep4+rNXXXHvHRRqzsKTTBLTeMtaADN
         d5DA0IC3+a49YUaeMyWAQem59AtIKNU5LSqigDr7h/OS+Al3SIr0ww5aQS6j4d1dq8Ce
         WV8zY+d+UMHDx1HQ9k54uZG1j8V9Mu268kHkUI5hFTDwARrJwKvtcyR641eVPT5JNvo/
         jsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786678364; x=1787283164;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=px6XSCpS+ZYoIcfCBwYiNA0yb+JevTZKCt/uYLazFH8=;
        b=KCe0ZapJEv/Z0weTcN1qb2kPVIpVaSK783HNWj9qHZCWo83zqRpW1IaYuQRQ23k4Gk
         i91eZwumz1d5YfVpTDU5y6LwE9KrgzU0iE1K/tGohiyLC4BjVadZ7bQDjfERqi+IcrCU
         PwM5MD928mD0kbQYYVYuyueJskh5bbbYFBiNyonT2Xo913AyjnWWiM5FtQhPuJaeciGW
         YEF6OpPGhMkfDpYgKYR4e7hdH/C2d2YaXCUcpKUHhjpoU8xVclbvAMWqgbtuRbI7siS2
         Pt0SFrCxnn1JF1bDoQbrQj4P+RNbQQcDTipCW9lRJrLhV9GBBwPWpR79ax9eKBkJW7/t
         Uimg==
X-Gm-Message-State: AOJu0YxBfv54KMXa/ZTcTWAhERyU40wZjInq+NOJDXs9wo03TW+2Dtlo
	Qlx8AexHoY6kGJ/Yy/XQxLqYgCEnxKIZKW+Dljt7yVs1Q1ELCuoGa7QEqdkrlaQ3EVwHM2oGDD+
	FvZGyjfTocs0su48mtNVs56pCk5c9l4k=
X-Gm-Gg: AR+sD115Rgx9hksQO8vl47ZxK/kEohaOO4EFe21Zcw9BOhGhbdKmFXxKLuMDJRVAWQx
	T4UDzDEMF2Lk6rj/6ZOlD8bopMDTmL3aJYvbpoVFgQreHpVJ4NJb0MCSF9QH1Y8ANNcGVRY04Ad
	VG1/z8BZ+/9/6RxTOMUNtRvnGJrbEeco39VeB7PSazeUUjUS7ymKwZzHDPIfMV5zprDe4Nr+6/0
	SjUap6SEqjhVfKirbYv7RTbS0Xgx+NQDxhgQ+djE3gT7qPViUpT6TO3PHeNHLvVRGy+xFUFt967
	g3YB3QpiERbS2A887qhDpUrPJZJxLwPLck89WRKfyHARut8wasS1503q2ILQiz2rCZeUugsyzxI
	N4jDck3aGjKJqeGqkVtmybkEu1abxLSNwiRld+1uQzTxuv7Qnd+rR80K3thF70uO9p+MgUj7kBU
	jGJ65PNE1nPxOyKXravMhrdnH71P2VDa4v7PglhMb7L0S6WHXGtoVyL+8TFy9GFIf9op/Hmc6Ln
	ZrasZ5cduB4BQOu6m+I1IbLng==
X-Received: by 2002:a05:690e:4551:20b0:667:97c4:7058 with SMTP id
 956f58d0204a3-66c72cdde42mr916491d50.37.1786678364267; Thu, 13 Aug 2026
 20:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260812125954.688985-1-peter.marko@siemens.com>
In-Reply-To: <20260812125954.688985-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 20:32:18 -0700
X-Gm-Features: AUfX_mwthJIJ7Y2vRoicJUKaVLU7UqCyDC4rBG36VeUFsaglLqm3Ut1Qcpbn1-Y
Message-ID: <CAMKF1sqJQuxMD_LWL9hfH0XUUVszT4dW6LF61_C+nhhQhuY3zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain/clang: prepend target host-sys to HOST_CC_ARCH
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000003ae88f0658f9794a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243394

--0000000000003ae88f0658f9794a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 6:00=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> This assignment was present in scarthgap meta-clang.
> * commit adding it: [1]
> * commit removing it from native case: [2]
> * it was removed completely when migrating clang to oe-core
>
> After migration from scarthgap to wrynose (or current master), clang
> extra tools like clang-tidy do not work anymore.
>
> Test recipe used for fix validation:
>
> test-recipe.bb:
>   SUMMARY =3D "clang-tidy demonstration program"
>   SECTION =3D "examples"
>   HOMEPAGE =3D "n/a"
>   LICENSE =3D "GPL-2.0-only"
>   LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=3D801f809=
80d171dd6425610833a22dbe6"
>   SRC_URI =3D "file://CMakeLists.txt file://hello-world.cpp"
>   S =3D "${UNPACKDIR}"
>   TOOLCHAIN =3D "clang"
>   inherit cmake
>
> CMakeLists.txt
>   project(hello-world)
>   cmake_minimum_required(VERSION 3.5)
>   find_program(CLANG_TIDY NAMES clang-tidy)
>   set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}" "--checks=3D*")
>   add_executable(${PROJECT_NAME} hello-world.cpp)
>
> hello-world.cpp
>   #include <iostream>
>   int main() {
>     std::cout << "Hello World!";
>     return 0;
>   }
>
> I have asked AI agent to analyze clang sources for side-effects which
> are mentioned in patch removing this with following result:
>
> When a cmake recipe uses CMAKE_CXX_CLANG_TIDY (or runs clang-tidy in any
> mode that passes the compile command via -- on the command line), CMake
> invokes clang-tidy through its __run_co_compile path. This path
> constructs a FixedCompilationDatabase from the arguments following --.
> Inside FixedCompilationDatabase::loadFromCommandLine() the original
> cross-compiler binary name (e.g. x86_64-poky-linux-clang++) is stripped
> by stripPositionalArgs() and replaced with a dummy argv[0]. As a result
> the target triple encoded in the cross-compiler name is never seen by
> clang-tidy.
>
> JSONCompilationDatabase (used when clang-tidy is run with -p <build_dir>)
> wraps its commands with inferTargetAndDriverMode(), which calls
> addTargetAndModeForProgramName() and would correctly inject
> --target=3Dx86_64-poky-linux. FixedCompilationDatabase has no equivalent
> step, so the native clang-tidy falls back to the build-host default
> triple and cannot locate C++ headers under the target sysroot:
>
>   hello-world.cpp:1:10: error: 'iostream' file not found
>
> The fix is to make the -target flag explicit in the compile commands.
> The cross-compiler already has LLVM_DEFAULT_TARGET_TRIPLE compiled in as
> HOST_SYS, so adding -target ${HOST_SYS} to HOST_CC_ARCH is a no-op for
> the compiler itself. For clang-tidy and other Clang-based tools that
> parse compile commands but do not inherit the binary's baked-in default
> triple the flag is the only reliable channel to communicate the intended
> target.
>
> On a typical GNU/Linux host the GCC runtime is installed under a
> vendor-qualified tuple (e.g. aarch64-linux-gnu/) that clang probes at
> runtime. Providing an explicit -target aarch64-linux overrides that
> probe and prevents clang-native from finding libgcc and crt objects,
> which was the original motivation for removing the assignment.
>
> [1]
> https://github.com/kraj/meta-clang/commit/503aa977b27be0506fb6ac21fbf9e8b=
049b82247
> [2]
> https://github.com/kraj/meta-clang/commit/6da0abaa33b458a37b97f42e3755245=
e3220bf27
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes/toolchain/clang.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/toolchain/clang.bbclass
> b/meta/classes/toolchain/clang.bbclass
> index 9a3cd0e584..862ecb5e10 100644
> --- a/meta/classes/toolchain/clang.bbclass
> +++ b/meta/classes/toolchain/clang.bbclass
> @@ -34,6 +34,9 @@ LDFLAGS:append:class-nativesdk:x86-64 =3D "
> -Wl,-dynamic-linker,${base_libdir}/ld-
>  LDFLAGS:append:class-nativesdk:aarch64 =3D "
> -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
>  LDFLAGS:append:class-cross-canadian =3D "
> -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/ins=
taller"
>
> +# helps extra tools like clang-tidy to find arch-specific macros and
> headers in a cross compile environment
> +HOST_CC_ARCH:prepend =3D "-target ${HOST_SYS} "
>

This will impact all variants of clang compiler invocations e.g.
native/nativesdk etc. I hope it does not impact sstate sharing.

> +
>  # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
>  POPULATESYSROOTDEPS:append:class-target =3D "
> llvm-native:do_populate_sysroot"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243286):
> https://lists.openembedded.org/g/openembedded-core/message/243286
> Mute This Topic: https://lists.openembedded.org/mt/120717002/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003ae88f0658f9794a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 12,=
 2026 at 6:00=E2=80=AFAM Peter Marko via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siem=
ens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Pet=
er Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">p=
eter.marko@siemens.com</a>&gt;<br>
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
. I hope it does not impact sstate sharing.=C2=A0</span></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
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

--0000000000003ae88f0658f9794a--

