Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3BFC48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 16:59:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.21668.1708275583236899734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 08:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bglg2ekF;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-607d8506099so33235837b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 08:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708275582; x=1708880382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PxZ3p8HFwY1mCc5c52cpc+1PAIV/4BGnYDbaHNyeMY4=;
        b=bglg2ekFRrF0BJJqntMf8iz8R/S4st33EMs1SB3siVRCdOxRbkQaI6t7jRKrsFPc7J
         Qdo1oZ4IRyywruztU1ZWMEpzTbZ1c+FeMaLkLx6nx5+dNHhv8NuOtjn1IVxkcXdDO8HP
         zIJJa+aO1+WVcmXXM1usBEuDvGZ7rrrBNCX84Oxjetf16oRcHavSpP7JZ+Y2grTtWkyi
         SpVNKyL8QDde+REGsQlvD22Vpgf5pdZj6VlZ9aCPYhgP00+snzy0/XHYKugrnqoiBxEI
         XDgCCOIwEN2aWcVxUBBSNMs972PA9UXo4XrjMSkOVQxHbvsyQxfVQ3UkhUAdWLsB3z86
         DuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708275582; x=1708880382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxZ3p8HFwY1mCc5c52cpc+1PAIV/4BGnYDbaHNyeMY4=;
        b=rys0uW9na1/iZtYZYKHrSyzI7aEXHjRE28QjW+tT6VAeaC/AByjvPkAZgfBH/ALtLI
         A3vgyhSTt3lmezPn+mjlXTJ9YIEnL326pUS/540uPXTfsdhfkLq6NG/+Ailtj3GCyIwr
         472pX22GgxH8klDudMbgR1RoSoI7HzV+/xOfqhYYjtk9qFey5j/WICdHWnjx7tjbnoid
         lj174lKnUN17kWH25V6cKXeRpWLYXNFwdwI299tZgjdIVeMZr6hnMTah65mABYZ60WoF
         fktl2zQp4laiO9aj6GOpXTXJiHZFqmtFnF8bswqp97g7E6leOlVDkzC+a4Z+OohToKNj
         zXow==
X-Forwarded-Encrypted: i=1; AJvYcCW27xM1juxLMhZvf79mzvvjSyAQBcIWRtsF9ZoMtQkt2zfum99X23WQcXPJ2F6LVtl3+rpexwT3bgnvUU8I1/71th7fK7Jf3F1GmNWKe/mKRQyvFSRqTbzF
X-Gm-Message-State: AOJu0Yx0lIS14h2aNO56SasMZj96FQT8WixzPi6+pFTyAdbN7fvYcl/c
	icytBqQ9zMDCg3ned2zwNJH2Pp1cho3OB56rbDGETx3rg1AO0YlFo0dH/ziabrKcImX6ZELS3ZJ
	a8zTz7p8Hl30sYCGEA09NTFd8Kmo=
X-Google-Smtp-Source: AGHT+IEeI3n43XGG4Ypbay0s6mSkcNuZYwmu0WJU41jwjlUDfWZwuc2/z1kit7R0dBcA5sH34SFK8vGXUCVcQ+CUP74=
X-Received: by 2002:a0d:d817:0:b0:604:ac3b:a38b with SMTP id
 a23-20020a0dd817000000b00604ac3ba38bmr9455958ywe.14.1708275582356; Sun, 18
 Feb 2024 08:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20240218123250.1516996-1-simone.p.weiss@posteo.com>
 <CANx9H-AfpAq7A6-kWjYhQEcByop69ziqgRiTw99nGhsvgEmkrA@mail.gmail.com> <57319fd20fe344b745561db21112654fc8c6d115.camel@posteo.net>
In-Reply-To: <57319fd20fe344b745561db21112654fc8c6d115.camel@posteo.net>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 18 Feb 2024 08:59:31 -0800
Message-ID: <CANx9H-CF+r_G1ktNVWiC8+MgBnBXx2PAfm5fkcxggyWuszYTuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.2130 -> 9.0.2142
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.weiss@posteo.net>
Cc: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043d2af0611aae7a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195839

--00000000000043d2af0611aae7a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 7:49=E2=80=AFAM Simone Wei=C3=9F <simone.weiss@post=
eo.net> wrote:

> On Sun, 2024-02-18 at 07:01 -0800, Tim Orling wrote:
>
>
>
> On Sun, Feb 18, 2024 at 4:33=E2=80=AFAM Simone Wei=C3=9F <simone.p.weiss@=
posteo.com>
> wrote:
>
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> Changes:
> https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142
>
> This fixes CVE-2024-22667
>
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta/recipes-support/vim/vim.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index 6b440d8947..84af72472a 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
>
> -PV .=3D ".2130"
> +PV .=3D ".2142"
>  SRCREV =3D "075ad7047457debfeef13442c01e74088b461092"
>
> You need to actually change the SRCREV to point to .2142
>
> https://github.com/vim/vim/commits/v9.0.2142
>
> b39b240c386a5a29241415541f1c99e2e6b8ce47
>
>
> And then ask yourself if we should take an even more recent version:
>
> https://github.com/vim/vim/commits/v9.1.0114
>
>
> Thanks, will do so.
>

