Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 250B2766F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 19:11:28 +0000 (UTC)
Received: by igkz10 with SMTP id z10so23103264igk.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=K258dM9ZeUPpGr1gdsqkxfK0AyaU4OzwpY6VapJlsqw=;
	b=Cvfbc0X9++Y8Zig0Xt1lGM9WAZvNaechx+smPjFdHWO5G/w4c3mpBxQGqc71Busixe
	axw2mPJpiXZwnUJ5xcCIx+MHU8NBec98AvIcbBo0YWuQPz55B0us3bf0VFeDMtDmqp/H
	6U+kc7IDrINipD5uzvIJO40o2OLfJ9YicQhh2ZA3HD1RuyK7LQ4uS30wfrwtBccMiJzI
	sMbEcIaKo0fIRt3S37vB27BN83YoWdRbsSeH5q4tzXRBJsFTuVEMsVBqom3PCBVTpSfK
	OEPEl6w1g3KWMBZCLsPqXtwnawuJqII35fZJuIKhR8rwLpfGCBQptqqFTs3GovLd1dZP
	fyyg==
X-Received: by 10.50.138.9 with SMTP id qm9mr5412413igb.77.1444504288683; Sat,
	10 Oct 2015 12:11:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sat, 10 Oct 2015 12:10:59 -0700 (PDT)
In-Reply-To: <1444462027-27197-1-git-send-email-kai.kang@windriver.com>
References: <1444462027-27197-1-git-send-email-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Oct 2015 12:10:59 -0700
Message-ID: <CAMKF1sq+bnhPoA=-OiStbVv5VoXbODQkXA2vBS9=S4=J22pMzA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.x: fix wrong warning when using the universal zero initializer {0}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Oct 2015 19:11:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 10, 2015 at 12:27 AM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When I upgrade efivar to 0.21, it fails to compile with error messages:
>
> | linux.c:850:9: error: missing braces around initializer
> [-Werror=missing-braces]
> |   struct ifreq ifr = { 0, };
> |          ^
>
> It is a known issue of gcc. Backport patch from
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
>
> to fix wrong warning when using the universal zero initializer {0}.
>

