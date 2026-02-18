Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4B0E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:30:21 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10925.1771417811747118998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BmRrb7p+;
 spf=pass (domain: mvista.com, ip: 209.85.218.53, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f92f3db6fso828668266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771417810; cv=none;
        d=google.com; s=arc-20240605;
        b=CkT+SjovumY48JdtKKAhJrm7V07uXgoQSwEU7UcD+U7zFv8R4+HRLNsXVxPAYUENoA
         gjVNWjR6r1eursNunX38/Ele5EMwiXm5nm8qSxWB1WuEr6G9wuHThoLtxXyJNPq+DgTE
         UH9pBTfY8xW04mLJeQvlnytIfP7VZsShonNhyzvA+Q4AqDecp6TJ1qpLRS8xFWtg9F6F
         ZsKvT9j/w9HtIYzvI+FkxuvKpev8MW75MHaj1zNK5IHLdR4OWRef9tTzR+8omK4klDHj
         mKEVw0sgAt0E5qZ3r2xoFyFQGhQ6o+o8HnYj0OyQC/tlf6xTclCqsZDQunsFnPlyZqtc
         mbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m0OfpfOBHbSctZ2U7R6q7CORIfCAdN+BcS2rxcV9TEY=;
        fh=sfn9C3XkKzFhYerOf6EM09Tm6AX/+/LJdPEmdV3q+cM=;
        b=FkaHJ9/yc0iYGtX0Ot71Jcf4sUI3R0eSnjQR8fXN18/jYGepTqqXLbajXJ0Z4afmQJ
         Agf8okD/kLymIAwRRx4pcXMzLOcp69k0sGMky9uMCSljvHGwkyh3yOJCXTyjp5vtUp/6
         40BUqti7592U4W/TIy9Hm8z6+kvhkgAoefOJN77wscXHfl+3CW70XQp4a3cwLqzQ4KEw
         HIxH1U885B6sIhEKBYhBEFqC5/xvlX0pY7OSEKI30ZxJmd/U0rDKRTjKpumIXo7AFEE9
         9eVsVrQ/eoqKqspLAfXzxeO79x1lfn00coE8TVoxo9vqIhmRdeDrKQN4J+A0saX5qqR/
         9+qw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771417810; x=1772022610; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m0OfpfOBHbSctZ2U7R6q7CORIfCAdN+BcS2rxcV9TEY=;
        b=BmRrb7p+rWSn4P22FDLUMe/J6fPN2eEhZmE5QacCw4KtcwqddnwaaA8psVfXksrIHN
         y5PW4kOs4ztjX1vZRlSDlFHNQTVg1TDObDOkx0fEM6HnkhP9qwbCrMyukM4tqlRY2bGh
         Q5BaNaeRF+ZYlEwsuObX8+dWb5+SEQPQwrglE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417810; x=1772022610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0OfpfOBHbSctZ2U7R6q7CORIfCAdN+BcS2rxcV9TEY=;
        b=Yjj5ozXzIYD85jmAa5Il4OmPyVa82vmtHYgBWzy1uRk9jx2bJWMVYnDqV+9vGGaN49
         pqxRxq2GWGqq9BtoQfUpTXryZfDqEQH0lf+xHh0aYujljKgGdT5P2X3isEAbErBk3cdb
         ff5n6K9UTogfxoj0/MedTpKdseJIWlWJr10f8906H90wAoDWVC7w8QXUq/fiu+8jRxJs
         okFp2SsVBDTCmDx/Yl/E9wrPPqyljxCE4afIdhgoevhxGuN3umqT7G+qAYj2hwU4PtJA
         ZqdyxCVV8yEXrSCmgidMwYWY5B2g9yNQwPKceNt0DJjHR5vgfbC5jPgHYkBBQcLehYED
         qNNg==
X-Gm-Message-State: AOJu0YyJDvFtCVS0xuwGNdB8QKv3jxf4fFPFzx8yGjvRsv/lt/Np8DIJ
	2D6q+ehqqaPYuYxU4otLmWVj7Zt0JJC42mdzX6NwMqtG+qD+gPzLxRVdwGA/UI4VyDcAsm2FRl3
	scOaNeoZ6GmfCuOs0FMPLoeihzG5bADRui8UFB+L8vQ==
X-Gm-Gg: AZuq6aK5HJgFOwOm+KU3EeMLQJd4ebHPc8EMW6aGo3pdMf7g/5PxtwrtgDlKSDaHU1S
	0jvVjZ8QdqPiJu35zydemnx/ADTJqCdADTvMKeaxiM+oWzoPT6ufY37WdDNrrgJdCcJs1TCKCxw
	pxh/TgaPogkft5MXssbpqHP7oshWthzDXlJgpz0a53fPMMEpKJyNF4wIGkOqoSHFu4SdgM9ywtk
	KPuGQ9AOE0BhK5XLAZwcO0i9YLc0XWU5zYRAMCdqaGt8sToF+JExb3zJtXjcj2mOaN6NTpHEfVt
	fXOJQJZtVISlRTI1OOKrDk95TL2KtFrAsOkpxWmvWV042NM=
X-Received: by 2002:a17:906:4fcd:b0:b8f:abff:9cf2 with SMTP id
 a640c23a62f3a-b903da4dc4emr97690266b.4.1771417809752; Wed, 18 Feb 2026
 04:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20260218121438.514114-1-vanusuri@mvista.com> <AS1PR10MB56972066B8E4255BC4EC3B67FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56972066B8E4255BC4EC3B67FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 18 Feb 2026 17:59:58 +0530
X-Gm-Features: AaiRm53J9sA45G7xV_TaGkW6YUmNXPgFAGi2gACM9N_CVg33xrS9zlGqlLaShio
Message-ID: <CANQUz1-R+SBC_qcpbRVr5gUTgttatD07S7jJHgPt3dBMb50WnQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
To: peter.marko@siemens.com, Yoann Congal <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ca4a2064b18599d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231306

--0000000000004ca4a2064b18599d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for pointing that out.

I missed the earlier submission on the OpenEmbedded Core =E2=80=94 sorry ab=
out
that. I=E2=80=99ll follow-up the thread there.

Thanks for the clarification.


Yoann,

Please ignore this patch.

Thanks & Regards,

Vijay


On Wed, Feb 18, 2026 at 5:48=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> This is already submitted almost 4 weeks ago.
> https://lists.openembedded.org/g/openembedded-core/message/229927
> Since the nut branches are not updated that often nowadays, it's worth
> looking at the mailing list...
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> > lists.openembedded.org
> > Sent: Wednesday, February 18, 2026 13:15
> > To: openembedded-core@lists.openembedded.org
> > Cc: Vijay Anusuri <vanusuri@mvista.com>
> > Subject: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-
> > /commit/c5766cff61ffce0b8e787eae09908ac348338e5f
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 61 +++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
> >  2 files changed, 62 insertions(+)
> >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> > b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> > new file mode 100644
> > index 0000000000..1b67b162af
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> > @@ -0,0 +1,61 @@
> > +From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 2001
> > +From: Philip Withnall <pwithnall@gnome.org>
> > +Date: Thu, 18 Dec 2025 23:12:18 +0000
> > +Subject: [PATCH] gbufferedinputstream: Fix a potential integer overflo=
w
> in
> > + peek()
> > +
> > +If the caller provides `offset` and `count` arguments which overflow,
> > +their sum will overflow and could lead to `memcpy()` reading out more
> > +memory than expected.
> > +
> > +Spotted by Codean Labs.
> > +
> > +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> > +
> > +Fixes: #3851
> > +
> > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-
> > /commit/c5766cff61ffce0b8e787eae09908ac348338e5f]
> > +CVE: CVE-2026-0988
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + gio/gbufferedinputstream.c        |  2 +-
> > + gio/tests/buffered-input-stream.c | 10 ++++++++++
> > + 2 files changed, 11 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
> > +index 9e6bacc62d..56d656be04 100644
> > +--- a/gio/gbufferedinputstream.c
> > ++++ b/gio/gbufferedinputstream.c
> > +@@ -591,7 +591,7 @@ g_buffered_input_stream_peek (GBufferedInputStream
> > *stream,
> > +
> > +   available =3D g_buffered_input_stream_get_available (stream);
> > +
> > +-  if (offset > available)
> > ++  if (offset > available || offset > G_MAXSIZE - count)
> > +     return 0;
> > +
> > +   end =3D MIN (offset + count, available);
> > +diff --git a/gio/tests/buffered-input-stream.c
> b/gio/tests/buffered-input-stream.c
> > +index a1af4eefff..2b2a0d9aa9 100644
> > +--- a/gio/tests/buffered-input-stream.c
> > ++++ b/gio/tests/buffered-input-stream.c
> > +@@ -60,6 +60,16 @@ test_peek (void)
> > +   g_assert_cmpint (npeek, =3D=3D, 0);
> > +   g_free (buffer);
> > +
> > ++  buffer =3D g_new0 (char, 64);
> > ++  npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM
> > (in), buffer, 8, 0);
> > ++  g_assert_cmpint (npeek, =3D=3D, 0);
> > ++  g_free (buffer);
> > ++
> > ++  buffer =3D g_new0 (char, 64);
> > ++  npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM
> > (in), buffer, 5, G_MAXSIZE);
> > ++  g_assert_cmpint (npeek, =3D=3D, 0);
> > ++  g_free (buffer);
> > ++
> > +   g_object_unref (in);
> > +   g_object_unref (base);
> > + }
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> b/meta/recipes-core/glib-
> > 2.0/glib-2.0_2.72.3.bb
> > index 50701be3d0..7c0ed01f55 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> > @@ -70,6 +70,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-
> > ${PV}.tar.xz \
> >             file://CVE-2025-14087-02.patch \
> >             file://CVE-2025-14087-03.patch \
> >             file://CVE-2025-14512.patch \
> > +           file://CVE-2026-0988.patch \
> >             "
> >  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
> >
> > --
> > 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231297):
> https://lists.openembedded.org/g/openembedded-core/message/231297
> Mute This Topic: https://lists.openembedded.org/mt/117873357/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004ca4a2064b18599d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Peter,</p>
<p>Thanks for pointing that out.</p>
<p>I missed the earlier submission on the <span class=3D"gmail-hover:entity=
-accent entity-underline gmail-inline gmail-cursor-pointer gmail-align-base=
line"><span class=3D"gmail-whitespace-normal">OpenEmbedded Core</span></spa=
n> =E2=80=94 sorry about that. I=E2=80=99ll follow-up the thread there.<br>=
</p><p>Thanks for the clarification.</p>
<p><br></p><p>Yoann,</p><p>Please ignore this patch.<br></p><p>Thanks &amp;=
 Regards,<br></p><p>Vijay</p><br></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 18, 2026=
 at 5:48=E2=80=AFPM Peter Marko via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.c=
