Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69E1C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:44:57 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.1940.1743576296425649974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuDQO2ub;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f05acc13so70504066d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743576295; x=1744181095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNJmwkrOmurUxrryg6R2s/S2y7ME5VnA7R3mw4RW+Tg=;
        b=cuDQO2ub9bv757mh2LRmPBgVMVrNBn3PU5nNC65yKjSoxk6ARJOjX0BgSZU1jj8pl5
         la2A2bXiL6Rnzqjev3NdX9s0lVInqXn+wJTe7U38FKnAznkDmxnz94salQIpF+cX9cae
         dCRYuQknlaxMBP8XaakAggthYN8O2zzHtmUCF8cWz6cv2dCPatmM7rAWmZJiBZjRC5o4
         pCOW/vGbJHG52LsyNTGck64DMIIgaRoGwvde680mvzr3eFRrXk48ISaqzP8/BqdFT52o
         VS0r9I7RKhdBRbnpf50hWzXCLlsW0fA5EoYkG5zeLEAQpmg2SFNRXne/1RBaFeBSsJKR
         Nd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743576295; x=1744181095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNJmwkrOmurUxrryg6R2s/S2y7ME5VnA7R3mw4RW+Tg=;
        b=iUJ68FYqgOhh6Po1nMAprZu4szjHtyFMP99oe2eD7ChfDyaseY1LZwKdFtceGbDPgw
         pyKyv6cPMTLZwfh/dAmcHXsJAw2Q9hwoamjMvPIKD1bCKzlz8X1vFtckQVaZ5Kq+Aryn
         h0kbvOmN2DtYUI0c0dlZWTUCKcXG0z6Pe82f1m0T8jSHsh5xX3HIJ1d2/azP5og4TgMw
         OWRAns55uFxPCKbREC5hOUp27XJd3DUJgz/opL5CN9Z+2me/ylwZTfTiTNO4KQ9sxmYq
         HuwFlRvvbVqhPFgvycfFv4qBl+ahMa9YJAjm8uyluh4asRMgqL71SjXzyx40+1zH/0/q
         AsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUQLcmw6DfPo+FwkZCzc+ZJ0M+LqUu4rGAF82cCjCt6cJx3FW0ezsmKR5NwQlT9MYtfjVShOrHZP5v0Lo1JVdW3fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIG7Ly92f3mrWJqSERnUZZ08mlnH8XSMPdomnCpp8154XZ24bM
	E4nNxe3NNCjXHCaKrnVwZUctE4gPrceHK4GvSlHCi4Xc5WSmIAu78K/mgji+uMYdhejo0Px7JgJ
	piFPBNW8RxVw9TNAzzc2hWvDyniQ=
X-Gm-Gg: ASbGncvL++L+0ofSY8vtZ3Pp/nMj/xfJKvK/oqURZyI9hxMMu5FG3zRW2dfDGq6bYgy
	kmGziqnYY1Ws8Ja0Ydkv8eYnqtGfBcDtp1GiKVbJgRr4mN5nmoFweB7/GMxaWqRApkK+WwHrR4i
	3tfZDFSKXFiACoLgDmkuwtAmSmQdHdviNAsZhLt5b/Dp7oKhJTkOe2E4rF5W1C
X-Google-Smtp-Source: AGHT+IFZHp9LpYPz3Cvk4ri5X/hLwFyBYUYhtJEesweXb0Hq6UozV7mfpHKjYjaopb60r8GKxeRkuZznN44UR4KAzkA=
X-Received: by 2002:a05:6214:268e:b0:6e8:fa38:46aa with SMTP id
 6a1803df08f44-6eed6271805mr244248616d6.33.1743576295366; Tue, 01 Apr 2025
 23:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250331064844.2155-1-leimaohui@fujitsu.com> <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
 <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com> <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
 <18325E1AAD0415AA.16050@lists.openembedded.org> <TY3PR01MB110569F4DAA67465F79B56CA7A0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB110569F4DAA67465F79B56CA7A0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Apr 2025 08:44:43 +0200
X-Gm-Features: AQ5f1JqDySDovZmfBklDBOuEb404-vVDXHPbr1OHH44qIauketERs1he9UAhPhw
Message-ID: <CANNYZj8pYxR+HNhV_XZRWiVpj9-DtGHO20yQ54u-PjpsVwqJFg@mail.gmail.com>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 -> 1.26.0
To: leimaohui@fujitsu.com
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	Jose Quaresma <quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 06:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214171

On Wed, 2 Apr 2025 at 05:01, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:

> I have created a issue in upstream
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4338
>
> I also noticed similar issue in other communities, hope this will help
> https://github.com/NixOS/nix/pull/3114/files
> https://github.com/matthewbauer/nix/commit/74b4737d8f0e1922ef5314a158271acf81cd79f8

You can see from these links that the fix is to add '-latomic' to
linker flags. And indeed, this fixes the issue, until upstream adds
auto-detection:

# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4177
# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4338
LDFLAGS:append:armv5 = " -latomic"

Alex

