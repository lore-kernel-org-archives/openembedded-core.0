Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81520CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 16:33:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.82222.1756830779248220224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 09:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ojra34AB;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so2803470f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756830778; x=1757435578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEYs7BQ13dJixK3SOGEdG0g2GWGVsVRN99pJpv2uLZ0=;
        b=ojra34ABXshTo28+Z2vUwg5agbzDZyXXWc2OaCJjCKG8jD1TuRxCUwO5afQsKzEW8T
         TdmRo6IQ1pv4jO1UvVxADlrcv/kRaVw7jNH5up2h4JEvGmRNH5ajLY7DgsR1tCU16XED
         I6+pJ3Sa0iD1cdoSPzJGLzzA3IhmIXWrLm50Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756830778; x=1757435578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEYs7BQ13dJixK3SOGEdG0g2GWGVsVRN99pJpv2uLZ0=;
        b=Hb59kzCJASeQAPToRnOFvF/MPArRKHyM1NO+uQovf18SEj4ShgwpWODEBl6qtHhrG/
         yhyE/oZi5c4X2QqXEHeYyn4vaTN2guYrfimmzAMJYiQM8zQY0ta+y574lJt+WisIl3u+
         6c9XzsVPzZCQUbfyL7yCZhpLYGgU3LAjYBG+iLApRIXy6VeraJ5uOEq6BmtUZGQBeoFI
         d5bSpgkwB+9HwohitlLZkEK5vU47W9eYiMXjs4cqMDS9xm5tjgm6Fa4VrtQx86pgBwVL
         lg8ExY59mlVYdVZNHiaBnnJfoZpx/zasgTCYjEx5n5ity2amc0QpbGuwMTkQbI6/iJqC
         hwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqlXTT5CA4fRJXmnwOLzfZOrs44hc5F/F4kJMysATHP2BIQYFLuVdMeAU6u63imVm/Ad97b6c4X0W/KS8I68+cWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlgPN75nviYQeHdtjjugS3SC7ckKQogP7MvBFBWtTvgo3moMaM
	YR32NMs5Tc+9RwkNndo94/aMsHHrgn9M0JcZ3CTYmQmXTtfSmyvzkFeYyZ0OaJ7SvbnbaOlzMLJ
	sjMNx6aGzgIvyn7mshg+KowB4DlCkYGcNhXT38aPtJQ==
X-Gm-Gg: ASbGncshKIX0ZOkpYN1v5acBSEIcOHRWHgyV6x+rhdZaAKBQ1CDGiU4arLA0EGesru0
	1AUd2/UJrCXxtzZAV95stnRJkMlueASSa7B+iKJx+KbcfGWQ2Z2Bp38ExUx0UNHYVcrEX8WS2xj
	TIckDKJWrH8zCy581dXP0ZSZykERuvPH+HNdRWD0J1EPhXweANJacjhYU6dHvS4YeXGZv9Y1Bv8
	b6ef8f5souuysn3mVAOwhdgm+3DFTLrjj/YCxe4eDv4QuKY5aZn
X-Google-Smtp-Source: AGHT+IFp1hqY1708TEXd/fK+iVaU6r0Rey/17UrYH5gHGgffDGCjrqa4t7XFyXTDdKGNjXiDAhWFGJQ9/VNuR4gWnp8=
X-Received: by 2002:a5d:5f95:0:b0:3bd:6308:a4bb with SMTP id
 ffacd0b85a97d-3d1e0c85701mr9163565f8f.59.1756830777533; Tue, 02 Sep 2025
 09:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com> <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
 <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com>
 <CAMSfU+5zuq=KwWnp0OrZTQ4s9RrSgPnh1K+GCLDSq8NFK9jE-g@mail.gmail.com>
 <CANNYZj9VBtTkEagr7r+WsX6mgeTc2N57tkQ+XO7u6XUTxusD=Q@mail.gmail.com> <b9fc2ac8-e6ef-47af-bb5c-66cbae8f1b54@ti.com>
In-Reply-To: <b9fc2ac8-e6ef-47af-bb5c-66cbae8f1b54@ti.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 2 Sep 2025 18:32:30 +0200
X-Gm-Features: Ac12FXz04sE8wcoMiOawtROVHDnCxIXuUy2_kwAjXJzTOdb3sVNArcrlVkQtaow
Message-ID: <CAMSfU+5_TeUSJG48B+ue1UEy8LnfnKTwVDOdDqVU-vjKja316A@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core] [master][PATCH] libsdl2: Add tests
 package and ptest support
To: Antonios Christidis <a-christidis@ti.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: multipart/alternative; boundary="0000000000006d01ed063dd40aa0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 16:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222742

--0000000000006d01ed063dd40aa0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Le mar. 2 sept. 2025 =C3=A0 17:22, Antonios Christidis <a-christidis@ti.com=
> a
=C3=A9crit :

> Dear all,
>
> What meeting is being referenced ?


That was the "weekly Engineering Sync" referenced here :
https://www.yoctoproject.org/community/get-involved/#virtual-meetings


