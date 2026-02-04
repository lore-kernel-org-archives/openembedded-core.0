Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3054E87845
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:02:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21004.1770213735444632360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eOITNeFd;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7b47a5460so4936675ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:02:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770213735; cv=none;
        d=google.com; s=arc-20240605;
        b=ND27wSIBQ56hQR0T1PjfkQ2nD8e7UXgBx+E9KTFOTBZDx57w31s4m35PO/L1uHA1q6
         4QDuU6y+A5TGNJqaq31Ubs7EGPefzX9pmX/gpo6eX1+LaMna5JHhSF+/QtgINAQN4cRZ
         nLqCeMpLH5srPhZqc6IGpKr7JsKb6gOMMlFpTaJn+Y2Y2Iz8YDGFXwJakE0Rc1ziIxyV
         GEv5iUAhaoK5Jvx/XEdCn95AQxVhE43gif/2ZDZj96UgiyBlOnQJKWTlVlNX1Ny8+HpW
         zHDe8f0gRiT0YYOPjZKMssV43uf5pdWUXt/NSs1bE+217gFQz0ypnJgaEpPYK60KnIy7
         3B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HCFLU8ViftSgQwR/87KWMYL8JV0AsMeV4Yjto62Dg9s=;
        fh=3Qzr5j4BQ7jLx9nnZdL+Vf1aDzNSw7tv4BGdRP0cC/4=;
        b=Zg370hGayf4NqhF5RJM21miY0oRqEH8P0ynFsESXTRR6qi+OjMJsbwmm8w+CZiz3Dj
         g9WRI7PvoPJ0I4hvhrPvfay6HIVf3yZ1M6yv6o9h1P2sMuBvfrQG2FhFdsVdcWCOJSWg
         SSlPddgMIrDsPf/j156XmAA8jeMkaJP+Wimd3CuJZmmn02NuqxKS0aKrbHVUNuiAG964
         O5FEiHYuL3iPYt2pFzTpits6jN4HGqR2CoSkV6qwlDf1mbuydhIiTfU7jGg6WhITicLl
         O3EFAoG1mf/3FGqTVRaZ7/THw49xCUiA2xeTa0AMBtaN+UUgUN84P7wSacBD7WVQ38nH
         LrWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770213735; x=1770818535; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HCFLU8ViftSgQwR/87KWMYL8JV0AsMeV4Yjto62Dg9s=;
        b=eOITNeFdJzI8Sd2wQzx9lA0V5KJT5yP38zF3I4sRjDI4Y8voVlHu7mBW/3zrRO8JnH
         9owR0/FRO2iYA+dYysgUxDZOIJIST7U9jlzr86goSwu/nf3DnOz5oqZW539Xoh6NpZlD
         2sC33jl4yP0hW+/D9Q0qeWgY/ngW/UJAtZaCzwdHn1Vvsi8JS8lMuWxwq/Uod+Hkhdta
         8PChE9xyxQGzq9KjItZKTb2H0wyBVhLkfwkHIEeF0sbVxRrnhfdPAzGbPp/ErgmBrhoz
         7skrgMHI7WL/maNL/aaJHBTmfnu7cpf7im5t6nCB6rlgIvCt2RF+xVimaZLwz/4oXoBO
         VaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213735; x=1770818535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCFLU8ViftSgQwR/87KWMYL8JV0AsMeV4Yjto62Dg9s=;
        b=dp5eaTvVfgTWFsW0OhraAnKk6vTmsEm3vlbdlVBO2IDY2MOMdsjb9FtCTUxttrrnS9
         at54fcopgm6RMDcZ5KtYnUuV3gs2kKoENu+GmQSUpLrTupYRFwEd6L74ZHgLidkOGPb6
         t77t91gqoQEIfagLDkPywVVySxBRxEVStfXZ1Raw0C1dc4tJ+hJWoOXQ3acw+A/0Rqct
         5oijxKPYC0PgPvmCyhlJL9E4lDlyXUYMuZok3pf/vOPbLSPJOqsxo8yPXC88Qr3pFp1b
         MqBDs5j/MHGTbZ9yfbLR293DPV/OVusfDLLhFwdlsnNpWwf1FAmRRsWyB0vV3zIYnO0g
         QMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeTu3U8IeBlTjqbbxXf3EOAUmOofycdXJESOsI1McynViYraQxUZ5ZgshHjCy+VdtctlbT10GXyg4GVy63T+e9CA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjLXNMJrcaWKrDHd6sSw6kw0zibeeUlKY/tUkNM65lG4J0ybNT
	Nd0/4GtWt8vC/UxKIJc0NA9/0bIaWvk12PD9NeDnfRxbbWwSnyBZDI4mjyykTdRuu91awcPTkvV
	r2tFDohQPG4Em0YcGKkuugqd3ueCtGVo=