I was already planning on addressing the CVE issue this morning, so I have
gone ahead and sent the upgrade to 9.1.0114


>
>
>  # Do not consider .z in x.y.z, as that is updated with every commit
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195831):
> https://lists.openembedded.org/g/openembedded-core/message/195831
> Mute This Topic: https://lists.openembedded.org/mt/104426571/8071792
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> simone.weiss@posteo.net]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--00000000000043d2af0611aae7a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 18, 2024 at 7:49=E2=80=AF=
AM Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.weiss@posteo.net">simone.w=
eiss@posteo.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div><div>On Sun, 2024-02-18 at 07:01 -0800, Tim Orling wrot=
e:</div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:2px solid rgb(114,159,207);padding-left:1ex"><div><br></div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb=
 18, 2024 at 4:33=E2=80=AFAM Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.=
p.weiss@posteo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt; wro=
te:<br></div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:2px solid rgb(114,159,207);padding-left:1ex"><div>From: Simone We=
i=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.com" target=3D"_blank">=
simone.p.weiss@posteo.com</a>&gt;<br></div><div><br>Changes:<br></div><div>=
<a href=3D"https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/vim/vim/compare/v9.0.2130=
...v9.0.2142</a><br></div><div><br>This fixes CVE-2024-22667<br></div><div>=
<br>Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@po=
steo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>---<br>=C2=
=A0meta/recipes-support/vim/vim.inc | 2 +-<br>=C2=A01 file changed, 1 inser=
tion(+), 1 deletion(-)<br></div><div><br>diff --git a/meta/recipes-support/=
vim/vim.inc b/meta/recipes-support/vim/vim.inc<br>index 6b440d8947..84af724=
72a 100644<br>--- a/meta/recipes-support/vim/vim.inc<br>+++ b/meta/recipes-=
support/vim/vim.inc<br>@@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://<a href=3D=
"http://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"nor=
eferrer" target=3D"_blank">github.com/vim/vim.git;branch=3Dmaster;protocol=
=3Dhttps</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-path-=
adjust.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br></div=
><div><br>-PV .=3D &quot;.2130&quot;<br>+PV .=3D &quot;.2142&quot;<br>=C2=
=A0SRCREV =3D &quot;075ad7047457debfeef13442c01e74088b461092&quot;<br></div=
><br></blockquote><div dir=3D"auto">You need to actually change the SRCREV =
to point to .2142</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><=
a href=3D"https://github.com/vim/vim/commits/v9.0.2142" target=3D"_blank">h=
ttps://github.com/vim/vim/commits/v9.0.2142</a></div><br></div><div dir=3D"=
auto"><div><div>b39b240c386a5a29241415541f1c99e2e6b8ce47</div><br></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">And then ask yourself if w=
e should take an even more recent version:</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div><a href=3D"https://github.com/vim/vim/commits/v9.1.=
0114" target=3D"_blank">https://github.com/vim/vim/commits/v9.1.0114</a></d=
iv></div></div></div></blockquote><div><br></div><div>Thanks, will do so.</=
div></div></blockquote><div><br></div><div>I was already planning on addres=
sing the CVE issue this morning, so I have gone ahead and sent the upgrade =
to 9.1.0114</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:2px solid rgb(114,159,207);padding-left:1ex"><div><div class=
=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote type=3D"cite" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);paddin=
g-left:1ex"><div><br>=C2=A0# Do not consider .z in x.y.z, as that is update=
d with every commit<br></div><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br></div><div>Links: You receive all messages sent to =
this group.<br></div><div>View/Reply Online (#195831): <a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/message/195831" target=3D"_blank"=
>https://lists.openembedded.org/g/openembedded-core/message/195831</a><br><=
/div><div>Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104=
426571/8071792" target=3D"_blank">https://lists.openembedded.org/mt/1044265=
71/8071792</a><br></div><div>Group Owner: <a href=3D"mailto:openembedded-co=
re+owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@=
lists.openembedded.org</a><br></div><div>Unsubscribe: <a href=3D"https://li=
sts.openembedded.org/g/openembedded-core/unsub" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a>=C2=A0[<a href=3D"mailto=
:simone.weiss@posteo.net" target=3D"_blank">simone.weiss@posteo.net</a>]<br=
></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div><br=
></div></blockquote></div></div></blockquote><div><br></div><div><span></sp=
an></div></div>
</blockquote></div></div>

--00000000000043d2af0611aae7a3--

