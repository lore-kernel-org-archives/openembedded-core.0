Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA00CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 13:19:56 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14496.1764422390209452636
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 05:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwqoYNkv;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-880570bdef8so28998486d6.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764422389; x=1765027189; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxoFaxtN1dGseR5vlbU0TPdZAg7s3dAin2OWhRqIWoc=;
        b=bwqoYNkvn2i07/KDsdRC820v6+vy19DDmgZZgrmlYQfWsdx2jQyBpwOE1W5bb8psWZ
         cJvwZ+NcGMZA2j+cP2yxB4on5X5U7VAfWxNZWniPaiK9hVgW/Oy99ij40djpx8M06qLQ
         cchulrIXb2AdtBmJdEku2+Jq2DXg4LIMSI8h7DHwnvhDzIUqLB//uBfhUkSzFkOg7pr3
         5C3Wfa3AQfPMvsaxVw53O7OKxzf44XyF9clzG8u5BC+il2SmQV80SN9OKoJoHo22uaPb
         JXjShWZ2FUV/07iOWRSdY+3W0aFcIvW3MKETLGy/DoPYuISG+3Z4BYEd3tkyzHlEn97d
         vwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422389; x=1765027189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxoFaxtN1dGseR5vlbU0TPdZAg7s3dAin2OWhRqIWoc=;
        b=qOMvXlHljq4JMKLzHhTg4KAtY0uEwj2mBYWrAhYNJiLEpvY6C8Kw3nEl8sEJwpGsT1
         Z8MnwHIisd6j/GBelxXbjZrbYeLSCOuAEQDKtcR/8yYmo3HouJwrXjrnWKM53jMWodzP
         NiVGWM/T4Wm1tL3ICmbPwEdVytetfeP63Pae3j3ts/c51dqh8DrnPmU+3mLdEB+z5S8P
         qY4YFM4CwB8S74kwcLH5Ze7E4Ejqt8UvfUUIiMNKkmOsYrzZ2BoK7c77IbQAIGND1BRS
         zxrG2+uW2IXaUokdNV5RCO+TmzjbEAwaUVfvxy4R6TjKZjl5LqRv3rG8E3IBni4fO4YN
         7zZA==
X-Gm-Message-State: AOJu0YymKbeEGCD6JIs7TcnruwrsnthqqUcF8DsNoUeMM8nXyg+VANe1
	9jN7vlOM8rqEJgNPAUjXc8C4udr1UtiufutDHgHnCGx4l6qILxFoM4PlaFdQJ/jOYMMTBdyDYX6
	Xcl/jz2M2gOesKGEiiP/UuX74ejcGzTw=
X-Gm-Gg: ASbGnculMtGStQ9YRLwxwVPsj7ckj+n4A6SdRPQ3r0v4BbfdI4OJHsm5XXIb4mYoY4I
	cd9JRVpe/MNUiIVtlzMFvNxtx3dxl8p3Mh1aBAqroDXpm2wHw+gIXXCnimXbwFpyaSMx60Z76uh
	C/WFjAeu7pW1+sDegMuCbM8jNHOo8uK7wfUX19mAEA8At5/eponfpWt/2Qy3xsvqI9/WMrOX7qg
	Khp8L8WZk/8p1tFJz2A4ZHhnHR01oHdLU9QEDnKbD2kTwAdDZbb3X4ZRktw8klqvexYKAW+9S1u
	6IgVxk//D0LupnG5FcxFo15ddtdfGw==
X-Google-Smtp-Source: AGHT+IEOZYXgObcHSSdenq0ptNa/a28eYwHxXEeJCv7mQx9OQHiv+fjS928s7vR7EedIokomwVlPBsq9WqsDYKNNjR8=
X-Received: by 2002:a05:6214:3d11:b0:880:6647:1031 with SMTP id
 6a1803df08f44-8863ae619a1mr262113146d6.1.1764422389151; Sat, 29 Nov 2025
 05:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20251129035436.249679-1-Qi.Chen@windriver.com> <20251129035436.249679-2-Qi.Chen@windriver.com>
In-Reply-To: <20251129035436.249679-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 14:19:38 +0100
X-Gm-Features: AWmQ_bnKzi72QROi3eAut7K34iQafF7OXGJVSW9CzkkChMl4xExHSyT2CfzVz5A
Message-ID: <CANNYZj83Sda+1Ycoiwdzxdw1y17zK=AiuxQ5a89H9RUqK+OMew@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 13:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226934

On Sat, 29 Nov 2025 at 04:54, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> The '\n' means hostname instead of new line in /etc/issues.
> -               echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue

\n does not actually make it into /etc/issue and does get converted to
a newline (as intended) somewhere on the way:

alex@Zen2:/srv/storage/alex/yocto/build-64$ cat
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/etc/issue
Poky (Yocto Project Reference Distro)
5.2.99+snapshot-449cd68248749daedc9990c4094ef5577907ea3d \n \l

Type 'root' to login with superuser privileges (no password will be asked).

alex@Zen2:/srv/storage/alex/yocto/build-64$

Is that not the case in your build?

Alex

