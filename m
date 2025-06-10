Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D318C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 02:09:50 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.77069.1749521385323910195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 19:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jkeFt0ci;
 spf=pass (domain: mvista.com, ip: 209.85.218.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade5b8aab41so311096866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 19:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749521384; x=1750126184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/x/pSQyJe90z+oEdb9WDAoP9MeRLIAY9TuA1YEQZ8g8=;
        b=jkeFt0cixISha4SZtvqHbzT2kcy2bs3kPnEHsrPyCzQNAJAdYhmXYjnyATMCwMNYi0
         lyCCc/STcQf1EWHCW9/VQjLmM6OejipmOtCaMcx+oZWi8e8Ce0vOj8Vu3PVR2ijGJ1QC
         SNnmQbKTbqPCHnQ3ZIyM55oHMcT+dpQg2oclY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749521384; x=1750126184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/x/pSQyJe90z+oEdb9WDAoP9MeRLIAY9TuA1YEQZ8g8=;
        b=hT0V7rj/XsspXrPyQxqBDrBaoyW92LVeHyh0+odasqtLeepBtNMK1CIFuqsbR5hPwh
         bfs3x70dSO/Y2StjmnbtLhnkX/XVi540G2FFAugN7KH2S5FAWyvwAJ2a+auDJm10r9Ck
         DTJGYdOnuHHFf4n3zLYGN1CegGEQYipHZh6Qdlf0ym29sMLlGuQuXXo7dLTbtFgsTm9s
         8Cem2iKsO8Tiso0miYf5m3PvXJ7vK7rGdn2HVJ5YQHPPdKIRt4E8Uc2Q8Fe+UFpcPb9D
         Fdk+UJHvke690YyghwH2mT3k65YzqVO67b+fFN+v7HSa96M8oLKIM9/TyBVZPxROrCrY
         hpDw==
X-Gm-Message-State: AOJu0YyAssuATtHNNkT0Rut0HiWPbu2k6yFHvYyx5npwfg8wlmWY8Jki
	ezr8PskIHkJsFxz4KrX/KfIDTIAqbd5S53m+PS0YqdTgPoSAGe9DdcYRPPRjLiIhYQP96ypu9P7
	ZpE4UEYywYV9pe6YgAfgwq9NYRz7WL8oTOGGFkjE64q884xKkV6BE
X-Gm-Gg: ASbGnctO5+sVZSRfSAIeFJJ+hB6tWg6qGrXY9+xUcCdYkuvZ8R9sLSUT2UXljIutFB+
	HHW8vzNuhbl3IuED0Ch5Fg0PL9m0xc5c3pXEVIcLKvg5jm7FNHSJcUBAT1P0a8+pjPRyF9FNFbj
	5s7KS05Dv1TeFN1GK6aMXhhDUUoVSOfIQfU2Ez5lQbMnkZ
X-Google-Smtp-Source: AGHT+IFIFeKWZ6KeIgOEL4DxMHL3n++yvkE1Ao+6dSZmflpuTo6dXQEAQxBsnRDWCX854fFL/pEtC9oUG+oxkPl9xxw=
X-Received: by 2002:a17:907:805:b0:ade:3bec:ea40 with SMTP id
 a640c23a62f3a-ade3becfd3bmr977240466b.10.1749521372607; Mon, 09 Jun 2025
 19:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250604053655.96207-1-vanusuri@mvista.com> <CANQUz18y87HfvcgbAUFb6nRkhP_gxrhAEd9BdMAcFT3qUxde6Q@mail.gmail.com>
 <CAOSpxdYYL3QKBc0CAo5FjpWkvKqr3h+ZFsKt6jGLr=ics=k2qw@mail.gmail.com>
In-Reply-To: <CAOSpxdYYL3QKBc0CAo5FjpWkvKqr3h+ZFsKt6jGLr=ics=k2qw@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 10 Jun 2025 07:39:20 +0530
X-Gm-Features: AX0GCFtvBqtdIe4sPwmT07_GpnH_eqXgiH20UnItDwm_toW0Dp1g1dTmNffcdbY
Message-ID: <CANQUz1_vkK_UeTku9V=dkb5pOEKySSnJJWX7qJL6iv-vn8m3fw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] kea: upgrade 2.4.1 -> 2.4.2
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f10a0f06372e2fe5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218308

--000000000000f10a0f06372e2fe5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the update.

Thanks & Regards,
Vijay

