Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58923FCC063
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:55:27 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2199.1772823326027315067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=myfbRRt8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9382e59c0eso534708966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772823324; cv=none;
        d=google.com; s=arc-20240605;
        b=hbSgOs8K5cWiIlLkQ0AXf3mzC/ze4/31nIUYmNm9yJOiPhXpJiEdc1dEB14pzR4rNY
         SK5Peb8UHWLOjqQq7Ybt3BxrspUFCGYAy8E/9Bf/gSAbq6kZ72Fn7L0corMs5bn/UCt2
         a9WgIf5sPgIVcpP3vlRQqJ/jeIj/VKcbzZuOLDyRmfwVC231QYQWq2g5vSZOhsjO9fuQ
         Fl8ZbY8sbe13rqc6Bc/xBG179dBB7+DtT7f4pqHSsEFQiqOA+2DDXwkKN6xC9shOGjRl
         VV/DWz8ZjTEuGsHEa40B64o01yL6p+fKY0Dkc6DTHr+Mzx3i4tuvF/QXBD5VsHPUQXIu
         GB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7l15LzZPEKgZU2+6/JmE34y2IIvjO3++H7w4VEE2iBk=;
        fh=hrLIMLnLgn9lA4UjcABRY9PW9LZQM2JxdaLMYkWr4sM=;
        b=LJvVTwdQgwNNGGXMqjqVkJqUjJd5W9yMWPfjApLaLkqsT2I5cV0UPn6fNH01rdzs4h
         BLjG8w+1Y/tB4FZRYEa4XXNUz2tKH8/z/lAp+7vyBA+CpVGXJF4lbQV4OnfSzlf1tM+C
         tJ8TmjLxGMQdGRwGS2BhRrMhkWnmRSvDZnEkTXCbcU4YO0SP1y9Xs+nihyp4Qkkizp/6
         wEH2753Klf5o21STjqDGK3fcfOF2CAYYnIW+KvaUnHGbQ0h6Pqa1PsWsrod755IXD3yh
         86zK3QBY4DcR0jppV48bXOEpt0MKLpOXlJMpHPhxVHGL1q4b8CCEa0gAal+s6eWjVnyY
         wDgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772823324; x=1773428124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7l15LzZPEKgZU2+6/JmE34y2IIvjO3++H7w4VEE2iBk=;
        b=myfbRRt8amNLcN8kmpG0QT8hxmPr3WHpOnjxnt7KARKdJhc9H5lfYpBpym3j4j/uV4
         P9NB9cw1wbjpAKJqkos06N28yMPoCR3Nxch94Igk/AxLbil+HNy9fsIgyaHAFLaqmnH+
         t64BMrvuLA+bQoamNEFaLMGVLj7dBKPKOZ1U5pz5t2j3mdeanTTcp9wX6bidUN6DZhsI
         eInjd7E7Ql7R8d3APiPfWZSuAfh2TVei0VIUMug6kE7hdE/y6o1OQopNhYChBNmucH8i
         fCwjtXXIPvama/u4FUn8ru2Bgynks31jy9PNMUu6AVfkAXAyoGC72uxBEbIsndZ7eO9L
         pZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823324; x=1773428124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l15LzZPEKgZU2+6/JmE34y2IIvjO3++H7w4VEE2iBk=;
        b=bv9g8GrwXzjHDRuqV860jAz4kE2enz/8LaJ7tn9MxgLc85+rpbmjNMRFCq5GJ2P3ia
         /6X1RB3GHK9uv3AZLx2dK8Fy0fJ4DUq+i5zN1x+CUzpLkugNyI/dScySJIXj5knmsF+M
         q2J2UWsYSQTTQ4/uZc0GkmKBjiUS8Wd0yhhGUe1JRZPbbd+PnTaVw2TMqlmktkS2MQxQ
         gqCyzQwOvmeQDRvdkRRK1DFfpbvw3HFtEetwyd1TZrJSqFDDk6VNzTxagcFe+4G6BxPs
         YGcPex6esgoxyk1WdVi+H6/xUA249WMpe6gWfG7saAD07o+f6Pt46Bb1+j6ONOCnnYfR
         OVuQ==
X-Gm-Message-State: AOJu0YxlvCyBljv84byp0FQCRNk3a9oiMzKrOeH3Iez7/Ugwvj2yKx1N
	WWbR4y7BbSWva9gWU33Znv+asQO1bMeTs3dfeaz/HYtfTQrjIJGkBliigY4EjbJSm5ONhQqkIB+
	9bXJkkTOH03WtFVbnFCDAQ1uGbMQsfBg=
