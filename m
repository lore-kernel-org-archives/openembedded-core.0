Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FACC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 08:20:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.46032.1682324446830929766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 01:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lycXQ3OL;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4eff1f7f34bso602070e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682324445; x=1684916445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CzCue6PgC2S5ybaWU7ix0RJof9qr1x2fJ0GI0FWvfD4=;
        b=lycXQ3OLN7CodMtq8B/uT663sqtgTM62PsUscITODitvH5Ne6Djjl4Ui+fIAUzu/Kq
         E1J7XpxQsaHMYg+4ZgO1O1ogO1Oix6QrAl9ZQm1KQBruIWz5MpqgNaXrB6IlEEnLTtpR
         I8L6QkMUi41VhzSxzPdcxKvASCB5fTIrexWCwfUE5nKfpc/l3lZERpyrwI03oMg710o3
         Ucg2Os0nHxC8g3crwcdOtCbT8fzj0AXSPYekNJbO+Be/gEI3nOiWLosOqCjh0bRZlnhu
         xDugHrOGgmQWJxPNU/qcsjArIFZ2rI+uHxOSpqKgeux1vp/PQV7ic2WugoYEN5wTRllK
         6AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682324445; x=1684916445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzCue6PgC2S5ybaWU7ix0RJof9qr1x2fJ0GI0FWvfD4=;
        b=c5Qxs27tpW9g1EpHhzqMWyUZNRRM4GHkVNNdY6RhMYMZDXlBxOs+YjyBXqKn23dYCO
         BK/D1HE8uK43H5BnpyLGVorCni1gKd2yn3m8WVPQTmy85XlvxIeeqjaBhdwUbFCVxvzF
         zPBjfivnUKGkE1IInYXfd/OoJtd1qV7Ybqf2n+IetsknQoPgrhL1YwZPq97twszlJOat
         CYxtKKYLxu+bW3fNB3Y8QgTvsUK/O+DimVHmXLqWNlQm+Zoj5i+fNRPnhmMGUmLjWzFo
         0MJmC0k5bcnKbkOmYu0aGFk+O5HHZ5p94VGcrUQ46j0cUFb9QdTrp2lOr9eSfm9g3R5s
         Ponw==
X-Gm-Message-State: AAQBX9d8ztp8FS7VdkAPIfdWDfUKr5Bqdfx1RPwNer8p9cJQeJ+OXzjl
	rTfDpN+l5wEMOfpySL39/Bs6bPgifBy0/V4+VcU=
X-Google-Smtp-Source: AKy350b44qvlCgIx5q+l+DPXYt354gYUlI5/scQO4+Ev6J31QGaq+s45j2esCBVnlppT/GV/1JEEuBQZBHX7AoD3/aY=
X-Received: by 2002:a05:6512:21cd:b0:4dc:84c2:96f1 with SMTP id
 d13-20020a05651221cd00b004dc84c296f1mr2866540lft.22.1682324444548; Mon, 24
 Apr 2023 01:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com> <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com>
In-Reply-To: <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 24 Apr 2023 10:20:32 +0200
Message-ID: <CA+cAkeput36T3K76HPAgxi-6a3izM_dQNyjTcoNzRchYMPu=XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Create class for building rust unit test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea129705fa10aefc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 08:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180341

--000000000000ea129705fa10aefc
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Apr 2023 at 09:51, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> If you add ptests, please also add them to appropriate lists in
> meta/conf/distro/include/ptest-packagelists.inc, so they will be
> actually built and executed in yocto CI.
>
> Can you include a sample output of the tests you added into commit
> messages?
>
> Alex
>

Ok I will issue a V2 with the modifications asked.


