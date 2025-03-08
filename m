Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213CAC282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 19:42:15 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.2303.1741462926239615215
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Mar 2025 11:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ky4OYNMT;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so2705027276.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741462925; x=1742067725; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+WCuHao7MA5EjeIJHfGA425ZUcMy6GfEmDNT4gw57I=;
        b=ky4OYNMTZaGz0CqSwNUIO7fKSJDXSxgfXqxQ1TFoKYXKSI2+a2uGFZzH+zpqSSnT70
         dhvUDKQDwM2Oe8MqkKFO/o6dS5JpBEpjBDoQ3iL0yGN+yvO9h6mLkh1MmIMV+YfHP6Pj
         4HIehOxQdFmb9BGExNIqxrCYGYaBFaD7eEZoAKaRYkMsQrtjIkfKxDwwTmWgk9gazz6Z
         G2Z2A2vciPSwKDEsy5s3tKgliwi7hHOWCF5JiJ3kUp6cR6joEnUItMYjZ2b8lFpHbWC4
         /WYILKEZqqOPCycR/oh7/HPhtCpX2FodSmFSF+hj+kTXjLWouvMUfWGjdt1uQWL1yRFu
         nYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741462925; x=1742067725;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+WCuHao7MA5EjeIJHfGA425ZUcMy6GfEmDNT4gw57I=;
        b=HdrKvY8k935HDiaVl+BD8YoXcpi+rQRs5Kc9Mj9MUwjyEztBK8RKUA2d8TVJ95ZlTu
         jthVZVaZi9/NSuuR13qK/B2ZjWy/M2eBXzNiTinmX3/nh4cVJmtKUsqPAv8BozfZbUqq
         YCejak818mDrYL9EQ+3K8ME3tmroE4cu6bPu6fd4yIuIOT+yJD06ue+nN9roeY/Q2mOJ
         QabJB3vpTpZEc0Y+2SSDd414FkF+nXVC6sUdD+6sGUyOxF/2SklEnjbHaLCsh5n2kyqr
         JzE2i/K1m7ON4ohPSkltSEzMa72fONCmWxBO0ebRRkJBFQC5M6cHxxr9qDrxnYJx8tf4
         ruRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrvdd5GpxPksyQejlvHygddkPYM/2uZnFF9z4G+mqTrBWCbw+MllgZM63CQknl4ET9183lIRFxlRmU4YxFv3b24A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBnEA+gKerK11UwLqSPnLjjABh7tYM6IHgzYdeY4uUzJRrMtAC
	/hZjBtg8pwF0xlRYTzB0PiX+8G3c36tlld6yQMbzbp8ZVi0Pd3QR+6uQj1tW7FO3Z2E6pN1T0A5
	w+bA6+XMNAr7rraTvha6VqO/TNVBI/gddjWPr0080VFQj5m2Qf70=
X-Gm-Gg: ASbGnct9ySiH/BYR5P3cW9ovTlig18mO0LInN9KaOCopZA1HPTrGk1SRK78ZdhFomlz
	n+GJRAPk4oNNaHFftN01VSwZdOMBlaGhn24cmCeHvgFd1HfkvjlYUBdhKgV3/oXvqbux330+8z4
	xpz8xZN3rM3DXQ09yxxhtPCpH8GcVuPW7IymzPoVmCHKRzY0tQCj2UxjESdA==
X-Google-Smtp-Source: AGHT+IHPXvDTmc/qszXIBtmmwzJmahuD2zDEsFlEG1rCbxFqa/SoAI7lFR0ZF8K7pLXTsMf1RUfYEnTKY+ggdxDC+XA=
X-Received: by 2002:a05:6902:114a:b0:e61:1b54:2d1 with SMTP id
 3f1490d57ef6-e635c18bac8mr8439476276.27.1741462925190; Sat, 08 Mar 2025
 11:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20250306105643.2292192-1-kai.kang@windriver.com>
In-Reply-To: <20250306105643.2292192-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 8 Mar 2025 11:41:54 -0800
X-Gm-Features: AQ5f1JoYyEsrdNAeEC9jYp1Gh2pexPty4PcejFi-ECmdiDBliUfmVGdiqPGa-OM
Message-ID: <CAOSpxdY6wxiyxCoN0rROi3=iyqNT=4hOmO4pOt2yy9JQXZHotA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: retain default trace backend
 if 'ust' is not enabled
To: kai.kang@windriver.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 19:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212475

I'm getting errors on the reproducible build test:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1180/ste=
ps/12/logs/stdio

Looks like host paths are leaking into the qemu-src package:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250308-s52sakkc/=
packages/diff-html/

Steve

On Thu, Mar 6, 2025 at 2:56=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> The qemu build system enables the 'log' trace backend by default, if no
> explicit choice was made with '--enable-trace-backend=3DCHOICE'.
>
> However, the qemu recipe uses the following PACKAGECONFIG line:
>     PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-b=
ackend=3Dnop,lttng-ust,"
>
> which means that the 'nop' trace backend will be explicitly selected if t=
he
> 'ust' feature is not enabled. The 'nop' backend removes almost all trace
> points at compile time, and thus basically means 'disable tracing'.
>
> To retain the default trace backend if 'ust' is not enabled, the above
> PACKAGECONFIG line should either explicitly fall back to the 'log' backen=
d,
> or not provide any value for the 'disabled' case. This commit chooses the
> latter to not make any assumption about the upstream default.
>
> (From OE-Core rev: c31396a30dcf17ab23ff4dd5943eef5fba20cba6)
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com=
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index bee30cd56f..137636ef82 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -298,7 +298,7 @@ PACKAGECONFIG[libxml2] =3D "--enable-libxml2,--disabl=
e-libxml2,libxml2"
>  PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
>  PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
>  PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
> -PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-back=
end=3Dnop,lttng-ust,"
> +PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
>  PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
>  PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccom=
p"
>  # libnfs is currently provided by meta-kodi
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212384): https://lists.openembedded.org/g/openembedde=
d-core/message/212384
> Mute This Topic: https://lists.openembedded.org/mt/111545623/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

