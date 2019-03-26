Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 373DD7D109
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:08:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x12so15710279qts.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rr6JeVQzrjQ1LX8/fYbxosa5XHG2gBgYh6RJVtDMHU4=;
	b=RjKf5PAnRxdl3cqYCQyP5MUycfzUOyOgx3VGEoI86fDQ8uKuUdBLXMTGfCWr1aQHQd
	ye6lJ3Mvqkj0Wef5mcFF1ccU0Y3AT6e6dJoEbRWfRAhOSvnuROzyKyC8+7PnOct9TKcJ
	O7oLGeAWqQfJrNOE4A0TOBCCK6PrGuuYaTqm61cSxWpG9sfJFSP6HSjqh9yw4E2oM8rN
	Z5Xwv7Mu4W9I/H1ygyL5PjUv/qKR4yNqw8kgbeNM+b+mEoCraui/ZR/IvKIm4ncbx3xk
	NRIs4nLw0tISuBLpmgiI/WMGeTFPcBmAsJxZ87+/B/wGAxEaOuD+LbhCNa7vXwLCYfZp
	y4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rr6JeVQzrjQ1LX8/fYbxosa5XHG2gBgYh6RJVtDMHU4=;
	b=iFjDjjsacuZaE2jN3vhjzRHFUQ/14XdhofaZCoo9gCZjAyzyq9uoT9Z9l/srqhFQLI
	4rQGRdYjZan+Oy0YBVJqDxXXxgEz38t6bPVhhcc8LhZsO8PZlavmKR8uOB6jTwNMfhh4
	XMoQBqCcABnVef04L2Gor1CyQKn9TRjjMOlSysp4o2Xrne1aVpwQ9BcRFY21o9G+4tzI
	vFPJm4IAvxC/bvtIL9FOZEzNp/1Si8ybFmpCR0bi7aU82MlWbgdqMVQp1o4KDDHOZoao
	IXlhoMG//LeZOW1DHeWDVNCv+A0nJcJt12ZtrgjpiRnLW/mDC4L8Fv00z+wqA8Hgd2mO
	Gbfg==
X-Gm-Message-State: APjAAAWozlyuXrj1Jt2fMG74Qjd+OGM4RMe4MinL+kqdp0/70z+5CelJ
	NBIQlR9oRW7JZfwswnaPSOdBUBJOKAqPmsQ92cQ=
X-Google-Smtp-Source: APXvYqyY2UMfkVYRKxRaIk/DlnBxC8w4GdFBBsToYhEefH7PExql0/hwkuUwpSRGWL6koMfQuZH1AMH3EFc8cc/J4jg=
X-Received: by 2002:ac8:1a34:: with SMTP id v49mr26773599qtj.236.1553623712755;
	Tue, 26 Mar 2019 11:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190326120157.4397-1-ross.burton@intel.com>
In-Reply-To: <20190326120157.4397-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2019 11:08:06 -0700
Message-ID: <CAMKF1sprxcvAtLQsu-dueRZtvPXvo+ozg9HZ+w+yU417sU3AfQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib: set glib-specific cross properties
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
X-List-Received-Date: Tue, 26 Mar 2019 18:08:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 5:02 AM Ross Burton <ross.burton@intel.com> wrote:
>
> GLib wants to execute code to identify several properties of the system, for
> example is vsprintf() broken and what direction does the stack grow. In
> cross-compiled environments these fallback to the default values which are not
> always correct (our vsprintf() is fine, but the test assumes it isn't) so set
> these properties explicitly.
>
> Ideally this happens magically by meson.bbclass using the same logic as
> siteinfo.bbclass, but we need to fix glib now.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross | 6 ++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb        | 1 +
>  meta/recipes-core/glib-2.0/glib.inc                  | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
> new file mode 100644
> index 00000000000..8420f9874e1
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
> @@ -0,0 +1,6 @@
> +[properties]
> +have_c99_vsnprintf = true
> +have_c99_snprintf = true
> +have_unix98_printf = true
> +va_val_copy = true
> +growing_stack = false

this is mostly true for arches we support but maybe a comment
to check it when doing explicit arch ports ( e.g. arm can grown both ways)


> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> index 2de2affa51a..c872c749202 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
> +           file://glib-meson.cross \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 6f0ec1ad2e9..574bb38557b 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -53,6 +53,7 @@ PACKAGECONFIG[libelf] = ",,elfutils"
>  PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
>
>  EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
> +EXTRA_OEMESON_append_class-target = " --cross-file ${WORKDIR}/glib-meson.cross"
>
>  do_configure_prepend() {
>         sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

