Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E79FC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 17:27:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26882.1782840458821057816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 10:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U83fEWN/;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47488efcf30so1292307f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782840457; cv=none;
        d=google.com; s=arc-20260327;
        b=WisnhFuEqM4OqdiyBdyQpzZpViYxijfk/GcYlw5ont5gicaN3v7/ZbRevEINU/vRoe
         CpSkU/DUIG3d7DILvcEyhhHOfEiJE+2BhTuL0yDwy36n8IO8aaTQiYTu+zum37CqbfdV
         Qd2/1i14KtL5a6pd3Pt8zaeBDaKBci5XofQwUjfuw3Dd3lf8xhuVXCl/G5b0c8h3q1g7
         OsYGjVk+M9nG+NgxczT2HOI+9ngqVWYQMUQFKgUzUOqZ7bfwCCd9un21UgUbsshnNjK9
         urdutkFBbC5olAVSYlvzOujnR4y8Pz9XkOxs+DHWIqU3cFk4mRl98QtiF/OUGKMD58Lh
         RGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u7BHhV3w2TpBvsvi8ZVbvo9gVv941A3iQeOsSDZ6oM8=;
        fh=0Ap269fE6E8+p8UT6dX2AgvV5nqqSk3B49JGTmKRw0k=;
        b=kAjGnrIH0Rvmzu2O5kPj4OoL6KjbFMmws0Gde1yZBzGGdiWCJ1ahkZqno2wy2cxTrL
         YAHEzKgsextHJ83cW3x7CfiSCdVFvtQCaRZ1VOgdmibZzVnPN3dDSNwQtFjE6vguiL2b
         Wie6O3keJT0g8DjFjXfceFlkbPQmheN9eae6ayYjoCZi3d4xy/jEH3SGjsT1lmTc6GZ2
         ojhX6V3mCaMHeH9FZUh34tJnrVRr9OvTByMO5PlkZFX0Z1m53ZVaaloLM4l29lS4c2JT
         K+L/A7ru+9HGDFpeTcP+XgnSx4aDrU+7d7ocVPepf3FQ4T+0o7nG4h91aIjRBkdoA75P
         nlMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782840457; x=1783445257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7BHhV3w2TpBvsvi8ZVbvo9gVv941A3iQeOsSDZ6oM8=;
        b=U83fEWN/0H55qwFqOZPrkESdJJH2MTdhNX9xHoEeDvH1vXzCKAJqBjr5Dsb20SOuvO
         ofU+MWCBOe7kN1WbBIAp8TYayjtR+FCJN+vR8wNrXo8fjGkty15yL7fHpgauWyxacIwI
         m7sSOUGcVVHptK2K5TV63OcXPnjbEEWwiXAcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840457; x=1783445257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7BHhV3w2TpBvsvi8ZVbvo9gVv941A3iQeOsSDZ6oM8=;
        b=ZB9ATPcNpCX0MvgN6hLyAG1nG4DQ4GQVx8Awsm0OyDAmDFdMaMwX0bgM90Dcdq6G/L
         kK6GEtL9nH1tgv9Lfgq6ZXkuDoi7OdfFo4h9Nniv6PdD7hDR+TBRTQhTppFNzl+RFv5P
         mDI5V99iqBK5JV/BkUU9iSopM4kTRWw8UiK9KbqZBa7dUnHoagl8MUx6pdaAYjc5fOrm
         2o39RUtGvilRvrSF4p90YMfd6lxjCk2Kz7BCI209MLUjEjYNRdu0K4yew+6eaNCOwA03
         7WbJV4bo5dtFIhnhFIh4/TZGhrvyp0Qbg3ezkF3lBEW0sBAOVO7d9cFKkDL3N74eP7id
         Ikvg==
X-Gm-Message-State: AOJu0YwpeLhtgTHg8EE2Hm8twxE86eYquVGw6rL9Z/OqLRw7a+SVDie2
	XY1nYrK+I5FlU0sJQ5vqBe4odcFi0tKwP9eoIt/vbHqKPruYF+9Pdms8BaLwWZ+6u8aCAK6mTZO
	R+b1s13cCa6+pyJgtlZ+LGMJ3fnCtG9L0Kxb3jUacVw==
X-Gm-Gg: AfdE7cmSkRlQLbAdSYTjWzX2fw4vpge0T1U2UVmP/7xw7R3TyzODYN0bZe/yaMP7u/B
	mTct0LkwHcEpu464hrWjozZ0ZjG31WKzusWO95QGvYVRaIcJDbSxUEEiC3247IUw9jiNXFnR7px
	S5B3OCgcX5zPGEU/+AlMmnngVIPM6MEz/+bRdKt0WYUdqSQiy45peECJknsGH2FIi05hUFneeTH
	o+BPX5cCmSLnSdOA7JUT79NR963/qXPW99i9CikhzcUC9QZcCeOJQyXgNL0N4TqxCm2GApERcZA
	FkC3+bFjizo35WWg5sEgXjVTvsrKXl4=
X-Received: by 2002:a05:6000:310a:b0:46a:1f35:1133 with SMTP id
 ffacd0b85a97d-475524a7ddfmr7021395f8f.25.1782840456830; Tue, 30 Jun 2026
 10:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260629071648.1471849-1-vanusuri@mvista.com> <CANQUz1-0nv9S0QiempdvvcuxUwS2OMY14d=NjPhgvMp18vUMXA@mail.gmail.com>
In-Reply-To: <CANQUz1-0nv9S0QiempdvvcuxUwS2OMY14d=NjPhgvMp18vUMXA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 30 Jun 2026 19:27:10 +0200
X-Gm-Features: AVVi8CfHDdu7HWBEHS9rXpOaaVFSYcKvwNtbHCN_Xy-pcNI3GSZop0-diHl1wRg
Message-ID: <CAMSfU+7GdTGe4gtD2=hpVOCFFjSnyS1BmrkJG4NGMRN9ZC1tdw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org, 
	Peter Marko <peter.marko@siemens.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000001ef3f906557be409"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 17:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239911

--0000000000001ef3f906557be409
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 juin 2026 =C3=A0 19:11, Vijay Anusuri via lists.openembedded.org
<vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :

> Hi Yoann,
>
> Any update on this ?
>

Sorry but a day or two is too short to ping me,

Please wait 2 weeks before asking for updates. Before that, either your
patch is fine and the process is silent or your patch has issues and I
answer your mail when I review your patch.

I plan to do a proper wrynose review series next week, maybe earlier.
Does that work for you?


> Thanks & Regards,
> Vijay
>

--=20
Yoann Congal
Smile ECS

--0000000000001ef3f906557be409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 30 juin 2026 =C3=A0=C2=A019:=
11, Vijay Anusuri via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembed=
ded.org">mvista.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div=
><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div><div><div>Hi Yoann,<br><br><=
/div>Any update on this ?</div></div></div></blockquote><div><br></div><div=
>Sorry but a day or two is too short to ping me,</div><div><br></div><div>P=
lease wait 2 weeks before asking for updates. Before that, either your patc=
h is fine and the process is silent or your patch has issues and I answer y=
our mail when I review your patch.</div><div><br></div><div>I plan to do a =
proper wrynose review series next week, maybe earlier.</div><div>Does that =
work for you?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Thanks &amp;=C2=A0Regards,<br></div>Vijay<=
/div></blockquote></div><br><span class=3D"gmail_signature_prefix">-- </spa=
n><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font fac=
e=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Raleway, regul=
ar">Smile ECS</font></div></div></div></div>

--0000000000001ef3f906557be409--

