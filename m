Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838A6C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 16:56:05 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.28674.1709312157002701186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 08:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRMhfbR3;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so1491172b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709312156; x=1709916956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVdW6PnDaVQI0RaBRjmnHO6tBTsrAXp0Nf6d7wt+a0I=;
        b=MRMhfbR3D57W6DTz2B1yGUY1XfeQgwSsS31MwqGSsTdXsjK9UqFpEFyyacBcXNvf+n
         LBzQVvcCCG+WFIojhUuss7FGFcexfIl5sxq0tsykmKtLb4J9Xi2ml3mf4eCKufMu13Ht
         1nZhNNQY6wZXr1av6/NwaXrVQpELREF8JGM0ZrFw68Yy15doiWKc8BexNhG51i6/K4kS
         Wefpz0trub4dWczsmlhbArkTiZYJSxEjuYiN8j7M7N1nrvfE88c+xt8v85NychUmTPRc
         V0p9C6aYPAR2/0EFACdNnZ3hmpgQAwBc+5vBu8Fl9a60YywGGA4JRneZCz4y4Ka5LLM9
         Ttbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312156; x=1709916956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVdW6PnDaVQI0RaBRjmnHO6tBTsrAXp0Nf6d7wt+a0I=;
        b=YKoJGjRmRUPE6g0AzvKabTkY+9w4f0JibolCSxTrA52BA7gIpBd04ilevAfXUSD2ic
         BLuEEUgwr1oHC2VWaHdRiRAMULk6F0BiKRM5052QyDEO0xXvSVyFlkxhbacpMdfqo7vA
         EUuZN7S5dlprhhWlaiuh8mK/wRp0pdAmr7wLvqu3d0n7CX7338X106iae77xERVkwtTw
         fjtNdpaGmD903fmlta4cbn/rhiQ/mqGy1iZ7Ra4L96BaBMwXlwsXjBFulO2kG7DVm34r
         6tpB0WtwL5coT0GBWXUyIhcjSQSZgjUJtMpXj3RYfkVuMDThSLFjVeE7f6+EpxZ6hJok
         SiCQ==
X-Gm-Message-State: AOJu0YyA+whKmRZKFHCY+rgwXyaR5MiOQUe/esReSEwoii43IdBDVn9A
	VzncQkMIN7cD9zgZ8ujopJNcrFvZKILyIgj3ulG94UCvNCfe+AathP7C4CYfrrNz/Xta1T9eXf5
	RAOwVMbaiOgm9XVmwf5TrEmhhWTCzdCH4
X-Google-Smtp-Source: AGHT+IHoodznc4UcpK9hxDPZ6a9LnKzxF9jlzR2cpr3Pj7szHcNE5JtcqAsZYk/nmqWDaAzvuyoEkj6udYP3OweUUjI=
X-Received: by 2002:a05:6870:3913:b0:21f:c787:c900 with SMTP id
 b19-20020a056870391300b0021fc787c900mr2285038oap.1.1709312156090; Fri, 01 Mar
 2024 08:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20240301093547.1810401-1-richard.purdie@linuxfoundation.org> <20240301093547.1810401-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240301093547.1810401-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2024 08:55:45 -0800
Message-ID: <CAMKF1soLZTWgkYKEsJoqkRv8U9RUvodyMuotQe607=hfsa8Y_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] no-gplv3: Tweak for packagemangement in core-image-full-cmdline
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dfc3cb06129c3f91"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 16:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196463

--000000000000dfc3cb06129c3f91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 1:35=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> If we enable package-management for core-image-full-cmdline we need the
> workarounds
> used for core-image-weston to ensure the oe-selftest license QA tests kee=
p
> working.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/no-gplv3.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/no-gplv3.inc
> b/meta/conf/distro/include/no-gplv3.inc
> index bb2e836f982..d515fd4ad6b 100644
> --- a/meta/conf/distro/include/no-gplv3.inc
> +++ b/meta/conf/distro/include/no-gplv3.inc
> @@ -19,6 +19,8 @@ PACKAGECONFIG:remove:pn-bluez5 =3D "readline"
>  # so install rpm but not dnf
>  IMAGE_FEATURES:remove:pn-core-image-weston =3D "package-management"
>  CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston +=3D "rpm"
> +IMAGE_FEATURES:remove:pn-core-image-full-cmdline =3D "package-management=
"
> +CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline +=3D "rpm"
>

If a distro is not using rpm package backend then it seems to be not
sufficient or did I miss anything


>  # matchbox-terminal depends on vte, which is gpl3
>  CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D "matchbox-termin=
al"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196457):
> https://lists.openembedded.org/g/openembedded-core/message/196457
> Mute This Topic: https://lists.openembedded.org/mt/104660966/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dfc3cb06129c3f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Mar 1, 2024 at 1:35=E2=80=AFAM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">If we e=
nable package-management for core-image-full-cmdline we need the workaround=
s<br>
used for core-image-weston to ensure the oe-selftest license QA tests keep =
working.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/distro/include/no-gplv3.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/inclu=
de/no-gplv3.inc<br>
index bb2e836f982..d515fd4ad6b 100644<br>
--- a/meta/conf/distro/include/no-gplv3.inc<br>
+++ b/meta/conf/distro/include/no-gplv3.inc<br>
@@ -19,6 +19,8 @@ PACKAGECONFIG:remove:pn-bluez5 =3D &quot;readline&quot;<b=
r>
=C2=A0# so install rpm but not dnf<br>
=C2=A0IMAGE_FEATURES:remove:pn-core-image-weston =3D &quot;package-manageme=
nt&quot;<br>
=C2=A0CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston +=3D &quot;rpm&quot;<br=
>
+IMAGE_FEATURES:remove:pn-core-image-full-cmdline =3D &quot;package-managem=
ent&quot;<br>
+CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline +=3D &quot;rpm&quot;<b=
r>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If a distro is n=
ot using rpm package backend then it seems to be not sufficient or did I mi=
ss anything=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br>
=C2=A0# matchbox-terminal depends on vte, which is gpl3<br>
=C2=A0CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D &quot;matchbo=
x-terminal&quot;<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196457): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196457" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196457</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104660966/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104660966/1997914</a><br>
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

--000000000000dfc3cb06129c3f91--

