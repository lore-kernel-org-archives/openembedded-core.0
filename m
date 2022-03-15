Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD090C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 02:56:02 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.6278.1647312961578676740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 19:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/rf+mYg;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k24so26893265wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+qOJVYVPByognMu+SvB1FRLfTMX2k8Ob/g68DAFWmM8=;
        b=h/rf+mYgNTJ7lL4suNewvF00qOMUsc3ukYZgBT/5jCb5LINHxOO3pJHI48cRAvBcvj
         06Jy5PqAUArUCYZR2IHcbXUpK8Zmghxf+ofVRkh3kPFt5sd/fsb5Wkr4YtdNLiJSSH7X
         KyOIhyqIEYox2GEoSQGZdBiK5LkZpme5pKyfHmPc8zidJpJsbypiM1b9YG14Xj6CfQQM
         4GYdkdhlUD6V0X8BBHNTiMQFTZdcl7Lv7/4GKyBYmGai5c8EvGCIVKv1Z21+/bpJY6cm
         kiYTBZn3Br6heXTnEeRgAE+cHiAPuCgK58LiMt9Ai/TM64nsT74SpDfqXWf+JGVlfJQN
         AaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+qOJVYVPByognMu+SvB1FRLfTMX2k8Ob/g68DAFWmM8=;
        b=hEzbXuJFtams5dd+knDWGEgVhFkXx2A4/DPoz+N7Rm+zsLTZUIHsIenTRBRB+eAOdD
         xg2Kqu3e4/oj1SSfkz9RXAUPHlDjGJvRRnV9iVN3uP02SV5sXsNZJX1k5THeZaQnICoo
         eA7luUVNuFoaw8vzVJJhbQaXBrth7Izuga6GwbTKhQV4VkRbskJeonqHUWFTKQfSx459
         oUwaFL1jIHlaGiMZDGE6aNnLI3a4kiw2eEwPj5fVMouAcGaPal8uFegXVhieVVKMtW9n
         1O+qnpG82rY/8YaPzFloxn6G/x/Okd/o7k7qpy8DPMZYWYmDXtaW2Ljf94u30pYFeZUY
         E+jw==
X-Gm-Message-State: AOAM5324eawJ6yBkL+kOUtNbI1duNr98UIcC4qdWfG3hNOfebujmQvtY
	CvoSFPaDrUNV9MHEfsD+5wUzcUaySlN7k+0oIZM=
X-Google-Smtp-Source: 
 ABdhPJzCpMC+rInhU8jOCG5lI+3mqHQGLBaumbj8BmJtAQees2sbtEIi+1zbA0UJR+I1mRvtFT+8mL1qZUFuI9Cb0fc=
X-Received: by 2002:adf:d1e8:0:b0:203:743d:207b with SMTP id
 g8-20020adfd1e8000000b00203743d207bmr19224984wrd.89.1647312959590; Mon, 14
 Mar 2022 19:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
 <CAMKF1soRb2L1y+gB9NnS42VWkaho=UfVtsYmNLRKUXhsuCE9dQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soRb2L1y+gB9NnS42VWkaho=UfVtsYmNLRKUXhsuCE9dQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 14 Mar 2022 19:55:48 -0700
Message-ID: 
 <CANx9H-DzYPGkXk7HBuzuGQnusu6OPSN=iiGkJBsGf3U5L75Cig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000ca53f705da38efe4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 02:56:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163222

--000000000000ca53f705da38efe4
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 6:38 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, Mar 14, 2022 at 5:15 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>>
>>
>> On Mon, Mar 14, 2022 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> we need to remove all of them from meta-python too.
>>>
>>
>> Alejandro sent a patch for that, no?
>>
>
> Yes but it was not
> Comprehensive I have staged couple of more removals which were missed see
> master-next however I just want to say that someone should ensure that the
> move is clean
>
> Ok. It was hard to review the mega mono patch. I will take another look in
the morning for thoroughness.


>
>
>>> On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> >
>>> > It is late in the cycle but is has become apparent that the
>>> dependencies we're
>>> > weaving with layers and meta-arm was reaching a point where it wasn't
>>> working
>>> > well for anyone. BSPs and hardware layers needing to pull in
>>> meta-oe/meta-python
>>> > isn't a good situation. Whilst late, it does seem better to sort this
>>> now before
>>> > the LTS ships rather than live with it for much longer.
>>> >
>>> > This series brings in python3-cryptography and it's dependencies to
>>> OE-Core,
>>> > bringing everything to the standard needed (maintainers entries,
>>> homepages,
>>> > reproducibility), tweaks to match the recent python changes and some
>>> ptest
>>> > fixes.
>>> >
>>> > It also namespaces the classes with a python_ prefix since this makes
>>> it much
>>> > more obvious in core what area of the system the classes belong to.
>>> >
>>> > Cheers,
>>> >
>>> > Richard
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#163218):
>>> https://lists.openembedded.org/g/openembedded-core/message/163218
>>> Mute This Topic: https://lists.openembedded.org/mt/89786369/924729
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> ticotimo@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>>

--000000000000ca53f705da38efe4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 14, 2022 at 6:38 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Mar 14, 2022 at 5:15 PM Tim Orling &lt;<a href=3D"mailto:ticotim=
o@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar =
14, 2022 at 5:10 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">we need to remove all of them from meta-py=
thon too.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro sent a=
 patch for that, no?</div></div></div></blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yes but it was not</div><div dir=3D"auto">Comprehensi=
ve I have staged couple of more removals which were missed see master-next =
however I just want to say that someone should ensure that the move is clea=
n=C2=A0</div><div dir=3D"auto"><br></div></div></div></blockquote><div>Ok. =
It was hard to review the mega mono patch. I will take another look in the =
morning for thoroughness.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"></=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; It is late in the cycle but is has become apparent that the dependenci=
es we&#39;re<br>
&gt; weaving with layers and meta-arm was reaching a point where it wasn&#3=
9;t working<br>
&gt; well for anyone. BSPs and hardware layers needing to pull in meta-oe/m=
eta-python<br>
&gt; isn&#39;t a good situation. Whilst late, it does seem better to sort t=
his now before<br>
&gt; the LTS ships rather than live with it for much longer.<br>
&gt;<br>
&gt; This series brings in python3-cryptography and it&#39;s dependencies t=
o OE-Core,<br>
&gt; bringing everything to the standard needed (maintainers entries, homep=
ages,<br>
&gt; reproducibility), tweaks to match the recent python changes and some p=
test<br>
&gt; fixes.<br>
&gt;<br>
&gt; It also namespaces the classes with a python_ prefix since this makes =
it much<br>
&gt; more obvious in core what area of the system the classes belong to.<br=
>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163218): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163218" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163218</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89786369/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89786369/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000ca53f705da38efe4--

