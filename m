Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.32107.1599196865068484794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 22:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S7V02/44;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id db4so2489068qvb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8P6j8V4j9e2rEcJHX1THUDOlhobfUZRYzF5pvOHZ68=;
        b=S7V02/44AjDFezhyCuXM1aOS3QDRXOUeaust/p+G8cW33JiWoT9W2KgcQIoW8kExVB
         mdTYjNdgZtVMPeqLzzjLH2hJNFRWReL/x1Dgm9YlmL9avGHfn0m3PwTDWgV0ibtAHLXg
         uAXVSi2OQ0GGU5juKvlniL4KdwanX+cKt1N5Ybre14IldxM/D7/81jbnGOowU8D+m3Eb
         sJ8WJ4FwRJmJOkB0AhDY6CBKqqXMBA7cMkDl8tOt+GmnB67zTmjgSbRRIsii+YmkUjqn
         zhu0G3blTlw1mFJdCXJIAcK9ldxGeZUAWJax/37PmDNEZ1DZ5Fm+b7ooM1iFfU/gMhXl
         4ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8P6j8V4j9e2rEcJHX1THUDOlhobfUZRYzF5pvOHZ68=;
        b=gWtQsrfi22JBVFE429AHDw7lnT09uzNh7AAeDPUV8rxSsg6MyQBbh7mKdR/7hp4tNd
         TFpeNL6f3NegsY1V5GjBOacjRa4O4o0ssHm1m44jGNFw9hVFbwjI6wGOTlrOpC/Owa4+
         qKKLfebxOthCFU/F/c8p3+4zhEr0gcP/rEDrOAdijzvdvKSszL/2cajp8+5wWTIQJ1h9
         fJJfL+UaP0sXWLdD1yjnj36Pghg6R4iIZljuO0Zz3EIU8vFRpzPOPSRmVH6hOWklTOAL
         6veZ6KUgSgSrKlbGhO0H4wZh3OlfWOq+vSeyGJD/jh+HdBsdXaf7V8CTWRH9lfkPOPkW
         brKA==
X-Gm-Message-State: AOAM531q8QwrK3QlevagqNnfA3shCXPAMM2WGdjT2S8arftjlD5JtuxT
	Owm2lj6GB3/BtVGNXTHSRvYN9qenCvVMBgTnBtl4gksi3qQ=
X-Google-Smtp-Source: ABdhPJzKPZbWEuJ2xQl07Rp55T0FK2ugNkRtIzl3PgTnzKOKKBJnPb4xjFujWp4fz4N+MchtC+wa6mt6MSBGXCQHAPA=
X-Received: by 2002:a05:6214:292:: with SMTP id l18mr5301097qvv.3.1599196863995;
 Thu, 03 Sep 2020 22:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200903130218.496275-1-ross.burton@arm.com>
In-Reply-To: <20200903130218.496275-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Sep 2020 22:20:37 -0700
Message-ID: <CAMKF1spTVo7WNHjirbjQk41XYigoF=n4ysyYVnavpYFi_KPpTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] help2man: rewrite recipe
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 6:02 AM Ross Burton <ross@burtonini.com> wrote:
>
> This recipe was originally explicitly minimal because it was needed to
> bootstrap autotools, but that isn't the case anymore.
>
> Instead of being explicitly native, use BBCLASSEXTEND.
>
> No need to explicitly depend on autoconf-native automake-native, because
> the autotools class does that.
>
> Don't explicitly disable NLS, but use the gettext class.
>
> As this recipe isn't needed in early build anymore there's no need to
> avoid reconfiguring.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc          |  2 +-
>  ...2man-native_1.47.15.bb => help2man_1.47.15.bb} | 15 ++++++---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
>  rename meta/recipes-devtools/help2man/{help2man-native_1.47.15.bb => help2man_1.47.15.bb} (66%)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 9f80970309..a094b39b2a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -255,7 +255,7 @@ RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
> -RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb b/meta/recipes-devtools/help2man/help2man_1.47.15.bb
> similarity index 66%
> rename from meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
> rename to meta/recipes-devtools/help2man/help2man_1.47.15.bb
> index 4f80a2bdb1..7a913507a3 100644
> --- a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
> +++ b/meta/recipes-devtools/help2man/help2man_1.47.15.bb
> @@ -2,22 +2,19 @@ SUMMARY = "Program for creating simple man pages"
>  SECTION = "devel"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> -DEPENDS = "autoconf-native automake-native"
>
>  SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f1ee762f001dbcd1c"
>
> -inherit autotools native
> +inherit autotools gettext
>
> -EXTRA_OECONF = "--disable-nls"

this means we need perl's gettext module and hence perl. so perhaps
leave it in there.

> -
> -# We don't want to reconfigure things as it would require 'perlnative' to be
> -# used.
> -do_configure() {
> -       oe_runconf
> -}
> +# This is a hand-maintained aclocal.m4 but our autotools class currently deletes
> +# aclocal.m4.
> +EXTRA_AUTORECONF += "--exclude=aclocal"
>
>  do_install_append () {
>         # Make sure we use /usr/bin/env perl
>         sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
>  }
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.28.0
>
> 
