Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1455ECD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:34:43 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76581.1781001274423228631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ysa+kE/O;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-befd83e0521so1144667866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 03:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001273; cv=none;
        d=google.com; s=arc-20240605;
        b=RA6d5eyswKARijGEl9FiGhhT4fKBpa+M+Y+dMlk1qb2gm9HLK1ky6uvt82BZ0Tqx/u
         RWdJOPSP03zkB1ZRz4DW6dSXwbRIgxMFyFcl/IoRtV0u65q2jniDyeuZ9yJE2U6nMe1/
         +thJIzB2d7aIDeelysEImvie73YP0a66GdY605inEAnuwYRxh2SCYKVsx2LlSXUSRnDy
         29rXNCE/K0GGBN+d6bQq5bT94kLdWsERlxrJrmHeRcj5LsQ0rkyC5t4o1IFaleOjYYQg
         BXnuqcHY2RJjdcrEd8EclOMB1Jn/X7NbCKAp0pPooQVpT2b/yOHRa8D/+waQjENYi3hn
         KSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L/M/jahr9klaLc9hE1j4Wvedgryr3lxhxpm7QAY1NOQ=;
        fh=1dXkNA/zjeQkLBOGCxayTIUwoIULOVjBku7ZIRIxBUY=;
        b=bLsPV8Iyw9+J6EXnLPr339gGgmjA9qwJjBX7pVaRQ92A1iVHieyjStlSEFnIuB/PC1
         32/vstWl/Nrc6MU1lPtzVObS7BMPx3brG1yGMCqaQZhhb/F8A5NB9nEBpwLWVcizuTaf
         2+oE3SK/4INHIjC2EYFy+L55zVUpQ92ylDCQG1/vuQVwnNHRvhDJLZIx2hqmnZtatf0c
         t8DDHG7knIgtgYE+N6Rz4Q/wSYnEHsi//3iAcjVntDg8bGgw8Y9Bij1WGxrIIdbGaRIF
         n3ZPYGEU3oHTXfytaT/r87MFseGSxmm/3YxikZSjeLrZnmsgMaRpqp1IaV6a+hA6AneU
         TK/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781001273; x=1781606073; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L/M/jahr9klaLc9hE1j4Wvedgryr3lxhxpm7QAY1NOQ=;
        b=Ysa+kE/OFR9GypMFqn8kcZdve/BhoTwu8FbyorCmH44E2qVr74eZ/NG2xSGmXtW2Se
         fam8VpFD4sJv0grypWZaS00xQvMh+N4iQg0LEZEJ8gsOljQB65XkEL7esV1r7fKJVz0T
         EUWkgBMOxTYaORun5H4gRX1DEMkYMbwX4jpxhwmxF8KFI9E0p7MExuPPcKlURTVJDQak
         boIv565TCkFJOZ7XLmoOvN4C5CdO6SDCIGKir+Q6J+FMx/o5J2ykbHFCcSAWR46w37+u
         g6ZwmrNoWp91kllmLAVXPTvjilgpvrg5Ef0ugpzp9EH8HKwU3UpvMbHX3u6osd+zQp8J
         0bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001273; x=1781606073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/M/jahr9klaLc9hE1j4Wvedgryr3lxhxpm7QAY1NOQ=;
        b=VmYhkgKJvnu5zpyJFL82MlQ7u1DGa02GJIaoHL57JocAd4JYzQw3ZmflgivJqtBIVy
         etn+7+aCk8F+3wR6SDEYdubHs+58A3EDXrVm4Hu9J6dfyIqydVvBSMJC3sA5OAypzUIY
         EQuuIhT15G1DaMKvM7ZFUe0jkJpMqNupEz50DIdMLLlZRuGJ9g7x94jAbeYdNoAr0kTt
         8qjQD6xMr7rFKHzjD/bBSC9L16R7ih1ioewAUu+iUdpZF6uwckTIVMbljJ5Bur7/llut
         AKhYssjZwPxWC5YFPDtJG6/skrsc15S35bEj3N+qm68IWULmDSibM7dXc+YLwK5Gh24g
         uY2g==
X-Forwarded-Encrypted: i=1; AFNElJ+0DcXJfkr+W+b03WoVs0bZhwmzKST7j6WultjF8rNLjuWB3TLO+cl+vYGEKdG1Ifznu7py2CHMrJTT7Bv7C88dWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9IL8Ps/SOKF6c0gakOZWFDVE7EwZWqz6ISKL+ROrJ6QWUgVEh
	fDeXTN6qZZXbfiRzWU1eZttL2tULT/+ouhyUR09pGdSRKwRCcfh1tw+Om7tbxl+lmQIbqQT/qIz
	pMK5MiUvyHGzplnQmyYJuj4CvxSQqeHI=
