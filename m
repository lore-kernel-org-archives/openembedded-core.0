Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABCAC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:21:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.238.1706282515945102616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 07:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEoOLw8h;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51020e061b5so563738e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706282514; x=1706887314; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yPycil59qNlPHV6T9Ybalr2n7O03stj7WKf7ItXDTC4=;
        b=MEoOLw8h621dYH/3U8lrW2m09I8WxiSExOmqwK9sXqyy70OV2Sm5vr0E+5MgnX+rN3
         jqTHuqZXXp0x342SoNawvzI1JxhW+emYvDa4EyaB6R/cA3MYylwiMwbiX39sZmtAoUcN
         /toIWp3KwhIcvdRlTVen1/FT0BGqKuR9aesNN9D4YXqr8oDgYAjsCU3TICPxvUNYTTeH
         smkNfFKV2tyH0PPZv4XW7vi6zo+SS/uJYfLRKwyJZoPVf7XTe7BOKHNXWjCRlDH9WX8K
         1+DD824nBDld2ooQK0qIQiy8wtN/XHRQr8TI8G0xqNoEys+MZJ63svrsBGjikH1fJzx8
         QgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706282514; x=1706887314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPycil59qNlPHV6T9Ybalr2n7O03stj7WKf7ItXDTC4=;
        b=Rx+4qzmtE+92gIbW2WO9cxJNsLyY+iPr4D2z4TYWvFu+4tBlF/t6RxI3wHJCSQpQsf
         jcmrpmCCR1KPw8goc9dyW9sy4hM7vKQM7f/MiLImwidU1FwQKy5tnwl0zfQXAdAdlEiq
         obvHpksMwVvpraNq7/Vnfeh5arEJaNNtGILusX2hCE8d5s72UE8d0ick64LqfigIpAh4
         5+trPdqI24ZU4VxJa5aQIYsX4A+N+0Mk8JoLoisgwSdyPzWpaQ0fCGvQ1H5AtRi1MPqw
         o69M29GoXxyb1ZtZZY/W5jrZKhxr9pio5ac75a51Xi2ldRkRUr5nZnVzNalBUJgAUMK6
         4bZA==
X-Gm-Message-State: AOJu0Yz23dofkJNsDSW8M/gguFsKyGPOnPYxIpZlwc9ZxooKMIv/2Ta5
	cn+q5+RbF1cTpLKQesfrPbSqpqCcWM0Iynr2kH6+UrF8QfnByzZ4Ndd3d2GSSJFv9s/x3FYARAx
	mohxJPfNCT1VrKZKsXZmJDuM91kI=
X-Google-Smtp-Source: AGHT+IH6PyCTgTlyJ/pAc7secRYLPKm3/MOXhb953MyaCPmDgTJiyGbvaK6HdUM2njm7xfLzSFl0UOBM4N0ECD8igMI=
X-Received: by 2002:ac2:4ecb:0:b0:510:da7:bdbb with SMTP id
 p11-20020ac24ecb000000b005100da7bdbbmr779287lfr.45.1706282513809; Fri, 26 Jan
 2024 07:21:53 -0800 (PST)
MIME-Version: 1.0
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
 <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
 <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com> <7d151635479f421df3e711f39ad99fef71b2f833.camel@infinera.com>
In-Reply-To: <7d151635479f421df3e711f39ad99fef71b2f833.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 16:21:42 +0100
Message-ID: <CANNYZj8kEHJVfpUUP3gh=rEwGe6MO_UsD8mvwe=vTVSSBJ5L3A@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 15:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194391

They're forbidden in selftests as a whole, for other reasons. You can
probably find the reasons out via git blame.

Alex

On Fri, 26 Jan 2024 at 16:14, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> On Fri, 2024-01-26 at 15:55 +0100, Alexander Kanavin wrote:
> > On Fri, 26 Jan 2024 at 15:52, Joakim Tjernlund
> > <Joakim.Tjernlund@infinera.com> wrote:
> > > A thought just occurred to me, these vars(SANITY_TESTED_DISTROS, buildhistory etc.),
> > > do they need to be off in the original machine when building up the SSTATE ?
> > > I figured they just needed to be off for the repro build(in xxxx-st dir) but
> > > now I am not sure any more.
> >
> > Machine is typically understood as MACHINE setting, please do not
> > confuse it with a build from a specific configuration in build/conf/.
> >
> > SANITY_TESTED_DISTROS and buildhistory do not factor in sstate
> > signature calculation, so turning them off and one will not cause
> > cache invalidation and a rebuild.
> >
> > Alex
>
> A bit odd that repro. builds forbids them if they don't factor in sstate
>
>  Jocke

