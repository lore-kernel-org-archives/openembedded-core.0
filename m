Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32337C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 20:54:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79499.1782680076623647083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 13:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qE0gY79C;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47013e1996aso931799f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782680075; x=1783284875; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpgXFWYtFU+nu51jqf8dBYmgZ37+Ob+q73qbZIPd1Wo=;
        b=qE0gY79CWcqBBWr9E77OYOy5AdGtR64g+0CSpyG1H2ivOsUTwMwRYcGHDu7rGyIE0J
         t+8UGBi/HcCdpRdtJPpBpPpY95bNyZzXwYVLV9YJK4mgoofWxsySCaXbLjKuRk1ZtXun
         +TSXvMHD3V1LMQe1M8RbG+sUbyelElyvA396Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680075; x=1783284875;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpgXFWYtFU+nu51jqf8dBYmgZ37+Ob+q73qbZIPd1Wo=;
        b=OuiQHvPYDEqi7w2IFpVXz9kixzonjpuEtNIIGgmWcCFzXlz3XD9o6kRXd2EB9dwEGV
         oRDeJOmFHJF3NMiGhe9Ms0MnPcb2So5oajbajAKQOk7QwvP8f2gQ5tuPGnijCNvNOvQm
         Bm/FHcADCz/kubIU1qayw4RDraUBssq3dV7n9GkeA7Oj3VRyMC7GaoIrdWTUdfyI3Bbt
         6LxFdL0oZj04PKzqIFK0wr35QuJH+6t4LFFh7Q6bpmNlK/zM7sdcLEumJwFpo/Zu6RCm
         YFbWe1PwOUl6YlBY31WSc1jIRPPb+cTIry/B8823C8eng/eA9/Z7QVYcXruXC+VzmMEo
         JC7g==
X-Forwarded-Encrypted: i=1; AHgh+RqnStuQQHiawzztkBAlEzDEt0eRX8og4Hr1PhUaTkVPebVII4XqkSjFO6L+wttys9EC8ut0pwSSiPG7ywwdCj41yA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqKma1h9GNjwMLnqQifaE++YkCOxar1gDYlruO98AUZ5TTTLOe
	XNvW4CLTkGYJBI2v4JYOq40y1Uix7ULgOosqAF5rBqEhalni/nspDJAfFzf2IUTTglw=
X-Gm-Gg: AfdE7claLqL+oqxFCpPVCrineSsb8mRzLt0TzdMNynr0WFdRx46RTe1aZR/N/yPCX3v
	045lUGKN4QkLOsW0zJhCFHlaHD/N+P8OGii8BgIUcGY18yXzrLnY9r6GM5+QquAnu54gYq9i/q7
	j7/WCmZtYjcWQpYxw6nBuRelhMd253zJ35C0v2wp4IwqELq+Y3cklYW534F2lfbf2ZwqR9Mo0Zd
	x74ACKDb4aqfj+tZHmjMgOhyQCAq9ZxcsJkfDrJeLD4pICchWBbtcTcE4hgnKBmmGoJ3BnkFwe3
	zrUH/e3/15ZiifWj2nodwGiGWwHtEPAdHIKYlSjzaNWQhJJuLc8PjB1XI4T3/JDv5giVZMP0F1U
	kE6UhxHqtlAzic1rc6ed0dmZYFQW6WI7qRy7Qy/6uHq61+mfncoT6KOwEIAYbs2ds1WNG+7s3rw
	mFcCK7COB3maLUGCxupeWVcxbWsnsZmR4NgVd0ikwo5WnCtNXY1qYD81nk0Z0nynIvDRtqKGsEm
	zw4Tw==
X-Received: by 2002:a5d:6f18:0:b0:46f:7d90:8114 with SMTP id ffacd0b85a97d-46f7d9082dbmr14560642f8f.14.1782680074676;
        Sun, 28 Jun 2026 13:54:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa004db220001799fd29.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4db2:2000:1799:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm36348197f8f.4.2026.06.28.13.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 13:54:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 22:54:34 +0200
Message-Id: <DJKZCG8PLJ4N.HG3MQ0DUAVVU@smile.fr>
To: "Trevor Woerner" <twoerner@gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for
 nvme devices
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <aleksandar.nikolic010@gmail.com>, "Patches and discussions about the
 oe-core layer" <openembedded-core@lists.openembedded.org>, "Aleksandar
 Nikolic" <aleksandar.nikolic@zeiss.com>
X-Mailer: aerc 0.20.0
References: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
 <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr>
 <aj8Ws4BY4p5RTISk@localhost.localdomain>
 <CAMSfU+7MH7MrahkitU8Z-c0+dyZS=37bqo+V1iAczOOnUANRdQ@mail.gmail.com>
 <akASOiHwAAO8YQj-@localhost.localdomain>
In-Reply-To: <akASOiHwAAO8YQj-@localhost.localdomain>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 20:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239715