X-Gm-Gg: ATEYQzxSxizByYO16VEIFpuBCgXZtg81Fe3o5qwq7JOlybGD9DpHS/XYDcZ2/liXdoP
	hmPH0ER4xC8NDCOVhJN1sq6j4826QFf0dadROc/H4mWHbmZxtg1eVfrzK9pJxFGbTyda8FH/R2x
	FdHLz7JWRc9ZuxNDuXv59ONGt+m9r6Hy0TADcAEHhTYICOtOBKHUgbP0ODLObF5+Zf9k3p3dRGD
	Ga6EU8KAZy3xdQj3/sJG1EekfmBuLamU9wWOLesSMS5H4QwqcDI8GMaQwnCgvWMJDDhor98qMcX
	QqFBKczjN7XndXSyvcfj
X-Received: by 2002:a17:907:7f87:b0:b88:241e:693c with SMTP id
 a640c23a62f3a-b942df78506mr186398966b.31.1772823323901; Fri, 06 Mar 2026
 10:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20260305110200.17834-1-pratik.farkase@est.tech> <20260306172416.23307-1-pratik.farkase@est.tech>
In-Reply-To: <20260306172416.23307-1-pratik.farkase@est.tech>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 6 Mar 2026 18:55:12 +0000
X-Gm-Features: AaiRm523z9lzLZc6HewT3MNt71Ugs9zynEtWk5ILQrhORY5RNaBiIXOo1UjQzEE
Message-ID: <CANPvuRkMaFwgenqWFYUy0WtC-vRmwU_2oD3RjaUUOrO2Ze1=iw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] go: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: multipart/alternative; boundary="0000000000007882c8064c5f9830"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 18:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232588

--0000000000007882c8064c5f9830
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratik,

Pratik Farkase via lists.openembedded.org <pratik.farkase=3D
est.tech@lists.openembedded.org> escreveu (sexta, 6/03/2026 =C3=A0(s) 17:24=
):

> Add ptest infrastructure to test the Go standard library.
>
> - Run 'go test -short std' via run-ptest script
> - Install source tree and pkg/include headers
> - Create VERSION file for architecture detection
> - Exclude multi-arch binary testdata to avoid QA errors
>
> Test results: 237/253 pass (93.7%) on qemux86-64.
>
> Known issues:
> - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary
> testdata
> - time: requires embedded timezone data
> - net/http: requires unstripped go binary
> - testing, go/types: minor edge cases
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
> Changes in v2:
> - Exclude .elf* files to fix QA arch errors on all architectures
> - Exclude *-x86-64* files to fix additional arch-specific test binaries
> - Tested on x86-64, x86, aarch64, and arm builds
>

Having the golang ptest running on x86 and arm is a great improvement for
the project.
Thank you very much for this patch.

Jose


> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
>  meta/recipes-devtools/go/go/run-ptest         | 23 ++++++++++++++++
>  meta/recipes-devtools/go/go_1.26.0.bb         | 27 ++++++++++++++++++-
>  4 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-devtools/go/go/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 1bb7458fc9..432f3965de 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -24,6 +24,7 @@ PTESTS_FAST =3D "\
>      gdbm \
>      gdk-pixbuf \
>      glib-networking \
> +    go \
>      gzip \
>      icu \
>      json-c \
> diff --git a/meta/recipes-devtools/go/go-1.26.0.inc
> b/meta/recipes-devtools/go/go-1.26.0.inc
> index 7d8a68e3b2..611f00aaab 100644
> --- a/meta/recipes-devtools/go/go-1.26.0.inc
> +++ b/meta/recipes-devtools/go/go-1.26.0.inc
> @@ -16,5 +16,6 @@ SRC_URI +=3D "\
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>
>  file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
>
>  file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
> +    file://run-ptest \
>  "
>  SRC_URI[main.sha256sum] =3D
> "c9132a8a1f6bd2aa4aad1d74b8231d95274950483a4950657ee6c56e6e817790"
> diff --git a/meta/recipes-devtools/go/go/run-ptest
> b/meta/recipes-devtools/go/go/run-ptest
> new file mode 100755
> index 0000000000..86ff1bd1ae
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/run-ptest
> @@ -0,0 +1,23 @@
> +#!/bin/sh
> +PTEST_DIR=3D/usr/lib/go/ptest
> +GOROOT=3D/usr/lib/go
> +
> +export GOROOT
> +export PATH=3D$GOROOT/bin:$PATH
> +export ZONEINFO=3D/usr/share/zoneinfo
> +
> +ln -sf $PTEST_DIR/src $GOROOT/src
> +mkdir -p $GOROOT/pkg/include
> +cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/
> +cp $PTEST_DIR/VERSION $GOROOT/VERSION
> +
> +cd $GOROOT
> +
> +go test -short std 2>&1 | while IFS=3D read -r line; do
> +    case "$line" in
> +        ok*) echo "PASS: $(echo "$line" | awk '{print $2}')" ;;
> +        FAIL*) echo "FAIL: $(echo "$line" | awk '{print $2}')" ;;
> +        \?*) ;;
> +        *) echo "$line" ;;
> +    esac
> +done
> diff --git a/meta/recipes-devtools/go/go_1.26.0.bb
> b/meta/recipes-devtools/go/go_1.26.0.bb
> index 46f5fbc6be..35a14b8e8b 100644
> --- a/meta/recipes-devtools/go/go_1.26.0.bb
> +++ b/meta/recipes-devtools/go/go_1.26.0.bb
> @@ -1,7 +1,7 @@
>  require go-${PV}.inc
>  require go-target.inc
>
> -inherit linuxloader
> +inherit linuxloader ptest
>
>  CGO_LDFLAGS:append =3D " -no-pie"
>
> @@ -16,3 +16,28 @@ python() {
>          d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
>  }
>
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/src
> +    install -d ${D}${PTEST_PATH}/pkg/include
> +
> +    cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/
> +    echo "go${PV}" > ${D}${PTEST_PATH}/VERSION
> +
> +    cd ${S}/src
> +    find . -type d -exec install -d ${D}${PTEST_PATH}/src/{} \;
> +    find . -type f \
> +        ! -path "*/testdata/*.elf*" \
> +        ! -path "*/testdata/*-x86-64*" \
> +        ! -path "*/testdata/*.obj" \
> +        ! -path "*/testdata/*.syso" \
> +        ! -path "*/testdata/*.so" \
> +        ! -path "*/testdata/*.so_" \
> +        ! -path "*/testdata/*-exec" \
> +        ! -path "*/testdata/test32*" \
> +        ! -path "*/testdata/test64*" \
> +        ! -path "*/race/*.syso" \
> +        ! -path "*/boring/syso/*.syso" \
> +        -exec install -m 0644 {} ${D}${PTEST_PATH}/src/{} \;
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "bash tzdata git packagegroup-core-buildessent=
ial"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232583):
> https://lists.openembedded.org/g/openembedded-core/message/232583
> Mute This Topic: https://lists.openembedded.org/mt/118174533/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007882c8064c5f9830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pratik,</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Pratik Fa=
rkase via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;pratik.farkase=3D<a href=3D"mailto:est.tech@lists.openembedded.org"=
>est.tech@lists.openembedded.org</a>&gt; escreveu (sexta, 6/03/2026 =C3=A0(=
s) 17:24):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add p=
test infrastructure to test the Go standard library.<br>
<br>
- Run &#39;go test -short std&#39; via run-ptest script<br>
- Install source tree and pkg/include headers<br>
- Create VERSION file for architecture detection<br>
- Exclude multi-arch binary testdata to avoid QA errors<br>
<br>
Test results: 237/253 pass (93.7%) on qemux86-64.<br>
<br>
Known issues:<br>
- debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary testd=
ata<br>
- time: requires embedded timezone data<br>
- net/http: requires unstripped go binary<br>
- testing, go/types: minor edge cases<br>
<br>
Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
---<br>
Changes in v2:<br>
- Exclude .elf* files to fix QA arch errors on all architectures<br>
- Exclude *-x86-64* files to fix additional arch-specific test binaries<br>
- Tested on x86-64, x86, aarch64, and arm builds<br></blockquote><div><br><=
/div><div>Having the golang ptest running on x86 and arm is a great improve=
ment=C2=A0for the project.</div>Thank=C2=A0you very much for this patch.<br=
><div><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-devtools/go/go-1.26.0.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0meta/recipes-devtools/go/go/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 23 ++++++++++++++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.26.0.bb" rel=3D"noref=
errer" target=3D"_blank">go_1.26.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 27 ++++++++++++++++++-<br>
=C2=A04 files changed, 51 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta/recipes-devtools/go/go/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 1bb7458fc9..432f3965de 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -24,6 +24,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0gdbm \<br>
=C2=A0 =C2=A0 =C2=A0gdk-pixbuf \<br>
=C2=A0 =C2=A0 =C2=A0glib-networking \<br>
+=C2=A0 =C2=A0 go \<br>
=C2=A0 =C2=A0 =C2=A0gzip \<br>
=C2=A0 =C2=A0 =C2=A0icu \<br>
=C2=A0 =C2=A0 =C2=A0json-c \<br>
diff --git a/meta/recipes-devtools/go/go-1.26.0.inc b/meta/recipes-devtools=
/go/go-1.26.0.inc<br>
index 7d8a68e3b2..611f00aaab 100644<br>
--- a/meta/recipes-devtools/go/go-1.26.0.inc<br>
+++ b/meta/recipes-devtools/go/go-1.26.0.inc<br>
@@ -16,5 +16,6 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0009-go-Filter-build-paths-on-staticly-linked-ar=
ches.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-=
trimpath-.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0011-cmd-link-stop-forcing-binutils-gold-depende=
ncy-on-aa.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;c9132a8a1f6bd2aa4aad1d74b8231d95274=
950483a4950657ee6c56e6e817790&quot;<br>
diff --git a/meta/recipes-devtools/go/go/run-ptest b/meta/recipes-devtools/=
go/go/run-ptest<br>
new file mode 100755<br>
index 0000000000..86ff1bd1ae<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go/run-ptest<br>
@@ -0,0 +1,23 @@<br>
+#!/bin/sh<br>
+PTEST_DIR=3D/usr/lib/go/ptest<br>
+GOROOT=3D/usr/lib/go<br>
+<br>
+export GOROOT<br>
+export PATH=3D$GOROOT/bin:$PATH<br>
+export ZONEINFO=3D/usr/share/zoneinfo<br>
+<br>
+ln -sf $PTEST_DIR/src $GOROOT/src<br>
+mkdir -p $GOROOT/pkg/include<br>
+cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/<br>
+cp $PTEST_DIR/VERSION $GOROOT/VERSION<br>
+<br>
+cd $GOROOT<br>
+<br>
+go test -short std 2&gt;&amp;1 | while IFS=3D read -r line; do<br>
+=C2=A0 =C2=A0 case &quot;$line&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok*) echo &quot;PASS: $(echo &quot;$line&quot;=
 | awk &#39;{print $2}&#39;)&quot; ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL*) echo &quot;FAIL: $(echo &quot;$line&quo=
t; | awk &#39;{print $2}&#39;)&quot; ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 \?*) ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *) echo &quot;$line&quot; ;;<br>
+=C2=A0 =C2=A0 esac<br>
+done<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.26.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.26.0.bb</a> b/meta/recipes-devtools/=
go/<a href=3D"http://go_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">go_=
1.26.0.bb</a><br>
index 46f5fbc6be..35a14b8e8b 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go_1.26.0.bb" rel=3D"noref=
errer" target=3D"_blank">go_1.26.0.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go_1.26.0.bb" rel=3D"noref=
errer" target=3D"_blank">go_1.26.0.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require go-${PV}.inc<br>
=C2=A0require go-target.inc<br>
<br>
-inherit linuxloader<br>
+inherit linuxloader ptest<br>
<br>
=C2=A0CGO_LDFLAGS:append =3D &quot; -no-pie&quot;<br>
<br>
@@ -16,3 +16,28 @@ python() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;INSANE_SKIP:%s&#39; % d.=
getVar(&#39;PN&#39;), &quot; textrel&quot;)<br>
=C2=A0}<br>
<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/src<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/pkg/include<br>
+<br>
+=C2=A0 =C2=A0 cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/<br>
+=C2=A0 =C2=A0 echo &quot;go${PV}&quot; &gt; ${D}${PTEST_PATH}/VERSION<br>
+<br>
+=C2=A0 =C2=A0 cd ${S}/src<br>
+=C2=A0 =C2=A0 find . -type d -exec install -d ${D}${PTEST_PATH}/src/{} \;<=
br>
+=C2=A0 =C2=A0 find . -type f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*.elf*&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*-x86-64*&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*.obj&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*.syso&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*.so&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*.so_&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/*-exec&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/test32*&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/testdata/test64*&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/race/*.syso&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! -path &quot;*/boring/syso/*.syso&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -m 0644 {} ${D}${PTEST_PATH}/src=
/{} \;<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash tzdata git packagegroup-core-buildess=
ential&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232583): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232583" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232583</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118174533/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118174533/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000007882c8064c5f9830--

