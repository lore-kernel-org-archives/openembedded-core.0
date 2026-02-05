Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D087EC1E97
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:29:30 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17623.1770287361646354109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwltmcGs;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12460a7caa2so1065922c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 02:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770287361; cv=none;
        d=google.com; s=arc-20240605;
        b=UuZorEY+GQejotQtf3wN5KxlWoMUjBzFk36xpSB9W3wA6O26vbxg1VnHTn9dyUyQ8V
         Kdx+Ik9OQHzCC7pUdK0Evazf+DW1oYJHKgA1ImqikWPC29Tej5akcocys4nEMvW1nuAS
         ZmM+Lr/aV5d6kes0KWW+7KC5oio44TCoMfmIbbvex2o+XRLPFBy+mUurnlFxjQZgP3bc
         IgGPmDMD/pxA1Mbe2WDmUWhAZs494VXxMX7Iz8F7W9dBvM8XAtfluaW5ENoaPIckez8J
         SIJo1C5q2kt/sFagmZqimVsOj5tte0ag5seJ525ua3Iqk2x6LdIi5+OeAtYT2VKqPVyQ
         E1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HKI8kygkIet802oAaWtuARkLcjpy2nH4x9/Y2J8A4+U=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=CEa4MiRxuKI1/AjEKLdoaf+/bKcRIskJ1VufWWB738jVyoIhbYU01TdltFwWhCC6IR
         kj8GZoosNf0Rl2KXUGeJ0Qb6hH2YUxkg16A0jYHr1ef1qWcZaz4R5GEhvl698yaPPbQJ
         fCASfzfj2JoKMxh0+BQxt8/s/kTPD1L0fYR65juWcJr6RrP2u6TNcC8lNuNdgvGEwRv1
         h5VHsy5czwtcTVUMmHsHSXBiaj+7ObUe4QpTqSzak3t2CE9j/JeqpOZsU78DPFOoJ+5K
         MHaXKVhTUwlD8nqQNbPcxYVJW2tsB/MMmpsia3qCJPx66s4aUfWjT1o7LwriAuKC7ReR
         JIZw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770287361; x=1770892161; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKI8kygkIet802oAaWtuARkLcjpy2nH4x9/Y2J8A4+U=;
        b=hwltmcGssLJdZW5ZDRsL+Q54Gl1AWlzPZG4T9tTQTwLALycOXGEFnBb6A8ND394oa0
         RDnaQTS+x+AArNWcEimoF28kGoukuUBDYSBtB5RsM6kISqX1V+bMu4rChzSOtPJrzXjA
         DbwAC3j/cLplYs43weHgIzSTHMPuHutTD97AJ7nA5wwUaG2oSNhVCLU/P+lsD41wPnKY
         AJsiPMllL4hzZAuWcRBDiThkT0VHaibMd5VOEMGD6JBAZuSFysV98TZ0ZCsF0qo+nVtz
         CPCdu1ps4ZMp7G5UiWdhaYZosa/tZ+GzEkfr55vJf0cvBKPx8mRc8RzISZ+7DJcVFMA2
         qi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287361; x=1770892161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKI8kygkIet802oAaWtuARkLcjpy2nH4x9/Y2J8A4+U=;
        b=Y+mKS29U2pBgyxQUKG+2bY5a6LvrDcXQujkinF0TzVzPSVvsoX80vEj4Brubuwt+wK
         VexA0gTplmCdyzBGZVNyGbFNGFd+amYrz0uHhxsu6DpyhD4z6dxM0yJL3VGsQpT9tPdI
         AqD0J6D3GrVesG54IXocEKA73FFvW5oN4N53ODSq21GARqzEOtU6pdYx/m1lnHKRjUSm
         tGJ+KnBmy4cSDr7+7PwMMePOCNyBbj/fC5rLTxeE/PPloo5pSFc64HFSGZsZjiGlhfFz
         cr7mrXI8zuE8sbEW1biSjU5WuNfjEE4RkU5RAPuVeYtryKcWwolJhtGg5sDbXkTV4E1l
         CDsA==
X-Gm-Message-State: AOJu0YxVKQrlJquNfTONSXSrq0G8pova6E5R4B8PKkwrXVPM6G5Esdn7
	X5dk7YFtGZdsgAvKpUqn9XFSgkUryZlyrHvTptR0rQX49NvjaSg9zn02tNBFJcg9EN6MxOh7JG/
	TLozssMSF9kwk5m37BgLaIRtlgKAju4AExnm5
