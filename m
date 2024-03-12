Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BAEC54E60
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 12:31:48 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.7432.1710246699035886987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrtvzWQP;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: rwmacleod@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4d4059bd02eso219039e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710246698; x=1710851498; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QrAKJJEKBJ0iNE1LqXZYT4QU67gXIO6uNpadQnZO5GE=;
        b=HrtvzWQPS8ycufiRXPLcD6WM3EhTNdeEvn3iWPMGXm2TMqzpfdyOWD2bZCNMAdm5Zd
         JMLC9S4qwsr3g47PdTaOUNSj9VCwufYP/9TLQZLvrYsIur+wZ0KO8kzW2fN8X9B+7S5R
         OrvJVyA43GglMI3saKwpRPHPA/EMpVk7U5ujvmN7oiF+0Rj0Qh2EyfXpJ71/5+3X4oJu
         qSchVdqlo4+zqoXJ8Fuy0rCkUVS3UyXMpsxFgiGruS+KI9ZEnrEXrnQyJKtE63lazRD7
         2tELUQJwknMMPIygt/zE4JdtYRyANxkuQbmqcz3dQmkWYPnd3tU6ZEIyV61YEY2GBPwj
         MsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710246698; x=1710851498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrAKJJEKBJ0iNE1LqXZYT4QU67gXIO6uNpadQnZO5GE=;
        b=ddnb9qAA2Aiswl9fs85aJQe/jBUVV5eKuGUU7JgJ9cuNknnthF6rV0tQK/2fbbU6ZX
         E9sej2hc6Wr75rHyNCGqJ24zvfF5ZVXIPjNDPTq5SoUAQuAKXlKoDOudjVhS/UcukjRA
         w4mxv2DnFXAuD81L4eEg88z9HVyCN5Xsr25kDAQZHsaaLQabzCK2t3ckPToJvuBlZUNL
         phQmDeE/OVzE/UKf/s1QViH6XByajlLNtwj1HtHTIyDjvIPSBQZn9AZCxH+NvRj3s9BV
         P188Juxq1P3r5bMOPXWrMHtFg8uazbBHKkOyYmS+F2vZ/tiCawwwvDUi0mBpytQtNEKY
         zKWw==
X-Gm-Message-State: AOJu0YwnPDXilbvBNcZ70Mk12f2rqoYp065edETu2u2/G5FxQ0m2TvtI
	8gyo0SV/29/UreJYDF6QXtUpYjIWRk54h2sbeJFvBXjAIcX6M/bULJVrJVQlnARPIqYvpxSzhg0
	HyYGgSu3PGYCtHlvFJ9MRwOS4/18WMUTI
X-Google-Smtp-Source: AGHT+IFbdpE2RGei91MqHEB9JwDOZAuNPXxAxq5AxCBlmRQNIGy0s/efdk5g34kw/iRSvQUC38qcRZkuehKmD6WqemM=
X-Received: by 2002:a05:6122:168e:b0:4c0:1918:27de with SMTP id
 14-20020a056122168e00b004c0191827demr2971418vkl.16.1710246697935; Tue, 12 Mar
 2024 05:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240312075336.2895321-1-meenali.gupta@windriver.com>
In-Reply-To: <20240312075336.2895321-1-meenali.gupta@windriver.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Tue, 12 Mar 2024 08:31:29 -0400
Message-ID: <CAK6=ix4qYV7jbbD4iAKVQBXuTaHh-Tk8N9d8MTHmKLhbavC_qg@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] expat: Upgrade to 2.6.0
To: meenali.gupta@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000e8ab13061375d6e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 12:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196977

--000000000000e8ab13061375d6e9
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2024, 03:54 Meenali Gupta via lists.openembedded.org
<meenali.gupta=windriver.com@lists.openembedded.org> wrote:

> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> Package and run benchmark as part of ptest
> This is a major release



As explained in:

https://lists.openembedded.org/g/openembedded-core/message/196837

we can't do major release updates on kirkstone so please checkout the
Debian back-port mentioned in the other thread.

Thanks,
../Randy

