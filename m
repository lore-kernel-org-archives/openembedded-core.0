Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78656CA101C
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:53:50 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.12449.1756906185882218747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 06:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZzWlb4yo;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: rmmuniz@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4154040137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906185; x=1757510985; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMfqFYJMwtSIgl5ZGf3emtWgKxVsDeEq8UcysYIDio0=;
        b=ZzWlb4youyDU4ZgFwep9ExPt7zXGIB8q8Ck4NWL8xSZfNp1+1LCGqmkGLGnubXQL8X
         QMmBRL7S+Sl3F0IzpFkkDOcWRt2GimOMtQbaD5MEVD1OFPt5rB9PaIldQ9WcbWl5SLCj
         r2k9IxIRgS2CrnpFBJkrOCbbovyF+Zgp5P8ObsUdfwcQ6LJHO3l4uOs0OH++XtlT1W1S
         Lf1Gzjhut8U1FaorbKHCyUbTqIZBgj5RcDUXHdNFsdidcjaB6CrMY7ADY6zImvbwpHj+
         oLJiBEzMslG0blaLVGRdlSS4SR4qoQHQ8xyXLnBTz0seEeJoQ0iAldrQDE2ziyQE+tq4
         m05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906185; x=1757510985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMfqFYJMwtSIgl5ZGf3emtWgKxVsDeEq8UcysYIDio0=;
        b=ORidPvPbpvxx0X8dZfDk/rjy7ZJGGZRa1hUdBN7JpglIK6L/FEfnwUqwup4ucydzjG
         cCG0PpuCelUnh+Xviag0GMRpgzNe8b7AXp+uHWhV+AdBgD6G4+Yue8vP2hme/JE1nYFa
         hfQN/h1d6297N+9QYA/jjbrAjxIIy7C2jdA2rRv8taVncg4Mrg+Vj20NF6aRWZUFiMME
         dWzshC69AoyYr7N+8qSVMfugK/qXs8usSUEsVOc/JfmS/55IrVhbZHL7kN5w8mgCmRkj
         Y7nw56o2jOdep7Ca0A9IbRtp7JNbKsmmCLdt0BElOdfSJumEyuwbP6lQEWCoO6bIbdf/
         UAqQ==
X-Gm-Message-State: AOJu0Yy9CZyAum6766DtDWWUG0kfjtTDdgImIC2aLj/MTDjSxBL499v5
	bkK4DrN5XZuhExuPJgVviBdCc+/gWFfeVhqEXZiQlW+lk8vl0PLBruCsInK8NNA1QhTp06bbJuV
	nlq7Ha2f2nVj9ZJ6kpayOmvjrUIwr03TJjUUn
X-Gm-Gg: ASbGncscjYVZPGp8vkeCW+MuXgfqu+Sd2fU0tyliK7qpgXh61vD/FyUut1stkgolfm6
	t2yWtWarRzXuE9+x3gScbeKPFwtREppWMaKUiS2SbB5oreJfSaxdjntwXH0MZcu8EdsHFpVBKOr
	ID3FHtOInRZXoy/KdLCXw3pDNXQYwUzrA1RSPSSU2c5sZxS8F0/P9U5IBIppIYenC5yOXCWL1Ee
	cRwQr88R6H5Aw/nbYg=
X-Google-Smtp-Source: AGHT+IHiShv7kaRqTdQs2Ib+bMQNUP2iDfMfXUIC+N/dmTOTcpPMsuPcgYPXuKvfvYe17j38qXmOUBl7VZzDtkXNauE=
X-Received: by 2002:a05:6902:1147:b0:e94:feac:9dc4 with SMTP id
 3f1490d57ef6-e98a57865d9mr19854657276.13.1756905705135; Wed, 03 Sep 2025
 06:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyN=MLstOTnbM0OMYaw12uHbes0NUz5Z9uRM4KOQQndg2_W3A@mail.gmail.com>
 <CANNYZj8U_YcP+O1WuCYb=MNzxPbJZ3NAGky+yH8T0Lu-vQqxcg@mail.gmail.com>
In-Reply-To: <CANNYZj8U_YcP+O1WuCYb=MNzxPbJZ3NAGky+yH8T0Lu-vQqxcg@mail.gmail.com>
From: Rene Muniz <rmmuniz@gmail.com>
Date: Wed, 3 Sep 2025 09:21:33 -0400
X-Gm-Features: Ac12FXy8a8VhNUxl6kGopES9rgT-Lo_JjEhv71gg4iJWnR9JMOkLoIZyowcqr5U
Message-ID: <CAPyN=MJw+NuuROpO-GUO80MY7xzfR9qjgYcrdLZ8XJ3Vgj84Og@mail.gmail.com>
Subject: Re: [OE-core] Walnascar backport: python3-evdev_1.9.2.bb
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000756390063de57ceb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222924

