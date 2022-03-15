Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60285C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 05:07:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7271.1647320856588422328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 22:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OH9Kt4xN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e24so27125339wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KOixJk8C1VVyG9nAEFUplBcuv1WUr/mD4wIWH76o8sQ=;
        b=OH9Kt4xNIy2NIDKPXIUOAp6hFdgUxvQ9P4c1jZrza77ciusFSc25Z7H9yNoWXUClRK
         J43uM1TI6Vra7IDrgqjVKsC98U0t5OjnY7XTD76+rdbA0Alsm518YkY7HDAIBgTxeetg
         1Hc6EF0Y2VkpJmgCw3GbEKgDgg7Rqi8lSlXG4RBy04wAtKcOi5O3sNaOt1J9Hrm9JOlW
         BRhFJniHuY3F35Y8KM0h0uVJuF1eKG7WpAu0FV4mE3ttJJjWAG7pYq+BicfB8V9PSXHd
         TxDNfA7g+nTVZsmN0OxbTOGw/76MI0oWvt1wUVS7EVLe5qH6vP2ZEv8MRA2frcTyu8jG
         uaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOixJk8C1VVyG9nAEFUplBcuv1WUr/mD4wIWH76o8sQ=;
        b=n/VnW6fBs2uekzIymIP78w+jBTBhrJc1/Z54gjco90UlnI1RZPBgIJIDKSUhL6SNr3
         4j1fnDQnxnCKvapb0k9LvkTMzzBv+Acv1loqv7VeweQl2VhcPTF/46T3Z/Ed0UwKs27X
         mngTl5ARYHmpdg4qcKL2HwxPkx9I1H9ydw1UuZaMWHtAblZBUz8VBQgrCGuQOMWIEsgS
         hNgXNcg2jovO1ZIuKXFCQZb1JwqlbtQaj+7D+oJfcG4ZCw+s2nkVVsCQtxL1IEvjom37
         Ch7pjqHAsXSsdx9Bxeg757SkE7enr/FgKGKniHsvHueK+4HviUp93Vp4P4pvx66ALBNS
         GIMg==
X-Gm-Message-State: AOAM530txgCD3Ct7RSntnbHlCrzwD5i91WTp0qwAclREkwLNtvOk9HLn
	TW/KlucM7BRCicLuhJAshkQG9eH8/w7yJsGh9mk=
X-Google-Smtp-Source: 
 ABdhPJyCclZ7JfRmuJlaEA1CEeRU/Qvw3CsXm/wjXIPpmYhDDRJTFSTAYQy9sEprZFdXIsjEzdQJnsg8GNncOEwf7t4=
X-Received: by 2002:adf:d1e8:0:b0:203:743d:207b with SMTP id
 g8-20020adfd1e8000000b00203743d207bmr19489593wrd.89.1647320854834; Mon, 14
 Mar 2022 22:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
 <CAMKF1soRb2L1y+gB9NnS42VWkaho=UfVtsYmNLRKUXhsuCE9dQ@mail.gmail.com>
 <CANx9H-DzYPGkXk7HBuzuGQnusu6OPSN=iiGkJBsGf3U5L75Cig@mail.gmail.com>
 <CAMKF1sqYLGmdMPWE76in9dFLXVYyBEf86n2HCexv9DfT-PnFBA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqYLGmdMPWE76in9dFLXVYyBEf86n2HCexv9DfT-PnFBA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 14 Mar 2022 22:07:23 -0700
Message-ID: 
 <CANx9H-DwSZs7=fVpPA7vtnm3GH7zX_ziUuLTb=Zz3qXvb4Z_aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000062342405da3ac6e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 05:07:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163225

--00000000000062342405da3ac6e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 8:00 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 14, 2022 at 7:56 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Mon, Mar 14, 2022 at 6:38 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On Mon, Mar 14, 2022 at 5:15 PM Tim Orling <ticotimo@gmail.com> wrote:
> >>>
> >>>
> >>>
> >>> On Mon, Mar 14, 2022 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>> we need to remove all of them from meta-python too.
> >>>
> >>>
> >>> Alejandro sent a patch for that, no?
> >>
> >>
> >> Yes but it was not
> >> Comprehensive I have staged couple of more removals which were missed
> see master-next however I just want to say that someone should ensure tha=
t
> the move is clean
> >>
> > Ok. It was hard to review the mega mono patch. I will take another look
> in the morning for thoroughness.
> >
>
> Thanks, just ensure that there are no duplicates left in meta-python,
> since the oe-core changes might have gone through revisions, there
> might be more recipes or less recipes
> moving to core. Just make sure the meta-python patch is in sync, its
> currently staged in master-next
>

There are a few more. Complete count should be 16 recipes:
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D1aa8c85acf2bbf56516cf607e449fdc4b3ae0570

