Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A68CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:35:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5524.1779100546250681572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TyggyQlv;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-913cc4d7c71so154140085a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779100545; cv=none;
        d=google.com; s=arc-20240605;
        b=CkSGnqEPxOaWPvrOcV8lR5+edm7niEKBsXdTV7mYIhrP21J+OWoH7cyLu3SMqfuENn
         0K0i5jvr5x4D9RiodL6OFOi13L94tmPGCcf7UlpUJx44SD7Cc/Ie/EDv2cs/o8fE5DDf
         CPkzorr8gQ7HO4Z6AeL+XoPFKKiZMk3qZbfVJJDafLZrVSemuWNWcY3lf+9u5vuPIFU7
         hXCY+hnAfUe/nvj+p4xpcueWWDhyv2Q5YUBQ/TiVSbTeMS7ukAZrB+UZejn60JiI5E/s
         88tzube0sffLCRxim1znUewmSrwM1XICgvNU24Fu58l93z2Lb2VC8xk50xfxyOV6NDXD
         DXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Sh2ydijn48a9t5mctyL95BF4TWMaKsGqdUxIQqTFWo=;
        fh=doo0ozA7yuRNN7b2GA6CtH0K68k6mn/orAC/LkdRLno=;
        b=UvJ6SIkEBwS6QlGRrsKfb6ol3djO8/mCZ/5uVfjhPZ1CcJwQF6ib9/EIRZFcgamEsD
         3bfsHFWxY4Wda37lWt9fP5fJf9FZZhqkj9klTVKaV88bxo/yFwyfN0kIEozeNFKyixvF
         rwLuWGnE52SPnFSD8nCgaWRJAkplBDox3eydD7zEVBh5zo1TXNLYytM7nVtKy2ORU/yA
         cE6L0xTHsESl6AGV8C2ptQEwLWbAVRSAzghl6ksd9W/+uGlRtpXORwU0vwy8CbTEjyyz
         B5oPbQV5WXeMFLjU6ZCQI/w+iIkmLjtRkiGlv+kJ6aGo84TeuEmOokuc1IIq+5dHfTV3
         vAlw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100545; x=1779705345; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sh2ydijn48a9t5mctyL95BF4TWMaKsGqdUxIQqTFWo=;
        b=TyggyQlvTNoYG6FG4YLl3ZcqGMh4UOjh8hi50z9zYW6OaCCfuBxJpimiEugxM+CIMm
         4Lqp1BgjFKYXSj95QVijk8yIHOUoXvAFoMQVBzLn7aaoUd6skNXwF1cvvxfEFqxGNYDn
         LzB5wG97PtGnjAqlrbmo2v3yi/VZFdROLoV1PyUJQGovUQRZAu2nMhZgZ/1LUEz9QXnh
         dbIKwgnl9VU+FgAgNcgPkyiWwSHGlT6q9hSRv7iN10jZsMfuSE+NP8haP5KdcHWv0mDz
         wKLW/swHoUqHMYccsy0zosPt9VgAwb4wpmqH6ta3IeH6ZaG0JHATbiAEsbjuyS5w57gx
         3mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100545; x=1779705345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Sh2ydijn48a9t5mctyL95BF4TWMaKsGqdUxIQqTFWo=;
        b=lI8KbaR8Gb6oQ4V0apV0uL4sL8qloXHaLDpQ3faA8r8NErTg4CyFxeEzDjgnMy/b/2
         6h1eqfvs8wHvLNfjxbFRqsnW/pT9Dk1L9SSakqN8mWbw43pRCjd0XqjXdElng5FvLT+g
         RQoXmRzbLwm3Ns/JlN5AJJV0dyaIORqHHnUR9Jimy8bXmRwNJscMB+WYGwqDUaBDjSSS
         HH6UrhczVRFcMX7ZTDO3CSMB/exwUdCjPNp9CSrv6ItF/9pwTanIGXd/hDJD0VYPQgSG
         oA0XDBfAeXn4FEj7cX+QTjq+6rH+fmPLKzdYjYnPGURRxYtwvPrIv8TxMO+scgilwNwv
         Ptow==
X-Gm-Message-State: AOJu0YwzEzfAvYxoSW6RqZEuvE5usfDlMPg6nY+DAx3zyemzRFMNDDlc
	oklNeVeWzwCIVYqBruTICmpHS2owLZtO1+f46Sm6RncJtzSCjyMblkoAOZRkuSSY7YaJTGccB1D
	AEc9i3bNzosIF4j6g7oDrXJ+OgUIPvz0=
X-Gm-Gg: Acq92OHmcGlM8U2eu4a7zcczqB2ncqpejBRpK+w4pSeJafpKNF2l/Nx3zGccgLlXkx/
	i+rMhWjaE5LuTjAQ/i1FNWB3gOlFUY4u0VOJTsl9SyBsfqVuWRziZWpEI/aygOtIegrqm0mQssK
	5rxXBCVWIkS0DdAokchHUuhhTzO2wyV5mN/HEpeIuncTKHD/krR6LTUonkUPadZBQsaZcR2mXBp
	90rhxxLh/VoJMSnt20SwPmc0J/2x3jWetpyeqME9FmDKNIuIwZoTZSmCtoncBg8Ul1a4Bb7P2wg
	q3XQ3Q1Jfea1+Y7q6ux/d+BTbPRZ2XIpgrUqOgZHrg==
X-Received: by 2002:a05:6214:3386:b0:8ca:1ddd:a6b8 with SMTP id
 6a1803df08f44-8ca1dddac4cmr185131976d6.14.1779100545174; Mon, 18 May 2026
 03:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260517133241.2972125-1-joaohf@gmail.com> <20260517133241.2972125-2-joaohf@gmail.com>
In-Reply-To: <20260517133241.2972125-2-joaohf@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 May 2026 12:35:35 +0200
X-Gm-Features: AVHnY4J-IwRz4I6uAfI6pYAYui8xMXUL76dKkjLnFEeAQ2STic1vRodqaVNH-aQ
Message-ID: <CANNYZj8zTv6dv3=jq9+z02N3sbw8Q+npr=3H+fc6wOEKO-XX-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3targetconfig: export native python paths
To: joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237217

On Sun, 17 May 2026 at 15:33, Jo=C3=A3o Henrique Ferreira de Freitas via
lists.openembedded.org <joaohf=3Dgmail.com@lists.openembedded.org>
wrote:
> +setup_nativesdk_config() {
> +        export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> +        export _PYTHON_SYSCONFIGDATA_PATH=3D"${STAGING_LIBDIR_NATIVE}/py=
thon-sysconfigdata"
> +        export _PYTHON_PROJECT_BASE=3D"${B}"
> +        export PYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python-sysconfigdat=
a:$PYTHONPATH
> +}

Redirecting to native configuration does not look right.
python3targetconfig class is meant specifically to provide target
python configuration, regardless of whether the build environment is
direct yocto, or yocto sdk.

You need to check why the target sysconfigdata is not found, perhaps
by comparing how the recipe builds in plain yocto.

Alex