--000000000000756390063de57ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alexander, here is the detailed information regarding this issue:

- Built walnascar, commit 343adc0de05d4d1ef84bee6b76b5dedbcb587fb1
- Add meta-openembedded for python support, branch walnascar, commit
dca497d728792e3cb655c78455c2d649af312ce8
- In local.conf included in image: python3 python3-pip python3-evdev

Boot image in qemu and import evdev in python:

root@qemux86-64:~# pip3 show evdev

Name: evdev
*Version: 1.9.1*
Summary: Bindings to the Linux input handling subsystem
Home-page: https://github.com/gvalkov/python-evdev
Author:

Author-email: Georgi Valkov <georgi.t.valkov@gmail.com>
License: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.

root@qemux86-64:~# python3
Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import evdev
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    import evdev
  File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, in
<module>
    from . import (
    ...<2 lines>...
    )
  File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, in
<module>
    for k, v in g[prefix].items():
                ~^^^^^^^^
KeyError: 'UI_FF'

- Now use recipe python3-evdev_1.9.2.bb (commit
46866b0022690f7408d0c5d7d3a22ba03e3af1a7)

root@qemux86-64:~# pip3 show evdev

Name: evdev
*Version: 1.9.2*
Summary: Bindings to the Linux input handling subsystem
Home-page: https://github.com/gvalkov/python-evdev
Author:
Author-email: Georgi Valkov <georgi.t.valkov@gmail.com>
License: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.

root@qemux86-64:~# python3
Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import evdev
>>>

And this works as expected.

Additional data: this commit seems to be the fix for the problem in version
1.9.2:

commit 0d5ffeeb70639920ab20de1e6ef4c5ece72b97bd
Author: Yoann Congal <yoann.congal@smile.fr>
Date:   Sat May 3 00:49:44 2025 +0200

    python3-evdev: add missing uinput header

    Without uinput.h header, the evdev module can't be imported because it
    lacks the UI_FF* constants.

    Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thank you,
Rene



On Mon, Sep 1, 2025 at 5:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> Only if 1.9.3 only contains bugfixes compared to 1.9.2 (which you need
> to demonstrate). Otherwise you need to cherry-pick the needed fix and
> add it to 1.9.2 recipe.
>
> Alex
>
> On Fri, 29 Aug 2025 at 20:49, Rene Muniz via lists.openembedded.org
> <rmmuniz=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Dear, is it possible to backport the recipe python3-evdev_1.9.2.bb to
> Walnascar? The reason is that python3-evdev_1.9.1.bb seems broken, by
> just importing the lib we got an error:
> >
> > Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
> > Type "help", "copyright", "credits" or "license" for more information.
> > >>> import evdev
> > Traceback (most recent call last):
> >   File "<python-input-0>", line 1, in <module>
> >     import evdev
> >   File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, i=
n
> <module>
> >     from . import (
> >     ...<2 lines>...
> >     )
> >   File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, in
> <module>
> >     for k, v in g[prefix].items():
> >                 ~^^^^^^^^
> > KeyError: 'UI_FF'
> >
> > Tested python3-evdev_1.9.2.bb present in master
> 46866b0022690f7408d0c5d7d3a22ba03e3af1a7 and it works great.
> >
> > Thanks in advance, best regards,
> > Rene
> >
> >=20
> >
>

--000000000000756390063de57ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear Alexander, here is the detailed info=
rmation regarding this issue:<div><br></div><div>- Built walnascar, commit =
343adc0de05d4d1ef84bee6b76b5dedbcb587fb1<br>- Add meta-openembedded for pyt=
hon support, branch walnascar, commit dca497d728792e3cb655c78455c2d649af312=
ce8<br>- In local.conf included in image: <font face=3D"monospace">python3 =
python3-pip python3-evdev</font><br><br>Boot image in qemu and import evdev=
 in python:<br><br><font face=3D"monospace">root@qemux86-64:~# pip3 show ev=
dev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>Name: evdev<br><b>Version: 1.9.1</b><br>Summary=
: Bindings to the Linux input handling subsystem<br>Home-page: <a href=3D"h=
ttps://github.com/gvalkov/python-evdev">https://github.com/gvalkov/python-e=
vdev</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Author: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Author-email: Georgi Valkov &lt;<a h=
ref=3D"mailto:georgi.t.valkov@gmail.com">georgi.t.valkov@gmail.com</a>&gt;<=
br>License: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.<br>=
<br>root@qemux86-64:~# python3<br>Python 3.13.4 (main, Jun =C2=A03 2025, 15=
:34:24) [GCC 14.3.0] on linux<br>Type &quot;help&quot;, &quot;copyright&quo=
t;, &quot;credits&quot; or &quot;license&quot; for more information.<br>&gt=
;&gt;&gt; import evdev<br>Traceback (most recent call last):<br>=C2=A0 File=
 &quot;&lt;python-input-0&gt;&quot;, line 1, in &lt;module&gt;<br>=C2=A0 =
