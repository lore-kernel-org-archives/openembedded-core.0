Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B85BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 18:42:37 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.19080.1755283348412783447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 11:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNUDTDi1;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e933a69651dso556917276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755283347; x=1755888147; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crF60TUiOXCQOC6zuNJN8p+5wu9iDYifz8Yn83Z6Byk=;
        b=VNUDTDi1MkXwj+i+F8AcbHFE1VyWMqJrs8GRZCgal7x7mcVQWwQXcDHzt9oTf5k1IZ
         aMVEbJtUDkXpTEIg8UvJwkX8hH6WI6rA1todVMz0zyd6m5jyUsm0y5hig2duf3It9JCe
         qz3whG/afuT9b/wW4a/LashPxNeyf6xVnN31ZVYtHDsYPVWwpINxTxS0xdtxPUbFfm67
         54azRgGOEVSq9A4rpn1MawjqTlOnue8mSva46IY0zDEhR+dNNfrzymCCbcNH94MIK4aR
         ihfGYZ6A7TUccyJPadkgSxkMBvGStE59WP8/lb+lff6U427WXEzHp4Mm6G2Q7nJl52qW
         L9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755283347; x=1755888147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crF60TUiOXCQOC6zuNJN8p+5wu9iDYifz8Yn83Z6Byk=;
        b=GUf9RfEGNyRIk2d+DBAvuQWcc4vujwexjQPtVcIA6yOi76Ai8AxYwcWkgtyniRCcPa
         tiIoDx/1Lka2ZJnvh77ZWhXkjpAAhRN1+6ZPFtn7lgLEpyi6uuxqxmUsldcmNM2QuZsC
         g/wyYmn6+v7yBH/U+uW6VKVO5YAHDnxzmtkbNj83NBH48VThjTeGtvgz8ZPOiRiIfi87
         csjg1etFd+Pnuk4t2LnBqEyVZXSe6wsrOP4R89kI5SGaZHpzdDJTI7iLJ60NKbmW22W2
         73FcAS1RZvrJjncrPjDzhzSH2fdKqzg48+4OEViLwEraCatnMhEWWEIhwylkGrf74qdd
         mrVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZij55EQBcTXHRidzK+sxR2SgRSL2Tk6tsv8TBU2rbeK7bmCxzx10XxCS8vVYlkYBvtmqEN+MojG1ArmRE5ovtvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy78MD8wV1izMPp7n0FzBdZEMuv6HwAhkjBCfqMuAk2P3l9qXUq
	K9aScfUzrWHr6PpXZ/ADZHKMz7njZBXuU+PyN/Ol1iXj3ZNL8Kb0leKu7SPZRht4UQ03UVe4a3+
	eqV17kauZfPZbk5fE3a3N0LiU/Nqd5ZM=
X-Gm-Gg: ASbGncvtdOQU++zhDPw9Pdw3l0G0I6LK8f0U7c46AdlXru7v7V1BsVVU6erMse9dQ2D
	VpTKtkkURt18sBJAbYN1l1qfm2iNLEKnQM4yyJ8fPRopEBO4/6E8mZmEjGCN0KbDWGEpwTqFGJE
	xvoXOAOK8oVBFq9uluXGCB/EAI/w/RypqIJJKTqDxq18VYzbShBt1XCS3YXu/XdGlt5rz+cVdFo
	3+BJ0xsbwsNyMfOZHzDHBJPjvcvgo8md4sII3Nj
X-Google-Smtp-Source: AGHT+IF2nY5sUUKedJh6t0lZAJfUplNomXL7wxO/B8yoLfQ4VFMlG7VR+DnMV13LK08DL6IiYdT4N0LPs9Z2usBi/cY=
X-Received: by 2002:a05:6902:1589:b0:e90:6dd7:6c0b with SMTP id
 3f1490d57ef6-e9332473cf0mr3923197276.29.1755283347380; Fri, 15 Aug 2025
 11:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755005205.git.steve@sakoman.com> <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
 <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com> <185B5FA5D8F47DA2.29447@lists.openembedded.org>
 <CAOSpxdbPQMZPWfc6CVkF-Ew0WeQwaQp6n-c8w=CShBVFmnaPOA@mail.gmail.com>
In-Reply-To: <CAOSpxdbPQMZPWfc6CVkF-Ew0WeQwaQp6n-c8w=CShBVFmnaPOA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Aug 2025 11:42:01 -0700
X-Gm-Features: Ac12FXzWm_sRdCm3BJ2I4wc_i0UlyW4tfR-3zzANFXNRdjx4N_E_Fqd-TBmii7Q
Message-ID: <CAMKF1sogvU-bB8sApyMFN7rGbke9FfuHJ17RLy0-VWY6qq1pOQ@mail.gmail.com>
Subject: Re: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Steve Sakoman <steve@sakoman.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 18:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221991

On Fri, Aug 15, 2025 at 9:03=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Wed, Aug 13, 2025 at 9:14=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, Aug 13, 2025 at 9:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gma=
il.com> wrote:
> > >
> > > Is this more than cosmetic in walnascar? If it isn't, than should thi=
s
> > > really go into a stable branch? In my understanding this will require=
 a
> > > brand new sstate cache.
> >
> > Khem,
> >
> > Can you comment on this?
>
> I need to wrap up the changeset for the walnascar release, so I'm
> going to remove these two patches until we reach some consensus on the
> need for them.

Please drop.

>
> Steve

