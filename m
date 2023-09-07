Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD97EE14D3
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:59:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.8644.1694077170925369391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nb34hfNn;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5007616b756so1150874e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694077169; x=1694681969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTWQ1V+Wqtc38RSMZWolay+1DFFbrKyQ6Z7CASkw1OA=;
        b=nb34hfNnPPX1V5U0pCSR6JAXhQdtIVI/EB6eXYfqb0RGuc4HOvieMa844LHcsC8S5T
         wFVAbBzkKiU+uIeoItWswDh9GO8uC+LkuOm3y1mKXzvwfmT5yfVHhGdIAGBeDUJYVMjR
         /YXm8QU8zUpYBPIKEnvFL27D0YfDtar6Zo/MIJoD/W1wON/oZoRSxgHYmAgRxWVFwxIh
         a9dIBufCGoyg58PwNEJx4NSzRWss88RNtVoC4l+xmzeLNasLEcpzz3v9KU+Fys4rZDMK
         pbkPRpoViiJ9K+4eEaP3nGMfMhJSj51DwMr9oFYy+zKNR2iOJn7qcnlrJGDWoTFYGGTR
         HfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077169; x=1694681969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTWQ1V+Wqtc38RSMZWolay+1DFFbrKyQ6Z7CASkw1OA=;
        b=BBPCMFasWClxL3wmaxuwlQZpaRwKIEz7tmaJ9UkUzReCqBAuirnXoqHnC0ekIAB/Da
         EcZhtPpe8iMzxFXeNgCWxJLwbbWXGm5M3ClbWDwHCOc6su8m7NBGF4bGmphZVakHlIi0
         qhVT9TNgj5qrfWh1YAIP9yij4szg9xPBxRLbPBzQ17Qw3oQJjsW83cdtvAratBlqRFoV
         TbnPs0o4WJIqSEoOe75PYWFz7Do3q0QOn+EVVZQEkHtGLsITIORk4twSyVCQM13hEIlx
         rbVRgMQ10rj/3UhrO/PqxbMv6LWMiIYw1iiS8/ajlXsWtHq9inqoIhEPqsgqFvGgGYAE
         QggA==
X-Gm-Message-State: AOJu0YxK/0raz/+yBwt+UlfkE8aZbNNe4kcCJR0G0k2GIZlSxj2RdZcY
	iWNDlE9VEIonQ61moAebx0KGya8GJ0mtlGxCHmE=
X-Google-Smtp-Source: AGHT+IHlbUzaDgbiLhL3tXrlMa0miHuJ0hZgz6SRZY/4slFuBjXNgoCzSRnBPHTRfQDpivJbTy5YPCXpBttg2V1tyaw=
X-Received: by 2002:a05:6512:4020:b0:4fd:d92e:31ca with SMTP id
 br32-20020a056512402000b004fdd92e31camr5135588lfb.36.1694077168720; Thu, 07
 Sep 2023 01:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org> <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
 <ZOb8dy1yGpNJpJSI@nuoska> <177E3F68E6CB83D4.13053@lists.openembedded.org>
In-Reply-To: <177E3F68E6CB83D4.13053@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Sep 2023 10:59:17 +0200
Message-ID: <CANNYZj-G7pEahwWoAWMhhueUg=iJvynsQts9+cfwQJUVHn6w0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: alex.kanavin@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187367

This patch made it to master-next - please don't. The issue that needs
to be fixed is unhelpful error messages, which should be addressed in
runqemu (I'll make a patch for it).

But the test should continue to fail rather than be skipped (until
it's on a distro where it can't pass, which is only RHEL clones at the
moment). Otherwise skipping the test quietly amounts to disabling it
on newly added autobuilder workers or other instances where selftest
runs, and regressions will follow that.

Alex

On Thu, 24 Aug 2023 at 08:57, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 24 Aug 2023 at 08:45, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > Then this change is not needed at all. Test already fails if render device
> > is not available or if access fails. In my experience very few environments have vgem
> > driver loaded and "render" group permissions for the user running the builds and tests.
>
> check_render_nodes() in runqemu could however be improved to check for
> permissions as well (it currently checks only presence).
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186639): https://lists.openembedded.org/g/openembedded-core/message/186639
> Mute This Topic: https://lists.openembedded.org/mt/100910043/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