with following changes [1]
>
> ChangeLog:
> https://github.com/libexpat/libexpat/blob/R_2_6_1/expat/Changes
>
> Security fixes:
>       #789 #814  CVE-2023-52425 -- Fix quadratic runtime issues with big
> tokens
>                    that can cause denial of service, in partial where
>                    dealing with compressed XML input.  Applications
>                    that parsed a document in one go -- a single call to
>                    functions XML_Parse or XML_ParseBuffer -- were not
> affected.
>                    The smaller the chunks/buffers you use for parsing
>                    previously, the bigger the problem prior to the fix.
>                    Backporters should be careful to no omit parts of
>                    pull request #789 and to include earlier pull request
> #771,
>                    in order to not break the fix.
>            #777  CVE-2023-52426 -- Fix billion laughs attacks for users
>                    compiling *without* XML_DTD defined (which is not
> common).
>                    Users with XML_DTD defined have been protected since
>                    Expat >=2.4.0 (and that was CVE-2013-0340 back then).
>
>         Bug fixes:
>             #753  Fix parse-size-dependent "invalid token" error for
>                     external entities that start with a byte order mark
>             #780  Fix NULL pointer dereference in setContext via
>                     XML_ExternalEntityParserCreate for compilation with
>                     XML_DTD undefined
>        #812 #813  Protect against closing entities out of order
>
>         Other changes:
>             #723  Improve support for arc4random/arc4random_buf
>        #771 #788  Improve buffer growth in XML_GetBuffer and XML_Parse
>        #761 #770  xmlwf: Support --help and --version
>        #759 #770  xmlwf: Support custom buffer size for XML_GetBuffer and
> read
>             #744  xmlwf: Improve language and URL clickability in help
> output
>             #673  examples: Add new example "element_declarations.c"
>             #764  Be stricter about macro XML_CONTEXT_BYTES at build time
>             #765  Make inclusion to expat_config.h consistent
>        #726 #727  Autotools: configure.ac: Support
> --disable-maintainer-mode
>     #678 #705 ..
>   #706 #733 #792  Autotools: Sync CMake templates with CMake 3.26
>             #795  Autotools: Make installation of shipped man page
> doc/xmlwf.1
>                     independent of docbook2man availability
>             #815  Autotools|CMake: Add missing -DXML_STATIC to pkg-config
> file
>                     section "Cflags.private" in order to fix compilation
>                     against static libexpat using pkg-config on Windows
>        #724 #751  Autotools|CMake: Require a C99 compiler
>                     (a de-facto requirement already since Expat 2.2.2 of
> 2017)
>             #793  Autotools|CMake: Fix PACKAGE_BUGREPORT variable
>        #750 #786  Autotools|CMake: Make test suite require a C++11 compiler
>             #749  CMake: Require CMake >=3.5.0
>             #672  CMake: Lowercase off_t and size_t to help a bug in Meson
>             #746  CMake: Sort xmlwf sources alphabetically
>             #785  CMake|Windows: Fix generation of DLL file version info
>             #790  CMake: Build tests/benchmark/benchmark.c as well for
>                     a build with -DEXPAT_BUILD_TESTS=ON
>        #745 #757  docs: Document the importance of isFinal + adjust tests
>                     accordingly
>             #736  docs: Improve use of "NULL" and "null"
>             #713  docs: Be specific about version of XML (XML 1.0r4)
>                     and version of C (C99); (XML 1.0r5 will need a
> sponsor.)
>             #762  docs: reference.html: Promote function XML_ParseBuffer
> more
>             #779  docs: reference.html: Add HTML anchors to XML_* macros
>             #760  docs: reference.html: Upgrade to OK.css 1.2.0
>        #763 #739  docs: Fix typos
>             #696  docs|CI: Use HTTPS URLs instead of HTTP at various places
>     #669 #670 ..
>     #692 #703 ..
>        #733 #772  Address compiler warnings
>        #798 #800  Address clang-tidy warnings
>        #775 #776  Version info bumped from 9:10:8 (libexpat*.so.1.8.10)
>                     to 10:0:9 (libexpat*.so.1.9.0); see
> https://verbump.de/
>                     for what these numbers do
>
>         Infrastructure:
>        #700 #701  docs: Document security policy in file SECURITY.md
>             #766  docs: Improve parse buffer variables in-code
> documentation
>     #674 #738 ..
>     #740 #747 ..
>   #748 #781 #782  Refactor coverage and conformance tests
>        #714 #716  Refactor debug level variables to unsigned long
>             #671  Improve handling of empty environment variable value
>                     in function getDebugLevel (without visible user effect)
>     #755 #774 ..
>     #758 #783 ..
>        #784 #787  tests: Improve test coverage with regard to parse chunk
> size
>   #660 #797 #801  Fuzzing: Improve fuzzing coverage
>        #367 #799  Fuzzing|CI: Start running OSS-Fuzz fuzzing regression
> tests
>        #698 #721  CI: Resolve some Travis CI leftovers
>             #669  CI: Be robust towards absence of Git tags
>        #693 #694  CI: Set permissions to "contents: read" for security
>             #709  CI: Pin all GitHub Actions to specific commits for
> security
>             #739  CI: Reject spelling errors using codespell
>             #798  CI: Enforce clang-tidy clean code
>     #773 #808 ..
>        #809 #810  CI: Upgrade Clang from 15 to 18
>             #796  CI: Start using Clang's Control Flow Integrity sanitizer
>   #675 #720 #722  CI: Adapt to breaking changes in GitHub Actions Ubuntu
> images
>             #689  CI: Adapt to breaking changes in Clang/LLVM Debian
> packaging
>             #763  CI: Adapt to breaking changes in codespell
>             #803  CI: Adapt to breaking changes in Cppcheck
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  meta/recipes-core/expat/expat/run-ptest                    | 2 +-
>  meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} (81%)
>
> diff --git a/meta/recipes-core/expat/expat/run-ptest
> b/meta/recipes-core/expat/expat/run-ptest
> index dbf602ca80..ff7986db3c 100644
> --- a/meta/recipes-core/expat/expat/run-ptest
> +++ b/meta/recipes-core/expat/expat/run-ptest
> @@ -5,5 +5,5 @@ TIME=$(which time)
>  echo "runtests"
>  ${TIME} -f 'Execution time: %e s' bash -c "./runtests -v"
>  echo "runtestspp"
> -${TIME} -f 'Execution time: %e s' bash -c "./runtestspp -v"
> +${TIME} -f 'Execution time: %e s' bash -c "./runtests_cxx -v"
>  echo
> diff --git a/meta/recipes-core/expat/expat_2.5.0.bb
> b/meta/recipes-core/expat/expat_2.6.0.bb
> similarity index 81%
> rename from meta/recipes-core/expat/expat_2.5.0.bb
> rename to meta/recipes-core/expat/expat_2.6.0.bb
> index 7080f934d1..bdc405148b 100644
> --- a/meta/recipes-core/expat/expat_2.5.0.bb
> +++ b/meta/recipes-core/expat/expat_2.6.0.bb
> @@ -14,7 +14,7 @@ SRC_URI = "
> https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
>
>  UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
>
> -SRC_URI[sha256sum] =
> "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67"
> +SRC_URI[sha256sum] =
> "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0ec6f55736b78d85ba"
>
>  EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
>
> @@ -23,7 +23,8 @@ RDEPENDS:${PN}-ptest += "bash"
>  inherit cmake lib_package ptest
>
>  do_install_ptest:class-target() {
> -       install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
> +       install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
> +       install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
>  }
>
>  BBCLASSEXTEND += "native nativesdk"
> --
> 2.40.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196972):
> https://lists.openembedded.org/g/openembedded-core/message/196972
> Mute This Topic: https://lists.openembedded.org/mt/104880559/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e8ab13061375d6e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 12, 2024, 03:54 Meenali Gupta via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;meenali.g=
upta=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">From: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&gt;<b=
r>
<br>
Package and run benchmark as part of ptest<br>
This is a major release </blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">As explained in:</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/196837">https://lists.openembedded.org/=
g/openembedded-core/message/196837</a><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">we can&#39;t do major release updates on kirkstone so pl=
ease checkout the Debian back-port mentioned in the other thread.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"au=
to">../Randy</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">with following changes [1]<=
br>
<br>
ChangeLog:<br>
<a href=3D"https://github.com/libexpat/libexpat/blob/R_2_6_1/expat/Changes"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/libexpa=
t/libexpat/blob/R_2_6_1/expat/Changes</a><br>
<br>
Security fixes:<br>
=C2=A0 =C2=A0 =C2=A0 #789 #814=C2=A0 CVE-2023-52425 -- Fix quadratic runtim=
e issues with big tokens<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that c=
an cause denial of service, in partial where<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dealin=
g with compressed XML input.=C2=A0 Applications<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that p=
arsed a document in one go -- a single call to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0functi=
ons XML_Parse or XML_ParseBuffer -- were not affected.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The sm=
aller the chunks/buffers you use for parsing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0previo=
usly, the bigger the problem prior to the fix.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Backpo=
rters should be careful to no omit parts of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pull r=
equest #789 and to include earlier pull request #771,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in ord=
er to not break the fix.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#777=C2=A0 CVE-2023-52426 -- Fix b=
illion laughs attacks for users<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compil=
ing *without* XML_DTD defined (which is not common).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Users =
with XML_DTD defined have been protected since<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Expat =
&gt;=3D2.4.0 (and that was CVE-2013-0340 back then).<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bug fixes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #753=C2=A0 Fix parse-size-depende=
nt &quot;invalid token&quot; error for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exter=
nal entities that start with a byte order mark<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #780=C2=A0 Fix NULL pointer deref=
erence in setContext via<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XML_E=
xternalEntityParserCreate for compilation with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XML_D=
TD undefined<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#812 #813=C2=A0 Protect against closing entities=
 out of order<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Other changes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #723=C2=A0 Improve support for ar=
