Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D1FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 09:15:00 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34819.1777972493456788568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 02:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RPaZxBCD;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b59772d441so34843946d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 02:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777972492; cv=none;
        d=google.com; s=arc-20240605;
        b=Ph/UEfamtnFeKdYzq8gU5ZzVbQUKrPlNAOzPserJbuEnaJwugKtJmFeqdCEaOXLVEw
         cvnTUfUMWZgVKSH9wv9hkavk2gFleCObGOXlme++zOYhtlkXuo2x044Zqg0b780M3bZi
         jHBEAyONH/JPHETh26VWbBpTpu7Br1GsF60VsMD8dVeBJwNL1SkNtgvjA93StVBL4qGZ
         x1aYi7j3MT+zoaorC8grAoFWlkcnmLu3lSAAWLv66CeLrsfhWZRsVo15964ZYOfF0LYs
         qx0jbmaRSlq5VgnxCv9/cLpelZ45HUz5khdSBDMWJQCku8aiUXKgs+18KHWCEke8GJE7
         kQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHXk7iyc5fkIR4LE2JHkRIbffLYtdh3WaEgA7foWYtA=;
        fh=ZnYSdWDyfWLFbrTOPRzBNP/Bqdki7saj1ekbT2y0/DM=;
        b=XZTbjrKAdEIKOqHgp6SiCx8xMlWr17Gjk4VKF1DtDu/3woDyzchswSY5UyWodyXM7L
         nYzb2tnxr0A3T48vQJ4F1WJFF/qF0I73XpzWmjuDiMrtdTp6bXCjNVnGZCG0DmewlSFg
         Mu+IW7jz8O/nw1a5EBENJwWNGLPP6tS9ZLVqlI43bjQgUZ+8euTb5c/U/BPAOJoaFIjY
         +OY4MtIhoiMaYkodoitcl/O7MJQcwUdkznu98qZZB3ex0sMe3y1UACDtzsbL/DUxX5EK
         mMDwBpmqUMnqFWlDsKtMZwood9HayN8KYAB2DX055qbW9wCNqmLdMpIZXSTNNd3CvRwW
         Jabg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777972492; x=1778577292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHXk7iyc5fkIR4LE2JHkRIbffLYtdh3WaEgA7foWYtA=;
        b=RPaZxBCDxp1dZRPzNDKmzb/y9wjhR1s8gmiUHiwZkiHkk+loj4Q34V/Pfoy1hCCD1v
         1GJzH9NKVPT6S05sePoVz7fofwK7ce39rbybi00mqwJptKDzt69tsnAMIFilnV6ZM7fb
         Wge1sJAvZnerEKuF31KtprGswkhrE2MWqnQDIEU3wZ18PUdlfTY9WbYY8YPKLidjWAh5
         UolZ+ZLCz4YshcWLckpBjsNiNgoFb/y4mnGM1yj5H88cHPamXvHQTTwwj2BXoeeweGPz
         RvPkAgVhA2H8iYWBy+lyP6Ym++VNR/H3ls2e+xn7hx9vUyeNrTxcoNgzn0pE9aplrAsY
         dfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972492; x=1778577292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHXk7iyc5fkIR4LE2JHkRIbffLYtdh3WaEgA7foWYtA=;
        b=CsUYSuTZrfc7GbeKKbwOzFOV9RE2kgW0x9PlCCEg1GMBmE4PDXEo9dv7hSx3JZI1qR
         L7h1xYdZCzfiSbN8UqPHC3AgRzM9v0sbAcM3ZlK7ijRiLm+KLAcBLiZRTw5qQT8DhaNr
         ycA3gLlEUcpG5pQ+C/Bq9rLp8rYS3ndw1t4+GI/djyw2lIr9pFxA7tu3oKKXs6mthjtJ
         PestBHTg5JEBC84YUQ7cgOAfmmG1OKgcgKuXTyiPrdz4hiHI60Pc0c0LvSmJOjaAKVe8
         /WxncvgACxJAw00P0P2KPma3Z29qENDCCizjnXcA1O0zgD7MVfxKQxnfwwhm9w+3YiU8
         uTlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8h/McATYJSlb5eMUlQqDKZ/nFWa013Pa2jpNMdYw9Qjnz501PbZL12i+m0hlbv4UoE3xrI2qE8fjs2Q0OshRiIWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz57miD78/th/2zJ4Co2AVuBYpP543B8FkZUOPGJ7ffgKrHAFZb
	pm9cCeyi+KeoeAma4PKpLOhmwsEycd8m67UOI1T2v+6hZBkGaZcL8XxvoYWtUL9vDtfwBgqN16j
	VXoGERA0q+KegEXdztCaRyZ485Hfk884=
