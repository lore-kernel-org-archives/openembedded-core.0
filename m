Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C08C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:22:38 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.5535.1676535748117409190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EL1BKJr7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1676535748;
  x=1708071748;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=/vj/hQFLOyikz31IrdWZ6Z7uovDSMSf/9B8pxwvrX+o=;
  b=EL1BKJr74TYfvH7DxP6q7TzuikA5IbaZ6C82yZHEUGwLrhVet5bxTWFQ
   0Y8ucBLDIAZj2iVj2XLXuigAu2KIv05kNMZ4wW36gQYlFNWLc6OMIg0nF
   7hlFqTqpH+t7nEsm+LS7bW0tyxCNmUYCPIMnzI1r0oOvJ0rjTFdaih4/v
   YR12Yx5ZNQqMX+ALWnqzeJrmzAMKJ5ztbfXS0fUEmHom72U9+F9XmOqTy
   pNL8oLohIxuLBm49MNL0i7YJ3nNLa4PGlutJjC1Zi0M+n16ib6+QoJbrZ
   Gp0PfYkG5wc+0jDlAnzPRvgF5RLFeMQ60FPMtUahDCLrAh5IKq5+dp1CX
   A==;
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
 <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
 <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: Otavio Salvador <otavio.salvador@ossystems.com.br>, Jose Quaresma
	<jose.quaresma@foundries.io>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
Date: Thu, 16 Feb 2023 09:21:03 +0100
Organization: Axis Communications AB
In-Reply-To: <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com>
Message-ID: <jwqv8k26mv2.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177275


On Wed, Feb 15 2023, Jose Quaresma wrote:

> Hi Octavio,
>
> Otavio Salvador <otavio.salvador@ossystems.com.br<mailto:otavio.salvador@=
ossystems.com.br>> escreveu no dia quarta, 15/02/2023 =C3=A0(s) 13:25:
> Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma
> <quaresma.jose@gmail.com<mailto:quaresma.jose@gmail.com>> escreveu:
>>
>> The modules-load.d [1] - Configure kernel modules to load at boot
>> should install their configuration files in /usr/lib/modules-load.d.
>>
>> The modprobe.d [2] - Configuration directory for modprobe
>> should install their configuration files in /lib/modprobe.d
>>
>> [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
>> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
>>
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io<mailto:jose.qua=
resma@foundries.io>>
>
>
> Did you validate this using busybox only? Using sysv and busybox need
> to be validated as well.
>
> Please drop this patch series because it doesn work with busybox.
>
> Looks like busybox don't support other path than /etc:
> https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D669c40ed8eb=
f480c95ce36135104e474e361a7e6#n658
>
> So I need to implement this in another way, maybe relocating the files fr=
om /etc only when systemd is enabled.
>
> Thanks for raising the issue.
>
> Jose
>

Hi,

Please consider https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212
as well.

--=20
Ola x Nilsson

