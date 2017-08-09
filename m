Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7DE71C1F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 15:12:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y206so7128713wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ugow1iHz1/W9XzWrB0sflOFOxQ9z2RWgWzPJpDCmkZk=;
	b=MlgneQ9ivlwQnQq3HIsrshE3UNjE7DFU/TQuOIricInUkgQZpnHxQV8kNv6/l8Bfny
	1N2FuSEBYAoDv7YchWVZMPYqCBatj27+r6e2QItaksN3jNH6hInicY6HpUAoLiWRtweC
	FQiYASS31oPifxlvG99/AJ2oi3W9pmNXjxLQGiSwYGMVO1LAc+yagVgGZEsIGnHCqRMm
	jn9pmHqCSf1quZGysl1b5/ec9yS95vrc2i2vqJSSdU8aytQMni4ezHHyG9Mw3k1XSIxl
	Lj2VBtRuMre+x0jAHmrmeaX/tlDITl6TSlx4RcudbckaNMfm7idYx7gnS6Xid4mrVySX
	2arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ugow1iHz1/W9XzWrB0sflOFOxQ9z2RWgWzPJpDCmkZk=;
	b=O774VMtSjVxUINs6o8vwldgoLmwQVOwU0wZCq6xEaqD+ccHg4GCzWkRb0S6vW65q2Z
	HwkW1prB4312mxYaS1UhxQxcnx7wQDAvchPuBFvwVXgqR5CD32nFyvqEv0l8N81mBJY5
	0245px3pWKwOVqKgycJ5/4tFX7JKzNx/YU8e61BDpSrh/cdzoIG0lecFkszc1Rli+4q+
	9Ve3kgqgr/e93tLLWWUMpmFmxVtQeqZTd2hzZj9OCRGOcmpq8Os+VdSZXiCk4cGOdCxE
	Ic2h6udZWELHaQzkTFKa7GEu8W28QVpv94K+OuzD2GoMMjN1nxVS2jRQCwdoqtk9OTmI
	2M8A==
X-Gm-Message-State: AHYfb5g3rEa6i1SKzb3xVY6gXn894GLOXt4e7Fp6fxwT5+momiL96Ja7
	m8dGA/ukQW8zx1N13vYO+ry9LrQzsA==
X-Received: by 10.28.24.210 with SMTP id 201mr5378381wmy.65.1502291565700;
	Wed, 09 Aug 2017 08:12:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 9 Aug 2017 08:12:45 -0700 (PDT)
In-Reply-To: <20170809111602.9117-1-alexander.kanavin@linux.intel.com>
References: <20170809111602.9117-1-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Aug 2017 08:12:45 -0700
Message-ID: <CAJ86T=W994zJ_CBLx+8oPv3k-DMdW6SaRd=EQMDRgoRd2WoV1g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Wed, 09 Aug 2017 15:12:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 4:16 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> It has not been ported to openssl 1.1 (and there's nothing in upstream git),
> but it's possible to use nettle or gcrypt intead.
>
> Also, provide a fallback option to use openssl 1.0 when necessary.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index e964fef3f20..dc47f581af1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -40,9 +40,9 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
>  PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>  PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
>  PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
> -# ensure OpenSSL is used for HLS AES description instead of nettle
> -# (OpenSSL is a shared dependency with dtls)
> -PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
> +PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
> +# Provide a fallback to openssl 1.0 when using nettle is not acceptable or desirable
> +PACKAGECONFIG[hls_openssl10]   = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl10"

The option which isn't enabled is going to cause "--disable-hls" to be
added to the configure command line, so this isn't going to work as
expected.

>  PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
>  PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
>  PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

