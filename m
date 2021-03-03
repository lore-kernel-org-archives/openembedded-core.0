Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.289.1614808587160288921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 13:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V5rDIVdc;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id e25so1761164vkd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IUklxsg6nnhD7etYvhBHOlrRFfnVnZXUpQhiUeilToY=;
        b=V5rDIVdcHyrs6/PVQdfrVFbow8BuwhOfyfgnPr2c4iLKu/2d1T4hNmCD4vgYZY+x4+
         mjSVXicNfQwrQYztN05gwtm9gQT13Yiah5aileQZGPmJJnlqBiMRUsw/XKb3uQvEzlBd
         Y7zZXiDiZ6GCcx4ReuC/udhpyvKmU1nU1Y3FXcduZSWFyGLOw+X7w36PvE68s+P4gDaG
         a8EzFVDOTM/o458jickYTOVOlA2gdA8y1Zo+ktCS+tlQ+c9LTYUYQR0EYW9Bs3LKzGF4
         bvfwvq9slY/55+7Qo0J2iTKxcX3uFSLeIHpYNcVJyCwvP+Oi8hmV7pKvoZawf+qRSEq2
         caqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IUklxsg6nnhD7etYvhBHOlrRFfnVnZXUpQhiUeilToY=;
        b=kL8tBER52VQ/ny9ALvUOvxMyJjmeBp5Ys7Da1w0ZnWlD1LxeouNEz0W5poTRGxisMv
         dzLmTArjOLyWCe30mcmvc4qJlpzUNRIv6GEfMTFvm9/uay1apUUgCgTFlqZCq2xrlCfS
         JygWJc7d7ANiAKvuSrW9bbtmhrynEsTtAJx7LwFcMR/zl9iQyXuEmbkJYr0PgZ0hu/sh
         wO9Jyua0HxcOA9m+LNNJnvANAbo58V5Jd0gL6UNdFKfV/p5BkJrisNdW9/MncN2pEQrM
         c9H27tCqLQ2Tl4kiAcBquvg5HN5E9Ckh7qdVvXMcgVavSKtfE/tGslmu1FvP9EFxqZ5u
         hAIg==
X-Gm-Message-State: AOAM531mMmT/xiJ4x5vEHu/BDMB2Si3/QOjOYQcD1wZ0/ExUZqTpDNvh
	8rtlGW92BPBVJjt3cLoBTde9lgnWeCdjSSUP/sMd1SiOtbE=
X-Google-Smtp-Source: ABdhPJyXgw1RbvGNCBdF9k+RIgFCcMOV4N5IKo0EAS61VlOR98uJcysRDFyVbIAmNuyD1lnOAN6ouEtSrgJay5uidr4=
X-Received: by 2002:a1f:c786:: with SMTP id x128mr1011848vkf.10.1614808586077;
 Wed, 03 Mar 2021 13:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20210303213341.759637-1-ross.burton@arm.com>
In-Reply-To: <20210303213341.759637-1-ross.burton@arm.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 3 Mar 2021 22:56:15 +0100
Message-ID: <CANNYZj9iY1G+6MaZbCAxuSK_mXx4O5H-XUj7gDkUetsKPXoh2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: less parallism to increase chances the test suite works
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002749df05bca8ec6d"

--0000000000002749df05bca8ec6d
Content-Type: text/plain; charset="UTF-8"

I have to note that x86 ptest is not affected and runs fine, so this may
not have been fully researched. Could it be specific to arm?

Alex

On Wed 3. Mar 2021 at 22.33, Ross Burton <ross@burtonini.com> wrote:

> Discussion with the libinput maintainer has confirmed that many of the
> libinput test cases need to run on a relatively unloaded system,
> because input handling is by definition time-sensitive and any
> event mismatches are considered a failure to avoid broken code hiding.
>
> We can't expect libinput to run on an otherside unloaded machine
> because the autobuilder ptests execute in a qemu at the same time
> as builds can be happening.  We can however reduce the amount of
> parallellism happening in the libinput test suite to give it a better
> chance of succeeding.
>
> This may not be enough, but it's worth a go.
>
> [ YOCTO #14164 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/wayland/libinput/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest
> b/meta/recipes-graphics/wayland/libinput/run-ptest
> index 5a84c568b9..d11e6eb25b 100644
> --- a/meta/recipes-graphics/wayland/libinput/run-ptest
> +++ b/meta/recipes-graphics/wayland/libinput/run-ptest
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>
> -/usr/libexec/libinput/libinput-test-suite
> +/usr/libexec/libinput/libinput-test-suite -j1
>  if [ $? -eq 0 ]; then
>    echo 'PASS: libinput-test-suite'
>  else
> --
> 2.25.1
>
>
> 
>
>

--0000000000002749df05bca8ec6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have to note that x86 ptest is not affected and runs fi=
ne, so this may not have been fully researched. Could it be specific to arm=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"=
auto"><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed 3. Mar 2021 at 22.33, Ross Burton &lt;<a href=3D"mailto:r=
oss@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">Discussion with the libinput maintainer has confirmed that many of the<=
br>
libinput test cases need to run on a relatively unloaded system,<br>
because input handling is by definition time-sensitive and any<br>
event mismatches are considered a failure to avoid broken code hiding.<br>
<br>
We can&#39;t expect libinput to run on an otherside unloaded machine<br>
because the autobuilder ptests execute in a qemu at the same time<br>
as builds can be happening.=C2=A0 We can however reduce the amount of<br>
parallellism happening in the libinput test suite to give it a better<br>
chance of succeeding.<br>
<br>
This may not be enough, but it&#39;s worth a go.<br>
<br>
[ YOCTO #14164 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/wayland/libinput/run-ptest | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest b/meta/recip=
es-graphics/wayland/libinput/run-ptest<br>
index 5a84c568b9..d11e6eb25b 100644<br>
--- a/meta/recipes-graphics/wayland/libinput/run-ptest<br>
+++ b/meta/recipes-graphics/wayland/libinput/run-ptest<br>
@@ -1,6 +1,6 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-/usr/libexec/libinput/libinput-test-suite<br>
+/usr/libexec/libinput/libinput-test-suite -j1<br>
=C2=A0if [ $? -eq 0 ]; then<br>
=C2=A0 =C2=A0echo &#39;PASS: libinput-test-suite&#39;<br>
=C2=A0else<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000002749df05bca8ec6d--
