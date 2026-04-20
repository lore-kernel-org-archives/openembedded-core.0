Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A379AF588DF
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 14:27:03 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20645.1776695222709944887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 07:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vZyek1p+;
 spf=pass (domain: smile.fr, ip: 209.85.218.48, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba8472c1613so131406366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776695221; cv=none;
        d=google.com; s=arc-20240605;
        b=W/A6FUpvY24vkJphTZtX0XQzUguIWAqCgZ0t4cb6C6BBAx6aWhp8v14kI70RUvH/0F
         mekbn2ac/aKKS76SsGKh+eDNnV/FQrl6RtbKUer04p0HYGat3AXX9OMKYMNkn8cMeRgV
         ysPENozUq5Qlk9Av5WTq99woXrf7asXlrnKFFKl0rLXkA5NimR67CC7BDNQ48esuS7Om
         s1Z7F/RL4hYZrI6LoFLnKzbIvhU70ys0r/TShc8czBvpTA7+7FpzvKJYckpBHgcr4lIO
         WkysqIxpf2l/T1bZzrhBVo2/Uqa6V5dMA6SlYg/8Xh55eYXEuS/ZJnF8KAQ4AVbJ+Qx4
         4qBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mf7z2IMT/n4rhC/AIHw+IE4wssso4DQefJpoI6du8yM=;
        fh=iuh7a7WO4MHJcgXMAsTgtgz6Gu8xH5WATMAPKsgVKvk=;
        b=eslavghvc9gxLonAhMaUMyjtM0eBNRcTNV8DHTns3YdtisvWr4scMYDQExJ3wwIjSF
         4mFB19nQf/64hXtwJwLQpwf1Xnvo2dRCfSpwnH/gvnebf8WT+8MMf9xivEYCJKRYUGw2
         qElAtaO3jfbLqstf77Q08A5KtsXbUzO5J4blEmDo8U7Ek+xN65+NWPCQS6g3EuE7nqkN
         C0hhEm56xqiZeNYSjLpco25pPglPpbZ9fup1YghHGCxLPJ6Brd4Hp12eCj0mZomujVjY
         rbet7EeRB8OKIy680DiCwBB2+bcO6QAB2zUu5ityM1od/4GWVUPwYSape4U2LH8o5sOO
         MfUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776695221; x=1777300021; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mf7z2IMT/n4rhC/AIHw+IE4wssso4DQefJpoI6du8yM=;
        b=vZyek1p+hWSl+hu4kLxMM7vSWrT5VcLnNsO4M93ruG8j2ViezdyT93Imj8C7FoxxmJ
         xFd/b5FRYFmBsaglJfhgX24n5aB6m0fW81feqAGPzuFE1Hi/W/L9qxa6QWNS96nl2BcE
         U0zfUGsRXq1y734FFpBfSBM8EFzkTJMzgxEUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695221; x=1777300021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf7z2IMT/n4rhC/AIHw+IE4wssso4DQefJpoI6du8yM=;
        b=quppSXMz+OlpPisjqQB6t4hi1jTB63U1N+7AvZIelFYy6zU2HftG+veXwBXDeVWbRI
         0tJ/x22G2H9O1JLHWZmlnOInTMQR7g3y1Y5y8eEfckvAl8tolNd30xAGwM4a/+3ucwzr
         ohM+rmH1BJ6p1LYg1iimMYeZqTlDIyaZO3p0FJYcLkX9Ec2UsmVlRBhGEv2jGkEvd87u
         ELaMB/optsJhDALoaARn6ttnPNJSHQN2qZJCKUDQiL8Ev61vme5qzs6Wj3uyL5Vqc4NW
         X4flDFP+lhyMh5qBf2W1Soj2qzE3NxyZjf/RwtOCBv20j5DG+cOwuQ2Keq0NoFgjiMzk
         mAnw==
X-Gm-Message-State: AOJu0YzibJ8SmEVdTRDg/BZ3u+t8wKk0uOfZnMHKhDaU4XTa+8ArdbTg
	1FCXsT6V9vgJnHXblQ6f+Dtc/AcJh84/vmood4Of65ApeedKLCmLF0pe52uKVtulzh1DYM4f+tN
	K7hlX+PNpfKNH52yDrTZxDhxe5GGRK8uc28I5FYi8QQ==
X-Gm-Gg: AeBDiev/x6oPTcvBaoF4ygXsDi9T1HzawKyMcWvGUc1nRncBTdQJ112QhY83XjdPsyU
	sYAcxfsrFkXQ/nEyJUJPYhSv2X+gUZ3lFgT6x7B4rTYkuvqLP4bQT4n9Qpx2mfAT9QtXALNl7oa
	+AJio83UJyR3ZgKHvXiid1bOy2/0MuK47St5w72Xh0MSmgLjBKFtMHmbP1Up0Sh9FnBE0D+PJAO
	xC3akWXs4HsU13In8SehGJ53UgIssFI1wUAzmSRoMd12dHOWvk9ZoSwiP/LZRZW2CYZApjmx1gF
	RaiPVAqsS6206tZWenzH
X-Received: by 2002:a17:906:4786:b0:b9d:2fce:308c with SMTP id
 a640c23a62f3a-ba41a0474d6mr659211866b.30.1776695220934; Mon, 20 Apr 2026
 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260420133804.443583-2-corentin.guillevic@smile.fr> <DHY12B5ZXWHW.216QNH8DEQW4Y@bootlin.com>
In-Reply-To: <DHY12B5ZXWHW.216QNH8DEQW4Y@bootlin.com>
From: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Date: Mon, 20 Apr 2026 16:26:49 +0200
X-Gm-Features: AQROBzCa2UXO7GDiLRc5z3cW9F2bmj4Ed2zUXxuTHxngdapK3Ctx0_kNSzw44jQ
Message-ID: <CAMFqQmpYMQQ92TjpjMOEqAA5ohhcxzC8FLgBjc45m5N9Qobtew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084b5b6064fe51761"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 14:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235568

--00000000000084b5b6064fe51761
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

My bad, I forgot to remove it... Will send a v3 shortly

Corentin

Le lun. 20 avr. 2026 =C3=A0 15:48, Antonin Godard <antonin.godard@bootlin.c=
om> a
=C3=A9crit :

> Hi,
>
> On Mon Apr 20, 2026 at 3:38 PM CEST, Corentin Guillevic via
> lists.openembedded.org wrote:
> > From: Corentin Guillevic <corentin.guillevic@smile.fr>
> >
> > The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class.
> However, the
> > user may forget to define it. This will cause the class to inject
> incorrect
> > content into PREMIRRORS, resulting in the following error:
> >
> > ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error:
> MalformedUrl('${SOURCE_MIRROR_URL}')
> > ERROR: Logfile of failure stored in:
> /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fet=
ch.258066
> > ERROR: Task
> (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.=
0.bb:do_fetch)
> failed with exit code '1'
> >
> > Add a check to the sanity class, to detect this case and raise an error=
.
> >
> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> > ---
> >
> > Notes:
> >     Changes in v2:
> >     - Use addresult() / oe.utils.inherits() instead of bb.fatal() /
> inheritlist.split()
> >
> >  meta/classes-global/sanity.bbclass | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> > index 1a490f8d61..cd2cfa9a62 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
> >              "Please set TMPDIR to a clean path with no trailing slash
> or "
> >              "consecutive slashes (e.g. %s).\n" % (tmpdir,
> os.path.normpath(tmpdir)))
> >
> > +    # Check whether the SOURCE_MIRROR_URL variable, belonging to the
> 'own-mirrors' class, is defined
> > +    inheritlist =3D d.getVar('INHERIT')
>
> This variable isn't used afterwards, you can remove it
>
> > +    if oe.utils.inherits(d, 'own-mirrors') and not
> d.getVar('SOURCE_MIRROR_URL'):
> > +        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_UR=
L
> is not defined")
> > +
> >      # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
> >      import re
> >      mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
>
>
> Antonin
>

