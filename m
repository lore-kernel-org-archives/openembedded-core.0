Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC91710F92F8
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:46:21 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2703.1774986375240671897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BIVj3KwV;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-793fdbb8d3aso30473777b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 12:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986374; cv=none;
        d=google.com; s=arc-20240605;
        b=QI6ORikT3Aa6BWiRvGd9YjcCoWxYBBySbNxdwKt+OjsqWFZj/9Rvg2aBEBBFDxyH9m
         UoSBXPaOv8n5+jk6gQ9XBR7Eh7LYz6VSKKV7HbfvP4+IgQTJ7z8w7XyhjbDWYkVCrrMf
         4z/pCasFZ/RmFxy+q8wIEf4CdEdh+VB4TougEr+PGg3OyViZVsHiJFhyMxDUeNwmGtsT
         aYznNIXsvD5vtT5sNsnrAGXILxnhVcVUb7J+/8v43vR9DUz8br8G+c9e9Xt93eJqTORE
         5ddj5fVKRlo0oKxR9glKNyACk15S5x1ow9l9SNj9Uc6TnvwBlYX70RPXsp1pymoTgijP
         RGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tgnBpU4b8HPKxU6GGYVjUUbq+DCgB7mfoGZgHBxPvco=;
        fh=60kcjWZkpuAziHmtoF1o4lW48dDpNGI9yFkZvsGNMyI=;
        b=ODBCrybxfBV31Fz+RlWI13iQhS3ur+rzjzLK8p2IcreOCKyViOzLvVWEno1MwjGraU
         mRUpQ/dq9FJNHmHwFgZoEMLxB2kdYF7KUTE6XgIdKgGA/QDblL3MKqon40Bd68bEnT+9
         kax3N/dwJbJVbdjo9BsVs5E/XlgBI/zt9PRMhJoalkMz12WxOSQpg/Zsp76Didez6tB6
         5Fp0gfJPxuyfaJYnml3aykjD+KzBDijeA65bJMgH+RRgtdBMPyii2ipvKI1TQPVF+BWr
         +ygl9IFAMB3kgz/pII7w7VlDveu4RYxQW688c1+agk2Qojv9VbJquU52CV7gUP1PRFDw
         kh7Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986374; x=1775591174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tgnBpU4b8HPKxU6GGYVjUUbq+DCgB7mfoGZgHBxPvco=;
        b=BIVj3KwVky/FfEue5Ixp0LzAU9+Ufqj82t77fWT0nnb5o2lYaWRUvnNpfcYq6cUbJ3
         KeQYNIltE4lQe8vNwLA+jY//lxwHfniJ8uja3kfD/8pnCB/b9o8+lzPFovHFCxbjs4QO
         UiwM9E4mk91JWfFBZRUv8ubc5zu4bu6kviKQ0NSPR2uB3djCjtbt7vEYP4rttwJnfzm3
         mctSHs4Fuj0+ujcY5RtiRVmExuOAnHrBsKMS+zsDYI8Gxo/lkw1zf6X6EOba6F/H01Vq
         NwQeB+EZRpcUZGbA8dLEVUwf7LEDtbcqqAu0tpBq46rxoWVIqVwO3xG63behnj9gmC/T
         7Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986374; x=1775591174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgnBpU4b8HPKxU6GGYVjUUbq+DCgB7mfoGZgHBxPvco=;
        b=b47GALy68hLsQaI+/2SedGb6trbAiH1CuW7l2ZB/zm6ylht8IB54iBdx5fy19NnkT3
         ElgHsngdTiJlNuxhLEfeaEGrLje+no/DIhV56SW8G2lU4uD4N3WT5eDJWQM1gWzSyyqu
         R/BpjIAUcbJggHmjizhlV1B9F3V2sovNuLlZNBbhRe1GGXc5dkFQvV2Kk914lkyHBxVc
         nCKaVWNWzIUetbFkhVH3yf0lPVJWBQ/iae/HQMpGefxb3X8U3bwoLTFf9h3nqh5xlClH
         O5SIRmEBf3S2ba0pc0gENPQ+57HsMtewgUxNaZlrJ1jKpzP8uOX0mf3Rq4dY22ulGu58
         r6TA==
X-Forwarded-Encrypted: i=1; AJvYcCWWydVxuaoS0GPt3w7Ircvrc7PT+jKddxqOyP8I70DqKbAHm033CbdPa7YvOfzsSCDqxIUYAzuRtBi4va9DvC1hhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAao39Hqve6z0URlPpwA3QMGe9+f4tzkPZndQrK5ahSO6LgJw0
	MGULHanvSQhnSwhHtobQ8CbfAok27ih0MkDRFgpnhYY6OHcX3C5M48lgccIrW+h2hfmJ7fYhgXo
	+g3pZKSXodfQ7YX29JRI5xQZ+NZF0ZGvQZg==
