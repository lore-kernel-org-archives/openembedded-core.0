Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D0B106B530
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:02:15 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21650.1774443728953715024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U7m2yZCp;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ef161129bso179123d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443728; cv=none;
        d=google.com; s=arc-20240605;
        b=X9ZbsgPC7t60Ztb2v1dL6p+XUgDhG5iYfpMO3zdSlcDWvn16nJvSK0PaTdy3GElv8E
         bn8O9KZ17Bz55T4O7EdDOhFx/1t2glSpa2X282ZxDSgbK86hxspPGlJlcf46puo2Y2wn
         3/uKqc0AQ5MScfIx7FObJQ3Amy7TRholOKyZQgTqX5C61N6rYL2XDNHa+fhK29pRctOj
         rUb119IuN4nkazaGw+J4v7QaFoYnVST/2vcAgmNyYAGmBRKKlKT197qtfGyZgu5PjgEj
         qW1V9R48l/+c0NKxF9e8NtPHko56irrde6qvEvFxwadkyQ+eWOGpC1LrglzRYwWwscRq
         528Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3KHe0Me95RmrC+uTnXT4d4e7xwgSPS4PVzLQbYTzCSo=;
        fh=5QFy8nfT/MNR8TG5VRJXBjNpsICmtzTQYJ3ZEbC1oa4=;
        b=TX9runOvY5i67lTfcp7OcDmppjruQlrQDY6kV+e6MXnzuYXrC916bAT3giPOOh8XxB
         ZUP5kYHuWdymh+P3QTayWVPeVX9LMbiUz53F2g8FIky1zR0yxBsjDAWnBky1o+tZs31Q
         w/Lz4hT00jhhhHvJzltohFl/u0zWmts9y/YVZMj/l32rcDaB2qEd8jvSI3mzb6J5NIJ/
         eQOHQ428PO4jWZA3RSKSJ3PGRhVIba/jozQdb9iiR21eb2HRESr8bP/0c9VxZys36J16
         L0a0SABlx5bh8qFvlTrtNFZ5wzwa+TV13A2+bYtW8frYR7Sr9kXr/fbMAbJUBGV4czs4
         kyoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443728; x=1775048528; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KHe0Me95RmrC+uTnXT4d4e7xwgSPS4PVzLQbYTzCSo=;
        b=U7m2yZCpZODTCsvaniF595Uxy70uNua77da+4rwNlwd/Vm72zqBOtCC4IkFEZKmMRW
         mfviZOH5QSYySMJSqo7rqZplcyhcGmJundXMlHevLZhNGds9YsK+Lw7/8Br+i7i4emY+
         RHyKTJ1GkmFk3J8B0HDs6GBwbzFAHueiFK6XFazk97pqtHTAXsztoZiGwC31pbW5IE+U
         mpml2xamvkg77uwyR61oqzOy1d14AmHuQ6kEte9Tm2SEBH0nRvnJ6yD5YBJWRduXgnEE
         g36GKQeDOnkdfyKgX8CUwK6SV6Wbca/bMUcG1huv/W+sEPzytDA/dR40AQd/2EtIkYI0
         PygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443728; x=1775048528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KHe0Me95RmrC+uTnXT4d4e7xwgSPS4PVzLQbYTzCSo=;
        b=oaxTqIk5dau+iirVKJk7p8a/Ppa9aq/4P9SkskAaQt2aBlE5eWdU8jL5TGBwmy8wbe
         Izx65JOP2875QjbctYDm7kLUtmcYYwry9pniCnIM2W75qrgd0/levL3GXABwpxB8YQiT
         znBTGFGMfgBp0lTq0OGhj4H9Q/9nNrWCTTFbRyJ4sxT6CxqiC4dZa2lG40jkSqxFuLQi
         iF271P6EHO8ZwK72Prx5J4RX60Wut990ctyt/Pneslic41xzfyILvbRKqQY3J3xPWNQt
         jaI39Gt2aoyIqoI/03lCXXVzWuShcJcDIWOd6ob1N1QrV3VgqhhrnXpzjqruoR4RxUtn
         8XaQ==
X-Gm-Message-State: AOJu0YwtJBeGGRQpwqKU8J+c+M0iJRbuHG1pEO0RhGCDM9x6uCIGWSut
	r3PEB/XDvnoC9CxR67dt77W2xod+KrRGCFCvsdhZqAGnduZR1VYVuuPBnPuZI1kjDIJebgS6sqR
	0R8XAgV+P3sn9yJeKoIfvpnLL6XOr0loXGk6O
