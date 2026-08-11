Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523D0C5B569
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:09:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48913.1786432144616853596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8sHh9kX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4957eefd361so20146055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786432143; x=1787036943; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AY7tfrSKV7m+7zE+P6XUAtMpBqlGY/f6ohB9zCY3Lz4=;
        b=M8sHh9kXarmI6aovwS1OEGpJoWKrP8bOvSd0Sow/oW0PMiH2PP6L5L4toVSQo9aIKn
         cTUdEfQ8YLKh8P3ucQs0het57tIQjgE7Y3OWZfPVdlAcmp0A/JRK3p2yNh784yyVxH6X
         MH/7CpE2eelaF302lx8cAAoq9VJUHQYejwqng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432143; x=1787036943;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AY7tfrSKV7m+7zE+P6XUAtMpBqlGY/f6ohB9zCY3Lz4=;
        b=FzDc0SEXAJ/sfiP/ohkCF6vV6lP7nTRLV5ybmMHRTubATTr5R7BZlXi6RaPq7tMhfP
         MlwdrrsqWF93c+3OYvrsipJ6hpS72atI/I+VzJ+GjNLRUnAfj/ncSTKKvkZq94OcDgXL
         dIlF33clQ6r2FEGL43xZuENxp+6zcStRhXuHdWhvN9kEKS6HKhiOvMQ6f0ado7p+26WF
         OeSUQbZqTHDFp1JuLRYFHGMESmF3R0/CAXPxUvSMU9YrvpMZQmNFdov0yN9Kv6Zj4/KZ
         sQc33OmWgYa14HkFh5uhSeMzpebw4xkx/X7k7LrhLtvi5nu5IQ2JEeMcnjfVMYep+rHp
         bb+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKl3abI2XkzkvL2J4jLVvcV0hD6zXTpD8kwRks5ZC41uPjvLOAdITDS0Novb4W2wPx0F1+V4DE8Vktf5EvTPH6TQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSk9xmpCm5O+JNY/E+6AfiCQ4cLQraQcaKEZjLl5VmDTkFCjRT
	IKtgJxWNSV/z5uTzhQsLMsjTv579dp3vpRwcQpcftQDeTvP+RgJuEFWSs+/laBvQYPo=
X-Gm-Gg: AR+sD137/sWLl0WEeABUCZ8FWVBEmw46kvZco21T4Mrs0XpYei56AWX+JBoBz+67M2S
	04bIb3Od5SvgNzoPaAZHXc1gueiCOiz6p8/qCj/hP+Gy6kr6dnvxOHaDb60ye4bcwbKeiwHZL3A
	1RNLl9HHX2tVHPVWCDPkjzIJUOU7oi/Lv/dJzA04ji6rXqqW64IEd0pBWFFdyE+hY/CqE/7x9OP
	rtJxMFNvccc6W9oUJogp4sET6iQTt1xbA5zZijvLprXCIVgUe6qjCP7WzRd4R+twYLxWd8j0GFp
	W8FAmhmSbFyvbeXxBVzZmR8eiXd8d7x7hU9IMzaKvvlWw3/Hu5ZGzAvTiBahBQsRuuqsTiXdpQ3
	lFy03RsS96eh453RrRPgt/FR/JmHyD/PswljzW8QCtv1OahzRSMcrVG3R/xWua5e3BRXPHa2/kT
	dnzJED6G99D0ixumJxTe88tNAz/RT3MgFLqXdnCmjIglMSlG7QgXufX+3P9Zw8jp1JWukivINSO
	tYijCrKHGwWbQjXFWupidUczG4Q0CvY/5mUh7AbiqQqqXa28hGqcQ==
X-Received: by 2002:a05:600c:3553:b0:499:7312:2d5f with SMTP id 5b1f17b1804b1-49978494c8cmr15507205e9.19.1786432142796;
        Tue, 11 Aug 2026 00:09:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a? ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c4a87sm43958475e9.5.2026.08.11.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 00:09:02 -0700 (PDT)
Message-ID: <80c4628227ad5d46f784e06f5804209b38af9f7b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.58.0 -> 1.58.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2026 08:09:00 +0100
In-Reply-To: <20260810130443.796578-1-ross.burton@arm.com>
References: <20260810130443.796578-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243154

On Mon, 2026-08-10 at 14:04 +0100, Ross Burton via lists.openembedded.org w=
rote:
> Overview of changes in 1.58.2, 05-08-2026
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Test case fixes
>=20
> Overview of changes in 1.58.1, 03-08-2026
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Require harfbuzz 11
> * Require glib 2.88
> * CoreText: Support variations
> * CoreText: Support font features from descriptions
> * Renderer: Keep over/under/through lines in sync
> * Fixes for undefined behavior
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../recipes-graphics/pango/{pango_1.58.0.bb =3D> pango_1.58.2.bb} |=
 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-graphics/pango/{pango_1.58.0.bb =3D> pango_1.58=
.2.bb} (94%)

I confirmed this caused ptest failures in all librsvg runs, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4242

Cheers,

Richard

