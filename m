Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE550D6EBF4
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 09:25:53 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.111933.1732872351041053371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 01:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1DmbSZP;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d41176505fso12979156d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732872350; x=1733477150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D2Yk9VE/cJzRvVdtEe/Icmofci6xISI/RFfjO+RxdQ=;
        b=b1DmbSZPBg2p19veN084gyRBkNZHdBSVOCRGvaVxJbo28wLtr88wvuV6ykf0D2xYbl
         g2e9sX3cXXwpwh+bXbE6hwufq7/WMNB3VhCKbgnpOHGgi8CfnqSJNgfMBhGWfSyId/js
         laH9a4VTXNjHh3ntcMjmukv6mbA1rP5Esqwt3vc+yAAdXxePZYOAEKBiLOpAcWe+cYDj
         PMibuDTUtu+1/TglzMhzUVjXe5HS0fOHltgScs7sZZGqcCQhursG544cMQuIQTem7nfE
         Rx1XBqQhInMS6Y/acvuU9EfOAaRoSP7Jb5hWugfBuu1iGq983AM9IyDRRlKDNU2cL77J
         O3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872350; x=1733477150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D2Yk9VE/cJzRvVdtEe/Icmofci6xISI/RFfjO+RxdQ=;
        b=Dh+wDfo7h237TN7XORzrZtUwVoM1dr8TVs4u2bK2RYyuxPjKhYHY6cWXEalfJOo13G
         Nx9sylBbuQ7XwJ7leA6J48VNDAlkKdBvDDpQgY4QQOTnMzXa3Qy+X1NiIay6CM95C7+4
         63SpQhpFXVBqu7SAWzlZmbnwNunUbh07JWkNJ4wYliGAvZ7PBrcjknaEEeGe1lwsPL+G
         g5BDiV5z1Pcyx8s7V6oQlva2qv9IvOKXb9RTgEv82N37/7198wUwOE32wPx13TSlY0fz
         ssTMf0IkYtZ3DBsOyjOYfXeWeLag95h5xBvLv4jg7pR3YvSOhfdsDTJqtcxIdpKBgJ8w
         L8+g==
X-Forwarded-Encrypted: i=1; AJvYcCXi/CFhdSfxPzTBsFGMm7RmLHklxwHK5a8bpqZ7Gds+BGiKQ/tT+yZeQnDnYOi3KckQxR2kQXeWKpQ00qWCOWeDWg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjwL7rjjm5B177cHTCZuuwu5Cr9ixlmAq5Y2CUf6xOp0bDJ6Cw
	yaB7fZo0y6aXa4bYeujUxVm366MXXbhHnWrIpaGmPCsahYfJYr1cWaOiaG5riThcJ0l8RcN2khs
	wisqFcMUKnL1aJyCyO7g7hv/OsgM=
X-Gm-Gg: ASbGncvirBcqx1rMXIGp3KnWkkocqGrzNPc6W8eZg5gfLTSUm06nLZ1mUAdRxWq0RAb
	4uHTn3gjqULY3TssXFFTJ/K5WjcGNz3ol2Iv/5Fbnd5a6bHUet2TAfCoE/Dh6s6iNbQ==
X-Google-Smtp-Source: AGHT+IGYBrlcnaBY+n2kP+XNBgUphTS2AK6Lk1SBuBy/rIl+TVpKC5CQc61CQkgU5mmWVQEm9vpt4XU9vvLVCMVsL9o=
X-Received: by 2002:a05:6214:dcc:b0:6d4:1813:1f21 with SMTP id
 6a1803df08f44-6d864d0b1aemr159261276d6.1.1732872349926; Fri, 29 Nov 2024
 01:25:49 -0800 (PST)
MIME-Version: 1.0
References: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
 <C8D6F167-2022-40F4-A4AB-7EB334C2C821@arm.com> <cop62tcxe4sij7heuyhzt4gfe7lwmaaegr5vodo4yozembl6qh@j7ubd4mre6cm>
In-Reply-To: <cop62tcxe4sij7heuyhzt4gfe7lwmaaegr5vodo4yozembl6qh@j7ubd4mre6cm>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Nov 2024 10:25:38 +0100
Message-ID: <CANNYZj-midz9WXQpRmevL=3DdZhjMkCwvMbAX1fZu_tEQJxUkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
To: joerg.sommer@navimatix.de
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208008

On Thu, 28 Nov 2024 at 19:50, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> How much RAM did this system have? Ours has 128GB and it's more or less
> empty during the build. Also the NVME-RAID shows seldom an exhaustion. To
> the point that I an build at least two of our images in parallel in a tmp=
fs.

It's not difficult to exhaust that much RAM, or come close to it: run
do_compile for webkitgtk and llvm at the same time, with 64 threads
each.

Alex

