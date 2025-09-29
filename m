Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933FCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 17:00:33 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.3658.1759165225913382311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 10:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qe6SBahI;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so34184086d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759165225; x=1759770025; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMWmVYzN8ONOcQoPaKOLAbsSwhpIxwDmtv1fSsVP4GA=;
        b=Qe6SBahI5H0w9qguEL2PoTfkQTOznt8nYjTDS0sLt27wbfmQzBdRvFvIDOY/Kl9eo0
         KEOETg3ArHSgSteorrMCRI+swj8821z2ksqEnIPsG/B4pv7DgdXWk+oeE3cuahKe5t/D
         CYA+7GZx7DSS1fTXbnAj9QQGUWj2tg7mVSv13JhiJ/3kbEnGRFSe3XJyHuB4mParOxUE
         3SS71ymw4P8KRrghH6cjnqDCAliPPuYpAAvXUQRvC6/pvBQEaDCyoib0acbb6BWXmUAz
         3rL7nQhIiehujS5xNFjN2BNhFJEktitBQHO4tVGmmdoBvypC/Ln0QqhROrKsnIRwZb0t
         qvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759165225; x=1759770025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMWmVYzN8ONOcQoPaKOLAbsSwhpIxwDmtv1fSsVP4GA=;
        b=LT2mY+qbRieSxrciZ2Csh3VJepZAPu+id9SOcsmBOHSCFAUHR8efLIru9n8kR7hWt7
         Ry02FPazIFc+CJdfzZ+FqWTLizg1eHRpwjP2Pc5fEPp/qp8yMQWOj5/jFWXryeGiyeo2
         U7DkEOZGvXC5IVTlRYpv74rE2jW4yfEY71BYglp3u3B5c527RJDnMOixyrwEfK9Av8Mp
         S4hr1igmctZcxy+h0/2SgOyC7i8gCYoe+K3fcKF41Opme92UYE2e3HkufvywzwWjBfGK
         eus3Oxq3FrHqhl1gNq9yYu6UDcKvlrc2tX1W0+OhsdXkqGtxXvfcv4AlZMZbD743HoRx
         nC+A==
X-Gm-Message-State: AOJu0Yy3fMWEZLF8SkWKKrRT3wMkTyum1etVPQkWTvA+4K7GkUdS8thd
	APgezXudnAA2ZhI034gmmJ6xxrPhJb1Soi+oDpgsxOsFwyi3n1RBKpIGAW3Xn1ulhPuKu2rPIOS
	NNfQCZzef4Q51BU+ziCX0CqUOZY7TdWUcCiqw
X-Gm-Gg: ASbGnctiWUalOkWwVHuUR7RQncyC0T/1UNhjfgfyBsZ5Rfa7Ut6wwmLnHDVOnM3rPse
	LHCy1k5ejqCnHB9gNY8TW12CekEb/ApEQOVpl2tgjymVLQcYCfHDRaU8Ea5mJs6chd5OdJLPZjt
	YzkQ3ZQ53/FiSJ1NdKHz7kreE1TkktE0a5cBF0bZIcYicLfwcTXnMPRVnTLsLv2tzaxYxfAzmyG
	ERSnBWDGVWwMXLj5mw2K+5oFpAHaWKp68jrxt+7wipH3iE7XnoFrjgg5eO906B7q8utjse7DVqo
	Dqz2S2ixWAmWBQhcO2eK1XbR60doa8Id0O0LfMaqllO0bSq6JOU=
X-Google-Smtp-Source: AGHT+IEh/s5g5VjGFeslEo+YXDJEPpcRuKmx7smn8+7zaHoMFClOgxXPsICuq0fkckhoe9DGPBWEDxwqDSuQOJIZwYI=
X-Received: by 2002:a05:6214:1245:b0:729:9b59:bba6 with SMTP id
 6a1803df08f44-7fc387e1c58mr248704206d6.34.1759165224531; Mon, 29 Sep 2025
 10:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com> <20250929161225.1290751-2-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250929161225.1290751-2-kavinaya@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Sep 2025 19:00:10 +0200
X-Gm-Features: AS18NWD-zFkVhM04qusSGBPVHEuWmiAjX5C6s_DHq-zpkkdCcsmEe6N3DGJfc6I
Message-ID: <CANNYZj-oZQ0aqfHVzxAL7Mccu1GAuUvM4S5mQnB_YtcBPZknHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] fitimage: Add support for custom compatible string
 via optional parameter
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 17:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224158

On Mon, 29 Sept 2025 at 18:12, Kavinaya S <kavinaya@qti.qualcomm.com> wrote:
>
> Currently, fitimage_emit_section_dtb() always reads the 'compatible'
> property from the DTB when add_compatible=True. This patch adds an
> optional 'custom_compatible' parameter that, when set, overrides the
> value from the DTB. If not provided, the existing behavior remains.

At this point you should explain *why* this is necessary. Present your
use case. Explain why the string coming from dtb doesn't work. Don't
be afraid to make the commit message very detailed or very long. The
more details, the more it helps reviewers or people looking at commit
history. I think some of it was previously discussed, and you can
reuse that.

> The compatible property is also skipped for DTBO nodes.

Why?

>  meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
>  meta/conf/image-fitimage.conf                | 6 ++++++
>  meta/lib/oe/fitimage.py                      | 9 ++++++---

Tests are missing. You will find existing tests in
meta/lib/oeqa/selftest/cases/fitimage.py
Look in particular for test_get_compatible_from_dtb(), and see if you
can extend or copy and tweak that.

> +            custom_compatible_str = d.getVar(f"FIT_DTB_COMPATIBLE_OVERRIDE:{dtb_name}") or None

I suspect you need to use _ here instad of : (but I don't have time to
verify it now).

: is used for bitbake overrides, and this is not one of them.

> +# To override the DTB 'compatible' string in the FIT image, add in your
> +# machine.conf or local.conf:
> +#
> +#  FIT_DTB_COMPATIBLE_OVERRIDE:<dtb-filename.dtb> = "custom-compatible-string"

Add:
# for example,
# <insert an actual working example line>

> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..0d42bca5d7 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
>          self._kernel = kernel_node
>
>      def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
> -                                  dtbo_loadaddress=None, add_compatible=False):
> +                                  dtbo_loadaddress=None, add_compatible=False, custom_compatible=None):
>          """Emit the fitImage ITS DTB section"""
>          load=None
>          dtb_ext = os.path.splitext(dtb_path)[1]
> @@ -308,8 +308,11 @@ class ItsNodeRootKernel(ItsNode):
>
>          # Preserve the DTB's compatible string to be added to the configuration node
>          compatible = None
> -        if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +        if add_compatible and dtb_ext != ".dtbo":
> +            if custom_compatible:
> +                compatible = str(custom_compatible).split()
> +            else:
> +                compatible = get_compatible_from_dtb(dtb_path)

get_compatible_from_dtb() is also used in
fitimage_emit_section_dtb_alias(). Does that need to be fixed
similarly?

Alex