=C2=A0 import evdev<br>=C2=A0 File &quot;/usr/lib/python3.13/site-packages/=
evdev/__init__.py&quot;, line 8, in &lt;module&gt;<br>=C2=A0 =C2=A0 from . =
import (<br>=C2=A0 =C2=A0 ...&lt;2 lines&gt;...<br>=C2=A0 =C2=A0 )<br>=C2=
=A0 File &quot;/usr/lib/python3.13/site-packages/evdev/ecodes.py&quot;, lin=
e 78, in &lt;module&gt;<br>=C2=A0 =C2=A0 for k, v in g[prefix].items():<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~^^^^^^^^<br>KeyErr=
or: &#39;UI_FF&#39;</font><br><br>- Now use recipe <a href=3D"http://python=
3-evdev_1.9.2.bb">python3-evdev_1.9.2.bb</a> (commit 46866b0022690f7408d0c5=
d7d3a22ba03e3af1a7)<br><br><font face=3D"monospace">root@qemux86-64:~# pip3=
 show evdev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Name: evdev<br><b>Version: 1.9.2</b><br>=
Summary: Bindings to the Linux input handling subsystem<br>Home-page: <a hr=
ef=3D"https://github.com/gvalkov/python-evdev">https://github.com/gvalkov/p=
ython-evdev</a><br>Author: <br>Author-email: Georgi Valkov &lt;<a href=3D"m=
ailto:georgi.t.valkov@gmail.com">georgi.t.valkov@gmail.com</a>&gt;<br>Licen=
se: Copyright (c) 2012-2025 Georgi Valkov. All rights reserved.<br><br>root=
@qemux86-64:~# python3<br>Python 3.13.4 (main, Jun =C2=A03 2025, 15:34:24) =
[GCC 14.3.0] on linux<br>Type &quot;help&quot;, &quot;copyright&quot;, &quo=
t;credits&quot; or &quot;license&quot; for more information.<br>&gt;&gt;&gt=
; import evdev<br>&gt;&gt;&gt;</font><br><br>And this works as expected.<br=
><br>Additional data: this commit seems to be the fix for the problem in ve=
rsion 1.9.2:<br><br><font face=3D"monospace">commit 0d5ffeeb70639920ab20de1=
e6ef4c5ece72b97bd<br>Author: Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt;<br>Date: =C2=A0 Sat May 3 00:49:4=
4 2025 +0200<br><br>=C2=A0 =C2=A0 python3-evdev: add missing uinput header<=
br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Without uinput.h header, the evdev modul=
e can&#39;t be imported because it<br>=C2=A0 =C2=A0 lacks the UI_FF* consta=
nts.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Signed-off-by: Yoann Congal &lt;<a =
href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;<br>=C2=
=A0 =C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt;</font></div><div><br></div><div>Thank you,</di=
v><div>Rene</div></div><div><br></div><div><br></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Sep 1, 2025 at 5:56=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Only if 1.9.3 only contains bug=
fixes compared to 1.9.2 (which you need<br>
to demonstrate). Otherwise you need to cherry-pick the needed fix and<br>
add it to 1.9.2 recipe.<br>
<br>
Alex<br>
<br>
On Fri, 29 Aug 2025 at 20:49, Rene Muniz via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
<br>
&lt;rmmuniz=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D=
"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Dear, is it possible to backport the recipe <a href=3D"http://python3-=
evdev_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.2.bb=
</a> to Walnascar? The reason is that <a href=3D"http://python3-evdev_1.9.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.1.bb</a> seems =
broken, by just importing the lib we got an error:<br>
&gt;<br>
&gt; Python 3.13.4 (main, Jun=C2=A0 3 2025, 15:34:24) [GCC 14.3.0] on linux=
<br>
&gt; Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &=
quot;license&quot; for more information.<br>
&gt; &gt;&gt;&gt; import evdev<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;python-input-0&gt;&quot;, line 1, in &lt;mo=
dule&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0import evdev<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.13/site-packages/evdev/__init_=
_.py&quot;, line 8, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0from . import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0...&lt;2 lines&gt;...<br>
&gt;=C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.13/site-packages/evdev/ecodes.=
py&quot;, line 78, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0for k, v in g[prefix].items():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~^^^^^^^^=
<br>
&gt; KeyError: &#39;UI_FF&#39;<br>
&gt;<br>
&gt; Tested <a href=3D"http://python3-evdev_1.9.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-evdev_1.9.2.bb</a> present in master 46866b0022690f=
7408d0c5d7d3a22ba03e3af1a7 and it works great.<br>
&gt;<br>
&gt; Thanks in advance, best regards,<br>
&gt; Rene<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000756390063de57ceb--