--00000000000084b5b6064fe51761
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Antonin,</div><div><br></div><div=
>My bad, I forgot to remove it... Will send a v3 shortly</div><div><br></di=
v><div>Corentin</div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 avr. 2026 =C3=A0=
=C2=A015:48, Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.co=
m">antonin.godard@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon Apr 20, 2026 at 3:38 PM CEST, Corentin Guillevic via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; From: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guillevic@smil=
e.fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt;<br>
&gt; The SOURCE_MIRROR_URL variable belongs to=C2=A0 the own-mirrors class.=
 However, the<br>
&gt; user may forget to define it. This will cause the class to inject inco=
rrect<br>
&gt; content into PREMIRRORS, resulting in the following error:<br>
&gt;<br>
&gt; ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: =
MalformedUrl(&#39;${SOURCE_MIRROR_URL}&#39;)<br>
&gt; ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/ge=
ttext-minimal-native/1.0/temp/log.do_fetch.258066<br>
&gt; ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-mi=
nimal-native_1.0.bb:do_fetch) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; Add a check to the sanity class, to detect this case and raise an erro=
r.<br>
&gt;<br>
&gt; Signed-off-by: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guill=
evic@smile.fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Use addresult() / oe.utils.inherits() instead of =
bb.fatal() / inheritlist.split()<br>
&gt;<br>
&gt;=C2=A0 meta/classes-global/sanity.bbclass | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/=
sanity.bbclass<br>
&gt; index 1a490f8d61..cd2cfa9a62 100644<br>
&gt; --- a/meta/classes-global/sanity.bbclass<br>
&gt; +++ b/meta/classes-global/sanity.bbclass<br>
&gt; @@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Please set TMPDI=
R to a clean path with no trailing slash or &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;consecutive slas=
hes (e.g. %s).\n&quot; % (tmpdir, os.path.normpath(tmpdir)))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 # Check whether the SOURCE_MIRROR_URL variable, belongi=
ng to the &#39;own-mirrors&#39; class, is defined<br>
&gt; +=C2=A0 =C2=A0 inheritlist =3D d.getVar(&#39;INHERIT&#39;)<br>
<br>
This variable isn&#39;t used afterwards, you can remove it<br>
<br>
&gt; +=C2=A0 =C2=A0 if oe.utils.inherits(d, &#39;own-mirrors&#39;) and not =
d.getVar(&#39;SOURCE_MIRROR_URL&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;own-mirrors is ena=
bled, but SOURCE_MIRROR_URL is not defined&quot;)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Check the format of MIRRORS, PREMIRRORS and SSTA=
TE_MIRRORS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mirror_vars =3D [&#39;MIRRORS&#39;, &#39;PREMIRROR=
S&#39;, &#39;SSTATE_MIRRORS&#39;]<br>
<br>
<br>
Antonin<br>
</blockquote></div></div>

--00000000000084b5b6064fe51761--

