Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36523C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:28:06 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147307.1783330083406847050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GisxW9aI;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ee6912d86dso18900636d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 02:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330082; cv=none;
        d=google.com; s=arc-20260327;
        b=R1P1pTZv7WM4pYsoTkEB7gUNJC6hxYOPnU6jGlO3u//4gO6IAuSImIyPwS3KhBVM12
         QG6ssjCX4r+lOtuzGuREszQiIoUx4shLRfc6ixHLwkn52r6nW3HyovkSyH2iCR1dDZ/3
         X4NqDxZikRb3jrg5DIVwfv0MLCOCv+fbEyaGdGTbkQZ+S6Q0aCRrDprBpFSM0WZU/suc
         H9SQ0lGopgrC72TNhkq2hHALDOt21yoAndjIMN5+b96nQc23E0NwY61mURsF5DPAcglI
         rozgmMWG+O770SlGgzgpQcemlUwCFgtg1zv7l/5B8oSx2546Eq1ktGXsKzSw7M/THzLR
         SMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LZnl9tOZy5gawKjTh+/I4oeiF94oBLPb0YglVmmrEJU=;
        fh=GXDJX+o/327V8Gkx7l1Hy19je0ofasUKFJldEDm6QS8=;
        b=Hb8ssLfOxadidA1HUzW0cYYoPxBVCsAT+lN2jAXY7COWh8E/EGQsrcks+hBWNGQoZG
         moyIHF7V5+4luks+1Mc0IVKXd8GiOzXyhfPvajhoF44IsZiB0uRiagDhPfel29UtTGlj
         96PacLuVw0nEfuEDn/QMmo6VaZkjTeoSXnCpEidjS70X2BF95A0O5EYvNcHGECauPHxU
         bgNVurxDTP95HSHmYZG7hmufiY9JcleAkJ5FpHGIY3cU9izSAYmgn/9a0KCsXpaT7FQS
         o9dagK5VPiVG+NGlWIBU/rba/6o8LkpQf1siJgxhVjmwb5NWFW3ow8RDhKoqAjFuaVCW
         Bu3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330082; x=1783934882; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZnl9tOZy5gawKjTh+/I4oeiF94oBLPb0YglVmmrEJU=;
        b=GisxW9aIuHniEQ7NV8o5tJFz0BPv8kbqAZ6wJA16ZQ4EYqEUFsgAOCEDPrbnoac9eM
         MyXYo2W2M9o1pXLhOmEwM10XMchUPBe+a7XCSuphaqowGzQaWG7pnnCYbsr4hHAMyHaL
         E9IAt0syw6zy3H82emcMlWKT3RQvk4MEDohu2F/QoXkkUGCXKSvkZ8cXKtZGAvIOaHSA
         FMxssG9+YQQiZPWHwIDYi6TZLQQzxAwko/iD1mb0vKsq75GdOkslS8eewqEfhj0XKJNq
         S/ktlyhLJh/Ey/1UNYvjobOFdDmUf25qKU8a+POy/RIqWyI6I1cC7TjWgATXevE1H6YW
         16bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330082; x=1783934882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZnl9tOZy5gawKjTh+/I4oeiF94oBLPb0YglVmmrEJU=;
        b=Vz8lh9wkqOQdy1vGusw96x6wImpab8SYW1QGyMDGHHnu/7RBrZrGlGB9ym7pJDYSPm
         2XgTgOti6u73CAKst9rLhxIxzhAZVNdzOO0Q21UpeXjeDcudihDYdq70SFqs6/IptPaQ
         6wMNiW7BhodoAtamoZ45wqd4Laek0iYcsVaf6+ydLc66wodicAkSD3pWWl1S4l+WVKAa
         P8ovmrb/JrLDcRZ35HOihl5ANyOFcGSqwViq7DyfB4XLEuJd6nIhEs/tsjo8a9Lf2Hss
         SALNas3VlRAb3+svMyFwx3dhZN7udo0yWThg/bc1T+o+/I+IHmQYaHHX0jMbfHpOBqFc
         vkwg==
X-Forwarded-Encrypted: i=1; AHgh+Rrmhh+MqdgZ+XhtV2HZgUbHh6rYWjIAvwwQJnmAtyUGXFBH9XJmx3KaFGC1b99yYDPs9Ql4tPHJ2DiL0Zb9Wa6BOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpZwASJH9gfzuILERONocz5dfdM3PlYU9kKdyU7GtdsUki3RIx
	n9i23YuVIEbv2Wjwshb/n1CplIFzb4KMiTuhmjPAFDNgeHW9neYKZVNw1RGGZGTbJmnGoHNq8Ua
	kvUXMDrYSEzPxm4xBO/MCQPmvyDzKA4g=
X-Gm-Gg: AfdE7ck7Ki4XnPEmGnCeY2cEqvLJBX6/eLxIXQR+QHugT2lzenb2lazdGuQv96q50xp
	bjRQ0sRF/ZXQcZMRzC55kft92ui+XjB456rtt376ZNtXPX3XABIGnGvguxQjw0pGBLsgCeTA3wX
	4hjfOMiPawT3HEgFq8DIUmwywt0wCSHxbqCHBH938PWSR5EoKBecpTTJCKcFMJ/CAw9jd68JofJ
	LLe9geJefePiHYWz+YXwjc6BDN88LZX/rJlC4GVTSWKwviZjGPQtge71ABHuQLQUXEHox6A1VXg
	EeDAkJ0iZHO2vW80vpM0FzWO72Epwbw=
X-Received: by 2002:a05:6214:2604:b0:8ed:6c66:d11d with SMTP id
 6a1803df08f44-8f74c5a2f35mr146875836d6.26.1783330082243; Mon, 06 Jul 2026
 02:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260703105349.1664278-1-Moritz.Haase@bmw.de> <ebb0c3d6facbb9d88be4451aa981363d65c19d67.camel@linuxfoundation.org>
In-Reply-To: <ebb0c3d6facbb9d88be4451aa981363d65c19d67.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jul 2026 11:27:50 +0200
X-Gm-Features: AVVi8CdIH4wNDTuGHGHex5F0rESIsMeFy47CxLpMisVMSCc6Pn3Zaxxl0kr6Pdo
Message-ID: <CANNYZj-ki4BiFoP1aYtDDs+2sngrV0T7o6Yh0KScuUHGu2TEVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240230

On Mon, 6 Jul 2026 at 10:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> This patch turns out to be the one breaking oe-selftest:
>
> e.g.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4276
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4216
>
> The reason is that prior to this change, those tests don't build glib-
> 2.0 but after them, they do due to the new xxd -> vim -> desktop-file-
> utils -> glib-2.0 dependency chain.
>
> Not quite sure what we'll do about that yet, we may need to add more
> locales to the selftest I guess but the extra dependencies aren't
> ideal.

I've a patch for it too, which rather disables ptest distro feature in
that particular selftest:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=akanavin/package-version-updates&id=18b1c1a07ec8a42af31aa9576793f4ec73ffd0d6

"selftest/locales: opt out of ptests in DISTRO_FEATURES" if sha for
the commit shifts in the branch.

Alex

