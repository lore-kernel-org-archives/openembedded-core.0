Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F272C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 09:33:10 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.3085.1678267984955366177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 01:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQBg1mwQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id cf14so17428203qtb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678267984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk5ROPm4GoBbLIssqknEPP4IeQHao8+ycowicmZjsvw=;
        b=QQBg1mwQUVw3tHA2yC6FZWogeOtX+pO17E1lmygpKqObZrxPrXTURXcX7oLTmU8gZ1
         m3zK31MeK0oAOvbA3b3YDIORpffnMaPmBDgS6Fj+eKHAcjtNEbz+FjMXBRp9U+pztw2M
         qEwjYksiG2BEA1ov2cmkSNmePVnSw6WPUvgkp2umZh/WJ4tIvZiCzGVbkOKsRsaOpYqC
         eChJZdavlVyjIM+KuHVhR0Yv4gFQv74JhdgpNWS76LTAXbgIUZpFbLSSssl+4MpOgoru
         8PkFOqZujYweXiB518iq0RPLwYSBVJFegj2GS8Nvwc4UhuxMJihqNiAo17Rn2lNhZcRG
         NlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678267984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xk5ROPm4GoBbLIssqknEPP4IeQHao8+ycowicmZjsvw=;
        b=xr5/3F4T1Db3NN1iqCzTG5K6xENcaLMXBJqEB5tvQR1P52+fBvHVlIQa+WNlQOF1M7
         JYV8B0lPtwoVmgzu6x+Ap8qiuFhjKifn4SR5ucvflvExrPwZO4/YcAFYYy+Ctkb4OAY9
         PqpVA2v0zKN6pkkhVAy8Mpgp46kWhcsqW2UyNEfSu1WZgUKv7DW6OIbetEcS7wf6Q2T+
         IgYseMCnqGku2aTVUb0HxYEtGrqzvWWOZ6pWj2cE8i9f5mh5ABHIyD+sX3blIT7zNOlK
         1FE+ISralyd03Ieax5jFM7Fx4kixp53lUsG/Lhbl49P+gHF+1RCbC+5wMGApczh0GvT0
         XFDg==
X-Gm-Message-State: AO0yUKXruxwztLX0uYuLwFRYXvh99M6aHl82a1lVaAnJc69xKXN+nhdR
	nH1Chwbv52zty67bZwMTMFszM8QkvLEAKFKcz18=
X-Google-Smtp-Source: AK7set89+Kpw6ZBhsLXiY8PgoLlnfKpi1rxFXuraXY/1UtuqiMCBscOFYgojxmhdWqzJkn6TC4x2Hsw8pKe/ccaL/A4=
X-Received: by 2002:ac8:410c:0:b0:3c0:3c09:a4a3 with SMTP id
 q12-20020ac8410c000000b003c03c09a4a3mr1298436qtl.6.1678267983730; Wed, 08 Mar
 2023 01:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20230224153157.20305-1-peron.clem@gmail.com> <20230224153157.20305-2-peron.clem@gmail.com>
 <CANNYZj8eEmDuz-PcRDNC4+4=E6DdqT85=+X3Kw9_2z17Z8Mxeg@mail.gmail.com>
In-Reply-To: <CANNYZj8eEmDuz-PcRDNC4+4=E6DdqT85=+X3Kw9_2z17Z8Mxeg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 8 Mar 2023 10:32:52 +0100
Message-ID: <CAJiuCce0sogyUQOzanuDziTQMZnX=QyDbKDRkTuDLbFOpFwrAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] runqemu: add an option to enable
 guest-agent virtio device
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178160

Hi Alexander,

On Mon, 6 Mar 2023 at 07:30, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
>
> Can you please explain the use case? Who would want to enable the
> option, and what could they do when there's a running qemu?


Guest agent communication is useful to retrieve some information about
a running VM.

In my case, I use it to get the IP address of a VM configured using
macvtap which is not able to directly talk to the host over IP.

BR,
Clement

>
> This kind of information needs to go to the commit message, so we can
> document those things for the users.
>
> Alex
>
> On Sun, 5 Mar 2023 at 21:10, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.co=
m> wrote:
> >
> > Add support to the runqemu script for a new option, 'guestagent', that
> > enables the virtio serial port for host-to-guest communication.
> >
> > Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  scripts/runqemu | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index def11ea911..e71a1e8828 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -82,6 +82,7 @@ of the following environment variables (in any order)=
:
> >      kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capa=
ble CPU required)
> >      publicvnc - enable a VNC server open to all hosts
> >      audio - enable audio
> > +    guestagent - enable guest agent communication
> >      [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
> >    tcpserial=3D<port> - specify tcp serial port number
> >    qemuparams=3D<xyz> - specify custom parameters to QEMU
> > @@ -216,6 +217,8 @@ class BaseConfig(object):
> >          self.cleaned =3D False
> >          # Files to cleanup after run
> >          self.cleanup_files =3D []
> > +        self.guest_agent =3D False
> > +        self.guest_agent_sockpath =3D '/tmp/qga.sock'
> >
> >      def acquire_taplock(self, error=3DTrue):
> >          logger.debug("Acquiring lockfile %s..." % self.taplock)
> > @@ -526,6 +529,10 @@ class BaseConfig(object):
> >              elif arg =3D=3D 'publicvnc':
> >                  self.publicvnc =3D True
> >                  self.qemu_opt_script +=3D ' -vnc :0'
> > +            elif arg =3D=3D 'guestagent':
> > +                self.guest_agent =3D True
> > +            elif arg.startswith('guestagent-sockpath=3D'):
> > +                self.guest_agent_sockpath =3D '%s' % arg[len('guestage=
nt-sockpath=3D'):]
> >              elif arg.startswith('tcpserial=3D'):
> >                  self.tcpserial_portnum =3D '%s' % arg[len('tcpserial=
=3D'):]
> >              elif arg.startswith('qemuparams=3D'):
> > @@ -1366,6 +1373,12 @@ class BaseConfig(object):
> >              raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL=
!")
> >          self.qemu_system =3D qemu_system
> >
> > +    def setup_guest_agent(self):
> > +        if self.guest_agent =3D=3D True:
> > +            self.qemu_opt +=3D ' -chardev socket,path=3D' + self.guest=
_agent_sockpath + ',server,nowait,id=3Dqga0 '
> > +            self.qemu_opt +=3D ' -device virtio-serial '
> > +            self.qemu_opt +=3D ' -device virtserialport,chardev=3Dqga0=
,name=3Dorg.qemu.guest_agent.0 '
> > +
> >      def setup_vga(self):
> >          if self.nographic =3D=3D True:
> >              if self.sdl =3D=3D True:
> > @@ -1496,6 +1509,7 @@ class BaseConfig(object):
> >          if self.snapshot:
> >              self.qemu_opt +=3D " -snapshot"
> >
> > +        self.setup_guest_agent()
> >          self.setup_serial()
> >          self.setup_vga()
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178051): https://lists.openembedded.org/g/openembed=
ded-core/message/178051
> > Mute This Topic: https://lists.openembedded.org/mt/97410707/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

