Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7CEEB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 10:18:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.38723.1687515491942313392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 03:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=V3pw9gJR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so5240035e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687515490; x=1690107490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C7BXYaffxQMwDI9MtJSX5xYy0haMnTI8xFAT6T5brE=;
        b=V3pw9gJRCHgKjtWHUV2jxPqPBfpsWiJkhIQeqQLf3V+wMV398dcB7xP+OOrqpwT4CE
         HWuDi6Bxj2Gb5rLe9s1oEHrDbX/czW6yC5ZpCtPnO/irqan1E5yuQyU1XaBj2fxBkR+x
         0mYRMQyftpc+guPl/+jcHclYO1afcyrpDV9M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687515490; x=1690107490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0C7BXYaffxQMwDI9MtJSX5xYy0haMnTI8xFAT6T5brE=;
        b=XjhEfsD6Onb/BqxQZ8PH2vPDmrMU1UwWMup4a/nIG/SoCj3bAgpmTXaOcXFg6KuCvZ
         dq3l1/aFOTMRXTF4wPQuxPcikTqxxJ9PKuRuTc/Q2HTtNL5O4h6y5SRGxouJWpEc4q6y
         SC7aSo4aGNAmIG6vQD3uXLq1RYcsn5Ykla7SxsivHz1/N467F2BYtmg8yaGLwTbR0wZD
         EeknzlJ4apnGXubwaP+Cj1Kx2/4TBNsrTxK7SOPUb25zT/uCbF2KARjP2VLsEUhje+gE
         k8lhNRZPEDk5PxsG7quZxORkzfDzEwLDOQfhEYL4j+GpujhhDnr7tNAPxpc07RI0zO0d
         ToQg==
X-Gm-Message-State: AC+VfDwn7uSijwHjjazJ4F9J5ozldiuQsxmYQqn00SEUrlGFBywnzk6O
	nTaC4784hhIxxMNzGXkyLjbqLQ==
X-Google-Smtp-Source: ACHHUZ7YYZGjrceXy65ciMqJuzpsMjRAZy/4ygQ+2kwFIXBYpYJFGaE4/HIHGTSQbXxDNdFkokWZng==
X-Received: by 2002:a05:600c:22c6:b0:3f9:b1e7:8a4b with SMTP id 6-20020a05600c22c600b003f9b1e78a4bmr3664347wmg.21.1687515490314;
        Fri, 23 Jun 2023 03:18:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb7:8756:e8c1:1c97? ([2001:8b0:aba:5f3c:aeb7:8756:e8c1:1c97])
        by smtp.gmail.com with ESMTPSA id l19-20020a1ced13000000b003f78fd2cf5esm1894478wmh.40.2023.06.23.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 03:18:09 -0700 (PDT)
Message-ID: <35c96621a643bc6ef527eed83cc420eba85075ca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uninative: call patchelf-uninative only when
 needed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2023 11:18:09 +0100
In-Reply-To: <20230623093323.4058529-1-Martin.Jansa@gmail.com>
References: <20230623093323.4058529-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183318

On Fri, 2023-06-23 at 11:33 +0200, Martin Jansa wrote:
> mke2fs.real, mkfs.ext2.real, mkfs.ext3.real, mkfs.ext4.real are indentica=
l
> binary with multiple hardlinks and we end calling patchelf-uninative 4
> times even when the interpreter is already set correctly from the build
>=20
> To avoid corrupted binaries created by patchelf-0.18.0 when set-interpret=
er
> is called multiple times (on some systems like ubuntu-18.04 this leads to
> segfaults elsewhere just ldd complains that the executable is no longer
> dynamically linked, but doesn't fail when executed).
>=20
> The issue was reported upstream with mkfs.ext4.real as possible reproduce=
r:
> https://github.com/NixOS/patchelf/issues/492#issuecomment-1602862272
> alternatively we can revert
> https://github.com/NixOS/patchelf/commit/65cdee904431d16668f95d816a495bc3=
5a05a192
> and create new uninative release with update patchelf-uninative, but
> better to wait a bit for upstream to have a look and possibly backport
> proper fix later, until then this change fixes the mkfs.ext4 issues I was
> seeing in kirkstone, mickledore, nanbield since uninative-3.9 upgrade, as
> reported in:
> https://lists.openembedded.org/g/openembedded-core/message/182862
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes-global/uninative.bbclass | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/=
uninative.bbclass
> index 366f7ac793..b54acdd542 100644
> --- a/meta/classes-global/uninative.bbclass
> +++ b/meta/classes-global/uninative.bbclass
> @@ -175,7 +175,12 @@ python uninative_changeinterp () {
>              if not elf.isDynamic():
>                  continue
> =20
> -            os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
> -            subprocess.check_output(("patchelf-uninative", "--set-interp=
reter", d.getVar("UNINATIVE_LOADER"), f), stderr=3Dsubprocess.STDOUT)
> -            os.chmod(f, s[stat.ST_MODE])
> +            current =3D subprocess.check_output(("patchelf-uninative", "=
--print-interpreter", f), stderr=3Dsubprocess.STDOUT).decode('utf-8').split=
('\n')[0]
> +            if current !=3D d.getVar("UNINATIVE_LOADER"):
> +                bb.debug(2, "Changing interpreter from %s to %s with %s"=
 % (current, d.getVar("UNINATIVE_LOADER"), ("patchelf-uninative", "--set-in=
terpreter", d.getVar("UNINATIVE_LOADER"), f)))
> +                os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
> +                subprocess.check_output(("patchelf-uninative", "--set-in=
terpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=3Dsubprocess.STDOUT)
> +                os.chmod(f, s[stat.ST_MODE])
> +            else:
> +                bb.debug(2, "Interpreter was already set to %s in %s" % =
(d.getVar("UNINATIVE_LOADER"), f))
>  }

I know why you've done it this way but ideally we should make patchelf
handle this internally? It would be nice to avoid fork calls if we can
in the long run.

Cheers,

Richard



