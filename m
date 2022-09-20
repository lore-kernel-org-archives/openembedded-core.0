Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABED9ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 11:35:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.10541.1663673704135030077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ehZQ3p7+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1456485wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=CMQ3q+dsw31tdkjW+yrzEMba5DSTlUsuwPHoQWuJ3g0=;
        b=ehZQ3p7+kUlQrffUKiS2dVIAqaepSgcW0sRHFaB/rEbEGX2aM86c2p6U/pf3vMqMqE
         FZFkp7frkoagoJNuW4rNIue3psmBeRt8WP1J4OsjmJ1qKK+pfIt7espyUvOp8Y/aFZiT
         xM4NsdwQH+ZhQ8ZWLzoEOlEJlM/vOgjWx0kJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=CMQ3q+dsw31tdkjW+yrzEMba5DSTlUsuwPHoQWuJ3g0=;
        b=PUG+BmqcvUJpd9/66e0Je0H+M+ft6NR7VaF0nY3ycWnCeiCs2M7OcKdooky1zo42xZ
         RIh5un70HSwp7vB/3WG8g/SiV2UtM9RBEB+hlft6VaCAnD50F0zwZbN3K1GqUP4W3F5R
         3X4IImPF3Ph0Panf8CiVAWVhuFaeYAeS1bYT9eg1PhrrSZwR4RWfRG86P5L6yMsywFPo
         Qzsel/BGe8QuZj8L1lS92tAUmWyk4qM6ir7XXBKvzTzCXT2SiUIaIU3ZW78wthXwLOBA
         gZQQ3zV4yu1FC40ipTQjosv3brcDy7UScIa0kB4jolmI+yPo/vYZ/PVS/3aTuzCOA69D
         ezPw==
X-Gm-Message-State: ACrzQf1rpd+DaA4ziZgUl9Hn3vy0+VZtPRnQqZoG+lrzzmYBDeO9ouTF
	k79+WD0gnd3p9HMxxvaJo3Vu3g==
X-Google-Smtp-Source: 
 AMsMyM6TE9JVvl5DW5wID93+WEcVUIUwwcziBsJi0hXaUIvNC9N+ds2zFk/K4qCW0oZowppG6Es+aw==
X-Received: by 2002:a05:600c:19cf:b0:3b4:c8b6:15c6 with SMTP id
 u15-20020a05600c19cf00b003b4c8b615c6mr2093410wmq.85.1663673702122;
        Tue, 20 Sep 2022 04:35:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 bv2-20020a0560001f0200b002286231f479sm1539925wrb.50.2022.09.20.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 04:35:01 -0700 (PDT)
Message-ID: 
 <f6cfef06795de6889cb88c56b94fabd851022643.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken
 native functionality
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2022 12:35:00 +0100
In-Reply-To: 
 <CAJFpGrO8nxxovNFPK=cvoARuV=uteB2FxwofM0GMd5ok7aRw6g@mail.gmail.com>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
	 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
	 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
	 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
	 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
	 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
	 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
	 <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
	 <CAJFpGrP11ifFQnK1n3MHvMUaJPwgh6igdav7zotvRQevX70vwg@mail.gmail.com>
	 <CA+chaQd5ZYV4jL6jRB-_M9LJuVqp13vHRE5zkueTjjXdp8xWGA@mail.gmail.com>
	 <CAJFpGrO8nxxovNFPK=cvoARuV=uteB2FxwofM0GMd5ok7aRw6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 11:35:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170895

On Tue, 2022-09-20 at 13:20 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> I created an issue in openssl about this:
>=20
> https://github.com/openssl/openssl/issues/19242
>=20
> Then I have the openssl patches in:
>=20
> https://github.com/openssl/openssl/compare/master...mikkorapeli-linaro:op=
enssl:relative_paths
>=20
> The feedback so far is cold in upstream. Yes, the patches are a bit
> ugly too, but IMO so are the original code paths in openssl.
> I'll follow-up on openssl side if there is anything that could be
> improved. Comments and more feedback is welcome.
>=20
> So what should we do now on oe side? python3-cryptography is
> completely broken and users really need to export at least
>=20
> export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
>=20
> or apply https://github.com/openssl/openssl/commit/a10a6c298878cf438cc8c1=
3f5878d97f476eb0d0
> to openssl-native.
> But that still leaves config files, engines and certificate paths broken.

Are there any other ways we could patch the code? Some ideas offhand
are:

a)=C2=A0the paths could be relative to the main library location?

b) the paths could have a token in them with is replaced with the
library path (a bit like $ORIGIN in RPATH)?

That might be more acceptable to upstream and be a bit less invasive?

Cheers,

Richard