> On Sat, 22 Apr 2023 at 17:59, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This brings the possibility to use this class to build and ship
> > unit tests of rust projects, the class also create (or modified)
> > standard run-ptest script to run the generated rust test suite.
> >
> > It has been tested successfully with core-image-sato under qemu
> > for zvariant-ptest and python3-bcrypt-ptest (though the last one
> > didn't define any unit tests).
> >
> > Note that I tried to do the same with python3-cryptography but fail
> > to build the test suite and I don't know how to do it with the rust
> > extension module build by python setuptools. There must be some kind
> > of way for doing that so maybe someone will put some work in it (
> > because python3-cryptography rust extension do have unit tests).
> >
> > Moreover, in the class, I didn't manage to share data between
> > do_compile_ptest_base and do_install_ptest_base cleanly (I tried
> > to d.setVar in compile and d.getVar in install but it seems that
> > the data store doens't recognize my new variable) so I used a file
> > for that. I'm sure there is a clever way for doing that, so feel
> > free to tell me.
> >
> > The following changes since commit
> 45a8bb6e4676899d40525e7d5ad1c1ddefee3185:
> >
> >   apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/fmartinsons/openembedded-core cargo-add-ptest
> >
> > Frederic Martinsons (3):
> >   ptest-cargo.bbclass: create class
> >   python3-bcrypt: enable build of unit tests
> >   zvariant: add ptest feature for zvariant test suite
> >
> >  .../zvariant/zvariant_3.12.0.bb               |  11 +-
> >  meta/classes-recipe/ptest-cargo.bbclass       | 108 ++++++++++++++++++
> >  .../python/python3-bcrypt_4.0.1.bb            |   4 +-
> >  3 files changed, 121 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/classes-recipe/ptest-cargo.bbclass
> >
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180319):
> https://lists.openembedded.org/g/openembedded-core/message/180319
> > Mute This Topic: https://lists.openembedded.org/mt/98436057/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000ea129705fa10aefc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Apr 2023 at 09:51, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
If you add ptests, please also add them to appropriate lists in<br>
meta/conf/distro/include/ptest-packagelists.inc, so they will be<br>
actually built and executed in yocto CI.<br>
<br>
Can you include a sample output of the tests you added into commit messages=
?<br>
<br>
Alex<br></blockquote><div><br></div>Ok I will issue a V2 with the modificat=
ions=C2=A0asked.<br class=3D"gmail-Apple-interchange-newline"><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
On Sat, 22 Apr 2023 at 17:59, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This brings the possibility to use this class to build and ship<br>
&gt; unit tests of rust projects, the class also create (or modified)<br>
&gt; standard run-ptest script to run the generated rust test suite.<br>
&gt;<br>
&gt; It has been tested successfully with core-image-sato under qemu<br>
&gt; for zvariant-ptest and python3-bcrypt-ptest (though the last one<br>
&gt; didn&#39;t define any unit tests).<br>
&gt;<br>
&gt; Note that I tried to do the same with python3-cryptography but fail<br=
>
&gt; to build the test suite and I don&#39;t know how to do it with the rus=
t<br>
&gt; extension module build by python setuptools. There must be some kind<b=
r>
&gt; of way for doing that so maybe someone will put some work in it (<br>
&gt; because python3-cryptography rust extension do have unit tests).<br>
&gt;<br>
&gt; Moreover, in the class, I didn&#39;t manage to share data between<br>
&gt; do_compile_ptest_base and do_install_ptest_base cleanly (I tried<br>
&gt; to d.setVar in compile and d.getVar in install but it seems that<br>
&gt; the data store doens&#39;t recognize my new variable) so I used a file=
<br>
&gt; for that. I&#39;m sure there is a clever way for doing that, so feel<b=
r>
&gt; free to tell me.<br>
&gt;<br>
&gt; The following changes since commit 45a8bb6e4676899d40525e7d5ad1c1ddefe=
e3185:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)<br=
>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmartinsons/openembedded-cor=
e" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/fmartinsons/open=
embedded-core</a> cargo-add-ptest<br>
&gt;<br>
&gt; Frederic Martinsons (3):<br>
&gt;=C2=A0 =C2=A0ptest-cargo.bbclass: create class<br>
&gt;=C2=A0 =C2=A0python3-bcrypt: enable build of unit tests<br>
&gt;=C2=A0 =C2=A0zvariant: add ptest feature for zvariant test suite<br>
&gt;<br>
&gt;=C2=A0 .../zvariant/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">zvariant_3.12.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 meta/classes-recipe/ptest-cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 108 ++++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-bcrypt_4.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-bcrypt_4.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 3 files changed, 121 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180319): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180319" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180319</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98436057=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98436057/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000ea129705fa10aefc--

