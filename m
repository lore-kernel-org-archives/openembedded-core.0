Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAD7C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:13:03 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.98439.1738613574689697491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c6Dox7r2;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b7041273ddso429163985a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738613574; x=1739218374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KVk8z/1oi+UVIC7Ylymllkn/U4sBc3FRgJ9AB60Zes=;
        b=c6Dox7r2Qlhm/qA6ciitzOqvGDzVGcgL0kS17c99Vgk/YCl4fdVc2D3Y/QOG7tjPpA
         +HXYJbEP91cD93oYiLyjVDAqOqtj5rtkdPcS87//tCp4RLPyHmz36tMHAUMoGJfhmFlV
         rVwE9c3JCAaISdvNb0r8Tf20+9ZEe1MIGjpoLTzjnEyVzxquM3CZ1fKCQSqqVbdEWTbA
         Vn1nbaLwS79Xh+iAn/7U70sGTtSjj2ldv0UgQoFoOv+ltTUWTPLN25tEWYOsz776yEgE
         uhxSDRly4ItccsI05QZgR1nN6+uZQ7/YUjtxMZquZ5OXT5kJfeVY+ZVm2ZAm/rEfeyKp
         bvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613574; x=1739218374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KVk8z/1oi+UVIC7Ylymllkn/U4sBc3FRgJ9AB60Zes=;
        b=IX+hSEkW907p1StfsPmC5hV02YeuOlTuAL/3tE5XybBdNjbOgJVEhmOV1ZQI8xmlwx
         3f40eaO3WcXatr9hxsigLshSgd+ysSzxgHyjbXALNRht3cwD+tEHyC+thUsLwtoZt5hb
         olI0uNnqJ2oZ9qsl/gny/WmuX1LbnGr5xnGjw+0IElyMTb6n+UA1Kl/h1hY9kcUBlb12
         ITmBdcGMGxUdwnpzQASwi0Hkv2CIAxy3P+OlssverXLN7kIqTLZNYkBvXaNo784S2YFI
         z/9wnZC3OG58J7vkDhAD4UB3OK6Aqwfn7+lBiuCyJ6Hm97C7cnv0X18NmE0AwWtPf4C8
         4HYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGYIFbRkDkJgQdw0f9RRYCzUX2RSqwGjR8widMl99dt2hq0yU373vEN2lb31lnDrN8Hf3ju7KwwsB5quBmFDKHmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/umBZ1tT3syT0UF/EwJ1aSVrQ9btTOrg8XE8VOqKw/xAy3lnr
	WqhzLvfstgWB1xcOozDlzl9ViE2SJ8aQIwXQ8PSY4eaK09HzaeFt4QKqZC0CF4F8Qr61midsr7+
	paafCCkXTUGI3QQ0NltnkDCUtvn8=
X-Gm-Gg: ASbGncvKY076omCh+Wnj9K78LRmWUg7rOQCM9cFmszgiEUB0mY46Un9aOAD9VRyXnoX
	5yiaiDc129JMm5xHmbhuJ/Xs9D1WBeol11wpi5z30uSRPuUQW8jdIkyo5q2dy9Wfvew11JloHbQ
	MiIY2mw+l/Odv0++tW5yC8xYBmA+GR8nI=
X-Google-Smtp-Source: AGHT+IG3tby4vQl8LQErxldPCekT7r2QOC1XVt3vdZ9y4HG4JLui7IlukkF3ec94if/8ByGFLGKNsqG44NkjKF9l6lA=
X-Received: by 2002:a05:6214:1c47:b0:6d8:96a6:ec31 with SMTP id
 6a1803df08f44-6e243c949cdmr357247916d6.35.1738613570668; Mon, 03 Feb 2025
 12:12:50 -0800 (PST)
MIME-Version: 1.0
References: <01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com>
 <cfabe20bdd59186d8e4987ad4446493322dadb1c.camel@posteo.net>
In-Reply-To: <cfabe20bdd59186d8e4987ad4446493322dadb1c.camel@posteo.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 21:12:39 +0100
X-Gm-Features: AWEUYZmCEtcnPoe1f6n9Ux0N-GHlZQPWXwNBeoxCKVcq4w39QjnEOrRlv2Qf8k8
Message-ID: <CANNYZj8XCuKWDytbAjHS+eJxE3Gwm_2op-ozCdWLGe-NyDbUkg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] libadwaita: upgrading to 1.6.4 FAILED
To: simone.p.weiss@posteo.com
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 20:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210735

On Mon, 3 Feb 2025 at 21:06, Simone Wei=C3=9F via lists.openembedded.org
<simone.p.weiss=3Dposteo.com@lists.openembedded.org> wrote:
> Hi, looked into the compile issue, it is coming down to this issue
>
> | Program sassc found: NO
>
> Which now occurs because in [1] the handling wrt to pre build artifacts
> changes. One could fix this issue by depending on sassc, which is in
> meta-oe only though. I want to ask to move it if ok.

Yes, I guess we have to do it even if the only libadwaita consumer in
core is epiphany.

Alex

