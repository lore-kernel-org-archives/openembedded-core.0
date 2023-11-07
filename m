Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5237C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:15:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.8800.1699359347920800161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hkqzt+PB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a62d4788so7548623e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699359346; x=1699964146; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CyNn3yWKTMYIwhu+FVQMvAWVVcvJB2Y5xBoe5giHlUs=;
        b=Hkqzt+PBplyibWXJU+1gRRg2lfhYq1mdTai3JS2H2Ft46PjsOsV2v1buRTTf1fRGQy
         QqlqgE6ZUz3TU8AhwblCkfQMKx10F+Em5enZYlm9EycgSpvWUnH4A5DWiak6DBKtnUmw
         2Jjqc1pW9wpB5hj7wl4FBAmuRkDJS/RkFXn94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699359346; x=1699964146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyNn3yWKTMYIwhu+FVQMvAWVVcvJB2Y5xBoe5giHlUs=;
        b=H+pEvOZO892cu+4bdwiIXWztygDLfPWuez2HwyEAT2aB4OFaWixL6x01jG8ILDr4Lx
         zPNsmb9qD2rsC4Xd7f/uwNLLktscbM7B6VXuei6N+Waj8y4u7ADiYAIcDt4Kj9iU4WQr
         IZ0NMRYWLtWnTk8eMz16FZZINyWOLmYNZE3Mc7tuKrP06VFyq4qn72BXf9IZ64qaXsqN
         JGDANLLLzCVraTjnYq9O+aFD3nHxN8kR9Fe5DBBZw/J2IRUIwithGclGdfodC+o45sYf
         NleIRtZxHUIH9ouo3PjrRA3pZZLdJVBRs5q7y8HZy1Cfg5Pp6u5qFs1NW4KxDzcrjD80
         kfGw==
X-Gm-Message-State: AOJu0Yw9BPEroZMn3RLJkCU5LYmvmI4RDgvrgtwZRAu6lRTderavoVYK
	A4ZIlqIiXfKftVGVFP2Ru3EeBA==
X-Google-Smtp-Source: AGHT+IGd9cMJ37183vB7LG/srdwFbAI4IQ0gIyRdct2yV4sYlMTplyDmbLHhWAZcSVWehjJmg6WZDA==
X-Received: by 2002:a19:f713:0:b0:507:a33f:135d with SMTP id z19-20020a19f713000000b00507a33f135dmr22830541lfe.4.1699359345932;
        Tue, 07 Nov 2023 04:15:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4a5:26c0:cc7e:6810? ([2001:8b0:aba:5f3c:e4a5:26c0:cc7e:6810])
        by smtp.gmail.com with ESMTPSA id j16-20020adff550000000b0032da35baf7bsm2197505wrp.113.2023.11.07.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 04:15:45 -0800 (PST)
Message-ID: <88e139f8a5d37305c4d0b2156d4964df34cbb830.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] udev-extraconf: mount.sh: check if filesystem
 is supported before mounting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke@weidmueller.com>
Date: Tue, 07 Nov 2023 12:15:44 +0000
In-Reply-To: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
References: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190274

On Tue, 2023-11-07 at 13:00 +0100, Lukas Funke wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>=20
> Check if the filesystem is supported by the kernel before trying to
> mount it. Systemd-mount will mount the directories asynchronously
> resulting in stale directories if the devices filesystem is not
> supported.
>=20
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/recipes-core/udev/udev-extraconf/mount.sh | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipe=
s-core/udev/udev-extraconf/mount.sh
> index 989fabc194..59563b7511 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -36,6 +36,17 @@ do
>  	fi
>  done
> =20
> +is_filesystem_supported() {
> +    list_fs=3D$(cat /proc/filesystems | cut -f 2 | tr '\n' ' ')
> +    for fs in ${list_fs}; do
> +        if [ "$fs" =3D=3D "$ID_FS_TYPE" ]
> +        then
> +            return 0
> +        fi
> +    done
> +    return 1
> +}
> +

We once went through the init scripts and carefully minimised all the
fork() calls in them, since all that process execution overhead does
mount up and delay boot times.

I really don't know what to do, whether I should continue to care or
not. It is easy to say systems have plenty of memory/cpu and therefore,
"who cares?". Equally, systems working efficiently is nice to have...

Cheers,

Richard



