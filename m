Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id B6C0A6E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 12:09:17 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so5048331oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 04:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YUE/VqA4NBmi5cn5PuIMiCJZzGEtzqj7YWyp2E7Fmj0=;
	b=Dnn+ZkaheKa9mZaFzCwXV2VOXwNeK1zXf+mLRkjaBDwZ4JrDB2echalEZk8DGytUOf
	MUP1PiUHWB/pxZ+A+95PO06AHXe7MUvyky+3VnQ2qJ2fEJ3sTjb1YDngb3Fbohv+eUWW
	OKmY1K2b4xU4Wkrx5Xm/3UsNZPRLza6vKP418dzFzzGpabNd1p4p05pMA9xQoOwH8zgo
	LBshHHpkna3ursBb1K+BMT0+tJfuQ/vi7504pW0Lhux793JteJzpVJrVNUJMT7AH7LEf
	0ZlSDF/t9frNnYVZb7uUl0n0qrvEt6GkZjxWOcLZg9WXNWvWxLIS5ID6gfdEqeJzJ+4U
	yezw==
X-Gm-Message-State: ALoCoQnfpueuMdoa9ami16aiK+8rY3Wjts5zQSoPVSlQkLbtCw8Brcwigd5qbQ4i/i9y370mHceW
X-Received: by 10.182.18.102 with SMTP id v6mr343335obd.71.1391170158134; Fri,
	31 Jan 2014 04:09:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Fri, 31 Jan 2014 04:08:58 -0800 (PST)
In-Reply-To: <cb4533215083bb4031c9bece55d526c54494e3d6.1384571787.git.Qi.Chen@windriver.com>
References: <cover.1384571787.git.Qi.Chen@windriver.com>
	<cb4533215083bb4031c9bece55d526c54494e3d6.1384571787.git.Qi.Chen@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jan 2014 13:08:58 +0100
Message-ID: <CAP71WjyX_oYdQzv7uQdycQuq1tLxuNAsYAUPUm+S44z2Hg8jLw@mail.gmail.com>
To: Qi.Chen@windriver.com, liezhi.yang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] subversion: fix build problem when sysroot contains '-D' or '-I'
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
X-List-Received-Date: Fri, 31 Jan 2014 12:09:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Robert,

can we get the patch below merged into dora? I just tried it, it
applies cleanly as-is. the thing is i stumbled upon this issue on dora
this week, and debugged it for a while to later figure out it was
fixed in master ;-)

fwiw, you can add

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

thanks

nicolas

On Sat, Nov 16, 2013 at 4:19 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> If sysroot contains '-D' or '-I' characters, the SVN_NEON_INCLUDES and
> the corresponding CFLAGS will not get the correct value.
>
> This will cause build failures.
>
> This patch fixes the above problem.
>
> [YOCTO #5458]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../neon.m4-fix-includes-and-cflags.patch          |   32 ++++++++++++++++++++
>  .../subversion/subversion_1.7.10.bb                |    1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
>
> diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
> new file mode 100644
> index 0000000..013d0c3
> --- /dev/null
> +++ b/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
> @@ -0,0 +1,32 @@
> +Fix to get correct SVN_NEON_CONFIG and CFLAGS when sysroot path contains '-D' and '-I'
> +characters.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +
> +index f951039..a813145 100644
> +--- a/build/ac-macros/neon.m4
> ++++ b/build/ac-macros/neon.m4
> +@@ -105,8 +105,8 @@ AC_DEFUN(SVN_NEON_CONFIG,
> +            test "$svn_allowed_neon" = "any"; then
> +             svn_allowed_neon_on_system="yes"
> +             if test "$NEON_PKG_CONFIG" = "yes"; then
> +-              SVN_NEON_INCLUDES=[`$PKG_CONFIG neon --cflags | $SED -e 's/-D[^ ]*//g'`]
> +-              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/-I[^ ]*//g'`"]
> ++              SVN_NEON_INCLUDES=["`$PKG_CONFIG neon --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`"]
> ++              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
> +               old_CFLAGS="$CFLAGS"
> +               old_LIBS="$LIBS"
> +               NEON_LIBS=`$PKG_CONFIG neon --libs`
> +@@ -126,8 +126,8 @@ int main()
> +               CFLAGS="$old_CFLAGS"
> +               LIBS="$old_LIBS"
> +             else
> +-              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/-D[^ ]*//g'`]
> +-              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/-I[^ ]*//g'`"]
> ++              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`]
> ++              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
> +               NEON_LIBS=`$neon_config --libs`
> +             fi
> +             svn_lib_neon="yes"
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> index 4acd70b..489bddf 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> @@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://libtool2.patch \
>             file://fix-install-depends.patch \
>             file://allow-updated-neon.patch \
> +           file://neon.m4-fix-includes-and-cflags.patch \
>  "
>  SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
>  SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

