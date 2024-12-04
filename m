Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787C4E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:49:47 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.25440.1733345379607978459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=suGjhuJV;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3971be41d8so225133276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345379; x=1733950179; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfCEpFomAxd84A5kps5EYVEyHWTWgGcwPxJJGu4NCeI=;
        b=suGjhuJV3apb6GToefIWsbSgtyW5dvU+yNctnmRl6IMUplKgDFxnXFZQup9L7kk7P5
         +uCwn+7iKDCRBPXu1IQLAyjE/LsmsMkXEe/XpKnBiKPxebs4357f6sDNrbAMqzLgKsSa
         Gt8XMVRbNKGn5chUTyysUN1H/+s3DV5/urrAmX6zJ+ebrfDAAdWZJV67PRRyqaZ0e+OX
         497suFeV59X62fzcklSWXkLnWkweU9uZ1tjETW1LkK+jgoklLLMD7LwCoWamNbsFJmAu
         jVeNbt5vzgN2soja3F/S7dGbcdfldrDjHAD+ry6EgzdSPxPC9wE2zb5Yt0yMLlaZC/0e
         NXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345379; x=1733950179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfCEpFomAxd84A5kps5EYVEyHWTWgGcwPxJJGu4NCeI=;
        b=tQB21qWHIDQnBjkm+GMzfjhmh7NETLwM1Q6AmYZF6Tn8BANzsi0r/jRDqBS/mBM+ng
         gxlJtbRiwttoHTn457XOzXuyZzPOC1FpoLgd+lglXY72O8XWeXtaKvEdBZEsDirZJM1S
         KHnIy0oCOblquqKOZ/3YD5y1EO6fxJGMtTOCjuN+mk1NeX529PIOzDrWWe4oZQyqhWma
         5ZKI9fU0Vs/ffjbYrBjI8gK0Ff0d3qqQ88sR9dQ8ICTSxmuQzwsYpvK18tOAg946Wwi1
         dtw2HlJuDJDvoUZmatuBPGgpkNeLMDa1vZkPhZyFNQlRjw3Njez9GpSqZyKonfEEQ2aI
         Doyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCl7mnb2XJVIeTqLeNQ/JJ9AwYzixR+BUiuamJ6jf2eWTBvvCaVkRhFGsFbnxVl5MCJM9QlPzhIN4o6nvfjJ480Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/WDQx1GUpeKQWy2SD0aW7BsLjGBXuFjDt0scozbcQoswzSdet
	kJZnjwl7u8cQu8leCS/ZnBxHyNpy7RzTZjNRfUzPsa9TUH2EvPrWuE2cTJzUY29nR5mNFzX9epA
	T+8GAy3SFJAZ5xkEkBQuYRXB+AycvtYXJT/HMI2f1JElPX1KDkDo=
X-Gm-Gg: ASbGncuRQzj4GJ00OdTIAtX3xkhU/O2bL1ZZciazD6XR7IB4o2/RHltUi53J+jHLkQZ
	yVUCjWjZdBDQ3wtB7cqRTSqzdsLPDGfQ=
X-Google-Smtp-Source: AGHT+IEMj00/2z009kj08NaEfphsW2SzRFwWMULAA+0JPgdi2+YzZdgF1AZ/r14YHo0Bp2VyI1WuAjht6djbSd3zSIg=
X-Received: by 2002:a05:6902:1209:b0:e30:d158:988d with SMTP id
 3f1490d57ef6-e39d39edae5mr6783192276.9.1733345378568; Wed, 04 Dec 2024
 12:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20241203101426.2227535-1-yogita.urade@windriver.com> <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com>
In-Reply-To: <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 4 Dec 2024 12:49:27 -0800
Message-ID: <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 -> 3.3.5"
To: randy.macleod@windriver.com
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>, "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208360

