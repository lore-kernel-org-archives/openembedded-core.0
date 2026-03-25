Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4C91098792
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:16:57 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13670.1774405015939540341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kKhHysaY;
 spf=pass (domain: mvista.com, ip: 209.85.208.41, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66a87eb232bso141101a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774405014; cv=none;
        d=google.com; s=arc-20240605;
        b=aTwnrT1MiCTac0llURNSqIr/zYdmI/xTjpRQTyLmFxIrLSniQh811KJCju94gHeeze
         SQXQsA7VU3cXfwxy2SZ+Rrc41NJBzOOk9Lf6q4EgFONQh4OdTwG45ohddMKEVFAiQST5
         VeB3fiT/JVPIneTQabtDq7TPxz+WcGce8cVM6/EPNmJioyy2JHfhFElNWTI4MGvUbAgq
         lyWConoGx7pW88wBZTjOoTgEpEepybZa1ZbrzeWpNVuXIDnyvCEzS5A4RGpKf6S434JN
         9Enz3vEF+umDG7ma5qw8Sfs/ZIBREE75eV1Guj98A7Po6jD5dKkJ0S5vqNyNu+zSL6TF
         Upgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ugIm5pm8CS1efi6EMP5aVDkKH5DxC7YPrDe2qNf3iLw=;
        fh=JlJccUp0jOCuOK69E6g8hCwJjOXzngxHq8T8TvlQiwI=;
        b=Ol+gtai0WwXjIcRH953rj9lSNOHb4LL9zSu/MmXtSYj/XPEJ/PjEhx1j6FJ6OhsHsI
         hfmgell1Ce3kN7NHlWhAf+7bYOU+gxPezreg6g8tptVF2C9KdB0JWWKKZGuCjgJ1LOaw
         DboGRLfG/YeUDmFPcw3CW/F2E6AyBeEJE7sIUlfGjDNS1uK7XTiYWBdQwKS4pqIX+a2i
         RWizLS0LF0WQHDTJwV01tMGOuHMcS8H9kaAKUSsfHuE4WfOQ8kNU5ENRxJuejGUqRBZ5
         CcTxLZAPwb51iy3IMelafEspUVyYSanhLD1TFLkVsRRNZcrqPmIReoYTt+h/OZClj8+3
         TAZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774405014; x=1775009814; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ugIm5pm8CS1efi6EMP5aVDkKH5DxC7YPrDe2qNf3iLw=;
        b=kKhHysaYLJ3nr1wCtw/8JGqlJX53g6wlf1TjHXnb5MdwdSjtzqHtTH5dKYwjGCbtNL
         VOs7oyz02oFyDWx4+eptTJQBmpcUeWyEp2SxEz3hdo71b+yTPdR2AWoM0CzemMk8TTZ+
         ir+gXAVGWj8XAypxMF5KVFupXQrohNkvHRJE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405014; x=1775009814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugIm5pm8CS1efi6EMP5aVDkKH5DxC7YPrDe2qNf3iLw=;
        b=AtDC4tx091NgMfiltykwTqNnoVSRu3++6LwJBnk+zuFGC30Za8sP0AWpYZkKwkyAZW
         h05Ok+cwvfKJh+hKZ4YzbHhI64jIfwWHTg5TgfC1FJeqjDCoaELxDP6n9LNuM2jnDVoD
         xi1+pcQwiO4WW0vU0XmeCFJU4k6r3BWgzkjmRK6UCaNAUx+oiY7vfNo/2ogixtCrAfpC
         rZzdY89rvvA5JNymK+QppBIke2pS4eAkbd2UAwscLMlDi28rzAV01kU1sTOmo2eQeWW/
         1XjarONiHeI2NXnmcN7cCe51qQ+ylxjstp4zzQ3WyW7yXX0U93lTTA7OcdibyN2gsF8J
         cKww==
X-Gm-Message-State: AOJu0YxaWRP3ptm94UVTruyhXIuvnPyzQdJcIpm227VQaof3f1S2QUR1
	JFLnIxPuu8qEyqJ43Jfm7U1OflW6fzcjVm6VIB+2POtUSCv2HW6UxqFv+6NXUsewryP74szQEHS
	Q8SaNDBtI9aUeQ9jh54WPJS0fifhn57B3n0/DDiFmxoxVAcqFJmogcXE8Qw==
X-Gm-Gg: ATEYQzyNpjzDs/5DS12liTg/Iccp99gTyQ7Q2JKnbMjWc9TCTINfQ2sdHVwKEZjJc20
	nz25M50wVFV6zTvLdUdquCwS0bKVdkf5zgUgJQ9A31958ymjsfDEacgJmT0lY821Sfa1cahMXW7
	KaKjFoyCE6dcCFo3u1chMV707ZtHvj58WgWIGMDIYz6T4FMaXA8+0dJz8rvRX6u1MPwzMsj9Fc9
	DSPROUL4wOf/YjNDPez3HjNFJM7pAi+eV/W5zelAyN9PXymh9sEVm/EP7kg8mDIdyLh48ZQin0U
	TYonR1Zx7AgfssSxL31aGh3a/qfLNWR6ciUIoePhruocUDHx6Q==
X-Received: by 2002:a05:6402:52c7:b0:65b:f342:d1a2 with SMTP id
 4fb4d7f45d1cf-66a82618331mr895735a12.6.1774405013248; Tue, 24 Mar 2026
 19:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 25 Mar 2026 07:46:41 +0530
X-Gm-Features: AQROBzC16PN_1zITOEcPwlqC13SryICmE332KSIG7boXpGKRnmAOmMr4vL6JIgY
Message-ID: <CANQUz18HPaT0d=QO6ZcENZUbZbxqODKDXGJUYkzEopGJ0NAK0g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/3] tzdata,tzcode-native: Upgrade
 2025b -> 2025c
