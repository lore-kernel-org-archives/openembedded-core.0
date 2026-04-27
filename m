Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA60FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:09:56 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46186.1777298994994380237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iyyv+Z+K;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so15056215a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777298993; cv=none;
        d=google.com; s=arc-20240605;
        b=TzjKRLpDEbpOdZHH4ksdLZGXz5lr4GBRLApW681O/Rgp4DlBZABuRQC5rbHXrcBO5Q
         1sFFICW8JuL31PZvzjTwpi1BqlIw0EELrbcMombeQBSzaIcyjllvewi6W+iIUkOI1/zr
         fFbPfPNZMMQ0FJqfxl3sQMRuJLemM0sDpptNEnVnG25n1cgNuhPz39n4YfR+YLQ6+KYy
         bw/vLcXA0ZNz+9Khylu1w0NpvjJ9b04fRfMVzyTfM1UHRjZ/9YSUaHWRzAnTaFMrR5pX
         hXQS0QwmkrWvAH7POnrkHk4dBZGOzfy4BuS+1eaEo4YDp7/ZWNdIYURfX46MHVXxzHNS
         Io+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eTzuyTgpVgjMROxUZtNT3CGfXe0Pizj/uUJrKuzUtCM=;
        fh=VSGcuPmNnfHHmZO2Uq4uJa0A6yUKfurLAhUG7t0zXkc=;
        b=Uy8mj2xREfWpIQir6uiOeFhK2pkjzpTP4R21CnClMODNTspad9D/Ev5fO051IcHaRo
         eNALqd/Bw9KRmNJ28/Es+BbSYaVHHjA343aVYHBEstlfh3TqzTj2hQNZz8AoWFnOEXQI
         o5V4VnZ+q7goAPAQHqahKsoSbdQTybzzFdrFUB/0ukvKr7o8VPF6xg2a4mIbwxsGY8br
         5999AvunlldqoDhzyhYHA3LgM5REZR7Xav6tTdlmWfMojTpvTcnCXybxrlOcpxbnRtoD
         SvvBAkolqWo3UFerMtfHax8sV6oLLkX0BcQaHYqgTJzO4rdnNJFAbqSrQbSIwXeT0MOv
         KWKg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777298993; x=1777903793; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eTzuyTgpVgjMROxUZtNT3CGfXe0Pizj/uUJrKuzUtCM=;
        b=Iyyv+Z+KT62V1ONYrrU50M+D0+3ux+cpHKZLqKBWywAmBKcMw/56+0nkiwCZdub9UQ
         Dn2zDzlmSrGGEB/LdxiGVIE3FUwLkOCSCVZk+4WYbaUTF9wP8MAccPQEyhuIRiFnbwQw
         cXCQuMoS7JBz7kysiReHc2nlcjX6gVrmvGNVW+KPgSp2qQ9Dbxg/iYRsFBwdgK5j+/Z8
         aBPCM2I19YT/2xq0mfzsdxGy5U0DBVsBuoqOQEdcR5rj4RPXrHD6qGz5a6z5fgg5DDro
         Yc3Aq/T1YPu2JMZNjcIyNer76viaNGesOBmnJ/8DrR5GjVC+WbupZRJf4cER1cnkX8g2
         nJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298993; x=1777903793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTzuyTgpVgjMROxUZtNT3CGfXe0Pizj/uUJrKuzUtCM=;
        b=mrQg5sN/xOLYg+3qS0luVtkKGPgvOlMOvU8qGZBYhOvPifrKeICqXnRll4iYGlxeSm
         rurCU5Ax8CET/wa7waiSUyY+KpFxHkWwzsRBriFQc9dqdyZrEjTjbo0msMSqPTXllgAP
         sWIKkikMtAsunbVsDokI4yhz/n3HlzMI0/GtGm5RLvETTu2mYmYcPn7voiLW9C+cf7ga
         SgFsUHXBJDvDRvgprIR3Q+6e8FCk7h00W3Vy9ZP7a5mIADnPdleTkiGwupUdlP79NqFk
         Dd+Qs/pUQ8l5tH4tNFzcduqnvQiYpJJeCZFJP3tIqr/a/MioNGa403PjsL9kxITMOpeB
         tTdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XHcKNEIRcqg1LQBbwpPLe94raJ2cgNnKE+dUO95Y4UTuGbT7BFj7qjYJVYH9bKQI0tn5EN79zEIeclerJSm/y2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqJ0hItpieMx7pptlTSP5B6IsA6XBk1Oyt77eGyZbYM2+qk5Bi
	KhwMeDNe1hKbzPPKXVimcwO/nQT2aRXRuy6aEPpOf1D3Ud1PXfGgpuIcdL14bWLDrq1lP76sFwO
	cindH9MUd8yZCUr2hvG25bWRYWw3TKNsItC7W
