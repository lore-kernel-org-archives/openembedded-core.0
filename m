Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26412C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:13:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8695.1742480016607401583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 07:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GIvyHdzn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso5849745e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742480015; x=1743084815; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8nh/kmag8wgTipNEAyp2x3sLOQeXiTK9xyHw+GILe8=;
        b=GIvyHdznmPAR6rDv4wcVSfRbQSWN35tksn7NoUOKHkNwm2g2lSkQgoruBDRYjBeSXW
         k8GRcGOKbMwb76dUjUE3A/pMxsBEbVGfmMIdGnegBSTdV8prD3YONENfCIgmuJtSsslz
         jk/rTN7rh6g0kBrcCueApC3GkNbZZfkJj9rIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480015; x=1743084815;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8nh/kmag8wgTipNEAyp2x3sLOQeXiTK9xyHw+GILe8=;
        b=TXiqStuN/E5+7qZu9Ulzdt/nnoyefBj2PyqhRmQnfZkAhMG52WorNmz37ihWMV336J
         YMQn05VQhJX8ZiYbld5XF0aEfYGYduX5ULjyFd3p2Ps+suvmbmdJ11mut0A47FoF6pst
         T6EOzCHzLZIK9djgTJ/7IgZoM2JtjlghzpHWtQMWh4G1wnCvBqXTcNN6T0WRClYJa+kt
         x0fnYjSVNGeehymYuQ6iMs9AnU0hefOjct5JJwIKgK7FSAXGaaQbuTpnuuz3rYsX3JuX
         +AXQXOK128ui/uEOaFS0sZbgkrmckWkPUWreinqmVAtGP9n3TtHR3LkzNkpz3gdX6+Rn
         HKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+yVZ8C/eq9OjT+KnBYWPdqTmt6Gw5atI3MlFfQFMzlRVnimsJ7g9edamgXXckgmOpjmtFvy/wCcY+bu4YOxdRSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4ByFRXKD2kG3YMBnNwKfHGltQDHeP1+WN0AvCR7l4av9DiWqC
	ZcnhtGW4CTR79nmr5cfM1kMVAO1ooEpHpa8Zs56T3l8xdaNl1/z5farOHBOxjpk=
X-Gm-Gg: ASbGncvYeKo+Togt+HkYjSU8ucxGsSxjRpGovZHKffWegqo3INOgiSl1N4wLzBoFuwg
	z35Wm9LwLypW3ycTSGUzMf6fqlsFr5KbS+PQsfHf80rRPWW1n0tAU3hZHjhL7wfEX6734CwACBu
	E1Z9IIpvttg2hEhs7TJ3QENZErfbZokAzZ6v02IfpPO3nt7rfNzMv9Yfi/r1t3zKQOgp4IqvEeS
	IZuFAC+mmFJTeOCIcdgX4CZV16XVmXsY4AmH042iN9yD1jnQFl5x9/NSVbBgMw6ou59EQOeFhiF
	SuMRIaje1naWWBfu+cfLZZMcNpwVvJ20yUa9T/8qGlMo0UkYuiNPATQf77AdZfbNef7Tx3IimRT
	PoaRggELNa1pEnw41szXld17Ms99ZJtXlvw==
X-Google-Smtp-Source: AGHT+IHchWc2pa3VJInk2Ao+KHtfDtMdeHifUFcN+O2/xy3T8LLQPLiOLLjFpa6gbiwem9N8doKpPg==
X-Received: by 2002:a05:600c:5248:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d495893d4mr29954075e9.23.1742480014608;
        Thu, 20 Mar 2025 07:13:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318acfsm24338874f8f.70.2025.03.20.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:13:33 -0700 (PDT)
Message-ID: <285a6f70302a45e896cd93bda2ec5ed135597110.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] insane: Check if the C++ toolchain
 supports --std=gnu++20
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2025 14:13:33 +0000
In-Reply-To: <20250320134009.2631475-2-yoann.congal@smile.fr>
References: <20250320134009.2631475-1-yoann.congal@smile.fr>
	 <20250320134009.2631475-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 14:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213402

On Thu, 2025-03-20 at 14:40 +0100, Yoann Congal via lists.openembedded.org =
wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> This is needed to build nodejs from meta-oe. Check this early to
> avoid
> an error later in the build.
>=20
> Fixes [YOCTO #15804]
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Subject should be sanity: as insane is something different. I tweaked
on master-next though, no need to resend.

Cheers,

Richard

