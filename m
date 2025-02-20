Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B661C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 22:25:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.10110.1740090305941999308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 14:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFssJqXD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f488f3161so713124f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740090304; x=1740695104; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd4WVio/zkOgu52Ltisa+dm5e9SWPU2sX1fnpnynCXg=;
        b=QFssJqXDlZtCSmELi/JaLAhTa1312OnD8ibo3MOMIfWUi5gW+3REvZQG475U6DtWZm
         oeecyuLwbsYVKUhwOvGrjj1lX0tC+TywF12GflfRMSQt/7W2bIvC1sMT4Cbwq2XsuFbU
         GQ6I97pfYdPZKrmk8m/Iq3jffpI57S/DfmHw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740090304; x=1740695104;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pd4WVio/zkOgu52Ltisa+dm5e9SWPU2sX1fnpnynCXg=;
        b=QmT8PJyucX1qzCI0RHHrYmKIYTcdWkW9s0ndJb1RK0dtrYWrKcbJddKGJuSHZyEsgG
         pvylFRo/xKhroVMTjOyPgbeAoJ8gQ2iIwrobwsvfrimo+1MxHrJmQshTMEcUEf0QxUbo
         4M2GaYpZvYpX/tQ85vIwzOSai8zEqSGzOimW4pb9wi4GSd4HWnCA+ndHjHXEZHOnCBqH
         zkBFh8jMpSCxE+tnBZY26IOACdKIrRT8FuWGfVBirzOzPprNwxGEQtjQPuZUSyjkQ1KB
         tSjnM3ZHm8tjAgm5Y0bWdQy29e7Umcxe+aN50icN8bcW7f+MrbjimsI/nCnUo8At0nX+
         pmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZOT+x9UzimsH+iS4a5ZzOuVOxz4qUZQ74GLB5fi+9VcyPTFDwsdlu2jZ42h53KhtMZSc85EUph2AhWhqO8zGeMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7QMdonjVhm4rYG4zShVb2iKeCD97B8nE0D2qR0WOGUomm2bp5
	MFg5Gz0R8mcfyBTzqw58OcFY9HhxrcskM6bYBiorhqESUT4F8wPtE6XJtXwf1TXPoPOc15TYQCn
	d
X-Gm-Gg: ASbGncsucZfUVcJqiEAltWeHypfg1ZWWV4qZzJ9lnpYvZZjjDOgkJkkjdvOYSA9ThBD
	fONAtdEZ67Ql/uIyTScax3l1BcIuHm/T7R9zBWJ/Tbb+LTFkZsoIeZfm+uNbgsoG1jnvRJXE/My
	UHUriEgpMJBT/4JXs8y5rZJLk343cYnuqNtyDV8pezPUEOecnyK2PqFvp95C5jNuZkSskwG4gkJ
	PW/rZfZkHq/iAkzdlmqKTd7YieWe9nv+UBSZzuDYnvqhVywrcneCBw6iLsydUyF7VJkK4InZTJs
	1gbZqpWo5bQYq0w1sJYq+aq1dvFFU5Yxw6bLRfYOnMMA46AaL3Cp+ISBgzumL2ONIa+5647kUrE
	MKKD0
X-Google-Smtp-Source: AGHT+IFSpNd9wvUbkvqGc3SYVK/qkq+XcY/HhHVMjC/BCO/YD5LqUz+wpLoJgqabLGu0S/j3ggPLfQ==
X-Received: by 2002:a05:6000:2a2:b0:38f:4fa5:58ce with SMTP id ffacd0b85a97d-38f70772a64mr258410f8f.6.1740090304034;
        Thu, 20 Feb 2025 14:25:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:419f:979f:5cd3:2260? ([2001:8b0:aba:5f3c:419f:979f:5cd3:2260])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm42854465e9.0.2025.02.20.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 14:25:02 -0800 (PST)
Message-ID: <0f94a15890010148c5b470c13aeb4c7745bc8be4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Fix sstate mirrors with
 BB_FETCH_PREMIRRORONLY
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jhaller.oss@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2025 22:25:00 +0000
In-Reply-To: <20250210101252.219539-1-jhaller.oss@gmail.com>
References: <20250210101252.219539-1-jhaller.oss@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 22:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211780

On Mon, 2025-02-10 at 11:12 +0100, Julian Haller via lists.openembedded.org=
 wrote:
> From: Julian Haller <julian.haller@philips.com>
>=20
> In case BB_FETCH_PREMIRRORONLY is set, the fetcher.download() function
> sets BB_NO_NETWORK =3D "1" after downloading the first file. This alters
> the precondition for the second and third loop run, disallowing network
> access entirely. As a consequence, the .siginfo and .sig files can
> never be downloaded.
>=20
> Fix this by creating a new copy of localdata for each loop run.
>=20
> Alternative solutions would be:
> - Setting BB_FETCH_PREMIRRORONLY =3D "0" in localdata
> - Setting BB_NO_NETWORK =3D "0" in each loop run
>=20
> Both alternatives are highly dependent on the concrete implementation
> of the fetcher function, thus making them likely to break in the
> future.
>=20
> Signed-off-by: Julian Haller <julian.haller@philips.com>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 7 ++++---
> =C2=A01 file changed, 4 insertions(+), 3 deletions(-)

Thanks for the patch and raising this.

Having looked at the code, I think that rather than working around it,
we need to fix this in bitbake properly. I've copied you on such a
patch, testing/review would be appreciated.

Thanks,

Richard

