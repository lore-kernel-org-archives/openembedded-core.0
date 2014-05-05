Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id A873F60D0B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 01:00:47 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h3so807915igd.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ODHEzOgolb/FXltz1D5WpkhHXnL2K4uJz2VSomOtQfw=;
	b=JrB+Wi4VR0etUXBU+sj+/WogaqiFTJfC6D7VychRTORkirt7TeuG+APSDMT81chjzN
	pCzd57zL5JSIT8ATRBz7I37HrGLSEIwyhAm/L3R8VZspNqHYymeObYcWEjZoWEZ4WzGc
	5sX/kVbMvCMQwlwIlx5m13hozQRI+6XdlaRYo6i5sg5Gbjrshxv+6XLRBhwEEtEP+3R7
	48qUFA0s7wwiZjx31kez3ViHtEv2Pfmr/jo9Dptl4bmLDBTvP0vj86phDRELBkFW3a/t
	GR9px8GLj6oaEubo/KuopeY4/0BlzuDq7Wniu+plBALI/i0W82GkdhRDHkjCAL4TLFnE
	v/Rw==
X-Received: by 10.50.30.167 with SMTP id t7mr19845062igh.17.1399251648216;
	Sun, 04 May 2014 18:00:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 18:00:18 -0700 (PDT)
In-Reply-To: <1399195833-4364-1-git-send-email-ming.liu@windriver.com>
References: <1399195833-4364-1-git-send-email-ming.liu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 18:00:18 -0700
Message-ID: <CAMKF1spF46XQKgQOkQ3TG7H-x=Zh+f9Kqo8jugy0L96T6qL8vQ@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ldconfig-native: default to both lib and lib64 directories
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
X-List-Received-Date: Mon, 05 May 2014 01:00:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 2:30 AM, Ming Liu <ming.liu@windriver.com> wrote:
> make ldconfig default to both /lib+/usr/lib and /lib64+/usr/lib64
> on bi-ABI architectures.

There is also lib32 and usr/lib32 version when you have mips. So this
is half solution if you want to solve mutlilib

>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  .../ldconfig-default-to-both-lib-and-lib64.patch   | 32 ++++++++++++++++++++++
>  meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
>
> diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
> new file mode 100644
> index 0000000..230502e
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
> @@ -0,0 +1,32 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +make ldconfig default to both /lib+/usr/lib and /lib64+/usr/lib64
> +on bi-ABI architectures.
> +
> +---
> + ldconfig.c |    5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff -urpN a/ldconfig.c b/ldconfig.c
> +--- a/ldconfig.c
> ++++ b/ldconfig.c
> +@@ -52,7 +52,9 @@
> +
> + #define SYSCONFDIR "/etc"
> + #define LIBDIR "/usr/lib"
> ++#define LIBDIR64 "/usr/lib64"
> + #define SLIBDIR "/lib"
> ++#define SLIBDIR64 "/lib64"
> + # define N_(msgid)  msgid
> + #define _(msg) msg
> +
> +@@ -1373,6 +1375,9 @@ main (int argc, char **argv)
> +       add_system_dir (SLIBDIR);
> +       if (strcmp (SLIBDIR, LIBDIR))
> +       add_system_dir (LIBDIR);
> ++      add_system_dir (SLIBDIR64);
> ++      if (strcmp (SLIBDIR64, LIBDIR64))
> ++      add_system_dir (LIBDIR64);
> +     }
> +
> +   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
> diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> index d7bc444..69748a4 100644
> --- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> @@ -10,7 +10,9 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://32and64bit.patch \
>             file://endian-ness_handling.patch \
>             file://flag_fix.patch \
> -           file://endianess-header.patch"
> +           file://endianess-header.patch \
> +           file://ldconfig-default-to-both-lib-and-lib64.patch \
> +"
>
>  PR = "r2"
>
> --
> 1.8.4.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