To: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Cc: Paul Barker <paul@pbarker.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ankur.tyagi85@gmail.com
Content-Type: multipart/alternative; boundary="00000000000080a6d4064dcfdcd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233838

--00000000000080a6d4064dcfdcd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this ?

Thanks & Regards,
Vijay

On Sat, Mar 7, 2026 at 12:15=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Paul Barker <paul@pbarker.dev>
>
> This release mostly changes code and commentary. The only changed data
> are leap second table expiration and pre-1976 time in Baja California.
>
> Full release notes:
>
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKY=
LMAQRZRFTERQ33CEKOW7KRJVAK/
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc
> b/meta/recipes-extended/timezone/timezone.inc
> index f21bedf4fc..35f22d5a15 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION =3D "base"
>  LICENSE =3D "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
>
> -PV =3D "2025b"
> +PV =3D "2025c"
>
>  SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;nam=
e=3Dtzcode;subdir=3Dtz
> \
>
> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;nam=
e=3Dtzdata;subdir=3Dtz
> \
> @@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
>
>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>
> -SRC_URI[tzcode.sha256sum] =3D
> "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
> -SRC_URI[tzdata.sha256sum] =3D
> "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
> +SRC_URI[tzcode.sha256sum] =3D
> "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
> +SRC_URI[tzdata.sha256sum] =3D
> "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232604):
> https://lists.openembedded.org/g/openembedded-core/message/232604
> Mute This Topic: https://lists.openembedded.org/mt/118185146/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000080a6d4064dcfdcd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update on this ?<=
br><br></div>Thanks &amp; Regards,<br></div>Vijay</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Mar 7, 2026 at 12:15=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=3D"_blan=
k">paul@pbarker.dev</a>&gt;<br>
<br>
This release mostly changes code and commentary. The only changed data<br>
are leap second table expiration and pre-1976 time in Baja California.<br>
<br>
Full release notes:<br>
=C2=A0 <a href=3D"https://lists.iana.org/hyperkitty/list/tz-announce@iana.o=
rg/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/" rel=3D"noreferrer" target=3D"_=
blank">https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/T=
AGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/</a><br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=
=3D"_blank">paul@pbarker.dev</a>&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-b=
riand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&=
gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/timezone/timezone.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-ext=
ended/timezone/timezone.inc<br>
index f21bedf4fc..35f22d5a15 100644<br>
--- a/meta/recipes-extended/timezone/timezone.inc<br>
+++ b/meta/recipes-extended/timezone/timezone.inc<br>
@@ -6,7 +6,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0LICENSE =3D &quot;PD &amp; BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc679c9d6b02bc2757b3ea=
f8f53c43fba&quot;<br>
<br>
-PV =3D &quot;2025b&quot;<br>
+PV =3D &quot;2025c&quot;<br>
<br>
=C2=A0SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zones/repositor=
y/releases/tzcode$%7BPV%7D.tar.gz;name=3Dtzcode;subdir=3Dtz" rel=3D"norefer=
rer" target=3D"_blank">http://www.iana.org/time-zones/repository/releases/t=
zcode${PV}.tar.gz;name=3Dtzcode;subdir=3Dtz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.iana.org/ti=
me-zones/repository/releases/tzdata$%7BPV%7D.tar.gz;name=3Dtzdata;subdir=3D=
tz" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-zones/rep=
ository/releases/tzdata${PV}.tar.gz;name=3Dtzdata;subdir=3Dtz</a> \<br>
@@ -16,5 +16,5 @@ S =3D &quot;${WORKDIR}/tz&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.iana.org/time-zone=
s" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-zones</a>&=
quot;<br>
<br>
-SRC_URI[tzcode.sha256sum] =3D &quot;05f8fedb3525ee70d49c87d3fae78a8a0dbae4=
fe87aa565c65cda9948ae135ec&quot;<br>
-SRC_URI[tzdata.sha256sum] =3D &quot;11810413345fc7805017e27ea9fa4885fd74cd=
61b2911711ad038f5d28d71474&quot;<br>
+SRC_URI[tzcode.sha256sum] =3D &quot;697ebe6625444aef5080f58e49d03424bbb52e=
08bf483d3ddb5acf10cbd15740&quot;<br>
+SRC_URI[tzdata.sha256sum] =3D &quot;4aa79e4effee53fc4029ffe5f6ebe97937282e=
bcdf386d5d2da91ce84142f957&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232604): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232604" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232604</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118185146/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118185146/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000080a6d4064dcfdcd5--

