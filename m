Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id E8BA960034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 19:07:43 +0000 (UTC)
Received: by obcus9 with SMTP id us9so32712029obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 12:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YmIY3VT5xU6R/20AV+AdFeNmQGDOv4Yg/b1mZCx4f9A=;
	b=lorvOWsn9o6LH/NuCqbOpWonYrBoCemyyB9Hcfz7R9Ohg95t2wMCIVsfEmoFv0niWE
	k/FhuczCQssd/DzcWF6HacwQQx9Cllr70OolXoOnuO2qcIV77IIPtxmwFsKU6NdtPsfm
	pEK2voaWodo2txjiZl1cyGC/Fe+mwFd466yBGlPRAU+tA2MMpAMIF3QrBe5DUtBYA/Ki
	DFpTEvDCZ6JoBMmAdtd2sVBrVkK5KetP4HiTa+p57eKqhGY7DzgVBsSWlfsM6eMqJB2E
	YD/OsyeIxEL/jrP4FwvckfSmU5AfuWzz2K8SVxMHlWZKeT+ETMgfyitOQYVWMGxJ0SEC
	2qPA==
MIME-Version: 1.0
X-Received: by 10.202.74.71 with SMTP id x68mr4121924oia.93.1431112064460;
	Fri, 08 May 2015 12:07:44 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Fri, 8 May 2015 12:07:44 -0700 (PDT)
In-Reply-To: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Fri, 8 May 2015 12:07:44 -0700
Message-ID: <CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 19:07:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 8, 2015 at 8:04 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> It is more elegant

For gstreamer 0.10, it was possible to enable debug for gstreamer and
most gstreamer plug-ins by over-riding a single variable,
GSTREAMER_DEBUG.

It might be nice if gstreamer 1.x allowed a similar approach. For that
to happen, it looks like:

 - Leave GSTREAMER_1_DEBUG as a variable in gstreamer1.0.inc
 - Rename GSTREAMER_1_0_DEBUG -> GSTREAMER_1_DEBUG in gstreamer1.0-plugins.inc

Or perhaps even use the "GSTREAMER_DEBUG" variable in gstreamer 1.x recipes?

>
> Suggested-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> index a01c33ce5ff9..17a0d7f839c4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> @@ -9,11 +9,12 @@ DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
>
>  inherit autotools pkgconfig gettext
>
> -GSTREAMER_1_DEBUG ?= "--disable-debug"
> +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
> +
>  EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
>                  --disable-dependency-tracking --disable-check \
>                  --disable-examples --disable-tests \
> -                --disable-valgrind ${GSTREAMER_1_DEBUG} \
> +                --disable-valgrind \
>                  "
>
>  RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

