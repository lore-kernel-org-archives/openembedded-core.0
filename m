Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1DBC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 19:43:38 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web09.11391.1653507809208041089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 12:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mqyHCuyd;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id v26so9723245ybd.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GNjHQzujbr4YTFRU9uslDUkBqYLGxItcaMBMoPfJyTw=;
        b=mqyHCuydVsjjVDqzImF3TJctFHCmtYHys5NBmLtwA0RWOO9JqhQiZfDNi+ifdb+Onx
         icRoIvUXGt67MJbEznCJD45b3zgnahV+PWoCbcfWFoJ4oeOjP5cWzk0dpF760MsINSJJ
         nZ1F7DViQTxRuvK06QbIKVS5rxLsyG173SW+peVNwUFvUCP3PkvD4pWaXB2lD7llhmqj
         A5goFla/6EXhCBl3XJiIrP14eszfs3RUEcBmnL9xqpAvQ+iUtVtf8Ug4vZfJ6qD3H5CO
         PaTOe125jPIRmqTuIlhkGmO85D0pOSvXKxwS7N2C1KrizE4AKEohv1kOf43+Xf69n1it
         6kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GNjHQzujbr4YTFRU9uslDUkBqYLGxItcaMBMoPfJyTw=;
        b=GcgqXrTsZgEJ/9JoeHa3dsN+mvUu00vjy+2NI4lgtytcPTHstntjLMZ31krbAu1YHb
         r2ofOhei+ro9Meou5g7HRJmgSNNlPxn1TePVlMigxUNvaEcJdakVd9tlAoHKseBirhgf
         kGMM+Wgk3JKg58jcaSX41SwyxXwGao/KmIVMUFCABpj5fa1MrsfqIKo85bXT2/wpBQnR
         rKTPM7it/XvDBWfBxUJ5zxJUgfrjDQ/B1s6FS9/gSDqCwhoyapRFvOEJFF7HJUTy6Mf+
         3l3s1IDJgOQMYr+LwZxn8GQ+DxsVsFAeq0bAOeksIgNDNVSkdFrmBly+FIDFAbOpQZQE
         JT5Q==
X-Gm-Message-State: AOAM531VZda2WjHkJpsVSKrfsm+uX2HzyCLgZAsh0nNKwGJiTB50i8cd
	5yBBMAqO3Qj8ofOEnLLdzVRHsQCd7cFqLl/iBoQ=
X-Google-Smtp-Source: 
 ABdhPJyAFeSSQ/uHAwmT6co6HCEfvwVKvTChjqOnJTHJWCI80M8v62qG3z7FGFvRCUkcMUAquwPY155EUviMaZoxlFs=
X-Received: by 2002:a05:6902:2c6:b0:64f:5b77:6869 with SMTP id
 w6-20020a05690202c600b0064f5b776869mr27000628ybh.494.1653507808223; Wed, 25
 May 2022 12:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <20220525184852.3999906-2-Martin.Jansa@gmail.com>
In-Reply-To: <20220525184852.3999906-2-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2022 12:43:02 -0700
Message-ID: 
 <CAMKF1soDveFJZnqf2jBXT4YJGED=KuB_HrFFgVGDdWGGxrFgVw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/2] gcc: backport fix for PR96204
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 19:43:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166168

Can you also ask gcc bugzilla for gcc-11 backport ? so we get it into 11.4