Sigh, I'm sorry I didn't catch this :-(

I think my eyes saw ruby "upgrade 3.3.2 -> 3.3.5", I checked the link
in the commit message to verify that the changes were all bug/security
fixes and I merged it.

We've already done a release with this update in it.  Perhaps we can
discuss it in the bug meeting tomorrow?

Steve

On Wed, Dec 4, 2024 at 11:51=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Add Robert and Hongxu who working with Yogita on this, iirc.
>
> On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.
>
> This isn't a minor version upgrade.
> $git log v3_2_2..v3_3_5 --oneline  | wc -l
> 6924
>
> Do we have any ruby experts to comment on the stability of the 4.2 branch
> and the update to 3.2.5?
>
> They claim to be following a semantic versioning scheme:
>   https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-change=
s-with-2-1-0/
>
>
> Ruby is a fairly large code base:
> -------------------------------------------------------------------------=
-------
>  Language             Files        Lines        Blank      Comment       =
  Code
> -------------------------------------------------------------------------=
-------
>  Ruby                  7914      1480730       202190        82299      1=
196241
> ...
> -------------------------------------------------------------------------=
-------
>  Total                 9409      2188531       271762       197233      1=
719536
> -------------------------------------------------------------------------=
-------
>
> The git repo does have a branch for each release which would indicate
> that they are at least familiar with the idea of stable releases.
>
> Other than the number of commits being large, do we have
> any data to support the idea that this is not a stable release update?
>
> Yogita,
>   What are the before, after and diff ptest results?
>
> ../Randy
>
>
>
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
>  ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
>  ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
>  ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
>  ...eproducible-change-fixing-784225-too.patch | 26 ++---
>  .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
>  .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
>  .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
>  .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
>  .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
>  .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
>  .../ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}     | 13 ++-
>  12 files changed, 446 insertions(+), 25 deletions(-)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_=
Alignof-to-define-ALIGN_OF-when-poss.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefil=
e.in-do-not-write-host-cross-cc-item.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for=
-the-link-of-libruby.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefil=
e.in-filter-out-f-prefix-map.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patc=
h
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patc=
h
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_ma=
cros.patch
>  rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb} (88=
%)
>
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof=
-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-=
fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
> new file mode 100644
> index 0000000000..ab7ae1eb23
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-def=
ine-ALIGN_OF-when-poss.patch
> @@ -0,0 +1,51 @@
> +From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Jan 2023 02:34:17 -0800
> +Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when possib=
le
> +
> +WG14 N2350 made very clear that it is an UB having type definitions
> +within "offsetof" [1]. This patch enhances the implementation of macro
> +ALIGN_OF to use builtin "_Alignof" to avoid undefined behavior
> +when using std=3Dc11 or newer
> +
> +clang 16+ has started to flag this [2]
> +
> +Fixes build when using -std >=3D gnu11 and using clang16+
> +
> +Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
> +may support C11, exclude those compiler versions
> +
> +[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> +[2] https://reviews.llvm.org/D133574
> +
> +Upstream-Status: Submitted [https://github.com/ruby/fiddle/pull/120]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + ext/fiddle/fiddle.h | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
> +index 10eb9ce..ffb395e 100644
> +--- a/ext/fiddle/fiddle.h
> ++++ b/ext/fiddle/fiddle.h
> +@@ -196,7 +196,17 @@
> + #endif
> + #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
> +
> +-#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, a=
lign_x)
> ++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 5202=
3
> ++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D52023>.
> ++   clang versions < 8.0.0 have the same bug.  */
> ++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
> ++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
> ++         && !defined __clang__) \
> ++     || (defined __clang__ && __clang_major__ < 8))
> ++# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, =
align_x)
> ++#else
> ++# define ALIGN_OF(type) _Alignof(type)
> ++#endif
> +
> + #define ALIGN_VOIDP  ALIGN_OF(void*)
> + #define ALIGN_CHAR   ALIGN_OF(char)
> +--
> +2.39.0
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do=
-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-=
template-Makefile.in-do-not-write-host-cross-cc-item.patch
> new file mode 100644
> index 0000000000..e35a461f76
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-wr=
ite-host-cross-cc-item.patch
> @@ -0,0 +1,32 @@
> +From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 17 Nov 2020 18:31:40 +0000
> +Subject: [PATCH] template/Makefile.in: do not write host cross-cc items =
into
> + target config
> +
> +This helps reproducibility.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + template/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/template/Makefile.in b/template/Makefile.in
> +index 10dc826..940ee07 100644
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -657,11 +657,11 @@ mjit_config.h:
> + echo '#endif'; \
> + quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
> + sep=3D,; \
> +- quote "MJIT_CC_COMMON  " $(MJIT_CC); \
> ++ quote "MJIT_CC_COMMON  " ; \
> + quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
> + quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> + quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> +- quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
> ++ quote "MJIT_LDSHARED   " ; \
> + quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> + quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> + quote 'PRELOADENV       "@PRELOADENV@"'; \
> diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-li=
nk-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for=
-the-link-of-libruby.patch
> new file mode 100644
> index 0000000000..96ae86263b
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-l=
ibruby.patch
> @@ -0,0 +1,25 @@
> +From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Thu, 5 May 2016 10:59:07 -0700
> +Subject: [PATCH] Obey LDFLAGS for the link of libruby
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Upstream-Status: Pending
> +
> +---
> + template/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/template/Makefile.in b/template/Makefile.in
> +index 1456313..15b98a4 100644
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -127,7 +127,7 @@ ENABLE_SHARED =3D @ENABLE_SHARED@
> + LDSHARED =3D @LIBRUBY_LDSHARED@
> + DLDSHARED =3D @DLDSHARED@
> + XDLDFLAGS =3D @DLDFLAGS@
> +-DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
> ++DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
> + SOLIBS =3D @SOLIBS@
> + ENABLE_DEBUG_ENV =3D @ENABLE_DEBUG_ENV@
> + MAINLIBS =3D $(YJIT_LIBS) @MAINLIBS@
> diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-fi=
lter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template=
-Makefile.in-filter-out-f-prefix-map.patch
> new file mode 100644
> index 0000000000..b0d9a2e0ed
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-ou=
t-f-prefix-map.patch
> @@ -0,0 +1,42 @@
> +Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
> +
> +If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
> +reproducible.  Fix this.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> +---
> +--- a/tool/mjit_archflag.sh
> ++++ b/tool/mjit_archflag.sh
> +@@ -7,6 +7,20 @@ quote() {
> +     echo
> + }
> +
> ++quote_filtered() {
> ++    printf "#${indent}define $1"
> ++    while shift && [ "$#" -gt 0 ]; do
> ++ case "$1" in
> ++    -ffile-prefix-map=3D*|-fdebug-prefix-map=3D*|-fmacro-prefix-map=3D*=
)
> ++ ;;
> ++    *)
> ++ printf ' "%s"'$sep "$1"
> ++ ;;
> ++ esac
> ++    done
> ++    echo
> ++}
> ++
> + archs=3D""
> + arch_flag=3D""
> +
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -666,7 +666,7 @@ mjit_config.h:
> + quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> + quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> + quote "MJIT_LDSHARED   " ; \
> +- quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> ++ quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> + quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> + quote 'PRELOADENV       "@PRELOADENV@"'; \
> + indent=3D$${archs:+'  '}; \
> diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducib=
le-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Ma=
rk-Gemspec-reproducible-change-fixing-784225-too.patch
> index 0902a201ec..41f206523e 100644
> --- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
> +++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-chan=
ge-fixing-784225-too.patch
> @@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.=
rb
> -index d6eac7f..4b2e95e 100644
> +index 0d72cee..eb7bc25 100644
>  --- a/lib/rubygems/specification.rb
>  +++ b/lib/rubygems/specification.rb
> -@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
> -                 raise(Gem::InvalidSpecificationException,
> -                       "invalid date format in specification: #{date.ins=
pect}")
> -               end
> --            when Time, DateLike then
> -+            when Time then
> -+              Time.utc(date.utc.year, date.utc.month, date.utc.day)
> -+            when DateLike then
> -               Time.utc(date.year, date.month, date.day)
> -             else
> -               TODAY
> +@@ -1691,7 +1691,9 @@ class Gem::Specification < Gem::BasicSpecification
> +         raise(Gem::InvalidSpecificationException,
> +               "invalid date format in specification: #{date.inspect}")
> +       end
> +-    when Time, DateLike then
> ++    when Time then
> ++      Time.utc(date.utc.year, date.utc.month, date.utc.day)
> ++    when DateLike then
> +       Time.utc(date.year, date.month, date.day)
> +     else
> +       TODAY
>  --
> -2.40.0
> +2.25.1
>
> diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproduci=
ble.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible=
.patch
> index d32e209129..0a87cae17f 100644
> --- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
> +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.pat=
ch
> @@ -7,6 +7,7 @@ Without an explicit date, they will get the current date =
and make the
>  build unreproducible
>
>  Upstream-Status: Backport [debian]
> +
>  ---
>   ext/bigdecimal/bigdecimal.gemspec | 1 +
>   ext/fiddle/fiddle.gemspec         | 1 +
> @@ -16,12 +17,12 @@ Upstream-Status: Backport [debian]
>   5 files changed, 5 insertions(+)
>
>  diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecim=
al.gemspec
> -index f9f3b45..b9a469d 100644
> +index d215757..5148d56 100644
>  --- a/ext/bigdecimal/bigdecimal.gemspec
>  +++ b/ext/bigdecimal/bigdecimal.gemspec
> -@@ -14,6 +14,7 @@ Gem::Specification.new do |s|
> -   s.name          =3D name
> -   s.version       =3D source_version
> +@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
> +   s.name          =3D "bigdecimal"
> +   s.version       =3D "3.1.3"
>     s.authors       =3D ["Kenta Murata", "Zachary Scott", "Shigeo Kobayas=
hi"]
>  +  s.date          =3D RUBY_RELEASE_DATE
>     s.email         =3D ["mrkn@mrkn.jp"]
> @@ -40,10 +41,10 @@ index 8781093..efdca32 100644
>     spec.email         =3D ["aaron@tenderlovemaking.com", "hsbt@ruby-lang=
.org"]
>
>  diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-conso=
le.gemspec
> -index d4f5276..8f89611 100644
> +index d26a757..cc88c55 100644
>  --- a/ext/io/console/io-console.gemspec
>  +++ b/ext/io/console/io-console.gemspec
> -@@ -4,6 +4,7 @@ _VERSION =3D "0.7.1"
> +@@ -4,6 +4,7 @@ _VERSION =3D "0.6.0"
>   Gem::Specification.new do |s|
>     s.name =3D "io-console"
>     s.version =3D _VERSION
> @@ -64,7 +65,7 @@ index 1f4798e..48743cf 100644
>     spec.email         =3D ["knu@idaemons.org", "ume@mahoroba.org"]
>
>  diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
> -index 93a281c..cc5c155 100644
> +index 3c96f7d..fec0872 100644
>  --- a/lib/rdoc/rdoc.gemspec
>  +++ b/lib/rdoc/rdoc.gemspec
>  @@ -7,6 +7,7 @@ end
> @@ -75,6 +76,3 @@ index 93a281c..cc5c155 100644
>     s.version =3D RDoc::VERSION
>
>     s.authors =3D [
> ---
> -2.40.0
> -
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/met=
a/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
> new file mode 100644
> index 0000000000..0b1eb23801
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
> @@ -0,0 +1,55 @@
> +From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada <nobu@ruby-lang.org>
> +Date: Thu, 27 Jul 2023 15:53:01 +0800
> +Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
> +
> +https://hackerone.com/reports/1958260
> +
> +CVE: CVE-2023-36617
> +
> +Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536=
adda10a0555ae1ed6fe2f5808e6bf1]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + lib/uri/rfc2396_parser.rb |  4 ++--
> + test/uri/test_parser.rb   | 12 ++++++++++++
> + 2 files changed, 14 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
> +index 76a8f99..00c66cf 100644
> +--- a/lib/uri/rfc2396_parser.rb
> ++++ b/lib/uri/rfc2396_parser.rb
> +@@ -497,8 +497,8 @@ module URI
> +       ret =3D {}
> +
> +       # for URI::split
> +-      ret[:ABS_URI] =3D Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*=
\z', Regexp::EXTENDED)
> +-      ret[:REL_URI] =3D Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*=
\z', Regexp::EXTENDED)
> ++      ret[:ABS_URI] =3D Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s=
*\z', Regexp::EXTENDED)
> ++      ret[:REL_URI] =3D Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s=
*\z', Regexp::EXTENDED)
> +
> +       # for URI::extract
> +       ret[:URI_REF]     =3D Regexp.new(pattern[:URI_REF])
> +diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
> +index 72fb590..721e05e 100644
> +--- a/test/uri/test_parser.rb
> ++++ b/test/uri/test_parser.rb
> +@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
> +     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, nil]=
, URI.split("//example.com"))
> +     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], URI=
.split("//[0::0]"))
> +   end
> ++
> ++  def test_rfc2822_parse_relative_uri
> ++    pre =3D ->(length) {
> ++      " " * length + "\0"
> ++    }
> ++    parser =3D URI::RFC2396_Parser.new
> ++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri=
|
> ++      assert_raise(URI::InvalidURIError) do
> ++        parser.split(uri)
> ++      end
> ++    end
> ++  end
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/met=
a/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
> new file mode 100644
> index 0000000000..0ee295210e
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
> @@ -0,0 +1,51 @@
> +From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada <nobu@ruby-lang.org>
> +Date: Thu, 27 Jul 2023 16:16:30 +0800
> +Subject: [PATCH] Fix quadratic backtracking on invalid port number
> +
> +https://hackerone.com/reports/1958260
> +
> +CVE: CVE-2023-36617
> +
> +Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6=
ad23c9c6e4932f297fb737888144c8]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + lib/uri/rfc3986_parser.rb |  2 +-
> + test/uri/test_parser.rb   | 10 ++++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
> +index dd24a40..9b1663d 100644
> +--- a/lib/uri/rfc3986_parser.rb
> ++++ b/lib/uri/rfc3986_parser.rb
> +@@ -100,7 +100,7 @@ module URI
> +         QUERY: /\A(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*\z/,
> +         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*\z/,
> +         OPAQUE: /\A(?:[^\/].*)?\z/,
> +-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
> ++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
> +       }
> +     end
> +
> +diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
> +index 721e05e..cee0acb 100644
> +--- a/test/uri/test_parser.rb
> ++++ b/test/uri/test_parser.rb
> +@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
> +       end
> +     end
> +   end
> ++
> ++  def test_rfc3986_port_check
> ++    pre =3D ->(length) {"\t" * length + "a"}
> ++    uri =3D URI.parse("http://my.example.com")
> ++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |por=
t|
> ++      assert_raise(URI::InvalidComponentError) do
> ++        uri.port =3D port
> ++      end
> ++    end
> ++  end
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2024-27281.patch
> new file mode 100644
> index 0000000000..ab8e3f7c4c
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
> @@ -0,0 +1,96 @@
> +From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada <nobu@...>
> +Date: Mon, 15 Apr 2024 11:40:00 +0000
> +Subject: [PATCH] Filter marshaled objets
> +
> +CVE: CVE-2024-27281
> +Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c755=
3ef7250ca665a3fecdc01dbaacbb43d]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
> + 1 file changed, 26 insertions(+), 19 deletions(-)
> +
> +diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
> +index 9fc540d..5b663d7 100644
> +--- a/lib/rdoc/store.rb
> ++++ b/lib/rdoc/store.rb
> +@@ -556,9 +556,7 @@ class RDoc::Store
> +   def load_cache
> +     #orig_enc =3D @encoding
> +
> +-    File.open cache_path, 'rb' do |io|
> +-      @cache =3D Marshal.load io
> +-    end
> ++    @cache =3D marshal_load(cache_path)
> +
> +     load_enc =3D @cache[:encoding]
> +
> +@@ -615,9 +613,7 @@ class RDoc::Store
> +   def load_class_data klass_name
> +     file =3D class_file klass_name
> +
> +-    File.open file, 'rb' do |io|
> +-      Marshal.load io
> +-    end
> ++    marshal_load(file)
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, klass_name)
> +     error.set_backtrace e.backtrace
> +@@ -630,14 +626,10 @@ class RDoc::Store
> +   def load_method klass_name, method_name
> +     file =3D method_file klass_name, method_name
> +
> +-    File.open file, 'rb' do |io|
> +-      obj =3D Marshal.load io
> +-      obj.store =3D self
> +-      obj.parent =3D
> +-        find_class_or_module(klass_name) || load_class(klass_name) unle=
ss
> +-          obj.parent
> +-      obj
> +-    end
> ++    obj =3D marshal_load(file)
> ++    obj.store =3D self
> ++    obj.parent ||=3D find_class_or_module(klass_name) || load_class(kla=
ss_name)
> ++    obj
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, klass_name + method_name=
)
> +     error.set_backtrace e.backtrace
> +@@ -650,11 +642,9 @@ class RDoc::Store
> +   def load_page page_name
> +     file =3D page_file page_name
> +
> +-    File.open file, 'rb' do |io|
> +-      obj =3D Marshal.load io
> +-      obj.store =3D self
> +-      obj
> +-    end
> ++    obj =3D marshal_load(file)
> ++    obj.store =3D self
> ++    obj
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, page_name)
> +     error.set_backtrace e.backtrace
> +@@ -976,4 +966,21 @@ class RDoc::Store
> +     @unique_modules
> +   end
> +
> ++  private
> ++  def marshal_load(file)
> ++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
> ++  end
> ++
> ++  MarshalFilter =3D proc do |obj|
> ++    case obj
> ++    when true, false, nil, Array, Class, Encoding, Hash, Integer, Strin=
g, Symbol, RDoc::Text
> ++    else
> ++      unless obj.class.name.start_with("RDoc::")
> ++        raise TypeError, "not permitted class: #{obj.class.name}"
> ++      end
> ++    end
> ++    obj
> ++  end
> ++  private_constant :MarshalFilter
> ++
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2024-27282.patch
> new file mode 100644
> index 0000000000..0740ad81e9
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
> @@ -0,0 +1,27 @@
> +From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 12 Apr 2024 15:01:47 +1000
> +Subject: [PATCH] Fix Use-After-Free issue for Regexp
> +
> +Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
> +
> +Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a23558=
08a63fc45367785c82ffd46d18c900a]
> +CVE: CVE-2024-27282
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + regexec.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/regexec.c b/regexec.c
> +index 73694ab14a0b0a..140691ad42489f 100644
> +--- a/regexec.c
> ++++ b/regexec.c
> +@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UCh=
ar* end,
> +     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
> +       GET_MEMNUM_INC(mem, p);
> +       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end.=
 */