X-Gm-Gg: ATEYQzz7UZLmeiDcxcjOVbwtm20UQscnpQ8NVY2lpQoEjR/RECSY2C6R0EWu8uK46Ex
	jRxDGHBT2yAJ9HVH3iFqHUFWKhjw0qfiC0dYOgygKkTFQDznTZwyAKumRteNR789Curr8RwXJ42
	aH5SXkXNIyH32CNM8Wb5oQMIjkdmPQ0aHU+jYEkMoex0DNKDHXYrQxffOseQv6ZE0wfiJR8daRh
	PXyeuBaRSn5AsMdixFI5UU5UTTebyyCBW/VUNKS7WBooyrI/wWsVCXU0yPDlu2mZHtUFIeI+LuB
	f5UHkwO7Yt6lvjDsbYkt7xK3rU3Bag0RErpRyXxv
X-Received: by 2002:a53:ac82:0:b0:64e:f224:e867 with SMTP id
 956f58d0204a3-64ef224fc13mr309680d50.28.1774443727554; Wed, 25 Mar 2026
 06:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260325113112.1163632-1-zboszor@gmail.com>
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2026 09:01:54 -0400
X-Gm-Features: AaiRm52DcLEVS8M6ZjRy3wzv9lKOrxGwBUVlVv4oUFUGDC8f5Mf-P4mSLcTV-Uc
Message-ID: <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000e10fd064dd8e0db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233906

--0000000000000e10fd064dd8e0db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 7:31=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org> wrote:

> This patchset allows turning on Python freethreading by using
> a new DISTRO_FEATURES setting:
>
> DISTRO_FEATURES +=3D "python_freethreading"
>
> and optionally:
>
> DISTRO_FEATURES_NATIVE +=3D "python_freethreading"
>
> The change to python3-dir.bbclass is crucial, as all python module
> build helper classes rely on it.
>
> I also added native variants of some settings because another
> series against meta-openembedded is needed to complete this one.
> In that, the change to the fontforge recipe relies on the native
> setting for setting BUILD_LDFLAGS.
>

Looking at those other patches in the series, they don't seem to
be conditional on the distro feature.

Are those changes valid for a build with and without freethreading ?

That's the type of information, along with the benefits of enabling
this would be information expected in a 0/N introductory patch.

Cheers,

Bruce



>
> All of the changes included here were successfully build tested,
> except for the gdb-cross-canadian change. That one failed, but
> it's included for completeness.
>
> Quite a few of python modules were build tested for native and
> target builds, including python3-pytorch from my meta-python-ai
> with reduced RDEPENDS because e.g. python3-onnx there failed
> to build with freethreading enabled.
>
> All in all, this series at least allows to get things going.
> Though maybe not for Yocto 6.0, as it's quite late.
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233874):
> https://lists.openembedded.org/g/openembedded-core/message/233874
> Mute This Topic: https://lists.openembedded.org/mt/118499141/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000e10fd064dd8e0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 7:31=
=E2=80=AFAM Zoltan Boszormenyi via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">This patchset allows tu=
rning on Python freethreading by using<br>
a new DISTRO_FEATURES setting:<br>
<br>
DISTRO_FEATURES +=3D &quot;python_freethreading&quot;<br>
<br>
and optionally:<br>
<br>
DISTRO_FEATURES_NATIVE +=3D &quot;python_freethreading&quot;<br>
<br>
The change to python3-dir.bbclass is crucial, as all python module<br>
build helper classes rely on it.<br>
<br>
I also added native variants of some settings because another<br>
series against meta-openembedded is needed to complete this one.<br>
In that, the change to the fontforge recipe relies on the native<br>
setting for setting BUILD_LDFLAGS.<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">Looking at those other p=
atches in the series, they don&#39;t seem to</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">be conditional=C2=A0on the distro feature.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Are those changes valid for=
 a build with and without freethreading ?</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">That&#39;s the type of information, along with the benefit=
s of enabling</div><div class=3D"gmail_default" style=3D"font-size:small">t=
his would be information expected in a 0/N introductory patch.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
All of the changes included here were successfully build tested,<br>
except for the gdb-cross-canadian change. That one failed, but<br>
it&#39;s included for completeness.<br>
<br>
Quite a few of python modules were build tested for native and<br>
target builds, including python3-pytorch from my meta-python-ai<br>
with reduced RDEPENDS because e.g. python3-onnx there failed<br>
to build with freethreading enabled.<br>
<br>
All in all, this series at least allows to get things going.<br>
Though maybe not for Yocto 6.0, as it&#39;s quite late.<br>
<br>
Best regards,<br>
Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233874): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233874" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233874</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118499141/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118499141/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000000e10fd064dd8e0db--

