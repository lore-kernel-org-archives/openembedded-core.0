Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.8920.1614083109037612994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 04:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fsvtvn1J;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: zbodek@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id j6so7160995eja.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 04:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7na76pWkV2BCq/t196ICYfAWFdyGpTgCv7uXzGdaxD4=;
        b=fsvtvn1JxYTfWzbPKiOJnM8txsRHmLVFk0G9X9of8PlzS9Zoip9VkOEIelR192TRvW
         UgdI0VgtL8F9vp6eBFzfmoAFpr+QUwE0H+NYYnjkvq+zXfhJzJ2GnkSgbCrjiJ6OlmG5
         H3yPeToc3F+En2P2FR6HWmyPUR2p++y5tZTtFVJto5QTsJkhpoDiB7s49TRj90dSNie3
         +/nG1scjQppbwVKdZOl4FMesZ4m3vMLrfFenTBaSg4vcCJ2QnsQzVmJYJXHnV4ansqQz
         tBiIBMj568ClekKwo5b5G+T7oy24F94kPCUqEckGQF3IWLkNlcNjJCNuWFU/5hImVm1F
         yrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7na76pWkV2BCq/t196ICYfAWFdyGpTgCv7uXzGdaxD4=;
        b=gzVrwCr9jyuIONsQfk6dXjf00pR2yqPlhv/tfSFU7osv7IuwOAonWNO+I6MDQ1UhfS
         KCNGCmp5JR9z76ze3rkh7VfQ3xv8I7riGH6zhH6sLWwDeg0RkMkkMR45EBw1vKUNgRk7
         Z9PskcV9aQqQXvCsta3xZ1TXqNRcR7/lbf/YPJXU0+wOciymOfhd0IeIa4MUUPnJ8Ue/
         9DLBlPuVSKI3/IOKdPZiSoZQ+hUG2SM9wcbdRcJKQRwjYr8p0p5i9lsPXh/P+0Q9777Z
         AlrPgGeB5nq6TAMBeSUCUfnJ305QF/3Pei19K7XqXDIzIONXzOS48i7dZd0JwqodcGSc
         0hCg==
X-Gm-Message-State: AOAM533kKK1Jx6uu/BGTD3TieDo0fYFQ5YkA4FOmf0+5hkRjjDZoA7+H
	xLxldeWq40WWR8WVDK/Py4hD05AZM74cXQcsY41e76+M
X-Google-Smtp-Source: ABdhPJz5fRJzVkvvdFDmgLwTeeo7XjklkHU3G+KYWS9AF6rF7xSYBHSmEbort4ujKepjCe37bh18CKwd2QeJ3Dk+EdE=
X-Received: by 2002:a17:906:d104:: with SMTP id b4mr7821917ejz.390.1614083107292;
 Tue, 23 Feb 2021 04:25:07 -0800 (PST)
MIME-Version: 1.0
References: <166535D1ACD90C64.29685@lists.openembedded.org>
In-Reply-To: <166535D1ACD90C64.29685@lists.openembedded.org>
From: "Zbigniew Bodek" <zbodek@gmail.com>
Date: Tue, 23 Feb 2021 13:24:56 +0100
Message-ID: <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, steve@sakoman.com, andrei.gherzan@huawei.com, 
	wojciech.zmuda@huawei.com, Zbigniew Bodek <zbigniew.bodek@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any comments, questions, remarks to that?

Kind regards
Zbigniew

pt., 19 lut 2021 o 18:20 Zbigniew Bodek via lists.openembedded.org
<zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
>
> From: Zbigniew Bodek <zbigniew.bodek@huawei.com>
>
> Problem spotted on dunfell-23.0.4
>
> Normally, unversioned .so is removed from -dev (default) package
> however it is still being referred by other agents, such as webkitgtk.
> That can be observed while executing i.e. Epiphany Browser.
>
> For instance:
> platformInitializeWebProcess()
> calls
> wpe_loader_init("libWPEBackend-fdo-1.0.so")
>
> as a result one can see:
> --------------------
> wpe_loader_init could not load the library 'libWPEBackend-fdo-1.0.so':
> libWPEBackend-fdo-1.0.so: cannot open shared object file:
> No such file or directory
> --------------------
>
> "master" branch contains a bumped-up version of webkitgtk
> to which this issue does not apply (the code has changed).
>
> Forcefully keep this .so symlink to resolve the problem in dunfell.
>
> Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> ---
>  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/rec=
ipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> index cd2f7fabda..165fc74dde 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> @@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>  SRC_URI[sha256sum] =3D "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e9346=
8091f1dc68ddb299d"
>
> +FILES_${PN} +=3D "${libdir}/libWPEBackend-fdo-1.0.so"
> +FILES_SOLIBSDEV =3D ""
> +INSANE_SKIP_${PN} +=3D "dev-so"
> --
> 2.17.1
>
>
>=20
>
