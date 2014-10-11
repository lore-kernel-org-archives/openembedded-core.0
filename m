Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 60D6E65DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 09:31:44 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id x12so2649095qac.31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=X5ZOg5CBvfS6Mm4kTmUA9yrW5h7owhaAyLb4YRIDkEE=;
	b=0NvtEM+WepRD/r0PpB3HbyrPdb0fYt+w0Q2nrrXYehq99OGK85lQ/h2yxJFtLyT04Y
	gHW47oAl9Cte+OXPecbmWJgxRGl3LaQfue8UVHku94AbWsYSFCCvNfCZ1YiGDDH9GkWa
	7bPeC2fZ8oNdlobxKPo/DpNYt8dtKWgKKroa9WpJTYXY4zCZf+K89nvjHij5mFLW474R
	KaHlPtG496JGX33RDIGDg0wop9ktZ3Tj2yWCV6RD0o9rBoCy4W0aTz4tNYrpAL7FvJmB
	BUhMAIC4rAnnocj5nxah33auxE/GpgGZiFDsnt/uhpENzv+KUgNrKRrneDhM1iukmM4R
	Braw==
X-Received: by 10.229.65.135 with SMTP id j7mr17121918qci.22.1413019905666;
	Sat, 11 Oct 2014 02:31:45 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sat, 11 Oct 2014 02:31:05 -0700 (PDT)
In-Reply-To: <241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 11 Oct 2014 10:31:05 +0100
X-Google-Sender-Auth: UMM1dIs0QkjOpTbQ4RXa4pncGM0
Message-ID: <CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Sat, 11 Oct 2014 09:31:47 -0000
Content-Type: text/plain; charset=UTF-8

On 8 October 2014 13:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> opkg remove perl --force-removal-of-dependent-packages
> ...
> Removing package perl-module-extutils-mm-dos from root...
> ...
> Removing package perl-module-extutils-mm-dos from root...
> You can force removal of packages with failed prerm scripts with the option:
>         --force-remove
> No packages removed.
> Collected errors:
>  * pkg_run_script: Internal error: perl-module-extutils-mm-dos has a
> NULL tmp_unpack_dir.
>  * opkg_remove_pkg: not removing package "perl-module-extutils-mm-dos",
> prerm script failed
> ...
>
> While remove pkg with '--force-removal-of-dependent-packages',
> pkg may be added to remove list multiple times, add status
> check to make sure pkg only be removed once.
>
> [YOCTO #6819]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...g_remove.c-avoid-remove-pkg-repeatly-with.patch | 39 ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch b/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
> new file mode 100644
> index 0000000..08433a9
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
> @@ -0,0 +1,39 @@
> +From 41425d67d3589b1912416a17f740d6407c7834f2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 8 Oct 2014 19:53:13 +0800
> +Subject: [PATCH] libopkg/opkg_remove.c: avoid remove pkg repeatly with option
> + --force-removal-of-dependent-packages
> +
> +While remove pkg with '--force-removal-of-dependent-packages',
> +pkg may be added to pkgs remove list multiple times, add status
> +check to make sure pkg only be removed once.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + libopkg/opkg_remove.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
> +index 34f9154..a225e41 100644
> +--- a/libopkg/opkg_remove.c
> ++++ b/libopkg/opkg_remove.c
> +@@ -250,6 +250,14 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
> +      if ((parent_pkg = pkg->parent) == NULL)
> +         return 0;
> +
> ++     /* While remove pkg with '--force-removal-of-dependent-packages',
> ++        pkg may be added to remove list multiple times, add status
> ++        check to make sure pkg only be removed once. */
> ++     if (conf->force_removal_of_dependent_packages &&
> ++             pkg->state_flag & SF_FILELIST_CHANGED &&
> ++             pkg->state_status == SS_NOT_INSTALLED)
> ++         return 0;
> ++
> +      /* only attempt to remove dependent installed packages if
> +       * force_depends is not specified or the package is being
> +       * replaced.
> +--
> +1.9.1
> +

Your solution looks fine but I'd prefer it to be solved a different
way upstream.

It should be possible to ensure that duplicates don't enter the
removal queue in the first place by checking the return of
pkg_vec_contains(dependent_pkgs, dep_pkg) before calling
pkg_vec_insert(dependent_pkgs, dep_pkg) in opkg_remove_dependent_pkgs.
This would keep the logic in opkg_remove_pkg clean.

If you've got time to try this alternative solution could you let me
know if it works. If so, send the patch to opkg-devel@googlegroups.com
and I'll merge it upstream. If you're too busy I can have a look at
this myself next week.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

