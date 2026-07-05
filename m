Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AFEC43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 09:45:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128967.1783244734546226387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 02:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D2amzh+m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c486f012so7910115e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783244733; x=1783849533; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MV6320e8WJpj6djRmR8AZ8BkSChnYsSI8xVcM8sU2+g=;
        b=D2amzh+mEywJfehd6nR7uwaV4wikNsnvc3xtwMZZ78DXaSrmLVzHsIvF9dIVTsmNBn
         J9/durZfbhRiDnYdYh/kWAJm/axEgc+gS7R7ObwxD0T7MLzkeD+LCjP32bJV/fRO8ojF
         cWbx+My8vyz4CPWcml+jghPfuShsTkgK8ZHTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783244733; x=1783849533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MV6320e8WJpj6djRmR8AZ8BkSChnYsSI8xVcM8sU2+g=;
        b=aim2ACWOdpiP6j8vLyBynvro9DtVf94mCXRH+GmY9hJVUSEUwuHIDFdJM0nOJ1l4xq
         yiRVddHH56sBaMJzRWX7b+IxgWCWfbrWXfat6Ve3MC4fTx8wMTZauHyOJ7KWKW6lhodu
         PdKUEExveA5wKXgKpKRu+BFiy+bS6PSGHqs6vrz6f6AOekKiKP4nVuzcYTOioyeDbGLR
         9+37lej7iXyAupHYr6XMCSs+ZEW7rLRoa7Lr1Am3Zsu3dsY/9WbMX5HIYAx/yKeLWgrP
         JCMVZccYE7GhNGbnn1NCQ49mVNyKYaCCIqClOPLBK3GmSu7FAl/eUM20kogelqP9OYc5
         Ubjw==
X-Forwarded-Encrypted: i=1; AFNElJ9iqWtR32MCdJOiGZQlyj8nKDils3aoAbF9xl8gbuIaObwtOVkGVE783LvXtUzkelFdn3dCKW2+1HE+VFyy1YEyVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywih2qo/CMPm1VA+nS9EHUkUALYPaiKySDKIl5XCPLXpmJvh7HS
	YQCTh/fYh6NhWc4iRSL/y2O57SNlI3LwyTP1gZw18q2oOogotC8RtlVWhzlDV6x+1PU=
X-Gm-Gg: AfdE7cmwbqgKW1Ih1KfUHNmpp1hwiZElDR0h4lJ/XOl8AkRYeXZGFOst20SdTkZ8PjD
	MTrtdisM9dAXjhRBdOzRhVUI84RmCJ2YG47uJGaBaeZOyFUkR9WH++Q5a8UhrnQwy6yZZfqumrt
	ZVPt3FHAusOiBh6GTqXdRA2c0DQ4vPg2ls4dgBPgwlR+ZMspoGwiBennEoUqIXyrjpp6gcaoVxO
	+3OE9+Pr1OW9YZ/LExzKbecR6/QdojwT6tny5w1h25Jax7xenqDXXU6rJhqumpVAfenV2iOLlxW
	Jcs+uVZmXfIY7W5RNqkj7psScFbIfIZNTVSrSwqGOwRWi+GG1g7FgfAbzsw5vMcgcVRDTDMQvhV
	gaEHlt1SwGVJt2uf7WvD+gfzwPgZLbgEUa8lN8e9exP/ILoVHoXJ1rimARADguFQd7al6nj2S5Q
	HR4cTK74hqzz6hRo/xfDbNZvQtJQ5GdV4IRSkHoIIvcEptaN9jMytUZmb51wChmvtDSB33lnISH
	q0=
X-Received: by 2002:a05:600c:2905:b0:493:bd66:3efb with SMTP id 5b1f17b1804b1-493d11f9072mr48934555e9.29.1783244732627;
        Sun, 05 Jul 2026 02:45:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:952e:67c8:1422:6cf? ([2001:8b0:aba:5f3c:952e:67c8:1422:6cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm14659181f8f.12.2026.07.05.02.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 02:45:31 -0700 (PDT)
Message-ID: <d81936f4d8a3bed25ad0bd34e6f2503798906044.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2
 -> 26.1.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 05 Jul 2026 10:45:31 +0100
In-Reply-To: <CANNYZj9mveU24cR_VQky=rTAFze_2gffU22a9WJ_jetLsaxLTA@mail.gmail.com>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
	 <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
	 <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
	 <DJQHRJ8J3RC1.Q0KLD14LY2ZA@bootlin.com>
	 <208d3e13b95e992d4eaf54f8210592c06ce46050.camel@linuxfoundation.org>
	 <CANNYZj9mveU24cR_VQky=rTAFze_2gffU22a9WJ_jetLsaxLTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 09:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240148

On Sun, 2026-07-05 at 10:43 +0200, Alexander Kanavin wrote:
> On Sun, 5 Jul 2026 at 10:32, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > > Just to confirm, we indeed have this error:
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/40=
97
> >=20
> > I've queued my .4 with Alex's patch, thanks.
>=20
> This patch is coming from a big rollup of everything that was
> released in June:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dakanavin/=
package-version-updates
>=20
> This set is now ready, but it has been cooking long enough that
> meanwhile upstreams have released even newer versions, and patches
> were sent for them, so to avoid clutter and duplicates, let's merge
> the newer versions first, then I'll rebase and send. E.g. mesa is
> updated to .3 in my set, but latest is already .4.

I've had this happen to me a couple of times as well, where upstream
release a new point release, obsoleting the thing I was testing.

It is important to get the newer point releases that happen 'fast' as
they often do that for important bug fixes.

We'll work things out but I am keen to try and get us then keep us up
to date.

Cheers,

Richard