c4random/arc4random_buf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#771 #788=C2=A0 Improve buffer growth in XML_Get=
Buffer and XML_Parse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#761 #770=C2=A0 xmlwf: Support --help and --vers=
ion<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#759 #770=C2=A0 xmlwf: Support custom buffer siz=
e for XML_GetBuffer and read<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #744=C2=A0 xmlwf: Improve languag=
e and URL clickability in help output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #673=C2=A0 examples: Add new exam=
ple &quot;element_declarations.c&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #764=C2=A0 Be stricter about macr=
o XML_CONTEXT_BYTES at build time<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #765=C2=A0 Make inclusion to expa=
t_config.h consistent<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#726 #727=C2=A0 Autotools: <a href=3D"http://con=
figure.ac" rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a>=
: Support --disable-maintainer-mode<br>
=C2=A0 =C2=A0 #678 #705 ..<br>
=C2=A0 #706 #733 #792=C2=A0 Autotools: Sync CMake templates with CMake 3.26=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #795=C2=A0 Autotools: Make instal=
lation of shipped man page doc/xmlwf.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indep=
endent of docbook2man availability<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #815=C2=A0 Autotools|CMake: Add m=
issing -DXML_STATIC to pkg-config file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 secti=
on &quot;Cflags.private&quot; in order to fix compilation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 again=
st static libexpat using pkg-config on Windows<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#724 #751=C2=A0 Autotools|CMake: Require a C99 c=
ompiler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (a de=
-facto requirement already since Expat 2.2.2 of 2017)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #793=C2=A0 Autotools|CMake: Fix P=
ACKAGE_BUGREPORT variable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#750 #786=C2=A0 Autotools|CMake: Make test suite=
 require a C++11 compiler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #749=C2=A0 CMake: Require CMake &=
