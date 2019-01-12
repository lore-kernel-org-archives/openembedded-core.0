Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC917C13E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:36:10 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id g125so8273725qke.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EqIjNV/5mO5Xw0gf1UKDcudnweSMwMoAIKbRxBVNRP0=;
	b=Le1mlHxkQE7Z9dY8IypcWOrAXHzqOwzOj4/f86xyeHmFig66kz5UCIkFhoQAHKBdQS
	RGWTXRvqyoZkw9Cq/tAgsdBGWf8QJqWMOSK16R34kFNwjbccqLdWkWPAtOxdhG/Yn9ZP
	q4vJYnkMapCEaxu8mY8177bxUAgYDy3RLIGz6hz+dIYHJwbOoK+uAQFMEj8RFzoxB+PT
	TAIbkXfkqgro7b9ZNtxOYH8JIxHiLDeJkipBlUhN84Asd0t2mGrfFWKLdNe7hP8YTrme
	o4kZvZopmNhXs/c/3PyDBzVOQ0pB+ph/3V+sPGA5J4LbJsdjxXJRwpLo0iSnHTD2MrTP
	ZSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EqIjNV/5mO5Xw0gf1UKDcudnweSMwMoAIKbRxBVNRP0=;
	b=jFNMM0YFrT602Fs8l8M0XhYVemzTO/DgY6OiNR/87AKPIbwYQzoCQF92ev1w1ALsSy
	D1sO7MlMDspioKydr9gGDohCV4+cf9JzcL1xAjnjdpPZ6qBM00TBNszIJhA8cSi967ku
	bNTO9Hfrh9Qfo9GlJGuHhu3xpPfE1QlAtgk5XOfAaoWT1VVqlveA3VPMZYvFmZwRl1Jx
	oZ83inhe9VBrvlztqWkia9C1rBUm+3B6nce3gNQlZD5+/vCXbA/ztvY6PFgCPbhde533
	XceMgD62v2gejSiNMIWWT/DIiAB/n4RrtbOska+2Jclf4vkbsD1tPk6hy/CUYsq1BKGz
	bGXA==
X-Gm-Message-State: AJcUukem8Lh816kuPX/VwM1HAEE87fFEGWhlcfxF1VdeY4msiFVQDQEg
	MBi2hJ96/avKiDU/gxGI2ABRI8GciyyywtwseK0=
X-Google-Smtp-Source: ALg8bN4mXGst1izRRLgRXsG6ccyyVYN/EufRe9jOwHNHO2AJQXHslTgbIG5v87dbPzUIALjpnYs/LotKJo7TGIod5E4=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr16576698qkf.223.1547307371788;
	Sat, 12 Jan 2019 07:36:11 -0800 (PST)
MIME-Version: 1.0
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
	<1547284970-20783-3-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1547284970-20783-3-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 07:35:45 -0800
Message-ID: <CAMKF1sq8_O8Afym4aAubhAaOFcY-r2dE_XbrjkHqBtMZCA=GDg@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: Use arch overrides instead of machine
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
X-List-Received-Date: Sat, 12 Jan 2019 15:36:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 1:23 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> With custom BSP and build with musl we still affected by undefined
> reference to stack-protector specific functions.
>
> Use arch overrides instead of machine to ensure fix applied to entire
> architecture instead of custom machine like qemux86 and qemuppc.
>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 0f1fa27..2e11d71 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -66,9 +66,9 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>                 file://0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch \
>                 "
>
> -# Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
> -SRC_URI_append_libc-musl_qemux86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
> -SRC_URI_append_libc-musl_qemuppc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
> +# Workaround undefined reference to `__stack_chk_fail_local' on x86 and powerpc for musl
> +SRC_URI_append_libc-musl_x86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
> +SRC_URI_append_libc-musl_powerpc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"

this seems wrong to me. While you are here, can we try to link with
-lssp-nonshared instead ?

>
>  PAM_PLUGINS = " \
>      pam-plugin-unix \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