X-Gm-Gg: ATEYQzxXwkJNwVJWO5LgK2dYkEygRY0gLLeZwjP2iFPN6MTGSH2gBtIcTe7/QQAskGF
	aPeLek8NFFoURElJEY/cL5F3BkdspHfQJ6Fz7gm3DER3XzHr2SKbng5zrdQLOOvh7vDIsEO3jvE
	AZsXckHXjboMcr3VznhtqtAEvP6/66SPL+Fk6sQEEldhXylRnwNnSH9Af+hTkKVBiCwTYg+kECR
	kdvxWtPFcC1AxCRfW2Pn2/Js9PO/ku831HRonL+QpPS5bRm13H959d/Z8YF61c2mVdA11pTgQE0
	ydXi4kpuM/lvdN6QTbh/8kE2v/LW4phQjoRisfKjaq0T182+fquJJkdf/pT79hBCF2Zm27g5csq
	kuTd26xB7IiX8nso0avD8yaTqQwo=
X-Received: by 2002:a05:690c:6f11:b0:79a:c40d:b734 with SMTP id
 00721157ae682-7a212636809mr8550717b3.48.1774986374234; Tue, 31 Mar 2026
 12:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260331081246.73406-1-thomas.perrot@bootlin.com> <acvqE8lCFwxJesUk@navimatix.de>
In-Reply-To: <acvqE8lCFwxJesUk@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Mar 2026 12:45:47 -0700
X-Gm-Features: AQROBzD8UiSObuGS_0tZADFnFcdJnNycm-kY8I2b8nCH5Q3P8UXKLQOTqRPEdsE
Message-ID: <CAMKF1so2416tJiJrPw8KQeJCXY-S=SQsGiJMjGE2d6T86NJznQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lto: disable for expect and add DEBUG_PREFIX_MAP
 to ldflags
To: joerg.sommer@navimatix.de
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000514640064e573808"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234313

--000000000000514640064e573808
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:40=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> Thomas Perrot via lists.openembedded.org schrieb am Di 31. M=C3=A4r, 10:1=
2
> (+0200):
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >
> > Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
> > TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
> > is applied consistently alongside LTO flags.
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >  meta/conf/distro/include/lto.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> > index 8752249685a4..c66dfc5a8074 100644
> > --- a/meta/conf/distro/include/lto.inc
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -4,6 +4,7 @@
> >  #
> >
> >  # Disable LTO for following packages
> > +LTO:pn-expect =3D ""
>
> I suspect this is due to the gcc bug not because LTO is unsuitable for
> expect. Might it be a good idea to move all excludes due to the gcc bug i=
n
> its own block? This would make it easier to revert them when the bug gets
> resolved.
>
>
I also wonder if the issue is gcc specific and works with TOOLCHAIN =3D
"clang"


> >  LTO:pn-glibc =3D ""
> >  LTO:pn-gcc-runtime =3D ""
> >  LTO:pn-libgcc-initial =3D ""
> > --
> > 2.53.0
> >
>
> >
> >
> >
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234304):
> https://lists.openembedded.org/g/openembedded-core/message/234304
> Mute This Topic: https://lists.openembedded.org/mt/118593189/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000514640064e573808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31,=
 2026 at 8:40=E2=80=AFAM J=C3=B6rg Sommer via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailt=
o:navimatix.de@lists.openembedded.org">navimatix.de@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
homas Perrot via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a> schrieb am Di 31. M=C3=A4r,=
 10:12 (+0200):<br>
&gt; From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" t=
arget=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; <br>
&gt; Disable LTO for the expect package and append DEBUG_PREFIX_MAP to<br>
&gt; TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping<br>
&gt; is applied consistently alongside LTO flags.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootl=
in.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/lto.inc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/inclu=
de/lto.inc<br>
&gt; index 8752249685a4..c66dfc5a8074 100644<br>
&gt; --- a/meta/conf/distro/include/lto.inc<br>
&gt; +++ b/meta/conf/distro/include/lto.inc<br>
&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Disable LTO for following packages<br>
&gt; +LTO:pn-expect =3D &quot;&quot;<br>
<br>
I suspect this is due to the gcc bug not because LTO is unsuitable for<br>
expect. Might it be a good idea to move all excludes due to the gcc bug in<=
br>
its own block? This would make it easier to revert them when the bug gets<b=
r>
resolved.<br>
<br></blockquote><div><br></div><div>I also wonder if the issue is gcc spec=
ific and works with TOOLCHAIN =3D &quot;clang&quot;</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 LTO:pn-glibc =3D &quot;&quot;<br>
&gt;=C2=A0 LTO:pn-gcc-runtime =3D &quot;&quot;<br>
&gt;=C2=A0 LTO:pn-libgcc-initial =3D &quot;&quot;<br>
&gt; -- <br>
&gt; 2.53.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Navimatix GmbH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T: 03641 - 327 99 0<=
br>
Tatzendpromenade 2=C2=A0 =C2=A0 =C2=A0 =C2=A0F: 03641 - 526 306<br>
07745 Jena=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.navimatix.de" rel=3D"noreferrer" target=3D"_blank">www.navimati=
x.de</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234304): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234304" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234304</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118593189/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118593189/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000514640064e573808--

