Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2166FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:03:28 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a186so4898963qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Og3l8TKzSTuzbStvI0Df6JM54CaQdtVSRsPHYzfWV44=;
	b=p+vdbV7GbuVhLJqEwMNwgiD5RtBAom+FCV8JNWAiqf/gFI/pbZKQ3uicqWZ9dBMqEF
	tB7R6iL3ECAFZzfjtmtyXhwr/I1oydw4CYHNo3L1+EeJB07fFNwxWH8YeWZ/5R1d3KPx
	OlTVe0/tmtXMlgZ7TpzwT/4+RmBLwoqVG+8szeIB/f0+DsPoPfFvsR0yRGpPYckItGIO
	plTgJFEP0jPGl/QlYBSwA3vVo7+gtxbmXtv1p6fRtQItJ1C0eWXMwi81r6Y59sb3orqO
	EqWLe3EpGTqB60MrF0BJ+ajH2UPkqxfg3slNgQY1+/1Rm1/RMbzAngl+BrIO+SaCNhZn
	zEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Og3l8TKzSTuzbStvI0Df6JM54CaQdtVSRsPHYzfWV44=;
	b=BALOkH0653VCGU5EtXuVxyHkC0LTeywGJAB6vh9bg176BkVrbE8tLf3n3eb8M0kPDe
	uyn+YiLbE6b8gmNL1o26/WYp2f7l047xWGeATH03ENeIAcDaiFAhU0A0aZOPqZWeLQ0c
	3LylJzsTcoyjCW9X6FCzUjigCUWEkaQyQObSMX0UlwMiQTivgLIy5jH2pJ37bwkM6D3N
	vs49vvgn90BlhcugWYavoRR4A9fqWPhv8QqmH8aZvvM+fdYkzaOgHM9SabuLh9T8JlNE
	JzstU852qf5wNaaqAG8Bdqh5w+47jjsKaVU25whmpQc4Ic1q+/j/istM+QrXDgJY4U4Q
	I5JQ==
X-Gm-Message-State: ALyK8tJtDNmec5nJYhAetXw4O303ZJ9/aqX10FrjaFEGqkc7b9pmiPK7EKzp1HBsuFLFFgNY2Jz1Z05YZ4Rzsw==
X-Received: by 10.233.239.18 with SMTP id d18mr880795qkg.41.1466024609522;
	Wed, 15 Jun 2016 14:03:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 14:03:00 -0700 (PDT)
In-Reply-To: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
References: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 14:03:00 -0700
Message-ID: <CAMKF1sp=GBNXY5Kieu9XEKrgpBFUT+14PqP-P0DnosR4i4qePQ@mail.gmail.com>
To: Stephen Arnold <sarnold@vctlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Wed, 15 Jun 2016 21:03:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 12, 2016 at 6:09 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
> The main thing is build failures with gold linker, but qemu is also a
> little too aggressive at finding random tools on the build host, so we
> also set the build env for qemu-native and make sure it doesn't reset
> its own (hard-coded) cflags when we don't want it to.
>
> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
>  meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.6.0.bb                |  4 +++-
>  3 files changed, 27 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index bf689bb..d5925fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,8 +30,12 @@ SRC_URI_append_class-native = "\
>
>  EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>
> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
> -                               "
> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
> +
> +EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
> +
> +LDFLAGS_append_class-native = " -fuse-ld=bfd"

what errors do you see with gold ?

> +
>  export LIBTOOL="${HOST_SYS}-libtool"
>
>  do_configure_prepend_class-native() {
> @@ -40,6 +44,11 @@ do_configure_prepend_class-native() {
>         if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>                 export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>         fi
> +
> +       # Alter target makefiles to accept CFLAGS set via env
> +       sed -i -r \
> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
> +               "${S}"/Makefile "${S}"/Makefile.target
>  }
>
>  KVMENABLE = "--enable-kvm"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> new file mode 100644
> index 0000000..173394f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> @@ -0,0 +1,13 @@
> +--- a/configure
> ++++ b/configure
> +@@ -4468,10 +4468,6 @@ fi
> + if test "$gcov" = "yes" ; then
> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> +-elif test "$fortify_source" = "yes" ; then
> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> +-elif test "$debug" = "no"; then
> +-  CFLAGS="-O2 $CFLAGS"
> + fi
> +
> + ##########################################
> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> index e391326..735d013 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> @@ -8,7 +8,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
> -           "
> +            file://qemu-2.5.0-cflags.patch \
> +"
> +
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
>  SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

