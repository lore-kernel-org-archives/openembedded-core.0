Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.13659.1586071312555986671
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 00:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id i20so11208161ljn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2WISygO7lyFNIta+KS9MR3+P6lGgK9KpQt71jZVNmc=;
        b=uUsZkUU9yezOKfXg0xYrjTz9F7Y6GOoBv9VADKTuXuWNY5cv2RUyGLQ5504kEUn+bB
         6qB5dWRet0cJ26hnNzOFrLFVuEfQblAnny5CxdpP96/i4ChkFNcGl5WZdEcPYVQom2T3
         sDRpa6vwrRL7k7Nm99DGN5rGbxMQZ9+owAZADYqzN/g+QLU8PDe/zfrbJ08e+1v4//zN
         hoqJq8OpWh9ByRlhPdCTDxFBQmBhde3ZqKgeIGHvBX0l4ctWZqomSQ5N3SEA2UMlVlao
         EX0RXdWcnWxIRQxZ8WMXfkh5uVse79Ytf6/4wgwQxgmspq1+gZJvgX+1chNY29Yeg3n+
         4e9A==
X-Gm-Message-State: AGi0PuZAJqnmcvkkMINSsudcJX2Y5+SKUvxE41LZWsvIRF5DQHgTmXN7
	hz83818HURfrIgEPGgPRWStQUrqEfe9GqkXNBng=
X-Google-Smtp-Source: APiQypJpChsMsDRyvgHaEYkxr2LatoxzAlmtvdC466qwI3cPsFAL+oP0N/Ba/7k5mzL7ai5JHXYeNJ+Gxbx7PIPjLkI=
X-Received: by 2002:a2e:9497:: with SMTP id c23mr8830065ljh.286.1586071310622;
 Sun, 05 Apr 2020 00:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
In-Reply-To: <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sun, 5 Apr 2020 09:21:34 +0200
Message-ID: <CAPybu_2joVKPtPhZpWDy_9ra-TN6=ZyMSES6vGNOBVdqQXBvNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000000ee45105a28601c4"

--0000000000000ee45105a28601c4
Content-Type: text/plain; charset="UTF-8"

Hi Richard

It looks pretty much related to my patch. Will try to replicate locally and
fix it.

Thanks!

On Sun, 5 Apr 2020, 09:01 Richard Purdie, <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-03-04 at 15:49 +0100, Ricardo Ribalda Delgado wrote:
> > When parameters include_path or exclude_path are passed to the rootfs
> > plugin, it will copy the partition content into a folder and make all
> > the modifications there.
> >
> > This is done using copyhardlinktree(), which does not take into
> > consideration the content of the pseudo folder, which contains the
> > information about the right permissions and ownership of the folders.
> >
> > This results in a rootfs owned by the user that is running the wic
> > command (usually UID 1000), which makes some rootfs unbootable.
> >
> > To fix this we copy the content of the pseudo folders to the new
> > folder
> > and modify the pseudo database using the "pseudo -B" command.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
>
> I added these two changes to -next but we're seeing a test failure on
> Fedora, twice now:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/834
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/831
>
> I suspect its related to these patches but haven't confirmed that as
> yet...
>
> Cheers,
>
> Richard
>
> 
>

--0000000000000ee45105a28601c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Richard</div><div dir=3D"auto"><br></=
div><div>It looks pretty much related to my patch. Will try to replicate lo=
cally and fix it.</div><div><br></div><div>Thanks!</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 5 Apr 2020,=
 09:01 Richard Purdie, &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-03-0=
4 at 15:49 +0100, Ricardo Ribalda Delgado wrote:<br>
&gt; When parameters include_path or exclude_path are passed to the rootfs=
<br>
&gt; plugin, it will copy the partition content into a folder and make all=
<br>
&gt; the modifications there.<br>
&gt; <br>
&gt; This is done using copyhardlinktree(), which does not take into<br>
&gt; consideration the content of the pseudo folder, which contains the<br=
>
&gt; information about the right permissions and ownership of the folders.=
<br>
&gt; <br>
&gt; This results in a rootfs owned by the user that is running the wic<br=
>
&gt; command (usually UID 1000), which makes some rootfs unbootable.<br>
&gt; <br>
&gt; To fix this we copy the content of the pseudo folders to the new<br>
&gt; folder<br>
&gt; and modify the pseudo database using the &quot;pseudo -B&quot; comman=
d.<br>
&gt; <br>
&gt; Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo@=
ribalda.com" rel=3D"noreferrer" target=3D"_blank">ricardo@ribalda.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++=
++---<br>
&gt;=C2=A0 1 file changed, 19 insertions(+), 3 deletions(-)<br>
<br>
I added these two changes to -next but we&#39;re seeing a test failure on<=
br>
Fedora, twice now:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/buil=
ds/834" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/86/builds/834</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/buil=
ds/831" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/86/builds/831</a><br>
<br>
I suspect its related to these patches but haven&#39;t confirmed that as<b=
r>
yet...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--0000000000000ee45105a28601c4--
