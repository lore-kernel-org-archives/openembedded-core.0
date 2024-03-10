Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3972C54E60
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:54:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.41740.1710089678154711067
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byXTH9xW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e2268ed96so2937486f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710089676; x=1710694476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdSV4TyfeqXOsXjNJIPQ+EqJSwbVnMUgH7mEAHr3hZs=;
        b=byXTH9xWAC+cqrpSB1CjuBJ3S4miE/vocsquR/ZyBAi1vV+6p9QXhNbKneOYWkID8G
         6gZuBXig76QQMSUE1KROZeER3kKgAOrIazKFgwry/OBlClqvWbsLBC57rUdSvZlQ+ZRx
         XuFw0YoGKuDvKcLi5Qp+dAYaDYDFwERO0l/29AgqPvHVCdQQbvVN/LAmtlFmZp0mleWD
         1kXAgddeSaWO0qvbPoOcpWfyNZ3K5mgdepaw9H+/Nm+SysgxqYsH9MH3w6H5O21oTZ7Y
         1huR0nC9jhQO+cLm9SIB7xuJi5CT8ExW37vV23eFK5BjjD7US/iAsdrNI5rvF3h70Hgb
         EVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710089676; x=1710694476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdSV4TyfeqXOsXjNJIPQ+EqJSwbVnMUgH7mEAHr3hZs=;
        b=XbwRkXJOmGugIJ90V7+K4vCJmstZvBq3zo2Z/pULAU4ketApsF8XrS867LzizvQ32N
         gHhv+ECaOXjuf7gp8RfdgaywCf57TUg+AO6HpKtS+MKIgDAWJFAY1WGNSY6zcIYZMK0J
         vAYSEP929sIHgjY2J5CpvK9/dBguOS2S7K7z1v5mAA8YSbSMKwIUmfWb7vuhm/qsy4og
         a6PwhAcZ3/eR4RfK1/dcinVg2v492jMb9sRzVttveBLX4VnLFDQO80oS5My4ekSbmyNi
         XKUlapm9xH5/ErnTWRjc7bqhoO88I0qbQRdA12d6Hn5AY5HVqywFKrCuyHiPc3E4DQci
         BvDg==
X-Forwarded-Encrypted: i=1; AJvYcCXG/4mdKkvsiv9OJPSVfIvh+P8JAgGSH3O0DJl4ooZ2BmlHwJdZU6xU6dQjMFf9rgkmVYXrlXyrhfCkxu4kyvv9LuIJgS/qljl8NatJJ0s1N9v/oaunL79d
X-Gm-Message-State: AOJu0YxUV1jJhXLaiHHPRZ0Mn+03vlZYpI8VVjSPu/ZchBT7CcDgzQfD
	1ap5ksPGmqFOTnT79EgZj1FeuDyWFZ2Tt2YWTJSbhS6H41h3+gHvaA7IdlfHJAREkfKSPwkujp4
	+XmWsD9uYS+1WqyqK6V4c2tCj2IYj114dTag=
X-Google-Smtp-Source: AGHT+IH6inLT/QGy8QNct6RCEqXVXUTHfPhaqxuOt8qwbTcNez4QdxVMILtwu9+jU7fKIogauAuiK6uHaGuPVvhxGvM=
X-Received: by 2002:adf:ed0e:0:b0:33d:7afa:fb0b with SMTP id
 a14-20020adfed0e000000b0033d7afafb0bmr2980755wro.15.1710089676384; Sun, 10
 Mar 2024 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdaa9X1ySRN2hgnqqEu1Hf34vTSaKGZayUaVxx09GSQOew@mail.gmail.com>
In-Reply-To: <CAOSpxdaa9X1ySRN2hgnqqEu1Hf34vTSaKGZayUaVxx09GSQOew@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Mar 2024 17:54:20 +0100
Message-ID: <CA+chaQdtaqzvpKqT3JHxBn7bSb8pfPAro4e_uOSjDMypqYcVqQ@mail.gmail.com>
Subject: Re: [OE-core] Final nanbield release build on March 25, 2024
To: Steve Sakoman <steve@sakoman.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196901

Hi Steve,

I'm not using nanbield, but does
https://wiki.yoctoproject.org/wiki/Releases need to be updated? It
says "Support for 7 months (until May 2024)" so I was expecting final
call for dunfell (which says "Long Term Support (until Apr. 2024=C2=B9))
before nanbield.

Regards,

On Sun, Mar 10, 2024 at 5:11=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> If you have any patches you would like to submit for nanbield before
> it goes EOL, please do so now!
>
> I'll be taking patches until around March 18 in preparation for a
> March 25 build.
>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196900): https://lists.openembedded.org/g/openembedde=
d-core/message/196900
> Mute This Topic: https://lists.openembedded.org/mt/104846319/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

