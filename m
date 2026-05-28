Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F48ECD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:19:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13350.1779981540840641244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 08:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JDlDhkHz;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: adityags2004@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso1870377666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 08:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779981539; cv=none;
        d=google.com; s=arc-20240605;
        b=gh/FXqH9XFA3Tt8XOdCCs7UaDvDyYjv9QZBDjB7tqCwiKrXI3zuXsCioFskuW7JbQz
         VmINoj/iUYVoYyW/ge66C1/RMVSwupgpzQ9X90KgxWxQBMclVchRUjVASt9svSI3rIHw
         PxwZKrbL2b30N9PiGAfofRvVnH0Q0g8K6Rc3gtV89vkz+L0R9pLNq2ay8LWTd5gbwq9e
         tQJOvKVE/hhefbgbl3cb83PzOzmbMGxdHNABV8fzYvctv/GZr7wT+SyP+qhyPY0AH3dt
         Raatbw93IYQugYMV+Q4GBZYGNlgR9TMa8UfgkvaN6/VLVXu+Prn1zlvJqVpV8B35u2oq
         rlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c7hJtzB8lpI3TS1U196A0Ui+HIYcJzZxySkVusVGT8M=;
        fh=B6vtDpNTi4XOGWGC9Kq5d9W1AUmYn1kAF47SU3Mvhxo=;
        b=EjGJ3t6x1hfsffqrmDVrLmGdWmf9eLymECKY6z3G8jfyw0oHIJ79d3bZrcvx7sXdLH
         CuS10OIHk62HFtiQ/74H9VJR/fU7N/0Is/+r0fGLDoyzPdjo4unaCCtJkf23uSEsW3/0
         BD+VONlV6T7BVZssY64TQfneEmMnmENW0cRQ819hElJHSpHK39Cmri7+cJN9yeMaYGoy
         jAsvLXAZ3VSXm46YI0LHm5AEy1V5IBb+nSIIm6J+1jRLHJor5/tvg0ZIUbGQ3+jQ/qcL
         mz4AmZPmfupFp0KNnj8XJ2T5jRk0fumluZ2BrPGZkh3oZKQ3q6NRrmt2F3YFQfPepXHn
         IKSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779981539; x=1780586339; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c7hJtzB8lpI3TS1U196A0Ui+HIYcJzZxySkVusVGT8M=;
        b=JDlDhkHznikEs7K0GFa7h394bfQbBIrq7c/7v66nIxkVZZAaK10XFwMTW0cA7DvKdE
         g0SGWmksZllJy77Mkq1dBKotcQbzAG8Ti0gmu7bNf6VVwBzX4v+dlF+4wBA8UsRz0MzL
         m6CkuQEMqGxmfW+up9kgFm7y9tvuvJhDm0V8qFeDWBsaljCYhRomcU47KEcl7dY0e119
         umu4FP4DQkv/GhvR5FtPWp3SGel+sIhdjQrkqcpDzBXYFXY5XhD/6dc9oPUMWzqEsdea
         vCxhcrIwExxnHv8Ok4fC4+knmWruY3edPjvLC+Ghg3mKM5q7u3JzCVcQWwS6UTwRxYX+
         nHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981539; x=1780586339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7hJtzB8lpI3TS1U196A0Ui+HIYcJzZxySkVusVGT8M=;
        b=ZCHhCWowhE04WaO1KNJSb/9Ko0jeNS+BSyaD3I/pztvjyE5TMV/4tlV6UjnjDhlHm1
         09RiuOtep8UkdnOkgLWgf1j7lSp+sy8kL8rXIr/m/KB3Dat3WeA8hnI6sOE+2DEfQYLG
         Flb4yyaz0qe6xMCce1JT+TDe4ZyN0SEX0fRSbxZrQPBA1xcFjMJB3kg+LmGyqW53IOzW
         WP5gbVZmLKKae4nh6ZEgndoP/s0r5SlQGf1eULLTpDz6DfVeKA8NefGQbfERw7g8CYEP
         NTWtT9Y7UO1viQQ8Zt8JFfasOMLL64eYzwcPX5iMBztk6qezT/e28I3UVnkkO7hhG680
         D+fw==
X-Gm-Message-State: AOJu0Yw5vi/K1YB85og5md/2KyakvyVds+ssKFOPZEtQyVba0dOhjPGQ
	vTwPIqJDojlqmvehYKSLUImoQYgdfkyvQIsD2PAE0lzi1noJ3B5U7kbeEZiKfFVuz7mndAoYcvZ
	WR1GtU08kcl31LXo2zyu7q71MW1YeiIDG0vtZ
X-Gm-Gg: Acq92OFoXBzatAcpv1uacz/PzvkFyAvS03vnjMt9WwxUgBVVn2ApWeEszqQwE7dvLQq
	kca4teGkpWVatwBBbqj5iT8rHR89YgroCyglOi2Ir/X3FouM//dMY/tnQxmU07gpm7NjWFsgjvB
	Q7KfToGav4qrrqu9Q7Ql5LeTyKOhqVP/AdRyFtvDGzjgDbTS/bX4SBdS9wtlaCa1nFUTXwTSg0v
	8yuwzNeMMB4rfMwusVt8fGZBYbgxdaNNIYWaKd12tPHhs86JwLoaAQwh6iJN7Zsd/sObXm+XiBg
	njreqaH+/nRNLKfZlBRFA5RApAdm2jg=
X-Received: by 2002:a05:651c:551:b0:394:4ec:ccbc with SMTP id
 38308e7fff4ca-395d8cc5d5fmr99150821fa.14.1779981212199; Thu, 28 May 2026
 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
 <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com> <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
