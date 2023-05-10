Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E406C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:16:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.22087.1683735397847524477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Y0B2sISJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f435658d23so15032255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683735396; x=1686327396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWu1zkppo/lOw48bAetKNmzB5C5iCfQLTr4lWt8/Tqs=;
        b=Y0B2sISJfeJQ+FM9C8y8xZYNDyQR10z7sBTQuk3aYXTlIkzP0D1e4LFsgxKS538+v/
         lEb0sa0D10uV+QdpWf/pcAjW2R2ixlOraP4KGYnvt6+6Iv1dyCg8/KPM6+ShszwbpJCH
         z8UAdha8YwLHtoGM4BjCGRSqEwt1EUBEEX0vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735396; x=1686327396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWu1zkppo/lOw48bAetKNmzB5C5iCfQLTr4lWt8/Tqs=;
        b=YzVvEde6GbscjRkATDMnZzL83MD2yxB0IvL9UB9o6O9bBsMom9Hf8yMacNN8iqhhPl
         3BtDsOxLUCUvNH6FNkfX0ALNgT1OM/1yLjf+FlYyZKlU2UYpX4HI/p8hXCA3hSpq197z
         n30zkLdBR9sP0AnlEXDlC4ADBLMo1NdNj6b7TEg/CgAc1M15cy94ujKwapH97/JmLbtF
         hP4GCynRFYRnkYmaiVjuxdbasXVx+PkbBEGnmJigswNL89xOJECWUrIA2DEMpyDVqIXQ
         o306CiIJ1l6W62rkETImY2eIHEvp39rnyTNI9W69PoNzWWz6+MRExtnFoiNQSyk5OrD3
         CraQ==
X-Gm-Message-State: AC+VfDwVpC9U4VZQ8yyXlPlJ7AOpVLmnWRvJHcL5ipDxQwg0brzV71sy
	9Hk3vAaKLmRVeOIObBwhsCAxfw==
X-Google-Smtp-Source: ACHHUZ5pDZtBOWIXafch4vAMcxAkni0yzP9K7SYqqCaDw80YNWUG8HoqCm7HPVbRAp+MLhCyePlbPQ==
X-Received: by 2002:a05:600c:2283:b0:3f4:2254:bd86 with SMTP id 3-20020a05600c228300b003f42254bd86mr9223860wmf.8.1683735396352;
        Wed, 10 May 2023 09:16:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:97c0:2f0a:108:d273? ([2001:8b0:aba:5f3c:97c0:2f0a:108:d273])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c020700b003f42e008c8dsm3620078wmi.44.2023.05.10.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 09:16:36 -0700 (PDT)
Message-ID: <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Date: Wed, 10 May 2023 17:16:35 +0100
In-Reply-To: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181116

On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make would=
 report some
> errors due to pahole and elfuitls is missing, since this is a debug optio=
n, so conditionally
> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need enable=
 CONFIG_DEBUG_INFO_BTF
> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in local=
.conf to solve the pahole
> and elfutils dependency.

Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with this
option documented somewhere?

I also think the mention of devshell in the commit message is
misleading, this issue happens regardless of how you enable the option.
There are also other ways of enabling this than local.conf, you'd
likely not want people doing that at the end of development.

I'm curious on Bruce's opinion but to me this at the very least needs a
commit message rewrite and I'd question whether the docs elsewhere
would allow someone to discover this workflow anyway.

Cheers,

Richard


