Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB51611CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:10:46 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r18so13674782edl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4q7SisS7R+HCfnM5KuJH3tt0dJdOrNNQJNWlLjzw1ug=;
	b=FnAEAP4hbnQnq7l5Aluy8bNdF4gClVFrpzlXCPLgc7WB4sOH1nz+0HvRPF3eugyWzJ
	9M7Wg4ua44iAXeetuj+h5sM5HiGbKDBQcPmn6tfTp+eF8l52zTxl+pv5+D9By1Z3ru49
	8GDgwwB5m5eTV26V4lj/u2G4KT4aXhiHKewQBoeJR2QSI4YVDDxyZ2QqrtRcXv1LDq3j
	jiWxpzthdYeCnUpqpDwsE+GuJofd3LkEABUAfYmf4lQl0nmASr+pTufbgG3qURMhXrNG
	8z0ktRZ4+NrlPTOdiMS9a5Rh9ZzrNmpXyfa6CHy5xnRBmUNrczKUUADc4xT0CPkiHewt
	cLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4q7SisS7R+HCfnM5KuJH3tt0dJdOrNNQJNWlLjzw1ug=;
	b=tQu6Z3KklLdTNSP5ezUOUgg5vjn8zl5bvZD447KM2nkW8AD5Xz4ca2KnVD1+sZRQEx
	+CmO2Z5+45ZQCN/xyUdH28E5Gu0ZRRve7Me1jY7p5Eu0rK6gnUQlKlmQEruPWM47OgQg
	vMc4ldsoWQL9llufXE5YRiizwR4fFKs9uyuQMA5mvyq11+hqZpcEk6IRkeG22E13bnS6
	RDw+XV3f/5E0IPkRGoe7JSH1uFPryhu/eqUeDM4flG2ggqfvDzZ27Oypwd0Ny1/7fFKc
	RMy3Ne0WodjXTom1MGbBnkobUP4IHc6KyYmjIAc+7dKeGvaPwrkZRj2u4bUyw0IaHiHA
	BBew==
X-Gm-Message-State: APjAAAXb2n3dinHddbbV0a2/d82UVGXdeDqmDZ4STeUazAktCLFOZRcG
	TbPnyUeuvK9J/hXfACOriIWBl9CZ2w97UBVRCec=
X-Google-Smtp-Source: APXvYqwPLOg4K7FTS93/GC3MTIBDEhnYtIuP3Eh3oXgLSuhNwr+45ZUhpbm4l+mtzQOcBPfsFB9pdym8CET/VavBH0k=
X-Received: by 2002:a17:906:9716:: with SMTP id
	k22mr5671143ejx.233.1581739846674; 
	Fri, 14 Feb 2020 20:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20200214223334.2473195-1-raj.khem@gmail.com>
In-Reply-To: <20200214223334.2473195-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Feb 2020 23:10:35 -0500
Message-ID: <CADkTA4N6vXw-LANzqZiXtngeO-X9dPqb0kGvhBxnJe4FFHgxkw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Fix timespec length assumptions
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
X-List-Received-Date: Sat, 15 Feb 2020 04:10:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 5:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This should fix the vdso crashes seen with kernel 5.0+

cool. I'll test this locally and follow up over the weekend.

Bruce

>
> python3[11312] general protection fault ip:b7e966b0 sp:bf8175cc error:0 in libc.so[b7e8b000+6b000]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...001-clock-Do-not-define-own-timespec.patch | 45 +++++++++++++++++++
>  meta/recipes-support/db/db_5.3.28.bb          |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
>
> diff --git a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
> new file mode 100644
> index 0000000000..9d51a44a26
> --- /dev/null
> +++ b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
> @@ -0,0 +1,45 @@
> +From 96b303caf70a7635953c36e5bfb9ad6e75cb7637 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 14 Feb 2020 14:12:59 -0800
> +Subject: [PATCH] clock: Do not define own timespec
> +
> +timespec is provided by libc and its best left to libc
> +os_gettime takes a db_timespec and passed its address to clock_gettime
> +which assumes that db_timespec and timespec are same but actually
> +its 12-bytes here and libc has 16-bytes
> +
> +This can cause problems especially with 64bit time_t
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/dbinc/clock.h | 17 +----------------
> + 1 file changed, 1 insertion(+), 16 deletions(-)
> +
> +--- a/src/dbinc/clock.h
> ++++ b/src/dbinc/clock.h
> +@@ -44,22 +44,8 @@
> + extern "C" {
> + #endif
> +
> +-/*
> +- * This declaration is POSIX-compatible.  Because there are lots of different
> +- * time.h include file patterns out there, it's easier to declare our own name
> +- * in all cases than to try and discover if a system has a struct timespec.
> +- * For the same reason, and because we'd have to #include <sys/time.h> in db.h,
> +- * we don't export any timespec structures in the DB API, even in places where
> +- * it would make sense, like the replication statistics information.
> +- */
> +-typedef struct {
> +-      time_t  tv_sec;                         /* seconds */
> +-#ifdef HAVE_MIXED_SIZE_ADDRESSING
> +-      int32_t tv_nsec;
> +-#else
> +-      long    tv_nsec;                        /* nanoseconds */
> +-#endif
> +-} db_timespec;
> ++#include <time.h>
> ++#define db_timespec struct timespec
> +
> + /* Operations on timespecs */
> + #undef        timespecclear
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index a2969055a6..badb79f9ea 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -26,6 +26,7 @@ SRC_URI += "file://fix-parallel-build.patch \
>              file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
>              file://sequence-type.patch \
>              file://0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch \
> +            file://0001-clock-Do-not-define-own-timespec.patch \
>             "
>  # We are not interested in official latest 6.x versions;
>  # let's track what debian is using.
> --
> 2.25.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