This is ok to install.

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
>  ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++++++++++++
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
>  ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++++++++++++
>  4 files changed, 216 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 6a2454d..b3e1c33 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -69,6 +69,7 @@ SRC_URI = "\
>      file://0047-repomembug.patch \
>      file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
>      file://target-gcc-includedir.patch \
> +    file://0051-gcc-483-universal-initializer-no-warning.patch \
>  "
>  SRC_URI[md5sum] = "5a84a30839b2aca22a2d723de2a626ec"
>  SRC_URI[sha256sum] = "4a80aa23798b8e9b5793494b8c976b39b8d9aa2e53cd5ed5534aff662a7f8695"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch b/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
> new file mode 100644
> index 0000000..fde227b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Backport
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
> +wrong warning when using the universal zero initializer {0}
> +
> +Backported to GCC 4.8.3
> +
> +Subject: 2014-06-05  S. Gilles  <sgilles@terpmail.umd.edu>
> +X-Git-Url: http://repo.or.cz/w/official-gcc.git/commitdiff_plain/95cdf3fdf2d440eb7775def8e35ab970651c33d9?hp=14a3093e9943937cbc63dfbf4d51ca60f8325b29
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@211289 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +--- gcc-4.8.3.org/gcc/c/c-typeck.c     2014-08-03 20:52:09.257042137 +0200
> ++++ gcc-4.8.3/gcc/c/c-typeck.c 2014-08-03 20:57:10.645042614 +0200
> +@@ -62,9 +62,9 @@
> +    if expr.original_code == SIZEOF_EXPR.  */
> + tree c_last_sizeof_arg;
> +
> +-/* Nonzero if we've already printed a "missing braces around initializer"
> +-   message within this initializer.  */
> +-static int missing_braces_mentioned;
> ++/* Nonzero if we might need to print a "missing braces around
> ++   initializer" message within this initializer.  */
> ++static int found_missing_braces;
> +
> + static int require_constant_value;
> + static int require_constant_elements;
> +@@ -6379,6 +6379,9 @@
> + /* 1 if this constructor is erroneous so far.  */
> + static int constructor_erroneous;
> +
> ++/* 1 if this constructor is the universal zero initializer { 0 }.  */
> ++static int constructor_zeroinit;
> ++
> + /* Structure for managing pending initializer elements, organized as an
> +    AVL tree.  */
> +
> +@@ -6540,7 +6543,7 @@
> +   constructor_stack = 0;
> +   constructor_range_stack = 0;
> +
> +-  missing_braces_mentioned = 0;
> ++  found_missing_braces = 0;
> +
> +   spelling_base = 0;
> +   spelling_size = 0;
> +@@ -6635,6 +6638,7 @@
> +   constructor_type = type;
> +   constructor_incremental = 1;
> +   constructor_designated = 0;
> ++  constructor_zeroinit = 1;
> +   designator_depth = 0;
> +   designator_erroneous = 0;
> +
> +@@ -6832,11 +6836,8 @@
> +       set_nonincremental_init (braced_init_obstack);
> +     }
> +
> +-  if (implicit == 1 && warn_missing_braces && !missing_braces_mentioned)
> +-    {
> +-      missing_braces_mentioned = 1;
> +-      warning_init (OPT_Wmissing_braces, "missing braces around initializer");
> +-    }
> ++  if (implicit == 1)
> ++    found_missing_braces = 1;
> +
> +   if (TREE_CODE (constructor_type) == RECORD_TYPE
> +          || TREE_CODE (constructor_type) == UNION_TYPE)
> +@@ -6969,16 +6970,23 @@
> +       }
> +     }
> +
> ++  if (vec_safe_length (constructor_elements) != 1)
> ++    constructor_zeroinit = 0;
> ++
> ++  /* Warn when some structs are initialized with direct aggregation.  */
> ++  if (!implicit && found_missing_braces && warn_missing_braces
> ++      && !constructor_zeroinit)
> ++    {
> ++      warning_init (OPT_Wmissing_braces,
> ++                  "missing braces around initializer");
> ++    }
> ++
> +   /* Warn when some struct elements are implicitly initialized to zero.  */
> +   if (warn_missing_field_initializers
> +       && constructor_type
> +       && TREE_CODE (constructor_type) == RECORD_TYPE
> +       && constructor_unfilled_fields)
> +     {
> +-      bool constructor_zeroinit =
> +-       (vec_safe_length (constructor_elements) == 1
> +-        && integer_zerop ((*constructor_elements)[0].value));
> +-
> +       /* Do not warn for flexible array members or zero-length arrays.  */
> +       while (constructor_unfilled_fields
> +              && (!DECL_SIZE (constructor_unfilled_fields)
> +@@ -8093,6 +8101,9 @@
> +   designator_depth = 0;
> +   designator_erroneous = 0;
> +
> ++  if (!implicit && value.value && !integer_zerop (value.value))
> ++    constructor_zeroinit = 0;
> ++
> +   /* Handle superfluous braces around string cst as in
> +      char x[] = {"foo"}; */
> +   if (string_flag
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 691ba5f..95b553c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -80,6 +80,7 @@ SRC_URI = "\
>      file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
>      file://0063-nativesdk-gcc-support.patch \
>      file://0064-handle-target-sysroot-multilib.patch \
> +    file://0065-gcc-483-universal-initializer-no-warning.patch \
>  "
>  SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
>  SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch b/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
> new file mode 100644
> index 0000000..fde227b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Backport
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
> +wrong warning when using the universal zero initializer {0}
> +
> +Backported to GCC 4.8.3
> +
> +Subject: 2014-06-05  S. Gilles  <sgilles@terpmail.umd.edu>
> +X-Git-Url: http://repo.or.cz/w/official-gcc.git/commitdiff_plain/95cdf3fdf2d440eb7775def8e35ab970651c33d9?hp=14a3093e9943937cbc63dfbf4d51ca60f8325b29
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@211289 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +--- gcc-4.8.3.org/gcc/c/c-typeck.c     2014-08-03 20:52:09.257042137 +0200
> ++++ gcc-4.8.3/gcc/c/c-typeck.c 2014-08-03 20:57:10.645042614 +0200
> +@@ -62,9 +62,9 @@
> +    if expr.original_code == SIZEOF_EXPR.  */
> + tree c_last_sizeof_arg;
> +
> +-/* Nonzero if we've already printed a "missing braces around initializer"
> +-   message within this initializer.  */
> +-static int missing_braces_mentioned;
> ++/* Nonzero if we might need to print a "missing braces around
> ++   initializer" message within this initializer.  */
> ++static int found_missing_braces;
> +
> + static int require_constant_value;
> + static int require_constant_elements;
> +@@ -6379,6 +6379,9 @@
> + /* 1 if this constructor is erroneous so far.  */
> + static int constructor_erroneous;
> +
> ++/* 1 if this constructor is the universal zero initializer { 0 }.  */
> ++static int constructor_zeroinit;
> ++
> + /* Structure for managing pending initializer elements, organized as an
> +    AVL tree.  */
> +
> +@@ -6540,7 +6543,7 @@
> +   constructor_stack = 0;
> +   constructor_range_stack = 0;
> +
> +-  missing_braces_mentioned = 0;
> ++  found_missing_braces = 0;
> +
> +   spelling_base = 0;
> +   spelling_size = 0;
> +@@ -6635,6 +6638,7 @@
> +   constructor_type = type;
> +   constructor_incremental = 1;
> +   constructor_designated = 0;
> ++  constructor_zeroinit = 1;
> +   designator_depth = 0;
> +   designator_erroneous = 0;
> +
> +@@ -6832,11 +6836,8 @@
> +       set_nonincremental_init (braced_init_obstack);
> +     }
> +
> +-  if (implicit == 1 && warn_missing_braces && !missing_braces_mentioned)
> +-    {
> +-      missing_braces_mentioned = 1;
> +-      warning_init (OPT_Wmissing_braces, "missing braces around initializer");
> +-    }
> ++  if (implicit == 1)
> ++    found_missing_braces = 1;
> +
> +   if (TREE_CODE (constructor_type) == RECORD_TYPE
> +          || TREE_CODE (constructor_type) == UNION_TYPE)
> +@@ -6969,16 +6970,23 @@
> +       }
> +     }
> +
> ++  if (vec_safe_length (constructor_elements) != 1)
> ++    constructor_zeroinit = 0;
> ++
> ++  /* Warn when some structs are initialized with direct aggregation.  */
> ++  if (!implicit && found_missing_braces && warn_missing_braces
> ++      && !constructor_zeroinit)
> ++    {
> ++      warning_init (OPT_Wmissing_braces,
> ++                  "missing braces around initializer");
> ++    }
> ++
> +   /* Warn when some struct elements are implicitly initialized to zero.  */
> +   if (warn_missing_field_initializers
> +       && constructor_type
> +       && TREE_CODE (constructor_type) == RECORD_TYPE
> +       && constructor_unfilled_fields)
> +     {
> +-      bool constructor_zeroinit =
> +-       (vec_safe_length (constructor_elements) == 1
> +-        && integer_zerop ((*constructor_elements)[0].value));
> +-
> +       /* Do not warn for flexible array members or zero-length arrays.  */
> +       while (constructor_unfilled_fields
> +              && (!DECL_SIZE (constructor_unfilled_fields)
> +@@ -8093,6 +8101,9 @@
> +   designator_depth = 0;
> +   designator_erroneous = 0;
> +
> ++  if (!implicit && value.value && !integer_zerop (value.value))
> ++    constructor_zeroinit = 0;
> ++
> +   /* Handle superfluous braces around string cst as in
> +      char x[] = {"foo"}; */
> +   if (string_flag
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

