Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F55DC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:56:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.42413.1702900566367883728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=eWB48REt;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1915034144so347712566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702900564; x=1703505364; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+DnMKGMz5qvCivNpOAVtokDH/QmrJpKNI4kGEOfNw4=;
        b=eWB48REtXIQpFwI67RcHxTTT4qdU2YPlcVBvLMTh8w3kitjn/TmSCOXynfuf05rw+B
         j8w8xjC2M2XrcIAnZY72424SU+YLwJOg6CgviUo4MqDhopOJ4/JmLdlEHGVLs+NvApBU
         q3HJkMQ46hnpq54dyBrHU3pwBUeMWdrfUCP2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702900564; x=1703505364;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+DnMKGMz5qvCivNpOAVtokDH/QmrJpKNI4kGEOfNw4=;
        b=WEPbucVyLZtp8yVelL49n7GvCwzZL/voc5FD2P4MPQKoHVy4d8QU2P5cKEaPLVB3QC
         Lp+A25MK7bQEmSRpV1TP+xVed1/O6mcY7Z19NDo/sZvAZuaAqe7/97McgS8YodzoeLPe
         pP4vNL94XhTfEh3o/mBvdm/Wzywa9qSXGN5mIUQv27gHUhAFFaszJ79TSKaecvETBJMD
         eYIDth+g7/AavuIbPtJSbGZSr177FCTFSSUMPdYPebCAGuBHSFLjzkGcMVK48QLlA1DY
         u0Fzk3i3xENoaRFCV+CUbqj0Xp4V0/OyQ2dLnGLrRTFiJcdvW9vBxQAGSMEmnmBwRzle
         KTLw==
X-Gm-Message-State: AOJu0Yx+2c/dWIGUyWwIRGd8690EbqO4bzpSA89n4II4WjlRkDhbDXhJ
	VfiJiZr0h5kLDL2AHjGVzWM1lAHNjKW/HHSwEdnQouMqBJrkLwB8398=
X-Google-Smtp-Source: AGHT+IFnksIRSZrgzy10a0CscjZPgHkea3k8cqqc6YJuh1cUgKOyexNM2RiOyJZMNIf/JXyT3yKtnmKd7KLdDV0Y4AE=
X-Received: by 2002:a17:906:108f:b0:a23:59e4:bf16 with SMTP id
 u15-20020a170906108f00b00a2359e4bf16mr552750eju.83.1702900564349; Mon, 18 Dec
 2023 03:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20231218115310.438367-1-ecordonnier@snap.com>
In-Reply-To: <20231218115310.438367-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 18 Dec 2023 12:55:53 +0100
Message-ID: <CAHUKmYZhAJcSP=CO4QeN1Rk5Vv6TfgCiGqivX=gOQWWi7FTiUg@mail.gmail.com>
Subject: Re: [PATCH v3] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003a943f060cc76f41"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192637

--0000000000003a943f060cc76f41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

patch v3: changed bb.warn to bb.info, improved comment, moved code to the
correct if block to avoid removal of kernsrc

On Mon, Dec 18, 2023 at 12:53=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
>
> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 9ff37f5c38..cdd5f8e9a1 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -183,6 +183,11 @@ python do_symlink_kernsrc () {
>      s =3D d.getVar("S")
>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
>      if s !=3D kernsrc:
> +        if os.path.islink(s):
> +            # this happens for instance when a poky update modifies this
> class,
> +            # forcing symlink_kernsrc to run again after s was already
> moved to kernsrc
> +            bb.info("%s is already a symlink! Not symlinking kernel
> sources" % s)
> +            return 0
>          bb.utils.mkdirhier(kernsrc)
>          bb.utils.remove(kernsrc, recurse=3DTrue)
>          if s[-1] =3D=3D '/':
> --
> 2.36.1.vfs.0.0
>
>

--0000000000003a943f060cc76f41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">patch v3: changed bb.warn to <a href=3D"http://bb.info">bb=
.info</a>, improved comment, moved code to the correct if block to avoid re=
moval of kernsrc</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 18, 2023 at 12:53=E2=80=AFPM &lt;<a href=3D"mai=
lto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;=
<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.=
com</a>&gt;<br>
<br>
The function do_symlink_kernsrc is not reentrant in the case where S is def=
ined<br>
to a non-default value. This causes build-failures e.g. when building linux=
-yocto, then updating<br>
poky to a commit which modifies kernel.bbclass, and then building linux-yoc=
to again.<br>
<br>
Bugzilla: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15=
325" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D15325</a><br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 9ff37f5c38..cdd5f8e9a1 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -183,6 +183,11 @@ python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0kernsrc =3D d.getVar(&quot;STAGING_KERNEL_DIR&quot;)<br=
>
=C2=A0 =C2=A0 =C2=A0if s !=3D kernsrc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(s):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this happens for instance when=
 a poky update modifies this class,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # forcing symlink_kernsrc to run=
 again after s was already moved to kernsrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://bb.info" rel=
=3D"noreferrer" target=3D"_blank">bb.info</a>(&quot;%s is already a symlink=
! Not symlinking kernel sources&quot; % s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(kernsrc, recurse=3DTrue)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s[-1] =3D=3D &#39;/&#39;:<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
</blockquote></div>

--0000000000003a943f060cc76f41--

