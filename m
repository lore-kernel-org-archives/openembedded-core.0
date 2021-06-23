Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web09.5695.1624443484507411259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 03:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o2/7oqA4;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id c17so657727uao.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnvuxxmNKXKFokxqD8WjcxYHMQRLH9+WK3pPpJNF0MY=;
        b=o2/7oqA4w5CDpBnfk9Usv16MM6TnUZ2eRMfWpV5fZBeWREjuLCi1iB7IyHOFpPnWn8
         bFGS0DbLFgV+UOrsziwDMh2D6CwK9nA1H6h/R8BxBoOB4mDDN5RO5BQNiN3NEd1B80sJ
         Hml1014rVUbqAWk2LK+t8lpZSo3eyyr7NTPCIBE23ADO1S8R1vQNt3Xpj/tX4WMf4f8G
         EeU/pyMuYReAbb1sD0mMrLJndnQHi1jSETTWgjGE23SL37BbTvKaerU6x9MKSB32aMC+
         f63DKnPYYW/yZO20ybsZpCQkhcFMUxQcx9EIo5W5kOB5gdq1ICEfYVLNQGOCPh7M6fmX
         a5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnvuxxmNKXKFokxqD8WjcxYHMQRLH9+WK3pPpJNF0MY=;
        b=lLSgMCnCthG/V45057sF937ez+tW1omdAtWxqsH3syZ90ruhxZ8975UHOjEfq763xF
         azpVtFac1bsvYGCbzE8emvQun3r9kfVYNMSX2GVNq18Nqit2NNzvsZP0x8D9IhL/BKo/
         bcz5bfRVKowJQ6taMwEbXVSOTx7OrggKL/4smwDwbsYGM+SmzjFwICKt3pWmHSE7+c4L
         8o3zsD/fOObkWwRAi0LHpsLG2jKH8nsWBfbxlB+CAkKfJ9Zp8jxBB0UeCpDnmSTO9zZb
         gLG6zER+OdmZJaNENG9UkIKl4koa42pfKUjnmAsJuYprGYgAR1OInAjMHQnFTVlaUxxw
         azkQ==
X-Gm-Message-State: AOAM533jwBneSG1o+J8oUbMZirCFXXe6rmGMJxfxWJ/qoH2kCfB7EB51
	+rgSdhFU32lcab0vmMBWABFmEDIGx4q9uqd+JzA=
X-Google-Smtp-Source: ABdhPJy46xe57BwM0taiWxnEFWS/zJtF/3EU8SOvWFucoc6uxKhenO20swpj1n87YN7ng7eWfs8l+kIDZhlPG+WjGWI=
X-Received: by 2002:a9f:31b1:: with SMTP id v46mr3672699uad.22.1624443483538;
 Wed, 23 Jun 2021 03:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210622192723.2041345-1-alex.kanavin@gmail.com>
 <3324.1624431667479717516@lists.openembedded.org> <CANNYZj_wbfFtDL+8HSAJzqvrmx+y0ofbmmrve91qBd8PfO9WFw@mail.gmail.com>
 <6dd3291340e74358bdd444d563077690@XBOX03.axis.com>
In-Reply-To: <6dd3291340e74358bdd444d563077690@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 23 Jun 2021 12:17:52 +0200
Message-ID: <CANNYZj9M5diDQ_jirzug2rRDCugTrCnhjHS7a6tXNwBrMAFwvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi: set SRC_URI with =, not with +=
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb4b0505c56c382f"

--000000000000cb4b0505c56c382f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Frankly guys, I think maybe we should just break stuff in this case, and
have it fixed up properly, then try to guess what workaround might work.

From that perspective the original patch is the most clear.

Alex

On Wed, 23 Jun 2021 at 11:26, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> I suggest you use =3D+ instead of _prepend to maintain expansion order.
> I.e., if someone does:
>
>
>
> inherit pypi
>
>
>
> SRC_URI =3D "http://some_url ${PYPI_SRC_URI}"
>
>
>
> However, any way you change it, you risk breaking someone=E2=80=99s use c=
ase, but
> I believe using =3D+ instead of +=3D should be the least invasive change
> compared to the current version.
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Alexander Kanavi=
n
> *Sent:* den 23 juni 2021 10:34
> *To:* Konrad Weihmann <kweihmann@outlook.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] pypi: set SRC_URI with =3D, not with +=
=3D
>
>
>
> Right, I sent an updated patch.
>
>
>
> Alex
>
>
>
> On Wed, 23 Jun 2021 at 09:01, Konrad Weihmann <kweihmann@outlook.com>
> wrote:
>
> That doesn't look completely right to me.
>
> You're absolutely right about devtool expecting the tarball in as the 1st
> item, but this patch here breaks existing recipes like
>
> SRC_URI +=3D "file://some.patch"
>
> inherit pypi
>
> as the patch will now be dropped.
>
>
>
> I would suggest to go for SRC_URI_prepend =3D "${PYPI_SRC_URI} " which fi=
xes
> the issue *and* doesn't break exisiting setups
>
>
>
>

--000000000000cb4b0505c56c382f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Frankly guys, I think maybe we should just break stuf=
f in this case, and have it fixed up properly, then try to guess what worka=
round might work.</div><div><br></div><div>From that perspective the origin=
al patch is the most clear.<br></div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, 23 Jun 2021 at 11:26, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kj=
ellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"SV">
<div class=3D"gmail-m_8302431373630051666WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
I suggest you use =3D+ instead of _prepend to maintain expansion order. I.e=
., if someone does:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)">inherit pypi<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)">SRC_URI =3D &quot;<a href=3D"http://some_url" target=3D"_blank">http:=
//some_url</a> ${PYPI_SRC_URI}&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
However, any way you change it, you risk breaking someone=E2=80=99s use cas=
e, but I believe using =3D+ instead of +=3D should be the least invasive ch=
ange compared to the current version.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)">//Peter<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)"><u></u>=C2=A0<u=
></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Alexander Kanavin<br>
<b>Sent:</b> den 23 juni 2021 10:34<br>
<b>To:</b> Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" tar=
get=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<=
br>
<b>Subject:</b> Re: [OE-core] [PATCH] pypi: set SRC_URI with =3D, not with =
+=3D<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Right, I sent an updated patch.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, 23 Jun 2021 at 09:01, Konrad Weihmann &lt;<a=
 href=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p>That doesn&#39;t look completely right to me.<br>
<br>
You&#39;re absolutely right about devtool expecting the tarball in as the 1=
st item, but this patch here breaks existing recipes like<br>
<br>
SRC_URI +=3D &quot;<a>file://some.patch</a>&quot;<br>
<br>
inherit pypi<br>
<br>
as the patch will now be dropped.<u></u><u></u></p>
<p>=C2=A0<u></u><u></u></p>
<p>I would suggest to go for SRC_URI_prepend =3D &quot;${PYPI_SRC_URI} &quo=
t; which fixes the issue *and* doesn&#39;t break exisiting setups<u></u><u>=
</u></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000cb4b0505c56c382f--
