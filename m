Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE54CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 10:03:11 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.13399.1759312985497646272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 03:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPPu6CMn;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: liu.ming50@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3384189b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759312985; x=1759917785; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6TtH8XP66sIEqZ/RpNAruT0Oa7mmI6zRbKrYd4zVSQ=;
        b=PPPu6CMnxWyMJtYYIFACLIZOtWhn7Lsl1xFtj84HrqFQtK4bvR1n9hZWz7L32bModu
         xsgxAb1i3a/p2tY0Tex0YJhOf22oOC4h8LsTeHz7bV0unA/4Dy9foF8LilqWfvhkj8MH
         SQ1Si2T2X9HjAa4zjCABbuPn0VbuoplLDeKewoBRfJOFOjuvYWcZhErOCxdXL6G0lVIj
         dfwaXXpgLh0hZ6kDhjSPy+mkH0J//2VJ1B0hbmDvRdD3Wry53Azah8n39+oCUjadhv40
         G5rV01gyAQmF8J+U2KPWRYoSs0BE4ZD5I7EAk1P7bdJy9wxOtfbCPnCjeWGAIYB31QhK
         fXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759312985; x=1759917785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6TtH8XP66sIEqZ/RpNAruT0Oa7mmI6zRbKrYd4zVSQ=;
        b=TIJD/gTr2RsaSt1rpA0La69ODDoV5LZDbeskyppSRdU9I5LDGgihcSmb4JL8nSM8aq
         aCWuiJsL2FHgGfs4eZGeIvRb6G5ed+BELNTFthDIZwIWipOM05sSqnczMvCwhYFz1G8L
         eWI4BkuH51H4JI7SnLVEqJMWlhkS1URInL2/R8W5DqXdRXDiXpl41bSudkiJjclAppeu
         lILmo7jZeqz8HyNcB3AhMFLU6bTcGrASqpf/iHBbic4hvZtYPrU5zI4GQK+fhjNW9Fpo
         epFrPD2IkGnXK8n4H6uSZu6N3DIAuGqUjQOkegUOlHoFL6IKlg3OLPERloQAuS5iT61H
         jP9w==
X-Gm-Message-State: AOJu0Yz80ODc82nmLlzMOYM0ytO1N0a4wCUhM65eSNoUfzdtULET1EzV
	UhP02wzcvBj82EFgUi14QJImSdkkuHACXzWks6N6OqvtKyDF/ttnKmiiWRM6iny1LUfCeNV+Lpm
	6bgzjoH0gSr6WXUIhgSHtQVhafGgNerg=
X-Gm-Gg: ASbGncvMrXTIoVG31CZkeltsm+3IszjxEXJwSt2d/CIFDb+QWLU0LSZYh+6ffnEL+CG
	TDopYrXozxl3JTZdZoYcZ5FvSt2INsDsxS2gUYelh4rDZLj36IyL09SI98Dq+vF0RnSkOOYUuc9
	fTm6f4AafqTDeuQ1tA/i40tUpr920xmPrYUWKbZkSsM8/hWbA9pM2GJpvofk6z9LduIUig80/X+
	G1Iove5VJsKEcyB2qyyLGln6KV/3WMX12p7E+5uifC933FnZY4Qe459jVpLXke4T51l31hsjqU=
X-Google-Smtp-Source: AGHT+IEYSA/Fnk4x7waD7C/udcaHl08XmqCUhvbaIeDUNmIdM0c/6TrVRWENJ6EHdT8gNVpiew6DBaMmuJV4ap7yXUw=
X-Received: by 2002:a17:90b:3b92:b0:32e:9da9:3e60 with SMTP id
 98e67ed59e1d1-339a6f58d2emr2840275a91.36.1759312984653; Wed, 01 Oct 2025
 03:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251001093453.185784-1-liu.ming50@gmail.com> <CANNYZj8ka0t576ifJKNvrahors+QsPz+0xj2JZNZ8x91sJX=hw@mail.gmail.com>
In-Reply-To: <CANNYZj8ka0t576ifJKNvrahors+QsPz+0xj2JZNZ8x91sJX=hw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 1 Oct 2025 12:02:53 +0200
X-Gm-Features: AS18NWBydZwLSOT-gWoI3sxeP9dpvuVoVNyzw20lvziaGNbGhcikOIlsDmILWDQ
Message-ID: <CALatG=61tOh728dLdkmTwuKRSd9Tm1O0cTOrWncCW8Y=uPkzLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split.bbclass: support muti-lines
 in module conf
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathias Thore <mathias.thore@atlascopco.com>
Content-Type: multipart/alternative; boundary="0000000000007fc4f5064015f93e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 10:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224205

--0000000000007fc4f5064015f93e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can you provide an example of such a variable which causes the issue?

Sure, when we have the following settings:

```
KERNEL_MODULE_AUTOLOAD =3D "mod1"
module_conf_mod1 =3D "line1\nline2\nline3"
```

// MIng

Alexander Kanavin <alex.kanavin@gmail.com> =E6=96=BC 2025=E5=B9=B410=E6=9C=
=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:49=E5=AF=AB=E9=81=93=
=EF=BC=9A

> On Wed, 1 Oct 2025 at 11:35, Ming Liu via lists.openembedded.org
> <liu.ming50=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The expanded bitbake variables are raw strings so it does not support
> > writting multiple lines to a kernel module conf, add the support by
> > decoding it with 'unicode-escape'.
> > -                f.write("%s\n" % modconf)
> > +                f.write("%s\n" %
> modconf.encode().decode('unicode-escape'))
>
> Can you provide an example of such a variable which causes the issue?
>
> Alex
>

--0000000000007fc4f5064015f93e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Can you provide an example of such a variable which c=
auses the issue?<div><br></div><div>Sure, when we have the following settin=
gs:</div><div><br></div><div>```</div><div>KERNEL_MODULE_AUTOLOAD =3D &quot=
;mod1&quot;</div><div>module_conf_mod1 =3D &quot;line1\nline2\nline3&quot;<=
/div><div>```</div><div><br></div><div>// MIng</div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; =E6=96=BC 2025=E5=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=
=E4=B8=89 =E4=B8=8A=E5=8D=8811:49=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Wed, 1 Oct 2025 at 11:35, M=
ing Liu via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" ta=
rget=3D"_blank">lists.openembedded.org</a><br>
&lt;liu.ming50=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The expanded bitbake variables are raw strings so it does not support<=
br>
&gt; writting multiple lines to a kernel module conf, add the support by<br=
>
&gt; decoding it with &#39;unicode-escape&#39;.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot=
;%s\n&quot; % modconf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot=
;%s\n&quot; % modconf.encode().decode(&#39;unicode-escape&#39;))<br>
<br>
Can you provide an example of such a variable which causes the issue?<br>
<br>
Alex<br>
</blockquote></div>

--0000000000007fc4f5064015f93e--

