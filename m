Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B2DC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 12:48:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.21701.1751546912226478321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 05:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bDrCYdkY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so4740105f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751546910; x=1752151710; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v+lBEE0RDPbaFfaUst83Zslwv3XiQIHFg7iIxPxOMs=;
        b=bDrCYdkYzBbz5y0U9a2RXPkpjsqm+I84xBq+I7MoQ4zpxUxh4rkW6RfxDQ2xQOt22/
         LRW1Ta+LXiOXgtOn1PiWzOzWjUWcvP+lHmSmwGK7SZUPQ7Xsynm0I483s6tU+yTs0lse
         VECc8HjPoOlWfaQgczu265D3WucUyZ7EivoCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546910; x=1752151710;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7v+lBEE0RDPbaFfaUst83Zslwv3XiQIHFg7iIxPxOMs=;
        b=RY+a1mFVCvHDc8mB1zremIxr7bckTLNHSzdPOpgsf2+x7GRnU/1gjrEZywIqvcB5kE
         xhsTotng8rZpzQ9+miERz952Q5mE5jnLzNX6E9MHjGiT6Zk+/05X4/qpOOcOOWntmNZG
         KGc7YPiEjZWViXI5YIEP2tBzJZoD/xqDnUDHAzeU/THTPkFuB7WKwJsT1AmekxEZOrnu
         DKyZOe3XdaIyF6uqJsVOtcm4DZ3E3sW66DqhZus0etzumsdvnaOS5cT6qVacvKbe8Aq+
         dDNZ8rKoy5jJUktgPUksMF5yrGVkLlNTcr6GUyXIC7d3amYDmiAzVsd6m1mkmhx0mzDG
         G2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiwsAoodFUHmQ0RWgN8sli0aIfZC+qsa1fhyU8VThdDbubQScDrWDyy5VZgnLjDwkMH+vxtQeTzjqq/lmthzXDhQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr34lu34qP/L8/g77dtE58Ap4jGtH5cFGwEuIvSETdiL/JuriF
	PZNHhVorawo7+oAD4Rhlkh8hIRN5zj+BYBCsJa/aeuQEcmYq/baAXOIlrSLKRtiAyS0=
X-Gm-Gg: ASbGncu2yF7P9TMtuydr8zOvNnCg/B38pb4RDsnlaCu+rNMvRam7UNHmJn/8tpjcuhb
	m8Cvc2LrPMBjNU+8DxkXjtiCe3qMxzN/JOTdJAxv4BpOjfJkn4FuarlM/JOlBNHmiziFA9gkl+m
	2BzivRSC+YPVu9N/LgWpEJU+Ve35icCwZMtsnz//uRAd9bQDgeC5kgTr9dgDAYldHhIr4PgRgvY
	yRAyEDhpSLXbvMFOB5lrYL+oJz2OYnoIsytEOa3aUchZtVTEGyaSZRn4CVkHA/WCGjb7eFP4/3O
	R4G7Xoc4lGKZFzjsOsGLd5fMM5IXYnZXKLqhOWuBCloSX6wywvJ6Xc4WpM/j20uf7DBYtlzSTOY
	eHrx/QrXB8DwL9n1Y1CqAKIUnceLK7X25gKKijKCY4tnrID8A43o=
X-Google-Smtp-Source: AGHT+IEC8ZUcAxeX03NwNzzNYgQW0t3k203Dr+dGMlgf/gFJE3uzS3zbWLf9qJOuldU5ZClUKw3txg==
X-Received: by 2002:a5d:5f8f:0:b0:3a5:5fa4:a3f7 with SMTP id ffacd0b85a97d-3b201e84d87mr5056195f8f.58.1751546910442;
        Thu, 03 Jul 2025 05:48:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9f6:56ec:1d33:85c3? ([2001:8b0:aba:5f3c:e9f6:56ec:1d33:85c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8aasm18356045f8f.27.2025.07.03.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:48:29 -0700 (PDT)
Message-ID: <873ee72d2286c43d56fae9b6de218c9c4a472bd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add relative path from B to S
 to DEBUG_PREFIX_MAP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michalwsieron@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 03 Jul 2025 13:48:28 +0100
In-Reply-To: <20250701112317.1204143-1-michalwsieron@gmail.com>
References: <20250701112317.1204143-1-michalwsieron@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 12:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219878

On Tue, 2025-07-01 at 04:23 -0700, Michal Sieron via lists.openembedded.org=
 wrote:
> Basically since forever, meson uses relative paths when generating
> ninja rules [1]. This breaks prefix mapping that bitbake sets up in
> DEBUG_PREFIX_MAP. As a result practicaly no files are added to the -src
> packages built with meson.
>=20
> We could add it with :append in meson.bbclass, but then it's not really
> possible to override it (DEBUG_PREFIX_MAP is defined with `?=3D` probably
> for a reason).
>=20
> [1]: https://github.com/mesonbuild/meson/commit/8d1641d6a42e0a5f6db03bc38=
d252d3712195929
>=20
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
> =C2=A0meta/conf/bitbake.conf | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b1f8ac5b11..0ecbc8c71f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -656,6 +656,7 @@ TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> =C2=A0DEBUG_PREFIX_MAP ?=3D "\
> =C2=A0 -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> =C2=A0 -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> + -ffile-prefix-map=3D${@os.path.relpath(S, B)}=3D${TARGET_DBGSRC_DIR} \
> =C2=A0 -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> =C2=A0 -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> =C2=A0"


This worries me a bit since going from memory when we originally
implemented this, the use of relative paths shouldn't matter, gcc and
other users of file-prefix-map should canonicalise paths before making
comparisons. If it doesn't do that, there are so many combinations, it
doesn't make sense. As such, I think the bug is elsewhere and we
shouldn't apply this patch but root cause it...

Cheers,

Richard

