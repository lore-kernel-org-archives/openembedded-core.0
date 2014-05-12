Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (unknown [209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 41F7360167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 18:36:31 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h3so4199298igd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bpeXASwFj8SXmPy+iHYn7q7Sa3wLTZdD8QpXaZfoV0Y=;
	b=O6nFffycHaovhKCgiG1L7fNFE2ycGWLdye1RerLUSlMGnt2dfG0KG4jStaE9hUc5uY
	rSvIPVLMt3l0DHfDge2l9aAMyGkP9mLngPNcdTkiJsHGD/xvEFhiWbwzYcvJfAurq7jG
	jlYH0K2buJUekcblvU86BLMeFoRtu7+ZTENM6qsa9ow9V2nRd61lHEmtntRw6luAzkGl
	pgR8tBtZBS9leXp+FJE0Tiwmcpquy3AOHZXx5GgMqNL5V0ETXqmjHDjAfB4g8j4yIh/+
	CSVZsSnIdum4/QrCvwrtSZwSWzaUVOEl3pN5I9hawvqPsSxboi9koSr4Hb1q3qWpAKbW
	x8oQ==
X-Received: by 10.50.78.201 with SMTP id d9mr47228204igx.17.1399919792330;
	Mon, 12 May 2014 11:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Mon, 12 May 2014 11:36:02 -0700 (PDT)
In-Reply-To: <1399914003.31891.140.camel@ted>
References: <1399914003.31891.140.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2014 11:36:02 -0700
Message-ID: <CAMKF1sok81zbF=t18Z7n7aB_KP9YvNKr5kV54m0y+TW7LwVheQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: Better gcc 4.9 fix
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
X-List-Received-Date: Mon, 12 May 2014 18:36:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 12, 2014 at 10:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> gstreamer does runtime detection to enable/disable things like SSE code.
> Unfortunately it is broken and will try and use this even with i586
> compiler flags. This change forces it back to the approach with gcc 4.8
> by disabling the problematic headers.

I think patch is safer.

>
> Its suboptimal but less so that the proposed previous forced enabling of
> SSE on x86 everywhere.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> index 83b856b..4a8a994 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> @@ -33,3 +33,5 @@ do_configure_prepend() {
>  }
>
>  FILES_${PN} += "${datadir}/${BPN}"
> +
> +CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> index eb13277..1691c99 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> @@ -37,3 +37,4 @@ EXTRA_OECONF += " \
>
>  FILES_${PN} += "${datadir}/gst-plugins-base"
>
> +CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

