Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB04C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:54:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.70411.1747119240877002681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 23:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hX0+5R75;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so36507845e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747119239; x=1747724039; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xwHOU+GVFItlSGBN1iBe7FUBshz5KhwaUx2lCfiL928=;
        b=hX0+5R75bN7btYACGNPORu5nPPsKBYS8zLYOsIl0SXw4P26uDYuB20lHk0g8f8JL90
         RFD44VnokrSQcK2lRiG7Dk/4bqr0FCZcCOtrpyhmNag6X0GC72Bk7J4K1t1/QMHaTHQX
         mFc7AXMBACNidExi86DO/0G88aAjBUy1L552w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747119239; x=1747724039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwHOU+GVFItlSGBN1iBe7FUBshz5KhwaUx2lCfiL928=;
        b=LsjUi//Cxk5NIeqwacMysVUyUneAZDzT7I+y2AoU7oyu7LkiRhdIZ9Eap2ZNiEc4rP
         uSEl95jrU1D4hBiDY7AT62hjp0kuFGZrS/ZyGHvg9pW+1BH06b+ETs7mQ4oLEsZjsopU
         nbctTz+pxabjBhRFJWDl+V8sL9vP3+J/UnG8FbnTMlp8g6PQgqruepLe4P/AtF8+AlrV
         3oaSxcXGD++QPQRCX9TwNCqa+Rw3e4nli1yP8YKdoKhTfOt/rR5+Xim8QFDKfxfUQHWW
         NYKGng3skH1QvHZDMiu9nB0dY/La8JKkPAQy5kB0b6OuHomuCZRrTCgPhMjLvyAv/7Ap
         qe6A==
X-Forwarded-Encrypted: i=1; AJvYcCX3K8DYGnj59o4N/440oXM93ZLEoix/b6TSTVck1gYtp3wLkelKxXv/wDMB0qTQXrWtLyFpfuifrtk4M6EUd+0kxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUQfv5anQS765iNi6KbYCw/9zgF6zUewwmbC6rlMqOBiGDcPIC
	FiWUFLDrMcq1KKTFJ8hthbD/jcIv42QL1gb5n4UWsKMkwZDVb6pquH/JEPfJHOY=
X-Gm-Gg: ASbGnct0LljE5CzMqkgWAc0egaI/BAmz6dyckVOU6WMb00/g48pCOeGlPn8ovsV2pao
	2MttGRQtYCYslHvAmmkMz310pKbf2U1ZLRwSMtygKLkOE4KtIG3gYFQlGWRkgPrwgNR3qtDzcrR
	IORJj7Xc6GnhHDdrwi2xE5YkiR5wu04uBiaxHD3pZhfdRecPNsDkSOu9l2+Lxow70ehNe/Rohqd
	DqPIevpiptmzL2K2Z74V9xvuxXqChI+PExP7pgK9JyrLVRHu14I5DVSgmfiAp6XWxvFK6v2nMEf
	JbytkoWx1m0dv0z9xgmsR/HzqVHzZrvMd5kUbhsvpZgFgv30NXXeqFk1bJQoY1mYUXkx+NEglS5
	0Qf96X+PDVGjZ6FLzP8E+9igbVe3li7nHHlj1DA==
X-Google-Smtp-Source: AGHT+IFFHz19/Pmh0I+15DWzQg0aSSvE5pED5lbzRTpF6tK7haut5I7qa5cSdVGNhq++ueJB172hCA==
X-Received: by 2002:a05:600c:c07:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-442d6d18abfmr137178255e9.5.1747119239018;
        Mon, 12 May 2025 23:53:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd? ([2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442dc6f1a51sm122968785e9.22.2025.05.12.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:53:58 -0700 (PDT)
Message-ID: <576ffe3b4036f3ab1759cf86af99ef1ef0e2fcee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-devsrc.bb: Remove extra System.map file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: erick.shepherd@ni.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 May 2025 07:53:56 +0100
In-Reply-To: <20250512190451.1363972-1-erick.shepherd@ni.com>
References: <20250512190451.1363972-1-erick.shepherd@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216399

On Mon, 2025-05-12 at 14:04 -0500, Erick Shepherd via
lists.openembedded.org wrote:
> Currently there are two .map files being copied to $kerneldir/build.
> One of the files is System.map and the other is
> System.map-<kernel version>. Each .map file takes up about 5MB and
> have identical sha256sum hashes. This change will make it so only
> System.map is copied in order to save disk space.
>=20
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
> =C2=A0meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 1500aff2e2..9729a25440 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -75,7 +75,7 @@ do_install() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -s Module.symvers ]=
; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cp Module.symvers $kerneldir/build
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp System.map* $kerneldir/bui=
ld
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp System.map $kerneldir/buil=
d
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -s Module.markers ]=
; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cp Module.markers $kerneldir/build
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>=20

This caused tons of failures in our automated testing, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/1630
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1606
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/1601
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/1599

but many more in that build too.

Cheers,

Richard

