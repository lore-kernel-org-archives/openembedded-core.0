Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BD8C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 15:03:39 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.11559.1686236616137553338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 08:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P/tR4Zop;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-777a8f11e14so73669839f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686236615; x=1688828615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AMoxd9E8bNOxQcwHmymWzvj13y+OO4CSI1ISWJwaPAQ=;
        b=P/tR4ZopvdexGi3xhrAWWpioqFXZPhelfwyBZYhPptdA5k3yQA3DrQ8tWAWEezk/Ay
         ODpYFS4vmPj9Jn6n8vOhWHCWRYTRp/yd5klF1pHlA0ONWR4dXMHBoQSVEkgvV7cXdcZ9
         5kf9eKbSODXAfcJzgJZdTVE+eL0rjGoPfXB54gxkNlq+HFd/BV+ucG5OE0bzqTYCVC9c
         KHRVqV3b7gz0VnRKQ55WkxPkYclwE1RbDssMa2AjgoTZa2grVusZ653kRD78jCpo4SL4
         QwxUkpUI6BZBiJ4yqR3IJ9NOnetwml2c9cZIrM9Y2bhoslmZrvYYlJ7/DUz23LV0rW4C
         RSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686236615; x=1688828615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMoxd9E8bNOxQcwHmymWzvj13y+OO4CSI1ISWJwaPAQ=;
        b=iU5q+Vyr/0QFKie8JOutj2OGqWYjHPHVcZuwsOkwx96lxsC8gdGGq8Pl/0mT0BCwu6
         qwgJor8gDeN0XRMkLNVRbilQYPWCYWxJDj53ZYke1UtYdavMi7XU2nQKhDXeUqYHPj13
         SaLK/brShK9jStkb49DQ8epgeJ5rowbfhr3d6h6shMzoOnC01ZK/fvGE1HI1Xd/wSXZ+
         5RnMa/UgSpOgPSlAZlgo4+RrKbSEwpKbdw0ve/tV12iGeq+5AE5f8pFfJC0380OH+Y5N
         JyCegZwHjtD3NJxhs7gS1+gPlnXqE0jWyIOE2m1CVesdFrEiZF20AgqyGSYiRbQnA06M
         /hUw==
X-Gm-Message-State: AC+VfDzBv9BtT+tSv88Ycb3HkhQ5h8Uuk6fe3/qOiJoDNFX5eBdni27i
	hPIzfuclHsljqinJX2Z8rNdI/Ez5SeOa3zblKlY=
X-Google-Smtp-Source: ACHHUZ7nASMG3rP+QBgelGfsu1M/DD3wSdkFQJBFGV9OL+k1KxjtVK1VHrAerYJ9POxhGvdQgmI6ARFMv7qtml/ZbrU=
X-Received: by 2002:a6b:3b10:0:b0:76c:5b24:dfca with SMTP id
 i16-20020a6b3b10000000b0076c5b24dfcamr1711821ioa.2.1686236615278; Thu, 08 Jun
 2023 08:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205347759a5df5@mail.local> <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
 <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com> <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
In-Reply-To: <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Jun 2023 11:03:23 -0400
Message-ID: <CADkTA4O5=PNOmmKtJPE8YYJfiynMQXA1hyjaX=wuW2ydw6evbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076064805fd9f8e54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 15:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182511

--00000000000076064805fd9f8e54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:
> > At this point, you can probably see why I ended up using the explicit
> > variables and overrides versus python when doing the
> > meta-virtualization splits. :)
> >
> > I have a few more comments that I made in v1, that I haven't seen
> > directly handled or replied to.
> >
> > My only remaining concern (and it may just be my own concern), is that
> > there's no way to change this packaging split. Either you take the
> > programatic split, or you take the -all packages.
> >
> > Other packages (glibc, kernel-modules) have a variable that controls
> > whether the split happens or not, I'd like to see something similar
> > here .. but I do realize that it makes test complexity more, and that
> > Richard normally doesn't like conditionals like that.
>
> I only "like" conditionals if it is a code path that will be well
> travelled, otherwise we tend to find one of the paths is broken. I
> don't think we need to make this conditional.
>
> > Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
> > splitting routine ? With that, we could remove the processing in
> > places we don't want it, in particular for the native/sdk builds, as I
> > found that we really don't want the splitting of qemu in those
> > scenarios.
>

Can you think of a problem with the PACKAGESPLITFUNCS method for this
packaging split ?

At least that way I could inhibit it from my other layers, versus with this
prepend, I don't see any options to have my own package splitting.

Bruce



>
> FWIW, native isn't packaged so that one at least isn't a problem!
>
> I'm assuming the "all" package can be used in the SDK contexts easily
> enough to get the needed behaviour there?
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000076064805fd9f8e54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote=
:<br>
&gt; At this point, you can probably see why I ended up using the explicit<=
br>
&gt; variables and overrides versus python when doing the<br>
&gt; meta-virtualization splits. :)<br>
&gt; <br>
&gt; I have a few more comments that I made in v1, that I haven&#39;t seen<=
br>
&gt; directly handled or replied to.<br>
&gt; <br>
&gt; My only remaining concern (and it may just be my own concern), is that=
<br>
&gt; there&#39;s no way to change this packaging split. Either you take the=
<br>
&gt; programatic split, or you take the -all packages.<br>
&gt; <br>
&gt; Other packages (glibc, kernel-modules) have a variable that controls<b=
r>
&gt; whether the split happens or not, I&#39;d like to see something simila=
r<br>
&gt; here .. but I do realize that it makes test complexity more, and that<=
br>
&gt; Richard normally doesn&#39;t like conditionals like that.<br>
<br>
I only &quot;like&quot; conditionals if it is a code path that will be well=
<br>
travelled, otherwise we tend to find one of the paths is broken. I<br>
don&#39;t think we need to make this conditional.<br>
<br>
&gt; Alternatively, did we rule out using PACKAGESPLITFUNCS to add the<br>
&gt; splitting routine ? With that, we could remove the processing in<br>
&gt; places we don&#39;t want it, in particular for the native/sdk builds, =
as I<br>
&gt; found that we really don&#39;t want the splitting of qemu in those<br>
&gt; scenarios.<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Can you think of a problem with the PACKAGE=
SPLITFUNCS=C2=A0method for this packaging split ?</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">At least that way I could inhibit it from my other=
 layers, versus with this prepend, I don&#39;t see any options to have my o=
wn package splitting.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
FWIW, native isn&#39;t packaged so that one at least isn&#39;t a problem!<b=
r>
<br>
I&#39;m assuming the &quot;all&quot; package can be used in the SDK context=
s easily<br>
enough to get the needed behaviour there?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000076064805fd9f8e54--

