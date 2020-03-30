Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.327.1585588755335170058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 10:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4YMT2Hh;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id l18so6584764uak.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3h7PqZe5YZhY5msuhK0T73oe9TvtTqmeccIyAGUxGFE=;
        b=j4YMT2HhyA01exG9RtDnbn5Df7V8F83ni7xgFRlNQ4XkfDFEe2Dl6JAwhPgvwUDUeL
         +iJW9GuHpKJQgIlmMnaFtB5nsEl9ccbmmn7kV5VGHf4QbfGdqh24jMmytOC/5+ClTpF/
         eE3Vr/ew7xEZfLXo3SkhdnzRxUib5w8Dht7otS1CYv6+g3DuWXvBpkDDobLX/hPmMKVD
         z/AKYevfiWNtZ9M3YqD4mO0KS5dIH5eRmW2/wkkCDta4WA0w8BWkJC+Cgpee2umGhAbx
         bqQYuLJ4Vyw0018ehphsSuysiqXHAC2h5CvP/YT7Bzh3vX5ZmifYyB/K38nHboaCiMoE
         82+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3h7PqZe5YZhY5msuhK0T73oe9TvtTqmeccIyAGUxGFE=;
        b=CNCS54jF4aXkxl+g+1D+UWp8r1KSJ6SSOA9VjsMZr3QV9RQM2pECqzFTuZTQrfLROA
         BaKnBFwlL+hcJl4ycpAo9rHNzB8x4Xqn+BB2C2aC6eWhv1XOFoRR4SWbwB9TqTP4S52l
         TRTcrMZpxncrHv21d3CdvjTJ9aMOikIk4g9B+eRKm7ZiP7LxQKLM1uILY5P+HGVVwmN5
         UEAZnBLZI1tfjkzvnTPMNShxwpLXxqjq3LhPOv5DE+DKP3jcxC1d6ducBNyJfSZWw6qH
         Hq2Re3Y9/DpNBrHs6JDdSMK0V21vksyx6O28+2y3FUXQSwiDlHSx0Dd8dC95LZhREkDu
         FicQ==
X-Gm-Message-State: AGi0PuY4zOztdlt0g3uAFX4TthVDD5sMLajRqAmyV1l6j+DVNFG7KxRn
	ZuDB1wGbZa3dX4WvXiZscqNVoa8P15xiB2/+ZVE=
X-Google-Smtp-Source: APiQypKcSGozJdPxriW5cnlwJLEisk69IXK5pRbANqB2I4pxQLvftTwq2BifiZfZvqg2R9LUjuHR6YncjRcIctFZXTU=
X-Received: by 2002:a9f:226e:: with SMTP id 101mr8794282uad.81.1585588754315;
 Mon, 30 Mar 2020 10:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200330165105.7151-1-sno@netbsd.org>
In-Reply-To: <20200330165105.7151-1-sno@netbsd.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 30 Mar 2020 10:19:03 -0700
Message-ID: <CAJ86T=UzXroEiVQhD8TZOH6ia0bnGY+drtSZawtocvWOH7JsWQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] initscripts/init-system-helpers: fix mountnfs.sh dependency
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jens Rehsack <sno@netbsd.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 30, 2020 at 9:51 AM Jens Rehsack <rehsack@gmail.com> wrote:
>
> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>     Author: Yue Tao <Yue.Tao@windriver.com>
>     Date:   Fri May 25 10:48:08 2018 +0800
>
>         initscripts: Avoid starting rpcbind daemon twice
>
>         Check the status before start it to avoid duplicates.
>
> the use of a script {/usr/sbin/}service is introduced - maybe earlier
> provided by systemd, nowadays mostly by init-system-helpers from
> debian project.
>
> For the very first shot, maybe discussions and improvements based
> on that script collection, use just the init-system-helpers-service
> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
> boot stage.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../initscripts/init-system-helpers_1.57.bb   | 52 +++++++++++++++++++
>  .../initscripts/initscripts_1.0.bb            |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb
>
> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> new file mode 100644
> index 0000000000..2b09983483
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> @@ -0,0 +1,52 @@
> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> +# Released under the MIT license (see COPYING.MIT for the terms)

Is this really necessary?

> +SUMMARY = "helper tools for all init systems"
> +DESCRIPTION = "This package contains helper tools that are necessary for switching between \
> +the various init systems that Debian contains (e. g. sysvinit or \
> +systemd). An example is deb-systemd-helper, a script that enables systemd unit \
> +files without depending on a running systemd. \
> +\
> +It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
> +provide an abstraction for enabling, disabling, starting, and stopping \
> +services for all supported Debian init systems as specified by the policy. \
> +\
> +While this package is maintained by pkg-systemd-maintainers, it is NOT \
> +specific to systemd at all. Maintainers of other init systems are welcome to \
> +include their helpers in this package."
> +HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
> +SECTION = "base"
> +LICENSE = "BSD-3-clause & GPLv2"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
> +
> +PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"

According to the OE style guide, PACKAGES should go near the end of
the recipe (after do_install, before FILES_${PN}).

> +DEPENDS = "perl"

Since this recipe doesn't do anything in do_configure or do_compile
it's odd that it needs a build time dependency on perl?

> +SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
> +SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure() {
> +       :
> +}
> +
> +do_compile() {
> +       :
> +}
> +
> +do_install() {
> +       install -d -m 0755 ${D}${sbindir}
> +       install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
> +       install -m 0755 ${S}/script/service ${D}${sbindir}
> +       install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
> +}
> +
> +FILES_${PN} = ""

If you want the default package to be empty then you probably need to add:

  ALLOW_EMPTY_${PN} = "1"

> +FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
> +FILES_${PN}-service = "${sbindir}/service"
> +FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
> +
> +RDEPENDS_${PN}-update-rc.d = "perl"
> +RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 1a59b82fbf..4080c4a495 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
>  PACKAGES =+ "${PN}-functions ${PN}-sushell"
>  RDEPENDS_${PN} = "initd-functions \
>                    ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
> +                  init-system-helpers-service \
>                  "
>  # Recommend pn-functions so that it will be a preferred default provider for initd-functions
>  RRECOMMENDS_${PN} = "${PN}-functions"
> --
> 2.17.1
>
> 
