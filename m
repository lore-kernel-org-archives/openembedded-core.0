Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DAEC8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 15:24:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.273.1756394667093055324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 08:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sj7sE1UL;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso9155045e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756394665; x=1756999465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6CKlQjH4w3fFlG5Nl4lmQWAL0osPAxX3sSc5WwBSciU=;
        b=sj7sE1ULyHZrNENbytIT/v4YT5z539IN15TVUbQZNYU5UUTt2lwu2lnRf/xri7siAT
         PD71tJENIE+pIhISvn/AoOU8f2hGVyUIBku+NOP1vf62FE+SImyJR+wxJunOpSKYgmOY
         qATgJXUjC11SseL2+UWvQ3x364nCuAFXJFbmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394665; x=1756999465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CKlQjH4w3fFlG5Nl4lmQWAL0osPAxX3sSc5WwBSciU=;
        b=oQkcT+OYtNcVQhcsn91wWJbvDTLi6/cGofr9sscUMXcUEIme+0NMk2T6a4YDb+ruB7
         9FvAP76QwpvAOuAaomO12HLVKr7DbF89rZMUhOamhE5LWTpSowkFyXoTlJBJRPcqDzln
         FDrM6QNN67D8q8paAhK+/uHAOvLbNTxXMEae84l/qvS/xTJDheQe/FQiHsSpAFj8tZ6l
         QVlJFW/wEJW6VgHUdcHvGkbIqMuVxITOKSt4vHOl+hu+WOS4S4P9PrwvKYAXNSNNWdBR
         DunayWJ+35o+GMvTENMjE8kOthvz4iShQ9ug3ugE6AF4+myP32eny76iHoD7rfbrytps
         7L4A==
X-Forwarded-Encrypted: i=1; AJvYcCXcss4lLFGiGVwEAun02oqc6/PcCeY8aT/gbanrfF+W5LSWiSvrUg495LVvUHcHGJeI4oJxYrr6Nx1Q/9ZeU0t4Eg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBtO/n9FpKwXNGXZ7RU4ck0IVmVq5ya4LMaGol1qwcSNPUrGAV
	lVlCVcDqhmxLzRCLSz2Zxccmp6fBfEPdaZqa67y537LznabT/rDULO8jNw0oUTBuKNJsuilQ4eY
	cMwLeouUNWWPIDYBpJVC6IB9DSzLWF7uBtziviNTd/g==
X-Gm-Gg: ASbGncteGD/uCmpI8lSwd3AW2FSUpoalRBcZHgw9IMLrDC8piuCj8zb1WyAhhKVCXyd
	noQvWXPGfaOvN4RSIQTcHAxRKssFilHZBmQFEujXUvnJvce3HhPjPTo6NJUqoARdfdlpnGinYor
	BjWUZN/2PNoOCPuk50sqbJv1NM1bWfhGWwD5nWWgiYyQJh6bAZC+jEvpP79xsxIFcdcVKly5UM3
	Bz9UEWNK37wV3phpRnmqDYUy43mOJU=
X-Google-Smtp-Source: AGHT+IEuHrvea0CP2lxHnFnE3SbpamrLYHJhXJHS4sD31UVj3GO9Gw5BAB3Hrh+f3DNHJrjxelpgl0GHwnQAinXCGlc=
X-Received: by 2002:a05:6000:2903:b0:3b7:9629:ac9e with SMTP id
 ffacd0b85a97d-3c5dcc0998bmr16086362f8f.50.1756394664041; Thu, 28 Aug 2025
 08:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com> <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
 <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com>
In-Reply-To: <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Aug 2025 17:23:57 +0200
X-Gm-Features: Ac12FXw8b49MnTTRWQm-6e1NiE3n9gEaf-1x91HNQ0xJQQqmgMA1AqBTeDX5DYw
Message-ID: <CAMSfU+5zuq=KwWnp0OrZTQ4s9RrSgPnh1K+GCLDSq8NFK9jE-g@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: a-christidis@ti.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: multipart/alternative; boundary="0000000000000932d8063d6e8060"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 15:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222580

--0000000000000932d8063d6e8060
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 ao=C3=BBt 2025 =C3=A0 14:51, Alexander Kanavin <alex.kanavin@gma=
il.com> a
=C3=A9crit :

> On Thu, 28 Aug 2025 at 08:56, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> > You should explicitly return 0 (if all tests succeeded) or 1 (if any
> test failed).
> > If I read correctly, your script will always return 0 (success) because
> the last command is an 'echo'.
> >
> > See
> https://docs.yoctoproject.org/dev/test-manual/ptest.html#running-ptest
> (that was added recently)
>
> The documentation does not impose such requirements on run-ptest. It
> can exit with 0 even if something failed (and many run-ptest examples
> in core do exactly that). I think you misread the exit codes for
> ptest-runner.
>

Some time ago, I created
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832 to try to clarify
exactly this.

Right now, ptest-runner will fail if a run-ptest script it calls fails. And
that, in turn, will cause failures on AB regardless of PASS:/FAIL: markers.

The only requirement on run-ptest is that it prints PASS and FAIL markers.
>

Those markers are parsed at testimage level, but the return code of
ptest-runner is also used to check for success/failure.

That is the whole point of the ticket: realign what the existings run-ptest
scripts do, what the dos says, what the code running tests expects
(ptest-runner & testimage)
Maybe we should talk about it in a tuesday call?

Alex
>
--=20
Yoann Congal
Smile ECS

--0000000000000932d8063d6e8060
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28=
 ao=C3=BBt 2025 =C3=A0=C2=A014:51, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 28 Aug 2=
025 at 08:56, Yoann Congal via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" targe=
t=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; You should explicitly return 0 (if all tests succeeded) or 1 (if any t=
est failed).<br>
&gt; If I read correctly, your script will always return 0 (success) becaus=
e the last command is an &#39;echo&#39;.<br>
&gt;<br>
&gt; See <a href=3D"https://docs.yoctoproject.org/dev/test-manual/ptest.htm=
l#running-ptest" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctopro=
ject.org/dev/test-manual/ptest.html#running-ptest</a> (that was added recen=
tly)<br>
<br>
The documentation does not impose such requirements on run-ptest. It<br>
can exit with 0 even if something failed (and many run-ptest examples<br>
in core do exactly that). I think you misread the exit codes for<br>
ptest-runner.<br></blockquote><div><br></div><div><div>Some time ago, I cre=
ated <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832">=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832</a> to try to cla=
rify exactly this.</div><div><br></div><div>Right now, ptest-runner will fa=
il if a run-ptest script it calls fails. And that, in turn, will cause fail=
ures=C2=A0on AB regardless=C2=A0of PASS:/FAIL: markers.</div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
The only requirement on run-ptest is that it prints PASS and FAIL markers.<=
br></blockquote><div>=C2=A0</div><div>Those markers are parsed at testimage=
 level, but the return code of ptest-runner is also used to check for succe=
ss/failure.</div><div><br></div><div>That is the whole point of the ticket:=
 realign what the existings run-ptest scripts do, what the dos says, what t=
he code running tests expects (ptest-runner &amp; testimage)</div><div>Mayb=
e we should talk about it in a tuesday call?</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Alex<br></blockquote></div><span class=3D"gmail_signature_prefix">-- </span=
><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font face=
=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Raleway, regula=
r">Smile ECS</font></div></div></div></div>

--0000000000000932d8063d6e8060--

