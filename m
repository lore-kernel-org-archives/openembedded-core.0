Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD8AC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:49:17 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.10744.1653504555598179320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pme8hEWJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id fd25so28172702edb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h042YiLAuu4drQkcq/NeaKSbw22jniHaPutm379oq0k=;
        b=pme8hEWJ9K76msZHmdjIqBQ5mG2LOdHuXRnfYTOftbU6xpqvHJ4l/0fry4tsZcs1yg
         o0KC+DVRwbUpII4EYrehG7SoRPxi6xyQq/MS4tRR4+7QbpEsEQ+x2md0kJBBSs3PWV5Y
         E1xQe1qpqP7NQTMvaIQLM8qApNGYNNcmoJavbdDt1woKx4S71F4IBIY1HlL+x2pMNpSE
         ojXw01D71Mw/QrVW/XqnAOK72xfZzo9EtExhtpeswSsiNnwTycSVn7d2MQO1eLb4zO+e
         EmTADfDgDEl0NtN9DcP0uNFiW4iPnMEMbzMQzucCKruQJFwdVBFVz+3PdiYMqMr1L/Yo
         xREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h042YiLAuu4drQkcq/NeaKSbw22jniHaPutm379oq0k=;
        b=uLi3SoR+h+mkb1j3O3jPSeyXy9Fbt1kjm1AAWTjJ6/duvCiBW2YSX/hIw35TCPWhaM
         C35O8qpf1y98Sfyggn3uPlk2vIS0GGGkx+2tGetidAHCARLh3YQLy+lekSqVWVPDcEEv
         m1z3YFxE1q1Xfxjj1hELeCzakH0axSX4CmMBLXTrkbmE5LZqGRSmHw9Gx4Fi/P4Qjewy
         2ckf8PqNi81P29mYyP/NOaJQLSAIHQagvgr5yvl3vuBtiTHFgGf789s0MZ2qNNRdPc5i
         kZjhXxeq2rR0df9vGffQa9xG2xA7MSHwUU9nNzeqB6oOBVGSJqRsigf9jchbnJoQVJQp
         B31A==
X-Gm-Message-State: AOAM531kitf7Azv65/4UF6qjUH0hvM+5C/PKPynNO+NSRfh+L+MqfzLN
	WogUUpBbCZi59B3fzLYFvnEMxDDPVFE=
X-Google-Smtp-Source: 
 ABdhPJyblfm3/onoFKNTsuHe73iK80OHc57DlkdKqKtkqyFS+jVKYd9I5IFMRvS6DzdcmSb0ijF0ng==
X-Received: by 2002:a05:6402:40cc:b0:42b:3327:d699 with SMTP id
 z12-20020a05640240cc00b0042b3327d699mr27594969edb.380.1653504553879;
        Wed, 25 May 2022 11:49:13 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 f3-20020a1709063f4300b006f3ef214e6esm8420552ejj.212.2022.05.25.11.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 11:49:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH 2/2] gcc: backport fix for PR96204
Date: Wed, 25 May 2022 20:48:52 +0200
Message-Id: <20220525184852.3999906-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 18:49:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166166

* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96204
* with gcc-11 I'm seeing some components failing with:

  lib32-recipe-sysroot/usr/include/gtest/gtest-printers.h:290:36: error: no matching function for call to 'testing::internal::internal_stream_operator_without_lexical_name_lookup::StreamPrinter::PrintValue(const bluetooth::Uuid&, std::nullptr_t)'
  290 |     T, decltype(Printer::PrintValue(std::declval<const T&>(), nullptr)),
      |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ...
  lib32-recipe-sysroot/usr/include/gtest/gtest-printers.h:212:33: error: no match for 'operator<<' (operand types are 'std::basic_ostream<char>' and 'const bluetooth::Uuid')
  211 |             typename = decltype(std::declval<std::ostream&>()
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  212 |                                 << std::declval<const T&>())>
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  ...
  lib32-recipe-sysroot/usr/include/c++/12.0.0/ostream:747:5: error: no type named 'type' in 'struct std::enable_if<false, void>'

  which built fine with gcc-10 and builds fine again with gcc-12,
  this backported patch fixes it for gcc-11 as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 +
 ...during-partial-spec-matching-PR96204.patch | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index b1ef9d25af..ac2bafde7a 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -59,6 +59,7 @@ SRC_URI = "\
            file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
            file://0029-Fix-install-path-of-linux64.h.patch \
+           file://0030-c-access-scope-during-partial-spec-matching-PR96204.patch \
            \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch b/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch
new file mode 100644
index 0000000000..9d80c875f0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-c-access-scope-during-partial-spec-matching-PR96204.patch
@@ -0,0 +1,126 @@
+From 9f26e34a5a9614a5b66f146752ecef9ea67b3e2d Mon Sep 17 00:00:00 2001
+From: Patrick Palka <ppalka@redhat.com>
+Date: Sat, 26 Jun 2021 11:05:54 -0400
+Subject: [PATCH] c++: access scope during partial spec matching [PR96204]
+
+Here, when determining whether the partial specialization matches
+has_type_member<Child>, we do so from the scope of where the template-id
+appears rather than from the scope of the specialization, and this
+causes us to select the partial specialization (since Child::type is
+accessible from Parent).  When we later instantiate this partial
+specialization, we've entered the scope of the specialization and so
+substitution into e.g. the DECL_CONTEXT of has_type_member::value fails
+with access errors since the friend declaration that we relied on to
+choose the partial specialization no longer applies.
+
+It seems the appropriate access scope from which to perform partial
+specialization matching is the specialization itself (similar to how
+we check access of base-clauses), which is what this patch implements.
+
+	PR c++/96204
+
+gcc/cp/ChangeLog:
+
+	* pt.c (instantiate_class_template_1): Enter the scope of the
+	type when calling most_specialized_partial_spec.
+
+gcc/testsuite/ChangeLog:
+
+	* g++.dg/template/access40.C: New test.
+	* g++.dg/template/access40a.C: New test.
+
+Upstream-Status: Backport [12.1 https://github.com/gcc-mirror/gcc/commit/9f26e34a5a9614a5b66f146752ecef9ea67b3e2d]
+
+---
+ gcc/cp/pt.c                               |  5 +++-
+ gcc/testsuite/g++.dg/template/access40.C  | 28 +++++++++++++++++++++++
+ gcc/testsuite/g++.dg/template/access40a.C | 28 +++++++++++++++++++++++
+ 3 files changed, 60 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/g++.dg/template/access40.C
+ create mode 100644 gcc/testsuite/g++.dg/template/access40a.C
+
+diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c
+index e5a2a2cd525..f2039e09cd7 100644
+--- a/gcc/cp/pt.c
++++ b/gcc/cp/pt.c
+@@ -11769,8 +11769,11 @@ instantiate_class_template_1 (tree type)
+   deferring_access_check_sentinel acs (dk_no_deferred);
+ 
+   /* Determine what specialization of the original template to
+-     instantiate.  */
++     instantiate; do this relative to the scope of the class for
++     sake of access checking.  */
++  push_nested_class (type);
+   t = most_specialized_partial_spec (type, tf_warning_or_error);
++  pop_nested_class ();
+   if (t == error_mark_node)
+     return error_mark_node;
+   else if (t)
+diff --git a/gcc/testsuite/g++.dg/template/access40.C b/gcc/testsuite/g++.dg/template/access40.C
+new file mode 100644
+index 00000000000..d035e99e462
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/template/access40.C
+@@ -0,0 +1,28 @@
++// PR c++/96204
++
++template<class, class = void>
++struct has_type_member {
++  static const bool value = false;
++};
++
++template<class T>
++struct has_type_member<T, typename T::type> {
++  static const bool value = true;
++};
++
++struct Parent;
++
++struct Child {
++private:
++  friend struct Parent;
++  typedef void type;
++};
++
++struct Parent {
++  static void f() {
++    // The partial specialization does not match despite Child::type
++    // being accessible from the current scope.
++    extern int x[1];
++    extern int x[!has_type_member<Child>::value];
++  }
++};
+diff --git a/gcc/testsuite/g++.dg/template/access40a.C b/gcc/testsuite/g++.dg/template/access40a.C
+new file mode 100644
+index 00000000000..94025c513b7
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/template/access40a.C
+@@ -0,0 +1,28 @@
++// PR c++/96204
++
++template<class, class = void>
++struct has_type_member {
++  static const bool value = false;
++};
++
++template<class T>
++struct has_type_member<T, typename T::type> {
++  static const bool value = true;
++};
++
++struct Parent;
++
++struct Child {
++private:
++  friend struct has_type_member<Child>;
++  typedef void type;
++};
++
++struct Parent {
++  static void f() {
++    // The partial specialization matches because has_type_member<Child>
++    // is a friend of Child.
++    extern int x[1];
++    extern int x[has_type_member<Child>::value];
++  }
++};
-- 
2.35.1


