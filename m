Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CE6C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 07:13:42 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.8776.1746774819698024582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 00:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eH/z5aeW;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6062e41916dso910127eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746774819; x=1747379619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b802u6uzZXyYNF34lrX32svE1EXcsxBYWqw5QmpiyDQ=;
        b=eH/z5aeWaSTyHTtrj7TWFRFF86W7Qv4LwUh9RP5ynnm/uPSn7vOvByT0fqPwpddLiD
         F+1iQefqJa2xW10ZKTH9pcEZX3RptfAoLOypAOQiXaNW6IPzJTQWbJ4vb8WZxAGd97IV
         RnXUmz2BseEqvWKCV1LNhs8KHcSNaMMfefjdwxtBkrxJEVrJ/9taqV0GyeinNIVYLQ+e
         8A0LNlTme3cPZ2H3eOxr3WeaMGLV9UfefEEfoFSzytDAiGqRdPzUwCnK0hoxbx8qG2LX
         YDCYoOkM0555CDN4AUOqD3AvfFyZKFfYiwtgPdE0BlFrTh08viLvQdBawWXnx2bubb6W
         RVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774819; x=1747379619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b802u6uzZXyYNF34lrX32svE1EXcsxBYWqw5QmpiyDQ=;
        b=EObOCJ41DnbP0c0iCSnQWvo8p9rEfXCOsCW9jVDR96GwGXoGQskixsQ37qz82EoGRF
         OJe+i5tOoCqFP/xynm5EQXRkVUpwTbd2C1bRv6BnqIG78D5jK7uWTGnXeSozybkUBhul
         abUaIfnwgj+u0YMVQZxVPnzuexl4+Mf4CLi4z3Znej3bEUHqsqmiTkVEp8+sMTiWdTXC
         H7/sxo0EaXpyniGfiBaxnm4NPfq2U2/zdV9bs8Zv4SBQn8e7lUQpJD2nG8rGahqRMD5N
         CbzI6qT1HWxab4Jn2lws/hAZw+zTEt4UNMWU6lXENBDb8wiZd3VZWcE+j/6YYBnw34La
         Wqtg==
X-Gm-Message-State: AOJu0YwuHlxDsw8+LouJdZVKd6DCzpZlAMX/wu3UE1vNEEClUACoFcqt
	iMXL7jp29tbpCXhP6nFG0aP6+fUSUeKmj4ZOFAJmhSPnqfWGPKd4IRIICIK4teRmJrNSWG8zlah
	5mCdHSJUgoru84+o9akNk2vrxAQVkm+T1
X-Gm-Gg: ASbGncuxiU/6E0Mh0HOZsUNOh3tz5ZlpPpexEGZ81VCwCJ7qsWPyLqee9+/sw8ptD7u
	blEzisKVh6uC4PdzBzWGIdkj+Lto/ypok7ICLf6IhcGV67J33InZmvthlLAw9yTMQCYm70t7Plq
	gVZFelMGB4Pdj36l7gNKLpfCia9xXT4Jd3A7nK
X-Google-Smtp-Source: AGHT+IHIXiI92jDfFKYQ1JhzN0VdujnUvfAYIiNvaMotsfuW46ZF7ADcWRY59EwGjx7UGHfMAkhTgXeJpRGcRUOV+ig=
X-Received: by 2002:a05:6820:4b0d:b0:608:271a:8d7a with SMTP id
 006d021491bc7-6084c0de928mr1351223eaf.7.1746774818852; Fri, 09 May 2025
 00:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250509052739.3638179-1-yogita.urade@windriver.com>
In-Reply-To: <20250509052739.3638179-1-yogita.urade@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 May 2025 00:13:11 -0700
X-Gm-Features: ATxdqUEAk_VD1ZR1lLpmAVn_D94vFbnPphi_mm86UHQDk8Wu6EErUp3APMKfoLo
Message-ID: <CAMKF1sqMaiOGn+cQ1p8_XMCo+iGdso+kq+1wia8OTywmcJk5sw@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 1/1] webkitgtk: upgrade 2.48.0 -> 2.48.1
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 07:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216186

Have you built it for qemuriscv64 ?

