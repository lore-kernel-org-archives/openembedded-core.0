Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE36CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:36:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.31576.1761568589051655640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/D7vNZb;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a4176547bfso1637290b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761568588; x=1762173388; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/QHlmO2y5fHpWSIqQ3dXVKIYv9A7H2Q5jeY/zxUTSVM=;
        b=M/D7vNZbvzIBX92yhs42PYLDUdEydbHrNxfDRtSJHW20bM0mQ6Pj6eA9m/66att4AM
         DAWv+c23uQ8W0gbl0s+Ug/EWYNAzHaQ3XMc/iuQ2jrqFp+ddPR5cnLhIWQkjWh+RcRU1
         blukdtD2JGAbbCurkZ27/RE7+ExJtP08xSxPOUaWstji1RKFvijbVMMWL+2M07pj/UTn
         QR9byKcX6HrK864p8ieS9LcrK7OqJYsX9CjHc7EpVAFf6ZhJj+xVTyn9g+JFta0qdIFl
         CURTR3OAHMSKZkazov5ePX5jOFx24IWPdjLSlRaGTPQghzZlV35LRkJReMMOje0/G+TU
         zJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568588; x=1762173388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QHlmO2y5fHpWSIqQ3dXVKIYv9A7H2Q5jeY/zxUTSVM=;
        b=uid17+dI9tH72ook6W3PPYGEiP7HOt42cSv4n01yVVsGA7QLohK/1epcRJFv51eVxm
         04le835pq/94SpX/1GNXJot1eWv+hA5N5RyH748Omsd2gyHwxz0/nZL+lmpIzi9IJBr5
         CjWougE7xtLN99FYKJcqsw+upGYHzSBHAuzAQfnF3kQpHfeNH0B49xUc6pB9QOjpuFjL
         xyoD9a/mIvyKNtgMJpJZo8MGoqAfP6vjCyyh08pOiyg51iwQj58s5uy8BtTQdLldJsCo
         gJa8OyMGY+kYA7rWMNXwAJz9HXl2vojQZm9Tc1WWBmAbgQqoKjb6fNlNwQEnmbjaf+wv
         7zng==
X-Forwarded-Encrypted: i=1; AJvYcCWPGCqUXSVLyGMhdCi83ahHPoLoTtW5CJB7Uov94CxrJEwUm8t1vf0a8LO5fn8hefgBNoFl5wEjeRNsmvoZsF6Kfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBd4gxLLCziyIY0IeySl1fkBCxiTwxQgk5FDMar1UF1w8Mu474
	KmGeBqUMTbFFaqYXtGNxmH0kmO5n2A+AGeSazuQp7Vq8qoVWYcl5MmgDUAUlOxAlRruNlqXiGTH
	H0LrdVmf56EZrUvkS83mfF/A3CpDJ1pc=
X-Gm-Gg: ASbGncv0EWvKwDVPRtOg5jZaftYvYH/u/w/GahQsqFnurbmawmODfso8hZd4AoUttW9
	P0jOBoZ1Lz3P382EIRnoJe+qHNeG7/i39NNxgY82azv4eXlxVfRd7zPAIWC89K+skamYi4Zdc21
	WZerdi+LGoMbVCY5G9/jKz9vCZXuIF4LRkxjGyCglX6171IQyMNbPWxdjkihNcHQ+BiaMCM19og
	KjfQqpZDweckdMKFVXffaenR2YNNzyR62Cx0Bx6plF0TroYM5o/mX7a16K/cr6MdquUJ7bg
X-Google-Smtp-Source: AGHT+IHoYp/9mO5734tHdzkE/aoqaUILSAaoGu1VPKVHx5qw0AWIqJyrzBBPF+FDsy8lE2i7hs0n20IzYa6h14LFRg0=
X-Received: by 2002:a05:6a21:6daa:b0:341:262f:6510 with SMTP id
 adf61e73a8af0-341262f6703mr8687095637.41.1761568588103; Mon, 27 Oct 2025
 05:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
 <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com> <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
 <CAOMZO5BXLizaBKmOQFKreoCr1OkzBUZMUfD5CrRg6g_JAgib0Q@mail.gmail.com> <CADkTA4Ogj_Jk3-L+EH+-JSBKKF1+dr=QFc3yQHVUNmsc2Gtc7Q@mail.gmail.com>
In-Reply-To: <CADkTA4Ogj_Jk3-L+EH+-JSBKKF1+dr=QFc3yQHVUNmsc2Gtc7Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Oct 2025 08:36:16 -0400
X-Gm-Features: AWmQ_bmlctpE8koymkhaa_ZMWgPzVtwTZDJ2cAjEXV6osZE-VDAJ23aNXmNDweE
Message-ID: <CADkTA4NZrnqRXv4_me5QTEf7y6gaNLAzn+D3Oo1BNHGP+c=4ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
To: Fabio Estevam <festevam@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f105ad06422325bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225334

--000000000000f105ad06422325bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:33=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Mon, Oct 27, 2025 at 8:32=E2=80=AFAM Fabio Estevam <festevam@gmail.com=
> wrote:
>
>> On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via
>> lists.openembedded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> > It boots locally, so I don't have any great ideas.
>>
>> Shouldn't "check access for rdinit=3D/init failed: -2, ignoring" be
>> added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?
>>
>
> Probably. Ross already knows about this though, since we were discussing
> it last week.
>
> I'll wait to hear from him on it.
>


I should add that this is nothing new, there's just a commit that landed in
july that promoted it to a visible warning, so it is safe to ignore (or at
least we
aren't making anything worse by ignoring it).

commit 98aa4d5d242d3a73388271e00e11ce91d8c3c3e1 for those that
might be interested.

Bruce



>
> Bruce
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f105ad06422325bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 8:33=
=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 8:32=E2=80=AFAM Fabio Estev=
am &lt;<a href=3D"mailto:festevam@gmail.com" target=3D"_blank">festevam@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt; It boots locally, so I don&#39;t have any great ideas.<br>
<br>
Shouldn&#39;t &quot;check access for rdinit=3D/init failed: -2, ignoring&qu=
ot; be<br>
added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?<br></blo=
ckquote><div><br></div><div><div style=3D"font-size:small">Probably. Ross a=
lready knows about this though, since we were discussing</div><div style=3D=
"font-size:small">it last week.</div><div style=3D"font-size:small"><br></d=
iv><div style=3D"font-size:small">I&#39;ll wait to hear from him on it.</di=
v></div></div></div></blockquote><div><br></div><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I should add that this is n=
othing new, there&#39;s just a commit that landed in</div><div class=3D"gma=
il_default" style=3D"font-size:small">july that promoted it to a visible wa=
rning, so it is safe to ignore (or at least we</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">aren&#39;t making anything worse by ignorin=
g it).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">commit 98aa4d5d242=
d3a73388271e00e11ce91d8c3c3e1 for those that</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">might be interested.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div><div style=3D"font-size:small"><br></div><div style=3D"font-si=
ze:small">Bruce</div></div><div>=C2=A0</div></div><div><br></div><span clas=
s=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_=
signature">- Thou shalt not follow the NULL pointer, for chaos and madness =
await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star =
Trek II<br><br></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f105ad06422325bb--