X-Gm-Gg: AZuq6aKtoyyYEn8vFBq+cuXCPxZ9koT7yWNo8S1qWb12PXdkCNdG5sV0OZO/jjicKTE
	Arm+FmNBJq6DsqoDwLUcnRv4kIATubSxUuVqTpZMAvDo+LhFs/dY5mV9qMkzS8MJZF/PrcA/K2T
	Efm+GzMAnvPJFnGolU/1HgBotIMvCgQ8Z8G/PRAq1cfdiLXtXrqJjgJJETdPiM4NA+0mj/jdjZe
	9pZXnTTh18ZLT0V17G6mSmvCDmu7P3Sg/8H4vnB/EXsuLDFq7yz42D/BCwDyMPqR72sizDUTPTH
	I4nCDFVJevlLfxmSEp9Y4JZyj5ECZai1y+zPf1S5+LASKRNKMY6MoQM=
X-Received: by 2002:a05:7022:4384:b0:123:3103:b248 with SMTP id
 a92af1059eb24-126f477950emr2630915c88.5.1770287360674; Thu, 05 Feb 2026
 02:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20260205095525.1104867-1-alperyasinak1@gmail.com> <DG6YGEQCHEDD.2RYMYDPDQT9IH@smile.fr>
In-Reply-To: <DG6YGEQCHEDD.2RYMYDPDQT9IH@smile.fr>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 5 Feb 2026 13:29:09 +0300
X-Gm-Features: AZwV_QhsZwcWC240jb_P5CHVy_0tw5OIJp69RVcwBf_SX3h6oEmgTL2OhgU86-s
Message-ID: <CAGpma=6UoVVnzkT99M1ixGUT4mbskkkV_YyQ1Hm9=C22onCZ1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] inetutils: fix CVE-2026-24061
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000488eaa064a112558"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 10:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230573

--000000000000488eaa064a112558
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, I missed that. My apologies.

Yoann Congal <yoann.congal@smile.fr>, 5 =C5=9Eub 2026 Per, 13:27 tarihinde =
=C5=9Funu
yazd=C4=B1:

> On Thu Feb 5, 2026 at 10:55 AM CET, Alper Ak via lists.openembedded.org
> wrote:
> > Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24061
> >
> > The vulnerability is about:
> >
> > The telnetd server invokes /usr/bin/login (normally running as root)
> > passing the value of the USER environment variable received from the
> > client as the last parameter.
> >
> > If the client supply a carefully crafted USER environment value being
> > the string "-f root", and passes the telnet(1) -a or --login parameter
> > to send this USER environment to the server, the client will be
> > automatically logged in as root bypassing normal authentication
> > processes.
> >
> > This happens because the telnetd server do not sanitize the USER
> > environment variable before passing it on to login(1), and login(1)
> > uses the -f parameter to by-pass normal authentication.
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >  .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
> >  .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
> >  .../inetutils/inetutils_2.7.bb                |  2 +
> >  3 files changed, 122 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
> >  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
>
> Hello Alper,
>
> Thank you for the patch.
> Sorry but that patch was already sent a few days ago:
>   [PATCH] inetutils: patch CVE-2026-24061
>   https://lists.openembedded.org/g/openembedded-core/message/230248
> ... and that patch should merge shortly.
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000488eaa064a112558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Yes, I missed that. My apologies.</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.con=
gal@smile.fr</a>&gt;, 5 =C5=9Eub 2026 Per, 13:27 tarihinde =C5=9Funu yazd=
=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu F=
eb 5, 2026 at 10:55 AM CET, Alper Ak via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; Details: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-24061" r=
el=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-20=
26-24061</a><br>
&gt;<br>
&gt; The vulnerability is about:<br>
&gt;<br>
&gt; The telnetd server invokes /usr/bin/login (normally running as root)<b=
r>
&gt; passing the value of the USER environment variable received from the<b=
r>
&gt; client as the last parameter.<br>
&gt;<br>
&gt; If the client supply a carefully crafted USER environment value being<=
br>
&gt; the string &quot;-f root&quot;, and passes the telnet(1) -a or --login=
 parameter<br>
&gt; to send this USER environment to the server, the client will be<br>
&gt; automatically logged in as root bypassing normal authentication<br>
&gt; processes.<br>
&gt;<br>
&gt; This happens because the telnetd server do not sanitize the USER<br>
&gt; environment variable before passing it on to login(1), and login(1)<br=
>
&gt; uses the -f parameter to by-pass normal authentication.<br>
&gt;<br>
&gt; Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com"=
 target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../inetutils/CVE-2026-24061-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 38 +++++++++<br>
&gt;=C2=A0 .../inetutils/CVE-2026-24061-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 82 +++++++++++++++++++<br>
&gt;=C2=A0 .../inetutils/<a href=3D"http://inetutils_2.7.bb" rel=3D"norefer=
rer" target=3D"_blank">inetutils_2.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 122 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/inetutils/inetutils=
/CVE-2026-24061-01.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/inetutils/inetutils=
/CVE-2026-24061-02.patch<br>
<br>
Hello Alper,<br>
<br>
Thank you for the patch.<br>
Sorry but that patch was already sent a few days ago:<br>
=C2=A0 [PATCH] inetutils: patch CVE-2026-24061<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/230248" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/230248</a><br>
... and that patch should merge shortly.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000488eaa064a112558--

