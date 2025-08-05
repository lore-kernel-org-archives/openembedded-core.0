Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF64AC87FCF
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 00:04:21 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.10503.1754352259460896221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 17:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUCWXC3d;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-718409593b9so48423687b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 17:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754352258; x=1754957058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmjo3cPie60IXss6GUJWa+e0DH0Mav7IShpGntvLpiU=;
        b=RUCWXC3dLHgCYM2ZzGuiy+J0bJCHHS+Y6C3U+MpvInod2rkAWlAN0PO8ZZ1Kiv1+15
         Zid6Y9Yg2XIFmA+pyzod2XS2Oi33/xNhsICE8a28IUv0XPZMeL99QWgEW1JP8KdMrRhj
         Uza1wC0fN/F5htLqUhn2zhNIQ2R7AznTKiUStvMTHyy0xExjHU8Mya5wV21EWRC/mmXK
         dfovbo1p34s3JqSuCYHrpYmbebOT1qgbwdiVlRiy2KX6CDNz3zF65dgYhgSq3kFnJkLd
         60KERfVl5NPkQiywZjre6lHe1vCCoAmI2EaE6d99QQFXA9hwX2qmoDxuWyZrfym5/BtY
         1YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754352258; x=1754957058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gmjo3cPie60IXss6GUJWa+e0DH0Mav7IShpGntvLpiU=;
        b=iIXcTaMItUUQ11IPLtFdImuFkQD8W8osVrBqhYfP2XHsB7+Knu5bnVNZc5fNV17OTC
         bRUHUg5J3/h+KH9copmubUu162EWeN5w4KuBev7X77lSLS2EZJaKogFlgXrELUnwzrbM
         F6IHDg+fk44xRKGQHTf3k/lA89ZKI8Oa64JRJXJLOp7Gg0fpGTdJPekB4qPOK2TIhzrU
         FD59DUSLjUce8+2HL+MEPPNNwQSA2paQn5LVN724/igtdRwoo63t5J92YuPvvn8THIMo
         pEbqIso5sqezL6ybeOKJqtoFoSSxA1By4pJUu9K7Waha1X3Ag5+/KGRKUyj3458tFwzy
         MzmA==
X-Gm-Message-State: AOJu0YxgGNvD/wI/WyJjb4u2D576V1e4oPveiNo1szkDPPsQkd+bPlQ8
	g/9UHDbuwg5B86CTEUiqsRmcWoXkKIDdA8v+miiS5gTtAgErsr4RAWgMduac+yRGk+AFLKa/ieQ
	luKuBtFDSd5gi2p2AHf1CFlO8ZGpfVac=
X-Gm-Gg: ASbGncvW3NKkzu3kfkcoTOs6qNzJdPNurAH97mG/E/Ko184KqPhIVZdlIPEhLQeoI4h
	1/CILlfvzZRAmAoeIXwnaWUHWLaSG1tb8w9SdzjZ4n4nUmOy7Eh6YwdlifjKDsbdzfp3/XnIMw+
	FlgKnPclK52ZK1TlKCcJs4awBvruAa+TgudF75xXw+dbI6xIlh9QLT5PVqtxRD8sejUxTCMyJLu
	ICymjgv0qfiTX+F3eApZMN8/SYZRcMWvkUFYX1w9tiwJQOFBI0=
X-Google-Smtp-Source: AGHT+IFLtMM9E7Wt0W9XAetfiEx0hC4h91DhePuFIMm5x6GSSxEBnxDnZ7XxtkXLaSWt5bj07sp5aUUoVsPJfXutYrc=
X-Received: by 2002:a05:690c:a0ad:10b0:71a:18b5:ef27 with SMTP id
 00721157ae682-71b7f5fced1mr93607767b3.18.1754352258364; Mon, 04 Aug 2025
 17:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250804211106.327799-1-ross.burton@arm.com> <20250804211106.327799-2-ross.burton@arm.com>
In-Reply-To: <20250804211106.327799-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Aug 2025 17:04:07 -0700
X-Gm-Features: Ac12FXyu4lNgY3S2q208v6sp9gqrGXmZa7W7aT_yOZoXKnx6lFKy_R1ZgmPji_s
Message-ID: <CAMKF1so=YEBxz+f-R76Lmc6dEXxbXobn38aWeKnbrik3u3-nuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-jsonschema: clean up dependencies
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002bbdf9063b92f75c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 00:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221450

--0000000000002bbdf9063b92f75c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 2:11=E2=80=AFPM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> pyrsistent was replaced with rpds in 4.18.0.
>
> zipp doesn't appear to have ever been a dependency, remove. Maybe it was
> a transient dependency.


A good test is to run ptest image for this recipe built
With opkg backend

>
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
> b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
> index 7a5f4a09a6e..777cc649cc5 100644
> --- a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
> +++ b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
> @@ -39,9 +39,8 @@ RDEPENDS:${PN} +=3D " \
>      python3-netclient \
>      python3-numbers \
>      python3-pprint \
> -    python3-pyrsistent \
>      python3-referencing \
> -    python3-zipp \
> +    python3-rpds-py \
>  "
>
>  RDEPENDS:${PN}-tests =3D "${PN}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221448):
> https://lists.openembedded.org/g/openembedded-core/message/221448
> Mute This Topic: https://lists.openembedded.org/mt/114538584/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002bbdf9063b92f75c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 4, 2025 at 2:11=E2=80=AFPM =
Ross Burton via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.or=
g">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">pyrsistent was replaced with rpds in 4.18.0.<br>
<br>
zipp doesn&#39;t appear to have ever been a dependency, remove. Maybe it wa=
s<br>
a transient dependency.</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">A good test is to run ptest image for this recipe built</div><div di=
r=3D"auto">With opkg backend=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-jsonschema_4.2=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonschema_4.24.0.bb</=
a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-jsonsch=
ema_4.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonschema_4.24=
.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-jsonsche=
ma_4.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonschema_4.24.=
0.bb</a><br>
index 7a5f4a09a6e..777cc649cc5 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-jsonschema_4.2=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonschema_4.24.0.bb</=
a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-jsonschema_4.2=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonschema_4.24.0.bb</=
a><br>
@@ -39,9 +39,8 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-netclient \<br>
=C2=A0 =C2=A0 =C2=A0python3-numbers \<br>
=C2=A0 =C2=A0 =C2=A0python3-pprint \<br>
-=C2=A0 =C2=A0 python3-pyrsistent \<br>
=C2=A0 =C2=A0 =C2=A0python3-referencing \<br>
-=C2=A0 =C2=A0 python3-zipp \<br>
+=C2=A0 =C2=A0 python3-rpds-py \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-tests =3D &quot;${PN}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#221448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/221448" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/221448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114538584/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114538584/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002bbdf9063b92f75c--