X-Gm-Gg: AZuq6aKaFfZmKA1/+zPAOxiBx5BkSIKODkdDsIzHxi4y/yUnpwBjm0vH6dW9O/qOkpK
	W5hdpxZphjzZN7SDKaryYSOzi/iWlBe3xsutl7W5XIpbPFjRCszlPN/c01JVtpo0BTB+H5d0CII
	sBqaKA+alUnxFjM7hpFIPTBQViVl9FvKlSvdu/urkIhFr1RZI6lmOE96diE8Xn6TzXr31FgJsNi
	QmuE1r8Tms5XOx8Oyj0k//RrDuEuTaiB+zj58KrCHdKAVpiMM90+recfGAD9sBQng58KqCIM9HU
	f9+EAdNlQTPtXCSFWJdMGl0653qXHD5wrsODipM=
X-Received: by 2002:a17:902:d584:b0:2a7:a3b3:3229 with SMTP id
 d9443c01a7336-2a93388ffa2mr34184725ad.5.1770213734576; Wed, 04 Feb 2026
 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20260204020908.864912-1-kai.kang@windriver.com>
 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com> <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
In-Reply-To: <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 09:02:02 -0500
X-Gm-Features: AZwV_QgQRFuN-BHNy0fay9u4PtOemGcPNBanWAs4RT5pGq01QX0eN8Ehh4zgnOo
Message-ID: <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES set
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d375e9064a0000b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230531

--000000000000d375e9064a0000b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via
> lists.openembedded.org wrote:
> >
> >
> > On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via lists.openembedded.=
org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > >
> > > Check whether kernel config CONFIG_MODULES set or not before do_compi=
le
> > > and do_install in module.bbclass. If not set, it cannot build and
> > > install external modules.
> > >
> >
> >
> > This isn't the place to do that check.
> >
> > If modules are disabled get modules_do_compile out of the tasks.
>
> Does it make sense to have something including module.bbclass which
> doesn't have CONFIG_MODULES set?
>

Yes, that's what I'm trying to say.

Don't even include it if you can't build modules. That puts
the conditional in a single place, and keeps the code cleaner
in the class.

Bruce



>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d375e9064a0000b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 4, 2026 at 8:58=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2026-02-04 at 08:46 -05=
00, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.com@lists.openembed=
ded.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt; &gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Check whether kernel config CONFIG_MODULES set or not before do_c=
ompile<br>
&gt; &gt; and do_install in module.bbclass. If not set, it cannot build and=
<br>
&gt; &gt; install external modules.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This isn&#39;t the place to do that check.<br>
&gt; <br>
&gt; If modules are disabled get modules_do_compile out of the tasks.<br>
<br>
Does it make sense to have something including module.bbclass which<br>
doesn&#39;t have CONFIG_MODULES set?<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Yes, that&#39;s what I=
&#39;m trying to say.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Don=
&#39;t even include it if you can&#39;t build modules. That puts</div><div =
class=3D"gmail_default" style=3D"font-size:small">the conditional in a sing=
le place, and keeps the code cleaner</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">in the class.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d375e9064a0000b7--

