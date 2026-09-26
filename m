Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA08C9832A
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 20:49:47 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26862.1790455786982817604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 13:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WX5rg/bA;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1081209f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790455785; x=1791060585; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWT+VAzlI3okIP0fzFVdtW4PNwwTIm3C0wYG5KHIXrY=;
        b=WX5rg/bARr1U83Yv4A3r8HB5URuqW7wITfBl29lstmPX98rDxeBDEMPCYXtoOayzkE
         DDuw9We22aUTRVG0FvNrxXvXq+w9HzavhAR7Vl6PBFyhNQFEvuMlOWGtM/JlwH/nsb7I
         FYSYMZMNi4wOXhx6saJI0+8eZvk16aIkXj18E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790455785; x=1791060585;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWT+VAzlI3okIP0fzFVdtW4PNwwTIm3C0wYG5KHIXrY=;
        b=RV02iHsZNu6WbDSX1Vk7lyHj0xfX8JK1nJF/WoGlz1KbLbMTFuTfsnzbi0JRzjNpzi
         dBnMfuuOqT3JgQqq9pjiedH/7yA8dVIID6iv0On8tHWNobJkFM+N5zE3ClXYNBoX069M
         WvQ0HnPsFCbWWTfYCRzxQ2Nj6WcOmqaibD8Y00QQWy0lwQEBGmeQcrbEx8lOJuo2muMh
         Qt9bdGj46aEtDEGqAzzKNmd4hWzg5ONE75gWtrSQyYnS9Y4eHiacSy0DNgFapdpdVM4H
         th3cevP61MEiLLmZTi9k2ljsZ+ZOxHAmNvlswEVxq6Fode83uTEjiKo2eMXnmGzNuhiW
         Ozug==
X-Forwarded-Encrypted: i=1; AKwUvBxK8xNpPXN3dq2pGOWGGdMhUXAsQUjiym2sHrWR8ZA0XRLZYnOuWV5L5lieuvapGGUkD9RK8dgf7OOJ6j2/iZGbLg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL6WsM1TALyq9XOupRFvH3m2jXEQld0yQ3XQXAx6cl8zve+9F5w
	WP/5PBWUegBMwcE4FLcFROXaD24aV/dvrf7/ESlXpZ4MzxVjXismuKW6vIphObt5WmA=
X-Gm-Gg: AYBFou3trh8DdkeBbQiuUNm5d7BvJQkoOelAd7Z8KWyumlQKW7h7eq76MxZtlmp9OPs
	dThG+yBf2Y3uTfUjifCuc+pMbGQRpYLAFS2ml1DedAsKFERwF88I0uHasNK8q5EvM9yqW+yVI4X
	1aLl4Nn2WUXC/p3YGtnjsZj3NZAKC0XChdRMDpzaqHfNrVskIg5tl4+azba93KrxY7ZwHezN85E
	lCcILpTrDnYtjWyolyfjO/YWNaaoafSYW55Rkib6YzC5jhfa0Mey6DiWZA9kqIvzQhj0GX1ckTl
	xrRpwmW7OgrP6WEUD3B508FLGNMTF9qXb4vTxj4iJxbZeImjNe2OKOAAHRWX7C4eCuG320rT31I
	OqAKnBjSyYikinlygt3llgJ/9O2N91YIeJN8LrPdh+BlC6xt1CZO0prgZTr/fIXpJwO003KrctT
	wn1+3ypsmXDP2KLMk6rWjTcaPWl1cVrBdiqTVcMUASQeHhS5OdTR37PxQQDaYSxkwVPPQLOrMos
	WRRZvS4Uf8hSUqY5OS1BqK2USOq5z+7hmvFWzsqRSmrVHg6F8B+Sw4DsaTQIdPfMtOEFCL4
X-Received: by 2002:adf:e192:0:b0:485:8c17:9764 with SMTP id ffacd0b85a97d-4887db39ab3mr9788606f8f.38.1790455785125;
        Sat, 26 Sep 2026 13:49:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm14749630f8f.31.2026.09.26.13.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 13:49:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 22:49:44 +0200
Message-Id: <DLPJLS9FVRFS.35QX2ZF2MZZWU@smile.fr>
To: <OmkarAbaji.Patil@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][wrynose] gnutls: upgrade 3.8.12 -> 3.8.13
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260826101729.731747-1-OmkarAbaji.Patil@windriver.com>
In-Reply-To: <20260826101729.731747-1-OmkarAbaji.Patil@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246644

On Wed Aug 26, 2026 at 12:17 PM CEST, Omkar Patil via lists.openembedded.or=
g wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
> CVE-2026-5419.
>
> Release notes: [1]
>
> Rebase patches and drop patch included in this release.
> Add patches to fix linking with musl libc.
> Increase memory needed to successfully run test key-openssl.
> Drop code for previous release tarball problem.
>
> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb  |   2 +
>  ...fragments-implement-a-basic-DTLS-tes.patch | 258 ------------------
>  ...s-mini-dtls-framents-link-to-gnulib.patch} |  12 +-
>  ...ust-list-fault-fix-issues-in-linking.patch |  31 +++
>  ...merge_handshake_packet-using-recv_bu.patch |  96 -------
>  ...s-add-more-checks-to-DTLS-reassembly.patch |  65 -----
>  ...fragments-extend-with-a-1816-reprodu.patch | 159 -----------
>  ...fragments-extend-with-fragmenting-Cl.patch | 149 ----------
>  ...ch-DTLS-datagrams-by-sequence-number.patch |  42 ---
>  ...fragments-1839-mismatching-message_s.patch | 104 -------
>  .../gnutls/gnutls/Add-ptest-support.patch     |   4 +-
>  .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ----
>  .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 --------
>  .../gnutls/gnutls/CVE-2026-3833.patch         |  90 ------
>  .../gnutls/gnutls/CVE-2026-42009_p1.patch     |  62 -----
>  .../gnutls/gnutls/CVE-2026-42009_p2.patch     |  48 ----
>  meta/recipes-support/gnutls/gnutls/c99.patch  |  41 ---
>  .../{gnutls_3.8.12.bb =3D> gnutls_3.8.13.bb}    |  22 +-
>  18 files changed, 43 insertions(+), 1308 deletions(-)
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dt=
ls-fragments-implement-a-basic-DTLS-tes.patch
>  rename meta/recipes-support/gnutls/gnutls/{0008-tests-mini-dtls-framents=
-link-to-gnulib.patch =3D> 0001-tests-mini-dtls-framents-link-to-gnulib.pat=
ch} (68%)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-=
trust-list-fault-fix-issues-in-linking.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-short=
en-merge_handshake_packet-using-recv_bu.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-m=
ore-checks-to-DTLS-reassembly.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-dt=
ls-fragments-extend-with-a-1816-reprodu.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-dt=
ls-fragments-extend-with-fragmenting-Cl.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-match=
-DTLS-datagrams-by-sequence-number.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-dt=
ls-fragments-1839-mismatching-message_s.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.p=
atch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.p=
atch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patc=
h
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.=
patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.=
patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
>  rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb =3D> gnutls_3.8.13.=
bb} (78%)

Hello,

Sorry, this upgrade was requested (and rejected) before:
See https://lore.kernel.org/all/20260603074613.2846839-1-haixiao.yan.cn@win=
driver.com/

Regards,
--=20
Yoann Congal
Smile ECS


