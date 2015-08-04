Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6453E73D29
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 08:23:42 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so165617356wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 01:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EMyXYiFSDd1HOXVCOSDdxYPVQEjQT0ZKGd0F26chlLM=;
	b=ATTfoPxG95gqu9hm1f0tfmIFKa04aA+R+ZaE1NadOcP8mMvGda/7CLyjwebM/VG/b5
	svc1cqMSkBJHU7czI+K1WovykgOGtldqRMdsfxdjj5EJH9A8ewufuoLe82y7vnwjTJc0
	HGNm7EqzOau8Mp5tW1yVIvu/geDWEF1puCM1p8ds3ToJE7ftwIyJsD1SjTfhdgl+TTzU
	xZmD1mUcThVzQwy2staAMVphJJy2XYKVW5pCIu0AVruMWICoRCMksnTbJMq3RFVyS/wm
	yrdwRPwmd8MtFJTuRwfi04NxV4GyKKbA2+jf/F8G5pHVuwsk9dQtIJLhkcliqGqMZ45o
	41YQ==
X-Gm-Message-State: ALoCoQmx4W8gjOxWAMjo8VTnNrSuPPowvEQ3iOI2uZIeS4z6ZORFF28l4i0z2zD9qEmYfVl/4J5J
X-Received: by 10.194.20.196 with SMTP id p4mr5515104wje.86.1438676622796;
	Tue, 04 Aug 2015 01:23:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.87.1 with HTTP; Tue, 4 Aug 2015 01:23:13 -0700 (PDT)
In-Reply-To: <1438673104-4264-1-git-send-email-jackie.huang@windriver.com>
References: <1438673104-4264-1-git-send-email-jackie.huang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 4 Aug 2015 11:23:13 +0300
Message-ID: <CAHiDW_GKk+hbmX8EDfUQ=Wr40SLuxEFE6HkX8-gu8KbesZkDrQ@mail.gmail.com>
To: jackie.huang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: add configure arg and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Tue, 04 Aug 2015 08:23:43 -0000
Content-Type: text/plain; charset=UTF-8

On 4 August 2015 at 10:25,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> libinput use pkg-config to check and decide whether to build
> with libunwind, which causes undeterministic builds or error:
>
> | tmp/work/core2-64-wrs-linux/libinput/0.18.0-r0/libinput-0.18.0/test/litest.c:77:23:
> | fatal error: libunwind.h: No such file or directory
>
> So add configure arg and PACKAGECONFIG for libunwind to make
> deterministic build, but libunwind is disable by default.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...input-configure.ac-add-arg-with-libunwind.patch | 44 ++++++++++++++++++++++
>  meta/recipes-graphics/wayland/libinput_0.18.0.bb   |  7 +++-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
>
> diff --git a/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch b/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
> new file mode 100644
> index 0000000..4090c50
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput/libinput-configure.ac-add-arg-with-libunwind.patch
> @@ -0,0 +1,44 @@
> +From 713a3892edc94f63e5968b1bb99ea2e08fecfa5d Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 3 Aug 2015 20:33:44 -0700
> +Subject: [PATCH] configure.ac: add arg --with-libunwind
> +
> +add arg --with-libunwind for configure so it's optional
> +to check libunwind, and we can use it in bitbake's
> +PACKAGECONFIG to make deterministic builds.
> +
> +Upstream-Status: Inappropriate [OE specific]

Are you sure? I would like to see this sent upstream: I expect they
will take it as we are not the only people who care about
deterministic builds.

That said, with "--with-libunwind" configure should fail if unwind is
not found. Your patch does not seem to do this -- see comment below

Cheers,
  Jussi


> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + configure.ac | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 314b0d4..7a31aa9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -60,10 +60,19 @@ PKG_PROG_PKG_CONFIG()
> + PKG_CHECK_MODULES(MTDEV, [mtdev >= 1.1.0])
> + PKG_CHECK_MODULES(LIBUDEV, [libudev])
> + PKG_CHECK_MODULES(LIBEVDEV, [libevdev >= 0.4])
> +-PKG_CHECK_MODULES(LIBUNWIND,
> ++
> ++AC_ARG_WITH(libunwind,
> ++            AS_HELP_STRING([--with-libunwind],[Build with libunwind]))
> ++
> ++if test "x$with_libunwind" = "xyes"; then
> ++      PKG_CHECK_MODULES(LIBUNWIND,
> +                 [libunwind],
> +                 [HAVE_LIBUNWIND=yes],
> +                 [HAVE_LIBUNWIND=no])
> ++else
> ++      HAVE_LIBUNWIND=no
> ++fi
> ++
> + if test "x$HAVE_LIBUNWIND" = "xyes"; then
> +       AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])
> + fi


Configure will succeed if --with-libunwind is set but unwind is not
present: this should not happen.  Something like this should work
correctly in both cases (please check that though: I wrote without
testing):


AC_ARG_WITH([libunwind],
    AS_HELP_STRING([--without-libunwind], [Do not use libunwind]))

AS_IF([test "x$with_libunwind" != "xno"],
      [PKG_CHECK_MODULES(LIBUNWIND,
                         [libunwind],
                         [have_libunwind=yes],
                         [have_libunwind=no])],
      [have_libunwind=no])

AS_IF([test "x$have_libunwind" = "xyes"],
      [AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])],
      [AS_IF([test "x$with_libunwind" = "xyes"],
             [AC_MSG_ERROR([libunwind requested but not found])])])

> +--
> +2.3.5
> +
> diff --git a/meta/recipes-graphics/wayland/libinput_0.18.0.bb b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
> index 0fe1c6c..8e8e6a7 100644
> --- a/meta/recipes-graphics/wayland/libinput_0.18.0.bb
> +++ b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
> @@ -7,11 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
>
>  DEPENDS = "libevdev udev mtdev"
>
> -SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> +SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
> +           file://libinput-configure.ac-add-arg-with-libunwind.patch \
> +"
>  SRC_URI[md5sum] = "0ddbb0d53d58dec0a86de6791560011a"
>  SRC_URI[sha256sum] = "64a70f96bab17a22eaf2fd7af17cf83def3388374096c7623be9448f62808cda"
>
>  inherit autotools pkgconfig
>
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
> +
>  FILES_${PN} += "${libdir}/udev/"
>  FILES_${PN}-dbg += "${libdir}/udev/.debug"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

