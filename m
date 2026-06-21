Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29579CD98F2
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 10:21:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21750.1782037283184665337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ug603oaF;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso27148245e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782037281; x=1782642081; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CDGyRrT0or8XItXn7rdlEybTHCUoTtRq5IilI1eOJSU=;
        b=Ug603oaFiM33W4PTRcVimtdCnjzSoTEbXLYT+XUpv9EXrSbViTqtuzYGD3AZ4nBwq+
         qyioHRdNaM5ANaz9S1xBZJ5jcByiQDxGh1NH13kIKiEea8xOmvGz9znXcMDJ2mxaIHCv
         UukYlU5qatBYFiHjOROGdCr6cEA9XQP6f5Z1EytOHdbjW7Ywr7CMaF1rT2aJtNTvvn0O
         jW8kPaqxn2VR+xDh+sZOEyK7noTiYERiJPhV8pORQkwIwnmeIsMWoWXV9/MrNd9nN4ST
         zVSR71Zze5Dr0GnvdhUjcqlJJCw5JJuAEFlS8ntGFkwEm2wlv2y9XtyxiBO1BjytK5Bk
         RTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782037281; x=1782642081;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDGyRrT0or8XItXn7rdlEybTHCUoTtRq5IilI1eOJSU=;
        b=Mx3mPEZA38NWipljNBb07quHzGDBTAeIot87oq5x7Qii52K8s3uFsgcFgBedlwTrTt
         GeHuBP8sRJQ4E4Y5vg7UtvOHkp78aJDtS9yh4aS7Eh4OluFGQ0rCU7mkYWeLizGJdPVj
         1VXMGAZZ6UmzqX0cDE21IYjnza1yp4ZF9r24HDGQbF6E0RvakOnLpC8q1fIZQl7Vbjxj
         Qw3QNBNKF1VZOwdbMKyznSSV3L76q1QVpkQFdX67iDuSVR3NuL9BYEPFDLqUSgtSoR2s
         oDlFCR4A/87aAv7ktsm5knGRM5hl4r8jkNvFbcy2hDdyiWBqYnJrtLDh199Plott088B
         H5HA==
X-Forwarded-Encrypted: i=1; AFNElJ/b3Y5ZHuQjXPFiE0rs/gI5GiJQoSNFUi33Azep2gPbTP5m/0AepV7q0OMVTLkznEtEwSOJ86RN1w4GRQbDBFUjPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgFzjnVS2t1tNMBlGyLkZ/fKHqh1gMTQzvqTt+ZcHXnbC4o/Nb
	ScxL0mRItYGYMM9c8uTd4pClrKHRM/1IDKE1CCgLazX5go9IL6VMACv5
X-Gm-Gg: AfdE7cmnQONXZ14TX6RSG+VGRxlyuimXN29xihWQdJLFSV9Mp8Qn+6RpcP5iVidJb8j
	tlvyfaPhL85wSySwW5JanE4leuy1S4b1ZHzqcYdrMVfnmRFVSps385et5eLIgt45XPaQzsOo7+i
	jp7VkR/bHiZIvndNEDzQiA49h5p+GVN5FCDIxF+yUcwD28e4matIVYmL1rtCZD7BF/2jVjYkwdP
	3xJzgA+pJ0xQtj0t0E5YHH2zdEL0PWW8nPTa325kvr5n0QtGcmr/bRjFPs+8JMkam+NDw8VD2yK
	fT+ejtR9HnWVoukfts2aUDbWuqQT4ZQcP/vjwkVrF7bM3IpDkWncG9nTRGxnR3MhmwfO9gsRwaI
	4LIc4/3hLLocpXNZjs9zo1HoxAf8dF0cWlTdcR5GPTtBG7qA/VRiVlugxi8h2hxFrhC7O/z22k9
	NHUUkkC5PjR2dCS60yvMfOflPWBBvQRwPhDbCdDO7OupOnK6ghbeOrZeLgjwpqbw==
X-Received: by 2002:a05:600c:4694:b0:492:4717:59fb with SMTP id 5b1f17b1804b1-492490a77a4mr92599415e9.17.1782037281175;
        Sun, 21 Jun 2026 03:21:21 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923914fsm127780675e9.6.2026.06.21.03.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:21:20 -0700 (PDT)
Message-ID: <7cbd939a9294495c287005b843dc068d22f18be5.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image.bbclass: Fix operation with
 KERNEL_DTBVENDORED = "1"
From: adrian.freihofer@gmail.com
To: mathieu.dubois-briand@bootlin.com, marek.vasut@mailbox.org, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Sun, 21 Jun 2026 12:21:20 +0200
In-Reply-To: <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
References: <20260616214945.40714-1-marek.vasut@mailbox.org>
	 <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 10:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239259


Hi Marek, hi Mathieu

The issue is that the tests need to handle this change too. I tried to
come up with a complete solution here:
https://lists.openembedded.org/g/openembedded-core/message/239258

The proposal is:
1. Fix the tests
2. Add the patches from Marek



Note: Here is my complete WIP branch for the fitimage related changes:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/fit=
-improvements
There is one more patch which will add test coverage for the
KERNEL_DTBVENDORED =3D "1" case. I will send this later, after the
patches which are already in the queue will be merged to master.


Regards,
Adrian



>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239053):
> https://lists.openembedded.org/g/openembedded-core/message/239053
> Mute This Topic: https://lists.openembedded.org/mt/119842066/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

