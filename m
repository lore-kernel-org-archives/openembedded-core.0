Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217FEC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 10:22:26 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.97916.1679653336088697259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 03:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAdpQGQt;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id br6so1537587lfb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679653334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpqkBiSq/esm0v5vzDIY77q/kmwsQxaObYpeOgHpDhM=;
        b=BAdpQGQtqDdvn8Chixo/W4ViKWKF4H06cGZtFGll2V537Fm1kAxFE88IKmINs+G58L
         hFIlRYFZpDSd85rK8Bz+06+ldAGeEz9EciU2GQ5xnRGMSoyvRMqAhadOAS3TNw+r134+
         0YIGwxRgfZaoizI352JbuFJpqk7a4h2x1qHKl5Vapa/lrW/OJlycfppBRYZMVYm2qtw3
         S7/5RK3Z9FI073qRMJxuOnJK7CzmcEBjx+DvbVuVGZNylGyVXI1tHHWs1g+7Vdypzd1/
         g0VmIPsDQ4bkygIyZrflu5ZmMLEKuPzn0xQopz2bFjyDnkMT3PhbuKz/T6dCsC8cdJ8d
         lA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679653334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpqkBiSq/esm0v5vzDIY77q/kmwsQxaObYpeOgHpDhM=;
        b=A4EKhcE7V/qkhej6xT2qxGEQUXmHGHV6KealR0IpNQdAAqLTzWTICdJG7uiETBATtg
         oXX2ld9YBZhrSIAmEFdN/NJd58WhkXqKB6tPteCvsufrZHxfc8ugiKnw3NXqgC8Rac4m
         2kV3loiFtX6nKTLNjvRxa2JuoAL9LGwguaBiJpFiIprcnu6bki7ebEboHxf8N7z8BqeN
         DQ1Jl+6X6RNR+c/sor4NLskJWpsY4Ue/FZUvX7IP1vxhNfVOOdZHfZ/ihKtHqiXgigfo
         H8MWxjXFtcRZ9uHbie3rhDvEeORlmkhFP06xLJw+LadDyIjd9o6ffxx3VAaHCsUI+Iz/
         o8xQ==
X-Gm-Message-State: AAQBX9cIrZHh5dp2F/ssSFur57PHQiRIhPiNK9c/jJs4U76lW7XYPGVk
	cnYjfQSNmdhSj9AqKV2gXhT3M3zUUNRj4zcnP9Q=
X-Google-Smtp-Source: AKy350Z4/QRd+pr9SON+g5Gfi3qh6IJgToneKRH7SGXXffyWhQS3iFHc2Xokb6Mm7FiWCpclp4D7vQUT/h+X3vM7mK0=
X-Received: by 2002:a19:5518:0:b0:4dd:a9e5:aa09 with SMTP id
 n24-20020a195518000000b004dda9e5aa09mr581881lfe.11.1679653334043; Fri, 24 Mar
 2023 03:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230324093326.3973899-1-kubiznak@2n.com> <20230324093326.3973899-2-kubiznak@2n.com>
In-Reply-To: <20230324093326.3973899-2-kubiznak@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 11:22:02 +0100
Message-ID: <CANNYZj8ZncGG0vdLeUw+porx+UBiODBQTF6naVLjmK7-HgiZ6Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/3] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 10:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179032

On Fri, 24 Mar 2023 at 10:36, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wro=
te:
>  # Generating introspection data depends on a combination of native and t=
arget
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native"
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection gobject-introspection-native', '', d)}"
> +DEPENDS:append:class-target =3D " qemu-native"

This does not seem right; if g-i is entirely disabled, then qemu
shouldn't be called at any point, and so should be in the same
conditional list.

Alex

