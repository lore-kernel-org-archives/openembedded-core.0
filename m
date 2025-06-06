Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC66C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 09:22:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.29566.1749201761161022325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 02:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZbMAcs1V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cfb79177so10032765e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749201759; x=1749806559; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXbjMr5A3IFluPLuIqEeS3uL/XGkGEBiIBEsPjuznPw=;
        b=ZbMAcs1Vhd+RP4KNIbb3hiPU/bQrB4MnYktGCpGu5E4IwEAe+tp4G4mSbC60K5lC0c
         yT4mvBSmyLBdR/8NT7ALtIyWMvGVcKBubpizQhFGdAYEMm82Vnn+z0mbCeIUW620apdx
         LSHGWj46IJQNj3QTpSTyk8LZu1N8U4nSYJ238=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201759; x=1749806559;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXbjMr5A3IFluPLuIqEeS3uL/XGkGEBiIBEsPjuznPw=;
        b=jRF3L/rdO04Q+YaFqNQZspkNkaxDpa44fv9LpxHlFxz/2cc94xUTPmj7kLcsJip8jL
         FLiKhLrVV2TfbXBosYB0E/kmAIeDE/s5fq6OO+Q1SA356QT+F4YuzM+6K/4N2cRl7BRh
         im+bWK+gw/1PcF0yxXS0QIsXw9trbkTYuZiNidvfduDPXQiqVdlidrtglsCnjkbdoadH
         gLlF6sfmuFnZomWndr7u3VbfOBT2oOfAZ8gXWXkP6JLpJe6OMajhm6n1jD3NtFjhs9k1
         MaGCn43u0qlifQzTc7nUp+DimK1AfZw11yMxX3ID3JA9+9QiRTay0IwUeTrmQQp0AdbD
         /3oQ==
X-Gm-Message-State: AOJu0YzD9KMu8/raBymbUTkVZlUMQUc9zpjIoX/k2J4CAWagMAHdOKp0
	N/A7npzQcEpXtKmZEaYXjs1ng2p6OYeK/aRJNYhMFCaCP5Y6CZFEjJn00y4Jjz3jGXo=
X-Gm-Gg: ASbGncshGHWAFlKiUGukJVIrR4bkibIZpKJYeZfCFbABacc1qFdx5Jo/umG04DHTz3I
	J9Wx9fWQmtJ9hHo58dNS1ZpIXpcNTHD1wm9HNSwpM3vhUMUbTc+rHwcYagoI3h/pXNjnySbgOcH
	kJl7pQnRTPUDF8xkh9Z85qWG5mrB0dYXkl3gtRv7mbPs7Ifs7E+DD3L3s7ll7HNj5RbzylRdge2
	yhakKIXhWuvT8P4FXETiryOvZSwpeY6IPNGgo5B2/NvPbn2j2ON1flVHeVl64MvBTh6obwyULHW
	xe6VOcqA0o5o9NQtLuoGQBmturXNaz2qV5iT9PWBdTOuhjQSYuJzrDDoORRqME6qq5OdscnMKrs
	jYDqegNV0KjtfbNVO1r0ad0GE7xRbuaJmjDumzYN7a3ojT+h2kj4c1jJDDoQ1BQ==
X-Google-Smtp-Source: AGHT+IH4oPq0sBp6NJoz77p4ndD0vN5WS5CttyWdYIBu63gRYkZFDyhmf4esVv0kG/d5t6U7CL5a9w==
X-Received: by 2002:a05:600c:8b70:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-452013fd8ddmr28580145e9.2.1749201759530;
        Fri, 06 Jun 2025 02:22:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a81:c19b:a61f:3f66? ([2001:8b0:aba:5f3c:4a81:c19b:a61f:3f66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229ddebsm1321505f8f.17.2025.06.06.02.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:22:38 -0700 (PDT)
Message-ID: <99ec7d72b0b0d261f28eb0d3ec65efd534f92eb4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/sshcontrol: Handle empty reads
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 06 Jun 2025 10:22:38 +0100
In-Reply-To: <CANNYZj_DTmUJtee2rVJosgvhy0B0Z6QZ3kp2_WXajryWq76Q8g@mail.gmail.com>
References: <20250125113326.2475346-1-richard.purdie@linuxfoundation.org>
	 <1846407BE2F847FF.10724@lists.openembedded.org>
	 <CANNYZj_DTmUJtee2rVJosgvhy0B0Z6QZ3kp2_WXajryWq76Q8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218124

On Fri, 2025-06-06 at 11:00 +0200, Alexander Kanavin wrote:
> On Thu, 5 Jun 2025 at 22:46, Alexander Kanavin via
> lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > This badly regresses selftest execution times when a a selftest is
> > issuing many commands over ssh on a target image. I've been
> > wondering
> > why e.g. devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_none_qemu
> > takes almost an hour to complete (on fully populated sstate), and
> > noticed that every qemu.run() call takes 300 seconds to return from
> > (which means the loop exits on timeout, and not on the intended
> > poll()-based code path added above), even if the target command
> > itself
> > instantly finishes. Reverting the commit confirms this, the test
> > time
> > goes down to 12 minutes :-(
>=20
> I sent a patch for this. It's not a revert :)

Well spotted, thanks!

Cheers,

Richard

