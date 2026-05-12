Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC248CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:49:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84269.1778615362499206279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NMYSI2GG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso54424255e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778615361; x=1779220161; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxMtbh3iAEVM3XTvAoJIlv/DNyx78/MtQdpVcLi/sQA=;
        b=NMYSI2GGOooabq6L9cdO2IwBlZzgq2Jnyl/mNOR5ezXNVN/UCEB+uVvVaJLSgRCaFr
         yA0k4FeLOfoMe50hg42Ks5iLaQ+SyzRiDleONAJPNBFdZxqIr+mkMBYZ78hhRj8KJA9c
         7qr9S4zKEa0jOFkSFwl0nJdk7z48gaMmECPFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778615361; x=1779220161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxMtbh3iAEVM3XTvAoJIlv/DNyx78/MtQdpVcLi/sQA=;
        b=lMmOenpvniSOKm01FQgdj/vde6vl4Oh+c9qo4Qg/Pl0QLCUjg/APXxP0onvD481On8
         5xtBsO6xKMW06463T4MOSZyid9TLLQzeZxyKO8MrJLhbuYYxSf4fswYPZs0hfepjxWj6
         JRcaNy0LjZoIC4Jl0Djs3zRVCHB43zou33WrTQup76s9C/i6NE/r5O0khytQTKyncZKK
         2vfOl1vTm05zWqTBuzgCBwUyqgGiIPovhlz20NfNWMK0wgpP/Cql7VK3FQk5sEqZpjl9
         8OZCVFtq60rDb5/49ddQmQY58TXg0Gx4jV2sw5xh0m7PEPNmhQEhyriNXw4hkLpjmz9F
         TCDA==
X-Forwarded-Encrypted: i=1; AFNElJ83PyP1eS8A58lb6fULLYs0A2KF0kM4kLoae2+8Z8j4xkQTR1huJJIEubxUWd/BcpctTPlbD8Ouf5X+PTvpJEjRSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YytFd7N7sOr/t/+bJmAbTcopnHyMhMEdARGudykAyHXlu8MNXTw
	S/Oou8WFfojT3Npn+6lfvZFvnpxfarDBBiZLT092dperRTsfL8amjCuUqksUS8RbUWo=
X-Gm-Gg: Acq92OFypSJy8kwSs9ERpT/k/nUmc5q7sOLW6ULjcFHgIA7LGQRZth6SOH54DGZdB8m
	obfSDKxViOvYROQAveSbazOuwVagzqnOEIiOvijplCBI6LVgxa4G1NrBp8C5Iwhr/ZJyWeZwlSS
	rPvqplOXnIcUktx+ydNRaxEuH3fdhBvSglioK/2euIVKQJpKiCAXulbhaNaYtPnG40qfqv3PIo1
	jJJApeQ5eWNsGwCTu0l7HNW3VK/ble1mhevCNkuCqyhd+7A74zGI7Qx0TKg+LKG7DjAyK0IOYce
	LJzbwe2Tx30xoLyEEqdHrB9n61ktD1q64nz4Z6jU5r8ylzFJBDeaMK0VZJZtfmNCW7xVUZAQNIB
	06bVLONN20EaNxJ6oXtBXTZN5Kw+ah4ctOd3IV+FKArajpwdQeBBn+kV3lOUFJ0c3NLrQj5UEoP
	tRVR3sGHaiigLnBtxvXqduX0mn8a3/VtXqHo7QPd7R5jheIhK51UV8iRQ4Ijgg1vJjM/LD+odiO
	/qlwt9+or/3m0Xp
X-Received: by 2002:a05:600c:4f93:b0:489:1fa4:50c6 with SMTP id 5b1f17b1804b1-48fc9a3d30dmr3870175e9.20.1778615360758;
        Tue, 12 May 2026 12:49:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:87b6:da5a:2bd9:3c4b? ([2001:8b0:aba:5f3c:87b6:da5a:2bd9:3c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5efe57sm42272975e9.2.2026.05.12.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:49:20 -0700 (PDT)
Message-ID: <2fc29d67622c753049478f8d1a399120310f281f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] Add support for USERMOD_PARAM in
 useradd.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2026 20:49:17 +0100
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236912

On Tue, 2026-05-12 at 21:04 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> This is my proposed solution for groupmems' lack of support for the
> --prefix option
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16277), and the fact
> that groupmems will be removed in the next version of shadow.
>=20
> The first three commits make a little bit of clean-up to
> useradd.bbclass and then add the support for USERMOD_PARAM. These I
> would like to see backported to Wrynose. While technically it is a new
> feature, I hope this can be accepted (it should not affect anyone who
> does not actively start using it). It would make it a lot easier for us=
=20
> and others who are using GROUPMEMS_PARAM today (we have more than 300
> recipes that will need to be updated) as it would then be possible to
> migrate the recipes over some time rather than having to do a flag day=
=20
> rewrite.

I appreciate the patch series, thanks for doing that. I'm much less
happy that this is marked as "something we must backport" and then the
series starts with a patch mixing whitespace and "simplifications".

Whilst I appreciate it would make it easier for you, you're breaking
several different elements of the stable backport policies and hence
actually actively make it harder to make case to backport it. It
certainly doesn't make it easier for me, quite the opposite.

Cheers,

Richard


