Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sy8eR-0006y1-5Q
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 23:46:19 +0200
Received: by lagv3 with SMTP id v3so771006lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=OtnJ7JpfPhkNaSymDMIb5Y70w2hQf2dzqGkuy6+051s=;
	b=t/b6u3OiKus735A+/mlZhnOYnsaIVqOcimpVpOk6ipq5OaYlUKLgfSvTX3ck5RZJhH
	lnGNDAtKWhBVIh85mJWoqDHSu50VZkBoOP73Ui4Xl9U3ih+e0k+U80rtDyedAGbClbgN
	5B0/QKrbwgpdA1CVAkHqMkHvZ8qlDEMkny26JlZ07XMrNlTpJbMBCa1ULlRZE0qR1gvz
	qqlHufBUrs7SHyq1zuCfZAj91KooO1TswMDQErXAT/oMEMKDcoXNeu2VsxmkR2HXEa13
	P6hiBdK5CKlVnlJ4bbpMwjhLBX3CQJpMBwXiDNhTPPDBPru+nIHgs4mOWfNvBkgWlrYV
	7YFg==
Received: by 10.112.85.225 with SMTP id k1mr3684919lbz.38.1344202475193; Sun,
	05 Aug 2012 14:34:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Sun, 5 Aug 2012 14:34:14 -0700 (PDT)
In-Reply-To: <1344196136-7643-14-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-14-git-send-email-javier@dowhile0.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 5 Aug 2012 14:34:14 -0700
X-Google-Sender-Auth: OK0KDCdNApIUq9PaBagshZfCJ0w
Message-ID: <CABcZANkq+Mjbogf8=P-G=gmh=Mrqj4M+f49E7Vk2H_tiK+ioFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 13/28] external-sourcery: use ${prefix} and ${libdir} instead of /usr and /usr/lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 21:46:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 12:48 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> It is considered good practice to use the build system provided
> variables instead of directly specify hardcoded paths.
>
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> ---
>  .../meta/external-sourcery-toolchain.bb            |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
> index 74c82ec..1def79e 100644
> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
> +++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
> @@ -24,7 +24,7 @@ PROVIDES += "\
>         virtual/linux-libc-headers \
>  "
>  PV = "${CSL_VER_MAIN}"
> -PR = "r7"
> +PR = "r8"
>
>  #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>
> @@ -38,10 +38,10 @@ do_install() {
>         cp -a $sysroot/etc/. ${D}${sysconfdir}
>         cp -a $sysroot/sbin/. ${D}${base_sbindir}
>
> -       install -d ${D}/usr
> +       install -d ${D}${prefix}
>         for usr_element in bin libexec sbin share ${base_libdir}; do
>                 usr_path=$sysroot/usr/$usr_element
> -               cp -a $usr_path ${D}/usr/
> +               cp -a $usr_path ${D}${prefix}/
>         done
>         for datadir_element in man info; do
>                 datadir_path=$sysroot/usr/$datadir_element
> @@ -81,7 +81,7 @@ external_toolchain_sysroot_adjust() {
>
>         # If the usr/lib directory doesn't exist, the toolchain fails to even
>         # try to find crti.o in a completely different directory (usr/lib64)
> -       install -d ${SYSROOT_DESTDIR}/usr/lib
> +       install -d ${SYSROOT_DESTDIR}${libdir}


This is wrong. This line creates usr/lib *explicitly* to cover the
case where libdir is set to something else (e.g. usr/lib64). As the
comment says, the toolchain will fail to search the real libdir if the
usr/lib dir does not exist.
-- 
Christopher Larson


