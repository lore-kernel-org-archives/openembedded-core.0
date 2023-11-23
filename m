Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5232FC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:46:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.99050.1700761601438379950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 09:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SV8Nqttf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32f737deedfso623077f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 09:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700761600; x=1701366400; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dvj3AMDPQ9oun4LfslpzESpVgcqmSHmutw/fWkyxsC0=;
        b=SV8Nqttf+2ymYD6Z/o5sQzdIz4TGP6GNd8/T2ldvPxsqSZW6VnUSF1xoNlzGOj1Ihv
         j3gpaEyQvbGhkqm4xTzUO3zJv0gpY6WJGX4TAXtfVeCpC1nlUeTX8XlRfxxhxOGxuJUZ
         0ofZTAOxE+v7yhOHuw4qVWJOgOJ5J2SdrLJtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700761600; x=1701366400;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dvj3AMDPQ9oun4LfslpzESpVgcqmSHmutw/fWkyxsC0=;
        b=NlpNIMeEFoMyBb9xhBnEx7me0YkFWK0sPuouuF4uTpelT+ZdCs8gIt8Arw6spFSLkU
         eKSs2a6zQyygQJFb4Sc3UVeq+Yks0UoF3lkxkk8X2sfra6atoOkwgVgzvBZYJ2RDFeKa
         L3irP5yEhff0zMM9WbANDYDlgN5HbKUoyo4kq8v+DUw5oyb3NA5efOBFUuIzo9AeAYUn
         KBHIAQIMoYpdbeTwOIHbT0xoFBvEyyqPXpCKn7H37mJll9hzPm/TdVMH9d789aUGBNxL
         szP3RAyXEubz7v1grMeMtdpS/wN1xXzgSMeSVN3JIOtBmvS/m7h9wV+aFKZXFbrROfbU
         /kBg==
X-Gm-Message-State: AOJu0YzWrtNadR7Gsz9ltVBh4nl2l66cK3Gh32h1CKEhXMBccp+hd7m3
	fuCwkG57jv9b+XnVHiPhMB4B7Q==
X-Google-Smtp-Source: AGHT+IFgYb95DtYwztzsqv7PMR0TWo2CjyViaEx67twWGxj/2gAGe0CS/BRuhhvjwHwYj6Tj+YiC4A==
X-Received: by 2002:adf:eac3:0:b0:332:c2a0:c0d0 with SMTP id o3-20020adfeac3000000b00332c2a0c0d0mr146912wrn.46.1700761599730;
        Thu, 23 Nov 2023 09:46:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id r13-20020adfe68d000000b00332cbda1970sm2199536wrm.30.2023.11.23.09.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:46:39 -0800 (PST)
Message-ID: <1a27fc60e22d0ce02d5512e015c6481707a171b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/1] wic: extend empty plugin with
 options to write zeros to partiton
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Malte Schmidt
	 <malte.schmidt@weidmueller.com>, Lukas Funke <lukas.funke@weidmueller.com>
Date: Thu, 23 Nov 2023 17:46:38 +0000
In-Reply-To: <d4ac3df6b09be317ec7530694c6815a2e128ee8d.1700646304.git.lukas.funke@weidmueller.com>
References: <cover.1700646304.git.lukas.funke@weidmueller.com>
	 <d4ac3df6b09be317ec7530694c6815a2e128ee8d.1700646304.git.lukas.funke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 17:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191173

On Wed, 2023-11-22 at 11:47 +0100, Lukas Funke wrote:
> From: Malte Schmidt <malte.schmidt@weidmueller.com>
>=20
> Adds features to explicitly write zeros to the start of the
> partition. This is useful to overwrite old content like
> filesystem signatures which may be re-recognized otherwise.
>=20
> The new features can be enabled with
> '--soucreparams=3D"[fill|size=3D<N>[S|s|K|k|M|G]][,][bs=3D<N>[S|s|K|k|M|G=
]]"'
> Conflicting or missing options throw errors.
>=20
> The features are:
> - fill
>   Fill the entire partition with zeros. Requires '--fixed-size' option
>   to be set.
> - size=3D<N>[S|s|K|k|M|G]
>   Set the first N bytes of the partition to zero. Default unit is 'K'.
> - bs=3D<N>[S|s|K|k|M|G]
>   Write at most N bytes at a time during source file creation.
>   Defaults to '1M'. Default unit is 'K'.
>=20
> Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)

This is probably reasonable but it needs a testcase adding to wic's
testsuite please.

(run with oe-selftest -r wic)

Cheers,

Richard