In-Reply-To: <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Thu, 28 May 2026 20:43:19 +0530
X-Gm-Features: AVHnY4KO3JDUNKDdb9YI44NVefUipVhKHh3gyJhiRIBBSzMSqJXq6vMWkfSWzWU
Message-ID: <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000dc2de60652e22b91"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237734

--000000000000dc2de60652e22b91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I wanted to provide an update on this issue.

The proposed fix has now been accepted upstream by the gawk maintainer.

The changes to randtest.sh have been reviewed and integrated into the
upstream repository, with appropriate updates to the original file and
test/ChangeLog.

Given that the root cause has now been addressed upstream, this issue can
be resolved in oe-core by backporting the corresponding upstream fix,
rather than relying on a workaround such as skipping the test.

Please let me know if you would like me to prepare a backport patch for
oe-core based on the upstream changes.

Thanks,
Aditya

On Thu, May 28, 2026, 11:03=E2=80=AFAM Aditya G.S <adityags2004@gmail.com> =
wrote:

> Hi Alex,
>
> Thanks for the guidance.
>
> A few days back I was facing SMTP configuration issues with git
> send-email, which prevented me from sending patches in the proper format.
> Because of that, I initially shared the patch manually.
>
> The SMTP issue is now resolved, and I have since used git send-email for
> submissions. I also resent the patch to gawk upstream using git send-emai=
l,
> addressing the bug-gawk mailing list and CC'ing the maintainers.
>
> Please let me know if anything further is needed from my side.
>
> Thanks,
> Aditya
>
> On Wed, May 27, 2026, 5:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
> wrote:
>
>> On Wed, 27 May 2026 at 13:41, Aditya G.S <adityags2004@gmail.com> wrote:
>> > At this point, I am waiting for his feedback on the proposed fix. Once
>> I receive a response or the patch is accepted (or revised), I will follo=
w
>> up accordingly and share the upstream link when available.
>> >
>> > Please let me know if you would prefer that I proceed with a temporary
>> Yocto-side workaround (such as skipping the test) while the upstream
>> resolution is pending.
>>
>> Thanks for summarizing, but I think there's a standard mailing list
>> archive, where emails are placed as soon as they're sent:
>>
>> https://lists.gnu.org/archive/html/bug-gawk/2026-05/msg00054.html
>>
>> I see you're struggling with sending attachments there, I'm not sure
>> why you can't simply use 'git send-email' to send the patch, as you
>> just did on this list, but that is typically much preferred. Email
>> attachments are difficult to review, especially when line by line
>> comments are needed.
>>
>> Otherwise, upstream seems friendly and responsive, so we should
>> probably wait a bit? Ideally, they'd add the fix to the upstream git
>> repo, and then it can be backported in oe-core.
>>
>> Alex
>>
>

--000000000000dc2de60652e22b91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">I w=
anted to provide an update on this issue.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">The proposed fix has now been accepted upstream by the ga=
wk maintainer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The chang=
es to randtest.sh have been reviewed and integrated into the upstream repos=
itory, with appropriate updates to the original file and test/ChangeLog.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Given that the root cause =
has now been addressed upstream, this issue can be resolved in oe-core by b=
ackporting the corresponding upstream fix, rather than relying on a workaro=
und such as skipping the test.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Please let me know if you would like me to prepare a backport patch =
for oe-core based on the upstream changes.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Aditya</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 28, 2026, 11:03=E2=80=AFAM Aditya G.S &lt;<a hr=
ef=3D"mailto:adityags2004@gmail.com">adityags2004@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"=
>Hi Alex,</div><div dir=3D"auto"><br></div>Thanks for the guidance.<div dir=
=3D"auto"><br></div><div dir=3D"auto">A few days back I was facing SMTP con=
figuration issues with git send-email, which prevented me from sending patc=
hes in the proper format. Because of that, I initially shared the patch man=
ually.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The SMTP issue is=
 now resolved, and I have since used git send-email for submissions. I also=
 resent the patch to gawk upstream using git send-email, addressing the bug=
-gawk mailing list and CC&#39;ing the maintainers.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Please let me know if anything further is needed=
 from my side.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,=
=C2=A0</div><div dir=3D"auto">Aditya=C2=A0</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 27, 2026, 5:36=
=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Wed, 27 May 2026 at 13:41, Adit=
ya G.S &lt;<a href=3D"mailto:adityags2004@gmail.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">adityags2004@gmail.com</a>&gt; wrote:<br>
&gt; At this point, I am waiting for his feedback on the proposed fix. Once=
 I receive a response or the patch is accepted (or revised), I will follow =
up accordingly and share the upstream link when available.<br>
&gt;<br>
&gt; Please let me know if you would prefer that I proceed with a temporary=
 Yocto-side workaround (such as skipping the test) while the upstream resol=
ution is pending.<br>
<br>
Thanks for summarizing, but I think there&#39;s a standard mailing list<br>
archive, where emails are placed as soon as they&#39;re sent:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/bug-gawk/2026-05/msg00054.htm=
l" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://lists=
.gnu.org/archive/html/bug-gawk/2026-05/msg00054.html</a><br>
<br>
I see you&#39;re struggling with sending attachments there, I&#39;m not sur=
e<br>
why you can&#39;t simply use &#39;git send-email&#39; to send the patch, as=
 you<br>
just did on this list, but that is typically much preferred. Email<br>
attachments are difficult to review, especially when line by line<br>
comments are needed.<br>
<br>
Otherwise, upstream seems friendly and responsive, so we should<br>
probably wait a bit? Ideally, they&#39;d add the fix to the upstream git<br=
>
repo, and then it can be backported in oe-core.<br>
<br>
Alex<br>
</blockquote></div>
</blockquote></div>

--000000000000dc2de60652e22b91--