> What was the conclusion of such?
>

I did not have time to open this subject at this meeting.
I don't want to hold your patch for this. Feel free to ignore my comment on
the return code.

Thanks!

Regards,


> Kind Regards,
>
> Antonios
>
> On 8/28/25 1:08 PM, Alexander Kanavin wrote:
> > On Thu, 28 Aug 2025 at 17: 24, Yoann Congal <yoann. congal@ smile. fr>
> > wrote: > That is the whole point of the ticket: realign what the
> > existings run-ptest scripts do, what the dos says, what the code
> > running tests expects (ptest-runner
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source
> > of this email and know the content is safe.
> > Report Suspicious
> > <
> https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0BQayqqdF8I=
sugIjX7zadsugLmM-EbBW8Oq0a4_NJqc3VSXvZy3_udB9hIMqaoUjEqvKMEG22xp083xtuY8ML3=
NRgyFVVZtLOCIG2rqv1J7v14pKoM$>
>
> >
> > ZjQcmQRYFpfptBannerEnd
> > On Thu, 28 Aug 2025 at 17:24, Yoann Congal <yoann.congal@smile.fr>
> wrote:
> >
> > > That is the whole point of the ticket: realign what the existings
> run-ptest scripts do, what the dos says, what the code running tests
> expects (ptest-runner & testimage)
> > > Maybe we should talk about it in a tuesday call?
> >
> > We can talk, but I do not think it is realistic to have new
> > requirements on run-ptest, especially around return codes. They are
> > expected to print at least one PASS or FAIL, and it stops there.
> >
> > Alex
>


--=20
Yoann Congal
Smile ECS

--0000000000006d01ed063dd40aa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 2 sept. 2025=
 =C3=A0=C2=A017:22, Antonios Christidis &lt;<a href=3D"mailto:a-christidis@=
ti.com">a-christidis@ti.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Dear all,<br>
<br>
What meeting is being referenced ?</blockquote><div><br></div><div>That was=
 the &quot;weekly=C2=A0<span class=3D"gmail-kma42e"><span role=3D"heading" =
id=3D"gmail-rAECCd">Engineering Sync</span></span>&quot; referenced here : =
<a href=3D"https://www.yoctoproject.org/community/get-involved/#virtual-mee=
tings">https://www.yoctoproject.org/community/get-involved/#virtual-meeting=
s</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">What was the conclusion of such?<br></blockquote><div><br></div><div>I d=
id not have time to open this subject at this meeting.</div><div>I don&#39;=
t want to hold your patch for this. Feel free to ignore my comment on the r=
eturn code.</div><div><br></div><div>Thanks!</div><div><br></div><div>Regar=
ds,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Kind Regards,<br>
<br>
Antonios<br>
<br>
On 8/28/25 1:08 PM, Alexander Kanavin wrote:<br>
&gt; On Thu, 28 Aug 2025 at 17:=E2=80=8A24, Yoann Congal &lt;yoann.=E2=80=
=8Acongal@=E2=80=8Asmile.=E2=80=8Afr&gt; <br>
&gt; wrote: &gt; That is the whole point of the ticket: realign what the <b=
r>
&gt; existings run-ptest scripts do, what the dos says, what the code <br>
&gt; running tests expects (ptest-runner<br>
&gt; ZjQcmQRYFpfptBannerStart<br>
&gt; This message was sent from outside of Texas Instruments.<br>
&gt; Do not click links or open attachments unless you recognize the source=
 <br>
&gt; of this email and know the content is safe.<br>
&gt; Report=C2=A0Suspicious<br>
&gt; &lt;<a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tD=
dkczhAu0BQayqqdF8IsugIjX7zadsugLmM-EbBW8Oq0a4_NJqc3VSXvZy3_udB9hIMqaoUjEqvK=
MEG22xp083xtuY8ML3NRgyFVVZtLOCIG2rqv1J7v14pKoM$" rel=3D"noreferrer" target=
=3D"_blank">https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0=
BQayqqdF8IsugIjX7zadsugLmM-EbBW8Oq0a4_NJqc3VSXvZy3_udB9hIMqaoUjEqvKMEG22xp0=
83xtuY8ML3NRgyFVVZtLOCIG2rqv1J7v14pKoM$</a>&gt; <br>
&gt;<br>
&gt; ZjQcmQRYFpfptBannerEnd<br>
&gt; On Thu, 28 Aug 2025 at 17:24, Yoann Congal &lt;<a href=3D"mailto:yoann=
.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br=
>
&gt;<br>
&gt; &gt; That is the whole point of the ticket: realign what the existings=
 run-ptest scripts do, what the dos says, what the code running tests expec=
ts (ptest-runner &amp; testimage)<br>
&gt; &gt; Maybe we should talk about it in a tuesday call?<br>
&gt;<br>
&gt; We can talk, but I do not think it is realistic to have new<br>
&gt; requirements on run-ptest, especially around return codes. They are<br=
>
&gt; expected to print at least one PASS or FAIL, and it stops there.<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000006d01ed063dd40aa0--

