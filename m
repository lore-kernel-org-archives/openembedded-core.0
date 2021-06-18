Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.13685.1624049368491046173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 13:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y81Pe8A6;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id f1so3853840uaj.10
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLc6gepgvzR6dnV1rI7HdUh4Nvy/kdyT7kblPTMfcEI=;
        b=Y81Pe8A6klEa7HR6ZdxKZa1xcbRZ4HCd1ixb7oOmZ7a8vIjOrv8NDZayEvtiyn4jSC
         hdTLYVgNMEqAJFyVjRPZWESZ9up0An6HBS6wU8HA6PFbYt9a0homTN+rP+0u+ZiIxFe+
         soi/MUB6OxJrrUbPELhZYLxbNqipmpQCapPUnTKloz0d91Z94weQSGL4oVtsBhrDGr47
         kekxgQhz59RwIeKl6VuiMmIAmYc1Jx/a8gfcyAsaVn+yOm8ep138OLko2fG5QzYQlqgB
         NZvdc6lOISRcJP6wVUfF6JtYjBp1/WpT6tL11TMnCR6w0usZ7wp2GMqofDEzg8DRfXSi
         iHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLc6gepgvzR6dnV1rI7HdUh4Nvy/kdyT7kblPTMfcEI=;
        b=kXVecgvb9d+h0QPfHiK+jyYW7rNFT73MPFD7gn+sXYxOcWEkeceTJ0tl444Kbx05dL
         ZjaZxHQaw3Bj8tYclr5+LpyVUkZd56nZCFKbcTRy/mczoKLgoUQFkD9s34+OEVUqaZS/
         IkD5CfViRd5QWjX9Paioz/9sEFfVBiOxfFRqV5D34iRFmgot2TALizw6VSrTiEdT650G
         R3QLpF2OCt+r10ME62PnHQuCcRqSkNCvTbfNiDqhfL3XNOD0Ti9x4mv7ui1KGmhuA2Qp
         K+Sq6iYpm/59tx4pAp7z83yrwMi9ws+79NZgSWmDVAC84yuk+WgjE8aPR1cUJdtrSsz3
         182A==
X-Gm-Message-State: AOAM533FGOK1puEsujtjz0U/1j1+ZwY8kvjRVEdib4eSl4diCRk4CXzf
	I/ISXvhr9gc+DJhBbZPUzQYF0IyvNc6cQ1BV7ic=
X-Google-Smtp-Source: ABdhPJwaUrrlxurpd710tOeHrXYgtx0IiPk9+eVc2k+xcheu3O/27hhhlonTs1YM1zuUJ6jrjiO/l4Grqs8hBdZcOn8=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr14760710uad.100.1624049367623;
 Fri, 18 Jun 2021 13:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <1688B34361FD8BD3.6379@lists.openembedded.org> <16890800366CFBBE.20493@lists.openembedded.org>
 <1689153CED767CA8.15085@lists.openembedded.org>
In-Reply-To: <1689153CED767CA8.15085@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 18 Jun 2021 22:49:16 +0200
Message-ID: <CANNYZj-dOgJrNXNkTgT144RcdgGn4fDdoR47URAuSZzUTghefA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a7aa8605c51075b1"

--000000000000a7aa8605c51075b1
Content-Type: text/plain; charset="UTF-8"

Sadly, I can confirm: weston swelling to double size on qemuarm64 is caused
by this recent change in glibc:

+EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"

You can verify with this innocent looking program. Run 'free' while it is
running and compare with and without tagging:

main()
{
   for (int i=0; i<768; i++)
       calloc(1,262368);
   sleep(200);
}

I'll queue a revert.

Alex

On Wed, 16 Jun 2021 at 16:08, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> It seems that mesa, for some reason, allocates a lot more RAM in qemuarm64
> (150 Mb more or so), than it does in qemux86_64. I'll investigate.
>
> Alex
>
> On Wed, 16 Jun 2021 at 12:06, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
>> I'd like to take a deeper look at this, please hold.
>>
>> Alex
>>
>> On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
>> wrote:
>>
>>> weston tests start additional compositors, other tests are also
>>> heavy on RAM, weston itself takes 256M with opengl enabled,
>>> so 512M causes OOM errors on arm64.
>>>
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>  meta/recipes-graphics/images/core-image-weston.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-graphics/images/core-image-weston.bb
>>> b/meta/recipes-graphics/images/core-image-weston.bb
>>> index 62305cc1ce..e332e19368 100644
>>> --- a/meta/recipes-graphics/images/core-image-weston.bb
>>> +++ b/meta/recipes-graphics/images/core-image-weston.bb
>>> @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
>>>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES',
>>> 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
>>>
>>>  QB_MEM = "-m 512"
>>> +QB_MEM_qemuarm64 = "-m 1024"
>>> --
>>> 2.31.1
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
> 
>
>

--000000000000a7aa8605c51075b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sadly, I can confirm: weston swelling to double size =
on qemuarm64 is caused by this recent change in glibc:</div><div><br></div>=
<div>+EXTRA_OECONF_append_aarch64 =3D &quot; --enable-memory-tagging&quot;<=
/div><div><br></div><div>You can verify with this innocent looking program.=
 Run &#39;free&#39; while it is running and compare with and without taggin=
g:</div><div><br></div><div>main()<br>{<br>=C2=A0 =C2=A0for (int i=3D0; i&l=
t;768; i++)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0calloc(1,262368);<br>=C2=A0 =C2=
=A0sleep(200);<br>}</div><div><br></div><div>I&#39;ll queue a revert.<br><=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Jun 2021 at 16:08, Alexan=
der Kanavin via <a href=3D"http://lists.openembedded.org" target=3D"_blank"=
>lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>It seems that mesa, for some reason, allocates a lot m=
ore RAM in qemuarm64 (150 Mb more or so), than it does in qemux86_64. I&#39=
;ll investigate.</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Jun 2021=
 at 12:06, Alexander Kanavin via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>I&#39;d like to take a deeper look at=
 this, please hold.</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Jun 2=
021 at 10:12, Alexander Kanavin via <a href=3D"http://lists.openembedded.or=
g" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">weston tests start additional compositors, other tests=
 are also<br>
heavy on RAM, weston itself takes 256M with opengl enabled,<br>
so 512M causes OOM errors on arm64.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/images/<a href=3D"http://core-image-wes=
ton.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> b/met=
a/recipes-graphics/images/<a href=3D"http://core-image-weston.bb" rel=3D"no=
referrer" target=3D"_blank">core-image-weston.bb</a><br>
index 62305cc1ce..e332e19368 100644<br>
--- a/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
+++ b/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
@@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL +=3D &quot;gtk+3-demo&quot;<br>
=C2=A0CORE_IMAGE_BASE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;x11&#39;, &#39;weston-xwayland matchbox-terminal&#39;, =
&#39;&#39;, d)}&quot;<br>
<br>
=C2=A0QB_MEM =3D &quot;-m 512&quot;<br>
+QB_MEM_qemuarm64 =3D &quot;-m 1024&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000a7aa8605c51075b1--