I=E2=80=99ll address in the morning.

>
> >>
> >>
> >>>>
> >>>> On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
> >>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>> >
> >>>> > It is late in the cycle but is has become apparent that the
> dependencies we're
> >>>> > weaving with layers and meta-arm was reaching a point where it
> wasn't working
> >>>> > well for anyone. BSPs and hardware layers needing to pull in
> meta-oe/meta-python
> >>>> > isn't a good situation. Whilst late, it does seem better to sort
> this now before
> >>>> > the LTS ships rather than live with it for much longer.
> >>>> >
> >>>> > This series brings in python3-cryptography and it's dependencies t=
o
> OE-Core,
> >>>> > bringing everything to the standard needed (maintainers entries,
> homepages,
> >>>> > reproducibility), tweaks to match the recent python changes and
> some ptest
> >>>> > fixes.
> >>>> >
> >>>> > It also namespaces the classes with a python_ prefix since this
> makes it much
> >>>> > more obvious in core what area of the system the classes belong to=
.
> >>>> >
> >>>> > Cheers,
> >>>> >
> >>>> > Richard
> >>>> >
> >>>> >
> >>>> >
> >>>> >
> >>>> >
> >>>> >
> >>>> >
> >>>> >
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#163218):
> https://lists.openembedded.org/g/openembedded-core/message/163218
> >>>> Mute This Topic: https://lists.openembedded.org/mt/89786369/924729
> >>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [ticotimo@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
>

--00000000000062342405da3ac6e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 14, 2022 at 8:00 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">On Mon, Mar 14, 2022 at 7:56 PM Tim Orling &lt;<a href=3D"mailto:t=
icotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Mar 14, 2022 at 6:38 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Mar 14, 2022 at 5:15 PM Tim Orling &lt;<a href=3D"mailto:t=
icotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Mar 14, 2022 at 5:10 PM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; we need to remove all of them from meta-python too.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alejandro sent a patch for that, no?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes but it was not<br>
&gt;&gt; Comprehensive I have staged couple of more removals which were mis=
sed see master-next however I just want to say that someone should ensure t=
hat the move is clean<br>
&gt;&gt;<br>
&gt; Ok. It was hard to review the mega mono patch. I will take another loo=
k in the morning for thoroughness.<br>
&gt;<br>
<br>
Thanks, just ensure that there are no duplicates left in meta-python,<br>
since the oe-core changes might have gone through revisions, there<br>
might be more recipes or less recipes<br>
moving to core. Just make sure the meta-python patch is in sync, its<br>
currently staged in master-next<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">There are a few =
more. Complete count should be 16 recipes:</div><div dir=3D"auto"><div><a h=
ref=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-ne=
xt&amp;id=3D1aa8c85acf2bbf56516cf607e449fdc4b3ae0570">https://git.openembed=
ded.org/openembedded-core/commit/?h=3Dmaster-next&amp;id=3D1aa8c85acf2bbf56=
516cf607e449fdc4b3ae0570</a></div><br></div><div dir=3D"auto">I=E2=80=99ll =
address in the morning.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; It is late in the cycle but is has become apparent th=
at the dependencies we&#39;re<br>
&gt;&gt;&gt;&gt; &gt; weaving with layers and meta-arm was reaching a point=
 where it wasn&#39;t working<br>
&gt;&gt;&gt;&gt; &gt; well for anyone. BSPs and hardware layers needing to =
pull in meta-oe/meta-python<br>
&gt;&gt;&gt;&gt; &gt; isn&#39;t a good situation. Whilst late, it does seem=
 better to sort this now before<br>
&gt;&gt;&gt;&gt; &gt; the LTS ships rather than live with it for much longe=
r.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; This series brings in python3-cryptography and it&#39=
;s dependencies to OE-Core,<br>
&gt;&gt;&gt;&gt; &gt; bringing everything to the standard needed (maintaine=
rs entries, homepages,<br>
&gt;&gt;&gt;&gt; &gt; reproducibility), tweaks to match the recent python c=
hanges and some ptest<br>
&gt;&gt;&gt;&gt; &gt; fixes.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; It also namespaces the classes with a python_ prefix =
since this makes it much<br>
&gt;&gt;&gt;&gt; &gt; more obvious in core what area of the system the clas=
ses belong to.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Cheers,<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Richard<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt;&gt;&gt; View/Reply Online (#163218): <a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/163218" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1632=
18</a><br>
&gt;&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org=
/mt/89786369/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/89786369/924729</a><br>
&gt;&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@l=
ists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.open=
embedded.org</a><br>
&gt;&gt;&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@=
gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;&gt;<br>
</blockquote></div></div>

--00000000000062342405da3ac6e1--

