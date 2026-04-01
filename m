Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ED21076372
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 06:04:32 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6562.1775023466752189969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 23:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FrHGY0Oc;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732165d1eso8997442c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 23:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775023466; cv=none;
        d=google.com; s=arc-20240605;
        b=V2fL4Z0bS/tK/R5J6oHV0q0BrmjJhn2S+SKYBOSEoMNxaM090nUeb2dY39bG6kKMry
         gJY39rVNqjKVlcYY10l+hULNj3bLvZ5JDW+kANvFrUirVLlS512unK0Ec/XlLBzoloI9
         zKD+PzqAqCBzDfEKfFCv0GLwRNTgExT9gvlDWQxXTprU+7B5FfcjVFZG3pe/SoZsysoa
         YLfWN/PAewBpBckcUsvWAizd41eUJPuLDnp0TYQ+Mp1ewkQcBEsUMKc2zRUk2a9gvS2N
         +3azJtq4J6nXgRlBECV6arwDpi1eGw33RKr7eP8gfyajvsYJ1tfOlBmlOjj39gqBIQf7
         g9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yVJxe185iONxxmDlmwF1ZyS3JAPN520Y6UFBFHr3Lkc=;
        fh=Utm14mXslVDnX4NTdNt+0V7CKunwjzuHRlByHI7cmUA=;
        b=QvjpAGck7Q9OFJFTrSQUY3lyZK9eCVdp7QfI2LzMTUkYWAscV+kZ0C8YvU3Ks+fcWD
         JJ/H9Ek/TzQVt27lJX334uOmBjO0Vx47c6PGIvD30t8gJsilGEV27WIVcmYKbHbPZ/iC
         X8OD1QbvdoUCZE4jGc64iAwTOKlg1I5z9iskqwIKouoebN6NrenlELf1zswK3sR42K14
         dLiLkAqqhAyYgbYc589d4bgaUF5WRU8Z69xKws9loU2GaTLA+zpe4/ny7EbkyUpPMT5S
         URvD1JcgS8Joun0u2Ggjo0DT9v/zoNsUPhCpc+bsbmrfMq9VfiwP3RUEbxEXTBwn9utt
         75dg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775023466; x=1775628266; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVJxe185iONxxmDlmwF1ZyS3JAPN520Y6UFBFHr3Lkc=;
        b=FrHGY0OcJineYuBfIkGk2LdvMUavXvJbyVq8qPUesY4RP0wgJZL4nuv/9da3HReOdc
         HSd7MsqcuqwOLoRyONzdUw6HS8bGUUAsAQXCcOCTB82m2NMzhedcfJq6roxrY1V5V+tw
         lwCzJ7QppiyZdP1qZJBdenBIsZVjPSLSJAB+0/1QexZtAUkkVt6awsy41CdZDUJYSKOQ
         Nyv85GzZ6Jl7OljelgEe6WZB1/BbJdQK0CYmPPYovG3wL0sE/ruMeHB9qIf0JZn/4Lwc
         4Xwhwlvz0WECqgR1t5YqjYhWfNEkPLit17hj2W7D6ZDL95tboLmGtgVZPq8i1ZQAh2w4
         FkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023466; x=1775628266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVJxe185iONxxmDlmwF1ZyS3JAPN520Y6UFBFHr3Lkc=;
        b=bN8LS8R3HMjlgYbFKY09r9/NsNe9VeOVdC+vdIGa9mi22jc3xgrHNpfXPNBxEKPM12
         PLKReKv0j4Zz6bxm5DjAau/uxObkUa7CNXrZpRuWtmE8YrZ02ACYtIflfvJiZjgpguq6
         g/E3yrmLyRseA+Bvt4xKgLq1tctjiL5QKJqEHPL774YkqZuJE/OKniPFavhC2l4sYdiD
         yLIX33E5QgMRG4rAbu83aKto+r0rptwyNR0UFAuCRauJaOLzHiW7tiJC2jkph9BTurBd
         b7oTkpzNk/ysbc1Nt4MbEXTE7jzmF4e+FHXh0rcPI02+C70cnu12OpGd70tWwpbc+aFg
         cUwg==
X-Gm-Message-State: AOJu0YwmuvyykM3tvJmuU0krV7qAsZwfUcAYiVjULztTSlpY3I7MAxMs
	1nWg7s+DamcafXYsKNZUZ1QyZ+FQdrPImgjNtESpbE6j9SoZlbIMwluBe6skOPcJ7ioAbXzAX7I
	GSl4dpJWS32QjA6kJX8Su+mFHL5Ij6aw=
