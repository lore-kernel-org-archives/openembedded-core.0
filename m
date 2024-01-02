Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81970C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:34:28 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.31454.1704209664318679475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IXDIDYIb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e77a2805fso6518423e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704209662; x=1704814462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IrXhqIpexH08U0GMT9iXz9ihGeKppptRsoR2gq8cMs=;
        b=IXDIDYIbhE+S2SXOnLPmQlAtF4McxY7yALUEegOe2OcrfDAw1lnbnquOPTO0hV0vRp
         X4xo45KAn5TIvvIXoigiSNzp8GJ6djqVPXixcrwAHFAAFv+b7wMJGYPonMFNH8Vo8yy4
         xFS1epkePJh/7g5SRdVParYmtiqV0sGF97/eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209662; x=1704814462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IrXhqIpexH08U0GMT9iXz9ihGeKppptRsoR2gq8cMs=;
        b=WkrfQVzI0xtEpjHYKNGVAzMURFqSfxegxQkr3NFFkjWV58A/FL0QIl+Fj9ZKpjkaue
         hJtTkV7NuYJpZZY6M5QUxwZC3+LTpgc/hKoasdU3aAicXtYyePb9aYQcX1+R9CUl11dZ
         lfxZWiNEO1m+jUrxYrTH03VRqzSSaiB/uGnts3YszbVnP7868U7WT2cEz9hNO58fFg4M
         Kg7UF1i9PQ77d18UzQokdUJn7YGff3Z2ktWPetVzHECbYMIKc3zNi7COpZhSXTf8csAB
         J/WeYnOF/Drp/EizxBIC15h3EE5ug9IBPwSM7P0fH60OsqcDlYh6BH08PJL5rFUiRy9x
         byYg==
X-Gm-Message-State: AOJu0Ywbxb9NhkX68RuzqfcV6W/98Ngir1AVvuLQ4aXC0iD+PoUOg2mg
	kpkp6x1HszhSow2ufqawBFbtTPM8Ul2y0jSkP65I+goNMn0=
X-Google-Smtp-Source: AGHT+IEHX4Lbs2L4P6ubyNk8Y1gKn5o7mupkTZk0o9DPMp0kcgenEHTTZoq2bTzagNtGLLUDJ3xuWg==
X-Received: by 2002:ac2:5dd5:0:b0:50e:532a:2c0d with SMTP id x21-20020ac25dd5000000b0050e532a2c0dmr4566298lfq.177.1704209662323;
        Tue, 02 Jan 2024 07:34:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbfd:7888:db42:b332? ([2001:8b0:aba:5f3c:fbfd:7888:db42:b332])
        by smtp.gmail.com with ESMTPSA id r11-20020a056512102b00b0050e3ef5fdffsm3686217lfr.118.2024.01.02.07.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:34:21 -0800 (PST)
Message-ID: <cb8e91d0ac9ad995d5e54529c7aa986d0ef346f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: CHeck for additional native
 perl modules.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jan 2024 15:34:20 +0000
In-Reply-To: <20240102112135.3594972-1-philip@balister.org>
References: <20240102112135.3594972-1-philip@balister.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193242

On Tue, 2024-01-02 at 06:21 -0500, Philip Balister wrote:
> Since we use the build systems native perl, we need to check that all
> perl modules required for a build are installed. For a default Fedora 39
> install, autoconf-native and libxcrypt both fail to build due to missing
> perl modules. After taking careful notes, this commits adds checks for
> File::Compare, File::Copy, open, and FindBin.
>=20
> [YOCTO #14691]
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/classes-global/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 9b824915f2..57353b9478 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -532,7 +532,7 @@ def check_git_version(sanity_data):
>  def check_perl_modules(sanity_data):
>      import subprocess
>      ret =3D ""
> -    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
> +    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Dumper", "=
File::Compare", "File::Copy", "open", "FindBin" )
>      errresult =3D ''
>      for m in modules:
>          try:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8418

Cheers,

Richard



