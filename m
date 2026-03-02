Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D50AD58E46
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:59:40 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150572.1772413173033647819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWEXMq+I;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-66e3100515dso2260596eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772413172; cv=none;
        d=google.com; s=arc-20240605;
        b=DvTLzu4v8meLbNOkxkGOl/ZYQf8SeMrtRNZS1VVyNAKjtwlsZH2X+hY9zP+2mBmHVg
         wD/Szt9WxH4bNoXQhYxjnvvgYek7ZChyIsvgyAvjHeTf20zavOFfgG7oZKibXkEGoWGF
         ya/MNEWq+WDng3bQA/PHusagGrvZvQzusmoAZ/Gf66v4In5ySf0ct9+OTWkwFnDpTmOC
         08hK5yjkaTHiYGJM3H0qKm+iiHUTm47HDtUomJgAnv2DX6bNdcZo2+dHtUuBsWoUnD7Z
         etNZyPGyybyblHO40CUG64nsaeeKbJZNY2TH3xInTaux3pMEFQl4HhpwaDPmb4hNbP0y
         3ANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0ALspFnd0crOpjdpKJylFNYE7z/zUP3SGj55mLdW54=;
        fh=OE8MRAQePnaJ0xprP4RuQsc1kzN6xCUbgNKKeSBH0uM=;
        b=OBZW84Y8x06CqL+M1EVXqHxQRD1w99MBYnGWJp6tPCc6IozlLGVDdYxaFPpx+uSJea
         gOhgFhclM2k/eCaZq0gSVP4uWCJRWXdGX2qilCtiZpYcBEBEkuc1rDMzgnn09UrhgaYs
         d8S0fCxZdX2PmH3xuzsFWsNTZmgv9OVVk8pLLPL9/L/cIfUu6DzK9rjHrjg1lnve73ey
         uqm7kAR9h+8o8EuC405WN6c9zR/+Z7t7Uox/XRYarzqx6FPkt40pGpLsJpJeLv3oodPo
         tjxmbJAxqfsNHbU++i3cjINVumAcXZghpefYQfnUv7xWYkZSQD7/pSxDPaS6TtfHMEAe
         2pnA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772413172; x=1773017972; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ALspFnd0crOpjdpKJylFNYE7z/zUP3SGj55mLdW54=;
        b=TWEXMq+I6nI2Dn8cYseMXW2XDwUxuvPijm7Fw4THvj1OCrjypg8ZIioe896FQeyhax
         4Epmt15sOFtc0PqrakZFWdHclx3qivYcfIxJCBRz2+zcExhQobHjePtVWP9GNH7PZAXC
         0YLmQNeDyXEfywDZes9RVI+J8zvzJk3cayWT9TK1t+BJfAGWJjXSQMe36R7UN8zdTSkO
         CbTRLsRSMGCcCWbXLKMU+IYFjCGKtIxJBonNQLT6ygblv6qFVk/F6+4SVamSoWGFEXuv
         oWnLw3FpWlwpZpwc6ZQ63XDpZSNeAln032l1kiNqzrVGk9HL3hACcH6r9GbHgzzniicf
         s63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772413172; x=1773017972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0ALspFnd0crOpjdpKJylFNYE7z/zUP3SGj55mLdW54=;
        b=m6Cogc77015yPBf/7GxKnr0xSzfv6cASWAb0BRiBQtJb9eh05HbdGH8N2nexKd17T1
         5xyHJ36CwkNnY6GpiY5h5PuWRuVx1r/9UBcCUw/tPDC9r/7CGp+e2D3y+nRGkMEhOYlp
         0LbffNK/CGIed4F7J5HwUX+uH5azwpOPnpaTarhszpdfbi1j1KRBR4JOfHuUNuBm0cvP
         uGw/yWFRwLobHF0IXl2SgGeLf3RBUfpxos0QfuX57n573mGICtOkw6aZSRly8vYhmHFI
         f9qRepN6OdOHY1tpgIBgudBqAcmFKPhBMjT3d034dSCiWuGIqX+KmWBB4EW89es94l12
         a9ug==
X-Forwarded-Encrypted: i=1; AJvYcCWjgTPmnG5f6uqOEemNJQ36H+O9VcOW+FqyIDgmvCH6KWFnONPqfYZzQiW9N6PImYFTx4LJ9DeAVi5FLmq6oITWrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOxogJ10TpbQnBPZ8jYN2h5Jg2pQjV0jYUXHnfIntd8LFlzZAn
	6V8i+L2C5SDwYhd2p5gwBLsGPv/cbb3lQUDMNvlmU035OEZMK8SrJnxS5btNbqDuIJJgjo6Q94+
	355F8Ryu4DmHyzaIDjHfiSFWOVsCGCps=
X-Gm-Gg: ATEYQzxdpHjrm+Q+cR0luVVU4KGSYvR0bWhDH1UJ/WOjaTLd8cXa++ymCevcONZQSD6
	55ITno6MSFnUA21YTWLTCSg8JgKLaJTzhdXhyoyYg/QisPco/JbJAiJ94BW3iKNOsZXh/eb9di7
	kJ2j9H38luDoXSXy01EQfKgR/X5Xw5sOpfI51kjuor7okYUWzvDdtfuHVtAKEIoZfvj8g4YIBdP
	jM7bfxSmvyHQo18gi43nMgji5SJwseVw6l4D4kW7d/IkNKLgYeEuDInNRHt7vbJIMagLfB5OirU
	fRu82E0=
X-Received: by 2002:a05:6820:2083:b0:663:3ad:4c27 with SMTP id
 006d021491bc7-679faef91f8mr6439701eaf.42.1772413172305; Sun, 01 Mar 2026
 16:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
 <20260218090606.3693584-2-ankur.tyagi85@gmail.com> <DGKMTIQVT97I.10NPWRO24MLGR@bootlin.com>
 <CADySD0ExUn0uimBUEXTfN5D_oZN3Ueaw5+L0_teLYvQQTi6xdQ@mail.gmail.com> <CANNYZj9-=RyBa14CCGKfdwTsJ7NFvBZwTyxdMWNhs05Ba2BYzA@mail.gmail.com>
In-Reply-To: <CANNYZj9-=RyBa14CCGKfdwTsJ7NFvBZwTyxdMWNhs05Ba2BYzA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 2 Mar 2026 13:59:21 +1300
X-Gm-Features: AaiRm50dRTdgKOPACF5ZSAttlqHmykEzxgzqkrEKkfZySlJSt0RgFLStRrhHF44
Message-ID: <CADySD0F7o1RvpRmoDKX_1hyMqJpy_Rymhtz2wCa7GXOHS8i04A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] mdadm: catch sed substitution failure
 during install
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232158

On Tue, Feb 24, 2026 at 1:16=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 22 Feb 2026 at 11:13, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > So does it imply hash equivalence related issues which Alex was alludin=
g to?
>
> It's possible that by random chance the issue hasn't happened yet, it
> may be specific to a particular host distro.
>
> This new patch could also be improved, if you drop these tweaks as
> they potentially can obscure the issue we're chasing:
>
> -        oe_runmake 'DESTDIR=3D${D}' install install-systemd
> +        install -d ${D}/${datadir}/
> +
> +        oe_runmake -j 1 'DESTDIR=3D${D}' install install-systemd
> +
>

sent v4 with suggested improvements

> Alex