X-Gm-Gg: AeBDies8xg6bnD3gg/+K1L9AmI95gO546OenE3DgUTQW6/aRHDOSuoANe8p5BqekQyX
	cebfdaiItq6wnSvXu3wJMdUu93oylV/5FUsi1ZkO1Dq7u4YM09aE1Knf6f1lLBQz6FmIf31SQa4
	nnlhqgU8ZEAMs57AHI1nzwLVC4ksw1Xd8eCbqHMb2Jqvz7zQIAwPX3w/VMOz35zGQhddeWz/okQ
	yBO3SzQWG/4gVd9Yt4IpKfvkJA0z1cH8dlqoWUcJx8LA82OecuDLsRuxnDwwpKIbTD982/txzhw
	Gi2cnBMIvYWF87bAxUAW45qqfS3CnJWQUzRwluJRIqUs2n5LdXBFslnyiARBW+5/IfvdcD+/36f
	wNOKgkA7Zhy71XZoL
X-Received: by 2002:a17:906:f583:b0:bae:658a:61af with SMTP id
 a640c23a62f3a-bae658a665fmr517795966b.23.1777298992899; Mon, 27 Apr 2026
 07:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com> <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com>
In-Reply-To: <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 27 Apr 2026 15:09:41 +0100
X-Gm-Features: AVHnY4LGYlS4eYLARYpGuUWUCLdkMRisvmTJJ589oULm2_Xj5ZBGD024c2q9MME
Message-ID: <CANPvuRnhtPVvn6a4k0aPYbUhXv4wupDOfNCWGLHySViR8hddcQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
To: antonin.godard@bootlin.com
Cc: viswanath.kraleti@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000021aa26065071ab26"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236012

--00000000000021aa26065071ab26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Antonin Godard via lists.openembedded.org <antonin.godard=3D
bootlin.com@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s)
12:40):

> On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via
> lists.openembedded.org wrote:
> [...]
> >  svn://.*/.*     http://sources.openembedded.org/ \
> >  git://.*/.*     http://sources.openembedded.org/ \
> >  gitsm://.*/.*   http://sources.openembedded.org/ \
>
> On a related note, it seems that http://sources.openembedded.org/ is no
> longer
> active. Could we remove it?
>

I also noticed that when I tried it, but I was unsure if it was
intermittent or if it didn't even exist.
Add Michael in cc and perhaps he can confirm.

Jose


>
> Antonin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236007):
> https://lists.openembedded.org/g/openembedded-core/message/236007
> Mute This Topic: https://lists.openembedded.org/mt/119028000/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000021aa26065071ab26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Antonin Godard =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;antonin.godard=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bo=
otlin.com@lists.openembedded.org</a>&gt; escreveu (segunda, 27/04/2026 =C3=
=A0(s) 12:40):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
[...]<br>
&gt;=C2=A0 svn://.*/.*=C2=A0 =C2=A0 =C2=A0<a href=3D"http://sources.openemb=
edded.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedde=
d.org/</a> \<br>
&gt;=C2=A0 git://.*/.*=C2=A0 =C2=A0 =C2=A0<a href=3D"http://sources.openemb=
edded.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedde=
d.org/</a> \<br>
&gt;=C2=A0 gitsm://.*/.*=C2=A0 =C2=A0<a href=3D"http://sources.openembedded=
.org/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedded.org=
/</a> \<br>
<br>
On a related note, it seems that <a href=3D"http://sources.openembedded.org=
/" rel=3D"noreferrer" target=3D"_blank">http://sources.openembedded.org/</a=
> is no longer<br>
active. Could we remove it?<br></blockquote><div><br></div><div>I also noti=
ced that when I tried it, but I was unsure if it was intermittent or if it =
didn&#39;t even exist.</div><div>Add Michael in cc and perhaps he can confi=
rm.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Antonin<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236007): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236007" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236007</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119028000/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119028000/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000021aa26065071ab26--