om@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is alread=
y submitted almost 4 weeks ago.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22992=
7" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/229927</a><br>
Since the nut branches are not updated that often nowadays, it&#39;s worth =
looking at the mailing list...<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Wednesday, February 18, 2026 13:15<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D=
"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; Subject: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988<br>
&gt; <br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Upstream-Status: Backport from <a href=3D"https://gitlab.gnome.org/GNO=
ME/glib/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GN=
OME/glib/-</a><br>
&gt; /commit/c5766cff61ffce0b8e787eae09908ac348338e5f<br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-0988.patch=C2=A0 =C2=A0 =C2=A0| 6=
1 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a> |=C2=A0 1 +<br=
>
&gt;=C2=A0 2 files changed, 62 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-=
0988.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch<b=
r>
&gt; b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1b67b162af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Philip Withnall &lt;<a href=3D"mailto:pwithnall@gnome.org" targ=
et=3D"_blank">pwithnall@gnome.org</a>&gt;<br>
&gt; +Date: Thu, 18 Dec 2025 23:12:18 +0000<br>
&gt; +Subject: [PATCH] gbufferedinputstream: Fix a potential integer overfl=
ow in<br>
&gt; + peek()<br>
&gt; +<br>
&gt; +If the caller provides `offset` and `count` arguments which overflow,=
<br>
&gt; +their sum will overflow and could lead to `memcpy()` reading out more=
<br>
&gt; +memory than expected.<br>
&gt; +<br>
&gt; +Spotted by Codean Labs.<br>
&gt; +<br>
&gt; +Signed-off-by: Philip Withnall &lt;<a href=3D"mailto:pwithnall@gnome.=
org" target=3D"_blank">pwithnall@gnome.org</a>&gt;<br>
&gt; +<br>
&gt; +Fixes: #3851<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
glib/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME=
/glib/-</a><br>
&gt; /commit/c5766cff61ffce0b8e787eae09908ac348338e5f]<br>
&gt; +CVE: CVE-2026-0988<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + gio/gbufferedinputstream.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
&gt; + gio/tests/buffered-input-stream.c | 10 ++++++++++<br>
&gt; + 2 files changed, 11 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c<=
br>
&gt; +index 9e6bacc62d..56d656be04 100644<br>
&gt; +--- a/gio/gbufferedinputstream.c<br>
&gt; ++++ b/gio/gbufferedinputstream.c<br>
&gt; +@@ -591,7 +591,7 @@ g_buffered_input_stream_peek (GBufferedInputStrea=
m<br>
&gt; *stream,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0available =3D g_buffered_input_stream_get_available (str=
eam);<br>
&gt; +<br>
&gt; +-=C2=A0 if (offset &gt; available)<br>
&gt; ++=C2=A0 if (offset &gt; available || offset &gt; G_MAXSIZE - count)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0end =3D MIN (offset + count, available);<br>
&gt; +diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-i=
nput-stream.c<br>
&gt; +index a1af4eefff..2b2a0d9aa9 100644<br>
&gt; +--- a/gio/tests/buffered-input-stream.c<br>
&gt; ++++ b/gio/tests/buffered-input-stream.c<br>
&gt; +@@ -60,6 +60,16 @@ test_peek (void)<br>
&gt; +=C2=A0 =C2=A0g_assert_cmpint (npeek, =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0g_free (buffer);<br>
&gt; +<br>
&gt; ++=C2=A0 buffer =3D g_new0 (char, 64);<br>
&gt; ++=C2=A0 npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STRE=
AM<br>
&gt; (in), buffer, 8, 0);<br>
&gt; ++=C2=A0 g_assert_cmpint (npeek, =3D=3D, 0);<br>
&gt; ++=C2=A0 g_free (buffer);<br>
&gt; ++<br>
&gt; ++=C2=A0 buffer =3D g_new0 (char, 64);<br>
&gt; ++=C2=A0 npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STRE=
AM<br>
&gt; (in), buffer, 5, G_MAXSIZE);<br>
&gt; ++=C2=A0 g_assert_cmpint (npeek, =3D=3D, 0);<br>
&gt; ++=C2=A0 g_free (buffer);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0g_object_unref (in);<br>
&gt; +=C2=A0 =C2=A0g_object_unref (base);<br>
&gt; + }<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.7=
2.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a> b/meta/=
recipes-core/glib-<br>
&gt; 2.0/<a href=3D"http://glib-2.0_2.72.3.bb" rel=3D"noreferrer" target=3D=
"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; index 50701be3d0..7c0ed01f55 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; +++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; @@ -70,6 +70,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/g=
lib-<br>
&gt; ${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14087-0=
2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14087-0=
3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14512.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-0988.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; file://relocate-modules.p=
atch&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#231297): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/231297" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/231297</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117873357/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117873357/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004ca4a2064b18599d--

