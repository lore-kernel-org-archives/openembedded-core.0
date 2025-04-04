Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B917DC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 18:47:05 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.4773.1743792415609924677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 11:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O10myV8f;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so20454316d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743792414; x=1744397214; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEJaM1TMikUvF+8P/A629RUfe/AIr0k5GCo8Tx1nMwo=;
        b=O10myV8foEiJvcQ6/DNj9s6GY9x3VG3G7uEogVtEHZhp3P+RWq/gsAqMgqFEYUUThd
         P0+qlf/FLI6H5TxKuLE+vGFBuqMLXypEeBXNLz4l8Z/MSXjbxra1ALsYzUTEa6YpDG+6
         oJ5+LcLXiPZO3t9lNQcNR3WSaJ2vCzKRepVNMPFA9kGeDRUZReL5oGYOnANjL4jK9meC
         3AFHd8OROrY0i+lazL4vHA2sVW1cXWtUNIOKc8WU4Bmn8Fb8vIZh59tuhRtN7RMjBWcW
         PoDl9ZaXN+9aZmrjcLXAd/2fbc2pachnfodbi59Sd1ioOyJJCOQrLggTlDAUEjtbhMaq
         aizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743792414; x=1744397214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEJaM1TMikUvF+8P/A629RUfe/AIr0k5GCo8Tx1nMwo=;
        b=PB+qjRgVtaKi6sHceU7Iu8XhN/fzyZL1Oa9H2HS7nwLCIdPyo0tg4wVn1bBiFbh8M/
         OtA/GdZMLJKya3RPdKAr5FGMnlht5OjQE3XobmUCXaL6Gt48P3kYpI6dwEksmyAaFSvF
         2TbPk1cC2sLkR/+mX2WUDQhWAG/e7TcbIJ5HZvoBJwRn7QfNZ8i8yLqzDOohNVbtofxw
         TrwdR2yxB+WESpKmGHfh5jKHdiR2ZWcCcHxEkaeof594khV+Vfn8IkV2mpeW3u/o287j
         F99OnpMaFw/kHHBEBCNkvC8CWP7D0wzOtFJlG9vWTiYplLgwmZEMPxOCfkrpO3fWMpTx
         MCFQ==
X-Gm-Message-State: AOJu0YxianG8sxpbzlLkeBu9RcdG6Ei452IpTCeaMGx6Dl2Uc62hcVUm
	p+4ubbOykPvRJQsxSeMYjdBGOynYcdL2dHERbPwPIqqm/OEcQNZecEojlBimOfruZzxiQ7icVbF
	EMp7ok/znwjgIgVpo9lE3QYaMwcg=
X-Gm-Gg: ASbGncs30N4QTCm1ghdnNWLXQu8wLnk1qkis53IyBeCc3rf4qb4DTFGU9ZcYzZPyzX6
	hJ8f+T+uI3xCAK9j8R8ePBd2Uw/gp1miq0xepwpBCqyhReNdFd6D/6W8eW/T4XV5Xz6kitdtb0D
	/952NzksZpuj6GMP4FXMQWr29zXT6gtLABSo5y7v1z1ngZsvGxbOKtKyNa2Hfj
X-Google-Smtp-Source: AGHT+IHaG/wtgmbnkW7gvPC6Ss3INZXTcJ2BgG6kpPVNCut5GlwMLrNcssTD3PFmbyfnLfR1hBU8jyiP9WaIznRJEQo=
X-Received: by 2002:a05:6214:2463:b0:6e8:8b11:b6cd with SMTP id
 6a1803df08f44-6f0b751b18bmr6018576d6.35.1743792414630; Fri, 04 Apr 2025
 11:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
 <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
 <1830A652FEC6E4D0.25981@lists.openembedded.org> <CANNYZj_xbcvc1VgXe96zYhRj7AvOpou6x4oEHUE+M_Kvhu+8SQ@mail.gmail.com>
 <DS0PR10MB795478EB553410AF51CB778D89A92@DS0PR10MB7954.namprd10.prod.outlook.com>
In-Reply-To: <DS0PR10MB795478EB553410AF51CB778D89A92@DS0PR10MB7954.namprd10.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Apr 2025 20:46:43 +0200
X-Gm-Features: ATxdqUGrKegrgePvTPzICdbU6Duxq7hTQHWJQ2sMkJYEaLB1dRaol_vC7IBXCMo
Message-ID: <CANNYZj_N5sLT7SMGQdqRnp_kzfGseeJC9vncE8UyVjCuLbi3tA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
To: "Desai, Rajendra" <rajendra.desai@emerson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 18:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214365

On Fri, 4 Apr 2025 at 15:15, Desai, Rajendra <rajendra.desai@emerson.com> w=
rote:
> I am curious to know why is it important to only use core-image-ptest-per=
l and not any other images?
> I tried with core-image-ptest-perl and saw similar compiler issues that y=
ou mentioned.
> Also, I am not completely sure how core-image-ptest-perl image is differe=
nt from core-image-full-cmdline in terms
> of building perl/perl-ptest recipe and why are we observing different iss=
ues between the two mentioned images.
>
> From what I see, the image core-image-ptest-perl does not include x86_64-=
poky-linux-gcc
> compiler unlike the full image that has the compiler installed. Maybe tha=
t=E2=80=99s the reason we are seeing
> Can't exec "x86_64-poky-linux-gcc": No such file or directory issues whil=
e running those tests
> (as they are XS based tests that require a compiler)?

Hello Rajendra,

the reason to use core-image-ptest-perl is that this is the image that
gets tested by Yocto CI, and that maintainers are using to evaluate
the patches against ptests. When that image doesn't fail and doesn't
need fixing, then any patches to address a failure that happens only
on your side will require investigation from you, ideally even before
you send the patches: are you configuring perl differently? Are you
using a different image that has a different set of installed
packages? I have started this investigation for you, and it took me a
significant amount of time, so doing the rest of it is on you.

Specifically, you first need to get core-image-ptest-perl to fail in
the same way that this other image fails for you, without this patch.
Quite likely this means adding gcc or some other dependencies to
RDEPENDS of the perl-ptest package in the perl recipe. Once you have
that fail happening, you can apply the patch you sent previously, and
see if it goes away. Basically the fail is obscured by a missing
optional gcc dependency, and that is a different problem that should
be addressed first before we can take the fix.

Hope this helps,
Alex

