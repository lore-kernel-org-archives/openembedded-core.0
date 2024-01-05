Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CBEC4707B
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 10:46:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.21005.1704451598441569107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 02:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fjW8sWH1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3373a30af67so1133959f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 02:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704451597; x=1705056397; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQv486hAp81OuKGBipYM5FUFIjYOndbPKhfow3j6XBo=;
        b=fjW8sWH17rQnQEJVarqhSoOm6TO4fIQnASpy20TnhR4P5pXFO8rgRL6k8qBXJp2Z4O
         xz5BW9PNNAMxjBecPP5zxAUi588Go2Xi/F2aoaiWPK7hb8JVVYuENWkH+xfSyQnO3w2W
         u1I9+irfbxe5i6Tdq21DXOA+BK9qX82ep/uqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704451597; x=1705056397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQv486hAp81OuKGBipYM5FUFIjYOndbPKhfow3j6XBo=;
        b=oyKavv659POLLHsjAuAI/IPrXW+YJwt4ILoOyQWmvY/NbczwYshO6RDC5uNfpIWh51
         XYPlE8iXLfcNf/OP9dAWNdHXC2xeDCOUvkx07AvOch5hR7v9n8wiN3Hj3sSq0xI14Kdy
         y/cRdm/9sUBqua/2JYDR7FhKMqKjTjTsfhSAQOr9iNnc0D1FaByQdb/6+trpnIaUSwzH
         QvQkV9At0hmjgRlCEAU3esf4g284ECNDhjM/s+wq4S25txqQz3GSgsrDDhX6yY5tUZRo
         k6er7SpMx0W4gussUkv1JcmrFBqwaTGC1ZhfJIvOMlaeyWmVHikVwUoTyQ2xX4p0usgx
         DPBQ==
X-Gm-Message-State: AOJu0YyY76bSDT8GcFTXExw/TF6GTK27vtesjuBimLpz7BgewYx/Btaz
	RXyKXU1m+Ub/rPiwMnvCBrTSXgVnoGtBqQ==
X-Google-Smtp-Source: AGHT+IGJTX2Sroegj/919OnKxQTWSiHM9vB+M6rqbeRBwjUe0gka+OH1vaFyoLhwEmJsUwZPbCTuYg==
X-Received: by 2002:a5d:4d04:0:b0:337:5c70:8cd with SMTP id z4-20020a5d4d04000000b003375c7008cdmr69346wrt.197.1704451596766;
        Fri, 05 Jan 2024 02:46:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8000:8a34:98ad:54c2? ([2001:8b0:aba:5f3c:8000:8a34:98ad:54c2])
        by smtp.gmail.com with ESMTPSA id w15-20020adfe04f000000b00336471bc7ffsm1137151wrh.109.2024.01.05.02.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 02:46:36 -0800 (PST)
Message-ID: <9e9c76eb3a6c1cc45c4134952060b0a52679e222.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/sstatesig/find_siginfo: raise an error
 instead of returning None when obtaining mtime
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 05 Jan 2024 10:46:35 +0000
In-Reply-To: <20240102145000.741634-1-alex@linutronix.de>
References: <20240102145000.741634-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 10:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193347

On Tue, 2024-01-02 at 15:50 +0100, Alexander Kanavin wrote:
> Suppressing the error and returning None can result in a delayed failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6254/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6262/st=
eps/14/logs/stdio
>=20
> It is not clear why the os.stat() error occurs to begin with (it shouldn'=
t), so rather than
> adding further workarounds, let's get diagnostics at the source first, so=
 we understand
> what is going on.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oe/sstatesig.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 0342bcdc87a..6f124e4f59b 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -357,10 +357,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>              return siginfo.rpartition('.')[2]
> =20
>      def get_time(fullpath):
> -        try:
> -            return os.stat(fullpath).st_mtime
> -        except OSError:
> -            return None
> +        return os.stat(fullpath).st_mtime
> =20
>      # First search in stamps dir
>      localdata =3D d.createCopy()

FWIW, this comes from:

https://git.yoctoproject.org/poky/commit/meta/lib/oe/sstatesig.py?id=3D3df8=
773ed9301b0fc0e385e066a48110900136f7

I also suspect it is possible for a file to exist as a temp file but
get renamed into place while the test runs.

Cheers,

Richard

