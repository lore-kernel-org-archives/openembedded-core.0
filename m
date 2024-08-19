Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F30DC52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:34:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.213849.1724081655294970317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhqR5lDC;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-530e2235688so4814057e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724081653; x=1724686453; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOwLcOlNPWY4bzqrsKxIk58Kbd6bZXfobaH7OXpoCVw=;
        b=XhqR5lDCotdSvSW4CWkeJPAVM2s+a+Kmi8HKFvrR8Cp843f8JB3YJ/37zdtn0BM/bq
         /pYUrWALq6y+7HXYKvYqWA8WNne9RumFf2UBoRXbbkx/py2e2wbssPyYz74qbAOgpq4L
         qZKIM7AP0z8flS5TUcFxhf3rAqeObXDIpbpju3rShV87IJk6je1Njk18F99QDC8g3vZp
         3L5aCQ0Xa+V3rI8qlE/fBjCo2HgOG59Euw/q6Ta5tW1DaXovIFHFxvJF49BMqFAlPyup
         xPW99SJvfxewW8E4JnSBdZKEqE0G1UQ4nlQwusWAUtriezAS1xTuyoAOb4qNcwxKjGqo
         MLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081653; x=1724686453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOwLcOlNPWY4bzqrsKxIk58Kbd6bZXfobaH7OXpoCVw=;
        b=FNSuBY1b4bw5LH0bab4Kg8wSlNbuuGm8ZY2/yK2R6b9dpRlyqH81TSb5Y7TB8Rmhjj
         khgFb5EBoErwGZ7rCqFvjqmURLBm+AxKN3C+OXmxepu8WYjwT/2wtgAdhltzujrDsSYO
         hAqb8qZmrY7VhMw3BsxyRv2PIczHWwBKX9YLNqW3q5SicNzG/O9DQMI+8JVBI/QE+42m
         CCTpJ2X4EXR2BjOmoiMh5MWCMlwdP3eEQkZWIJ8FKOT1qtQVUKzndcmMKyUZipl9Hzkw
         g6wLD23rx6apATIK1jTozmmS1PIwGPlsEOTleiagPjqfCWLeb2xMi+K7dsYQy19D1oNg
         k2nw==
X-Gm-Message-State: AOJu0YyFzPI1as78WTgBodkmcYBAmBEjiIKCFiS0nrevnQuydq6Y719P
	okQpqO5vuPmK9vJVKKzNsXHPpdFNtBcUpekBqQaJRf3s5xiOchXsnizfOEVCf9FllX4TKXsrtqo
	miIHjzBejAh+O74HSX3EyZnVGRfE=
X-Google-Smtp-Source: AGHT+IHGSUwXmhEd6ZZDYGoOXH4SmeWb1i75GY4X2bCQArqXyvBY8zVdsm/9J2Gq3dVASDr91ANaS/vxzoUixqKd+8c=
X-Received: by 2002:a05:6512:33ca:b0:530:ba4b:f65d with SMTP id
 2adb3069b0e04-5331c6b2453mr6565016e87.28.1724081652705; Mon, 19 Aug 2024
 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240819145140.582935-1-aoifepowerIris@gmail.com> <CAFpNyFw0xR-MqoVmQSjPYGbEwNZkPdPWSx2JP2rnOi=5K1g0cQ@mail.gmail.com>
In-Reply-To: <CAFpNyFw0xR-MqoVmQSjPYGbEwNZkPdPWSx2JP2rnOi=5K1g0cQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 17:34:00 +0200
Message-ID: <CANNYZj_fHpg3Xi=qKYTBEHX0ueFahihcik-4XuB8prsAnvxp7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Util-linux: Adding missing ptest dependencies
To: aoifepowerIris@gmail.com
Cc: openembedded-core@lists.openembedded.org, jasper@fancydomain.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203516

What the failures you are seeing actually are? We do run util-linux
ptest on the autobuilder, and it isn't failing. Is it different for
you?

Alex

On Mon, 19 Aug 2024 at 16:55, Aoife Power via lists.openembedded.org
<aoifepowerIris=3Dgmail.com@lists.openembedded.org> wrote:
>
> Note: with ptests the adduser package is only avaliable in the meta-opene=
mbedded/meta-perl layer.
> Does this need to be included elsewhere for the ptest use case?  Should i=
t be added to the core layer to allow the ptests to work correctly?
> Thanks,
> Aoife
>
> On Mon, Aug 19, 2024 at 4:52=E2=80=AFPM Aoife Power <aoifepoweriris@gmail=
.com> wrote:
>>
>> Missing adduser and eudev to RDEPENDS dependencies for ptest
>>
>> Signed-off-by: Aoife Power <aoifepowerIris@gmail.com>
>> ---
>>  meta/recipes-core/util-linux/util-linux_2.40.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/re=
cipes-core/util-linux/util-linux_2.40.1.bb
>> index a1aab94055..f1c200c28b 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> @@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
>>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
>>
>>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"
>> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs find=
utils grep iproute2 kmod procps sed socat which xz diffutils"
>> +RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs find=
utils grep iproute2 kmod procps sed socat which xz diffutils adduser eudev"
>>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd=
-mod kernel-module-loop kernel-module-algif-hash"
>>  RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"
>> --
>> 2.46.0
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203509): https://lists.openembedded.org/g/openembedde=
d-core/message/203509
> Mute This Topic: https://lists.openembedded.org/mt/107982088/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