On Sat Jun 27, 2026 at 8:11 PM CEST, Trevor Woerner wrote:
> On Sat 2026-06-27 @ 10:20:50 AM, Yoann Congal wrote:
>> Le sam. 27 juin 2026, 02:18, Trevor Woerner <twoerner@gmail.com> a =C3=
=A9crit :
>>=20
>> > On Sat 2026-06-27 @ 12:51:14 AM, Yoann Congal via lists.openembedded.o=
rg
>> > wrote:
>> > > On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via
>> > lists.openembedded.org wrote:
>> > > > From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>> > > >
>> > > > In case wks file references nvme, update_fstab() function will not=
 add
>> > > > prefix 'p' before the partition number, as the if condition only t=
akes
>> > > > mmcblk into consideration.
>> > > >
>> > > > In case of nvme0n1 this leads that following entries are added to
>> > fstab:
>> > > >
>> > > >     /dev/nvme0n11
>> > > >     /dev/nvme0n13
>> > > >
>> > > > instead of:
>> > > >
>> > > >     /dev/nvme0n1p1
>> > > >     /dev/nvme0n1p3
>> > > >
>> > > > The patch fixes this as it extends the if condition and adds prefi=
x
>> > 'p' for
>> > > > both mmcblk and nvme.
>> > > >
>> > > > Upstream-Status: Backport [
>> > https://git.yoctoproject.org/wic/commit/?id=3Df20cda73b495b75ef399c331=
f59b0e2401a3e76a
>> > ]
>> > > > Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>> > >
>> > > Hello,
>> > >
>> > > Sorry I missed it in earlier reviews but it look like this patch is =
also
>> > > needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits
>> > > above that.
>> > >
>> > > To accept this patch on scarthgap, I would need a equivalent patch f=
or
>> > > wrynose. Can you send that and ping back here?
>> >
>> > In scarthgap wic is part of oe-core, in wrynose it is not.
>> >
>> > For wrynose it would require a completely different patch; but it woul=
d
>> > probably be best to just update the SRCREV instead.
>> >
>>=20
>> Trevor, thanks for the added details.
>>=20
>> Do you plan to release a wic 0.3.1 soon? Or do you recommend we switch f=
rom
>> version based SRC_URI to commit based SRCREV (I'd prefer to stay version
>> based)?
>
> I just sent: https://lists.openembedded.org/g/openembedded-core/topic/pat=
ch_wic_upgrade_0_3_0/120007269

Thanks!

I've noted to try to backport it to wrynose when that land on master.

Aleksandar, Trevor, ping me if you see me forget.

Regards,

>
>> Looking at the master logs, I could take a 0.3.1 upgrade with the curren=
t
>> master state.
>>=20
>> Alternatively, we could backport Aleksandar's fix on top of the 0.3.0
>> recipe (as usual)
>>=20
>> Regards,
>>=20
>>=20
>> > > Thanks!
>> > >
>> > > > ---
>> > > >  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
>> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
>> > > >
>> > > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
>> > b/scripts/lib/wic/plugins/imager/direct.py
>> > > > index a1d152659b..b06e6a8f23 100644
>> > > > --- a/scripts/lib/wic/plugins/imager/direct.py
>> > > > +++ b/scripts/lib/wic/plugins/imager/direct.py
>> > > > @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
>> > > >              elif part.use_label:
>> > > >                  device_name =3D "LABEL=3D%s" % part.label
>> > > >              else:
>> > > > -                # mmc device partitions are named mmcblk0p1,
>> > mmcblk0p2..
>> > > > -                prefix =3D 'p' if  part.disk.startswith('mmcblk')=
 else
>> > ''
>> > > > +                # mmc and nvme device partitions start with prefi=
x 'p'
>> > > > +                prefix =3D 'p' if part.disk.startswith(('mmcblk',
>> > 'nvme')) else ''
>> > > >                  device_name =3D "/dev/%s%s%d" % (part.disk, prefi=
x,
>> > part.realnum)
>> > > >
>> > > >              opts =3D part.fsopts if part.fsopts else "defaults"
>> > > > @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
>> > > >                  elif part.label and self.ptable_format !=3D 'msdo=
s':
>> > > >                      return "PARTLABEL=3D%s" % part.label
>> > > >                  else:
>> > > > -                    suffix =3D 'p' if part.disk.startswith('mmcbl=
k')
>> > else ''
>> > > > +                    suffix =3D 'p' if part.disk.startswith(('mmcb=
lk',
>> > 'nvme')) else ''
>> > > >                      return "/dev/%s%s%-d" % (part.disk, suffix,
>> > part.realnum)
>> > > >
>> > > >      def cleanup(self):
>> > >
>> > >
>> > > --
>> > > Yoann Congal
>> > > Smile ECS
>> > >
>> >
>> > >
>> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > > Links: You receive all messages sent to this group.
>> > > View/Reply Online (#239668):
>> > https://lists.openembedded.org/g/openembedded-core/message/239668
>> > > Mute This Topic: https://lists.openembedded.org/mt/119915320/900817
>> > > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [
>> > twoerner@gmail.com]
>> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >
>> >
>> >


--=20
Yoann Congal
Smile ECS


