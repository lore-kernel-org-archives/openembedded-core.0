Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD569719C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:04:04 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id 11so11386888qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SOm8TWFMQt/LN7jx56jw/WN6hsCbrMEk8wiDXkUYV38=;
	b=S0GKCZeq446JAX9ZqdJwR/LubRETJQz3l5FX37LUKsr/A94sdg3Iz6KbyHw54bKO/Y
	uFNXhAk6G4Aoa3iaicsfoozy69YJortP25NgAbRC/ZQKh8LzJhcHlYaHRBMKwAWGXhN6
	hUO5HOl9Y4CTTdHokFAJdaqDNpx9ISt+8Tuf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SOm8TWFMQt/LN7jx56jw/WN6hsCbrMEk8wiDXkUYV38=;
	b=lPvJyXBPREZQzSnUh/HbvHwzjmogajqMaWgmeApdyGtdAHFZscAUmYNEuQ5/Eb3FjL
	Q0ylwT1d+cCvtxmy3SB7yxoaAw5d6THw00HhTJl/i1WBVVXHhxyD0tRzLjIoCvp6N7Ma
	3ObCgNbs0Wq3RyI/or6g3Imgpq6KHd+ft6lOna/Rc0aQfRt8lW+WWeyo3xGhFudbvxuM
	vrSPS9X0tYZRaVl3M2e4xI/d54/y+T0Howqc9UpXu8/AhtEhRIQncrufdwV0YL6kFDGM
	JZFnjBCWZr0ZIH3pVBVS8HK26ZYvHnXBU+w+6j2xh3qKfdiF/LMqqoH9GNOWtbkovDe+
	IjsQ==
X-Gm-Message-State: AIkVDXIQb7sfpDCOQ5cpJwOPpgBi+hf5CfU4jMSSPlubDSkvooyYKk7+hJq5pxfFw2YpxzLWNnEK+vNX19Hv5261
X-Received: by 10.55.181.198 with SMTP id e189mr13138199qkf.231.1484204644941; 
	Wed, 11 Jan 2017 23:04:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.19.82 with HTTP; Wed, 11 Jan 2017 23:03:44 -0800 (PST)
In-Reply-To: <1484200338-27391-1-git-send-email-sgw@linux.intel.com>
References: <1484200338-27391-1-git-send-email-sgw@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 12 Jan 2017 08:03:44 +0100
Message-ID: <CAP71WjxSDG0_XdT4D_jjKr+L2wN2haez0rsricomUQ+Pj6cBCA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Thu, 12 Jan 2017 07:04:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 12, 2017 at 6:52 AM, Saul Wold <sgw@linux.intel.com> wrote:
> To enable glamor, we need to also enable both dri3 and xshmfence as dependencies.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 6a13380..16d9747 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -122,6 +122,7 @@ EXTRA_OECONF += "--with-fop=no \
>  EXTRA_OECONF[vardepsexclude] = "MACHINE"
>
>  PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
> +                   xshmfence dri3 glamor \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
>                     ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "xwayland", "", d)} \
>                     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \

I fully agree with this change, and I am definitely willing to have
glamor enabled by default (I even thought I had sent that patch
already..)

however i think you need it done this way:

${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' dri3 xshmfence
glamor', '', d)}"


> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

