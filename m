Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web08.12364.1605638214712048057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 10:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SDxYHU58;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id cq7so23533227edb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zGL/KV9+catOgrDL19nQYWijqye/VWRv10L3ZpLqifk=;
        b=SDxYHU58dWYmZsrYLjJez+BiLRRSKXh3ec7Pq+Y6AgjcS7gKoz3QSmUWmJGXWAZBbA
         nq64rW+b56M1LDssBKpw9IUtJ5qXdB6gG3e4y1xOjALWfb2xnQ+02eVCj/8xUeZcF428
         A4PX2PS52FaG8qfpcO4YXf+arpr/hYe2GKsSmdOpFwgbf2RdL7RiBj6zBUdF7HcXiOre
         D+EjGCy7A+KySpTOYmcbiZw8d9YMrBBWOMHYJI3L+kDAnInmcoSOfTmZzIcyB9p9m52P
         DM4g3InJiTpktuOjoeinEgWHXhbZsR0XjAoWnD/tWSTOfFSPHq053kRk/u0fVDqm9JDE
         1J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zGL/KV9+catOgrDL19nQYWijqye/VWRv10L3ZpLqifk=;
        b=A1LoLYGeTJOCkIzaBAlSM2xGYuU76tt9+b0fIAJbOBHJIEQ35YF3oIaoa65L1phN6F
         BbjsGf8pk2YBQUS1TcP7S4M4WnvL5gkIQSupCiJmsHSC0A9Z45tIjbEXTSvO4BUaOAwB
         DQnV5oFS+atu9WHOGJdAktcCaF146NOfYd53cfya8UNQzE/gJAKOGP9K3ozmgiyjHrwl
         yuZ5MzqbA6lfo06KQ28e8bde53vkMU5g/UBt77L/RglJrmC3rCKTLFe3i+wtwjhWMzpR
         V7i7QeTnbuYZYjmxyBzTLDLrT7MmVSlEyWLeyI0Tn5fWS8fuo1LEsIb9yx4bj4AdQffU
         pzOw==
X-Gm-Message-State: AOAM531Qs/qLMfOmGFS9wJnNEAsq5fmoS5AkEM0iRkI+4KsG+UDestx3
	fnWZdXqRX2/qiUahS7xNa8E6+QJDPNoUI2HJ8fg=
X-Google-Smtp-Source: ABdhPJyZAv101NmotACnfBgTw2lkznNSbRvjcFIhlO1xcYW1WelLe43g2DVQ0ek6r0MA1YJ4YXSFxVsAd3MxLFE8BY8=
X-Received: by 2002:a50:9e8a:: with SMTP id a10mr22858399edf.150.1605638213146;
 Tue, 17 Nov 2020 10:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com>
In-Reply-To: <20201117180441.296304-1-raj.khem@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 17 Nov 2020 18:36:41 +0000
Message-ID: <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/2020 =C3=A0=
(s) 18:04:
>
> python3targetconfig append target python3 to dependencies
> unconditionally, and here its inherited unconditionally too but
> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other not-t=
arget
> recipes as well. Hence the change added via 9c8f666097802cb594a759989edc=
f01603a22df3
> is now bridging the native dependencies with target python3 and thats
> resulting all sorts of rebuilds for multimachine builds e.g.
>
> MACHINE=3Dqemuarm bitbake python3-scons-native
> MACHINE=3Dqemumips bitbake python3-scons-native
>
> results in rebuilds for python3-scons-native
>
> bitbake-diffsigs shows
>
> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate=
_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b4051=
53f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
> 0e3b97bd058d162065
>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_inst=
all changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef=
86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
> 229cb0f5ebb11
>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_=
compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a59760879333638=
2d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
> 7cc9769194c43eae1
>             Hash for dependent task python/python3-scons-native_3.1.2.bb=
:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b=
2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
> b346650fbdf114ac70ab57b
>                 Hash for dependent task python/python3-scons-native_3.1.=
2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd0=
2a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
> 4935aaecf31a79e867826fe634cde4f44171d8e7
>                     Hash for dependent task python/python3_3.9.0.bb:do_p=
opulate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2=
c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
> 08777e46a6fa6e417c0445018
>
> ...
>
> Therefore limit effects of this class only for target recipes.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2: Mark depends conditional instead
> v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
>     and mark tasks with target override
>
>  meta/classes/python3targetconfig.bbclass | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/pyt=
hon3targetconfig.bbclass
> index 640d0c97b6..fc1025c207 100644
> --- a/meta/classes/python3targetconfig.bbclass
> +++ b/meta/classes/python3targetconfig.bbclass
> @@ -1,15 +1,17 @@
>  inherit python3native
>
> -DEPENDS_append =3D " python3"
> +EXTRA_PYTHON_DEPENDS ?=3D ""
> +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"

-EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
-DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
+EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
+DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"

add a space before python3 is better than always add it to DEPENDS

>
> -do_configure_prepend() {
> +do_configure_prepend_class-target() {
>          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>  }
>
> -do_compile_prepend() {
> +do_compile_prepend_class-target() {
>          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>  }
>
> -do_install_prepend() {
> +do_install_prepend_class-target() {
>          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>  }
> --
> 2.29.2
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
