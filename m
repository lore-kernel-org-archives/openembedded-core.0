Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12456C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:36:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.33753.1741599411968270627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZE74e3x;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499659e669so2807525e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599410; x=1742204210; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJUQAL95sWkNj5lVrEBASMOSo0wPZ9ty3vn7pWAkX3I=;
        b=aZE74e3xnLHAXpHKA0Gj/R5A5tLEs5O3d1JaLn0mzSt7QqXFKz+oH2H2Jotd7s6ofU
         AWloFbg3B4tNMoO8+u+muPpvJXTIYwZEWzE6OBRJru8KwKSRyW+umDr3MIUT4L4FZ/1Y
         dYr07QMkNAOwlL7zyfFzQKDN38YFeuRr3mUv84xdnyvfWNsMmxeLmI//SLG7Th+4x5mc
         DuWa8oDK2yj4cY9AwNxQmjhlR2x+NuuHlqns3njBd30q/Dz7A0hA7/+8inIjySSe29oB
         iUuBq4x37sHUR0F+/nf/ZdVBAMsbEucJ0ytSbq0B0mQ7XSoBAZidE5lQ+oYREDyR0UFe
         bBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599410; x=1742204210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJUQAL95sWkNj5lVrEBASMOSo0wPZ9ty3vn7pWAkX3I=;
        b=EWDZjWRICG6MiRhq9PC1fOpsf3gIgnfmPJrWjMKUQzXs4mr5WZHFhyupmVpZEWgai+
         R01zfaaV9Lch1dWXSBEgwzYQUJYhKa/TUjuwUoWpeVZraEBAOY3zp1gov2/Cvv2586AZ
         SBuvE3HAhSPxuAlqLAQdQN9YBqhTi09IkiZnaE91t4Wvscua97snQ78P8Gn6m39syyJn
         IF+u0hxYsVyViWERg9DO5qQC9hDMdENIlVk80LPiznRaE0TgomkXA94zLgphpgsz3rmT
         APcHpqNbaXEY03hfnAix/OJfNYn2vsRzYGQFl8nV8v1y+fuwW5iDh14c8Cw/GHHQQEeM
         H9Xg==
X-Gm-Message-State: AOJu0Yzwv/wyKJpT/Z2p9WGbBoKMzpYV4oDFXpoyDsVzdSw+MnS8QT7s
	0z3HCstsnsxjjZJFecPFq8thmxc2WUc8QECx72EieWnAGCPFpRLiXWfbAxYFmA+EL9NjWLDs4wt
	Tq2tHeRY/FFXmy9Ky1fx/HUKAF20=
X-Gm-Gg: ASbGncujMzb9/Zzf34GXYZVbQGNPkou7tSa8iT8qZMjQ8+jJdgWcCWu0idJWBS3sHdq
	xYvZzv5zakp1BAGtXcZxb9Y0nR/inko0upn783r8DmDpvF0Jj/hiO1uGz+nY8VD3MTITzaBPE31
	IwDPJ1oWMyYlRJQXCiaDehY06mCtgv
X-Google-Smtp-Source: AGHT+IEV84oU9akGkcLQao5QY52UqtWIawWhW5cQZcq251MhCO9lDSnc4mTdoUw6jLM4MMn1Rjl+Hzov+yA60hnaxPY=
X-Received: by 2002:a05:6512:39c7:b0:545:2e5d:f3f3 with SMTP id
 2adb3069b0e04-549910b6ccamr3980613e87.46.1741599408148; Mon, 10 Mar 2025
 02:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090101.446602-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250310090101.446602-1-guocai.he.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 10 Mar 2025 10:36:36 +0100
X-Gm-Features: AQ5f1JrjgDahcXYpqcsRBKBkuAraabLF5AophmiUPa8_DiHzY2F5w50oB3eAu2s
Message-ID: <CA+chaQf4-0NRdJBJF+ZAwO0KGVDvA2rnQoNY5ms0xjZ0uZY_Vw@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] boost: update SRC_URI
To: guocai.he.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212495

Is it really needed? It's already merged in kirkstone:
https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3D3=
b4c5ce6b89477307f3a2c30c7e275473b0c9f00

On Mon, Mar 10, 2025 at 10:01=E2=80=AFAM guocai he via lists.openembedded.o=
rg
<guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> The official archive location of the Boost tarball has changed to:
> https://archives.boost.io/release/
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta/recipes-support/boost/boost-1.78.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-s=
upport/boost/boost-1.78.0.inc
> index 729a47b54f..98f4f7ff30 100644
> --- a/meta/recipes-support/boost/boost-1.78.0.inc
> +++ b/meta/recipes-support/boost/boost-1.78.0.inc
> @@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
>  BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
> -SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/so=
urce/${BOOST_P}.tar.bz2"
> +SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
>  SRC_URI[sha256sum] =3D "8681f175d4bdb26c52222665793eef08490d7758529330f9=
8d3b29dd0735bccc"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212493): https://lists.openembedded.org/g/openembedde=
d-core/message/212493
> Mute This Topic: https://lists.openembedded.org/mt/111615439/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