> +-      STACK_PUSH_MEM_END(mem, s);
> +       mem_start_stk[mem] =3D GET_STACK_INDEX(stkp);
> ++      STACK_PUSH_MEM_END(mem, s);
> +       MOP_OUT;
> +       JUMP;
> diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.pa=
tch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
> new file mode 100644
> index 0000000000..1808a6384a
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
> @@ -0,0 +1,35 @@
> +From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 26 Jan 2020 11:27:40 -0800
> +Subject: [PATCH] Filter out __has_include* compiler defines
> +
> +They are internal to compiler and this header is later on includes in C
> +files, but newer gcc >=3D 10 complains about it.
> +
> +error in initial header file:
> +| In file included from /tmp/20200124-86625-14hiju4.c:1:
> +| /tmp/20200124-86625-11y6l6i.h:13849:9: error: "__has_include" cannot b=
e used as a macro name
> +| 13849 | #define __has_include __has_include
> +|       |         ^~~~~~~~~~~~~
> +| compilation terminated due to -Wfatal-errors.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + common.mk | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/common.mk b/common.mk
> +index 664f750..3b8fbe6 100644
> +--- a/common.mk
> ++++ b/common.mk
> +@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=3D)$(MJIT_HEADER_SU=
FFIX).time: probes.h vm.$(OBJE
> + $(ECHO) building $(@F:.time=3D.h)
> + $(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
> + $(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLA=
GS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=3D.h).new
> ++ $(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=3D.h=
).new
> ++ $(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:=
.time=3D.h).new
> + $(Q) $(IFCHANGE) "--timestamp=3D$@" $(@F:.time=3D.h) $(@F:.time=3D.h).n=
ew
> +
> + $(MJIT_HEADER:.h=3D)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEA=
DER:.h=3D)$(MJIT_HEADER_SUFFIX).time
> diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devt=
ools/ruby/ruby_3.2.2.bb
> similarity index 88%
> rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
> rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
> index fb0d711765..508154dad5 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2=
.0-only | ISC | MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c87559868796979806100db3f3=
805 \
>                      file://BSDL;md5=3D8b50bc6de8f586dc66790ba11d064d75 \
>                      file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://LEGAL;md5=3D81e6a4d81533b9263da4c3485a0ad883 =
\
> +                    file://LEGAL;md5=3Dbcd74b47bbaf2051c5e49811a5faa97a =
\
>                      "
>
>  DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
> @@ -20,12 +20,21 @@ DEPENDS:append:class-nativesdk =3D " ruby-native"
>  SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.=
tar.gz \
>             file://0001-extmk-fix-cross-compilation-of-external-gems.patc=
h \
> +           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
> +           file://remove_has_include_macros.patch \
>             file://run-ptest \
> +           file://0001-template-Makefile.in-do-not-write-host-cross-cc-i=
tem.patch \
> +           file://0002-template-Makefile.in-filter-out-f-prefix-map.patc=
h \
>             file://0003-rdoc-build-reproducible-documentation.patch \
>             file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generate=
d-M.patch \
>             file://0005-Mark-Gemspec-reproducible-change-fixing-784225-to=
o.patch \
>             file://0006-Make-gemspecs-reproducible.patch \
>             file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv=
.patch \
> +           file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-p=
oss.patch \
> +           file://CVE-2023-36617_1.patch \
> +           file://CVE-2023-36617_2.patch \
> +           file://CVE-2024-27281.patch \
> +           file://CVE-2024-27282.patch \
>             "
>  UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/downloads/"
>
> @@ -46,7 +55,7 @@ do_configure:prepend() {
>
>  DEPENDS:append:libc-musl =3D " libucontext"
>
> -SRC_URI[sha256sum] =3D "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9f=
f8cf99ecbce75196"
> +SRC_URI[sha256sum] =3D "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa=
0e8d94e7b8a423bc"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208324): https://lists.openembedded.org/g/openembedde=
d-core/message/208324
> Mute This Topic: https://lists.openembedded.org/mt/109897713/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

