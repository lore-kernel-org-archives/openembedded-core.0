Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C65ECAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 14:16:29 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.34914.1759760179690952981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 07:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Kx4cnxtg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.50, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-35acca93e00so2869590fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759760179; x=1760364979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKCT1O8r0N/LM0SVNyKVZa1BO9FqLbEmIVWoJlDGjLk=;
        b=Kx4cnxtgriPoSJPL1i/5L7ynCRbx3mTnyVT6AGtrHi89ZiCr7mwqNYPj+Zo4IEKsls
         g0eypYJz744kBYg5enBTH3zbB3jBV6QSyyLr+r6o7meI1zVfu1P5mMnfhuNT0l5NP/hF
         MzWPYTua9QTEHf5OncUtOKSW8EpmLYoCn/xH3AlVy+KDifdZhr+QcmS42uxlEiFyJkCt
         zNwO7fpfvbQNgWL3bzd5P4g61ySnVEmEHHrqUU1qxhQ7KwrMeF5KEkNafDVwoVeoyOxq
         3vQqUACWKJwIC7gzPl+QTSmoSP5wrtve7HlufsJT7Ed0iM7BwGfBE2gWTzSzuXY+bikT
         xBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760179; x=1760364979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKCT1O8r0N/LM0SVNyKVZa1BO9FqLbEmIVWoJlDGjLk=;
        b=fuxKcNYM/Hx/bSdyAZpmFheuXwTkLA/KBTq3vZU2Z8854cmcqjlLpJ58S46xIyYqL1
         o45nz+W27wVwEpZ2OWHbYJ1qPYf2vrZmRQ43SCxy8RKPxxwYRvg9NkoghBrvdtCWA/VU
         hIhAgAr1/hKwSxeIk+bhRr9tHkquxWVxHUa+JCIZsB3JrNBcGQJSl4hLOyRQN+dOMO/c
         0qBAi8tWHdLMp+KAbfilaAt/isGyfcRA4aa0BFivBMcaDyEGItdRiPsIu4rHCRqc8JBn
         1x9DYm7kw3PmBsVrnbfIjsjBs0RVXP0Mcv/c0OTaSqhAIOIZdgn9pTSpm9DYeUftht4m
         +pow==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8wGt0oVXD7KUVDr+mIqu93vMYzXRefkK8yYfT7NVZhxHrwmxrOJwIYkM+JaZ/v0EFrLqvxpRdQS5DjV8GZITfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZnOjCCSgDwJuNxJKNKveWXPYS9zM8ZCvOFvWwlqq490uXzn3K
	sqY1AlnYzbwfdYnJ66NiERok/1CYD639D+VJqagPoU+UUHxb3+D2E9PUao/75/EJsJuhrZ/YSps
	AtPEALYOkha+KE7H2w4QJODmx3b0jdcSmwO8eM4pN
X-Gm-Gg: ASbGnctWG6Y7fMHjQAQghbJZfXZxdN6FaDBkwMoE0Z56GSSjQ1WSZwawYRpNZfFbpEs
	BGgVLNFp4YyJj8XaOE4/eSpUu1j/F01SYt+wlC7qtRjBkzhSyMlUicEPUdCnNdgXuS1XrBMuJiQ
	TG3bNptC9Wj8MDHdw32stsVpicbSOvlRQTPfxxFmZYrPHiTcRSMn3bZtTbmD/oucj8Ht0hmWsGn
	NpDSgdpaJgeYRnqq8Jue8YhW+D/oq+oNlFQmJNOqro=
X-Google-Smtp-Source: AGHT+IF5fgPlSkjGEvTO/ANDPGiVjoFvdZN2GCHmLbE+HpEMzeEZMILfhx55d9zbipUwwTFV1teipIvU1R3buwKNfOE=
X-Received: by 2002:a05:6870:458e:b0:353:f24:e95a with SMTP id
 586e51a60fabf-3b1039b5507mr5895490fac.42.1759760178642; Mon, 06 Oct 2025
 07:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150837.39814-1-jon.mason@arm.com> <CANNYZj9L9T0t_V80WQTjh8oj79defHEEsj0DDM7_Z2dM266fdg@mail.gmail.com>
In-Reply-To: <CANNYZj9L9T0t_V80WQTjh8oj79defHEEsj0DDM7_Z2dM266fdg@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 6 Oct 2025 10:16:07 -0400
X-Gm-Features: AS18NWCFu8aJGslXumMy7dyVKHnDZ8HVpbZIo1MuachC6_wMyloUeztjvFLp3d4
Message-ID: <CAPoiz9zbqQKHmWROhOkL7xX+Vg+P+LvT0s7g2RfbsmhPuQybQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] runqemu: remove setting of mem on kernel
 command line for certain systems
To: alex.kanavin@gmail.com
Cc: jon.mason@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 14:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224489

On Mon, Oct 6, 2025 at 4:59=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Fri, 3 Oct 2025 at 17:08, Jon Mason via lists.openembedded.org
> <jon.mason=3Darm.com@lists.openembedded.org> wrote:
> >
> > Some emulated hardware will not boot if mem is set on the kernel comman=
d
>
> Please replace 'some' and 'certain' with actual examples, or rewrite
> the commit message to remove these vague-on-purpose words altogether.

Well, this is embarrassing.  Ross made that same comment and I sent
that change out (see Message-ID:
<20251001175702.62563-1-jon.mason@arm.com>,
https://lists.openembedded.org/g/openembedded-core/message/224316),
but I lost that change somehow when making the v2 change.  Let me pull
that one off the lists and do a v3 (with this change and the comment
change of v2).

Sorry and thanks,
Jon

> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224468): https://lists.openembedded.org/g/openembedde=
d-core/message/224468
> Mute This Topic: https://lists.openembedded.org/mt/115571450/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

