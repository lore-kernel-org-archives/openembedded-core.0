Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E46CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:14:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.10622.1761311660348831999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqKtMvW/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso2187362a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761311660; x=1761916460; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0kV6nPoHo9pAr+y7opHdU0K+vblpgCbIF3v7UIXTOY=;
        b=MqKtMvW/QCZm/eHyl34HldqXdgpnW0ZbTgYlqEM0ZKMvoZkcyWwxwaFedobCChEMha
         tn/p2d/Jx2gTljTQ70KLmJZAqJPmMxtw4EURXNbOPLHrQw1pHAuiO35wxMD23Q8kPLbb
         HyiCRKx59ppSV4iQ6R1SE8dYyoFLDrD0t7dHdvxlTHyD5s06xoAJznm+I9XhCfwW+R+C
         d0iTUnqzz7Q0u5UB4cpUNix34QfdlqsNPheQCLVCM1dEjVwVNrvIJ/8I8X2q0wImhg0t
         BqMAnOETBilHWdKBQZalJkWBEfjY+wjyVE/HigCIV43/Wo8kmx1U4OsGEmsGACbo7Avl
         AfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311660; x=1761916460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0kV6nPoHo9pAr+y7opHdU0K+vblpgCbIF3v7UIXTOY=;
        b=eIRpqy6ZwrSZvO0KI95LV0DMK7YKQFXf1/KLel9dHYlks8lCUDttRXxI1+9nyAGTGG
         +SEsTYRy67L6A6YYpaQcYhAoKALGoJFdvnfA9HG7vycumXQzL0YLnOvMemVfr0fJ5m0k
         Ahts9s2Q9eYh1Whj8hELmXuNst9mat5Jgl+86+ab6LFQxyMshT8QfHokWUrP4VPSE7cv
         QMAspALutgYzixiFeI+hPjumuaGolMc9scDkqxgYd7GFdzjatHGi1QwDJIDXSsNVPMnm
         Y8vhcshOI4W1AtXhdJceKGi6Q0u3iKe8S0kj/zSo63dMsnOLdG447iNKFdELQIhw+Ghm
         2O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs6JH9hKFST5/BwaIbudwWkRA1KlH95gGbOeoGi2gfCTVvEKGJzKWfeG44BvprhUe2J51vJmLNGegXwk0HSdEkGg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YycM2Y+q+VMKmWmEV6fWEIwVW7V39fZEVtJe4LFn+Adp7DTIxFZ
	JI2EWMp27FA+JbMu3WM0YFN8++QFKsaEh4fQmKj9Zyz2oR8G22Vyd9dviq806pmSFd6AdwJ2ngh
	vCNUhnP9lxxiWWaLE9dsnJeYe4hh5o5yzDLjTUmc=
X-Gm-Gg: ASbGncsP8vgfyb01rqmnIYml2JDDXTasLsvfcWs8GDh+99BgbPzVw3twG/QlbvbkuJh
	yJOLeRjgNgJDk93iUgph+MSPrfQQy/yDGMC2iznYXm5JNBL5IOMKLYSiSy9D5QLKErfU8L/KutW
	pYV5CvfT0dVT0BAJ5bppk0Eq/G+NBLG8NOfEatIARc7BbIRUxO4Im9xBvwFF3Bqqz5Zk7OZnk2b
	OdxIXsQdYvLczegJEpMehk4zFwlxrelBrlY62AdKAz2UpIEfQkj33pGE79FlhRYASn2KL0N
X-Google-Smtp-Source: AGHT+IF5Lq05ZDC9xeAL7TYbHI+jKEGLEjC6CmymZeYTnPo16XPh+WzwcKeywULRNuy47nm6IiOQ3IGGuWoo/qWda5E=
X-Received: by 2002:a17:90b:4a50:b0:33b:938c:570a with SMTP id
 98e67ed59e1d1-33bcf90e727mr41189194a91.33.1761311659586; Fri, 24 Oct 2025
 06:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251024130447.3599900-1-bruce.ashfield@gmail.com> <CAOMZO5Aj2O4Q0xD0teVRDQ=UmcubfuiU7GJeztWNNuqT-_D3zA@mail.gmail.com>
In-Reply-To: <CAOMZO5Aj2O4Q0xD0teVRDQ=UmcubfuiU7GJeztWNNuqT-_D3zA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Oct 2025 09:14:07 -0400
X-Gm-Features: AS18NWByDoveWjNStGLG0rSrpQBql-LDP026kMDKzFFYPf3f8dNegtK_zYvZATg
Message-ID: <CADkTA4PtwFd2qVLCf=Oo-dpE46sGc0p8ZozNSsWUXtNfLSXgGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-modules: update to v2.14.2
To: Fabio Estevam <festevam@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cef8340641e753ad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225295

--000000000000cef8340641e753ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 9:07=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> On Fri, Oct 24, 2025 at 10:04=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > This fixed the build against kernels 2.17+
>
> Typo: 6.17+
>

Fixed! I wasn't a typo, my commit summary scripts just don't handle
non-kernels
very well :)

Bruce


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cef8340641e753ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 24, 2025 at 9:07=
=E2=80=AFAM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festeva=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Oct 24, 2025 at 10:04=E2=80=AFAM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This fixed the build against kernels 2.17+<br>
<br>
Typo: 6.17+<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Fixed! I wasn&#39;t a typo, my commit summary s=
cripts just don&#39;t handle non-kernels</div><div class=3D"gmail_default" =
style=3D"font-size:small">very well :)</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div></div><div><br></div></div><div><br></div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature">- Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Sta=
r Trek II<br><br></div></div>

--000000000000cef8340641e753ad--