X-Gm-Gg: AeBDievAygiLDc4Hd7xhCvNSPS4JFKr0RI4UXjYM3PbOaXd0BRiYRBrY5zUpm54RyZn
	gLxyLQluwvLY823CvY2yX829aIESKvYEyXDH1ZzXZKIlpnlJKHO4LZvP5gzjpwhmpW/B2XZIFqA
	Tm5f3Q5J1h8EBanByLfw+A4vHEWqWR27ruJpoIamMTDeEk/+bGjdD6JMRRE5AYgFRz+IHSnxd2E
	mSnQ5QycRmiFL2cUPpgy0f5bAxsttwxzShx4uCDsbwvB67StZ6NMe9DZSdi20NfAmCA+WApDiNe
	uRJMbi0r1rfj+KGmzspjUhHq3Aj6W3zaArEsm2m8TwvOmJU46lW2
X-Received: by 2002:a05:6214:319a:b0:89c:4f7f:8479 with SMTP id
 6a1803df08f44-8bad8ac41d7mr33094436d6.6.1777972492324; Tue, 05 May 2026
 02:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
 <20260502162929.1377831-55-richard.purdie@linuxfoundation.org> <d1935c45-4151-4084-b94d-09a3387cac3b@bootlin.com>
In-Reply-To: <d1935c45-4151-4084-b94d-09a3387cac3b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 May 2026 11:14:40 +0200
X-Gm-Features: AVHnY4Lxpul7U-111KgaMk2dfK9EUfkBosFUeBcnpiatubUpU0ZDlEHgStBAGwU
Message-ID: <CANNYZj-4Bpu+tzUAaYPb6NwJXiCwEo-+ZcLxh9hZPdZXAe1a+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 55/62] rsync: upgrade 3.4.1 -> 3.4.2
To: joaomarcos.costa@bootlin.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236474

I think this is caused by a different patch that adds ptest support to rsyn=
c.

Alex

On Tue, 5 May 2026 at 09:33, Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> On 5/2/26 18:29, Richard Purdie via lists.openembedded.org wrote:
> > Drop backported CVE patch included in this release.
> >
> > Parts of the prototypes patch were fixed upstream (in zlib) but some se=
ctions
> > were not, drop the merged sections of the patch.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   ...-prototypes-to-function-declarations.patch | 68 +++---------------=
-
> >   .../rsync/files/CVE-2025-10158.patch          | 36 ----------
> >   .../rsync/files/determism.patch               |  4 +-
> >   .../rsync/files/makefile-no-rebuild.patch     |  6 +-
> >   .../rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.bb}  |  3 +-
> >   5 files changed, 16 insertions(+), 101 deletions(-)
> >   delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.p=
atch
> >   rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.b=
b} (95%)
>
> Could this update be related to the error below, at SWAT [1]?
>
> ERROR: Logfile of failure stored in:
> /srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/x86-64-=
v3-poky-linux/rsync/3.4.2/temp/log.do_install_ptest_base.1107185
> Log data follows:
> | DEBUG: Executing shell function do_install_ptest_base
> | install: cannot stat
> '/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/x86-64=
-v3-poky-linux/rsync/3.4.2/sources/rsync-3.4.2/runtests.sh':
> No such file or directory
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe rsync-3.4.2-r0: task do_install_ptest_base: Failed
> ERROR: Task
> (/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-c=
ore/meta/recipes-devtools/rsync/rsync_3.4.2.bb:do_install_ptest_base)
> failed with exit code '1'
>
> [1]
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/3617/=
steps/12/logs/stdio
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236462): https://lists.openembedded.org/g/openembedde=
d-core/message/236462
> Mute This Topic: https://lists.openembedded.org/mt/119117269/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

