Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD8DCCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 20:54:16 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92.1762894449989195168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 12:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UmL+1nKU;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.42, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63f996d4e1aso174121d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 12:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762894449; x=1763499249; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWvyWW4dMzSqWjb1kBgXHx9rcS3guMzLsOLw8rdIkjk=;
        b=UmL+1nKUaYLDIVDJ+5L89tt096shcPj04qDjAcN1uU4FZKa6j5I/ydOjo33O7AaGDI
         C7UYNsFRwem/dFGcIRSSYII4XX/HlHcEOhP2oyesWc3cmDTw0EgXnjiRy3tayYS7K7/7
         zMF6VmSCbzHKZtOD7CTg6AgDiueEn5GhfvdLWQbxg/ilHVljuU8Wde481WLB4yjWUExp
         Bpz/mQJ0RnlcvvYzv7qytuVdiM0XYwvdDvDfqoHUcMKZzrtzUfK+I/HhyWZc526JeicH
         UN+HnrNu66ynBu/ghGmv2iWv9jGGy6rgCKfVShczzKno6qb2bSBOztKNzQ5MHBWCASjT
         LETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762894449; x=1763499249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWvyWW4dMzSqWjb1kBgXHx9rcS3guMzLsOLw8rdIkjk=;
        b=L8JUQJBA6GWrsA4gj4YET1Ndwp3uz2fQoorZqGp6IO/TcPkKOMKufBZqWlOkeLFkko
         EhL7a00uRtCH0gADTnqCqjeTfR3MZIYWY96Ra6TjuZzV886MpLwuljXMQ1CgIhO40hS/
         9A9meaHTp2iPbXxgpSbo0Hf4jdaaezyo3vI+ZEXttfqCvZ5unUaYb8Gl/Npre8yZO/fD
         p//mzp8vr0hryuJsyJqpdHqG5oFdmyO9AmenbgOd+hJaK6ZM4BhxGQsK5XUnEmDxDk1i
         R4Sq37t0wyIN/lvIZvG7P28psm9DD8HTERPFYMhfTzCyltgKJJ8zOBKU5jiJnSVG5s7A
         NvNw==
X-Gm-Message-State: AOJu0YylEkJvYiijlliGgzPxEGI5D1qRbXt8JW1w1MhgsbdocGeDEl7j
	sFBQjUfbnKGgXL61SirahNvT6nY8hI29KR+GWAOace/259b9S4wBOv04uWP46lVUWSMOURP7rph
	IV/LTnKHNZ0AVFAA5zb7QRb308auPo9mXBMm/gg4PrA==
X-Gm-Gg: ASbGncvC1VY9xzgh0JoiGGy+JRBErdT673WrlOvbYCMKlQX2htCEOzR6bshqY1SE5wP
	NeWtnPWkgvJrGZ+JELlEsdstyaEpIz0UMOBEUIonDycIehcay2vw+UxS2/IV1/ur+T2wYt5vwcZ
	0F7xdXuVlZhAwl2hHm0sOadPX5uCjgrg750AsGEI95MKitY2/+9xeicEeZ5bvVexg2Wjz6igHcl
	yy61nAmgVD5ZuXwGu87P1GROWIJElWABg4pBwwQDvyNuetC8EZmWiw/db4NPpPqYIN3/1H1f/wd
	sAXHkuSiCUWksEN6
X-Google-Smtp-Source: AGHT+IHD0yGlfhKRlq+Zbm2Q78O2LNZ8cuF8J2EqZfu3Ps7jKL7MtTGflrLBorZl4IrUAe7oDaq2xR2yMTJazi/uISU=
X-Received: by 2002:a05:690e:4312:b0:640:d3ef:3fe4 with SMTP id
 956f58d0204a3-64101bb394amr546301d50.61.1762894449139; Tue, 11 Nov 2025
 12:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20251111062222.2870876-1-saquib.iltaf@kpit.com>
In-Reply-To: <20251111062222.2870876-1-saquib.iltaf@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Nov 2025 12:53:58 -0800
X-Gm-Features: AWmQ_bkAwbRU-1fvi6dgsP6K3E5Gql0nfwU51aBDgcgO6Llje1Ep6s3vAwicMIE
Message-ID: <CAOSpxdabA5zm4Fftg0BcT2o7PyVOKBQhK--VSXp8=1gxV03cEg@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] rust-cross-canadian: Ignore CVE-2024-43402
To: saquibiltaf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 20:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226191

This patch does not apply to the kirkstone branch.

Steve

On Tue, Nov 11, 2025 at 11:36=E2=80=AFAM Saquib Iltaf via
lists.openembedded.org <saquibiltaf=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Ignore CVE-2024-43402 as its not applicable.
>
> CVEs are specific to Microsoft Windows.
>
> Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
> ---
>  recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-devtools/rust/rust-cross-canadian.inc b/recipes-devt=
ools/rust/rust-cross-canadian.inc
> index 50d9e6c..0a87c64 100644
> --- a/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -15,6 +15,9 @@ SRC_URI +=3D "file://target-rust-ccld.c"
>  LIC_FILES_CHKSUM =3D "file://target-rust-ccld.c;md5=3Daf4e0e29f81a34cffe=
05aa07c89e93e9;endline=3D7"
>  S =3D "${WORKDIR}"
>
> +# These CVEs are specific to Microsoft Windows
> +CVE_CHECK_IGNORE +=3D "CVE-2024-43402"
> +
>  # Need to use our SDK's sh here, see #14878
>  create_sdk_wrapper () {
>          file=3D"$1"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226189): https://lists.openembedded.org/g/openembedde=
d-core/message/226189
> Mute This Topic: https://lists.openembedded.org/mt/116244000/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