gt;=3D3.5.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #672=C2=A0 CMake: Lowercase off_t=
 and size_t to help a bug in Meson<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #746=C2=A0 CMake: Sort xmlwf sour=
ces alphabetically<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #785=C2=A0 CMake|Windows: Fix gen=
eration of DLL file version info<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #790=C2=A0 CMake: Build tests/ben=
chmark/benchmark.c as well for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a bui=
ld with -DEXPAT_BUILD_TESTS=3DON<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#745 #757=C2=A0 docs: Document the importance of=
 isFinal + adjust tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accor=
dingly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #736=C2=A0 docs: Improve use of &=
quot;NULL&quot; and &quot;null&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #713=C2=A0 docs: Be specific abou=
t version of XML (XML 1.0r4)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and v=
ersion of C (C99); (XML 1.0r5 will need a sponsor.)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #762=C2=A0 docs: reference.html: =
Promote function XML_ParseBuffer more<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #779=C2=A0 docs: reference.html: =
Add HTML anchors to XML_* macros<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #760=C2=A0 docs: reference.html: =
Upgrade to OK.css 1.2.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#763 #739=C2=A0 docs: Fix typos<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #696=C2=A0 docs|CI: Use HTTPS URL=
s instead of HTTP at various places<br>
=C2=A0 =C2=A0 #669 #670 ..<br>
=C2=A0 =C2=A0 #692 #703 ..<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#733 #772=C2=A0 Address compiler warnings<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#798 #800=C2=A0 Address clang-tidy warnings<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#775 #776=C2=A0 Version info bumped from 9:10:8 =
(libexpat*.so.1.8.10)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to 10=
:0:9 (libexpat*.so.1.9.0); see <a href=3D"https://verbump.de/" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://verbump.de/</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for w=
hat these numbers do<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Infrastructure:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#700 #701=C2=A0 docs: Document security policy i=
n file SECURITY.md<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #766=C2=A0 docs: Improve parse bu=
ffer variables in-code documentation<br>
=C2=A0 =C2=A0 #674 #738 ..<br>
=C2=A0 =C2=A0 #740 #747 ..<br>
=C2=A0 #748 #781 #782=C2=A0 Refactor coverage and conformance tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#714 #716=C2=A0 Refactor debug level variables t=
o unsigned long<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #671=C2=A0 Improve handling of em=
pty environment variable value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in fu=
nction getDebugLevel (without visible user effect)<br>
=C2=A0 =C2=A0 #755 #774 ..<br>
=C2=A0 =C2=A0 #758 #783 ..<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#784 #787=C2=A0 tests: Improve test coverage wit=
h regard to parse chunk size<br>
=C2=A0 #660 #797 #801=C2=A0 Fuzzing: Improve fuzzing coverage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#367 #799=C2=A0 Fuzzing|CI: Start running OSS-Fu=
zz fuzzing regression tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#698 #721=C2=A0 CI: Resolve some Travis CI lefto=
vers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #669=C2=A0 CI: Be robust towards =
absence of Git tags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#693 #694=C2=A0 CI: Set permissions to &quot;con=
tents: read&quot; for security<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #709=C2=A0 CI: Pin all GitHub Act=
ions to specific commits for security<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #739=C2=A0 CI: Reject spelling er=
rors using codespell<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #798=C2=A0 CI: Enforce clang-tidy=
 clean code<br>
