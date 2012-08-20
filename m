Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3XkY-0002Iv-1Q
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 21:34:58 +0200
Received: by eaad12 with SMTP id d12so1642161eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Nca8EnHxldDdXuwgRy8xp4cF37ch9vJBxv2O0VEwMb4=;
	b=IkS0FyLurRZ//4Fo7lPyZZXl16kyOst7NHaX9O0t2Orlz39imxvZsXJN+JsJa7y0c3
	VyMIvl1Q1Clgt207RY65EZABhEw+bEKZ6tOpqOwGD0KjBWviC+7xWXX3xIJRJeyFN1MR
	7TQwg+P2LNglHwLG+D5lEctAenZYlCsK/A63tSDWmxOdH5iNjOCRAi+e3ZhiuYnIxfuW
	VaVY5aFaOP1+cbUur44QT9J6bF04/7A8WYL3RQNhdaR2jdJS1ePIVLVEvJZp/2xTlOqN
	PiRaA7E+1eitnRL776uQ5pjRS0Mrm/qdGfZ9E16e/wKfFmf3d3gkasa1MXVE6eDLZNml
	NY9g==
Received: by 10.14.204.72 with SMTP id g48mr10079053eeo.45.1345490575219; Mon,
	20 Aug 2012 12:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 20 Aug 2012 12:22:25 -0700 (PDT)
In-Reply-To: <1345468841-12320-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1345468841-12320-1-git-send-email-paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2012 12:22:25 -0700
Message-ID: <CAMKF1srVc4C7RfxR_tjZ61ZZ2MCWP49Xsp23bZc2Bm72D0t3UA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libiconv: skip recipe if using eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 19:34:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 20, 2012 at 6:20 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> libiconv is provided for use with uClibc - if you build it together with
> eglibc (which already PROVIDES virtual/libiconv) you can end up with
> dependency problems during do_rootfs.
>

hmmm ideally we should not need this. since iconv from eglibc should
be drop in replacement packagwise.
but extra net of security does not hurt.

Acked-by: Khem Raj <raj.khem@gmail.com>

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-support/libiconv/libiconv_1.11.1.bb |    5 +++++
>  meta/recipes-support/libiconv/libiconv_1.14.bb   |    5 +++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> index 186a5a1..055e20d 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> @@ -20,6 +20,11 @@ S = "${WORKDIR}/libiconv-${PV}"
>
>  inherit autotools pkgconfig gettext
>
> +python __anonymous() {
> +    if d.getVar("TCLIBC", True) == "eglibc":
> +        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
> +}
> +
>  EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
>
>  LEAD_SONAME = "libiconv.so"
> diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
> index af33d6b..6666866 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.14.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
> @@ -21,6 +21,11 @@ S = "${WORKDIR}/libiconv-${PV}"
>
>  inherit autotools pkgconfig gettext
>
> +python __anonymous() {
> +    if d.getVar("TCLIBC", True) == "eglibc":
> +        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
> +}
> +
>  EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
>
>  LEAD_SONAME = "libiconv.so"
> --
> 1.7.9.5
>


