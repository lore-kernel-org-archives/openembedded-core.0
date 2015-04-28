Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8592072491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 20:37:06 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so31234057igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hdt1dYdYsXcu/IGPeWFNldgnN/1sKD2feCjPL+tVlXk=;
	b=f/Rgze45P6tr5HH8J7K1tKO7aExE4dczmIuqAZ64w/kVuDveRJmWoHuBKFiRh+Had6
	F72igb69AgA8V9UdvqunK+UsmfseNIhqLqybiIW9yp1NFJX7kqfAQLJNh66wKxHADurt
	R8VgfrwXTxVG9Ts7ho5YeuGCFXDcNXj9n2jDTAHGLRLDDZEZnS3xXrKNgdgHgYOWhd9o
	cFrt6fErnPwV36y/GZ97rc6LIUPGzdU6yR4eovsMR2+ySh1W2bvOX2LrS6/TMBOVL6IT
	v9pAF093s028sC41n9C61YyJSy7zWwwsoe6RfCMULsiGd1MhsmOaUgWAxpeFBa/Tw4e9
	soKg==
X-Received: by 10.42.164.7 with SMTP id e7mr20240938icy.70.1430253427157; Tue,
	28 Apr 2015 13:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 13:36:36 -0700 (PDT)
In-Reply-To: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Apr 2015 13:36:36 -0700
Message-ID: <CAMKF1so8CxWjb7pM-JOs+10hi0E4ff0Vt2nPDZ50tLeXURZA9g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 20:37:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 1:12 PM, Ross Burton <ross.burton@intel.com> wrote:
> This patch appears to have been accidently dropped in the move to 219-stable,
> probably because it didn't apply.  Update the patch and re-add it.
>

Thanks for doing it. Acked

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../systemd/systemd/0010-Make-root-s-home-directory-configurable.patch | 3 ++-
>  meta/recipes-core/systemd/systemd_219.bb                               | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> index 41b9039..b65fe42 100644
> --- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> @@ -26,10 +26,11 @@ diff --git a/Makefile.am b/Makefile.am
>  index 0fb3f9f..4623963 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
> +@@ -199,7 +199,8 @@ AM_CPPFLAGS = \
>         -DKEXEC=\"$(KEXEC)\" \
>         -DLIBDIR=\"$(libdir)\" \
>         -DROOTLIBDIR=\"$(rootlibdir)\" \
> +       -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>  +      -DROOTHOMEDIR=\"$(roothomedir)\" \
>         -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
>         -I $(top_srcdir)/src \
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index d1303f7..c196017 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -38,6 +38,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stab
>             file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
>             file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
>             file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
> +           file://0010-Make-root-s-home-directory-configurable.patch \
>             file://0011-systemd-user-avoid-using-system-auth.patch \
>             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

