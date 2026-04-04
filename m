Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148A1E88D8B
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 07:41:52 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12373.1775288509824039557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 00:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AdwmcriR;
 spf=pass (domain: mvista.com, ip: 209.85.208.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso3397552a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 00:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775288508; cv=none;
        d=google.com; s=arc-20240605;
        b=i8LPuaB6Qskg9tbfJiqWgcFC2ilQFVLv1Ixuy/DXCpYCT/anKCpdzX20Ud87PNj9k3
         9rkaOjjhB6GTErgJgokOt92DC6Bvndm6zdgUohKJpwdcUSM5nL1zc1BE5xqIpmmXLGw5
         gW941e2ELby5zPaQCHV7/HzLf9677qcxar8IeRusE4KS8VQVgUi1KCBSKdnDNndpXsJK
         jrBribS5hloCbkRhzm1SzV8/QbZ+WQStJE4+SaNFJUlwwWV4xpnVGgDZNbK3Y1i3JayY
         eMDjuaywL0DqreRAGdcUGUQ5nQxWirV3MTy4uX2eN6LZy4yEpE9SD8JPnamUctk1Epam
         KfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eboMH2QpBhqPZrvGYWdk40IWiKrVv7a0w+ps/5ovNH4=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=BRsFcjC49ZPyUlizPyhC36u+Z8rVfFLJxmaZXWiFrOBR7NT/MfU4q3z2ddeqhsMX+A
         9mf9Hv3WpN8QPXWiKxz4UK6RwCdGKpDJhZvffARn73X4aMnFAJ1Irx4S/Er3dNvrGsD/
         4KlaRY81m/aZtj0ui+fM1llxrPkkCfK9Nb11WX7gyBnA++p6pvAFMRmOooot1hPcM3Jw
         imQwm6FGOX2dL/U48U476gwM/MHmRF5igypFU0C/3BTprTA4gJ+SAmvWWmjJBG9cNVE8
         Z4Qhzp6gTb8S6j8j5MDsHJHGsc7pDapSGffVCV1NChl8s/wtqw95fCIZQKjxJAeOzF2z
         H72A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775288508; x=1775893308; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eboMH2QpBhqPZrvGYWdk40IWiKrVv7a0w+ps/5ovNH4=;
        b=AdwmcriR57BihF+b/gTanpBCgXSSP3FVYOfFA6b8nkzdqFs4NrB8byzE3hss7AlaXU
         QIG3wn31qy+5ZgyaW7bcgfCg0ogz0HewSYxGTRGT9g4Rcsj4+Icqqj7jUz2MM6WJ5m6S
         L/4QaHeZFtMpDZ+Y5s3KekMM22AoWadXshkNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775288508; x=1775893308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eboMH2QpBhqPZrvGYWdk40IWiKrVv7a0w+ps/5ovNH4=;
        b=jRAkcVaDXMgO1rtLD68FVOz3v3QRgQS9PrLS1u16QdmOwXbfnsuW/f9KFPvqyiqSOl
         Dkf5WSHqc73mVSDCA8FqCJJpZ6vfO2qzk3QqTkWPFhoEWMbPF21f5xwq3TbgjwAbcYex
         PYW0NZJtlDl0SlR/6OTomazPWDQkOWC5JpnCrz65Ki9+byF+/4VNVlkLSW/cHCDuIucE
         SSkJS0jZRSbb3X6RE1lowQ8yVhirke++gWbc+vdZTtgpOtifmvBahkVoD9T4bcarFyU8
         GiF1AoosZE5hyFDaLoVcmTllzy9TFnva4L/vFyJdB/xi3HgTOj9JfWnNne+8mPQa80gg
         CA9Q==
X-Gm-Message-State: AOJu0Yw4Igb8GYFURFKBNV86fpPuox1jK20jeIQL5+11y+Lnq3DJV2EY
	AgcjIQNHNMKb5SGHy4HpNOLSREpCMu8aD61JzTMBV8IWy7E2ufFSVDPLpfo8HmITQIsR8osIa2Z
	FaPixpSUjfAc3uVz0LlnHmnVXHdqJ6W/RF8ZqB/Xf6g==
X-Gm-Gg: AeBDietkJwnGegN0nD6v4knSOgkO3VIDUPnIRKzi888qIkrXb5KkEGNrd1c5jpp+isB
	6UzeTtND6K3C3iqdO+9g/P9VluTOXDVOFzGQIckgkzkThh1WyrtTcIWpGDohIVGQ/BKrL+PynC8
	IyjQhH80vOz6NiZLj+LbzBEvsXrcT+s25U3w06BN4bXWJymOWRxhg1QS0O4/dfvp7fDn/GOXGXa
	y/veiUEfRTV1/XQv5Jm5/pfuPK+3mWTfElu+NdblPbzGZtOhoPw+GKDp5KwDfnkbidSFUlgml2y
	kLLvyvfRJGI5e/N/yDBMtCEjYPfVamKEaISpXVrgxnfq+KGcL0XS
X-Received: by 2002:a17:907:c002:b0:b9b:6869:bab0 with SMTP id
 a640c23a62f3a-b9c672f45b8mr322323666b.2.1775288507239; Sat, 04 Apr 2026
 00:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260402071559.292708-1-vanusuri@mvista.com> <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
In-Reply-To: <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 4 Apr 2026 13:11:35 +0530
X-Gm-Features: AQROBzDJ4uQButZtj_aGThaJgtxSMaOyIK9yvvB5Od3K59CcHkiSbJ3NiYWt338
Message-ID: <CANQUz183e_N3p7n1pSr4sXUP0QAHpytUZ=-akObn1HV3PXttqQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d91c77064e9d9007"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 07:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234609

--000000000000d91c77064e9d9007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

The fixes for this CVE are already included in SQLite version 3.51.3 on the
master branch.

I=E2=80=99ve already submitted backport patches for the whinlatter and scar=
thgap
branches. Please let me know if anything further is needed.

Thanks & Regards,

Vijay


On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Pick patch as per [1]
> >
> > [1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
> > [2] https://sqlite.org/forum/forumpost/761eac3c82
> > [3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
>
> Hello,
>
> As far as I can tell, this CVE applies to master. Since this is the end
> of kirkstone soon, I'll take it into the reviews series but can only
> merge it if there is a patch sent for this CVE in those branches.
>
> Regards,
>
> >  .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
> >  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
> >  2 files changed, 34 insertions(+)
> >  create mode 100644
> meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> >
> > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> > new file mode 100644
> > index 0000000000..86004c0b74
> > --- /dev/null
> > +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> > @@ -0,0 +1,33 @@
> > +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
> > +From: drh <>
> > +Date: Sat, 6 Dec 2025 20:41:24 +0000
> > +Subject: [PATCH] In the zipfile extension, only return as many bytes a=
s
> > + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
> > + 761eac3c82]. Adjust ./configure so that it builds zipfile into
> testfixture if
> > + ZLIB is available, so that tests get run on unix platforms.
> > +
> > +FossilOrigin-Name:
> 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
> > +
> > +Upstream-Status: Backport [
> https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789=
954bf8a
> ]
> > +CVE: CVE-2025-70873
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + shell.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/shell.c b/shell.c
> > +index fa45d40..3c4902c 100644
> > +--- a/shell.c
> > ++++ b/shell.c
> > +@@ -7668,7 +7668,7 @@ static void zipfileInflate(
> > +       if( err!=3DZ_STREAM_END ){
> > +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
> > +       }else{
> > +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
> > ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out,
> zipfileFree);
> > +         aRes =3D 0;
> > +       }
> > +     }
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > index acdd80022e..9e10caa399 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > @@ -10,6 +10,7 @@ SRC_URI =3D "
> http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >             file://CVE-2023-7104.patch \
> >             file://CVE-2025-29088.patch \
> >             file://CVE-2025-6965.patch \
> > +           file://CVE-2025-70873.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000d91c77064e9d9007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd"><span>Hi Yoann,</span></p=
><p class=3D"gmail-isSelectedEnd"><span>The fixes for this CVE are already =
included in SQLite version 3.51.3 on the master branch.</span></p><p><span>=
I=E2=80=99ve already submitted backport patches for the whinlatter and scar=
thgap branches. Please let me know if anything further is needed.<br><br></=
span></p><p><span>Thanks &amp; Regards,<br></span></p><p><span>Vijay</span>=
</p><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal &lt;<a href=3D"=
mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu=
 Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Pick patch as per [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://sqlite.org/src/info/3d459f1fb1bd1b5e" rel=3D"no=
referrer" target=3D"_blank">https://sqlite.org/src/info/3d459f1fb1bd1b5e</a=
><br>
&gt; [2] <a href=3D"https://sqlite.org/forum/forumpost/761eac3c82" rel=3D"n=
oreferrer" target=3D"_blank">https://sqlite.org/forum/forumpost/761eac3c82<=
/a><br>
&gt; [3] <a href=3D"https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18=
c8f5ab072054" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/=
cnwangjihe/f496393f30f5ecec5b18c8f5ab072054</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
As far as I can tell, this CVE applies to master. Since this is the end<br>
of kirkstone soon, I&#39;ll take it into the reviews series but can only<br=
>
merge it if there is a patch sent for this CVE in those branches.<br>
<br>
Regards,<br>
<br>
&gt;=C2=A0 .../sqlite/files/CVE-2025-70873.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 33 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 34 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70=
873.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/=
meta/recipes-support/sqlite/files/CVE-2025-70873.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..86004c0b74<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: drh &lt;&gt;<br>
&gt; +Date: Sat, 6 Dec 2025 20:41:24 +0000<br>
&gt; +Subject: [PATCH] In the zipfile extension, only return as many bytes =
as<br>
&gt; + Inflate actually generated.=C2=A0 [forum:/forumpost/761eac3c82|Forum=
 post<br>
&gt; + 761eac3c82]. Adjust ./configure so that it builds zipfile into testf=
ixture if<br>
&gt; + ZLIB is available, so that tests get run on unix platforms.<br>
&gt; +<br>
&gt; +FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda21=
6c6a4c26160909<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlit=
e/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb=
70feac9f789954bf8a</a>]<br>
&gt; +CVE: CVE-2025-70873<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + shell.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/shell.c b/shell.c<br>
&gt; +index fa45d40..3c4902c 100644<br>
&gt; +--- a/shell.c<br>
&gt; ++++ b/shell.c<br>
&gt; +@@ -7668,7 +7668,7 @@ static void zipfileInflate(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if( err!=3DZ_STREAM_END ){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zipfileCtxErrorMsg(pCtx, &quot;infl=
ate() failed (%d)&quot;, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}else{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_result_blob(pCtx, aRes, nOut, zi=
pfileFree);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_result_blob(pCtx, aRes, (int)str=
.total_out, zipfileFree);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aRes =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.3=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a> b/meta/r=
ecipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb" rel=3D"noreferre=
r" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt; index acdd80022e..9e10caa399 100644<br>
&gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt; @@ -10,6 +10,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.sqlite.org/2=
022/sqlite-autoconf-$%7BSQLITE_PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_=
blank">http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz</a> \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-7104.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-29088.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-6965.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-70873.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;5af07de982ba658fd91a03170c945f99c97=
1f6955bc79df3266544373e39869c&quot;<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000d91c77064e9d9007--

