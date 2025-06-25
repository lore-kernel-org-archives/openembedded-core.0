Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25B9C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 15:27:30 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.18256.1750865245369337578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 08:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=StTmUdTc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-712be7e034cso154367b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750865244; x=1751470044; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkzPGaiuWtyGH27VRFbFF5k139857KnXa7ZXqVgOaHg=;
        b=StTmUdTcsgXfMY+heLUa4terb/9RdjdwFdHKd7IVYpEXRJOQNgZWKyj/ECFI+RSane
         +WxOkEz3kks/GPAvKMGur/vM8nR2rWjBfknQVaQwzS0bmZACAZWnyY3KmprfB5sx5lS/
         ouPUGCJWdjYUd5pyIhX/9XMDGuJ5pCtM0ThpMsnyj7NMmFZGPlNPvXwm1aDBPyCY7Yt7
         panlcdJ+t5UeDVcSzt7BFNMiwragZAGomGQdYf/k2xylJPQfhYb4DkuPZK92Vry8jqeB
         uwADka/LGMO2ueEYfaDRShDeAuh/mriHlK1TrTki57K1v3PNo1hje2/1PmIGalm/cc7P
         F6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865244; x=1751470044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkzPGaiuWtyGH27VRFbFF5k139857KnXa7ZXqVgOaHg=;
        b=IAJXeH4huH4RPjlIUn7I/y2fg7VkERD3KkWy0xGvqzKoJngF2k9GMAC+oOBorulN10
         vhxpC+WygBwGvvoV6xza3l+hDamng9WrGZKqzlGf5xGCKP4wp9QfUxABdyYr6lQxoiSF
         8FBzF01dP89OScDrbH+69Gqr6buC+pY6kB8WlGkAmWI+lxqUCGps7uDe9eoG8F+tkEfC
         +pgM8cvTz1sVFobECsSKqKal704ggVDMoOdM9N/QVuQH0XCFnacWAZ38h91MA8nbbucc
         7RAhfD/6QYoCqlvYxK+AJOk1NxZPOq4lZKXxUMcFDlt1IEFFZo0/B9fYHwJTb+HlZDx6
         K5+w==
X-Gm-Message-State: AOJu0YyrOnNn7y47aPHqqc2e2OIu43Alt2/D779mTVRp8bJ8LlyjQ8Dn
	ztuFMQYN4XJi7JIRnZFk533i5Xv3V9irvTM2RbW3Q/AAwoNBjlnmpeoV3EcE6CjmUIM7v2lExBH
	OCgzgp7jP2p5KDAS/EKLyV6dSLd/JBU9FYnanyUtPUg==
X-Gm-Gg: ASbGncuQpXVkTgVjLu8y25Fx2rYis6w4joWV8zgTHBAXx+L0LyUtwzjs+zysxUOBwl9
	5kmGbZJOreilDX6jWKuI2eQIt9fImbZ7z+qgObryKLVDHQQQz6sAcZ5T2WSsZMNNLGuEJa51k+f
	EzX0Y4eXmXDe9B6mSg+ihfn9OzydlDspTZ0mrWXYxTVwr6IsuIBgbMw4y5b2Em2bLHuYt/N8eVY
	5I=
X-Google-Smtp-Source: AGHT+IEjmeBDgVIfXpBDTKillNP1jiwuf1rSgrxVAbxwB5k7rKgBtZl1uEEBT9BsFakq18vsdsJcKfj7ONg0lkBE3/s=
X-Received: by 2002:a05:690c:890:b0:714:268:a9f8 with SMTP id
 00721157ae682-71406dd9542mr48769387b3.27.1750865244183; Wed, 25 Jun 2025
 08:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
 <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com> <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
In-Reply-To: <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 25 Jun 2025 08:27:13 -0700
X-Gm-Features: Ac12FXy8mn2RhhuAdfWUz9Ywrlx9QsfRTD_F8U5W6BnsXPrfkanJ7Hmo4ykuUDo
Message-ID: <CAOSpxdayvq2SLFEcONDG_QFvS6ma29u-oBgHO-3aWDJQczmZ2A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Yocto TSC <tsc@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 15:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219324

On Mon, Jun 23, 2025 at 2:33=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2025-06-19 at 08:23 -0700, Steve Sakoman wrote:
> > Since this is a feature addition the TSC will need to approve it
> > before I can take this backport.
> >
> > I've copied the TSC so they can add this to the agenda for their next
> > meeting.
>
> The TSC discussed this today. The change adds a single data file to
> packagedata based on existing information we already calculate during
> the build so the potential risk and impact on existing users is low.
>
> Whilst this is a feature change, the uses for security and handling
> CVEs are extremely useful so on balance the TSC thinks this can be
> merged.

Unfortunately this patch is causing oe-selftest failures on the
autobuilder, here's a sample log:

https://errors.yoctoproject.org/Errors/Details/862388/

This will need to be addressed before I can merge.

Thanks,

Steve

