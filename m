Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BBDCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:50:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.31689.1761569409107937268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOvRZGcY;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so4374135a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761569408; x=1762174208; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tVGeF8yY51bubBWvYLmM80cVgULd6/0HupPlvmEhehA=;
        b=IOvRZGcYmqwRLIgZ44u2qIZeDLx1bRtlm+npoOuTyOSMcRqproz3RHUj3w3H07SKWT
         6R9Z1SraplWsjmNUOaY8U8xUbOld+J2evMVJ/xDi3KC65tqCNENVE/X5E1rOE4kZ0934
         gcElICmUMrbdWD51Ermu6JgyFLxZoz/pI20nkEUjpqY5kU59YrUEQ+N3gqeOYgfc4Ri3
         xGK7QwFM4p7uZdvsBt6irK5k5hCQyO9Mxoc5H9VXZ1cxji9P0aRKYGj413P6fB2zRKrb
         6Der1WVXZN5U/QbIP/9D+AFUNhKC1LZtOKh6DWdJn5ziNBPzu2jCQNLdONmqkavZzV0r
         1Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569408; x=1762174208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVGeF8yY51bubBWvYLmM80cVgULd6/0HupPlvmEhehA=;
        b=Uf07dmrkj0NoUP0DZY7HCbsVIvKE+4XGI1HgUFQQO6/Ps32TVD9Ruw7ZQE9mNv20eu
         2CGQtiQnGFyjDzPu8p2OYsctj73jjHC8QdPmFA65oP4rIT4AJciqtygox9RQJAlxTZxs
         E6MFnh+CMuENMATaSKOoxi0sH+XeY/2nbuQKh2GRJQCARU+9XwqtkVc5MxbYDauqzt3V
         PsXnc4/pH/n9uqZ8Kpv+V8qIG5hFTHYcAIei49I2ouwEtumjFWcczVPtSbAAiysg6r5n
         Hv/k9MJeP88mDYUwjvmxyXKMNTQb9VqnglvL4aNKzcqoXNCepi9ny3b34WI54YYtDxYu
         gxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCQdDA1fHe+w9LVbrx2drANXTAvS7lEzMYS2xBj1l/o8G+X1krHmQvaBw3RKQpN6uzkyXMaCXi0f0du4aNSrgYYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrNg5Ps/ZeAmY/a2HB1oNifC3WfAFqaGeQULMW3RjM2BrGuQtt
	/UUsKZDt+4YZgxJPH9gNevwMBLKFgGUNmLUT1Gw657NN2tAZqbNjoDLKPUgOHLh8uI4egTH+Vzo
	RCMG7865zByFMhfJeD/IHx9IHVSMXGOk=
X-Gm-Gg: ASbGncvwMdoSJv8szgL3b6fVISxPcVm8/4pDguEtwHiZjNxYiHW8Elr7I2OZLvbew+K
	plr4M6zFOieZX7EqrB3+coBmV78A9g5WW7BKiJ0CwlsR9tCobVePGUQuCiPwRwxxmamd39jaHl+
	lg6nODxL5YNvQ4XdTQUgBQhPGaRBV1Fwamf4GVIeRwOg6Yp2zHPZAQQVM7aPdkq48bRhJe1+jqb
	PnLL4BxR8HJ7pC08K2MUkm7WQzZfW8FnYVDWKWacdx6Pqd935iyr8CHDfjYZCYW6A/IpntQ
X-Google-Smtp-Source: AGHT+IGpg2653cZ8+C9/40BpdQvKaluLvEgLKOvx7j9yuzrvfC8T6Gzb+zCQm5Vbh9Fe8dQJXbaHKOXL2L/aZ0T1biQ=
X-Received: by 2002:a17:90b:33d2:b0:32e:38b0:1600 with SMTP id
 98e67ed59e1d1-33bcf85aa0bmr48327305a91.6.1761569408309; Mon, 27 Oct 2025
 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
 <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com> <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
 <CAOMZO5BXLizaBKmOQFKreoCr1OkzBUZMUfD5CrRg6g_JAgib0Q@mail.gmail.com>
 <CADkTA4Ogj_Jk3-L+EH+-JSBKKF1+dr=QFc3yQHVUNmsc2Gtc7Q@mail.gmail.com> <1872594C74F7A094.2174@lists.openembedded.org>
