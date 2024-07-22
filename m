Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E7FC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 20:51:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.29146.1721681514191835073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 13:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YcUHuzNL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso35587905e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 13:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721681512; x=1722286312; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lM+WmybGifgKsAJefHw+RyveLYo1oDYJTkeoZiXr2Rc=;
        b=YcUHuzNL9Gc+BW2WsfOJ1pTMjO+tY6bg9eJqsKiiauhrRfZWGnqGu1fVA0BJLAPUuz
         QEVtrWxgOVx+ODyqsFPis2ePD0ez4uBGBJoChdOPbiGJd230Vit0552VRXD/NufNTV++
         3gO7t9ZCXEmRfo98yv47dXDVn6a4J/i/q9mLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721681512; x=1722286312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lM+WmybGifgKsAJefHw+RyveLYo1oDYJTkeoZiXr2Rc=;
        b=neb6PZi8WJ9W1+RiQjMXFAviUAPZ17OdWtVIi0JKFsVVPpIY10QESGL8RmI+xVi2rr
         rJ8YWYYhChNhh7Z5yAWBJRBW+89XBe6Bfb/b2aGz8gLGPYw00mwYtY+nnJ2v2W4dBTUN
         4HcZdEhzFdR0HPQnJWX4gWF/iiW7hsv52qakP7sCMBcnO4guwl764zo4Gtb5eMfTurFY
         Gfq8wsOhZLqJJsxd5a/m74iLZlv8zuoTA3oW4v2cq8meAP0Icw+0I7hr0e2n15FEJYZx
         zUtps3+cD1HuUx/yk6fR6o5NXR3u/ak9H6rldl3wYaahHo4b5zhBbxE2Oz1E2DYWpe/v
         Y7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5IAgYlgI+e+VLQc7CMVpLqyzUlWUWuq4Lke3hSaWjP1Ko7wa5H8uMO+3gTGzJ1SV0uKSz7vm1Qhhm49hInVwssLw7qxDNFDhV57TkUSmsmoDCy1OU7y2a
X-Gm-Message-State: AOJu0Yy8wlgCckJz9E85qUMigl4JJDxuZUG3HaFZgeTY8epn7++Q/yu7
	S0zmjv1ZsAkzLedUI3n2ThWXh5XIGXlmKDExPDuNH2jRDW1LqLYwYuUIUT22VgM=
X-Google-Smtp-Source: AGHT+IGqXHhn7wbV+L2x54jt6OCTG4UCq7SBCFyoinFTLsjJDpgtADBlo57ueAnQqwtUCrC0WaWluQ==
X-Received: by 2002:a05:600c:19cb:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-427dc565926mr46307275e9.30.1721681512508;
        Mon, 22 Jul 2024 13:51:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2981:be39:a4a4:14a2? ([2001:8b0:aba:5f3c:2981:be39:a4a4:14a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8d8b5sm165984915e9.38.2024.07.22.13.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 13:51:52 -0700 (PDT)
Message-ID: <d938bbd2df1a8138bd8e181e945cd0911f22d03e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org, openembedded-core@lists.openembedded.org
Cc: Oleksandr Hnatiuk <ohnatiuk@cisco.com>, Denys Dmytriyenko
	 <denys@konsulko.com>
Date: Mon, 22 Jul 2024 21:51:51 +0100
In-Reply-To: <20240722053459.2462155-1-denis@denix.org>
References: <20240722053459.2462155-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 20:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202322

On Mon, 2024-07-22 at 01:34 -0400, Denys Dmytriyenko via lists.openembedded=
.org wrote:
> From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
>=20
> Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-c=
anadian.
> This will improve (but not fix) reproducibility of gcc-cross-canadian.
> Also move this code to functions to avoid code duplication.
>=20
> Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> v3 - add common functions to gcc-common.inc instead of gcc-configure-comm=
on.h
>=20
> =C2=A0meta/recipes-devtools/gcc/gcc-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 +++++++++++++++++++
> =C2=A0.../gcc/gcc-configure-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0.../gcc/gcc-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 ++-------------
> =C2=A0meta/recipes-devtools/gcc/gcc-target.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 ++--------------
> =C2=A05 files changed, 26 insertions(+), 28 deletions(-)

I ran a test build with this series and there is still a reproducibility is=
sue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5097

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240722-tr5vb5s=
a/packages/

the key difference appearing to start in gcc-src.

Cheers,

Richard

