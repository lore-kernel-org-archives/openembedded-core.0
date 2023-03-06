Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BD4C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 06:30:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.27789.1678084218325404020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 22:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7T9qFUS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id i28so11363869lfv.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678084216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq2iocVbYtfb9xmyUt2rb8hU2nAc9hWmuJ7W0/41g58=;
        b=e7T9qFUSVGmb3ccsrUQL69+cVRtarUYfGBslXsf7SW3H7UGam3QwE6rr2fGMaH8x9c
         Fhifk6AAoR2Fwbo6HqsRn+8fg/8YkeovWZ9MoVzZ+SZa7b+k84hpXLM8O3z59JwPDhb1
         MOTgd3OAEUNBqjreLTRycjT1ZufTtrf4460oh+lTstC/TVsht/VFTTjxMVW5m5CZbu8g
         peBtj8GVdaVE3JSICs/ES0F84osSnf21a41PJg5tmViZPopigCwmKKRMcfna2zm7zsRc
         VpkZxF6ik72erqIx+Xv4w+kHzcok/T2ALTHSg1AL3NOZ2Eo6sMvFTyjbJvo8d8Sdrf/s
         belA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678084216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mq2iocVbYtfb9xmyUt2rb8hU2nAc9hWmuJ7W0/41g58=;
        b=ns+Q6mV2TnPiG3qUqD55CwBYLJjJc/FZ6c8j9zuomG0Txq66fcsK9pBWjTCDsuSAtn
         W24x6Z3gonqUl9EeP3p5ULqmMVCb3mseN9YMq+fp6EntaDMI0n2EEMrW8OkeCaYXyvLk
         KGnMwPNGPECJjBpuTNF0epLHjfgtweA5zzW0HezUNQS5PurDSVmqS+35wKsNu1rZi9Vm
         Yj//+7YUFYn6VsLLgC6OnXaeVnu97IoQ9GlzAuLZFO4JmTrd6jTBCvOoB7TvUAKLNUoz
         3KNxNkvwSoVXD/Qym0ScFzjxdW+URRIy+4AxBxe6gC7QcTK/1xxTrSW7IWw7Wssc3/qI
         gcIg==
X-Gm-Message-State: AO0yUKWy5qafnaBRn8TU7zh9FWmvL8D5EOVGhptAPBLMANAlmTqZN6bL
	B7HwmFB+lAINvmyQu6lGDfLOB3STXfr9105e8Jo=
X-Google-Smtp-Source: AK7set+I7rK41C4gOLCfbB0FqzzzWqDur6jdH2nhlGN2KPNLme5HEQB7PLjDt+gAG7eR2zDDBo+as06YZWXxB18eN8I=
X-Received: by 2002:ac2:5fa7:0:b0:4db:f4b:a552 with SMTP id
 s7-20020ac25fa7000000b004db0f4ba552mr2840956lfe.13.1678084216311; Sun, 05 Mar
 2023 22:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20230224153157.20305-1-peron.clem@gmail.com> <20230224153157.20305-2-peron.clem@gmail.com>
In-Reply-To: <20230224153157.20305-2-peron.clem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Mar 2023 07:30:04 +0100
Message-ID: <CANNYZj8eEmDuz-PcRDNC4+4=E6DdqT85=+X3Kw9_2z17Z8Mxeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] runqemu: add an option to enable
 guest-agent virtio device
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 06:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178059

Can you please explain the use case? Who would want to enable the
option, and what could they do when there's a running qemu?

This kind of information needs to go to the commit message, so we can
document those things for the users.

Alex

On Sun, 5 Mar 2023 at 21:10, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 wrote:
>
> Add support to the runqemu script for a new option, 'guestagent', that
> enables the virtio serial port for host-to-guest communication.
>
> Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  scripts/runqemu | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index def11ea911..e71a1e8828 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -82,6 +82,7 @@ of the following environment variables (in any order):
>      kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capabl=
e CPU required)
>      publicvnc - enable a VNC server open to all hosts
>      audio - enable audio
> +    guestagent - enable guest agent communication
>      [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
>    tcpserial=3D<port> - specify tcp serial port number
>    qemuparams=3D<xyz> - specify custom parameters to QEMU
> @@ -216,6 +217,8 @@ class BaseConfig(object):
>          self.cleaned =3D False
>          # Files to cleanup after run
>          self.cleanup_files =3D []
> +        self.guest_agent =3D False
> +        self.guest_agent_sockpath =3D '/tmp/qga.sock'
>
>      def acquire_taplock(self, error=3DTrue):
>          logger.debug("Acquiring lockfile %s..." % self.taplock)
> @@ -526,6 +529,10 @@ class BaseConfig(object):
>              elif arg =3D=3D 'publicvnc':
>                  self.publicvnc =3D True
>                  self.qemu_opt_script +=3D ' -vnc :0'
> +            elif arg =3D=3D 'guestagent':
> +                self.guest_agent =3D True
> +            elif arg.startswith('guestagent-sockpath=3D'):
> +                self.guest_agent_sockpath =3D '%s' % arg[len('guestagent=
-sockpath=3D'):]
>              elif arg.startswith('tcpserial=3D'):
>                  self.tcpserial_portnum =3D '%s' % arg[len('tcpserial=3D'=
):]
>              elif arg.startswith('qemuparams=3D'):
> @@ -1366,6 +1373,12 @@ class BaseConfig(object):
>              raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!"=
)
>          self.qemu_system =3D qemu_system
>
> +    def setup_guest_agent(self):
> +        if self.guest_agent =3D=3D True:
> +            self.qemu_opt +=3D ' -chardev socket,path=3D' + self.guest_a=
gent_sockpath + ',server,nowait,id=3Dqga0 '
> +            self.qemu_opt +=3D ' -device virtio-serial '
> +            self.qemu_opt +=3D ' -device virtserialport,chardev=3Dqga0,n=
ame=3Dorg.qemu.guest_agent.0 '
> +
>      def setup_vga(self):
>          if self.nographic =3D=3D True:
>              if self.sdl =3D=3D True:
> @@ -1496,6 +1509,7 @@ class BaseConfig(object):
>          if self.snapshot:
>              self.qemu_opt +=3D " -snapshot"
>
> +        self.setup_guest_agent()
>          self.setup_serial()
>          self.setup_vga()
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178051): https://lists.openembedded.org/g/openembedde=
d-core/message/178051
> Mute This Topic: https://lists.openembedded.org/mt/97410707/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