In-Reply-To: <1872594C74F7A094.2174@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Oct 2025 08:49:56 -0400
X-Gm-Features: AWmQ_bmGkYOi9BF-9Yq4-phXHolwemAGQSuEZdnZ6AY2qVt2KFf6RN6Gi7U0RiQ
Message-ID: <CADkTA4P=6umT_pL3sjRowS7W549-e7VbdGGZaGS8-DM54QZM_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
To: bruce.ashfield@gmail.com
Cc: Fabio Estevam <festevam@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d45ded0642235617"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225335

--000000000000d45ded0642235617
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:36=E2=80=AFAM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Mon, Oct 27, 2025 at 8:33=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
>
>>
>>
>> On Mon, Oct 27, 2025 at 8:32=E2=80=AFAM Fabio Estevam <festevam@gmail.co=
m> wrote:
>>
>>> On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> > It boots locally, so I don't have any great ideas.
>>>
>>> Shouldn't "check access for rdinit=3D/init failed: -2, ignoring" be
>>> added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?
>>>
>>
>> Probably. Ross already knows about this though, since we were discussing
>> it last week.
>>
>> I'll wait to hear from him on it.
>>
>
>
> I should add that this is nothing new, there's just a commit that landed =
in
> july that promoted it to a visible warning, so it is safe to ignore (or a=
t
> least we
> aren't making anything worse by ignoring it).
>
>
... and another finding that it is in all the boot logs, just one seems to
fail on it in
the testing (or we haven't reported the failures on the other architectures
yet).

We are hunting up where it appears from, and we'd be better to inhibit from
being
passed at all, versus ignoring it. In case we start using it someday :)

Bruce



> commit 98aa4d5d242d3a73388271e00e11ce91d8c3c3e1 for those that
> might be interested.
>
> Bruce
>
>
>
>>
>> Bruce
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225334):
> https://lists.openembedded.org/g/openembedded-core/message/225334
> Mute This Topic: https://lists.openembedded.org/mt/115939539/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d45ded0642235617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 8:36=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025=
 at 8:33=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 8=
:32=E2=80=AFAM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com" targ=
et=3D"_blank">festevam@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Br=
uce Ashfield via<br>
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
v></div></div></div></blockquote><div><br></div><div><br></div><div><div st=
yle=3D"font-size:small">I should add that this is nothing new, there&#39;s =
just a commit that landed in</div><div style=3D"font-size:small">july that =
promoted it to a visible warning, so it is safe to ignore (or at least we</=
div><div style=3D"font-size:small">aren&#39;t making anything worse by igno=
ring it).</div><div style=3D"font-size:small"><br></div></div></div></div><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">... and another finding that it is in all the boot logs, just o=
ne seems to fail on it in</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">the testing (or we haven&#39;t reported the failures on the othe=
r architectures yet).<br><br>We are hunting up where it appears from, and w=
e&#39;d be better to inhibit from being</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">passed at all, versus ignoring it. In case we star=
t using it someday :)</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"f=
ont-size:small"></div><div style=3D"font-size:small">commit 98aa4d5d242d3a7=
3388271e00e11ce91d8c3c3e1 for those that</div><div style=3D"font-size:small=
">might be interested.</div><div style=3D"font-size:small"><br></div><div s=
tyle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div><div style=3D"font-size:small"><br></div><div style=3D"font-siz=
e:small">Bruce</div></div><div>=C2=A0</div></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225334): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225334" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225334</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115939539/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115939539/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d45ded0642235617--

