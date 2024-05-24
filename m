Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ACAC25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 16:22:22 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.20044.1716567734995556194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 09:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzArLw7+;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e73359b979so56355341fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716567733; x=1717172533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wTi4nB6COeQzGdN85oL3vVcnVxqIjP0B4RZicjK+BMY=;
        b=SzArLw7+wCrO36KcTOHgigj+p4aKIN1f+k9L9qEfEVsIXFGnphpNNJe/rn0/h3quQf
         5Fzw4ZXJnAmXI/fLKs5yC8ZhT1xzK3pHstumRUuxUYia2sURLu2ANex+S6a/3suxKtgK
         6UIFm1YI68nsA93kBHJYpFyLdp/lEZOgsV7xXpn3zrop9w5+RaArnlWXJFngVnVHPGBr
         vOfhGfisKoVuan9PvCaXjENNIJgoztzq3/7Scj4MIdrwtvEB1qq4I8MFgXuU84MSYZbn
         RKIVM8Tq8N4nxjWQ8Q6C3GfOEiZ32+gW8fV6aX06P6stSy5u8SYSUy9QPyOiNugj8hCz
         NPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716567733; x=1717172533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTi4nB6COeQzGdN85oL3vVcnVxqIjP0B4RZicjK+BMY=;
        b=VR//2nEhdIijLVxG6ukDE7nEW5yji6lkPz8K/uJSM+acHVfjjjaRdspALGzuciaiH8
         EI9NZ3MCru6XSiNik90ky6u4lHU8nGfXIsxGOECjd9upYkMsGUds7XYHjOTI7zivYtfJ
         pCt/vI8Y7jXPINsgFjLdtb81MGdTYA7x+D3dqGB5M6F8JIUc8m7GuHE8XvDzumJipyzq
         ++Igz6c5oK/zBYiHrIc+BJePSB8KCAFBNl+SGXbo/prIrvpSerDquE8EnW1J7a1BlV93
         EJ2XZ8z28KTyWrtiADxtv+1GOlFDMleCFNtjlArRWGkX7R2Ar1WiZIju/DjA3xj/Kzi6
         /KLw==
X-Forwarded-Encrypted: i=1; AJvYcCWcYwZlRWZyR9SOh5B411W8yycluFAJwFDlAp+jMnXQOZzynYV4xp1AlVLJdHQELOLV32OEeaaQ1quYq/ws59H2X6DRHC35yM2r0xEbX1cpodjVYxtYBAoy
X-Gm-Message-State: AOJu0Yzl21FynPEZCTu3twgs+SBeDJkfmzwkCgGcn5aqOBUFd7FuQLw7
	A8kYaYWw0JUerVHWzH+SkLDUPqtbRij7jeo87HjvRMuESOzE+LjiDIcqlTyqqkq3gPoXaPL+xLN
	rpF8KhpbhYgmN6t8Y1qe9TY179mY=
X-Google-Smtp-Source: AGHT+IHBknvhJuGwdYE52ChrpnYALCG5zkjISv3gTD8tYB9hyXLp2i+jfTOkgBBSfU+bia8iufZVjDIESfGFNTA6LLw=
X-Received: by 2002:a2e:86c5:0:b0:2e7:19ba:b84e with SMTP id
 38308e7fff4ca-2e95b08fa2amr18134101fa.20.1716567732985; Fri, 24 May 2024
 09:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org> <CANPvuRk9gEcdqPts-T3tHRS2jZFNiN9+qBQEr_-RY_=h7jzwuQ@mail.gmail.com>
In-Reply-To: <CANPvuRk9gEcdqPts-T3tHRS2jZFNiN9+qBQEr_-RY_=h7jzwuQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2024 18:22:01 +0200
Message-ID: <CA+chaQdLP3UD+mSAsZEt8KQ20QT=GXa7Xbiq=FZL6N8fpS47=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
To: quaresma.jose@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 16:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199857

>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index f2bca0aa5ba..65eb657fd93 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>    ca-certificates \
>>    shared-mime-info \
>>    desktop-file-utils \
>> +  os-release \
>
>
> Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> I've had this on the Linux microPlatform distro for a while now but I forgot to submit
> https://github.com/foundriesio/meta-lmp/blob/efe9acade717181a5b9d3c520d90aa53049abb27/meta-lmp-base/conf/layer.conf#L37

You can drop few lines from SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS there as well :).