X-Gm-Gg: Acq92OGUrqQgqsbJrmPQ1VP40S1hAErCNp2WVesuVNZ57FsRLdco3BtVaEnPvvEhbNK
	BNIgCaLjJ/yuhM21Ye9sP7CKoHGm8OMrc4Fg+8EWMf3NHiZtcHLcgRPcY26L/eEguU9WRlVMTZL
	+ENIflBVFgvLmTw6FW8kKy/i5gJ+y4gQ2UnEUxHDk17Zp/dcPSTm7TBoYQZmEBlISO3VwZsi+Qr
	LPB1BNf5S9Tl1uvQnzSuU6dnwc3aC8Zbqm9FbIvYZljILqxvHaOTqrVt98+zQ2wZfyKBK8094EO
	sajk8dOQxSrVXVgSshQR4s9R78iZosvjuI+khhwl3tQhTffOPA==
X-Received: by 2002:a17:907:3da7:b0:bed:70be:1683 with SMTP id
 a640c23a62f3a-bf3a8a07c21mr798732366b.23.1781001272567; Tue, 09 Jun 2026
 03:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com> <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
In-Reply-To: <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 9 Jun 2026 16:04:00 +0530
X-Gm-Features: AVVi8CeL5aojWNRud61y7voTM1OSu32rpc8wKmdNpkV3-n4YeHBs9VkktZzv7gA
Message-ID: <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000322c500653cfac3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 10:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238287

--000000000000322c500653cfac3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Please correct me if am wrong.
  BB_NO_NETWORK:layer-core =3D "1"
would work for the case where SRCREV is set to a floating
branch or tag, since _lsremote() calls check_network_access()
which raises NetworkAccess when BB_NO_NETWORK is set.

However for the case where SRCREV is completely missing the
crash happens earlier in srcrev_internal_helper() which raises
FetchError before latest_revision() is even called so
BB_NO_NETWORK wouldn=E2=80=99t catch that case.


Best regards,
Sai Sneha

On Tue, 9 Jun 2026 at 3:16=E2=80=AFPM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-06-09 at 15:13 +0530, Sai Sneha wrote:
> > Hi Richard,
> >
> > That makes much more sense, thank you. Setting
> > BB_FETCH_REQUIRE_DETERMINISM as a per-layer flag in OE-core and
> > having BitBake enforce it is a cleaner approach than catching
> > FetchError in setup_revisions().
> >
> > could you please point me to where in BitBake the network access
> > would
> > be triggered so I know the right place to check this flag? I
> > believe it would be in latest_revision() or srcrev_internal_helper(),
> > but I want to confirm before implementing.
>
> Thinking more about this, does:
>
> BB_NO_NETWORK:layer-core =3D "1"
>
> already do what we need?
>
> Cheers,
>
> Richard
>

--000000000000322c500653cfac3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi Richard,<br style=3D"=
font-size:inherit"><br style=3D"font-size:inherit"><div style=3D"font-size:=
inherit" dir=3D"auto"><span style=3D"font-size:inherit;font-style:normal;fo=
nt-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;text-decoration:none;float:none;display:in=
line!important;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color=
:rgb(0,0,0)">Please correct me if am wrong.</span></div>=C2=A0 BB_NO_NETWOR=
K:layer-core =3D &quot;1&quot; <br style=3D"font-size:inherit">would work f=
or the case where SRCREV is set to a floating <br style=3D"font-size:inheri=
t">branch or tag, since _lsremote() calls check_network_access() <br style=
=3D"font-size:inherit">which raises NetworkAccess when BB_NO_NETWORK is set=
.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">However fo=
r the case where SRCREV is completely missing the <br style=3D"font-size:in=
herit">crash happens earlier in srcrev_internal_helper() which raises <br s=
tyle=3D"font-size:inherit">FetchError before latest_revision() is even call=
ed so=C2=A0<br style=3D"font-size:inherit">BB_NO_NETWORK wouldn=E2=80=99t c=
atch that case.<br style=3D"font-size:inherit"><br style=3D"font-size:inher=
it"><br style=3D"font-size:inherit">Best regards,<br style=3D"font-size:inh=
erit">Sai Sneha<br style=3D"font-size:inherit"></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 9 Jun 2026 at 3:16=E2=80=AFPM, Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 20=
26-06-09 at 15:13 +0530, Sai Sneha wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; That makes much more sense, thank you. Setting <br>
&gt; BB_FETCH_REQUIRE_DETERMINISM as a per-layer flag in OE-core and <br>
&gt; having BitBake enforce it is a cleaner approach than catching <br>
&gt; FetchError in setup_revisions().<br>
&gt; <br>
&gt; could you please point me to where in BitBake the network access<br>
&gt; would <br>
&gt; be triggered so I know the right place to check this flag? I <br>
&gt; believe it would be in latest_revision() or srcrev_internal_helper(),<=
br>
&gt; but I want to confirm before implementing.<br>
<br>
Thinking more about this, does:<br>
<br>
BB_NO_NETWORK:layer-core =3D &quot;1&quot;<br>
<br>
already do what we need?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000322c500653cfac3d--

