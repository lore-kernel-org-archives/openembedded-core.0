Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD88D76DFB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 19:02:24 +0000 (UTC)
Received: by obbfr1 with SMTP id fr1so179720014obb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t/G8rj5D/nsxHQtA3qQZyD7c9t5epIWbBt6lSCQGUMo=;
	b=BgIUEvyL4duc+zQMVOv5fCErJJ/dbGCvWp1I7DEcpMKibCnO29OhOwdg5m+fnT+pn9
	Gi3JWcVf5HOgD9QGb6lzuPXRi/FoSXRZC1d3LGphk0/Y88SHjVYj6DLw54+LJN9riPF7
	fWL3rRBKuicU5cS0+8VE9CjC9RU3k/qpTaio97iH5nKVjM0VS4a8RtrKAgBhLAhrbev/
	sQ9qCem0/1/Z1CeBt2c41TU+H6xT+Xel7IAbf6sDMOoidyWUCidjjXiJyTBXq86dmzX1
	EEYJK8cMTMgM8QRhW1RRhIiyrXQjq2svfeVpRfaX7NvcTcpq4rU+WIHqpRqSjOMDtfmx
	c+ig==
MIME-Version: 1.0
X-Received: by 10.182.28.165 with SMTP id c5mr2443921obh.29.1440615744578;
	Wed, 26 Aug 2015 12:02:24 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Wed, 26 Aug 2015 12:02:24 -0700 (PDT)
In-Reply-To: <f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
Date: Wed, 26 Aug 2015 12:02:24 -0700
Message-ID: <CAJ86T=WnRNNrh9kr7QfHtP-tqmxdtZ1qm-0mnsAA1ANW04qysA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Wed, 26 Aug 2015 19:02:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 9:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> The unconditional removal of -DWITHOUT_XATTR accidentally introduced a
> compile-time dependency on "acl", because "sys/acl.h" gets
> included. This caused random compile failures.
>
> To fix this, we introduce a proper PACKAGECONFIG for the "xattr"
> support, with the distro's "xattr" feature determining the
> default. Setting the define must be done with custom code because
> PACKAGECONFIG can only influence configure parameters.
>
> The "acl" distro feature is not checked because although enabling
> "xattr" support now triggers a build of acl, nothing from it will not
> get included in the resulting target image.

Typo?

> This seems more suitable
> than not enabling xattr support in mtd-utils when acl support in the
> distro is disabled.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8d4892a..17dca77 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -19,7 +19,13 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
>
>  S = "${WORKDIR}/git/"
>
> -EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
> +# xattr support creates an additional compile-time dependency on acl because
> +# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> +# regardless whether acl is enabled or disabled in the distro should be okay.
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
> +PACKAGECONFIG[xattr] = ",,acl,"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
>
>  do_install () {
>         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

