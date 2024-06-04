Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D36C27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:46:33 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.3931.1717526784026780826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 11:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AlkcdqOD;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24c0dbd2866so2658805fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717526783; x=1718131583; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD4hLfsA+ZD9GPpx20vqQHv07znB9/JJDBtQHt48kBY=;
        b=AlkcdqOD2SJ3NCxOexSMqZ1yPq6BIGqo7NrxEkC28zRweM9j2ODBQqMAK6qamS+sMK
         gM98JaGAYmi/CWLyImT3VGQgXNoY/AU8Xh3PugE2Wvq5Pj54acELQA5j7qhn1fE9G0hR
         dYyFFWvVSZrikV3nC3glSJbScz0wrnxCLQeKxxmYh3tt8aIQO9hKSszzymNwTLAQBWWG
         OZETwnkW23tcdjYg0yUmyQJMy7vNJ0K3d+8kkmjvk9oKgBxo/rCIp56UZp4ajkrvGDwL
         gfrMfx9eW0IDB+uAf/Wc7jtiMdXgiuA8BrtDRDEj9+TRi93BoB+1OuQm487+N+0TR9VC
         HUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717526783; x=1718131583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD4hLfsA+ZD9GPpx20vqQHv07znB9/JJDBtQHt48kBY=;
        b=tLK80BQoPRWo9wKoAId8NicmXCeNYOlGlGQnO5hqeMjLCrPJ+mSMdfMHi1Aj3nZEAY
         u9jWjEmVh3wDON2gA/QR7kZ62MSzgBAL/lgicc1uklJz/vdIHk5xZFYHyt4QCsw4rHxu
         86tuKcxFEwjKinXxCl98iya3WgHKcblcDJxRDBcT/68REuAchePvFmjeUp/W77zzEqES
         TiJpQ2BpOU8xU+rckHHsmtaNKvNVMDWo/vcgk8jlvhVPW6OAhF7pTA0rIULJXn9y3BYB
         l8CtHvQ+X8jNWfTqxGjKIBxkAbFxyVbnj/rJXFW28q0qeStJn8/IdkqjWx1JJAaov38x
         ZnEQ==
X-Gm-Message-State: AOJu0Yxdm98J7W9LtXGjExW6y47DGkQ43laaY+3Ht+uenuhWX5oUa7kK
	hxHSZLgw9zlejZ6bYpqsPkjrfwJkhfKiu2wzZyHjAvb6ZMV00aR+Q6RZUiF3NgGxHV5hZfr5jWb
	JUizDRVQFH+zWM8e6Z5wqqNXAx8g=
X-Google-Smtp-Source: AGHT+IHby4Blep+ZU8U/niKcf8OGoXiV2xTnsQN8sppBCUZiAN68H3NFZbdWCr1pP6eImwOKjngypZ6lpaY66V4xRYo=
X-Received: by 2002:a05:6871:594:b0:250:5c1:5d3f with SMTP id
 586e51a60fabf-25122094c24mr394554fac.56.1717526783216; Tue, 04 Jun 2024
 11:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240531230125.2404729-1-martin.jansa@gmail.com> <20240531230125.2404729-2-martin.jansa@gmail.com>
In-Reply-To: <20240531230125.2404729-2-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 11:45:57 -0700
Message-ID: <CAMKF1spyXm84sariUX_zLxfH374KWdYQJyS56cyW0rVXYBURKg@mail.gmail.com>
Subject: Re: [OE-core] [RESENDv2][PATCH 2/2] insane: add patch-status to
 default ERROR_QA
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 18:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200344

On Fri, May 31, 2024 at 4:01=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * it's enabled for patches in oe-core for very long time and I was using
>   it for many other layers as well, so most layers should be in good
>   shape

Do other layers have the patches taken care of is what you mean here ?
otherwise I would suggest sending those fixes ahead of merging this.

>
> * it's also possible to disable it for individual layer as shown
>   by oe-core in:
>   https://git.openembedded.org/openembedded-core/commit/meta/classes-glob=
al/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b1e=
b3
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes-global/insane.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 99736830b9..6d2f83c6f7 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -45,11 +45,10 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files=
 arch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-p=
ath \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz \
> +            patch-fuzz patch-status \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
> -ERROR_QA:append:layer-core =3D " patch-status"
>  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
>
>  FAKEROOT_QA =3D "host-user-contaminated"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200091): https://lists.openembedded.org/g/openembedde=
d-core/message/200091
> Mute This Topic: https://lists.openembedded.org/mt/106418259/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

