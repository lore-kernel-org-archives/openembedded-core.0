Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542E8C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 13:37:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.9302.1746625042817385587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 06:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5uwmikt;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f53c54df75so20972266d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746625042; x=1747229842; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjrnD5IQIRDHADbSgmOAqV0t9rn/Q5/3HxkHqevSLFU=;
        b=j5uwmiktWuTIknrAFNFqOt9FI6LD/Qg4ShQ6SqsZANs6ggHWGpKSwV5+suAY22GpPP
         P5okE5aH+mFgvTOVkNrdso5MSKNfI8EzrnUfAA26OiQr133MqdTlOovHFWc2+9vKsZRR
         ADiJHe/nurdAPsiEuLjuXxRGYJXmJ/PYSCvDxIwIlRnCvXNkxn4pSn9Muf+Ak5pGLEJh
         N9sTOMer37BZbJvJfbvWASvClVzbeSoskU1z4pLle4u+S3+ZSgMzRM9P/Ld66oizjw9m
         4jiWfPFCfERYy1iLd3E6E3G59y9g+gkD9VtkE7mErkHJ7c3rosYinegwhzL0JmFZaT+j
         OK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625042; x=1747229842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjrnD5IQIRDHADbSgmOAqV0t9rn/Q5/3HxkHqevSLFU=;
        b=M97ge5Wt3HoHOzGrNNw/VbWymbKQYhGdCoyOStwhrD924jguYoMea9JF4n8XwwkhQl
         eJgRW47zcnlKWGz7cgDH7cIZRAtMRJ8vNcRlqLkIiYEIatDMfhBFnTxx5RW9MpDVBn+7
         ERxQqegaoAaxBq5YvkRprcAGV7SluVG0Nx7L3vscg97M59D0skncehaQrAhhqDjaa23d
         ulOln1Nc5v+pLadTjbJE6zl+pbg4wOxCXeYNNctvHXmoab8zXkHEvcpIaxyp84k+AeDD
         tTg5Gi8yYDlaZ+Nj/8hHFYmniQSOWv5f8eDEoyg90X/2TO8xENZu6iqKYvcWDVuHU4Lp
         tAFA==
X-Forwarded-Encrypted: i=1; AJvYcCU0xdDsLQpLP/Hy3uICAOqihEM0H9up5vCbvMcJiAsO/JvlS37NIIBXGTn4Z5bT9puw4dSLXXW2dTqmR9nsx65Q1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtkGlR4Fg7gh6uUic/uZagxx3fJzqA+UKUZ1xUFH87Mx0Y55Oc
	ssON1Kk7mioWRdq46xOOuhyToyKiOBXuM3YLWv72683Se252wHEeZ2BN3hS6XaTfiWFf8gH9ReM
	2+fONzasor3U/KLJKQh783sPGXbE=
X-Gm-Gg: ASbGncv0bbdoQ/Ec4OHhZb5I/03iVGPG2WNirS9LwrbaKjKehoweydSBk1uswdv5cnE
	YkyG3X8AKhS0pLZkt/OJ3oJrBB8N+7WAMcYE7WpzMGLAfC2pcPoZfA9reXqlKB4ss+cahUKSjMv
	kGZQSUeXUEhJ+Kd5GpwAr9dK0=
X-Google-Smtp-Source: AGHT+IHWnirbsNiP3B5lz8rN3/+h8bopejAH+CRUvpYpXm4aHaoUowdBC0zhg1Tp9NrQ6AzMJLNya1V0ylBf0vnpEZY=
X-Received: by 2002:a05:6214:f2f:b0:6f4:b876:5fb8 with SMTP id
 6a1803df08f44-6f5429c500fmr47417756d6.1.1746625041702; Wed, 07 May 2025
 06:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250505224801.3181046-1-rs@ti.com> <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
 <D9PGBHDAZ7RF.16SWU58NCK9NV@ti.com>
In-Reply-To: <D9PGBHDAZ7RF.16SWU58NCK9NV@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 May 2025 15:37:09 +0200
X-Gm-Features: ATxdqUGij41dGaklY_gsXYNYCeWH_CupPjyt9cw_hgf2ew2MlwMGDTSBGNXxBRA
Message-ID: <CANNYZj8xD66nTL7=oJr8fqknYyDjU+kjkY8i8Kok7xVH6tciTw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and wayland
To: rs@ti.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 13:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216111

On Wed, 7 May 2025 at 01:03, Randolph Sapp via lists.openembedded.org
<rs=ti.com@lists.openembedded.org> wrote:

> Ah, this is the first I hearing about the gnux32 triplet. Well, that is being
> filtered out by COMPATIBLE_HOST in the goarch bbclass. Some of those values seem
> to be invalid now (powerpc64 is supported upstream). That being said, I don't
> see any mention of the new x32 ABI upstream. Not entirely sure how to address
> that at the moment.

There are two options:

- set up the x32 build as specified in [1], replicate the fail, tweak
COMPATIBLE_HOST as needed (in a separate commit) and see if any
further issues come up.

- correct [1] to no longer build core-image-sato for x32, and replace
it with core-image-full-cmdline, reducing x32 to non-graphical
targets. It's been a controversial target for a long time, as no one
has ever seen actual usage of it, and there's been a stream of
graphical related crashes and build failures. We keep it around for
now, but I'd fully support dropping the graphics and leaving only the
console images.

[1] https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n867

Alex

