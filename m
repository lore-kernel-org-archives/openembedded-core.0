Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE85EE7FF2
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:10:17 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.38347.1694178615891659982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0HMaQnYk;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a64619d8fbso256274466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694178614; x=1694783414; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RWAFUYGxGCJQeIyIdMiruRo6x6fcvMudVdbwne/cW0=;
        b=0HMaQnYkwBMgtu2eSVt9gX8lDsKPgLzUlbQiVXQiQbIb+3mqamUEpzxuADA70fanV5
         vPKevMU/T56rBtwmWMNgTFLSsxC4fSALwi0UtSUmPAbH/C9+9BsoRnjVRCGGaf2NIAzl
         yilJ09WKxDWwjn4WMScoUcT/MQzrmJG6faExihwae7uiqEJWCvqEbejh7GfnuGb2rgCc
         5PZ5zbH8zJ8+HAk0DZss64xn59XqVbl4ninKV7ydbyC+hGffGSKhEYo41qdiaqmXPWvk
         iZeWV2W147CUG1K5Smw8d4mIxEFUPTWh64Dgw1cfYgZqnwzuOxwf8079Eg1E3/EF2COM
         zjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694178614; x=1694783414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RWAFUYGxGCJQeIyIdMiruRo6x6fcvMudVdbwne/cW0=;
        b=g2bgGdEwQo7/9YT4C6Dh6cuk7hIPsVRTkE6W41k/I1EDF3SB9VelqAPzqGjjAeI9N+
         X6LajzcG6tE6KH1J4qQh5TFZDaWu3aXs9Ez5wvtw9MK/3O4i1v5KheZJsUH8ts5n5Evg
         JXmRsSX4dQU06V0E8nSz2X8RZb1LRxv8xs2xa31uc3rUO5XUgq5OT6u9I4s3G78EcnYb
         eA+3ijZONjUQ7sriacs5fl4Dk1ajzUKfM85C4AXfT4+IA/r5yYnHYxwm4nvKjxMlLlfc
         rEAb13K5ima2toLyWEx6f0lh9z6A8jCAqwd8bxHsZb2bMeKlJAh3AEH1k88cBpdHndjO
         Ne3w==
X-Gm-Message-State: AOJu0YzV93z1kcdiLta7iEou4OpXf2dtTd79DrEHnvXDRv1YpTMDPnhV
	2aww93OaOhjnPpQJTeJAZzUNbWP9L7L/x4985Ic1yjoYTzcjYKOJ+4k=
X-Google-Smtp-Source: AGHT+IHMtqy7jIZBkoBp81HgLLMCrOB/SfczKil5tLOzR/wfzs6s1qZN+SWpA6PacH/5sb9BxA5EQA3C5gVPNAiRhAA=
X-Received: by 2002:a17:906:da:b0:9a1:f871:8a5f with SMTP id
 26-20020a17090600da00b009a1f8718a5fmr1857764eji.32.1694178613923; Fri, 08 Sep
 2023 06:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <14699.1693203621642809477@lists.openembedded.org> <3255.1694145092474921956@lists.openembedded.org>
In-Reply-To: <3255.1694145092474921956@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Sep 2023 03:10:00 -1000
Message-ID: <CAOSpxdZFyTRsDjsiCg31snpqns7i2-Biq3oPGA6o4tFS5FY+Rg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] Qemu: Resolve undefined reference
 issue in CVE-2023-2861
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187418

On Thu, Sep 7, 2023 at 5:51=E2=80=AFPM Siddharth via lists.openembedded.org
<sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
>
> Hi Team,
>
> Any updates for this patch?

The patch was accepted and is now in the kirkstone branch:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D074ad15e1e3400=
7997e58892daf759c8d6d9abff

Steve

> Regards,
> Siddharth
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187399): https://lists.openembedded.org/g/openembedde=
d-core/message/187399
> Mute This Topic: https://lists.openembedded.org/mt/100951881/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

