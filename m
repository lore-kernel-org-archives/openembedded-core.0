Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6305765C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:53:49 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id e35so5511931qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W/TbQX17M5p+HZifrYjLmKMhri/8iIX9kEGDoF2KN7I=;
	b=vKrKfSir4Lry2zcxX+JCpCwHIJdw2uqLw7iQZtBRab5gFbHZ8vkr7OC+EkSt6/XKWf
	CgEYpSrrIzHEbMs3Rr9pH/r4HtvvjZQd/PtjCilxbd7pYRYNrza+ukwlp8++uFMs8pWx
	ZFA6g7UoQq3klieMiIMu5rL2I0un+l8VnoeGKieerhtk1ouWNqNJwVIcWlJR84w9e757
	TBfalEc++BeBHfgZ81Ph3X4/ySibPYj31CQeK5aNGWbEfa8ungTNnQeaZZgvp/D/BOgq
	urfSxxL5kxsXrscc6HBIyUMSJmzH3Bv17gafAk63LAl8Lp56ciD1cNancjkODtQFCXks
	T2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W/TbQX17M5p+HZifrYjLmKMhri/8iIX9kEGDoF2KN7I=;
	b=CXLe5qEXq/WeWhe3/Yml0dhQbXN8Ym9P+F0Ql3F0NlilM+XmCFUH6zS9sa3zvs9Afc
	nhjpZx7SB3ga/UrDTVar/NfnaJOb8I9ds8IKf4rG/XmcwUhajH/8yh2nzk+53GOo0bre
	be9hiGv0ALnfxEcMqVmRf+BtXzn+EIWufMedCIMrtuRMEiKHatulBgEfrouM47AMDytL
	+WINmKRPf7b/7ZoA9ZRPFVqzJ4F6WMd3UqEtoEztLdl1TdJPpOMqEtf+zwigUuQHRBEC
	Vf1g/CKYwscJRmSr0WKY3ihpAXkJ9f14/ZQtzOlYgo2ydjWJ+LJksdQXbv2FFtrFVHbq
	Qrfg==
X-Gm-Message-State: AOPr4FXjUgYvsvM2TGP4Tkb6ajVHS9ef5OMDQ7fKPbvwK+egLlaaP6YtfHkoCLBGWMsMFsIpg22N0Pecx2dj+Q==
X-Received: by 10.140.19.174 with SMTP id 43mr9980584qgh.44.1463063910008;
	Thu, 12 May 2016 07:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 12 May 2016 07:38:00 -0700 (PDT)
In-Reply-To: <1463058769-8498-1-git-send-email-adrian.ratiu@ni.com>
References: <1463058769-8498-1-git-send-email-adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 07:38:00 -0700
Message-ID: <CAMKF1sp-cXec1TAWfdVus_Hg46QxF5SMx+7yk5T-MhsUxsEz8Q@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.9: fix build with gcc 6
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
X-List-Received-Date: Thu, 12 May 2016 14:53:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 6:12 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Building gcc-cross 4.9.3 with gcc 6 fails with the following error:
>
> error: 'const char* libc_name_p(const char*, unsigned int)' redeclared inline with 'gnu_inline' attribute
>
> This is a backport of the upstream fix.

I have seen couple of such patches being proposed. I was of the
opinion to drop 4.9 from master however if we still want to
refresh it the I would propose that we change the SRC_URI to point to
latest on gcc-4_9-branch and remove any backports
we have done since 4.9.3 release. It can also be merged into krogoth.
Then we can latest decide if we want to keep 4.9 in
2.2 release or not. Would you be able to test such a patch

