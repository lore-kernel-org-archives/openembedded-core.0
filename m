Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B50C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 21:34:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42124.1785188092709682696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 14:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F80xjIA4;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954d29264cso15904025e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785188091; x=1785792891; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pIyLEtVZW8w/Cb5B5xIQIXLd5zi6iCYDSba3bf52Nfo=;
        b=F80xjIA4cHE/TRVgxp7J81cV5/kWxWYf0R1QPly5nMkN+ePunSF0JHYRuhy3BJPZmZ
         EWM0k1u9spyEJJ5R3//4iyHEa70+WgALl3UQeAm+1XoRTyoUdkvEqheyB9vGVf31K/xL
         4GsYQDg/7yrNwqgaLooUaPyLZKFlATOBrUXaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785188091; x=1785792891;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIyLEtVZW8w/Cb5B5xIQIXLd5zi6iCYDSba3bf52Nfo=;
        b=Iipzq4m3dEG0NtIVQhcnaFcmlFLRCT2SZbFJWUvnwoqtSj2P3uOcd2F6SYhRexAvt5
         Vo44lwidCkifwqxAB+RHrd1iGkRvV1GN8ZstvETHj7AUVUCXTWZRdg0xXhNkh1XBSndF
         qjKbTIoxsN5oXmxsbg8zEpeVk3giPCEThoHoxOPw6/y6tKc1KpxUb8MbV7Gla69Olsqg
         J0O8aEkyZ0BkjORCYMe9bbYEc2nO5LNRkn/H2XehrLWlYXu3IaaN7508jZUYY/jkRNEV
         XEgc0JwkjSB1CtVN6n6HiwvLjsSlGKRBuvRBoUjsWrJoZhTkgTcHsus4i26OVhUn9eOl
         5gKQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6jp3YRycTrepbACEiDlfnQOHSZVe8uI5OuhIeWreRuxdpL379ZbmU+9T+rZ6p7m4bmnFfKXALh+F89kJddNiDFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCu4DVSI+avo0YUU+1WgDLIHHQxsEYlBk52cPupzSipMZExhPV
	5XvMDk/V46Sc6CrX4egKGz0qoOcZNpGvtV2oESuqEAOSvO9d8A41g+xnb6vTocAsCQk=
X-Gm-Gg: AR+sD10k1Pa/7m97Im5+v0cn9Wne55l+kst0u1FO9L7I7ifk1IWlRcMT1MHgIyRd+Lx
	+gKoehpQRlq8uGzS+8X5NfFEwvRbmAq8cZ+Rr8Km9m4GMbMtBckbI0GvyzfLFNoP9IOCt1Vuz9c
	MUmOLHPKWx5ZzN2sd2ymbsy4UTNLRBsd54TfXYnPCHIrKOEKwbP7+UHb7FOboTjQecfHtBUtbs7
	qr4KmvCtbN3XUkNGLejxpgk6zDiPNf3OrmezT5lGxBlimVv+7edJi/RDs+NfyiJbwOwsG9+D+dN
	BKNVv/FXw1iK2esDxNpEYVLfyCGUlVxKU6hyEWBtG7hvu2Dcs1+31vNrSDi2yGq3Nd+RTIphUq/
	0PNb7ZqWLEAXWCBMI8byA5VxYn9hEx2jzVnvSglnNadBiY2+Y8OuqlIGMiEeWP3cxUN5d5/N+RG
	vj4+vUn7QLY9HHRmoM6c3fEMegiWZRAf8McdGe/ngZZK50bXfk20/5cnnVn1fn4fYpFQ==
X-Received: by 2002:a05:600c:4f82:b0:494:282:106c with SMTP id 5b1f17b1804b1-496c4f91db6mr6997085e9.16.1785188090962;
        Mon, 27 Jul 2026 14:34:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm23301715e9.10.2026.07.27.14.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 14:34:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 23:34:50 +0200
Message-Id: <DK9OD2YS6ORT.1KGJB7JK3VDR9@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 21:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242107

On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
> where a non-chrooted rsync daemon could be exposed to a parent path
> TOCTOU race that allowed file access outside the module.
>
> Also include the dependent upstream fix that followed the CVE fix:
> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>   opening files from the module root, closing the same race on the
>   read side.
>
> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba8=
41b94ffe19cd2505
> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a=
525a1f5566f10c85
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>  3 files changed, 405 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch

The backported commit[1] is from a branch called "v3.2.7-sec-patches" with
a tag "v3.2.7-sec-patches1".

If upstream has a branch looking like a stable branch, shouldn't we try
to upgrade on this branch?
Can you look if a "v3.2.7 -> v3.2.7-sec-patches1 upgrade" would be
possible on scarthgap?

Thanks,
--=20
Yoann Congal
Smile ECS


