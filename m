Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.4829.1590228255520826919
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 03:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MwlJ//Li;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id 62so7415691vsi.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyJC94lt7NTsudEKfBfawqa2W2M0pL62NvwC1jK/4AM=;
        b=MwlJ//LidSuxsnk6Q0c8RgZHcH7lfHSE3/z0eJbXpu37akgSVRlkrCmcUMa+zREe0Z
         Mj9O6n6KNtv1kfNB6sREA63i6n6a2Rx5s6S8sNHlviicYKTiNSuMm2TIpiE/POeKmfNZ
         tG8kssNswlMss6am8amTIl1aiwSZ8vO/LHmQYk8dOSHXcvuxtDLLMCXXGg16vHUL5y+4
         fy/SynZy/3oHWUwMka5AnyW4AC5nleWCCuRfPZRuH5oLVmIy5JoietKwv5AbaGPyPBle
         PgL6x2yc3qoBFRJ7czC6mXstVeN/7piZXjhkhyMPjdYwJOtIyKRYd3Kd1eDCUTEbcjeq
         zO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyJC94lt7NTsudEKfBfawqa2W2M0pL62NvwC1jK/4AM=;
        b=Yf99JMhgqdCUJFExN5jJuqLd8qQYpd1jTkprf/GdeFm6HJZ8YdvQ7cmFmBgVRyN/uJ
         GqkCFsr6Fo5MTT3jDn6tgyuplJsb05WDOZZ0Vad96SQkOi3fzs+rbV/oj8oQHbkFtK29
         yvIGz1X3a9TFv8+BN94pXtaubWpogjd08GeLRFm/T4xBYkST7g2F4hCEvsT60zGJZD5e
         x5al4lB2ZRY5jD/7j7zMbh7iSp2erCMoVlplsPN91k7labZ2em63Yd1kEBn96XArTyAd
         ijGJ7Nv5XQI4PURCHS0e8PRZWBnNjtsKzw+Pi3nZn/z+csHJ2T8BKllm/E5ZHolk+UIQ
         lJxQ==
X-Gm-Message-State: AOAM5339+K4S25SiDvwglpeDmKBw1e7FwzsAsWHVEDERfkfrcOBg9Jz/
	qCobt+XWKm1pTMcuTXFVUFZKLERRBolgnN3UqnI=
X-Google-Smtp-Source: ABdhPJzC5/rK8qLnUqHOUeB0HBKJ8riRkjckMejb9IdwMutrWtfSJzxMwjwOVbcBEAOO84dezik50uK6dfPx7Vl8muc=
X-Received: by 2002:a67:be05:: with SMTP id x5mr12963128vsq.35.1590228254175;
 Sat, 23 May 2020 03:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB688122DB540C514C7F56E3AAA8B50@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB688122DB540C514C7F56E3AAA8B50@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 23 May 2020 12:04:02 +0200
Message-ID: <CANNYZj9-2NH-fTf0xM=018_2-PtNDYcOp6_uSYr5DHpf+1yGYQ@mail.gmail.com>
Subject: Re: [OE-core] can't create boost_context lib for boost-native
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033b77005a64ddecf"

--00000000000033b77005a64ddecf
Content-Type: text/plain; charset="UTF-8"

The problematic bit is:

# only supported by x86 and powerpc
BOOST_LIBS_append_x86 = " context coroutine"
BOOST_LIBS_append_x86-64 = " context coroutine"
BOOST_LIBS_append_powerpc = " context coroutine"
BOOST_LIBS_append_arm = " context coroutine"
BOOST_LIBS_append_aarch64 = " context coroutine"
# need consistent settings for native builds (x86 override not applied for
native)
BOOST_LIBS_remove_class-native = " context coroutine"

I'd just drop this all, and always enable the two; if they're still not
supported by some targets,
then target-specific _remove can be used.

Alex


On Sat, 23 May 2020 at 10:49, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Hi all,
>
> For reasons that are beyond my control I need to have boost_context
> available from boost-native.
> Unfortunately I didn't found a way of enabling it by a bbappend, only a
> full fork of the recipe would help.
>
> It seems to be caused by that single line
>
> BOOST_LIBS_remove_class-native = " context coroutine" (from boost.inc)
>
> as remove-operation is always the last in the chain of processing any
> attempt to add won't work here.
>
> Any ideas how to add it without forking the whole recipe?
>
> Also this is another example for the ongoing discussion about remove,
> ??= and ?= operators in architecture list and that there might be an
> alternative needed
>
> Regards
> Konrad
> 
>

--00000000000033b77005a64ddecf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The problematic bit is:</div><div><br></div><div># on=
ly supported by x86 and powerpc<br>BOOST_LIBS_append_x86 =3D &quot; context=
 coroutine&quot;<br>BOOST_LIBS_append_x86-64 =3D &quot; context coroutine&q=
uot;<br>BOOST_LIBS_append_powerpc =3D &quot; context coroutine&quot;<br>BOO=
ST_LIBS_append_arm =3D &quot; context coroutine&quot;<br>BOOST_LIBS_append_=
aarch64 =3D &quot; context coroutine&quot;<br># need consistent settings fo=
r native builds (x86 override not applied for native)<br>BOOST_LIBS_remove_=
class-native =3D &quot; context coroutine&quot;</div><div><br></div><div>I&=
#39;d just drop this all, and always enable the two; if they&#39;re still n=
ot supported by some targets,</div><div>then target-specific _remove can be=
 used.</div><div><br></div><div>Alex<br></div><div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 May=
 2020 at 10:49, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi all,<br>
<br>
For reasons that are beyond my control I need to have boost_context <br>
available from boost-native.<br>
Unfortunately I didn&#39;t found a way of enabling it by a bbappend, only =
a <br>
full fork of the recipe would help.<br>
<br>
It seems to be caused by that single line<br>
<br>
BOOST_LIBS_remove_class-native =3D &quot; context coroutine&quot; (from bo=
ost.inc)<br>
<br>
as remove-operation is always the last in the chain of processing any <br>
attempt to add won&#39;t work here.<br>
<br>
Any ideas how to add it without forking the whole recipe?<br>
<br>
Also this is another example for the ongoing discussion about remove, <br>
??=3D and ?=3D operators in architecture list and that there might be an <=
br>
alternative needed<br>
<br>
Regards<br>
Konrad<br>
<br>
</blockquote></div>

--00000000000033b77005a64ddecf--