On Mon, Jun 9, 2025 at 10:07=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Sun, Jun 8, 2025 at 7:38=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:
>
> > Any update on this ?
>
> It should be in the next batch of patches sent out for review (within
> the next or so)
>
> Steve
>
> > On Wed, Jun 4, 2025 at 11:07=E2=80=AFAM <vanusuri@mvista.com> wrote:
> >>
> >> From: Vijay Anusuri <vanusuri@mvista.com>
> >>
> >> Changelog
> >> https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt
> >>
> >> License-Update: Update copyright year
> >>
> >> Includes security fixes for CVE-2025-32801, CVE-2025-32802 and
> CVE-2025-32803
> >>
> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> ---
> >>  meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb} | 4 ++=
--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb}
> (94%)
> >>
> >> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> b/meta/recipes-connectivity/kea/kea_2.4.2.bb
> >> similarity index 94%
> >> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
> >> rename to meta/recipes-connectivity/kea/kea_2.4.2.bb
> >> index fcdb4889d9..6bb7cb9164 100644
> >> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> >> +++ b/meta/recipes-connectivity/kea/kea_2.4.2.bb
> >> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Kea is the next generation of DHCP
> software developed by ISC. It
> >>  HOMEPAGE =3D "http://kea.isc.org"
> >>  SECTION =3D "connectivity"
> >>  LICENSE =3D "MPL-2.0"
> >> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dea061fa0188838072c4248c1318ec131"
> >> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dee16e7280a6cf2a1487717faf33190dc"
> >>
> >>  DEPENDS =3D "boost log4cplus openssl"
> >>
> >> @@ -18,7 +18,7 @@ SRC_URI =3D "
> http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
> >>             file://fix_pid_keactrl.patch \
> >>
>  file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
> >>             "
> >> -SRC_URI[sha256sum] =3D
> "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
> >> +SRC_URI[sha256sum] =3D
> "6e82fb319d3b871c0d39bbd504f2cda0c66fa1262865872985fb4fb91b4eaafc"
> >>
> >>  inherit autotools systemd update-rc.d upstream-version-is-even
> >>
> >> --
> >> 2.25.1
> >>
>

--000000000000f10a0f06372e2fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the update.<br><br></div><div>Thanks &amp;=
 Regards,</div><div>Vijay</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 9, 2025 at=
 10:07=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">st=
eve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sun, Jun 8, 2025 at 7:38=E2=80=AFPM Vijay Anusuri &lt;<a =
href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</=
a>&gt; wrote:<br>
<br>
&gt; Any update on this ?<br>
<br>
It should be in the next batch of patches sent out for review (within<br>
the next or so)<br>
<br>
Steve<br>
<br>
&gt; On Wed, Jun 4, 2025 at 11:07=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri=
@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Changelog<br>
&gt;&gt; <a href=3D"https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-Relea=
seNotes.txt" rel=3D"noreferrer" target=3D"_blank">https://downloads.isc.org=
/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt</a><br>
&gt;&gt;<br>
&gt;&gt; License-Update: Update copyright year<br>
&gt;&gt;<br>
&gt;&gt; Includes security fixes for CVE-2025-32801, CVE-2025-32802 and CVE=
-2025-32803<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-connectivity/kea/{<a href=3D"http://kea_2.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> =3D&gt; <a href=3D=
"http://kea_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a>=
} | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-connectivity/kea/{<a href=3D"http://kea_=
2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> =3D&gt; <a =
href=3D"http://kea_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2=
.bb</a>} (94%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2=
.4.1.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> b/meta/recip=
es-connectivity/kea/<a href=3D"http://kea_2.4.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">kea_2.4.2.bb</a><br>
&gt;&gt; similarity index 94%<br>
&gt;&gt; rename from meta/recipes-connectivity/kea/<a href=3D"http://kea_2.=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a><br>
&gt;&gt; rename to meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a><br>
&gt;&gt; index fcdb4889d9..6bb7cb9164 100644<br>
&gt;&gt; --- a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.2.bb=
" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a><br>
&gt;&gt; @@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Kea is the next generation o=
f DHCP software developed by ISC. It<br>
&gt;&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://kea.isc.org" rel=3D"nor=
eferrer" target=3D"_blank">http://kea.isc.org</a>&quot;<br>
&gt;&gt;=C2=A0 SECTION =3D &quot;connectivity&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;MPL-2.0&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea061fa0188838072=
c4248c1318ec131&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dee16e7280a6cf2a14=
87717faf33190dc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS =3D &quot;boost log4cplus openssl&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.org/=
isc/kea/$%7BPV%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_pid_keac=
trl.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-lib=
-log-logger_unittest_support.cc-do-not-write-.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;815c61f5c271caa4a1db31dd656eb50a7f6e=
a973da3690f7c8581408e180131a&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;6e82fb319d3b871c0d39bbd504f2cda0c66f=
a1262865872985fb4fb91b4eaafc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit autotools systemd update-rc.d upstream-version-is-ev=
en<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000f10a0f06372e2fe5--

