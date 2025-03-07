Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359B6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:48:10 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.12745.1741358886141169386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wu55MadH;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e89a2501a0so16522026d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 06:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741358885; x=1741963685; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qcFVuPGK8fAcLLliF/BlRy8FR3gUXRNCFiXKeQaGL14=;
        b=Wu55MadH2dcVJoheFS/waTIJx9MOa3S7Ijx9HFZC4F+W8s1O/F5yDs65HUMSv4zTb5
         W85jeZVhk1bKI3Dyoq3UPCUCy2Li3HrqCHAXzSolErLfJsqyMjT4vrLZaNN1igASlK/q
         rdg0mqkyHcZTIB8tC5i7dbL5ApkhTr5HzUU0v9Bptk1dtCvRy8G4/59HHiINOBlzGAM8
         uPHRNlBbDm/MTkqKPp7GtsR9/cFWqXTFy4n0LRO+W0SmCv/bYKPWNBIexgQqTfbHgPkl
         +mN15O4wUAiKVXOgGCT9pC3GktfZmGHPU9C94No7H/H23bLAuTsEdhLa7+NNwzyjb/iv
         vpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741358885; x=1741963685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcFVuPGK8fAcLLliF/BlRy8FR3gUXRNCFiXKeQaGL14=;
        b=fyB/lFUhycgWMkAPkD4b+eT5Cvs90LLeUrPlHLCoudNXcuLqsrO8sb8M+tNJNXCp9z
         q7617lC4rYHbTpgrkIPFtwxDoB6l5VPccWjAYm2/FgUGVg6dBXX/7u0s6SNKYT32L7CO
         trc6uo3yImW+14aSDi3TYUpRCj7TGsdMiJ67enXhljELrzFWQVzgYJmS69ER8GLdSQ5x
         mWOZ7SaOo6/e+8qrG1FOWPqfr16SiyfkL8u7FkR1IItfR3zKX2Djc21gemubBaEtkH1b
         ZAez0ivgHWo/b4TLoZCBEpIhb+WFy+cHdgd7alaqK8zVV5ij7jxVXhgpAoj+k94Cg4AG
         DawQ==
X-Gm-Message-State: AOJu0YzBTMsVyIDJ+spyhauM17SPptxNyH0Zulae20/3GqxglA0AsBsX
	npIvJitInwNG+MYfxkmL0rHCoOvyNnvvBMAMrPXEycDxKvQAfVf/0Qr1DscKe6pZkZ31bzSXct8
	Ih/CW9qNcGeD5lGQTatUMC5Edq8RjYw==
X-Gm-Gg: ASbGncs7VBb2nGDEptC0UIXtqzEdYdb/82fgTGrrY+CTsR6u7bslvQ82eWvTQXp3+hX
	jclfB7Fku5uDYJBj19nguEcUPUKeqVG9UpdEUrqR/L56J4gufyRYWHDH9k4LOi6KeqLfz3hhHTX
	eaWSvcik0iQThR9ZmppO6Cq/O++/OMxYjZ36Yi8zdIGCTolQkIK3ZAuE2Lbwg=
X-Google-Smtp-Source: AGHT+IFJ42gdKVQ7AD7Qv2DKtYiyXgqQXNAVahr2ZtT9ViV1HC6WmzzyOwq7V5ZK2QC0Yh+TNX9iCN3CTK+VgyC5rLk=
X-Received: by 2002:ad4:5f46:0:b0:6e8:fb7e:d33b with SMTP id
 6a1803df08f44-6e900677496mr41268066d6.33.1741358885081; Fri, 07 Mar 2025
 06:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20250307132900.456962-1-f_l_k@t-online.de> <CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
 <182A8AC2C61D2C82.9571@lists.openembedded.org> <OFCRSS.DMAMQS5P3JTF@t-online.de>
In-Reply-To: <OFCRSS.DMAMQS5P3JTF@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Mar 2025 15:47:54 +0100
X-Gm-Features: AQ5f1JqjPPkTdL7ZNSe36zkJPa-zfecE2AI_G6f9buqvOOAsjNE7OgZfHKLzzZ8
Message-ID: <CANNYZj_uNe90wTLJkJhnL17JSbWi6xA1x+_YXHZ_ccWCHOhKrg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c59613062fc1b5b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212448

--000000000000c59613062fc1b5b1
Content-Type: text/plain; charset="UTF-8"

No, they should stay where they are. The question was why they need to be
in the main package, rather than ptest package?

Alex

On Fri 7. Mar 2025 at 15.32, Markus Volk <f_l_k@t-online.de> wrote:

> taptestrunner.py testprogramrunner.py
>
> These two files are installed in ${libexecdir}/installed-tests
>
> And looking at its meson.build this seems to be the default location
>
>
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/tests/lib/meson.build?ref_type=heads
>
> Should they go to ${datadir}/installed-tests ?
>
> On Fri, Mar 7 2025 at 15:13:32 +01:00:00, Markus Volk <f_l_k@t-online.de>
> wrote:
>
> On Fri, Mar 7 2025 at 15:05:26 +01:00:00, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
>
> This needs to be explained, as it doesn't seem correct, and contradicts
> ptest-gnome which (correctly) installs these to the ptest package.
>
>
> I see. I think the issue here is, that the install path changed from
> ${datadir} to ${libexecdir}
>
>

--000000000000c59613062fc1b5b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, they should stay where they are. The question was why=
 they need to be in the main package, rather than ptest package?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri 7. Mar 2025 at 15.32, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.=
de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m=
_-4749415608757051403geary-body" dir=3D"auto"><div>taptestrunner.py testpro=
gramrunner.py</div><div><br></div><div>These two files are installed in ${l=
ibexecdir}/installed-tests</div><div><br></div><div>And looking at its meso=
n.build this seems to be the default location</div><div><br></div><div><a h=
ref=3D"https://gitlab.gnome.org/GNOME/glib/-/blob/main/tests/lib/meson.buil=
d?ref_type=3Dheads" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-=
/blob/main/tests/lib/meson.build?ref_type=3Dheads</a></div><div><br></div><=
div>Should they go to ${datadir}/installed-tests ?</div></div><div id=3D"m_=
-4749415608757051403geary-quote" dir=3D"auto"></div><div id=3D"m_-474941560=
8757051403geary-quote" dir=3D"auto"><br>On Fri, Mar 7 2025 at 15:13:32 +01:=
00:00, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt; wrote:<br><blockquote type=3D"cite"><div id=3D=
"m_-4749415608757051403geary-body" dir=3D"auto">On Fri, Mar 7 2025 at 15:05=
:26 +01:00:00, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br><blockquote =
type=3D"cite"><div style=3D"white-space:break-spaces">This needs to be expl=
ained, as it doesn&#39;t seem correct, and
contradicts ptest-gnome which (correctly) installs these to the ptest
package.</div></blockquote><div><br></div><div>I see. I think the issue her=
e is, that the install path changed from ${datadir} to ${libexecdir}</div><=
/div>
</blockquote></div></blockquote></div></div>

--000000000000c59613062fc1b5b1--