=C2=A0 =C2=A0 #773 #808 ..<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#809 #810=C2=A0 CI: Upgrade Clang from 15 to 18<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #796=C2=A0 CI: Start using Clang&=
#39;s Control Flow Integrity sanitizer<br>
=C2=A0 #675 #720 #722=C2=A0 CI: Adapt to breaking changes in GitHub Actions=
 Ubuntu images<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #689=C2=A0 CI: Adapt to breaking =
changes in Clang/LLVM Debian packaging<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #763=C2=A0 CI: Adapt to breaking =
changes in codespell<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #803=C2=A0 CI: Adapt to breaking =
changes in Cppcheck<br>
<br>
Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver.=
com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&g=
t;<br>
---<br>
=C2=A0meta/recipes-core/expat/expat/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/expat/{<a href=3D"http://expat_2.5.0.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">expat_2.5.0.bb</a> =3D&gt; <a href=3D=
"http://expat_2.6.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">exp=
at_2.6.0.bb</a>} | 5 +++--<br>
=C2=A02 files changed, 4 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-core/expat/{<a href=3D"http://expat_2.5.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">expat_2.5.0.bb</a> =3D&gt; <a =
href=3D"http://expat_2.6.0.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">expat_2.6.0.bb</a>} (81%)<br>
<br>
diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/ex=
pat/expat/run-ptest<br>
index dbf602ca80..ff7986db3c 100644<br>
--- a/meta/recipes-core/expat/expat/run-ptest<br>
+++ b/meta/recipes-core/expat/expat/run-ptest<br>
@@ -5,5 +5,5 @@ TIME=3D$(which time)<br>
=C2=A0echo &quot;runtests&quot;<br>
=C2=A0${TIME} -f &#39;Execution time: %e s&#39; bash -c &quot;./runtests -v=
&quot;<br>
=C2=A0echo &quot;runtestspp&quot;<br>
-${TIME} -f &#39;Execution time: %e s&#39; bash -c &quot;./runtestspp -v&qu=
ot;<br>
+${TIME} -f &#39;Execution time: %e s&#39; bash -c &quot;./runtests_cxx -v&=
quot;<br>
=C2=A0echo<br>
diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">expat_2.5.0.bb</a> b/meta/reci=
pes-core/expat/<a href=3D"http://expat_2.6.0.bb" rel=3D"noreferrer noreferr=
er" target=3D"_blank">expat_2.6.0.bb</a><br>
similarity index 81%<br>
rename from meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">expat_2.5.0.bb</a><br>
rename to meta/recipes-core/expat/<a href=3D"http://expat_2.6.0.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">expat_2.6.0.bb</a><br>
index 7080f934d1..bdc405148b 100644<br>
--- a/meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">expat_2.5.0.bb</a><br>
+++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.6.0.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">expat_2.6.0.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/libexpat/=
libexpat/releases/download/R_$%7BVERSION_TA" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://github.com/libexpat/libexpat/releases/download/R_=
${VERSION_TA</a><br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/libexpat/l=
ibexpat/releases/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/libexpat/libexpat/releases/</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b=
22f34998de11969ff67&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12e=
d0ec6f55736b78d85ba&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE:class-native +=3D &quot;-DEXPAT_BUILD_DOCS=3DOFF&quot;<=
br>
<br>
@@ -23,7 +23,8 @@ RDEPENDS:${PN}-ptest +=3D &quot;bash&quot;<br>
=C2=A0inherit cmake lib_package ptest<br>
<br>
=C2=A0do_install_ptest:class-target() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/tests/* ${D}${PTEST_PATH}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/tests/runtests* ${D}${PTEST=
_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/tests/benchmark/benchmark $=
{D}${PTEST_PATH}<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196972): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196972" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/196972</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104880559/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/104880559/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000e8ab13061375d6e9--

