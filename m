Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB37EC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:20:59 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.3005.1742372454803945110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRqfELsw;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso2876949eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372454; x=1742977254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BET3KbG37miExkCk7FjpWkSrA9CHTpLzjrd32u6+GrQ=;
        b=jRqfELswWPKmoVMHf8f07ODB18LlSWJuWWAsXtxBoXLnJVkSoPBmD7tSAnGec582y4
         4OYhowihrfkaTBLoSjbEGsjDDriQnEjc9iePDWcmPRJH91gW7wSix0HniPo3BjMdMrtQ
         KumEZJckm7+x5aja/ZI6A5EIDZIBkxdtvuzboWkEmJa6zgFr+w/TWchMMQ1PEsWzLwyg
         Zv7uUj1nLp1+bqF9D/9X8u3sssM7sH5/Hvw8zG5WECVEKmxP3UDWFhDcfozC2I44VrpO
         F+LvoU9nhnOSCak8R+TmynOwZmHe0WpHaZhgoym7R3Xg5IvH50B9+G5TGbYgxDLZbhmP
         RnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372454; x=1742977254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BET3KbG37miExkCk7FjpWkSrA9CHTpLzjrd32u6+GrQ=;
        b=o1X65/TGvyrzyIRKDWMePTHk31baK8EXxwk6Ops91xWJjj7+IFWj6Y8MlvRkZSUlDF
         YLKN6Juz03KM4U2fNVDwqJwFTc/JpZ3leuoktR6QxJAdacxVp4bNEnwXXV4s0UC28Kip
         p3uWv/FIrcYnDTWVnkvK6DFo6irDDhWAlASVGGmHPVgDN7RKMpzo2rjsM+QoKhAiHDF8
         S8TFyyvg75tl7asBe1liOvea18vUJc72IkvUhBUMr1u2rmJgSl8+yOB+znCC6ETS/PZ/
         YS1jdfeIz6m9nCkxq8YnSmwx10fuM7ozJDM1Z1OwSDa3Zxis7Ws7SmcnVsNaTaLagiiv
         VwZA==
X-Gm-Message-State: AOJu0Yx2OYY804dUvqMcB6xyHn0u4lvOvz4pjJWYP0jvsaOssUJtssHL
	9N+CUQDieYfx0N0bye0DDM99jC7m1SBqPX1UNMwIlrOM9oa7uLxEEtIIfTajP2dJYyCj3EdLt1c
	bWnMmzUOkyynMirPPFlioa4p76kY=
X-Gm-Gg: ASbGnctmEnFCbR4JQB7XRlxVgpQvHMDv2t5Bc6Dhrr+StnLXa78N8Ja4NB+K2CAKiFM
	msRCSos8pFkPviTH9rJuxVlozb3LseYymlFBelXtB0qOET1LtuM6/pLX3Svgb27K1MNyT3nU9it
	EhrV2cIEbXE4owRqYENftFhttH
X-Google-Smtp-Source: AGHT+IFuqmJM9W9nAsQMu0CNE42oENCf7TLN1X/p9OWdKGu+hXL6tf607QOnPV3TM7V8mMMT3yZSLE1ec/4UXS6hpNI=
X-Received: by 2002:a05:6808:3a08:b0:3fa:d6d4:8160 with SMTP id
 5614622812f47-3fead586902mr1206305b6e.10.1742372453801; Wed, 19 Mar 2025
 01:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-22-raj.khem@gmail.com>
 <D8JF2MJGLSWW.AS5SZX5T0EB@bootlin.com>
In-Reply-To: <D8JF2MJGLSWW.AS5SZX5T0EB@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 01:20:28 -0700
X-Gm-Features: AQ5f1Jo3rubLhmhr2ezTOtwWnjXas8P2eWb5MF-ikfcW9m8M8eOUX1Zq3qmevr4
Message-ID: <CAMKF1sq6VtJ7dPd4jibWNXQUmgHQaZROfQ19Z2i7GCspoK8ukw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/24] time: Fix build with GCC 15
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213309

On Tue, Mar 18, 2025 at 6:12=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Mar 18, 2025 at 5:38 AM CET, Khem Raj via lists.openembedded.org w=
rote:
> > Initialize interrupt_signal and quit_signal with correct type
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Thanks for your patch.
>
> It looks like this is breaking the build, maybe just for musl:
>
> ERROR: time-1.9-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/=
musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/time/1.9/temp/ru=
n.do_compile.3718025' failed with exit code 1
> ...
> | ../time-1.9/src/time.c:731:3: error: unknown type name '__sighandler_t'=
; did you mean 'sighandler_t'?
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1215
>
> Can you have a look at this build failure please?

musl found that upstream fix is not complete, I have fixed the fallout
and sent upstream as well as its included in V3 series here.

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