On Thu, May 8, 2025 at 10:28=E2=80=AFPM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,
> CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Limit the data stored in session state.
> - Remove the empty area below the title bar in Web Inspector when not doc=
ked.
> - Fix the build with GST_DISABLE_GST_DEBUG.
> - Fix the build with GStreamer < 1.20.
> - Fix the build with video disabled.
> - Fix the build with clang 20.
>
> Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
> and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
> which are part of upgrade.
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 ------------------
>  ...or-no-matching-function-for-call-to-.patch | 77 -------------------
>  ...ebkitgtk_2.48.0.bb =3D> webkitgtk_2.48.1.bb} |  4 +-
>  3 files changed, 1 insertion(+), 155 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-2=
92304-main-7ffc29624258-.-https-bugs.we.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-=
error-no-matching-function-for-call-to-.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb =3D> webkitgtk_2.48=
.1.bb} (96%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-m=
ain-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
> deleted file mode 100644
> index 5cbb1035b2..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ff=
c29624258-.-https-bugs.we.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Tue, 18 Mar 2025 07:39:01 -0700
> -Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
> - https://bugs.webkit.org/show_bug.cgi?id=3D289953
> -
> -    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
> -    https://bugs.webkit.org/show_bug.cgi?id=3D289953
> -
> -    Reviewed by Alicia Boya Garcia.
> -
> -    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
> -      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
> -      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS=
.
> -
> -    Canonical link: https://commits.webkit.org/292304@main
> -
> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105=
443d41e5ce3de3a4cac2ed8a07ebd134459]
> -
> -Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
> - 1 file changed, 19 insertions(+), 5 deletions(-)
> -
> -diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsComm=
on.cmake
> -index f6cf5ee..3178674 100644
> ---- a/Source/cmake/OptionsCommon.cmake
> -+++ b/Source/cmake/OptionsCommon.cmake
> -@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
> - ")
> - check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIB=
CPP)
> - if (CXX_STDLIB_IS_LIBCPP)
> --    set(CXX_STDLIB_VARIANT "LIBCPP")
> --    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
> -+    set(CXX_STDLIB_TEST_SOURCE "
> -+        #include <utility>
> -+        #if _LIBCPP_VERSION >=3D 190000
> -+        int main() { }
> -+        #else
> -+        #error libc++ is older than 19.x
> -+        #endif
> -+    ")
> -+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS=
_LIBCPP_19_OR_NEWER)
> -+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
> -+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=3D_LIBCP=
P_HARDENING_MODE_EXTENSIVE)
> -+    else ()
> -+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=3D1)
> -+    endif ()
> - else ()
> -     set(CXX_STDLIB_TEST_SOURCE "
> -     #include <utility>
> -@@ -239,7 +253,7 @@ else ()
> -     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS=
_GLIBCXX)
> -     if (CXX_STDLIB_IS_GLIBCXX)
> -         set(CXX_STDLIB_VARIANT "GLIBCXX")
> --        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=3D1)
> -     endif ()
> - endif ()
> - message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
> -@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
> -
> - if (USE_CXX_STDLIB_ASSERTIONS)
> -     if (CXX_STDLIB_ASSERTIONS_MACRO)
> --        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_M=
ACRO}=3D1")
> --        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=3D1")
> -+        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_M=
ACRO}")
> -+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
> -     else ()
> -         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MA=
CRO undefined")
> -     endif ()
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-n=
o-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
> deleted file mode 100644
> index 5b83d9e7eb..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-match=
ing-function-for-call-to-.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
> -From: Fujii Hironori <Hironori.Fujii@sony.com>
> -Date: Tue, 18 Mar 2025 10:25:47 +0900
> -Subject: [PATCH] EnumTraits.h: error: no matching function for call to
> - 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=3D2896=
69
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -Clang 20 couldn't compile EnumTraits.h.
> -
> -> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid exp=
licitly-specified argument for template parameter 'V'
> -
> -An invalid enum value can't be specifed to the template parameter `V`.
> -
> -> template<auto V> constexpr std::span<const char> enumName()
> -
> -The upstream Magic Enum C++ has a template variable `is_enum_constexpr_s=
tatic_cast_valid<E, V>` to check a enum value is valid.
> -<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a38=
4c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
> -
> -Imported the template variable.
> -
> -* Source/WTF/wtf/EnumTraits.h:
> -(WTF::enumName):
> -(WTF::makeEnumNames):
> -
> -Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
> - 1 file changed, 20 insertions(+), 1 deletion(-)
> -
> -diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
> -index 0d33e39a..95e6318b 100644
> ---- a/Source/WTF/wtf/EnumTraits.h
> -+++ b/Source/WTF/wtf/EnumTraits.h
> -@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
> - #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
> - #endif
> -
> -+#if COMPILER(CLANG) && __clang_major__ >=3D 16
> -+template <typename E, auto V, typename =3D void>
> -+inline constexpr bool isEnumConstexprStaticCastValid =3D false;
> -+template <typename E, auto V>
> -+inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<=
std::integral_constant<E, static_cast<E>(V)>>> =3D true;
> -+#else
> -+template <typename, auto>
> -+inline constexpr bool isEnumConstexprStaticCastValid =3D true;
> -+#endif
> -+
> - template<typename E>
> - constexpr std::span<const char> enumTypeNameImpl()
> - {
> -@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
> -     return result;
> - }
> -
> -+template<typename E, auto V>
> -+constexpr std::span<const char> enumName()
> -+{
> -+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
> -+        return enumName<static_cast<E>(V)>();
> -+    else
> -+        return { };
> -+}
> -+
> - template<typename E>
> - constexpr std::underlying_type_t<E> enumNamesMin()
> - {
> -@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is.=
..>)
> - {
> -     constexpr auto min =3D enumNamesMin<E>();
> -     return std::array<std::span<const char>, sizeof...(Is)> {
> --        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(=
Is) + min)>()...
> -+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()=
...
> -     };
> - }
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.48.1.bb
> similarity index 96%
> rename from meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> index 6eb80da1de..41fe8209ce 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> @@ -16,11 +16,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://no-musttail-arm.patch \
>             file://t6-not-declared.patch \
>             file://sys_futex.patch \
> -           file://0001-EnumTraits.h-error-no-matching-function-for-call-=
to-.patch \
> -           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs=
.we.patch \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
>             "
> -SRC_URI[sha256sum] =3D "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769=
f34cbfdf0eebf88e"
> +SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a=
93f71dbfa1eb258f"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216185): https://lists.openembedded.org/g/openembedde=
d-core/message/216185
> Mute This Topic: https://lists.openembedded.org/mt/112893933/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

