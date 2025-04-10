Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFDCC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:27:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.28680.1744270035769471046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WRarxCN6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso3757185e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744270034; x=1744874834; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGimCBffT89znWbLPzYRBMc1t/FBYcVhl3We35EQTOg=;
        b=WRarxCN69p0meRH+6nOm2NmdU8XGAWfV75kGWejCC1OQNYUpOswsqaiwWL+5ni+vzu
         XegOWbQUuufK+vY57RLU2JzjkMB/gJff800v94cKOxuCVdD3pI1kea1k77kR2orryYOP
         luw6TWGZ5p2edUjcbmHRLFfL/CM948NqKpMNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270034; x=1744874834;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGimCBffT89znWbLPzYRBMc1t/FBYcVhl3We35EQTOg=;
        b=gIaiQkotsUle0vQ5i0HKAMANbCtqNeBEO8iK6kK0h+181TnX+/ugTIRyQGDyBW3cOv
         wNf/B/NlHfotVdv4tVz4Fomxbaz4JjS7grciLfnh+E6pIsc/FxvQWExJXIxMQApLi7yl
         FB4GBxI5lA2Ak1x/h7mw3S98zVqEPTCULQmscBYc95TLbzdqFfRSagx3ERjhOQrsVonu
         IrqjaQv7o3fLtrQAAp4XOXWv5JI03JTzHp2Tt6dZWfTTk50PBOKhc0GCG2+7UUa9PkQ2
         AcwsgKW7XpkktpM4V0S8ZS91F3iotw6374BztO1675vxZ+cdKPiYNhL/BV3fI3up/vLu
         g5aw==
X-Forwarded-Encrypted: i=1; AJvYcCX1ltvRNw9vD5doayrZy+A0wjSxU3g53v3eEvRre4xGB3WXh7CAHanwPw2SVvWe3sXxWqv+AQjoeuhrjREnnNJh+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNFme8a3zjW+xjgNJcSwVia2EE9E0+wB7MfS39w5NZsLfnPiiH
	o9z/O9YPPNODoBbLL6XgFIA2ptdCp3W69IHupPmewFsUFUUUDgKsI8agBuTbRTlYo4/V4uPDGhU
	P
X-Gm-Gg: ASbGncstYNUosh26sRRCYNXjLy0P5TKefpv8ZnPMM2EtZEpIgW3XBuEMc1BNSa2qFCx
	C0WNCxlTcNTTVXxqEz2f+O/ayxhsvwAefkeCug6Zcivg00H03mn0w/0beY35OEEj4SPRfyV1qsN
	gbANfJ6sVAcw4LnEMaa0ZuIZGHDNxibujt3tOT8U4bpBGlNjEPoxXIvSXPiVNVr5byU3Ydm61/w
	QqzSCjUT+8ww+EKE/Nd9lUykzdM9UMXAKw8hIWtCrZpaW5gxzHCQY6TS7G/ge/beP2MMA+iTfi1
	7aFJyU9+o8FhTzGKha4LamMS3evDXtvOCLybwm1cD8kbtNb2T949aKVKBxGQ5mPk9XYE8AfIQMz
	EoXUV9hHuaNioHjpCfYoPh+l2Sw9Tng==
X-Google-Smtp-Source: AGHT+IE59xUlD0teCc2NHalIg3K2uZGGrm8VLZXtOxDHMMyU0t1VYhdWocER0kZvSZSG3Fko8TbDVQ==
X-Received: by 2002:a05:600c:444b:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43f2d9a2218mr14550545e9.29.1744270033876;
        Thu, 10 Apr 2025 00:27:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:48b8:26f1:fe26:d411? ([2001:8b0:aba:5f3c:48b8:26f1:fe26:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0bbcsm3804606f8f.80.2025.04.10.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:27:13 -0700 (PDT)
Message-ID: <2be525dab53cce3b20e8abc3e8674975186f30c1.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Chen, Qi" <Qi.Chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2025 08:27:12 +0100
In-Reply-To: <CO6PR11MB5602C8418A51BEDE75A5A9A3EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
		 <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
		 <CO6PR11MB5602D636B4069B499A6EF4D1EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <5e07f80db60ee353f2acd1ed0d8d7bdb00544337.camel@linuxfoundation.org>
	 <CO6PR11MB5602C8418A51BEDE75A5A9A3EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214624

> As for the qemu class inherit, the code used to write the qemu binary
> call into the postinst but it uses qemuwrapper now which comes from
> qemuwrapper-cross. I suspect you're right that it means the qemu
> inherit is no longer needed however we should probably change the
> inherit qemu for a PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"?
>=20
> (and see if we could remove the dependency in image.bbclass?)

I was thinking about this further and I think we could replace the
qemu-native dependency for a qemuwrapper-cross dependency since that
has the correct qemu-native dependency.

Cheers,

Richard

