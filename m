Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73F4E65D2F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 07:54:14 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.19552.1732262050654216495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 23:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsitxfMm;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa678ddd2so4703601fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732262049; x=1732866849; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxzHX4PeV3CFxxdR0UPhO5GsLKKeTym2kieB5ij+t2o=;
        b=OsitxfMmE1O4/NU8R/GxB60resGybfA2ffpUpnHMz7gTqM4NniNN6Dfm7pFmgb30XG
         7wtTZnsA88dGQTr+fTZd3u52m9niWMg6GHpzC/D7w2FeX1yfjg3Es6aPNsec9odXGrfU
         ZqynR2TZw+kkiAgq8/0BBjlpkl0dDQB1l+1DheK4SVhHMGwLAKZsr0DQx2mo9CMZWeaw
         6UyY4nHJWE2JolnuHqJtjDiW3HsgASllHJ+n6tUQcIrsrPegx5ZGtv6j2BmHj+CFMlKq
         F2INlP5nr2+hx3YTzrii+kh9kU4g5FgWwyjYhLOaBhYE3BWQ/FEEhIqkX9mq8vme+cTw
         OnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262049; x=1732866849;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxzHX4PeV3CFxxdR0UPhO5GsLKKeTym2kieB5ij+t2o=;
        b=w0FJRf4+NgcMxTjxGlDoGpmiviAkmZLVegTwaf6HElezbAATgUPIOp8LEqRGBOUX5z
         AYQeMJRcFo/CcZhS+x6iJIHFTTRYGZn/ze3KcBbnwYKDjrQmYHjwcchOQ2qImuNbuVeb
         slMiIcGb82TXvnEPKLAbEJXd7uFJPD0jLxTY7p1l2VyDNIL1IPoqfvuwWetF1Kc0Sk9Y
         fy6i4G0ZuH96tk2UmRrkyMHNj++AnkhwxAuO/TwJYiLEC0QP5BT2PLwDAAJa1IdhciIf
         sOaOZFGzVizwX9EOWPfFUjV/ZF9ToYE7yt6+1Ct15R2Z66y6lEdB+B47KR3c9Ewi3xdu
         DwJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfMHT9+2q5q2dh/7HqmLu/tNhjg72L460cDyNt9C737kckWFgihaSceq+4qdd3j0c7uPmI2EKfpxQSbf8j0+R1pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNPXQPCT+fzf35P/GIBeP8hIKaZ9cCV0RGgyBjEtF5HsoHKB0c
	7d1miKBUbwZyROCZB/87Vz5yZ7xM27VhCbdiyjtNzk8SucyM7wAygTurPdWyMJKJJJSqlSY0VCM
	BBmFhiB6fdJ0qbE+30eCj122jAHk=
X-Gm-Gg: ASbGncsKYJL/4RIbtwgSPvPxQkF8B5JPG+ThE7QHQQKpPNNAiobuAkS2qhIet0Y6jq0
	QsRMHBAY93nDInNlq9es4WryYXmbEG2n8aQ==
X-Google-Smtp-Source: AGHT+IGuJzYm+s6atKw7MA8OF/QtOv4v9GBm2W/rU8wUHc3JCxtjIrfyeD4NPlRcAZq1BJ9VNO8i+Lm3ZmlyRb1bqW8=
X-Received: by 2002:a05:651c:1546:b0:2fa:c9ad:3d36 with SMTP id
 38308e7fff4ca-2ffa710036bmr6987061fa.7.1732262048517; Thu, 21 Nov 2024
 23:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20241120183528.2560-1-f_l_k@t-online.de> <Z0A0N7JzXivpU5qL@bootlin-mathieu>
In-Reply-To: <Z0A0N7JzXivpU5qL@bootlin-mathieu>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Nov 2024 08:53:57 +0100
Message-ID: <CA+chaQc5HuE4upyMTvxd6ZGYH+EhO68saiH7vzVvS1XxHcJRAA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] libsecret: add pam support depending on DISTRO_FEATURES
To: mathieu.dubois-briand@bootlin.com, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207592

On Fri, Nov 22, 2024 at 8:35=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Wed, Nov 20, 2024 at 07:35:28PM +0100, Markus Volk wrote:
> > pam module has been ported from gnome-keyring to libsecret
> > [https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afe=
b647d9f82b6ef1cd0893]
> >
> > Add a PACKAGECONFIG for pam and enable it if pam is in
> > DISTRO_FEATURES
> >
> > Add a patch that disables the pam test, because it would require
> > pam_wrapper recipe
> >
> > [https://gitlab.com/cwrap/pam_wrapper]
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
> Hi Markus,
>
> > +Upstream-Status Inappropriate [oe-specific]

It's the missing colon after Upstream-Status.

> Still speaking of this Upstream-Status, I do get some error on the
> autobuilder:
>
> ERROR: libsecret-0.21.4-r0 do_patch: QA Issue: Malformed Upstream-Status =
in patch
> /srv/pokybuild/yocto-worker/no-x11/build/meta/recipes-gnome/libsecret/lib=
secret/0001-pam-disable-tests.patch
> Please correct according to https://docs.yoctoproject.org/contributor-gui=
de/recipe-style-guide.html#patch-upstream-status :
> Upstream-Status Inappropriate [oe-specific] [patch-status]
> ERROR: libsecret-0.21.4-r0 do_patch: Fatal QA errors were found, failing =
task.
>
> https://valkyrie.yoctoproject.org/#/builders/25/builds/497/steps/11/logs/=
stdio
>
> Can you check this, please ?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207591): https://lists.openembedded.org/g/openembedde=
d-core/message/207591
> Mute This Topic: https://lists.openembedded.org/mt/109689748/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

