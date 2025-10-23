Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D47CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:37:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.17831.1761219470122834917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Z2zCewID;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d53684cfdso159807466b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1761219468; x=1761824268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eOGfumzRMPwRzYUlKGyOmhJnAR4uUZ8xvVc+TjtEvI=;
        b=Z2zCewIDcGqOfFSsE/rinQtv9eF1CVbO4floSEsuZ0Abkc8yTPZ5j2mfl8JO0ZdMWn
         w0cNoOq8LHMJ0eRWCnBf5N3EidS/lqREmQqfo5Y2/XGIoKB+838gLujg5IioBBWHRVTy
         N7R0AoQWA0pCGyvyKfqOlfPrPF57ROcrgY02I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219468; x=1761824268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eOGfumzRMPwRzYUlKGyOmhJnAR4uUZ8xvVc+TjtEvI=;
        b=SHKfyDGvo43PjEB6Hz4uzZgEbXDm1M2f8rJUSR9t1L8cEZDKAU10oU8+dUfUnxN8ZB
         tOJKqkUu15yDRoR+AAVnePJb/rpNN6IAN8R+em3iM/Iy0bD8qm5lzjBclICrJJof16B8
         TLpzUsZPafwaROslNr3CSMsBlVjNVjplY/QdC6HLrmgE+tV4aB4IJqQLsIObGS93L0kT
         5SAYMrBfdlQx9Vx7Ujvz5zcmJiFp6b7zppGy9anLeO358wHT3sLuUxIbP9uNhKU2KHKc
         TOqXLWVsfDXNZUBgnYlqOffyd34OdIaZ5HBBaVxkQ3Ht1rnihuNi3WDAX1h8eZumyy56
         ecTw==
X-Gm-Message-State: AOJu0YzkvmeWraBzvXzddWFgs1tSEMFDJGx42g3iz82DcnTi4KZU69lz
	GF7Hmi7sTiQahXrayR5ugu9uZRM7/28L4KF4947qwGnA2jntYmcJsB1+MZvZZnI7925j4/J0JhV
	M/aM+Ig5g0j30Wn+zIEl/TbqaiD38amGTzQtoGlIBlg==
X-Gm-Gg: ASbGncuQJuEzsUIwKEUx5azNBL5Bd1WxOcO33oq55Ix57b/hapT37IZClqvsfHrcmJH
	Md0lyR9kEJ0YmjnH2MXIvuwtWi7ifg1c06qVANSgqu74QCwrneskcQdawGZSitKkHjUfOnjCcKT
	uXt0ev5bLF0WYNYEFpl6/dsnWUS+s2j8zwB6S5Ck1/YWAfhHlok3aL5yDAQQB3Y53JS6vvTgZyw
	Munbi2PB+qpBBkK+uzAoP8kweyvbBPQV30RF07aGLSTNlXco0TTvdJUvb/B1JJ+SDc8b3rE/Ckd
	H857+/KVq9V+g2L3
X-Google-Smtp-Source: AGHT+IHb4OlGu+MKBpfK/FQenWuP28PM0SstWL+98fJC4eBleqg7MnS3WTesYvKSuGEF6O2Pvc6U89uBy7+PQ+RQRUA=
X-Received: by 2002:a17:906:ae5b:b0:b6d:3f8a:bda1 with SMTP id
 a640c23a62f3a-b6d3f8abee6mr323868066b.46.1761219468325; Thu, 23 Oct 2025
 04:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251020171026.2965650-1-ecordonnier@snap.com>
 <20251020171026.2965650-2-ecordonnier@snap.com> <CANNYZj-Prjhs710rHr1S4L4682Ta_=ADVgaFOqPTpNnR9QwPtg@mail.gmail.com>
In-Reply-To: <CANNYZj-Prjhs710rHr1S4L4682Ta_=ADVgaFOqPTpNnR9QwPtg@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 23 Oct 2025 13:37:36 +0200
X-Gm-Features: AS18NWCMaRNPNl5rO4p4jApPbeSN3QeQFlB7qYEAQpNM4HlYUU43gR_lWBcLyQU
Message-ID: <CAHUKmYZazUn6RZA3GZxDAmQ7MGKKd469rwy_EUkxxcrzf3xPaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c82f8d0641d1dcb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225245

--000000000000c82f8d0641d1dcb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was not merged yet as I sent the patch, so pending was correct, and
pending without any reason seems to be the standard used in almost all the
existing patches.

I'll resend the patch with the updated status.

On Thu, Oct 23, 2025 at 12:49=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Mon, 20 Oct 2025 at 19:10, Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> > +From: Etienne Cordonnier <ecordonnier@snap.com>
> > +Date: Mon, 20 Oct 2025 18:57:56 +0200
> > +Subject: [PATCH] config.h.in: fix typo
> > +
> > +Upstream-Status: Pending
>
> Pending without any reason =3D=3D grumpy Alex.
>
> This is actually a backport, please update the status:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDwIBaQ&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DTxd2N_EjxFdjqxkwk8alOMX5JreJ52tWF1YjtLksgVFjvSOSJI=
WhGIWGTVtW03Fy&s=3D-fs5LUzASqAmTqOx8ecIAib0uWq4U7HM_VUan9rqHC0&e=3D
>
> Alex
>

--000000000000c82f8d0641d1dcb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was not merged yet as I sent the patch, so pending was =
correct, and pending without any reason seems to be the standard used in al=
most all the existing patches.<div><br></div><div>I&#39;ll resend the patch=
 with the updated status.</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 23, 2025 a=
t 12:49=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Mon, 20 Oct 2025 at 19:10, Etienne Cordonn=
ier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"http://config.h.in" rel=3D"noreferrer" ta=
rget=3D"_blank">config.h.in</a>: fix typo<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
Pending without any reason =3D=3D grumpy Alex.<br>
<br>
This is actually a backport, please update the status:<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&am=
p;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAh=
kbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DTxd2N_EjxFdjqxkwk8alOMX5J=
reJ52tWF1YjtLksgVFjvSOSJIWhGIWGTVtW03Fy&amp;s=3D-fs5LUzASqAmTqOx8ecIAib0uWq=
4U7HM_VUan9rqHC0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://url=
defense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commi=
t_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&amp;d=3DDwIBaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3DTxd2N_EjxFdjqxkwk8alOMX5JreJ52tWF1YjtLksgVFjvSO=
SJIWhGIWGTVtW03Fy&amp;s=3D-fs5LUzASqAmTqOx8ecIAib0uWq4U7HM_VUan9rqHC0&amp;e=
=3D</a> <br>
<br>
Alex<br>
</blockquote></div>

--000000000000c82f8d0641d1dcb2--

