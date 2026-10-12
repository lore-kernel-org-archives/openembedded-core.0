Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6657CA9EDD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 15:34:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15993.1791819246363635041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 08:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2CX9RmOC;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ff680331aso16141055e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791819244; x=1792424044; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ITHRts0l0R2QavVaqTrdwnUFJG+J1zIa4Ahsv6RSX4=;
        b=2CX9RmOC3aUWqepipMDl70/FGKLlUenzVkpbIkltumy0IXjUyJcHXc+NHzoYne4PGy
         ZYumw4iRi5GOcJ2eG5wVsC31YrYyQZZ3Eu497bE8E9C8CCTFRoF6cYbRMC5+BbUB0/h/
         qGZIh2gj+zEUfUjXYbAEY7T7FylUGHG7MTFlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819244; x=1792424044;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ITHRts0l0R2QavVaqTrdwnUFJG+J1zIa4Ahsv6RSX4=;
        b=dDvik2LpIv69eqspfgpBW3F+Byfbuu76I3iMc5dypN8wlSpu0wS0uxK8O6ItZn66Mi
         5lnQ96/fzrYpqTxv/Y4dXZFpQab/nW+3wUNz8IJIeJ5BYr2yURw/+sX51EmT2xTq09Si
         wAYbPCI1H8B+AR/6OdL/DByW3TVvix0CzvS5ezRXi/jRlxzCeWHnxy0D8+VlkO6by7AQ
         RSZwn+/VEQwBVyQ9ux8I8vsBhtM503JSGoOqWJxTVuvbk0sTYuBiRT3GgfJUqqIqbcB1
         bs1T/CKlVH5ks3hKmfR8hU/JL5q3H3uKUezDxJFz91gCmWcuPXmGc8E9hoUIRpO36m7/
         f/yg==
X-Forwarded-Encrypted: i=1; AKwUvBzlGRLTy2l+qgjABDY0vhb0HuzjSy17S0eJXeWc3f3e7ZHgZGV/eChEPg1KW7nsvIS17cVkqgnu1Wkp79PN6sB8GA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLrclz+ep+GX8d5jzWraC+fZnCilORoBaBOu/r/R9D0fSVwlk0L
	ME/df02iBVaTINSTXc3EBfOj/AYNHRYsq2r0Gc2A1Co3WvehgZQ+4KzoYaciAvzxzPM=
X-Gm-Gg: AYBFou0vtL6z0N+kx51EMW2adbSrCxjwo/5HusvuZyW3rTCq6Ru1e9ocQykiDDRIFvK
	864t2hOX+AZ/ZZESwyN70hSI1+J4rfStRRp1A2pFMjZ2TCyPCYT2pa23WzXBrMflcKTg9PdBzJZ
	edyrfRHrUxPURjbOq4xWCm1ik/il0C0RAyjZQNPKH9Lz57grJQWLcE/bGf9s/PVuzLyR9elrMC9
	KTp452ewCwS2Q+q/ARbvimQdx5BgKDCxm40IP8z/VJeJiqAXe9RFj4xsgOElQdDKcu0IHmhnYso
	8zeXtmuKKII28d+LlOyT2GEFsTY0/1nMSxrvM9IQoqUeyD5DdbNZBAe6OnZ7PfNeznjGoJo8D7O
	RFJiJ5cAg17osKtp4DhiHXIsWbtMtAb+LUR4HhWnrF86/D0eojzJbNCjOJyKs7rDJAsnktTFZ2b
	Fin2zs6ZVci+xxeFOncPLPB1Pf+Vq3FhzQwdw+zxFAHH/XTwkcBpsTUUcJwN7MD2y/eM92z1EHV
	0/u+/bRwv6guzTvxYTOpIhmh3o9dOjh7CNAv8Hw3t9JBVzYFlczv4Pc7OH0Bw==
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr177891435e9.14.1791819243649;
        Mon, 12 Oct 2026 08:34:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm165392495e9.2.2026.10.12.08.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:34:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 17:34:02 +0200
Message-Id: <DM2YWSH94U55.1FY94XRSNMQGV@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 36/60] libpng: upgrade 1.6.58 -> 1.6.59
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1791707817.git.yoann.congal@smile.fr>
 <e72c2ec7e05c7d441a96a2508a933a34603e9bcf.1791707817.git.yoann.congal@smile.fr>
In-Reply-To: <e72c2ec7e05c7d441a96a2508a933a34603e9bcf.1791707817.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 15:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247665

On Sun Oct 11, 2026 at 10:40 AM CEST, Yoann Congal wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Release notes [1]:
>
> Version 1.6.59 [September 28, 2026]
>   Fixed CVE-2026-46675 (medium severity):
>     Use-after-free of zlib input in `png_read_end` after incomplete zTXt,=
 iTXt
>     or iCCP decompression.
>     (Reported independently by Ze Sheng and
>     <JasonHonKL@users.noreply.github.com>.)
>   Fixed a regression introduced in version 1.6.47 that caused libpng to r=
eject
>     hIST chunks in their correct position, after PLTE.
>     (Contributed by Yuki Sekiguchi.)
>   Prevented a double free of `png_struct` members after an allocation fai=
lure.
>     (Contributed by Anthony Hurtado.)
>   Applied fixes and updates to the CMake build.
>   Adopted the REUSE Specification for licensing the CI files.
>
> Note: cmake is not used in Yocto build of libpng.
>
> [1] https://github.com/pnggroup/libpng/blob/v1.6.59/CHANGES#L6388
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 907c6fa2d0c4f8a8f765cde004c55fb2dd2c402d)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

I have not done this upgrade on blacksail yet. This upgrade will have to
wait the next cycle.
--=20
Yoann Congal
Smile ECS


