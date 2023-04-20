Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B8DC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:41:37 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.4088.1681983688088756199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 02:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=R73mLgCW;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id c3so2071448ljf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681983686; x=1684575686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WEzPd8i5bNRW52Cq+GWmcr0aH+166XLZ5k/PQjRhkhs=;
        b=R73mLgCWGMxBCGt3VTF5YuwgW7EePSGhg8qcDfoLKtN80QfRCHP9GtIoJTk7lLx3mx
         8O5D5iegxosSUTQRfkR8rH5kG4ps5IGyOqoPa4Gr0LWOj9PhH+vm8dYyTU7i+NbRAcft
         QnybOH2/xWxJdVqYa5Pi6NbARfGyETl+YN5M9A1V45YJSjkMI7nZ5f6/Fi5/SyMH7OPT
         H5XjbUiSkDs3aEL3ITYe5y3T9f3KUlBLCw3/BQsxwcRmV6Ko3FT0I546sRjiZ1FQ0EUh
         alUD5CbYZGYb5/Y++Rz/xeGsY3O4BimE0qN9irKBsGhj6KqYpXO4cw4tsXbM5gqo6xsN
         N6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983686; x=1684575686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEzPd8i5bNRW52Cq+GWmcr0aH+166XLZ5k/PQjRhkhs=;
        b=Sy6NbZdcNwi/rZyLaI+wXpxEIHefiar3ROWzOadKDDy9mJNJlH3dxvfiOtPmo22qLW
         PlWXDlWP0XJhZfEvJEU+BrE5yXoTUSCGKfWy3KULCe/CvF+K339WYAh09KdhZ9vfKvtk
         C2NtAXA076vvpeyyRPcLe5pBrQuwGtQgVvMStZv8AaxZRl96G8MPdid9TFwSFmN8eNNt
         SWiPK+opivSLkzs2o7rcK5Jzq9dIHP7TON9IQC+60ZvGiUAl9/+aWSAz0Q+nW3H8pPGS
         e9QiZAR59z5+dj0zz91UHTaYATwCA19GpahP7eHC/QDlZ6ZIlfdUMtn4JB+1x/GKLCF2
         0fbA==
X-Gm-Message-State: AAQBX9fPK7Mqtp503ggOP+IH+WmHvkaS8JUiEymY/4DaqZZYsxCxptwZ
	Kcjj2D01vJRE1me2rbW+VkxH1/BZrRHWihBA4CA=
X-Google-Smtp-Source: AKy350Y7/528yo3hgh3AKLzscw74JBxyRsnGRmTYFHqL83gs1jHErj2lKEKcpzlcnad3LNO2YFO687uK8FkkyuFhUT8=
X-Received: by 2002:a2e:7a0b:0:b0:2a8:ea22:28b3 with SMTP id
 v11-20020a2e7a0b000000b002a8ea2228b3mr182111ljc.3.1681983685554; Thu, 20 Apr
 2023 02:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
 <CANNYZj-G1AzrcbdVjQnBt4eSc7Ky_pHgzd+3KQ_p2ory+F-Prg@mail.gmail.com>
In-Reply-To: <CANNYZj-G1AzrcbdVjQnBt4eSc7Ky_pHgzd+3KQ_p2ory+F-Prg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 20 Apr 2023 11:41:13 +0200
Message-ID: <CA+cAkerRfm9RTg2rpqZS6yC_Q_+hkWm0nnY1gVkEfXjEU2FCog@mail.gmail.com>
Subject: Re: [OE-core] Cargo and ptest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018751505f9c15838"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180244

--00000000000018751505f9c15838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks alex, I made mistake for cargo-native, I meant cargo cross compiled
for the test image of course.

Anyway, I'll build something and submit some patch as soon as I'm happy
with the code.

Le jeu. 20 avr. 2023, 11:25, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> I'm not sure anyone can really give qualified answers, you just need
> to write down some code and iteratively get it to something you like.
> You don't have to show your work in progress, if you think it looks
> horrible :)
>
> Question 1 is odd: cargo-native would not run in target images, so you
> can't add it to them.
>
> Alex
>
> On Thu, 20 Apr 2023 at 09:27, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Hello,
> >
> > I would like to build and ship tests for recipes which uses cargo and i=
n
> the process, three questions arose (maybe more when I will progress).
> > I would like to have your opinions on them.
> >
> > 1) should we ship cargo-native in ptest images or should we just build
> and ship test binaries alone ?
> > 2) should we place the cargo ptest specifics in a dedicated class (e.g
> ptest-cargo.bbclass, like already existing ptest-gnome or ptest-perl) or
> put this in cargo.bbclass itself ?
> > 3) should we embed all kind of tests (unit, integration and doc tests,
> see https://doc.rust-lang.org/book/ch11-03-test-organization.html) or
> just the unit tests ?
> >
> > Thank you very much for all insights you could give on this matter.
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180238):
> https://lists.openembedded.org/g/openembedded-core/message/180238
> > Mute This Topic: https://lists.openembedded.org/mt/98384286/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000018751505f9c15838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks alex, I made mistake for cargo-native, I meant car=
go cross compiled for the test image of course.<div dir=3D"auto"><br></div>=
<div dir=3D"auto">Anyway, I&#39;ll build something and submit some patch as=
 soon as I&#39;m happy with the code.=C2=A0</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 20 avr. 2023, 11:2=
5, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kan=
avin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">I&#39;m not sure anyone can really give qualified answers, you just=
 need<br>
to write down some code and iteratively get it to something you like.<br>
You don&#39;t have to show your work in progress, if you think it looks<br>
horrible :)<br>
<br>
Question 1 is odd: cargo-native would not run in target images, so you<br>
can&#39;t add it to them.<br>
<br>
Alex<br>
<br>
On Thu, 20 Apr 2023 at 09:27, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I would like to build and ship tests for recipes which uses cargo and =
in the process, three questions arose (maybe more when I will progress).<br=
>
&gt; I would like to have your opinions on them.<br>
&gt;<br>
&gt; 1) should we ship cargo-native in ptest images or should we just build=
 and ship test binaries alone ?<br>
&gt; 2) should we place the cargo ptest specifics in a dedicated class (e.g=
 ptest-cargo.bbclass, like already existing ptest-gnome or ptest-perl) or p=
ut this in cargo.bbclass itself ?<br>
&gt; 3) should we embed all kind of tests (unit, integration and doc tests,=
 see <a href=3D"https://doc.rust-lang.org/book/ch11-03-test-organization.ht=
ml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://doc.rust-lang.o=
rg/book/ch11-03-test-organization.html</a>) or just the unit tests ?<br>
&gt;<br>
&gt; Thank you very much for all insights you could give on this matter.<br=
>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180238): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180238" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1802=
38</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98384286=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/98384286/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000018751505f9c15838--