>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
>  .../gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch    | 151 +++++++++++++++++++++
>  2 files changed, 152 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 208e092..0cd9826 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -91,6 +91,7 @@ SRC_URI = "\
>      file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
>      file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch \
>      file://0075-libgcc-use-ldflags.patch \
> +    file://0076-Fix-build-with-gcc-6.patch \
>  "
>  SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
>  SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch b/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch
> new file mode 100644
> index 0000000..f865d4f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch
> @@ -0,0 +1,151 @@
> +From efdf2b53b907c96ad3f00275588eb311335d0c91 Mon Sep 17 00:00:00 2001
> +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +Date: Thu, 12 May 2016 15:24:25 +0300
> +Subject: [PATCH] Fix build with gcc 6
> +
> +        * Make-lang.in: Invoke gperf with -L C++.
> +        * cfns.gperf: Remove prototypes for hash and libc_name_p
> +        inlines.
> +        * cfns.h: Regenerated.
> +        * except.c (nothrow_libfn_p): Adjust.
> +
> +svn rev: r233572
> +
> +Upstream-status: Backport [gcc 4.9]
> +
> +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +---
> + gcc/cp/Make-lang.in |  2 +-
> + gcc/cp/cfns.gperf   | 10 ++--------
> + gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
> + gcc/cp/except.c     |  3 ++-
> + 4 files changed, 19 insertions(+), 37 deletions(-)
> +
> +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> +index bd1c1d7..a0ea0d4 100644
> +--- a/gcc/cp/Make-lang.in
> ++++ b/gcc/cp/Make-lang.in
> +@@ -111,7 +111,7 @@ else
> + # deleting the $(srcdir)/cp/cfns.h file.
> + $(srcdir)/cp/cfns.h:
> + endif
> +-      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
> ++      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
> +               $(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
> +
> + #
> +diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
> +index 05ca753..d9b16b8 100644
> +--- a/gcc/cp/cfns.gperf
> ++++ b/gcc/cp/cfns.gperf
> +@@ -1,3 +1,5 @@
> ++%language=C++
> ++%define class-name libc_name
> + %{
> + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> +
> +@@ -16,14 +18,6 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + %}
> + %%
> + # The standard C library functions, for feeding to gperf; the result is used
> +diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
> +index c845ddf..65801d1 100644
> +--- a/gcc/cp/cfns.h
> ++++ b/gcc/cp/cfns.h
> +@@ -1,5 +1,5 @@
> +-/* ANSI-C code produced by gperf version 3.0.3 */
> +-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
> ++/* C++ code produced by gperf version 3.0.4 */
> ++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
> +
> + #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
> +       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
> +@@ -28,7 +28,7 @@
> + #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
> + #endif
> +
> +-#line 1 "cfns.gperf"
> ++#line 3 "cfns.gperf"
> +
> + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> +
> +@@ -47,25 +47,18 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + /* maximum key range = 391, duplicates = 0 */
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#else
> +-#ifdef __cplusplus
> +-inline
> +-#endif
> +-#endif
> +-static unsigned int
> +-hash (register const char *str, register unsigned int len)
> ++class libc_name
> ++{
> ++private:
> ++  static inline unsigned int hash (const char *str, unsigned int len);
> ++public:
> ++  static const char *libc_name_p (const char *str, unsigned int len);
> ++};
> ++
> ++inline unsigned int
> ++libc_name::hash (register const char *str, register unsigned int len)
> + {
> +   static const unsigned short asso_values[] =
> +     {
> +@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
> +   return hval + asso_values[(unsigned char)str[len - 1]];
> + }
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#ifdef __GNUC_STDC_INLINE__
> +-__attribute__ ((__gnu_inline__))
> +-#endif
> +-#endif
> + const char *
> +-libc_name_p (register const char *str, register unsigned int len)
> ++libc_name::libc_name_p (register const char *str, register unsigned int len)
> + {
> +   enum
> +     {
> +diff --git a/gcc/cp/except.c b/gcc/cp/except.c
> +index 221971a..32340f5 100644
> +--- a/gcc/cp/except.c
> ++++ b/gcc/cp/except.c
> +@@ -1030,7 +1030,8 @@ nothrow_libfn_p (const_tree fn)
> +      unless the system headers are playing rename tricks, and if
> +      they are, we don't want to be confused by them.  */
> +   id = DECL_NAME (fn);
> +-  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
> ++  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
> ++                                 IDENTIFIER_LENGTH (id));
> + }
> +
> + /* Returns nonzero if an exception of type FROM will be caught by a
> +--
> +2.8.2
> +
> --
> 2.8.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