X-Gm-Gg: ATEYQzx7Ix0eSGK19WTZK+OOy99gx829oFINW2fByuB7yeQugd1Z4hEnG23/rroxPCF
	sZxCyBNwinTrzZX9bp2Zn9rBqhUrp/glptJKQVmOgaEvStHxncvp58bgV7ndbiKzEgP4j8TkmrP
	g30D58cAg3jf6S0J+ZbRax5EPLjKy0V8NqHtS5XcEBXoM2XRw/kKfa6s5cwxMyI9Pz1dQ8V2bLm
	m+wCMXT+Y8tIFRzscwZ1pf9gNFt5tIYKSrew0WUI7j9CZsk0BNDkb5yA8IQMM+opUpB5BOjgAMo
	cQUJMFxapnSsJ2kt1NBXpYLJCviqnrnLzngWIMTg
X-Received: by 2002:a05:7022:b88:b0:128:d375:f1cc with SMTP id
 a92af1059eb24-12be649c746mr1365662c88.12.1775023466030; Tue, 31 Mar 2026
 23:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
 <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
In-Reply-To: <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 1 Apr 2026 08:04:14 +0200
X-Gm-Features: AQROBzBogGjIbew3Ea9WhoQjkzH_7MUNwQqSwQsNyHMYLSQcXNXtCXTRCv3UtP8
Message-ID: <CAApg2=SPPo68XtvWioHO_T1=5EQiNABnntGJhM59hDkWhm6N9A@mail.gmail.com>
Subject: Re: [OE-core] Runqemu error on core-image-minimal
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002928e2064e5fdb2c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 06:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234326

--0000000000002928e2064e5fdb2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:35=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:

> On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via
> lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hello all,
> > As mentioned on the call today, I have an issue in a configuration with
> bitbake-setup, oe-core-master fragments and runqemu:
> >
> > $ runqemu qemux86-64
> > runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e  ...
> > runqemu - WARNING - Couldn't run 'MACHINE=3Dqemux86-64 bitbake -e  ' to
> gather environment information, maybe the target wasn't an image name, wi=
ll
> retry with virtual/kernel as a target:
> > ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE ha=
s
> already got an assignment.
> > Please either disable the fragment or remove the value assignment.
>
> drop "qemux86-64" argument, it is not needed since the machine config
> fragment is set.
> "runqemu core-image-minimal" should succeed.
>
>

Hello Ankur,
This leads us to another problem (also happens if I remove the fragment):

$ runqemu
runqemu - INFO - Running bitbake -e  ...
runqemu - ERROR - .zst images are only supported with snapshot mode. You
can either use the "snapshot" option or use an uncompressed image.
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 17100244.13

Kind regards,
Marta

--0000000000002928e2064e5fdb2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31,=
 2026 at 9:35=E2=80=AFPM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Mar=
ta Rybczynska via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Hello all,<br>
&gt; As mentioned on the call today, I have an issue in a configuration wit=
h bitbake-setup, oe-core-master fragments and runqemu:<br>
&gt;<br>
&gt; $ runqemu qemux86-64<br>
&gt; runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e=C2=A0 ...<br>
&gt; runqemu - WARNING - Couldn&#39;t run &#39;MACHINE=3Dqemux86-64 bitbake=
 -e=C2=A0 &#39; to gather environment information, maybe the target wasn&#3=
9;t an image name, will retry with virtual/kernel as a target:<br>
&gt; ERROR: A builtin fragment &#39;machine/qemux86-64&#39; is used while M=
ACHINE has already got an assignment.<br>
&gt; Please either disable the fragment or remove the value assignment.<br>
<br>
drop &quot;qemux86-64&quot; argument, it is not needed since the machine co=
nfig<br>
fragment is set.<br>
&quot;runqemu core-image-minimal&quot; should succeed.<br>
<br></blockquote><div><br></div><div><br></div><div>Hello Ankur,</div><div>=
This leads us to another problem (also happens if I remove the fragment):</=
div><div><br></div><div><span style=3D"font-family:monospace"><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">$ runqemu</span><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Running bitbake -e =C2=A0...</span><span style=3D"color=
:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - ERROR - .zst images are only supported with snapshot mode. You=
 can either use the &quot;snapshot&quot; option or use an uncompressed imag=
e.</span><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"=
>
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Cleaning up</span><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">
</span><br><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">runqemu - INFO - Host uptime: 17100244.13</span><br><span style=3D"color=
:rgb(0,0,0);background-color:rgb(255,255,255)"></span><br></span></div><div=
>Kind regards,</div><div>Marta</div><br></div></div>

--0000000000002928e2064e5fdb2c--

