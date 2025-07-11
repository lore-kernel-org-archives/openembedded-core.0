Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA36C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 21:25:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.24694.1752269148065452220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 14:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ly+ZuAer;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2381870f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752269146; x=1752873946; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6ZYknzPSLn0azA9/0AJUaFTMldOhPQc05qx6KS3fNg=;
        b=Ly+ZuAer7INvmho2qeva90TSaINwLQ2UHot4gYtiTMz7TcNwkfCwfrISKNSHqQx2cb
         1gBEsPw4CP66QPnQai21hp1F4iVNFcb8B5RMo9Hc7rbcitXdRoyT6UqnTEeWQzu+6FOm
         faC5G4yJP0POMMLL4cmYN77KUUVnAezVSwkzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752269146; x=1752873946;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6ZYknzPSLn0azA9/0AJUaFTMldOhPQc05qx6KS3fNg=;
        b=c6veywqKAv/8TTw7fZu93Rye2bd52DEO2VNVnG3oNQWQxQJpltgwTxRDK+qlmFpGgW
         W04rLiYFV3cgb/Xs7WjHWewOmtNU/13no/7yGlXSm+YvK0eFsXhh6JVqsFA38pOPFlQV
         NzSL2mCoZgoOk0MMqgQ0inFGuEl0myFB7r9XvgLnfubr5CHiHm1B7biLg0VqQGupneP/
         I33INakEssRmmoU7fAQm1g4ZVFBD8fIDFa2ICYlslU8LZlzG2HpftU2AkIuVhyHoHxxL
         l2Jv+KPcVaK11r+cCXZW/prsWArdHNfhd2IY5EwIsrKPPjyBY0cgvRwc2fPcPc5fRfb9
         vmjw==
X-Forwarded-Encrypted: i=1; AJvYcCXkxPv/T1M26WYWYdz6FIqa0qKnaY21YkHv//0aPmImWYR1ENue16NTyBif8tORaXohf1qPc+n2XeRmHUeQLG6eTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJURpFhSNPnBS4Jw9OOGAqf3k+SO4I8w53ueDqF4z4WUXrz9PY
	aWa9zycK0MFhpe6nJFE9Vho4y3+PBSLnQB5xQWHzcrEc/cfoqG6PuZxHtdq+XE8FfY46G0VvGGg
	03750
X-Gm-Gg: ASbGncsLd4WJWnQXwmPrBG8RluE8N1xFWfFqfgAw6J5PJ7oE666doa+7BmZrglJgJwt
	h5VrO5eo0tXRJCJNiMhdL0E8it5JiALiSB2y34UCo3m+63goFuntjCRv4zdCGN3L7J2Eu9tgoZq
	wcH+ZHe6wzrisGXU6S9bAbdzcXEEpZJRT0/sVIsOWozKizVG8W9hOwFkjh8J+TyJNkl/fvjeRog
	4Q1UrwgHaRZebnSQq1OMIsZQyLHPonChPGfCldbIIyRoOUOiyi7K0VSXo8b2Ftuh00dIWr+pxHN
	w6T67f2MGywU0Ytd8+0AACJVgsS6x75QkzDdMfsoTDli7/hH5D686JUmGusZqRDKqn+nB8H4Hxm
	EK18mGp+jnQ/inIi+NWSsWy6Gvv05SHsnjCgS/73jXIJHqymNEe6ewLqJFe8qpB0QqQEY6fWXUH
	PUIUPeQmpg
X-Google-Smtp-Source: AGHT+IH8DGLYiUIraOk++d2s9srW04sKh+lbfxy0yTls3zymrK6s6RJU80W9F2IX41/1WPvFSq33kg==
X-Received: by 2002:a05:6000:26cc:b0:3a4:efbb:6df3 with SMTP id ffacd0b85a97d-3b5f187d0b9mr4436735f8f.10.1752269146242;
        Fri, 11 Jul 2025 14:25:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:785e:212:efbb:e6e8? ([2001:8b0:aba:5f3c:785e:212:efbb:e6e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5f16a6016sm3527359f8f.69.2025.07.11.14.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:25:45 -0700 (PDT)
Message-ID: <500d60d8e1c98dee239ad1ccc372bcd85b1dda95.camel@linuxfoundation.org>
Subject: Re: [OE-core] are all of the download URL variables still valid?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jul 2025 22:25:43 +0100
In-Reply-To: <85e947fa-2013-1f13-e2b7-38d55bf7e3da@crashcourse.ca>
References: <85e947fa-2013-1f13-e2b7-38d55bf7e3da@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220169

On Fri, 2025-07-11 at 16:31 -0400, Robert P. J. Day via lists.openembedded.=
org wrote:
>=20
> =C2=A0 was just perusing bitbake.conf, and here:
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.con=
f#n693
>=20
> there's a pile of alleged download URLs that may nor may not still be
> valid. I picked at random "XLIBS_MIRROR" and that variable is not used
> in any of the layers i have checked out. is it worth checking whether
> any of those can be deleted due to obsolescence?

I'd love a patch!

Cheers,

Richard