On Wed, May 25, 2022 at 11:49 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96204
> * with gcc-11 I'm seeing some components failing with:
>
>   lib32-recipe-sysroot/usr/include/gtest/gtest-printers.h:290:36: error: no matching function for call to 'testing::internal::internal_stream_operator_without_lexical_name_lookup::StreamPrinter::PrintValue(const bluetooth::Uuid&, std::nullptr_t)'
>   290 |     T, decltype(Printer::PrintValue(std::declval<const T&>(), nullptr)),
>       |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   lib32-recipe-sysroot/usr/include/gtest/gtest-printers.h:212:33: error: no match for 'operator<<' (operand types are 'std::basic_ostream<char>' and 'const bluetooth::Uuid')
>   211 |             typename = decltype(std::declval<std::ostream&>()
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   212 |                                 << std::declval<const T&>())>
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   lib32-recipe-sysroot/usr/include/c++/12.0.0/ostream:747:5: error: no type named 'type' in 'struct std::enable_if<false, void>'
>
>   which built fine with gcc-10 and builds fine again with gcc-12,
>   this backported patch fixes it for gcc-11 as well
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 +
>  ...during-partial-spec-matching-PR96204.patch | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
> index b1ef9d25af..ac2bafde7a 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
> @@ -59,6 +59,7 @@ SRC_URI = "\
>             file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
>             file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
>             file://0029-Fix-install-path-of-linux64.h.patch \
> +           file://0030-c-access-scope-during-partial-spec-matching-PR96204.patch \
>             \
>             file://0001-CVE-2021-42574.patch \
>             file://0002-CVE-2021-42574.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch b/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch
> new file mode 100644
> index 0000000000..9d80c875f0
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch
> @@ -0,0 +1,126 @@
> +From 9f26e34a5a9614a5b66f146752ecef9ea67b3e2d Mon Sep 17 00:00:00 2001
> +From: Patrick Palka <ppalka@redhat.com>
> +Date: Sat, 26 Jun 2021 11:05:54 -0400
> +Subject: [PATCH] c++: access scope during partial spec matching [PR96204]
> +
> +Here, when determining whether the partial specialization matches
> +has_type_member<Child>, we do so from the scope of where the template-id
> +appears rather than from the scope of the specialization, and this
> +causes us to select the partial specialization (since Child::type is
> +accessible from Parent).  When we later instantiate this partial
> +specialization, we've entered the scope of the specialization and so
> +substitution into e.g. the DECL_CONTEXT of has_type_member::value fails
> +with access errors since the friend declaration that we relied on to
> +choose the partial specialization no longer applies.
> +
> +It seems the appropriate access scope from which to perform partial
> +specialization matching is the specialization itself (similar to how
> +we check access of base-clauses), which is what this patch implements.
> +
> +       PR c++/96204
> +
> +gcc/cp/ChangeLog:
> +
> +       * pt.c (instantiate_class_template_1): Enter the scope of the
> +       type when calling most_specialized_partial_spec.
> +
> +gcc/testsuite/ChangeLog:
> +
> +       * g++.dg/template/access40.C: New test.
> +       * g++.dg/template/access40a.C: New test.
> +
> +Upstream-Status: Backport [12.1 https://github.com/gcc-mirror/gcc/commit/9f26e34a5a9614a5b66f146752ecef9ea67b3e2d]
> +
> +---
> + gcc/cp/pt.c                               |  5 +++-
> + gcc/testsuite/g++.dg/template/access40.C  | 28 +++++++++++++++++++++++
> + gcc/testsuite/g++.dg/template/access40a.C | 28 +++++++++++++++++++++++
> + 3 files changed, 60 insertions(+), 1 deletion(-)
> + create mode 100644 gcc/testsuite/g++.dg/template/access40.C
> + create mode 100644 gcc/testsuite/g++.dg/template/access40a.C
> +
> +diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c
> +index e5a2a2cd525..f2039e09cd7 100644
> +--- a/gcc/cp/pt.c
> ++++ b/gcc/cp/pt.c
> +@@ -11769,8 +11769,11 @@ instantiate_class_template_1 (tree type)
> +   deferring_access_check_sentinel acs (dk_no_deferred);
> +
> +   /* Determine what specialization of the original template to
> +-     instantiate.  */
> ++     instantiate; do this relative to the scope of the class for
> ++     sake of access checking.  */
> ++  push_nested_class (type);
> +   t = most_specialized_partial_spec (type, tf_warning_or_error);
> ++  pop_nested_class ();
> +   if (t == error_mark_node)
> +     return error_mark_node;
> +   else if (t)
> +diff --git a/gcc/testsuite/g++.dg/template/access40.C b/gcc/testsuite/g++.dg/template/access40.C
> +new file mode 100644
> +index 00000000000..d035e99e462
> +--- /dev/null
> ++++ b/gcc/testsuite/g++.dg/template/access40.C
> +@@ -0,0 +1,28 @@
> ++// PR c++/96204
> ++
> ++template<class, class = void>
> ++struct has_type_member {
> ++  static const bool value = false;
> ++};
> ++
> ++template<class T>
> ++struct has_type_member<T, typename T::type> {
> ++  static const bool value = true;
> ++};
> ++
> ++struct Parent;
> ++
> ++struct Child {
> ++private:
> ++  friend struct Parent;
> ++  typedef void type;
> ++};
> ++
> ++struct Parent {
> ++  static void f() {
> ++    // The partial specialization does not match despite Child::type
> ++    // being accessible from the current scope.
> ++    extern int x[1];
> ++    extern int x[!has_type_member<Child>::value];
> ++  }
> ++};
> +diff --git a/gcc/testsuite/g++.dg/template/access40a.C b/gcc/testsuite/g++.dg/template/access40a.C
> +new file mode 100644
> +index 00000000000..94025c513b7
> +--- /dev/null
> ++++ b/gcc/testsuite/g++.dg/template/access40a.C
> +@@ -0,0 +1,28 @@
> ++// PR c++/96204
> ++
> ++template<class, class = void>
> ++struct has_type_member {
> ++  static const bool value = false;
> ++};
> ++
> ++template<class T>
> ++struct has_type_member<T, typename T::type> {
> ++  static const bool value = true;
> ++};
> ++
> ++struct Parent;
> ++
> ++struct Child {
> ++private:
> ++  friend struct has_type_member<Child>;
> ++  typedef void type;
> ++};
> ++
> ++struct Parent {
> ++  static void f() {
> ++    // The partial specialization matches because has_type_member<Child>
> ++    // is a friend of Child.
> ++    extern int x[1];
> ++    extern int x[has_type_member<Child>::value];
> ++  }
> ++};
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166166): https://lists.openembedded.org/g/openembedded-core/message/166166
> Mute This Topic: https://lists.openembedded.org/mt/91339758/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

