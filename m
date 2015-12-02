Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3BF601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 19:05:02 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so228080525wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KCWA6NYl0F1PDGHaAQ3KRzfbbT5GOMsIkkycLMzAVTw=;
	b=APxf8tnWoEou7wKn6cP+Q0atF6zhp99Jm3jnFBOMNwfGpNUWSV2uueLF0GseOiQGEw
	RYPnAnSEfg8pB2Tm3AOZrprP5d7ukgtFGK1qhjfwFp0YLn3zmWnciCt/j2CN+K9gOqvI
	oSdhjCnDJVjnpxC3JfE1G96ubXlAgwVh1eFOZScxtOhHk5fMtA231hTMmlQaMJMxPvBk
	i7+sjOGvkYn3+QoQuMRQmLQw5NEPhIgTYCWDD5B37lIgtXuKabEdDVA2J1coES0+TIXt
	n6zs+uhGzHtX50Y66LQC74V1upaaLeTPh9g5jQmexuiidIBgh3IjVQffRZSfrS4Xqb9X
	6Dlg==
MIME-Version: 1.0
X-Received: by 10.28.180.132 with SMTP id d126mr7520528wmf.72.1449083101660;
	Wed, 02 Dec 2015 11:05:01 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Wed, 2 Dec 2015 11:05:01 -0800 (PST)
In-Reply-To: <1449062556-13116-1-git-send-email-fabrice.coulon@axis.com>
References: <1449062556-13116-1-git-send-email-fabrice.coulon@axis.com>
Date: Wed, 2 Dec 2015 11:05:01 -0800
Message-ID: <CAJ86T=VF1HsQdgbyVsvutJO0HJ+LNp6d+rKMEsReB0XmDs3=mw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Fabrice Coulon <fabrice.coulon@axis.com>
Cc: Fabrice Coulon <fabrice@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Make it possible to override the append in a bbappend
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
X-List-Received-Date: Wed, 02 Dec 2015 19:05:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 2, 2015 at 5:22 AM, Fabrice Coulon <fabrice.coulon@axis.com> wrote:
> I need this in order to avoid a conflict when used with
> base-passwd-native.

Doesn't something like this work from your .bbappend?

  do_install_append_class-native () {
      # Remove to avoid conflict with base-passwd-native
      rm -f ${D}${sysconfdir}/passwd ${D}${sysconfdir}/group
  }


> Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo_1.7.4.bb | 6 +++++-

You left out the pseudo_1.6.7.bb recipe. Better to keep the two recipes in sync.

>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
> index d68e0af..87e624e 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
> @@ -11,9 +11,13 @@ SRC_URI[sha256sum] = "f33ff84da328f943155f22cfd49030ef4ad85ad35fc2d9419a203521b6
>
>  PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
>
> -do_install_append_class-native () {
> +append_class_native() {

It might avoid confusion if the function name wasn't made up of a
bitbake keyword and (something very close to) the class-native
over-ride. Maybe "install_passwd_fallbacks", to described what the
function actually does?

>         install -d ${D}${sysconfdir}
>         # The fallback files should never be modified
>         install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
>         install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
>  }
> +
> +do_install_append_class-native () {
> +       append_class_native
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

